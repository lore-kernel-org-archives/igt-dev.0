Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A306910E659
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jun 2022 17:19:07 +0000 (UTC)
From: "Hung, Alex" <Alex.Hung@amd.com>
To: =?iso-8859-1?Q?Ma=EDra_Canal?= <maira.canal@usp.br>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 13 Jun 2022 17:19:05 +0000
Message-ID: <DM6PR12MB3051717E2B99B8ED7246D150F7AB9@DM6PR12MB3051.namprd12.prod.outlook.com>
References: <20220611190310.654069-1-maira.canal@usp.br>
In-Reply-To: <20220611190310.654069-1-maira.canal@usp.br>
Content-Language: en-GB
Content-Type: multipart/alternative;
 boundary="_000_DM6PR12MB3051717E2B99B8ED7246D150F7AB9DM6PR12MB3051namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/amdgpu: Skip multihead MPO tests
 on single display
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "magalilemes00@gmail.com" <magalilemes00@gmail.com>,
 "tales.aparecida@gmail.com" <tales.aparecida@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Isabella Basso <isabbasso@riseup.net>,
 "andrealmeid@riseup.net" <andrealmeid@riseup.net>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_DM6PR12MB3051717E2B99B8ED7246D150F7AB9DM6PR12MB3051namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Reviewed-by: Alex Hung <alex.hung@amd.com>

________________________________
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> on behalf of Ma=EDra =
Canal <maira.canal@usp.br>
Sent: 11 June 2022 13:03
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: magalilemes00@gmail.com <magalilemes00@gmail.com>; tales.aparecida@gmai=
l.com <tales.aparecida@gmail.com>; Ma=EDra Canal <maira.canal@usp.br>; Deuc=
her, Alexander <Alexander.Deucher@amd.com>; Isabella Basso <isabbasso@riseu=
p.net>; andrealmeid@riseup.net <andrealmeid@riseup.net>; Lakha, Bhawanpreet=
 <Bhawanpreet.Lakha@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
Subject: [igt-dev] [PATCH i-g-t] tests/amdgpu: Skip multihead MPO tests on =
single display

[Why]
If only one output is connected, all the igt@amdgpu/amd_plane "-multihead"
subtests will result in CRASH, such as can be seen in:

Starting subtest: mpo-scale-nv12-multihead
Received signal SIGSEGV.
Stack trace:
 #0 [fatal_sig_handler+0x163]
 #1 [__sigaction+0x50]
 #2 [force_output_mode+0xa]
 #3 [test_display_mpo+0x20b]
 #4 [__igt_unique____real_main725+0x106d]
 #5 [main+0x23]
 #6 [__libc_start_call_main+0x80]
 #7 [__libc_start_main+0x89]
 #8 [_start+0x25]
Subtest mpo-scale-nv12-multihead: CRASH (0.009s)

In single-display systems, the "-multihead" subtests should SKIP.

[How]
Count the number of connected outputs on the system and compare it to the
ideal number depending on the subtest, using igt_skip_on to assure that
multiheaded subtests will SKIP on single display systems.

Signed-off-by: Ma=EDra Canal <maira.canal@usp.br>
---
 tests/amdgpu/amd_plane.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index faaa1b87..4b2bee49 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -449,9 +449,11 @@ static void test_display_mpo(data_t *data, enum test t=
est, uint32_t format, int
 {

         igt_display_t *display =3D &data->display;
+       igt_output_t *output;
         uint32_t regamma_lut_size;
         lut_t lut;
         struct fbc fb[4];
+       int valid_outputs =3D 0;
         int videos[][2]=3D {
                 {426, 240},
                 {640, 360},
@@ -464,6 +466,13 @@ static void test_display_mpo(data_t *data, enum test t=
est, uint32_t format, int

         test_init(data);

+       /* Skip if there is less valid outputs than the required. */
+       for_each_connected_output(display, output)
+               valid_outputs++;
+
+       igt_skip_on_f(valid_outputs < display_count,
+                       "Valid outputs (%d) should be equal or greater than=
 %d\n", valid_outputs, display_count);
+
         regamma_lut_size =3D igt_pipe_obj_get_prop(data->pipe[0], IGT_CRTC=
_GAMMA_LUT_SIZE);
         igt_assert_lt(0, regamma_lut_size);
         lut_init(&lut, regamma_lut_size);
@@ -586,9 +595,17 @@ static void test_mpo_swizzle_toggle_multihead(data_t *=
data)
 {
         struct amdgpu_bo_metadata meta =3D {};
         igt_display_t *display =3D &data->display;
+       igt_output_t *output;
         igt_fb_t fb_1280_xr24_tiled, fb_1280_ar24_tiled, fb_1920_xb24_tile=
d,
                 fb_1920_xb24_linear, fb_1920_xr24_tiled;
         int w, h;
+       int valid_outputs =3D 0;
+
+       /* Skip if only one display is connected. */
+       for_each_connected_output(display, output)
+               valid_outputs++;
+
+       igt_skip_on_f(valid_outputs =3D=3D 1, "Must have more than one outp=
ut connected\n");

         w =3D 2400;
         h =3D 1350;
--
2.36.1


--_000_DM6PR12MB3051717E2B99B8ED7246D150F7AB9DM6PR12MB3051namp_
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
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Reviewed-by: Alex Hung &lt;alex.hung@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:&quot;Segoe UI&quot;,&quot;Segoe UI Web (West Eur=
opean)&quot;,&quot;Helvetica Neue&quot;,sans-serif; font-size:12pt; color:r=
gb(0,0,0)" class=3D"elementToProof">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt" class=3D"elementToProof"><b>From:<=
/b> igt-dev &lt;igt-dev-bounces@lists.freedesktop.org&gt; on behalf of Ma=
=EDra Canal &lt;maira.canal@usp.br&gt;<br>
<b>Sent:</b> 11 June 2022 13:03<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> magalilemes00@gmail.com &lt;magalilemes00@gmail.com&gt;; tales.a=
parecida@gmail.com &lt;tales.aparecida@gmail.com&gt;; Ma=EDra Canal &lt;mai=
ra.canal@usp.br&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; =
Isabella Basso &lt;isabbasso@riseup.net&gt;; andrealmeid@riseup.net
 &lt;andrealmeid@riseup.net&gt;; Lakha, Bhawanpreet &lt;Bhawanpreet.Lakha@a=
md.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Subject:</b> [igt-dev] [PATCH i-g-t] tests/amdgpu: Skip multihead MPO te=
sts on single display</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">[Why]<br>
If only one output is connected, all the igt@amdgpu/amd_plane &quot;-multih=
ead&quot;<br>
subtests will result in CRASH, such as can be seen in:<br>
<br>
Starting subtest: mpo-scale-nv12-multihead<br>
Received signal SIGSEGV.<br>
Stack trace:<br>
&nbsp;#0 [fatal_sig_handler+0x163]<br>
&nbsp;#1 [__sigaction+0x50]<br>
&nbsp;#2 [force_output_mode+0xa]<br>
&nbsp;#3 [test_display_mpo+0x20b]<br>
&nbsp;#4 [__igt_unique____real_main725+0x106d]<br>
&nbsp;#5 [main+0x23]<br>
&nbsp;#6 [__libc_start_call_main+0x80]<br>
&nbsp;#7 [__libc_start_main+0x89]<br>
&nbsp;#8 [_start+0x25]<br>
Subtest mpo-scale-nv12-multihead: CRASH (0.009s)<br>
<br>
In single-display systems, the &quot;-multihead&quot; subtests should SKIP.=
<br>
<br>
[How]<br>
Count the number of connected outputs on the system and compare it to the<b=
r>
ideal number depending on the subtest, using igt_skip_on to assure that<br>
multiheaded subtests will SKIP on single display systems.<br>
<br>
Signed-off-by: Ma=EDra Canal &lt;maira.canal@usp.br&gt;<br>
---<br>
&nbsp;tests/amdgpu/amd_plane.c | 17 +++++++++++++++++<br>
&nbsp;1 file changed, 17 insertions(+)<br>
<br>
diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c<br>
index faaa1b87..4b2bee49 100644<br>
--- a/tests/amdgpu/amd_plane.c<br>
+++ b/tests/amdgpu/amd_plane.c<br>
@@ -449,9 +449,11 @@ static void test_display_mpo(data_t *data, enum test t=
est, uint32_t format, int<br>
&nbsp;{<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D=
 &amp;data-&gt;display;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t regamma_lut_size;=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lut_t lut;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct fbc fb[4];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int valid_outputs =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int videos[][2]=3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {426, 240},<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {640, 360},<br>
@@ -464,6 +466,13 @@ static void test_display_mpo(data_t *data, enum test t=
est, uint32_t format, int<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_init(data);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Skip if there is less valid output=
s than the required. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_connected_output(display, ou=
tput)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; valid_outputs++;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on_f(valid_outputs &lt; disp=
lay_count,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Valid outp=
uts (%d) should be equal or greater than %d\n&quot;, valid_outputs, display=
_count);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; regamma_lut_size =3D igt_p=
ipe_obj_get_prop(data-&gt;pipe[0], IGT_CRTC_GAMMA_LUT_SIZE);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_lt(0, regamma_l=
ut_size);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lut_init(&amp;lut, regamma=
_lut_size);<br>
@@ -586,9 +595,17 @@ static void test_mpo_swizzle_toggle_multihead(data_t *=
data)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo_metadata =
meta =3D {};<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D=
 &amp;data-&gt;display;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fb_t fb_1280_xr24_tile=
d, fb_1280_ar24_tiled, fb_1920_xb24_tiled,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; fb_1920_xb24_linear, fb_1920_xr24_tiled;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int w, h;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int valid_outputs =3D 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Skip if only one display is connec=
ted. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_connected_output(display, ou=
tput)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; valid_outputs++;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on_f(valid_outputs =3D=3D 1,=
 &quot;Must have more than one output connected\n&quot;);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; w =3D 2400;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; h =3D 1350;<br>
-- <br>
2.36.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM6PR12MB3051717E2B99B8ED7246D150F7AB9DM6PR12MB3051namp_--
