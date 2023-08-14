import { Api } from '@/api/Api';
import credentials from '@/api/credentials.json';

class CityApi extends Api {
  static async getCities(query) {
    return this.getVk(credentials.city, query);
  }
}

export { CityApi };
