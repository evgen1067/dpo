import { Api } from '@/api/Api';
import credentials from '@/api/credentials.json';

class UniversityApi extends Api {
  static async getUniversities(query) {
    return this.getVk(credentials.university, query);
  }
}

export { UniversityApi };
