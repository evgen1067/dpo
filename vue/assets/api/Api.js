import fetchJsonp from 'fetch-jsonp';
import axios from 'axios';
import credentials from '@/api/credentials.json';

const config = {
  headers: { 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' },
  timeout: 30000,
};

const access_token = credentials.access_token;

export class Api {
  static async getVk(method, query) {
    let requestUrl = `https://api.vk.com/method/${method}?country_id=1&count=100&q=${query}&access_token=${access_token}&v=5.81`;
    return await fetchJsonp(requestUrl)
      .then(function (response) {
        return response.json();
      })
      .then(function (json) {
        return json.response.items;
      });
  }

  static async post(url, data, configure) {
    return new Promise((resolve, reject) => {
      axios
        .post(url, data, { ...config, ...configure })
        .then(
          response => resolve(response),
          err => {
            reject(err);
          },
        )
        .catch(error => reject(error));
    });
  }

  static async get(url, params) {
    return new Promise((resolve, reject) => {
      axios
        .get(url, { ...config, params })
        .then(
          response => resolve(response.data),
          err => {
            reject(err);
          },
        )
        .catch(error => reject(error));
    });
  }
}
