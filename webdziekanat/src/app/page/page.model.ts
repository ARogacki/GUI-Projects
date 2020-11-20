
export class Page{
  content: any[];
  totalPages: number;
  currentPage: number;
  elementsPerPage: number;
  totalElements: number;
  last: boolean;
  first: boolean;
  constructor(content: any[], totalPages: number, currentPage: number, elementsPerPage: number, totalElements: number, last: boolean,
              first: boolean) {
    this.content = content;
    this.totalPages = totalPages;
    this.currentPage = currentPage;
    this.elementsPerPage = elementsPerPage;
    this.totalElements = totalElements;
    this.last = last;
    this.first = first;
  }
}
