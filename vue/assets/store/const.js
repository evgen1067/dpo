const mainKeys = [
    'profession',
    'city',
    'photo',
    'name',
    'telephone',
    'dateOfBirth',
    'education',
    'salary',
    'skills',
    'about',
    'status',
    'email',
  ],
  optionallyKeys = ['endYear', 'faculty', 'institution', 'specialization'],
  resumeConst = {
    profession: {
      value: '',
      caption: 'Профессия',
    },
    city: {
      value: '',
      caption: 'Город',
    },
    photo: {
      value: '',
      caption: 'Ссылка на фото',
    },
    name: {
      value: '',
      caption: 'ФИО',
    },
    telephone: {
      value: '',
      caption: 'Телефон',
    },
    email: {
      value: '',
      caption: 'Email',
    },
    dateOfBirth: {
      value: '',
      caption: 'Дата рождения',
    },
    education: {
      value: 'average',
      caption: 'Образование',
      optionally: [
        {
          institution: {
            value: '',
            caption: 'Учебное заведение',
          },
          faculty: {
            value: '',
            caption: 'Факультет',
          },
          specialization: {
            value: '',
            caption: 'Специализация',
          },
          endYear: {
            value: '',
            caption: 'Год окончания',
          },
        },
      ],
    },
    salary: {
      value: '',
      caption: 'Желаемая зарплата',
    },
    skills: {
      value: '',
      caption: 'Ключевые навыки',
    },
    about: {
      value: '',
      caption: 'О себе',
    },
    status: {
      value: 'new',
      caption: 'Статус',
    },
  },
  options = {
    institution: {
      value: '',
      caption: 'Учебное заведение',
    },
    faculty: {
      value: '',
      caption: 'Факультет',
    },
    specialization: {
      value: '',
      caption: 'Специализация',
    },
    endYear: {
      value: '',
      caption: 'Год окончания',
    },
  };

export { mainKeys, optionallyKeys, resumeConst, options };
