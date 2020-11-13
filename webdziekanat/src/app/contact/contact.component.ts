import { Component, OnInit } from '@angular/core';
import {ErrorComponent} from '../error/error.component';
import {Student} from '../student/student.model';
import {Semester} from '../semester/semester.model';
import {Subject} from '../subject/subject.model';
import {Lecturer} from '../lecturer/lecturer.model';
import {MatDialog} from '@angular/material/dialog';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.css']
})
export class ContactComponent implements OnInit {
  student: Student;
  constructor(private dialog: MatDialog) { }

  ngOnInit(): void {
    this.student = new Student(223973, 'Adrian', 'Rogacki', 'IFE', 'Computer Science',
      [
        new Semester(5, 30, [
          new Subject('Embedded Systems', 6, null, [
            new Lecturer('Dariusz', 'Makowski')
          ]),
          new Subject('Computer Aided Design', 3, null, [
            new Lecturer('Witold', 'Kubiak')
          ])
        ]),
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
  }

  openDialog(): void{
    const dialogRef = this.dialog.open(ErrorComponent, {
      width: '500px',
      data: this.student
    });
  }
}
