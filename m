Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2062.outbound.protection.outlook.com [40.107.95.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4503E6E53C
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Aug 2021 07:44:42 +0000 (UTC)
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
Date: Thu, 26 Aug 2021 07:28:53 +0000
Message-ID: <DM4PR12MB529475E1B80134538A4C8BD295C79@DM4PR12MB5294.namprd12.prod.outlook.com>
References: <20210825074707.145773-1-tianci.yin@amd.com>
In-Reply-To: <20210825074707.145773-1-tianci.yin@amd.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB529475E1B80134538A4C8BD295C79DM4PR12MB5294namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_atomic_interruptible: fix a warning
 message on AMD GPU
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arek@hiler.eu>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
Cc: Mark Yacoub <markyacoub@google.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, "Choi, Nicholas" <Nicholas.Choi@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_DM4PR12MB529475E1B80134538A4C8BD295C79DM4PR12MB5294namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Hi Siqueira, Rodrigo,

Would you please help reviewing this patch?

Thank you very much!
Rico
________________________________
From: Tianci Yin <tianci.yin@amd.com>
Sent: Wednesday, August 25, 2021 15:47
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Petri La=
tvala <petri.latvala@intel.com>; Arkadiusz Hiler <arek@hiler.eu>
Cc: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Mark Yacoub <markyacoub@g=
oogle.com>; Wentland, Harry <Harry.Wentland@amd.com>; Choi, Nicholas <Nicho=
las.Choi@amd.com>; Yin, Tianci (Rico) <Tianci.Yin@amd.com>
Subject: [PATCH] tests/kms_atomic_interruptible: fix a warning message on A=
MD GPU

From: "Tianci.Yin" <tianci.yin@amd.com>

[why]
For subtest legacy-setmode and atomic-setmode, fb buffer is
unbinded from plane by block_plane(), then igt_display_commit2()
will trigger a dmesg warning message in drm_atomic_helper_commit(),
since for block commit, drm will wait fences that represents
finishing fb writing, when it find this fence has no accompanying
fb, it gives out a warning.

[how]
Just remove igt_plane_set_fb() from block_plane() to retain
the fb binding with plane.
Verified on AMD Radeon Pro W5500 and Intel UHD Graphics 630
(inside i7-9700K), both pass.

Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
---
 tests/kms_atomic_interruptible.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interrupti=
ble.c
index 0a127921..03980d6e 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -49,7 +49,6 @@ static int block_plane(igt_display_t *display, igt_output=
_t *output, enum plane_

                 if (test_type =3D=3D test_legacy_modeset || test_type =3D=
=3D test_atomic_modeset) {
                         igt_output_set_pipe(output, PIPE_NONE);
-                       igt_plane_set_fb(plane, NULL);
                 }
                 igt_plane_set_fence_fd(plane, sw_sync_timeline_create_fenc=
e(timeline, 1));

--
2.25.1


--_000_DM4PR12MB529475E1B80134538A4C8BD295C79DM4PR12MB5294namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
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
Hi Siqueira, Rodrigo,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Would you please help reviewing this patch?<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thank you very much!<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Rico<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Tianci Yin &lt;tian=
ci.yin@amd.com&gt;<br>
<b>Sent:</b> Wednesday, August 25, 2021 15:47<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; Petri Latvala &lt;petri.latvala@intel.com&gt;; Arkadiusz Hiler &lt;are=
k@hiler.eu&gt;<br>
<b>Cc:</b> Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; Mark Yacoub =
&lt;markyacoub@google.com&gt;; Wentland, Harry &lt;Harry.Wentland@amd.com&g=
t;; Choi, Nicholas &lt;Nicholas.Choi@amd.com&gt;; Yin, Tianci (Rico) &lt;Ti=
anci.Yin@amd.com&gt;<br>
<b>Subject:</b> [PATCH] tests/kms_atomic_interruptible: fix a warning messa=
ge on AMD GPU</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">From: &quot;Tianci.Yin&quot; &lt;tianci.yin@amd.co=
m&gt;<br>
<br>
[why]<br>
For subtest legacy-setmode and atomic-setmode, fb buffer is<br>
unbinded from plane by block_plane(), then igt_display_commit2()<br>
will trigger a dmesg warning message in drm_atomic_helper_commit(),<br>
since for block commit, drm will wait fences that represents<br>
finishing fb writing, when it find this fence has no accompanying<br>
fb, it gives out a warning.<br>
<br>
[how]<br>
Just remove igt_plane_set_fb() from block_plane() to retain<br>
the fb binding with plane.<br>
Verified on AMD Radeon Pro W5500 and Intel UHD Graphics 630<br>
(inside i7-9700K), both pass.<br>
<br>
Signed-off-by: Tianci.Yin &lt;tianci.yin@amd.com&gt;<br>
---<br>
&nbsp;tests/kms_atomic_interruptible.c | 1 -<br>
&nbsp;1 file changed, 1 deletion(-)<br>
<br>
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interrupti=
ble.c<br>
index 0a127921..03980d6e 100644<br>
--- a/tests/kms_atomic_interruptible.c<br>
+++ b/tests/kms_atomic_interruptible.c<br>
@@ -49,7 +49,6 @@ static int block_plane(igt_display_t *display, igt_output=
_t *output, enum plane_<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (test_type =3D=3D test_legacy_modeset || test_type=
 =3D=3D test_atomic_modeset) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_o=
utput_set_pipe(output, PIPE_NONE);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb=
(plane, NULL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_plane_set_fence_fd(plane, sw_sync_timeline_create=
_fence(timeline, 1));<br>
&nbsp;<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM4PR12MB529475E1B80134538A4C8BD295C79DM4PR12MB5294namp_--
