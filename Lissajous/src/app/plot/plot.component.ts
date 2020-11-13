import { Component, OnInit } from '@angular/core';
import {MatSliderChange} from '@angular/material/slider';

@Component({
  selector: 'app-plot',
  templateUrl: './plot.component.html',
  styleUrls: ['./plot.component.css']
})
export class PlotComponent implements OnInit {

  constructor() { }

  public graph;
  a: number;
  b: number;
  phase: number;
  phaseConverted: string;
  x: number[];
  y: number[];
  maxSlider: number;
  stepSlider: number;
  precisionSlider: number;

  ngOnInit(): void {
    this.a = 1;
    this.b = 2;
    this.maxSlider = 2 * Math.PI;
    this.stepSlider = Math.PI / 4;
    this.phase = 0;
    this.precisionSlider = 45;
    this.phaseConverted = (this.phase * (180 / Math.PI)).toFixed(2);
    this.drawFigure();
  }

  renderFigure(): void{
    this.graph = {
      data: [
        { x: this.x, y: this.y }
      ],
      layout: {width: 500, height: 500}
    };
  }

  drawFigure(): void{
    this.x = [];
    this.y = [];
    const precision = 200;
    for (let i = 0; i <= (Math.PI * 2); i += (Math.PI / this.a / this.b / precision)) {
      this.x.push(Math.sin(this.a * i));
      this.y.push(Math.sin(this.b * i + this.phase));
    }
    this.renderFigure();
  }

  updateValueOfA(event: MatSliderChange): void{
    this.a = event.value;
    this.drawFigure();
  }
  updateValueOfB(event: MatSliderChange): void{
    this.b = event.value;
    this.drawFigure();
  }

  updatePhase(event: MatSliderChange): void{
    this.phase = event.value;
    this.phaseConverted = (this.phase * (180 / Math.PI)).toFixed(2);
    this.drawFigure();
  }
  changePrecision(): void{
    if (this.stepSlider === Math.PI / 4) {
      this.precisionSlider = 22.5;
      this.stepSlider = Math.PI / 8;
    }
    else if (this.stepSlider === Math.PI / 8){
      this.precisionSlider = 11.25;
      this.stepSlider = Math.PI / 16;
    }
    else if (this.stepSlider === Math.PI / 16){
      this.precisionSlider = 45;
      this.stepSlider = Math.PI / 4;
    }

  }
}
