with MyList;
with Person; use Person;

package PersonList is new MyList(GenericListValue => Person.Person);
