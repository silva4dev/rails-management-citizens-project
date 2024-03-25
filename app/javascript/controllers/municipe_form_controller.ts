import IMask from 'imask'
import { Controller } from '@hotwired/stimulus'

export class MunicipeFormController extends Controller {
  static targets = ['cep', 'street', 'district', 'city', 'uf', 'cpf', 'cns', 'phone']

  streetTarget: HTMLInputElement
  districtTarget: HTMLInputElement
  cityTarget: HTMLInputElement
  ufTarget: HTMLInputElement
  cepTarget: HTMLInputElement
  cpfTarget: HTMLInputElement
  cnsTarget: HTMLInputElement
  phoneTarget: HTMLInputElement

  connect () {
    IMask(this.cepTarget, {
      mask: '00000-000'
    })

    IMask(this.cpfTarget, {
      mask: '000.000.000-00'
    })

    IMask(this.cnsTarget, {
      mask: '000000000000000'
    })

    IMask(this.phoneTarget, {
      mask: '+55 (00) 00000-0000'
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
