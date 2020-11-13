import {Component, Inject, OnInit} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialogRef} from '@angular/material/dialog';
import {FormGroup} from '@angular/forms';
import {Student} from '../student/student.model';

@Component({
  selector: 'app-error',
  templateUrl: './error.component.html',
  styleUrls: ['./error.component.css']
})
export class ErrorComponent implements OnInit {
  form: FormGroup;
  value: string;

  constructor(private dialogRef: MatDialogRef<ErrorComponent>,
              @Inject(MAT_DIALOG_DATA) public data: Student) { }

  ngOnInit(): void {
  }
  close(): void{
    this.dialogRef.close();
  }
}
