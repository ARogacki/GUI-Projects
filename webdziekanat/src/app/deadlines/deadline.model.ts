export class Deadline{
  deadlineName: string;
  deadlineDate: any;
  isOptional: boolean;
  constructor(deadlineName: string, deadlineDate: any, isOptional: boolean) {
    this.deadlineName = deadlineName;
    this.deadlineDate = deadlineDate;
    this.isOptional = isOptional;
  }
}
