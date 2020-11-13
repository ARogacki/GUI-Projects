import {Semester} from '../semester/semester.model';

export class Student {
  id: number;
  name: string;
  lastName: string;
  faculty: string;
  programme: string;
  semesters: Semester[];

  constructor(id: number, name: string, lastName: string, faculty: string, programme: string, semesters: Semester[]) {
    this.id = id;
    this.name = name;
    this.lastName = lastName;
    this.faculty = faculty;
    this.programme = programme;
    this.semesters = semesters;
  }
}
