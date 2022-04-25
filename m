Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A37710F8C1
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 15:52:15 +0000 (UTC)
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: "Zhang, Dingchen (David)" <Dingchen.Zhang@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 25 Apr 2022 15:52:12 +0000
Message-ID: <CH0PR12MB52848E95A39A26C10E5A47C18BF89@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20220425153654.752046-1-dingchen.zhang@amd.com>
 <20220425153654.752046-2-dingchen.zhang@amd.com>
In-Reply-To: <20220425153654.752046-2-dingchen.zhang@amd.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB52848E95A39A26C10E5A47C18BF89CH0PR12MB5284namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 1/4] tests/amdgpu/amd_psr: add helper to
 draw cursor pattern
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

--_000_CH0PR12MB52848E95A39A26C10E5A47C18BF89CH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]


This series is:

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
--

Regards,
Jay
________________________________
From: Zhang, Dingchen (David) <Dingchen.Zhang@amd.com>
Sent: Monday, April 25, 2022 11:36 AM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Wentland, Harry <Harry.We=
ntland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Pillai, Aurabindo=
 <Aurabindo.Pillai@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
Subject: [PATCH v3 1/4] tests/amdgpu/amd_psr: add helper to draw cursor pat=
tern

[why & how]
For amdgpu PSR-SU validation, we'd create and test cursor update
use case as well. To emulate a mouse-like cursor movement, we'd
define a helper to draw a cursor pattern.

- helper draw the cursor pattern as an 45-degrees rotated arrow
- for the region of arrow, set alpha to 1 to make cursor foreground
  and always on the top
- for rest of the non-arrow region, set alpha to 0 to make it as
  background

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 tests/amdgpu/amd_psr.c | 47 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index d4bfb7bb..e3a2cb4a 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -81,6 +81,53 @@ static void draw_color_alpha(igt_fb_t *fb, int x, int y,=
 int w, int h,
         igt_put_cairo_ctx(cr);
 }

+/* draw a cursor pattern assuming the FB given is square w/ FORMAT ARGB */
+static void draw_color_cursor(igt_fb_t *fb, int size, double r, double g, =
double b)
+{
+       cairo_t *cr =3D igt_get_cairo_ctx(fb->fd, fb);
+       int x, y, line_w;
+
+       cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+
+       /*
+        * draw cursor
+        * recall that alpha blending value:
+        * - 0, output pixel is the background
+        * - 1, output pixel is simply the foreground
+        * - (0, 1), mix of background + foreground
+        */
+
+       /* set cursor FB to background first */
+       igt_paint_color_alpha(cr, 0, 0, size, size, 1.0, 1.0, 1.0, .0);
+
+       /*
+        * draw cursur pattern w/ alpha set to 1
+        * - 1. draw triangle part
+        * - 2. draw rectangle part
+        */
+       for (x =3D y =3D 0, line_w =3D size / 2; line_w > 0; ++y, --line_w)
+               igt_paint_color_alpha(cr, x, y, line_w, 1, r, g, b, 1.0);
+
+       /*
+        * draw rectangle part, split into three geometry parts
+        * - triangle
+        * - rhombus
+        * - reversed triangle
+        */
+       for (x =3D size * 3 / 8, y =3D size / 8, line_w =3D 1; y < size * 3=
 / 8; --x, ++y, line_w +=3D 2)
+               igt_paint_color_alpha(cr, x, y, line_w, 1, r, g, b, 1.0);
+
+       for (x =3D size / 8, y =3D size * 3 / 8; y < size * 3 / 4; ++x, ++y=
)
+               igt_paint_color_alpha(cr, x, y, line_w, 1, r, g, b, 1.0);
+
+       for (; line_w > 0; ++x, ++y, line_w -=3D 2)
+               igt_paint_color_alpha(cr, x, y, line_w, 1, r, g, b, 1.0);
+
+       cairo_set_operator(cr, CAIRO_OPERATOR_OVER);
+
+       igt_put_cairo_ctx(cr);
+}
+
 /* Common test setup. */
 static void test_init(data_t *data)
 {
--
2.25.1


--_000_CH0PR12MB52848E95A39A26C10E5A47C18BF89CH0PR12MB5284namp_
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
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
This series is:
<div><br>
</div>
Reviewed-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Zhang, Dingchen (Davi=
d) &lt;Dingchen.Zhang@amd.com&gt;<br>
<b>Sent:</b> Monday, April 25, 2022 11:36 AM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; Wentland, Ha=
rry &lt;Harry.Wentland@amd.com&gt;; Li, Sun peng (Leo) &lt;Sunpeng.Li@amd.c=
om&gt;; Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; Lin, Wayne &lt;=
Wayne.Lin@amd.com&gt;<br>
<b>Subject:</b> [PATCH v3 1/4] tests/amdgpu/amd_psr: add helper to draw cur=
sor pattern</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[why &amp; how]<br>
For amdgpu PSR-SU validation, we'd create and test cursor update<br>
use case as well. To emulate a mouse-like cursor movement, we'd<br>
define a helper to draw a cursor pattern.<br>
<br>
- helper draw the cursor pattern as an 45-degrees rotated arrow<br>
- for the region of arrow, set alpha to 1 to make cursor foreground<br>
&nbsp; and always on the top<br>
- for rest of the non-arrow region, set alpha to 0 to make it as<br>
&nbsp; background<br>
<br>
Cc: Rodrigo Siqueira &lt;rodrigo.siqueira@amd.com&gt;<br>
Cc: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
Cc: Leo Li &lt;sunpeng.li@amd.com&gt;<br>
Cc: Jay Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
Cc: Wayne Lin &lt;wayne.lin@amd.com&gt;<br>
<br>
Signed-off-by: David Zhang &lt;dingchen.zhang@amd.com&gt;<br>
---<br>
&nbsp;tests/amdgpu/amd_psr.c | 47 +++++++++++++++++++++++++++++++++++++++++=
+<br>
&nbsp;1 file changed, 47 insertions(+)<br>
<br>
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c<br>
index d4bfb7bb..e3a2cb4a 100644<br>
--- a/tests/amdgpu/amd_psr.c<br>
+++ b/tests/amdgpu/amd_psr.c<br>
@@ -81,6 +81,53 @@ static void draw_color_alpha(igt_fb_t *fb, int x, int y,=
 int w, int h,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_put_cairo_ctx(cr);<br>
&nbsp;}<br>
&nbsp;<br>
+/* draw a cursor pattern assuming the FB given is square w/ FORMAT ARGB */=
<br>
+static void draw_color_cursor(igt_fb_t *fb, int size, double r, double g, =
double b)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cairo_t *cr =3D igt_get_cairo_ctx(fb-=
&gt;fd, fb);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int x, y, line_w;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cairo_set_operator(cr, CAIRO_OPERATOR=
_SOURCE);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * draw cursor<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * recall that alpha blending va=
lue:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - 0, output pixel is the back=
ground<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - 1, output pixel is simply t=
he foreground<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - (0, 1), mix of background +=
 foreground<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* set cursor FB to background first =
*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_paint_color_alpha(cr, 0, 0, size,=
 size, 1.0, 1.0, 1.0, .0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * draw cursur pattern w/ alpha =
set to 1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - 1. draw triangle part<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - 2. draw rectangle part<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (x =3D y =3D 0, line_w =3D size /=
 2; line_w &gt; 0; ++y, --line_w)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_paint_color_alpha(cr, x, y, line_w, 1, r, g, b, 1.0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * draw rectangle part, split in=
to three geometry parts<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - triangle<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - rhombus<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - reversed triangle<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (x =3D size * 3 / 8, y =3D size /=
 8, line_w =3D 1; y &lt; size * 3 / 8; --x, ++y, line_w +=3D 2)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_paint_color_alpha(cr, x, y, line_w, 1, r, g, b, 1.0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (x =3D size / 8, y =3D size * 3 /=
 8; y &lt; size * 3 / 4; ++x, ++y)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_paint_color_alpha(cr, x, y, line_w, 1, r, g, b, 1.0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (; line_w &gt; 0; ++x, ++y, line_=
w -=3D 2)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_paint_color_alpha(cr, x, y, line_w, 1, r, g, b, 1.0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cairo_set_operator(cr, CAIRO_OPERATOR=
_OVER);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_put_cairo_ctx(cr);<br>
+}<br>
+<br>
&nbsp;/* Common test setup. */<br>
&nbsp;static void test_init(data_t *data)<br>
&nbsp;{<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH0PR12MB52848E95A39A26C10E5A47C18BF89CH0PR12MB5284namp_--
