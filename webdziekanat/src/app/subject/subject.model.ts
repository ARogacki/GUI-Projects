import {Lecturer} from '../lecturer/lecturer.model';

export class Subject{
  id: number;
  name: string;
  ects: number;
  grade: number;
  lecturers: Lecturer[];
  constructor(name: string, ects: number, grade: number, lecturers: Lecturer[]) {
    this.name = name;
    this.ects = ects;
    this.grade = grade;
    this.lecturers = lecturers;
  }
}
