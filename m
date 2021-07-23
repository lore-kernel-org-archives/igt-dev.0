Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472CC6EB0A
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jul 2021 13:43:49 +0000 (UTC)
From: "R, Bindu" <Bindu.R@amd.com>
Date: Fri, 23 Jul 2021 13:43:47 +0000
Message-ID: <DM4PR12MB512068E13A4DF62D80C339D5F5E59@DM4PR12MB5120.namprd12.prod.outlook.com>
References: <20210722215448.654382-1-bindu.r@amd.com>,
 <20210723133304.u5zwqu2q7nigoewt@outlook.office365.com>
In-Reply-To: <20210723133304.u5zwqu2q7nigoewt@outlook.office365.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2] tests/kms_bw: New test for bandwidth
 validation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0669898458=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "petri.latvala@intel.com" <petri.latvala@intel.com>, "arek@hiler.eu" <arek@hiler.eu>
Cc: "Jacob, Anson" <Anson.Jacob@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Choi,
 Nicholas" <Nicholas.Choi@amd.com>, "markyacoub@google.com" <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0669898458==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM4PR12MB512068E13A4DF62D80C339D5F5E59DM4PR12MB5120namp_"

--_000_DM4PR12MB512068E13A4DF62D80C339D5F5E59DM4PR12MB5120namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

This is awaiting moderators' review, after the approval may be the CI would=
 be triggered.

Thanks,
Bindu
________________________________
From: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
Sent: Friday, July 23, 2021 9:33 AM
To: R, Bindu <Bindu.R@amd.com>; petri.latvala@intel.com <petri.latvala@inte=
l.com>; arek@hiler.eu <arek@hiler.eu>
Cc: markyacoub@google.com <markyacoub@google.com>; igt-dev@lists.freedeskto=
p.org <igt-dev@lists.freedesktop.org>; Wentland, Harry <Harry.Wentland@amd.=
com>; Jacob, Anson <Anson.Jacob@amd.com>; Pillai, Aurabindo <Aurabindo.Pill=
ai@amd.com>; Choi, Nicholas <Nicholas.Choi@amd.com>
Subject: Re: [PATCH v2] tests/kms_bw: New test for bandwidth validation

For some reason, I don't see this patch in the patchwork and in the
igt-dev mailing list. Did the CI run in this patch? Any idea on what
happened here?

Thanks
Siqueira

On 07/22, Bindu Ramamurthy wrote:
> From: Aurabindo Pillai <aurabindo.pillai@amd.com>
>
> Add linear tiling mode tests
>
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Acked-by: Bindu Ramamurthy <bindu.r@amd.com>
> ---
>
> Changes since v2:
>    Test added as generic IGT.
>
>
>  tests/kms_bw.c    | 250 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build |   1 +
>  2 files changed, 251 insertions(+)
>  create mode 100644 tests/kms_bw.c
>
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> new file mode 100644
> index 00000000..65b97c98
> --- /dev/null
> +++ b/tests/kms_bw.c
> @@ -0,0 +1,250 @@
> +/*
> + * Copyrights 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "drm_mode.h"
> +#include "igt.h"
> +#include "drm.h"
> +#include <stdio.h>
> +#include <xf86drmMode.h>
> +
> +/* Maximum pipes on any ASIC. */
> +#define MAX_PIPES 6
> +
> +/* Common test data. */
> +typedef struct data {
> +        igt_display_t display;
> +        igt_plane_t *primary[MAX_PIPES];
> +        igt_output_t *output[MAX_PIPES];
> +        igt_pipe_t *pipe[MAX_PIPES];
> +        igt_pipe_crc_t *pipe_crc[MAX_PIPES];
> +        drmModeModeInfo mode[MAX_PIPES];
> +        enum pipe pipe_id[MAX_PIPES];
> +        int w[MAX_PIPES];
> +        int h[MAX_PIPES];
> +        int fd;
> +} data_t;
> +
> +static const drmModeModeInfo test_mode_1 =3D {
> +     .name =3D "1920x1080p\0",
> +     .vrefresh =3D 60,
> +     .clock =3D 173000,
> +     .hdisplay =3D 1920,
> +     .hsync_start =3D 2048,
> +     .hsync_end =3D 2248,
> +     .htotal =3D 2576,
> +     .vdisplay =3D 1080,
> +     .vsync_start =3D 1083,
> +     .vsync_end =3D 1088,
> +     .vtotal =3D 1120,
> +     .type =3D 0x40,
> +     .flags =3D DRM_MODE_FLAG_NHSYNC,
> +     .hskew =3D 0,
> +     .vscan =3D 0,
> +};
> +
> +static const drmModeModeInfo test_mode_2 =3D {
> +     .name =3D "2560x1440p\0",
> +     .vrefresh =3D 60,
> +     .clock =3D 312250,
> +     .hdisplay =3D 2560,
> +     .hsync_start =3D 2752,
> +     .hsync_end =3D 3024,
> +     .htotal =3D 3488,
> +     .vdisplay =3D 1440,
> +     .vsync_start =3D 1443,
> +     .vsync_end =3D 1448,
> +     .vtotal =3D 1493,
> +     .type =3D 0x40,
> +     .flags =3D DRM_MODE_FLAG_NHSYNC,
> +     .hskew =3D 0,
> +     .vscan =3D 0,
> +};
> +
> +static const drmModeModeInfo test_mode_3 =3D {
> +     .name =3D "3840x2160p\0",
> +     .vrefresh =3D 60,
> +     .clock =3D 533000,
> +     .hdisplay =3D 3840,
> +     .hsync_start =3D 3888,
> +     .hsync_end =3D 3920,
> +     .htotal =3D 4000,
> +     .vdisplay =3D 2160,
> +     .vsync_start =3D 2163,
> +     .vsync_end =3D 2168,
> +     .vtotal =3D 2222,
> +     .type =3D 0x40,
> +     .flags =3D DRM_MODE_FLAG_NHSYNC,
> +     .hskew =3D 0,
> +     .vscan =3D 0,
> +};
> +
> +static void test_init(data_t *data)
> +{
> +     igt_display_t *display =3D &data->display;
> +     int i, max_pipes =3D display->n_pipes;
> +
> +     for_each_pipe(display, i) {
> +             data->pipe_id[i] =3D PIPE_A + i;
> +             data->pipe[i] =3D &data->display.pipes[data->pipe_id[i]];
> +             data->primary[i] =3D igt_pipe_get_plane_type(
> +                     data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
> +             data->pipe_crc[i] =3D
> +                     igt_pipe_crc_new(data->fd, data->pipe_id[i], "auto"=
);
> +     }
> +
> +     for (i =3D 0; i < display->n_outputs && i < max_pipes; i++) {
> +             igt_output_t *output =3D &display->outputs[i];
> +
> +             data->output[i] =3D output;
> +
> +             /* Only allow physically connected displays for the tests. =
*/
> +             if (!igt_output_is_connected(output))
> +                     continue;
> +
> +             igt_assert(kmstest_get_connector_default_mode(
> +                     data->fd, output->config.connector, &data->mode[i])=
);
> +
> +             data->w[i] =3D data->mode[i].hdisplay;
> +             data->h[i] =3D data->mode[i].vdisplay;
> +     }
> +
> +
> +     igt_require(data->output[0]);
> +     igt_display_reset(display);
> +}
> +
> +static void test_fini(data_t *data)
> +{
> +     igt_display_t *display =3D &data->display;
> +     int i;
> +
> +     for_each_pipe(display, i) {
> +             igt_pipe_crc_free(data->pipe_crc[i]);
> +     }
> +
> +     igt_display_reset(display);
> +     igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0=
);
> +}
> +
> +/* Forces a mode for a connector. */
> +static void force_output_mode(data_t *d, igt_output_t *output,
> +                           const drmModeModeInfo *mode)
> +{
> +     /* This allows us to create a virtual sink. */
> +     if (!igt_output_is_connected(output)) {
> +             kmstest_force_edid(d->fd, output->config.connector,
> +                                igt_kms_get_4k_edid());
> +
> +             kmstest_force_connector(d->fd, output->config.connector,
> +                                     FORCE_CONNECTOR_DIGITAL);
> +     }
> +
> +     igt_output_override_mode(output, mode);
> +}
> +
> +static void run_test_linear_tiling(data_t *data, int pipe, const drmMode=
ModeInfo *mode) {
> +     igt_display_t *display =3D &data->display;
> +     igt_output_t *output;
> +     struct igt_fb buffer[MAX_PIPES];
> +     igt_crc_t zero, captured[MAX_PIPES];
> +     void *user_data =3D NULL;
> +     int ret;
> +     int i =3D 0;
> +
> +     test_init(data);
> +
> +     igt_skip_on_f(pipe >=3D igt_display_get_n_pipes(display),
> +                   "ASIC does not have %d pipes\n", pipe);
> +
> +     /* create buffers */
> +     for (i =3D 0; i <=3D pipe; i++) {
> +
> +             output =3D data->output[i];
> +             if (!output) {
> +                     continue;
> +             }
> +
> +             force_output_mode(data, output, mode);
> +
> +             igt_create_color_fb(display->drm_fd, test_mode_1.hdisplay,
> +                                 test_mode_1.vdisplay, DRM_FORMAT_XRGB88=
88,
> +                                 DRM_FORMAT_MOD_NONE, 1.f, 0.f, 0.f,
> +                                 &buffer[i]);
> +
> +             igt_output_set_pipe(output, i);
> +
> +             igt_plane_set_fb(data->primary[i], &buffer[i]);
> +     }
> +
> +     ret =3D igt_display_try_commit_atomic(
> +             display, DRM_MODE_ATOMIC_ALLOW_MODESET, user_data);
> +
> +     igt_assert_f(ret >=3D 0, "Modeset failed\n");
> +
> +     for (i =3D 0; i <=3D pipe; i++) {
> +             igt_pipe_crc_collect_crc(data->pipe_crc[i], &captured[i]);
> +             igt_assert_f(!igt_check_crc_equal(&zero, &captured[i]),
> +                          "CRC is zero\n");
> +             igt_remove_fb(display->drm_fd, &buffer[i]);
> +     }
> +
> +     test_fini(data);
> +}
> +
> +igt_main
> +{
> +     data_t data;
> +     int i =3D 0;
> +
> +     igt_skip_on_simulation();
> +
> +     memset(&data, 0, sizeof(data));
> +
> +     igt_fixture
> +     {
> +             data.fd =3D drm_open_driver_master(DRIVER_ANY);
> +
> +             kmstest_set_vt_graphics_mode();
> +
> +             igt_display_require(&data.display, data.fd);
> +             igt_require(&data.display.is_atomic);
> +             igt_display_require_output(&data.display);
> +
> +     }
> +
> +     for (i =3D 0; i < MAX_PIPES; i++) {
> +             igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
> +                           test_mode_1.name)
> +                     run_test_linear_tiling(&data, i, &test_mode_1);
> +             igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
> +                           test_mode_2.name)
> +                     run_test_linear_tiling(&data, i, &test_mode_2);
> +             igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
> +                           test_mode_3.name)
> +                     run_test_linear_tiling(&data, i, &test_mode_3);
> +     }
> +
> +     igt_fixture
> +     {
> +             igt_display_fini(&data.display);
> +     }
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 1bdfddbb..6d1ebe42 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -22,6 +22,7 @@ test_progs =3D [
>        'kms_big_fb',
>        'kms_big_joiner' ,
>        'kms_busy',
> +     'kms_bw',
>        'kms_ccs',
>        'kms_cdclk',
>        'kms_concurrent',
> --
> 2.25.1
>

--
Rodrigo Siqueira
https://siqueira.tech

--_000_DM4PR12MB512068E13A4DF62D80C339D5F5E59DM4PR12MB5120namp_
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
<span style=3D"font-size: 11pt;">This is awaiting moderators' review, after=
 the approval may be the CI would be triggered.
<br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-size: 11pt;"></span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Thanks,</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Bindu </span></font><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Siqueira, Rodrigo &lt=
;Rodrigo.Siqueira@amd.com&gt;<br>
<b>Sent:</b> Friday, July 23, 2021 9:33 AM<br>
<b>To:</b> R, Bindu &lt;Bindu.R@amd.com&gt;; petri.latvala@intel.com &lt;pe=
tri.latvala@intel.com&gt;; arek@hiler.eu &lt;arek@hiler.eu&gt;<br>
<b>Cc:</b> markyacoub@google.com &lt;markyacoub@google.com&gt;; igt-dev@lis=
ts.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt;; Wentland, Harry &=
lt;Harry.Wentland@amd.com&gt;; Jacob, Anson &lt;Anson.Jacob@amd.com&gt;; Pi=
llai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; Choi, Nicholas
 &lt;Nicholas.Choi@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH v2] tests/kms_bw: New test for bandwidth validat=
ion</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">For some reason, I don't see this patch in the pat=
chwork and in the<br>
igt-dev mailing list. Did the CI run in this patch? Any idea on what<br>
happened here?<br>
<br>
Thanks<br>
Siqueira<br>
<br>
On 07/22, Bindu Ramamurthy wrote:<br>
&gt; From: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
&gt; <br>
&gt; Add linear tiling mode tests<br>
&gt; <br>
&gt; Signed-off-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
&gt; Acked-by: Bindu Ramamurthy &lt;bindu.r@amd.com&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Changes since v2:<br>
&gt;&nbsp;&nbsp;&nbsp; Test added as generic IGT. <br>
&gt; <br>
&gt; <br>
&gt;&nbsp; tests/kms_bw.c&nbsp;&nbsp;&nbsp; | 250 +++++++++++++++++++++++++=
+++++++++++++++++++++<br>
&gt;&nbsp; tests/meson.build |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 251 insertions(+)<br>
&gt;&nbsp; create mode 100644 tests/kms_bw.c<br>
&gt; <br>
&gt; diff --git a/tests/kms_bw.c b/tests/kms_bw.c<br>
&gt; new file mode 100644<br>
&gt; index 00000000..65b97c98<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/kms_bw.c<br>
&gt; @@ -0,0 +1,250 @@<br>
&gt; +/*<br>
&gt; + * Copyrights 2021 Advanced Micro Devices, Inc.<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a<br>
&gt; + * copy of this software and associated documentation files (the &quo=
t;Software&quot;),<br>
&gt; + * to deal in the Software without restriction, including without lim=
itation<br>
&gt; + * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,<br>
&gt; + * and/or sell copies of the Software, and to permit persons to whom =
the<br>
&gt; + * Software is furnished to do so, subject to the following condition=
s:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO =
EVENT SHALL<br>
&gt; + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMA=
GES OR<br>
&gt; + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,<br>
&gt; + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR<br>
&gt; + * OTHER DEALINGS IN THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;drm_mode.h&quot;<br>
&gt; +#include &quot;igt.h&quot;<br>
&gt; +#include &quot;drm.h&quot;<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt; +#include &lt;xf86drmMode.h&gt;<br>
&gt; +<br>
&gt; +/* Maximum pipes on any ASIC. */<br>
&gt; +#define MAX_PIPES 6<br>
&gt; +<br>
&gt; +/* Common test data. */<br>
&gt; +typedef struct data {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t display;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *primary[MAX_P=
IPES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output[MAX_P=
IPES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_t *pipe[MAX_PIPES=
];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_t *pipe_crc[M=
AX_PIPES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo mode[MAX_P=
IPES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum pipe pipe_id[MAX_PIPE=
S];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int w[MAX_PIPES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int h[MAX_PIPES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd;<br>
&gt; +} data_t;<br>
&gt; +<br>
&gt; +static const drmModeModeInfo test_mode_1 =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;1920x1080p\0&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vrefresh =3D 60,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .clock =3D 173000,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .hdisplay =3D 1920,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .hsync_start =3D 2048,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .hsync_end =3D 2248,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .htotal =3D 2576,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vdisplay =3D 1080,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vsync_start =3D 1083,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vsync_end =3D 1088,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vtotal =3D 1120,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .type =3D 0x40,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .flags =3D DRM_MODE_FLAG_NHSYNC,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .hskew =3D 0,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vscan =3D 0,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const drmModeModeInfo test_mode_2 =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;2560x1440p\0&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vrefresh =3D 60,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .clock =3D 312250,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .hdisplay =3D 2560,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .hsync_start =3D 2752,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .hsync_end =3D 3024,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .htotal =3D 3488,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vdisplay =3D 1440,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vsync_start =3D 1443,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vsync_end =3D 1448,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vtotal =3D 1493,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .type =3D 0x40,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .flags =3D DRM_MODE_FLAG_NHSYNC,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .hskew =3D 0,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vscan =3D 0,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const drmModeModeInfo test_mode_3 =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;3840x2160p\0&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vrefresh =3D 60,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .clock =3D 533000,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .hdisplay =3D 3840,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .hsync_start =3D 3888,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .hsync_end =3D 3920,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .htotal =3D 4000,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vdisplay =3D 2160,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vsync_start =3D 2163,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vsync_end =3D 2168,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vtotal =3D 2222,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .type =3D 0x40,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .flags =3D DRM_MODE_FLAG_NHSYNC,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .hskew =3D 0,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .vscan =3D 0,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void test_init(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D &amp;data-&gt;dis=
play;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int i, max_pipes =3D display-&gt;n_pipes;<br=
>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe(display, i) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;pipe_id[i] =3D PIPE_A + i;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;pipe[i] =3D &amp;data-&gt;display.pipes[data-&gt;pipe_id[i]];<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;primary[i] =3D igt_pipe_get_plane_type(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;pipe[i], DRM_P=
LANE_TYPE_PRIMARY);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;pipe_crc[i] =3D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_new(data-&=
gt;fd, data-&gt;pipe_id[i], &quot;auto&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; display-&gt;n_outputs &=
amp;&amp; i &lt; max_pipes; i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_output_t *output =3D &amp;display-&gt;outputs[i];<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;output[i] =3D output;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Only allow physically connected displays for the tests. */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!igt_output_is_connected(output))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(kmstest_get_connector_default_mode(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;fd, output-&gt=
;config.connector, &amp;data-&gt;mode[i]));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;w[i] =3D data-&gt;mode[i].hdisplay;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;h[i] =3D data-&gt;mode[i].vdisplay;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_require(data-&gt;output[0]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_reset(display);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void test_fini(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D &amp;data-&gt;dis=
play;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe(display, i) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_pipe_crc_free(data-&gt;pipe_crc[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_reset(display);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit_atomic(display, DRM_MODE_=
ATOMIC_ALLOW_MODESET, 0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Forces a mode for a connector. */<br>
&gt; +static void force_output_mode(data_t *d, igt_output_t *output,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; const drmModeModeInfo *mode)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* This allows us to create a virtual sink. =
*/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!igt_output_is_connected(output)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kmstest_force_edid(d-&gt;fd, output-&gt;config.connector,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_kms_get_4k_edid());<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kmstest_force_connector(d-&gt;fd, output-&gt;config.connector,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FO=
RCE_CONNECTOR_DIGITAL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_override_mode(output, mode);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void run_test_linear_tiling(data_t *data, int pipe, const drmM=
odeModeInfo *mode) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D &amp;data-&gt;dis=
play;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb buffer[MAX_PIPES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_crc_t zero, captured[MAX_PIPES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; void *user_data =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; test_init(data);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on_f(pipe &gt;=3D igt_display_get_n=
_pipes(display),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ASIC does not have %d pipes\n=
&quot;, pipe);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* create buffers */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt;=3D pipe; i++) {<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; output =3D data-&gt;output[i];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!output) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; force_output_mode(data, output, mode);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_create_color_fb(display-&gt;drm_fd, test_mode_1.hdisplay,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_mode_1.vdisplay, DRM_=
FORMAT_XRGB8888,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_MOD_NONE, 1.f, =
0.f, 0.f,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;buffer[i]);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_output_set_pipe(output, i);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_plane_set_fb(data-&gt;primary[i], &amp;buffer[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_display_try_commit_atomic(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; display, DRM_MODE_ATOMIC_ALLOW_MODESET, user_data);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(ret &gt;=3D 0, &quot;Modeset fa=
iled\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt;=3D pipe; i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_pipe_crc_collect_crc(data-&gt;pipe_crc[i], &amp;captured[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(!igt_check_crc_equal(&amp;zero, &amp;captured[i]),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;CRC is zero\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_remove_fb(display-&gt;drm_fd, &amp;buffer[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; test_fini(data);<br>
&gt; +}<br>
&gt; +<br>
&gt; +igt_main<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; data_t data;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on_simulation();<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;data, 0, sizeof(data));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data.fd =3D drm_open_driver_master(DRIVER_ANY);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kmstest_set_vt_graphics_mode();<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_display_require(&amp;data.display, data.fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(&amp;data.display.is_atomic);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_display_require_output(&amp;data.display);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; MAX_PIPES; i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_subtest_f(&quot;linear-tiling-%d-displays-%s&quot;, i+1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; test_mode_1.name)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_test_linear_tiling(=
&amp;data, i, &amp;test_mode_1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_subtest_f(&quot;linear-tiling-%d-displays-%s&quot;, i+1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; test_mode_2.name)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_test_linear_tiling(=
&amp;data, i, &amp;test_mode_2);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_subtest_f(&quot;linear-tiling-%d-displays-%s&quot;, i+1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; test_mode_3.name)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_test_linear_tiling(=
&amp;data, i, &amp;test_mode_3);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_display_fini(&amp;data.display);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; diff --git a/tests/meson.build b/tests/meson.build<br>
&gt; index 1bdfddbb..6d1ebe42 100644<br>
&gt; --- a/tests/meson.build<br>
&gt; +++ b/tests/meson.build<br>
&gt; @@ -22,6 +22,7 @@ test_progs =3D [<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_big_fb',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_big_joiner' ,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_busy',<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; 'kms_bw',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_ccs',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_cdclk',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_concurrent',<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
<br>
-- <br>
Rodrigo Siqueira<br>
<a href=3D"https://siqueira.tech">https://siqueira.tech</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM4PR12MB512068E13A4DF62D80C339D5F5E59DM4PR12MB5120namp_--

--===============0669898458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0669898458==--
