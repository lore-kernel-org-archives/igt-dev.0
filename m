Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DE36E5B4
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Nov 2021 20:25:52 +0000 (UTC)
From: "Lipski, Mikita" <Mikita.Lipski@amd.com>
Date: Tue, 30 Nov 2021 20:25:49 +0000
Message-ID: <DM4PR12MB53599677CC674F82D15CE237E4679@DM4PR12MB5359.namprd12.prod.outlook.com>
References: <20211129193857.1863174-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211129193857.1863174-1-Rodrigo.Siqueira@amd.com>
Content-Language: en-CA
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB53599677CC674F82D15CE237E4679DM4PR12MB5359namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/amdgpu: add test for panel self
 refresh
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, "markyacoub@google.com" <markyacoub@google.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>, "Choi, Nicholas" <Nicholas.Choi@amd.com>, "Goodfellow, Hayden" <Hayden.Goodfellow@amd.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_DM4PR12MB53599677CC674F82D15CE237E4679DM4PR12MB5359namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Acked-by: Mikita Lipski <Mikita.Lipski@amd.com>

Thanks,
Mikita
________________________________
From: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
Sent: Monday, November 29, 2021 2:39 PM
To: Wentland, Harry; markyacoub@google.com; Lipski, Mikita; Pillai, Aurabin=
do; Choi, Nicholas; Goodfellow, Hayden
Cc: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/amdgpu: add test for panel self refresh

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

[Why&How]
Test for PSR functionality. With an eDP connected, it tests whether PSR
is enabled by commiting a static framebuffer

hardware requirements:
1. eDP panel that supports PSR (multiple panel can be connected at the
   same time)
2. Optional DP display for testing a regression condition (setting crtc
   to null)

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/amdgpu/amd_psr.c   | 221 +++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |   1 +
 2 files changed, 222 insertions(+)
 create mode 100644 tests/amdgpu/amd_psr.c

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
new file mode 100644
index 00000000..732eab25
--- /dev/null
+++ b/tests/amdgpu/amd_psr.c
@@ -0,0 +1,221 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software=
"),
+ * to deal in the Software without restriction, including without limitati=
on
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense=
,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHAL=
L
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES O=
R
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "drm_mode.h"
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_kms.h"
+#include <stdint.h>
+#include <fcntl.h>
+#include <xf86drmMode.h>
+
+/* hardware requirements:
+ * 1. eDP panel that supports PSR (multiple panel can be connected at the =
same time)
+ * 2. Optional DP display for testing a regression condition (setting crtc=
 to null)
+ */
+IGT_TEST_DESCRIPTION("Basic test for enabling Panel Self Refresh for eDP d=
isplays");
+
+#define DEBUGFS_PSR_STATE "psr_state"
+/* After a full update, a few fast updates are necessary for PSR to be ena=
bled */
+#define N_FLIPS 6
+/* DMCUB takes some time to actually enable PSR. Worst case delay is 4 sec=
onds */
+#define PSR_SETTLE_DELAY 4
+
+/* Common test data. */
+typedef struct data {
+        igt_display_t display;
+        igt_plane_t *primary;
+        igt_plane_t *cursor;
+        igt_output_t *output;
+        igt_pipe_t *pipe;
+        igt_pipe_crc_t *pipe_crc;
+        drmModeModeInfo *mode;
+        enum pipe pipe_id;
+        int fd;
+        int w;
+        int h;
+} data_t;
+
+/* Common test setup. */
+static void test_init(data_t *data)
+{
+        igt_display_t *display =3D &data->display;
+
+        /* It doesn't matter which pipe we choose on amdpgu. */
+        data->pipe_id =3D PIPE_A;
+        data->pipe =3D &data->display.pipes[data->pipe_id];
+
+        igt_display_reset(display);
+
+        data->output =3D igt_get_single_output_for_pipe(display, data->pip=
e_id);
+        igt_require(data->output);
+
+        data->mode =3D igt_output_get_mode(data->output);
+        igt_assert(data->mode);
+
+        data->primary =3D
+                igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY=
);
+
+        data->cursor =3D
+                igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR)=
;
+
+        data->pipe_crc =3D igt_pipe_crc_new(data->fd, data->pipe_id, "auto=
");
+
+        igt_output_set_pipe(data->output, data->pipe_id);
+
+        data->w =3D data->mode->hdisplay;
+        data->h =3D data->mode->vdisplay;
+}
+/* Common test cleanup. */
+static void test_fini(data_t *data)
+{
+        igt_display_t *display =3D &data->display;
+
+        igt_pipe_crc_free(data->pipe_crc);
+        igt_display_reset(display);
+        igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, =
0);
+}
+
+static int check_conn_type(data_t *data, uint32_t type) {
+       int i;
+
+       for (i =3D 0; i < data->display.n_outputs; i++) {
+               uint32_t conn_type =3D data->display.outputs[i].config.conn=
ector->connector_type;
+               if (conn_type =3D=3D type)
+                       return i;
+       }
+
+       return -1;
+}
+
+static void run_check_psr(data_t *data, bool test_null_crtc) {
+       char buf[8];
+       char *connector_name;
+       int fd, edp_idx, dp_idx, ret, i, psr_state;
+       igt_fb_t ref_fb, ref_fb2;
+       igt_fb_t *flip_fb;
+       enum pipe pipe;
+       igt_output_t *output;
+
+       test_init(data);
+
+       edp_idx =3D check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
+       dp_idx =3D check_conn_type(data, DRM_MODE_CONNECTOR_DisplayPort);
+       igt_skip_on_f(edp_idx =3D=3D -1, "no eDP connector found\n");
+
+       for_each_pipe_with_single_output(&data->display, pipe, output) {
+               if (output->config.connector->connector_type !=3D DRM_MODE_=
CONNECTOR_eDP)
+                       continue;
+
+               igt_create_color_fb(data->fd, data->mode->hdisplay,
+                                   data->mode->vdisplay, DRM_FORMAT_XRGB88=
88, 0, 1.0,
+                                   0.0, 0.0, &ref_fb);
+               igt_create_color_fb(data->fd, data->mode->hdisplay,
+                                   data->mode->vdisplay, DRM_FORMAT_XRGB88=
88, 0, 0.0,
+                                   1.0, 0.0, &ref_fb2);
+
+               igt_plane_set_fb(data->primary, &ref_fb);
+               igt_output_set_pipe(output, pipe);
+               igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_A=
LLOW_MODESET, 0);
+
+               for (i =3D 0; i < N_FLIPS; i++) {
+                       if (i % 2 =3D=3D 0)
+                               flip_fb =3D &ref_fb2;
+                       else
+                               flip_fb =3D &ref_fb;
+
+                       ret =3D drmModePageFlip(data->fd, output->config.cr=
tc->crtc_id,
+                                             flip_fb->fb_id, DRM_MODE_PAGE=
_FLIP_EVENT, NULL);
+                       igt_require(ret =3D=3D 0);
+                       kmstest_wait_for_pageflip(data->fd);
+               }
+       }
+
+       /* PSR state takes some time to settle its value on static screen *=
/
+       sleep(PSR_SETTLE_DELAY);
+
+       for_each_pipe_with_single_output(&data->display, pipe, output) {
+               if (output->config.connector->connector_type !=3D DRM_MODE_=
CONNECTOR_eDP)
+                       continue;
+
+               connector_name =3D output->name;
+               fd =3D igt_debugfs_connector_dir(data->fd, connector_name, =
O_RDONLY);
+               igt_assert(fd >=3D 0);
+
+               ret =3D igt_debugfs_simple_read(fd, DEBUGFS_PSR_STATE, buf,=
 sizeof(buf));
+               igt_require(ret > 0);
+
+               psr_state =3D  (int) strtol(buf, NULL, 10);
+               igt_fail_on_f(psr_state < 1, "PSR was not enabled for conne=
ctor %s\n", output->name);
+               igt_fail_on_f(psr_state =3D=3D 0xff, "PSR is invalid for co=
nnector %s\n", output->name);
+               igt_fail_on_f(psr_state !=3D 5, "PSR state is expected to b=
e at 5 on a "
+                             "static screen for connector %s\n", output->n=
ame);
+       }
+
+       if (test_null_crtc) {
+               /* check whether settings crtc to null generated any warnin=
g (eDP+DP) */
+               igt_skip_on_f(dp_idx =3D=3D -1, "no DP connector found\n");
+
+               for_each_pipe_with_single_output(&data->display, pipe, outp=
ut) {
+                       if (output->config.connector->connector_type !=3D D=
RM_MODE_CONNECTOR_DisplayPort)
+                               continue;
+
+                       igt_output_set_pipe(output, PIPE_NONE);
+                       igt_display_commit2(&data->display, COMMIT_ATOMIC);
+               }
+       }
+
+       igt_remove_fb(data->fd, &ref_fb);
+       igt_remove_fb(data->fd, &ref_fb2);
+       close(fd);
+       test_fini(data);
+}
+
+igt_main
+{
+       data_t data;
+
+       igt_skip_on_simulation();
+       memset(&data, 0, sizeof(data));
+
+       igt_fixture
+       {
+               data.fd =3D drm_open_driver_master(DRIVER_AMDGPU);
+
+               kmstest_set_vt_graphics_mode();
+
+               igt_display_require(&data.display, data.fd);
+               igt_require(&data.display.is_atomic);
+               igt_display_require_output(&data.display);
+       }
+
+       igt_describe("Test whether PSR can be enabled with static screen");
+       igt_subtest("psr_enable") run_check_psr(&data, false);
+
+       igt_describe("Test whether setting CRTC to null triggers any warnin=
g with PSR enabled");
+       igt_subtest("psr_enable_null_crtc") run_check_psr(&data, true);
+
+       igt_fixture
+       {
+               igt_display_fini(&data.display);
+       }
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 5216e194..2bd25ad6 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -17,6 +17,7 @@ if libdrm_amdgpu.found()
                           'amd_link_settings',
                           'amd_vrr_range',
                           'amd_mode_switch',
+                         'amd_psr',
                         ]
         amdgpu_deps +=3D libdrm_amdgpu
 endif
--
2.25.1


--_000_DM4PR12MB53599677CC674F82D15CE237E4679DM4PR12MB5359namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr" style=3D"">
<div></div>
<div style=3D"">
<div dir=3D"ltr">Acked-by: Mikita Lipski &lt;Mikita.Lipski@amd.com&gt;</div=
>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
<div style=3D"direction:ltr">Thanks,</div>
<div style=3D"direction:ltr">Mikita </div>
</div>
</div>
</div>
<div id=3D"id-0e073774-24b9-4cff-aee5-2e0f95645a6f" class=3D"ms-outlook-mob=
ile-reference-message">
<hr style=3D"display: inline-block; width: 98%; font-family: -webkit-standa=
rd; font-size: 12pt; color: rgb(0, 0, 0);" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif"><b=
>From:</b> Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;<br>
<b>Sent:</b> Monday, November 29, 2021 2:39 PM<br>
<b>To:</b> Wentland, Harry; markyacoub@google.com; Lipski, Mikita; Pillai, =
Aurabindo; Choi, Nicholas; Goodfellow, Hayden<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org<br>
<b>Subject:</b> [PATCH i-g-t] tests/amdgpu: add test for panel self refresh
<div>&nbsp;</div>
</font></div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Aurabindo Pillai &lt;aurabindo.pillai@amd.co=
m&gt;<br>
<br>
[Why&amp;How]<br>
Test for PSR functionality. With an eDP connected, it tests whether PSR<br>
is enabled by commiting a static framebuffer<br>
<br>
hardware requirements:<br>
1. eDP panel that supports PSR (multiple panel can be connected at the<br>
&nbsp;&nbsp; same time)<br>
2. Optional DP display for testing a regression condition (setting crtc<br>
&nbsp;&nbsp; to null)<br>
<br>
Signed-off-by: Rodrigo Siqueira &lt;Rodrigo.Siqueira@amd.com&gt;<br>
Signed-off-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
---<br>
&nbsp;tests/amdgpu/amd_psr.c&nbsp;&nbsp; | 221 ++++++++++++++++++++++++++++=
+++++++++++<br>
&nbsp;tests/amdgpu/meson.build |&nbsp;&nbsp; 1 +<br>
&nbsp;2 files changed, 222 insertions(+)<br>
&nbsp;create mode 100644 tests/amdgpu/amd_psr.c<br>
<br>
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c<br>
new file mode 100644<br>
index 00000000..732eab25<br>
--- /dev/null<br>
+++ b/tests/amdgpu/amd_psr.c<br>
@@ -0,0 +1,221 @@<br>
+/*<br>
+ * Copyright 2021 Advanced Micro Devices, Inc.<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
<br>
+ * copy of this software and associated documentation files (the &quot;Sof=
tware&quot;),<br>
+ * to deal in the Software without restriction, including without limitati=
on<br>
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense=
,<br>
+ * and/or sell copies of the Software, and to permit persons to whom the<b=
r>
+ * Software is furnished to do so, subject to the following conditions:<br=
>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO EVENT=
 SHALL<br>
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES O=
R<br>
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,<b=
r>
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR<b=
r>
+ * OTHER DEALINGS IN THE SOFTWARE.<br>
+ */<br>
+<br>
+#include &quot;drm_mode.h&quot;<br>
+#include &quot;igt.h&quot;<br>
+#include &quot;igt_core.h&quot;<br>
+#include &quot;igt_kms.h&quot;<br>
+#include &lt;stdint.h&gt;<br>
+#include &lt;fcntl.h&gt;<br>
+#include &lt;xf86drmMode.h&gt;<br>
+<br>
+/* hardware requirements:<br>
+ * 1. eDP panel that supports PSR (multiple panel can be connected at the =
same time)<br>
+ * 2. Optional DP display for testing a regression condition (setting crtc=
 to null)<br>
+ */<br>
+IGT_TEST_DESCRIPTION(&quot;Basic test for enabling Panel Self Refresh for =
eDP displays&quot;);<br>
+<br>
+#define DEBUGFS_PSR_STATE &quot;psr_state&quot;<br>
+/* After a full update, a few fast updates are necessary for PSR to be ena=
bled */<br>
+#define N_FLIPS 6<br>
+/* DMCUB takes some time to actually enable PSR. Worst case delay is 4 sec=
onds */<br>
+#define PSR_SETTLE_DELAY 4<br>
+<br>
+/* Common test data. */<br>
+typedef struct data {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t display;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *primary;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *cursor;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_t *pipe;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_t *pipe_crc;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *mode;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum pipe pipe_id;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int w;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int h;<br>
+} data_t;<br>
+<br>
+/* Common test setup. */<br>
+static void test_init(data_t *data)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D &amp=
;data-&gt;display;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* It doesn't matter which pipe=
 we choose on amdpgu. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;pipe_id =3D PIPE_A;<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;pipe =3D &amp;data-&gt=
;display.pipes[data-&gt;pipe_id];<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_reset(display);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;output =3D igt_get_sin=
gle_output_for_pipe(display, data-&gt;pipe_id);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(data-&gt;output);<b=
r>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;mode =3D igt_output_ge=
t_mode(data-&gt;output);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(data-&gt;mode);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;primary =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; igt_pipe_get_plane_type(data-&gt;pipe, DRM_PLANE_TYPE_PRIM=
ARY);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;cursor =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; igt_pipe_get_plane_type(data-&gt;pipe, DRM_PLANE_TYPE_CURS=
OR);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;pipe_crc =3D igt_pipe_=
crc_new(data-&gt;fd, data-&gt;pipe_id, &quot;auto&quot;);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_pipe(data-&gt;ou=
tput, data-&gt;pipe_id);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;w =3D data-&gt;mode-&g=
t;hdisplay;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;h =3D data-&gt;mode-&g=
t;vdisplay;<br>
+}<br>
+/* Common test cleanup. */<br>
+static void test_fini(data_t *data)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D &amp=
;data-&gt;display;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_free(data-&gt;pipe=
_crc);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_reset(display);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit_atomic(displ=
ay, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);<br>
+}<br>
+<br>
+static int check_conn_type(data_t *data, uint32_t type) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; data-&gt;display=
.n_outputs; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; uint32_t conn_type =3D data-&gt;display.outputs[i].config.connec=
tor-&gt;connector_type;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (conn_type =3D=3D type)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return i;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
+}<br>
+<br>
+static void run_check_psr(data_t *data, bool test_null_crtc) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buf[8];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *connector_name;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd, edp_idx, dp_idx, ret, i, psr_=
state;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fb_t ref_fb, ref_fb2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fb_t *flip_fb;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum pipe pipe;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_init(data);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; edp_idx =3D check_conn_type(data, DRM=
_MODE_CONNECTOR_eDP);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dp_idx =3D check_conn_type(data, DRM_=
MODE_CONNECTOR_DisplayPort);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on_f(edp_idx =3D=3D -1, &quo=
t;no eDP connector found\n&quot;);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe_with_single_output(&amp=
;data-&gt;display, pipe, output) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (output-&gt;config.connector-&gt;connector_type !=3D DRM_MODE=
_CONNECTOR_eDP)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_create_color_fb(data-&gt;fd, data-&gt;mode-&gt;hdisplay,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;mode-&gt;v=
display, DRM_FORMAT_XRGB8888, 0, 1.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.0, 0.0, &amp;ref_=
fb);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_create_color_fb(data-&gt;fd, data-&gt;mode-&gt;hdisplay,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;mode-&gt;v=
display, DRM_FORMAT_XRGB8888, 0, 0.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.0, 0.0, &amp;ref_=
fb2);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_plane_set_fb(data-&gt;primary, &amp;ref_fb);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_output_set_pipe(output, pipe);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_display_commit_atomic(&amp;data-&gt;display, DRM_MODE_ATOMIC=
_ALLOW_MODESET, 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (i =3D 0; i &lt; N_FLIPS; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (i % 2 =3D=3D=
 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flip_fb =3D &amp;ref_fb2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flip_fb =3D &amp;ref_fb;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drmModeP=
ageFlip(data-&gt;fd, output-&gt;config.crtc-&gt;crtc_id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flip_fb-&gt;fb_id, DRM_MODE_PAGE_F=
LIP_EVENT, NULL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(ret =
=3D=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_wait_for=
_pageflip(data-&gt;fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* PSR state takes some time to settl=
e its value on static screen */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sleep(PSR_SETTLE_DELAY);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe_with_single_output(&amp=
;data-&gt;display, pipe, output) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (output-&gt;config.connector-&gt;connector_type !=3D DRM_MODE=
_CONNECTOR_eDP)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; connector_name =3D output-&gt;name;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fd =3D igt_debugfs_connector_dir(data-&gt;fd, connector_name, O_=
RDONLY);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(fd &gt;=3D 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D igt_debugfs_simple_read(fd, DEBUGFS_PSR_STATE, buf, size=
of(buf));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_require(ret &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; psr_state =3D&nbsp; (int) strtol(buf, NULL, 10);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_fail_on_f(psr_state &lt; 1, &quot;PSR was not enabled for co=
nnector %s\n&quot;, output-&gt;name);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_fail_on_f(psr_state =3D=3D 0xff, &quot;PSR is invalid for co=
nnector %s\n&quot;, output-&gt;name);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_fail_on_f(psr_state !=3D 5, &quot;PSR state is expected to b=
e at 5 on a &quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &quot;static screen for connector %s\n&quot;, output-&g=
t;name);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (test_null_crtc) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* check whether settings crtc to null generated any warning (eD=
P+DP) */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_skip_on_f(dp_idx =3D=3D -1, &quot;no DP connector found\n&qu=
ot;);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for_each_pipe_with_single_output(&amp;data-&gt;display, pipe, ou=
tput) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (output-&gt;c=
onfig.connector-&gt;connector_type !=3D DRM_MODE_CONNECTOR_DisplayPort)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_p=
ipe(output, PIPE_NONE);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_comm=
it2(&amp;data-&gt;display, COMMIT_ATOMIC);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_remove_fb(data-&gt;fd, &amp;ref_f=
b);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_remove_fb(data-&gt;fd, &amp;ref_f=
b2);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_fini(data);<br>
+}<br>
+<br>
+igt_main<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data_t data;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on_simulation();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;data, 0, sizeof(data));<b=
r>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; data.fd =3D drm_open_driver_master(DRIVER_AMDGPU);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; kmstest_set_vt_graphics_mode();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_display_require(&amp;data.display, data.fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_require(&amp;data.display.is_atomic);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_display_require_output(&amp;data.display);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Test whether PSR c=
an be enabled with static screen&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;psr_enable&quot;) r=
un_check_psr(&amp;data, false);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Test whether setti=
ng CRTC to null triggers any warning with PSR enabled&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;psr_enable_null_crt=
c&quot;) run_check_psr(&amp;data, true);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_display_fini(&amp;data.display);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+}<br>
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build<br>
index 5216e194..2bd25ad6 100644<br>
--- a/tests/amdgpu/meson.build<br>
+++ b/tests/amdgpu/meson.build<br>
@@ -17,6 +17,7 @@ if libdrm_amdgpu.found()<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 'amd_link_settings',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 'amd_vrr_range',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 'amd_mode_switch',<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'amd=
_psr',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_deps +=3D libdrm_am=
dgpu<br>
&nbsp;endif<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_DM4PR12MB53599677CC674F82D15CE237E4679DM4PR12MB5359namp_--
