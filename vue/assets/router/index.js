import { createRouter, createWebHashHistory } from 'vue-router';
import { defineComponent } from 'vue';
import MainResume from '@/components/resume/MainResume';
import ResumeList from '@/components/resumeList/ResumeList';
import MainConverter from "@/components/converter/MainConverter";

const routes = [
  {
    path: '/',
    name: 'resume',
    component: defineComponent(ResumeList),
  },
  {
    path: '/convert',
    name: 'convert',
    component: defineComponent(MainConverter),
  },
  {
    path: '/add',
    name: 'new_resume',
    component: defineComponent(MainResume),
  },
  {
    path: '/edit/:id',
    name: 'edit',
    component: defineComponent(MainResume),
    props: true,
  },
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

export default router;
