package com.company;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;

public class Main {

    public static void main(String[] args) throws IOException, URISyntaxException, TransformerException {

        TransformerFactory factory = TransformerFactory.newInstance();
        Source xml = new StreamSource(new File("resources/input.xml"));

        Source xslt;
        Transformer transformer;

        xslt = new StreamSource(new File("resources/xsl/redundant_books.xsl"));
        transformer = factory.newTransformer(xslt);
        transformer.transform(xml, new StreamResult(new File("resources/out/out_books.xml")));

        xslt = new StreamSource(new File("resources/xsl/redundant_authors.xsl"));
        transformer = factory.newTransformer(xslt);
        transformer.transform(xml, new StreamResult(new File("resources/out/out_authors.xml")));

        xslt = new StreamSource(new File("resources/xsl/redundant_authors_without_empty.xsl"));
        transformer = factory.newTransformer(xslt);
        transformer.transform(xml, new StreamResult(new File("resources/out/out_authors_without_empty.xml")));

        xslt = new StreamSource(new File("resources/xsl/redundant_books_one_en_authors.xsl"));
        transformer = factory.newTransformer(xslt);
        transformer.transform(xml, new StreamResult(new File("resources/out/out_books_one_en_authors.xml")));


        xslt = new StreamSource(new File("resources/xsl/task3.xsl"));
        transformer = factory.newTransformer(xslt);
        transformer.transform(xml, new StreamResult(new File("resources/out/out_task3.xml")));

    }

}
