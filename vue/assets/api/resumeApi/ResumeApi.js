import { Api } from '@/api/Api';

class ResumeApi extends Api {
  // + публикация резюме
  static async postResume(data) {
    return this.post(`/api/cv/add`, data);
  }

  // + обновить данные резюме
  static async editResume(id, data) {
    return this.post(`/api/cv/${id}/edit`, data);
  }

  // + обновить статус резюме
  static async editResumeStatus(id, data) {
    return this.post(`/api/cv/${id}/status/update`, data);
  }

  // + получить резюме по id
  static async getResume(id) {
    return this.get(`/api/cv/${id}`);
  }

  // + получить список резюме
  static async getResumeList() {
    return this.get(`/api/cv`);
  }
}

export { ResumeApi };
