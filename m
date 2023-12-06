Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B570A10E6BB
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 11:06:18 +0000 (UTC)
From: "Kira, Piotr" <piotr.kira@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] runner/resultgen: Fix subtest runtimes
Date: Wed, 6 Dec 2023 11:06:14 +0000
Message-ID: <SJ1PR11MB6249F3F0786D0FA8D3363EB78084A@SJ1PR11MB6249.namprd11.prod.outlook.com>
References: <20231130150923.17707-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231130150923.17707-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_SJ1PR11MB6249F3F0786D0FA8D3363EB78084ASJ1PR11MB6249namp_"
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_SJ1PR11MB6249F3F0786D0FA8D3363EB78084ASJ1PR11MB6249namp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've tested it manually, it works.

Tested-by: Piotr Kira <piotr.kira@intel.com>


________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Thursday, November 30, 2023 4:09 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Kira, Piotr <piotr.kira@intel.com>; Petri Latvala <adrinael@adrinael.ne=
t>; Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] runner/resultgen: Fix subtest runtimes

From: Piotr Kira <piotr.kira@intel.com>

Runtimes for single subtest are not included in results json object
after switching to socket communication. Make times for both subtests
and dynamic subtests when using comms.

v2: added GitLab issue number, added Petri to Cc (Kamil)
  reformat so it could be applied (Kamil)

Cc: Petri Latvala <adrinael@adrinael.net>
Fixes: 9d889fa6b8f0 ("runner: Use socket communications")
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/132
Signed-off-by: Piotr Kira <piotr.kira@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/resultgen.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index b00bb6ba5..63f5b26d7 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1262,6 +1262,9 @@ struct comms_context
         char *subtestresult;
         char *dynamicsubtestresult;

+       double subtest_execution_time;
+       double dynamic_subtest_execution_time;
+
         char *cmdline;
         int exitcode;

@@ -1321,6 +1324,7 @@ static void comms_finish_subtest(struct comms_context=
 *context)
         if (context->subtestresult =3D=3D NULL)
                 context->subtestresult =3D strdup("incomplete");
         set_result(context->current_test, context->subtestresult);
+       add_runtime(context->current_test, context->subtest_execution_time);

         free(context->subtestresult);
         context->subtestresult =3D NULL;
@@ -1343,6 +1347,7 @@ static void comms_finish_dynamic_subtest(struct comms=
_context *context)
         if (context->dynamicsubtestresult =3D=3D NULL)
                 context->dynamicsubtestresult =3D strdup("incomplete");
         set_result(context->current_dynamic_subtest, context->dynamicsubte=
stresult);
+       add_runtime(context->current_dynamic_subtest, context->dynamic_subt=
est_execution_time);

         free(context->dynamicsubtestresult);
         context->dynamicsubtestresult =3D NULL;
@@ -1617,6 +1622,7 @@ static bool comms_handle_subtest_result(const struct =
runnerpacket *packet,
                                     strlen(helper.subtestresult.result),
                                     &mappedresult, NULL);
                 context->subtestresult =3D strdup(mappedresult);
+               context->subtest_execution_time =3D strtod(helper.subtestre=
sult.timeused, NULL);
         }

         context->state =3D STATE_BETWEEN_SUBTESTS;
@@ -1757,6 +1763,7 @@ static bool comms_handle_dynamic_subtest_result(const=
 struct runnerpacket *packe
                                     strlen(helper.dynamicsubtestresult.res=
ult),
                                     &mappedresult, NULL);
                 context->dynamicsubtestresult =3D strdup(mappedresult);
+               context->dynamic_subtest_execution_time =3D strtod(helper.d=
ynamicsubtestresult.timeused, NULL);
         }

         context->state =3D STATE_BETWEEN_DYNAMIC_SUBTESTS;
--
2.42.0

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu usta=
wy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w trans=
akcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.

--_000_SJ1PR11MB6249F3F0786D0FA8D3363EB78084ASJ1PR11MB6249namp_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
" class=3D"elementToProof">I've tested it manually, it works.<br>
<br>
Tested-by: Piotr Kira &lt;piotr.kira@intel.com&gt;<br>
<br>
</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kamil Konieczny &lt;k=
amil.konieczny@linux.intel.com&gt;<br>
<b>Sent:</b> Thursday, November 30, 2023 4:09 PM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Kira, Piotr &lt;piotr.kira@intel.com&gt;; Petri Latvala &lt;adri=
nael@adrinael.net&gt;; Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&=
gt;<br>
<b>Subject:</b> [PATCH i-g-t] runner/resultgen: Fix subtest runtimes</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Piotr Kira &lt;piotr.kira@intel.com&gt;<br>
<br>
Runtimes for single subtest are not included in results json object<br>
after switching to socket communication. Make times for both subtests<br>
and dynamic subtests when using comms.<br>
<br>
v2: added GitLab issue number, added Petri to Cc (Kamil)<br>
&nbsp; reformat so it could be applied (Kamil)<br>
<br>
Cc: Petri Latvala &lt;adrinael@adrinael.net&gt;<br>
Fixes: 9d889fa6b8f0 (&quot;runner: Use socket communications&quot;)<br>
Closes: <a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issue=
s/132">https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/132</a><br>
Signed-off-by: Piotr Kira &lt;piotr.kira@intel.com&gt;<br>
Signed-off-by: Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<br>
---<br>
&nbsp;runner/resultgen.c | 7 +++++++<br>
&nbsp;1 file changed, 7 insertions(+)<br>
<br>
diff --git a/runner/resultgen.c b/runner/resultgen.c<br>
index b00bb6ba5..63f5b26d7 100644<br>
--- a/runner/resultgen.c<br>
+++ b/runner/resultgen.c<br>
@@ -1262,6 +1262,9 @@ struct comms_context<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *subtestresult;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *dynamicsubtestresult=
;<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; double subtest_execution_time;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; double dynamic_subtest_execution_time=
;<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *cmdline;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int exitcode;<br>
&nbsp;<br>
@@ -1321,6 +1324,7 @@ static void comms_finish_subtest(struct comms_context=
 *context)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (context-&gt;subtestres=
ult =3D=3D NULL)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; context-&gt;subtestresult =3D strdup(&quot;incomplete=
&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_result(context-&gt;cur=
rent_test, context-&gt;subtestresult);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; add_runtime(context-&gt;current_test,=
 context-&gt;subtest_execution_time);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(context-&gt;subtestre=
sult);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;subtestresult =
=3D NULL;<br>
@@ -1343,6 +1347,7 @@ static void comms_finish_dynamic_subtest(struct comms=
_context *context)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (context-&gt;dynamicsub=
testresult =3D=3D NULL)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; context-&gt;dynamicsubtestresult =3D strdup(&quot;inc=
omplete&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_result(context-&gt;cur=
rent_dynamic_subtest, context-&gt;dynamicsubtestresult);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; add_runtime(context-&gt;current_dynam=
ic_subtest, context-&gt;dynamic_subtest_execution_time);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(context-&gt;dynamicsu=
btestresult);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;dynamicsubtest=
result =3D NULL;<br>
@@ -1617,6 +1622,7 @@ static bool comms_handle_subtest_result(const struct =
runnerpacket *packet,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strlen(h=
elper.subtestresult.result),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;map=
pedresult, NULL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; context-&gt;subtestresult =3D strdup(mappedresult);<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;subtest_execution_time =3D strtod(helper.subtestresu=
lt.timeused, NULL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;state =3D STAT=
E_BETWEEN_SUBTESTS;<br>
@@ -1757,6 +1763,7 @@ static bool comms_handle_dynamic_subtest_result(const=
 struct runnerpacket *packe<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strlen(h=
elper.dynamicsubtestresult.result),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;map=
pedresult, NULL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; context-&gt;dynamicsubtestresult =3D strdup(mappedres=
ult);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;dynamic_subtest_execution_time =3D strtod(helper.dyn=
amicsubtestresult.timeused, NULL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;state =3D STAT=
E_BETWEEN_DYNAMIC_SUBTESTS;<br>
-- <br>
2.42.0<br>
<br>
</div>
</span></font></div>
<p>
    <hr/>
    <strong style=3D"line-height: 11.25pt;">
        <span style=3D"font-size: 9pt; color: #595959;">
            <span style=3D"font-family: 'Arial Narrow', sans-serif;">Intel =
Technology Poland sp. z o.o.<br>
            </span>
        </span>
    </strong>
    <span style=3D"color:#595959; font-family: 'Arial Narrow', sans-serif; =
font-size: 9pt; line-height: 11.25pt;">
        ul. S&#322;owackiego 173 | 80-298 Gda&#324;sk | S&#261;d Rejonowy G=
da&#324;sk P&#243;&#322;noc | VII Wydzia&#322; Gospodarczy Krajowego Rejest=
ru S&#261;dowego - KRS 101882 | NIP 957-07-52-316 | Kapita&#322; zak&#322;a=
dowy 200.000 PLN.<br/>
              Sp&#243;&#322;ka o&#347;wiadcza, &#380;e posiada status du&#3=
80;ego przedsi&#281;biorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o prz=
eciwdzia&#322;aniu nadmiernym op&#243;&#378;nieniom w transakcjach handlowy=
ch.
    </span>
</p>
<p>
    <span style=3D"font-size:8.0pt;  font-family:'Arial Narrow',sans-serif;=
 mso-fareast-font-family: 'Times New Roman';mso-bidi-font-family:Arial; col=
or:#595959; mso-ansi-language:EN-US; mso-fareast-language:EN-US; mso-bidi-l=
anguage: PL-PL">
        Ta wiadomo&#347;&#263; wraz z za&#322;&#261;cznikami jest przeznacz=
ona dla okre&#347;lonego adresata i mo&#380;e zawiera&#263; informacje pouf=
ne. W razie przypadkowego otrzymania tej wiadomo&#347;ci, prosimy o powiado=
mienie nadawcy oraz trwa&#322;e jej usuni&#281;cie; jakiekolwiek przegl&#26=
1;danie lub rozpowszechnianie jest zabronione.<br>
        This e-mail and any attachments may contain confidential material f=
or the sole use of the intended recipient(s). If you are not the intended r=
ecipient, please contact the sender and delete all copies; any review or di=
stribution by others is strictly prohibited.
    </span>
</p>
<p class=3D"MsoNormal"><o:p></o:p></p>
</body>
</html>

--_000_SJ1PR11MB6249F3F0786D0FA8D3363EB78084ASJ1PR11MB6249namp_--
