Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C89910E44B
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 19:05:08 +0000 (UTC)
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: "Hung, Alex" <Alex.Hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Wed, 14 Dec 2022 19:05:05 +0000
Message-ID: <CH0PR12MB5284739DFEFADB4F50A598BC8BE09@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20221214181906.561644-1-alex.hung@amd.com>
In-Reply-To: <20221214181906.561644-1-alex.hung@amd.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB5284739DFEFADB4F50A598BC8BE09CH0PR12MB5284namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH][V2] tests/kms_bw: Test outputs with fb of the
 same resolutions
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

--_000_CH0PR12MB5284739DFEFADB4F50A598BC8BE09CH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]


Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

--

Regards,
Jay
________________________________
From: Hung, Alex <Alex.Hung@amd.com>
Sent: Wednesday, December 14, 2022 1:19 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Pillai, Aurabindo <Aurabi=
ndo.Pillai@amd.com>; Hung, Alex <Alex.Hung@amd.com>
Subject: [PATCH][V2] tests/kms_bw: Test outputs with fb of the same resolut=
ions

The hardcoded fb resolution (1920x1080) is replaced by the output
resolution.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---

[V2] Drop PATCH 2

 tests/kms_bw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 2a8df5b3..27100587 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -167,8 +167,8 @@ static void run_test_linear_tiling(data_t *data, int pi=
pe, const drmModeModeInfo

                 force_output_mode(data, output, mode);

-               igt_create_color_fb(display->drm_fd, test_mode[0].hdisplay,
-                                   test_mode[0].vdisplay, DRM_FORMAT_XRGB8=
888,
+               igt_create_color_fb(display->drm_fd, mode->hdisplay,
+                                   mode->vdisplay, DRM_FORMAT_XRGB8888,
                                     DRM_FORMAT_MOD_NONE, 1.f, 0.f, 0.f,
                                     &buffer[i]);

--
2.38.1


--_000_CH0PR12MB5284739DFEFADB4F50A598BC8BE09CH0PR12MB5284namp_
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
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof">Reviewed-by: Aurabindo Pil=
lai &lt;aurabindo.pillai@amd.com&gt;<br>
</span></div>
<div class=3D"elementToProof">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jay<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Hung, Alex &lt;Alex.H=
ung@amd.com&gt;<br>
<b>Sent:</b> Wednesday, December 14, 2022 1:19 PM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; Pillai, Aura=
bindo &lt;Aurabindo.Pillai@amd.com&gt;; Hung, Alex &lt;Alex.Hung@amd.com&gt=
;<br>
<b>Subject:</b> [PATCH][V2] tests/kms_bw: Test outputs with fb of the same =
resolutions</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The hardcoded fb resolution (1920x1080) is replace=
d by the output<br>
resolution.<br>
<br>
Signed-off-by: Alex Hung &lt;alex.hung@amd.com&gt;<br>
---<br>
<br>
[V2] Drop PATCH 2<br>
<br>
&nbsp;tests/kms_bw.c | 4 ++--<br>
&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/kms_bw.c b/tests/kms_bw.c<br>
index 2a8df5b3..27100587 100644<br>
--- a/tests/kms_bw.c<br>
+++ b/tests/kms_bw.c<br>
@@ -167,8 +167,8 @@ static void run_test_linear_tiling(data_t *data, int pi=
pe, const drmModeModeInfo<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; force_output_mode(data, output, mode);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_create_color_fb(display-&gt;drm_fd, test_mode[0].hdisplay,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_mode[0].vdispl=
ay, DRM_FORMAT_XRGB8888,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_create_color_fb(display-&gt;drm_fd, mode-&gt;hdisplay,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode-&gt;vdisplay, =
DRM_FORMAT_XRGB8888,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORM=
AT_MOD_NONE, 1.f, 0.f, 0.f,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;buf=
fer[i]);<br>
&nbsp;<br>
-- <br>
2.38.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH0PR12MB5284739DFEFADB4F50A598BC8BE09CH0PR12MB5284namp_--
