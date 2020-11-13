import {Subject} from '../subject/subject.model';

export class Semester{
  id: number;
  semesterNumber: number;
  subjects: Subject[];
  maxEcts: number;
  constructor(semesterNumber: number, maxEcts: number, subjects: Subject[]) {
    this.semesterNumber = semesterNumber;
    this.maxEcts = maxEcts;
    this.subjects = subjects;
  }
}
