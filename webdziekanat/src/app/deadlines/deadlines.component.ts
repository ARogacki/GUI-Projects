import { Component, OnInit } from '@angular/core';
import {ErrorComponent} from '../error/error.component';
import {MatDialog} from '@angular/material/dialog';
import {Student} from '../student/student.model';
import {Semester} from '../semester/semester.model';
import {Subject} from '../subject/subject.model';
import {Lecturer} from '../lecturer/lecturer.model';
import {Page} from '../page/page.model';
import {Deadline} from './deadline.model';

@Component({
  selector: 'app-deadlines',
  templateUrl: './deadlines.component.html',
  styleUrls: ['./deadlines.component.css']
})
export class DeadlinesComponent implements OnInit {
  student: Student;
  page: Page;
  pageDeadlines: Deadline[];

  constructor() { }

  ngOnInit(): void {
    this.student = new Student(223973, 'Adrian', 'Rogacki', 'IFE', 'Computer Science',
      [
        new Semester(4, 30, [
          new Subject('Computer Architecture', 5, 4, [
            new Lecturer('Witold', 'Marańda')
          ]),
          new Subject('Interactive Web Applications', 3, 4.5, [
            new Lecturer('Rafał', 'Kotas')
          ])
        ]),
        new Semester(3, 30, [
          new Subject('Business English For Engineers 2', 2, 5, [
            new Lecturer('Elżbieta', 'Krawczyk')
          ]),
          new Subject('Databases', 6, 5, [
            new Lecturer('Adam', 'Pelikant')
          ])
        ]),
        new Semester(2, 30, [
          new Subject('Business English For Engineers 1', 2, 5, [
            new Lecturer('John', 'Speller')
          ]),
          new Subject('Electrical Circuits and Measurements', 6, 3, [
            new Lecturer('Marek', 'Ossowski')
          ]),
          new Subject('Java Fundamentals', 3, 4, [
            new Lecturer('Bartosz', 'Sakowicz')
          ])
        ]),
        new Semester(1, 30, [
          new Subject('Academic English', 2, 4.5, [
            new Lecturer('Adrianna', 'Kozłowska')
          ]),
          new Subject('Algorithms and Data Structures', 6, 3.5, [
            new Lecturer('Szymon', 'Grabowski')
          ])
        ])
      ]
    );
    this.page = new Page([
        new Deadline('Insurance Payment', '22-11-2020', false),
        new Deadline('Sign-ups for Course', '24-11-2020', false),
        new Deadline('Upcoming Exam Sign-ups', '29-11-2020', false),
        new Deadline('English Contest', '30-11-2020', true),
        new Deadline('Erasmus Payments', '2-12-2020', false),
        new Deadline('GUI Project', '7-12-2020', false),
        new Deadline('Random event in your area', '24-12-2020', true),
        new Deadline('Optional deadline', '3-1-2021', true)
      ],
      2, 0, 6, 8, false, true);
    this.pageDeadlines = this.page.content.slice(this.page.currentPage * this.page.elementsPerPage,
      this.page.elementsPerPage + this.page.currentPage * this.page.elementsPerPage);
  }

  changePage(value: number): void{
    this.page.currentPage += value;
    if (this.page.currentPage === 0){
      this.page.first = true;
    }
    else{
      this.page.first = false;
    }
    if (this.page.currentPage === this.page.totalPages-1){
      this.page.last = true;
    }
    else{
      this.page.last = false;
    }
    this.pageDeadlines = this.page.content.slice(this.page.currentPage * this.page.elementsPerPage,
      this.page.elementsPerPage + this.page.currentPage * this.page.elementsPerPage);
  }

}
