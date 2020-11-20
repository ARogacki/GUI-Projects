import { NgModule } from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {WelcomeScreenComponent} from '../welcome-screen/welcome-screen.component';
import {ReportCardComponent} from '../report-card/report-card.component';
import {ContactComponent} from '../contact/contact.component';
import {AdmissionsComponent} from '../admissions/admissions.component';
import {DeadlinesComponent} from '../deadlines/deadlines.component';

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
  },
  {
    path: 'deadline',
    component: DeadlinesComponent
  },
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
