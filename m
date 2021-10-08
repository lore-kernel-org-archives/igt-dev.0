Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692E46E09A
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 05:45:41 +0000 (UTC)
From: "Wang, Chao-kai (Stylon)" <Stylon.Wang@amd.com>
Date: Fri, 8 Oct 2021 05:45:38 +0000
Message-ID: <BN9PR12MB5145405FB299E7C2087EAE97FFB29@BN9PR12MB5145.namprd12.prod.outlook.com>
References: <20211001085319.789392-1-stylon.wang@amd.com>
 <20211002151511.vjblbkuoymw4jtyi@outlook.office365.com>
 <YVrh5zBX9mLq4Zg2@platvala-desk.ger.corp.intel.com>
 <20211004141835.uzqrsamqgdstee2q@outlook.office365.com>
 <7c206aba165a465aa14b465c72b6802c@intel.com>
 <DM8PR11MB5655AF5FCCDDD8EAB30C92B0E0AE9@DM8PR11MB5655.namprd11.prod.outlook.com>
 <20211007144038.ojiw5nzbydkfvgk2@outlook.office365.com>
 <oakr8kYGfhw6ExOrkEWsbp3jU89Fsenuurp94OdfCpOmqcab7tSAUAGLLQy4Tcro8tP5yZeSQAVzsTgGUrszteqMo5nyjdrCwYmwxypWQkE=@emersion.fr>
 <DM4PR12MB5182EFB81A2845B2F953BB57ECB19@DM4PR12MB5182.namprd12.prod.outlook.com>
 <73ec4c04-b2d1-4392-4096-7cc7076420ed@amd.com>
 <161af036-f263-7bb0-bc6d-251ae9517f42@amd.com>
In-Reply-To: <161af036-f263-7bb0-bc6d-251ae9517f42@amd.com>
Content-Language: en-CA
Content-Type: multipart/alternative;
 boundary="_000_BN9PR12MB5145405FB299E7C2087EAE97FFB29BN9PR12MB5145namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_hdr: Fix failure to read
 output_bpc on AMD hardware
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, Simon Ser <contact@emersion.fr>
Cc: "Saarinen, Jani" <jani.saarinen@intel.com>, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Latvala, Petri" <petri.latvala@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Choi, Nicholas" <Nicholas.Choi@amd.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_BN9PR12MB5145405FB299E7C2087EAE97FFB29BN9PR12MB5145namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

I wanna propose to break down this patch into 2 changes:

  1.  Keep theTEST_ONLY commit to check if 512x512 plane works. If not, cha=
nge the plane size to cover full CRTC.
  2.  Add a real commit after TEST_ONLY to set output bpc to 8. This should=
 satisfy the first check that the output bpc is indeed 8

Regards


Stylon Wang

MTS Software Development Eng.  |  AMD
Display Solution Team

O +(886) 2-3789-3667 ext. 23667  C +(886) 921-897-142

---------------------------------------------------------------------------=
-------------------------------------------------------

6F, 3, YuanCyu St (NanKang Software Park) Taipei, Taiwan

Facebook<https://www.facebook.com/AMD> |  Twitter<https://twitter.com/AMD> =
|  amd.com<http://www.amd.com/>



________________________________
From: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
Sent: October 7, 2021 10:59 PM
To: Wentland, Harry <Harry.Wentland@amd.com>; Siqueira, Rodrigo <Rodrigo.Si=
queira@amd.com>; Simon Ser <contact@emersion.fr>
Cc: Saarinen, Jani <jani.saarinen@intel.com>; Vudum, Lakshminarayana <laksh=
minarayana.vudum@intel.com>; Latvala, Petri <petri.latvala@intel.com>; Wang=
, Chao-kai (Stylon) <Stylon.Wang@amd.com>; igt-dev@lists.freedesktop.org <i=
gt-dev@lists.freedesktop.org>; Choi, Nicholas <Nicholas.Choi@amd.com>; Mark=
 Yacoub <markyacoub@google.com>
Subject: Re: [PATCH i-g-t] tests/kms_hdr: Fix failure to read output_bpc on=
 AMD hardware

On 2021-10-07 10:56 a.m., Harry Wentland wrote:
>
>
> On 2021-10-07 10:54, Kazlauskas, Nicholas wrote:
>> [AMD Official Use Only]
>>
>>
>> I don't have the commits in front of me, but there was an issue with the=
 port from amd_hdr to kms_hdr where the test would do a TEST_ONLY commit th=
at change the output bpc to 10 but then the debugfs check /after /would try=
 and verify that the output bpc was 10 - which doesn't work if the output b=
pc was previously 8 because the commit wasn't actually applied.
>>
>
> https://patchwork.freedesktop.org/patch/456663/?series=3D95313&rev=3D1
>
> Stylon, is that what is happening?
>
> If so, please make sure the commit description reflects that. The existin=
g
> description doesn't explain why switching from TEST_ONLY to ALLOW_MODESET
> fixes things.
>
> Harry

Thanks for linking it - it looks like it's actually the reverse, where
it tries to change bpc to 8 but the connector may not currently be in 8
nor is there a requirement for it to be before the test starts.

Userspace might have already been running with an uncapped max bpc
before the test starts.

Regards,
Nicholas Kazlauskas

>
>
>> Regards,
>> Nicholas Kazlauskas
>> ------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
------------------
>> *From:* Simon Ser <contact@emersion.fr>
>> *Sent:* Thursday, October 7, 2021 10:49 AM
>> *To:* Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
>> *Cc:* Saarinen, Jani <jani.saarinen@intel.com>; Vudum, Lakshminarayana <=
lakshminarayana.vudum@intel.com>; Latvala, Petri <petri.latvala@intel.com>;=
 Wang, Chao-kai (Stylon) <Stylon.Wang@amd.com>; igt-dev@lists.freedesktop.o=
rg <igt-dev@lists.freedesktop.org>; Choi, Nicholas <Nicholas.Choi@amd.com>;=
 Mark Yacoub <markyacoub@google.com>; Wentland, Harry <Harry.Wentland@amd.c=
om>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
>> *Subject:* Re: [PATCH i-g-t] tests/kms_hdr: Fix failure to read output_b=
pc on AMD hardware
>>
>> I don't think removing TEST_ONLY is correct? bafd90661c26 ("tests/kms_hd=
r: Add
>> bpc switch subtests") reads:
>>
>>      v4: -Plane size back to CRTC size, regression observed in hsw again
>>           "Plane must cover entire CRTC" because of plane size restricti=
on
>>           to 512x512. Petri/Ville suggested to use TEST_ONLY in try_comm=
it()
>>           to probe whether we can use a smaller than fullscreen plane.
>>
>> cc Nicholas
>


--_000_BN9PR12MB5145405FB299E7C2087EAE97FFB29BN9PR12MB5145namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
I wanna propose to break down this patch into 2 changes:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
<ol>
<li><span>Keep theTEST_ONLY commit to check if 512x512 plane works. If not,=
 change the plane size to cover full CRTC.</span></li><li><span>Add a real =
commit after TEST_ONLY to set output bpc to 8. This should satisfy the firs=
t check that the output bpc is indeed 8</span></li></ol>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
Regards</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div></div>
<div></div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:#000000; font-family:Calibri,Helvetica,sans-serif">
<p style=3D"margin-top:0px; margin-bottom:0px; margin-top:0; margin-bottom:=
0"></p>
<p style=3D"margin:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sa=
ns-serif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,2=
55,255)">
<span style=3D"margin:0px; font-size:9pt; font-family:Arial,sans-serif; col=
or:black"><u><b>Stylon Wang</b></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sa=
ns-serif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,2=
55,255)">
<span style=3D"margin:0px; font-size:9pt; font-family:Arial,sans-serif; col=
or:black">MTS Software Development Eng.&nbsp;&nbsp;|<b>&nbsp;&nbsp;AMD</b><=
br>
Display Solution Team</span></p>
<p style=3D"margin:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sa=
ns-serif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,2=
55,255)">
<span style=3D"margin:0px; font-size:9pt; font-family:Arial,sans-serif; col=
or:black"><b style=3D"color:rgb(32,31,30); font-family:Calibri,sans-serif; =
font-size:14.6667px; background-color:rgb(255,255,255)"><span style=3D"marg=
in:0px; font-size:9pt; font-family:Arial,sans-serif; color:black">O</span><=
/b><span style=3D"margin:0px; font-size:9pt; font-family:Arial,sans-serif; =
color:black; background-color:rgb(255,255,255)">&nbsp;+(886)
 2-3789-3667 ext. 23667&nbsp;&nbsp;<b>C</b>&nbsp;+(886) 921-897-142</span><=
br>
</span></p>
<p style=3D"margin:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sa=
ns-serif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,2=
55,255)">
<b><span style=3D"margin:0px; font-size:9pt; color:rgb(242,101,34); letter-=
spacing:-1.4pt">-----------------------------------------------------------=
-----------------------------------------------------------------------</sp=
an></b><b><span style=3D"margin:0px; font-size:9pt; color:rgb(242,101,34)">=
</span></b></p>
<p style=3D"margin:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sa=
ns-serif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,2=
55,255)">
<span style=3D"margin:0px; font-size:9pt; font-family:Arial,sans-serif; col=
or:black"><span tabindex=3D"0" style=3D"margin:0px; padding:1px 0px; border=
-width:0px 0px 1px; border-bottom-style:dashed">6F, 3, YuanCyu St (NanKang =
Software Park) Taipei, Taiwan</span></span></p>
<p style=3D"margin:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sa=
ns-serif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,2=
55,255)">
<span style=3D"margin:0px; font-size:9pt; font-family:Arial,sans-serif; col=
or:black"><a href=3D"https://www.facebook.com/AMD" target=3D"_blank" rel=3D=
"noopener noreferrer" style=3D"margin:0px"><span style=3D"margin:0px">Faceb=
ook</span></a>&nbsp;|&nbsp;&nbsp;<a href=3D"https://twitter.com/AMD" target=
=3D"_blank" rel=3D"noopener noreferrer" style=3D"margin:0px"><span style=3D=
"margin:0px">Twitter</span></a>&nbsp;|&nbsp;&nbsp;<a href=3D"http://www.amd=
.com/" target=3D"_blank" rel=3D"noopener noreferrer" style=3D"margin:0px"><=
span style=3D"margin:0px">amd.com</span></a></span><span style=3D"margin:0p=
x; font-size:10pt; font-family:Arial,sans-serif; color:black">&nbsp;</span>=
</p>
<p style=3D"margin:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sa=
ns-serif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,2=
55,255)">
&nbsp;</p>
<p style=3D"margin-top:0px; margin-bottom:0px; margin-top:0; margin-bottom:=
0"></p>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kazlauskas, Nicholas =
&lt;Nicholas.Kazlauskas@amd.com&gt;<br>
<b>Sent:</b> October 7, 2021 10:59 PM<br>
<b>To:</b> Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Siqueira, Rodrig=
o &lt;Rodrigo.Siqueira@amd.com&gt;; Simon Ser &lt;contact@emersion.fr&gt;<b=
r>
<b>Cc:</b> Saarinen, Jani &lt;jani.saarinen@intel.com&gt;; Vudum, Lakshmina=
rayana &lt;lakshminarayana.vudum@intel.com&gt;; Latvala, Petri &lt;petri.la=
tvala@intel.com&gt;; Wang, Chao-kai (Stylon) &lt;Stylon.Wang@amd.com&gt;; i=
gt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt;;
 Choi, Nicholas &lt;Nicholas.Choi@amd.com&gt;; Mark Yacoub &lt;markyacoub@g=
oogle.com&gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t] tests/kms_hdr: Fix failure to read output=
_bpc on AMD hardware</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 2021-10-07 10:56 a.m., Harry Wentland wrote:<br=
>
&gt; <br>
&gt; <br>
&gt; On 2021-10-07 10:54, Kazlauskas, Nicholas wrote:<br>
&gt;&gt; [AMD Official Use Only]<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I don't have the commits in front of me, but there was an issue wi=
th the port from amd_hdr to kms_hdr where the test would do a TEST_ONLY com=
mit that change the output bpc to 10 but then the debugfs check /after /wou=
ld try and verify that the output bpc
 was 10 - which doesn't work if the output bpc was previously 8 because the=
 commit wasn't actually applied.<br>
&gt;&gt;<br>
&gt; <br>
&gt; <a href=3D"https://patchwork.freedesktop.org/patch/456663/?series=3D95=
313&amp;rev=3D1">https://patchwork.freedesktop.org/patch/456663/?series=3D9=
5313&amp;rev=3D1</a><br>
&gt; <br>
&gt; Stylon, is that what is happening?<br>
&gt; <br>
&gt; If so, please make sure the commit description reflects that. The exis=
ting<br>
&gt; description doesn't explain why switching from TEST_ONLY to ALLOW_MODE=
SET<br>
&gt; fixes things.<br>
&gt; <br>
&gt; Harry<br>
<br>
Thanks for linking it - it looks like it's actually the reverse, where <br>
it tries to change bpc to 8 but the connector may not currently be in 8 <br=
>
nor is there a requirement for it to be before the test starts.<br>
<br>
Userspace might have already been running with an uncapped max bpc <br>
before the test starts.<br>
<br>
Regards,<br>
Nicholas Kazlauskas<br>
<br>
&gt; <br>
&gt; <br>
&gt;&gt; Regards,<br>
&gt;&gt; Nicholas Kazlauskas<br>
&gt;&gt; ------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
------------------------<br>
&gt;&gt; *From:* Simon Ser &lt;contact@emersion.fr&gt;<br>
&gt;&gt; *Sent:* Thursday, October 7, 2021 10:49 AM<br>
&gt;&gt; *To:* Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;<br>
&gt;&gt; *Cc:* Saarinen, Jani &lt;jani.saarinen@intel.com&gt;; Vudum, Laksh=
minarayana &lt;lakshminarayana.vudum@intel.com&gt;; Latvala, Petri &lt;petr=
i.latvala@intel.com&gt;; Wang, Chao-kai (Stylon) &lt;Stylon.Wang@amd.com&gt=
;; igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt;;
 Choi, Nicholas &lt;Nicholas.Choi@amd.com&gt;; Mark Yacoub &lt;markyacoub@g=
oogle.com&gt;; Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Kazlauskas, =
Nicholas &lt;Nicholas.Kazlauskas@amd.com&gt;<br>
&gt;&gt; *Subject:* Re: [PATCH i-g-t] tests/kms_hdr: Fix failure to read ou=
tput_bpc on AMD hardware<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; I don't think removing TEST_ONLY is correct? bafd90661c26 (&quot;t=
ests/kms_hdr: Add<br>
&gt;&gt; bpc switch subtests&quot;) reads:<br>
&gt;&gt;<br>
&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp; v4: -Plane size back to CRTC size, regres=
sion observed in hsw again<br>
&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Plane=
 must cover entire CRTC&quot; because of plane size restriction<br>
&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to 512x512.=
 Petri/Ville suggested to use TEST_ONLY in try_commit()<br>
&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to probe wh=
ether we can use a smaller than fullscreen plane.<br>
&gt;&gt;<br>
&gt;&gt; cc Nicholas<br>
&gt; <br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BN9PR12MB5145405FB299E7C2087EAE97FFB29BN9PR12MB5145namp_--
