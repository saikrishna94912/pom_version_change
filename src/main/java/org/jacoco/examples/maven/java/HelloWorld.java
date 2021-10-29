package org.jacoco.examples.maven.java;

public class HelloWorld {

	public String getMessage(boolean bigger) {
		if (bigger) {
			return "Hello Universe Sai!";
		} else {
			return "Hello World!";
		}
	}

}
