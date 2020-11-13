import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {RouterModule, Routes} from '@angular/router';
import {AppComponent} from '../app.component';
import {WelcomeScreenComponent} from '../welcome-screen/welcome-screen.component';
import {ReportCardComponent} from '../report-card/report-card.component';
import {ContactComponent} from '../contact/contact.component';
import {AdmissionsComponent} from '../admissions/admissions.component';

const routes: Routes = [
  {
    path: 'home',
    component: WelcomeScreenComponent
  },
  {
    path: 'report',
    component: ReportCardComponent
  },
  {
    path: 'contact',
    component: ContactComponent
  },
  {
    path: 'admissions',
    component: AdmissionsComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
