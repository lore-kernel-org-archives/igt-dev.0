Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5B26F4B1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Oct 2021 14:54:38 +0000 (UTC)
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Date: Thu, 7 Oct 2021 14:54:36 +0000
Message-ID: <DM4PR12MB5182EFB81A2845B2F953BB57ECB19@DM4PR12MB5182.namprd12.prod.outlook.com>
References: <20211001085319.789392-1-stylon.wang@amd.com>
 <20211002151511.vjblbkuoymw4jtyi@outlook.office365.com>
 <YVrh5zBX9mLq4Zg2@platvala-desk.ger.corp.intel.com>
 <20211004141835.uzqrsamqgdstee2q@outlook.office365.com>
 <7c206aba165a465aa14b465c72b6802c@intel.com>
 <DM8PR11MB5655AF5FCCDDD8EAB30C92B0E0AE9@DM8PR11MB5655.namprd11.prod.outlook.com>
 <20211007144038.ojiw5nzbydkfvgk2@outlook.office365.com>
 <oakr8kYGfhw6ExOrkEWsbp3jU89Fsenuurp94OdfCpOmqcab7tSAUAGLLQy4Tcro8tP5yZeSQAVzsTgGUrszteqMo5nyjdrCwYmwxypWQkE=@emersion.fr>
In-Reply-To: <oakr8kYGfhw6ExOrkEWsbp3jU89Fsenuurp94OdfCpOmqcab7tSAUAGLLQy4Tcro8tP5yZeSQAVzsTgGUrszteqMo5nyjdrCwYmwxypWQkE=@emersion.fr>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB5182EFB81A2845B2F953BB57ECB19DM4PR12MB5182namp_"
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
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, Simon Ser <contact@emersion.fr>
Cc: "Saarinen, Jani" <jani.saarinen@intel.com>, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Latvala, Petri" <petri.latvala@intel.com>, "Wang, Chao-kai (Stylon)" <Stylon.Wang@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Choi,
 Nicholas" <Nicholas.Choi@amd.com>, Mark Yacoub <markyacoub@google.com>, "Wentland, Harry" <Harry.Wentland@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_DM4PR12MB5182EFB81A2845B2F953BB57ECB19DM4PR12MB5182namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

I don't have the commits in front of me, but there was an issue with the po=
rt from amd_hdr to kms_hdr where the test would do a TEST_ONLY commit that =
change the output bpc to 10 but then the debugfs check after would try and =
verify that the output bpc was 10 - which doesn't work if the output bpc wa=
s previously 8 because the commit wasn't actually applied.

Regards,
Nicholas Kazlauskas
________________________________
From: Simon Ser <contact@emersion.fr>
Sent: Thursday, October 7, 2021 10:49 AM
To: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
Cc: Saarinen, Jani <jani.saarinen@intel.com>; Vudum, Lakshminarayana <laksh=
minarayana.vudum@intel.com>; Latvala, Petri <petri.latvala@intel.com>; Wang=
, Chao-kai (Stylon) <Stylon.Wang@amd.com>; igt-dev@lists.freedesktop.org <i=
gt-dev@lists.freedesktop.org>; Choi, Nicholas <Nicholas.Choi@amd.com>; Mark=
 Yacoub <markyacoub@google.com>; Wentland, Harry <Harry.Wentland@amd.com>; =
Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
Subject: Re: [PATCH i-g-t] tests/kms_hdr: Fix failure to read output_bpc on=
 AMD hardware

I don't think removing TEST_ONLY is correct? bafd90661c26 ("tests/kms_hdr: =
Add
bpc switch subtests") reads:

    v4: -Plane size back to CRTC size, regression observed in hsw again
         "Plane must cover entire CRTC" because of plane size restriction
         to 512x512. Petri/Ville suggested to use TEST_ONLY in try_commit()
         to probe whether we can use a smaller than fullscreen plane.

cc Nicholas

--_000_DM4PR12MB5182EFB81A2845B2F953BB57ECB19DM4PR12MB5182namp_
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
: 12pt; color: rgb(0, 0, 0);">
I don't have the commits in front of me, but there was an issue with the po=
rt from amd_hdr to kms_hdr where the test would do a TEST_ONLY commit that =
change the output bpc to 10 but then the debugfs check
<i>after </i>would try and verify that the output bpc was 10 - which doesn'=
t work if the output bpc was previously 8 because the commit wasn't actuall=
y applied.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Nicholas Kazlauskas</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Simon Ser &lt;contact=
@emersion.fr&gt;<br>
<b>Sent:</b> Thursday, October 7, 2021 10:49 AM<br>
<b>To:</b> Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;<br>
<b>Cc:</b> Saarinen, Jani &lt;jani.saarinen@intel.com&gt;; Vudum, Lakshmina=
rayana &lt;lakshminarayana.vudum@intel.com&gt;; Latvala, Petri &lt;petri.la=
tvala@intel.com&gt;; Wang, Chao-kai (Stylon) &lt;Stylon.Wang@amd.com&gt;; i=
gt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt;;
 Choi, Nicholas &lt;Nicholas.Choi@amd.com&gt;; Mark Yacoub &lt;markyacoub@g=
oogle.com&gt;; Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Kazlauskas, =
Nicholas &lt;Nicholas.Kazlauskas@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t] tests/kms_hdr: Fix failure to read output=
_bpc on AMD hardware</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">I don't think removing TEST_ONLY is correct? bafd9=
0661c26 (&quot;tests/kms_hdr: Add<br>
bpc switch subtests&quot;) reads:<br>
<br>
&nbsp;&nbsp;&nbsp; v4: -Plane size back to CRTC size, regression observed i=
n hsw again<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Plane must cover ent=
ire CRTC&quot; because of plane size restriction<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to 512x512. Petri/Ville su=
ggested to use TEST_ONLY in try_commit()<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to probe whether we can us=
e a smaller than fullscreen plane.<br>
<br>
cc Nicholas<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM4PR12MB5182EFB81A2845B2F953BB57ECB19DM4PR12MB5182namp_--
