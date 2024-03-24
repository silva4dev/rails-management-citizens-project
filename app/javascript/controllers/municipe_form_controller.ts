import { Controller } from '@hotwired/stimulus'

export class MunicipeFormController extends Controller {
  static targets = ['cep', 'street', 'district', 'city', 'uf']

  streetTarget: HTMLInputElement
  districtTarget: HTMLInputElement
  cityTarget: HTMLInputElement
  ufTarget: HTMLInputElement
  cepTarget: HTMLInputElement

  connect () {
    this.cepTarget.addEventListener('input', () => {
      this.cepTarget.value = this.cepTarget.value
        .replace(/\D/g, '')
        .slice(0, 8)
        .replace(/^(\d{5})(\d)/, '$1-$2')
    })
  }

  async onCepChange () {
    const cep = this.cepTarget.value
    if (cep.length === 9) {
      const param = cep.replace('-', '')
      try {
        const response = await fetch(`https://viacep.com.br/ws/${param}/json/`)
        const data = await response.json()
        if (!data.erro) {
          this.streetTarget.value = data.logradouro
          this.districtTarget.value = data.bairro
          this.cityTarget.value = data.localidade
          this.ufTarget.value = data.uf
        } else {
          this.streetTarget.value = ''
          this.districtTarget.value = ''
          this.cityTarget.value = ''
          this.ufTarget.value = ''
        }
      } catch (error) {
        console.error('Error fetching data:', error)
      }
    }
  }
}
