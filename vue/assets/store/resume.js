import { ResumeApi } from '@/api/resumeApi/ResumeApi';
import { mainKeys, optionallyKeys, resumeConst, options } from './const';

export default {
  actions: {
    async fetchResumeList(ctx) {
      const list = (await ResumeApi.getResumeList()).result;
      ctx.commit('updateResumeList', list);
    },
    async fetchResume(ctx, resumeId = null) {
      let resumeTemplate = JSON.parse(JSON.stringify(resumeConst));

      if (resumeId) {
        const resume = (await ResumeApi.getResume(resumeId)).result;

        if (resume) {
          for (let key in resume) {
            if (mainKeys.includes(key)) {
              resumeTemplate[key].value = resume[key];
            }
            if (key === 'optionally') {
              resumeTemplate.education.optionally = [];
              for (let i = 0; i < resume[key].length; i++) {
                let obj = {};
                for (let optKey in resume[key][i]) {
                  if (optionallyKeys.includes(optKey)) {
                    obj[optKey] = resume[key][i][optKey];
                  }
                }
                let option = JSON.parse(JSON.stringify(options));
                option.institution.value = obj.institution;
                option.faculty.value = obj.faculty;
                option.specialization.value = obj.specialization;
                option.endYear.value = obj.endYear;
                resumeTemplate.education.optionally.push(option);
              }
            }
          }
        } else {
          resumeTemplate = null;
        }
      }

      ctx.commit('updateResume', resumeTemplate);
    },
  },
  mutations: {
    updateResumeList(state, resumeList) {
      state.resumeList = resumeList;
    },
    updateResume(state, resume) {
      state.resume = resume;
    },
  },
  state: {
    resume: {},
    resumeList: [],
  },
  getters: {
    resumeList(state) {
      return state.resumeList;
    },
    resume(state) {
      return state.resume;
    },
  },
  modules: {},
};
