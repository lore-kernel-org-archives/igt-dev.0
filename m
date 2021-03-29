Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934C66E0FB
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Mar 2021 23:11:49 +0000 (UTC)
From: "Vemasani, Vinod" <vinod.vemasani@intel.com>
Date: Mon, 29 Mar 2021 23:10:53 +0000
Message-ID: <DM6PR11MB2796AC0127DAAF10BF61915C917E9@DM6PR11MB2796.namprd11.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: [igt-dev] IGT on SLES
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0363148494=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Dewitt, David J" <david.j.dewitt@intel.com>, "Latvala,
 Petri" <petri.latvala@intel.com>, "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, "Musta, Tom" <tom.musta@intel.com>, "Lovin, Brian J" <brian.j.lovin@intel.com>, "Nguyen, Anthony D" <anthony.d.nguyen@intel.com>, "Kumar,
 Manish3" <manish3.kumar@intel.com>, "Sharp,
 Amanda K" <amanda.k.sharp@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0363148494==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB2796AC0127DAAF10BF61915C917E9DM6PR11MB2796namp_"

--_000_DM6PR11MB2796AC0127DAAF10BF61915C917E9DM6PR11MB2796namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to get intel-gpu-tools installed on SLES machine(s). The README=
 has instructions for Fedora/Debian and none for SLES. I reached out to cou=
ple of contacts and they told me it has a dependency which is difficult to =
meet for SLES. Is it true? Has anyone built on SLES successfully?

Came across this package for SUSE - https://software.opensuse.org/download/=
package?package=3Dintel-gpu-tools&project=3DopenSUSE%3ALeap%3A15.2
Installed RPM successfully but ran into this :

/home/vvemasan/intel_gpu_top
Failed to detect engines! (No such file or directory)
(Kernel 4.16 or newer is required for i915 PMU support.)

Any tips/thoughts/suggestions are appreciated.

Thanks for your time!

Vinod

--_000_DM6PR11MB2796AC0127DAAF10BF61915C917E9DM6PR11MB2796namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying to get intel-gpu-tools installed on SLES=
 machine(s). The README has instructions for Fedora/Debian and none for SLE=
S. I reached out to couple of contacts and they told me it has a dependency=
 which is difficult to meet for SLES.
 Is it true? Has anyone built on SLES successfully? <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Came across this package for SUSE - <a href=3D"https=
://software.opensuse.org/download/package?package=3Dintel-gpu-tools&amp;pro=
ject=3DopenSUSE%3ALeap%3A15.2">
https://software.opensuse.org/download/package?package=3Dintel-gpu-tools&am=
p;project=3DopenSUSE%3ALeap%3A15.2</a>
<o:p></o:p></p>
<p class=3D"MsoNormal">Installed RPM successfully but ran into this : <o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><i>/home/vvemasan/intel_gpu_top<o:p></o:p></i></b=
></p>
<p class=3D"MsoNormal"><b><i>Failed to detect engines! (No such file or dir=
ectory)<o:p></o:p></i></b></p>
<p class=3D"MsoNormal"><b><i>(Kernel 4.16 or newer is required for i915 PMU=
 support.)
<o:p></o:p></i></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any tips/thoughts/suggestions are appreciated. <o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for your time!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Vinod <o:p></o:p></p>
</div>
</body>
</html>

--_000_DM6PR11MB2796AC0127DAAF10BF61915C917E9DM6PR11MB2796namp_--

--===============0363148494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0363148494==--
