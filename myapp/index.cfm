<cfscript>
  mu = new mxunit.framework.TestCase();
  writeDump(mu);

  tb = new testbox.system.BaseSpec();
  writeDump(tb);

  writeOutput('Hello Coldfusion');
</cfscript>
