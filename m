Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690042.outbound.protection.outlook.com [40.107.69.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EB26E7AC
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Dec 2018 14:35:00 +0000 (UTC)
From: "Francis, David" <David.Francis@amd.com>
Date: Fri, 7 Dec 2018 14:34:54 +0000
Message-ID: <DM3PR1201MB10396B1B8FB1E90A1931D617EFAA0@DM3PR1201MB1039.namprd12.prod.outlook.com>
References: <20181128205107.16315-1-David.Francis@amd.com>,
 <b27553ca-bcd4-6211-a6cd-a1bdf79b554e@amd.com>
In-Reply-To: <b27553ca-bcd4-6211-a6cd-a1bdf79b554e@amd.com>
Content-Language: en-CA
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/amdgpu: Add test for Adaptive
 Backlight Management
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1458226043=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1458226043==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_DM3PR1201MB10396B1B8FB1E90A1931D617EFAA0DM3PR1201MB1039_"

--_000_DM3PR1201MB10396B1B8FB1E90A1931D617EFAA0DM3PR1201MB1039_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On my machine, the gradual brightness reduction gives the following pwm mea=
surements

pwm changed from 65535 to 64758 (-777)
pwm changed from 64758 to 63530 (-1228)
pwm changed from 63530 to 62594 (-936)
pwm changed from 62594 to 61751 (-843)
pwm changed from 61751 to 60825 (-926)
pwm changed from 60825 to 59480 (-1345)
pwm changed from 59480 to 58064 (-1416)
pwm changed from 58064 to 56967 (-1097)
pwm changed from 56967 to 55956 (-1011)
pwm changed from 55956 to 55027 (-929)


I think we can assume a change of at least 1

________________________________
From: Wentland, Harry
Sent: November 29, 2018 3:45:30 PM
To: Francis, David; igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t] tests/amdgpu: Add test for Adaptive Ba=
cklight Management



On 2018-11-28 3:51 p.m., David Francis wrote:
> Adaptive Backlight Management (ABM) is a power-saving
> feature on AMD ASICs that reduces backlight while increasing
> pixel contrast and luminance.  This test confirms that
> ABM is present and enabled, and that backlight performance
> is sane.  It uses AMD-specific debugfs entries to
> read the backlight PWM values.
>
> It has 5 subtests:
>
> dpms_cycle
> Sets brightness to half, then confirms that value is restored
> after dpms off and then on.
>
> backlight_monotonic_basic
> Sets brightness to ten different values, confirming that
> higher brightness values are brighter.
>
> backlight_monotonic_abm
> Same as backlight_monotonic_basic, but with abm enabled.
>
> abm_enabled
> Sets abm to its four intensity levels, confirming that
> abm reduces the backlight, and the reduction is greater
> for higher abm level.
>
> abm_gradual
> Sets abm to off and then maximum intensity, confirming
> that brightness decreases continually over the first
> second and eventually reaches the target value.
> This test takes 30s to run.
>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  tests/Makefile.sources |   1 +
>  tests/amdgpu/amd_abm.c | 361 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 362 insertions(+)
>  create mode 100644 tests/amdgpu/amd_abm.c
>
> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index 5620c1d6..3d560bee 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -19,6 +19,7 @@ AMDGPU_TESTS =3D \
>        amdgpu/amd_basic \
>        amdgpu/amd_cs_nop \
>        amdgpu/amd_prime \
> +     amdgpu/amd_abm \
>        $(NULL)
>
>  TESTS_progs =3D \
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> new file mode 100644
> index 00000000..90a6f99e
> --- /dev/null
> +++ b/tests/amdgpu/amd_abm.c
> @@ -0,0 +1,361 @@
> +/*
> + * Copyright 2018 Advanced Micro Devices, Inc.
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
> +#include "igt.h"
> +#include "drmtest.h"
> +#include "igt_kms.h"
> +#include <limits.h>
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <fcntl.h>
> +#include <time.h>
> +
> +#define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
> +
> +static int read_current_backlight_pwm(int debugfs_dir)
> +{
> +     char buf[20];
> +
> +     igt_debugfs_simple_read(debugfs_dir, "amdgpu_current_backlight_pwm"=
,
> +                      buf, sizeof(buf));
> +
> +     return strtol(buf, NULL, 0);
> +}
> +
> +static int read_target_backlight_pwm(int debugfs_dir)
> +{
> +     char buf[20];
> +
> +     igt_debugfs_simple_read(debugfs_dir, "amdgpu_target_backlight_pwm",
> +                      buf, sizeof(buf));
> +
> +     return strtol(buf, NULL, 0);
> +}
> +
> +static int backlight_write_brightness(int value)
> +{
> +     int fd;
> +     char full[PATH_MAX];
> +     char src[64];
> +     int len;
> +
> +     igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH, "brigh=
tness") < PATH_MAX);
> +     fd =3D open(full, O_WRONLY);
> +     if (fd =3D=3D -1)
> +             return -errno;
> +
> +     len =3D snprintf(src, sizeof(src), "%i", value);
> +     len =3D write(fd, src, len);
> +     close(fd);
> +
> +     if (len < 0)
> +             return len;
> +
> +     return 0;
> +}
> +
> +static void set_abm_level(igt_display_t *display, int level)
> +{
> +     int i, ret;
> +     int output_id;
> +     drmModeObjectPropertiesPtr props;
> +     uint32_t prop_id;
> +     drmModePropertyPtr prop;
> +     uint32_t type =3D DRM_MODE_OBJECT_CONNECTOR;
> +
> +     for (i =3D 0; i < display->n_outputs; i++) {
> +             output_id =3D display->outputs[i].id;
> +             props =3D drmModeObjectGetProperties(display->drm_fd, outpu=
t_id, type);
> +
> +             for (i =3D 0; i < props->count_props; i++) {
> +                     prop_id =3D props->props[i];
> +                     prop =3D drmModeGetProperty(display->drm_fd, prop_i=
d);
> +
> +                     igt_assert(prop);
> +
> +                     if (strcmp(prop->name, "abm level") =3D=3D 0) {
> +                             ret =3D drmModeObjectSetProperty(display->d=
rm_fd, output_id, type, prop_id, level);
> +
> +                             igt_assert_eq(ret, 0);
> +                     }
> +
> +                     drmModeFreeProperty(prop);
> +             }
> +     }
> +
> +}
> +
> +static int backlight_read_max_brightness(int *result)
> +{
> +     int fd;
> +     char full[PATH_MAX];
> +     char dst[64];
> +     int r, e;
> +
> +     igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH, "max_b=
rightness") < PATH_MAX);
> +
> +     fd =3D open(full, O_RDONLY);
> +     if (fd =3D=3D -1)
> +             return -errno;
> +
> +     r =3D read(fd, dst, sizeof(dst));
> +     e =3D errno;
> +     close(fd);
> +
> +     if (r < 0)
> +             return -e;
> +
> +     errno =3D 0;
> +     *result =3D strtol(dst, NULL, 10);
> +     return errno;
> +}
> +
> +static void skip_if_incompatible(igt_display_t *display, int debugfs_dir=
)
> +{
> +     int ret, i;
> +     char buf[20];
> +     bool abm_prop_exists;
> +     int output_id;
> +     drmModeObjectPropertiesPtr props;
> +     uint32_t type =3D DRM_MODE_OBJECT_CONNECTOR;
> +     uint32_t prop_id;
> +     drmModePropertyPtr prop;
> +
> +     ret =3D igt_debugfs_simple_read(debugfs_dir, "amdgpu_current_backli=
ght_pwm",
> +                      buf, sizeof(buf));
> +
> +     if (ret < 0)
> +             igt_skip("No current backlight debugfs entry.\n");
> +
> +     ret =3D igt_debugfs_simple_read(debugfs_dir, "amdgpu_target_backlig=
ht_pwm",
> +                      buf, sizeof(buf));
> +
> +     if (ret < 0)
> +             igt_skip("No target backlight debugfs entry.\n");
> +
> +     abm_prop_exists =3D false;
> +
> +     for (i =3D 0; i < display->n_outputs; i++) {
> +             output_id =3D display->outputs[i].id;
> +             props =3D drmModeObjectGetProperties(display->drm_fd, outpu=
t_id, type);
> +
> +             for (i =3D 0; i < props->count_props; i++) {
> +                     prop_id =3D props->props[i];
> +                     prop =3D drmModeGetProperty(display->drm_fd, prop_i=
d);
> +
> +                     if (strcmp(prop->name, "abm level") =3D=3D 0)
> +                             abm_prop_exists =3D true;
> +
> +                     drmModeFreeProperty(prop);
> +             }
> +     }
> +
> +     if (!abm_prop_exists)
> +             igt_skip("No abm level property on any connector.\n");
> +}
> +
> +
> +static void backlight_dpms_cycle(igt_display_t *display, int debugfs, ig=
t_output_t *output)
> +{
> +     int ret;
> +     int max_brightness;
> +     int pwm_1, pwm_2;
> +
> +     ret =3D backlight_read_max_brightness(&max_brightness);
> +     igt_assert_eq(ret, 0);
> +
> +     set_abm_level(display, 0);
> +     backlight_write_brightness(max_brightness / 2);
> +     usleep(100000);
> +     pwm_1 =3D read_target_backlight_pwm(debugfs);
> +
> +     kmstest_set_connector_dpms(display->drm_fd, output->config.connecto=
r, DRM_MODE_DPMS_OFF);
> +     kmstest_set_connector_dpms(display->drm_fd, output->config.connecto=
r, DRM_MODE_DPMS_ON);
> +     usleep(100000);
> +     pwm_2 =3D read_target_backlight_pwm(debugfs);
> +     igt_assert_eq(pwm_1, pwm_2);
> +}
> +
> +static void backlight_monotonic_basic(igt_display_t *display, int debugf=
s)
> +{
> +     int ret;
> +     int max_brightness;
> +     int prev_pwm, pwm;
> +     int brightness_step;
> +     int brightness;
> +
> +     ret =3D backlight_read_max_brightness(&max_brightness);
> +     igt_assert_eq(ret, 0);
> +
> +     brightness_step =3D max_brightness / 10;
> +
> +     set_abm_level(display, 0);
> +     backlight_write_brightness(max_brightness);
> +     usleep(100000);
> +     prev_pwm =3D read_target_backlight_pwm(debugfs);
> +     for (brightness =3D max_brightness - brightness_step;
> +          brightness > 0;
> +          brightness -=3D brightness_step) {
> +             backlight_write_brightness(brightness);
> +             usleep(100000);
> +             pwm =3D read_target_backlight_pwm(debugfs);
> +             igt_assert(pwm < prev_pwm);
> +             prev_pwm =3D pwm;
> +     }
> +
> +}
> +
> +static void backlight_monotonic_abm(igt_display_t *display, int debugfs)
> +{
> +     int ret, i;
> +     int max_brightness;
> +     int prev_pwm, pwm;
> +     int brightness_step;
> +     int brightness;
> +
> +     ret =3D backlight_read_max_brightness(&max_brightness);
> +     igt_assert_eq(ret, 0);
> +
> +     brightness_step =3D max_brightness / 10;
> +     for (i =3D 1; i < 5; i++) {
> +             set_abm_level(display, i);
> +             backlight_write_brightness(max_brightness);
> +             usleep(100000);
> +             prev_pwm =3D read_target_backlight_pwm(debugfs);
> +             for (brightness =3D max_brightness - brightness_step;
> +                  brightness > 0;
> +                  brightness -=3D brightness_step) {
> +                     backlight_write_brightness(brightness);
> +                     usleep(100000);
> +                     pwm =3D read_target_backlight_pwm(debugfs);
> +                     igt_assert(pwm < prev_pwm);
> +                     prev_pwm =3D pwm;
> +             }
> +     }
> +}
> +
> +static void abm_enabled(igt_display_t *display, int debugfs)
> +{
> +     int ret, i;
> +     int max_brightness;
> +     int pwm, prev_pwm, pwm_without_abm;
> +
> +     ret =3D backlight_read_max_brightness(&max_brightness);
> +     igt_assert_eq(ret, 0);
> +
> +     set_abm_level(display, 0);
> +     backlight_write_brightness(max_brightness);
> +     usleep(100000);
> +     prev_pwm =3D read_target_backlight_pwm(debugfs);
> +     pwm_without_abm =3D prev_pwm;
> +
> +     for (i =3D 1; i < 5; i++) {
> +             set_abm_level(display, i);
> +             usleep(100000);
> +             pwm =3D read_target_backlight_pwm(debugfs);
> +             igt_assert(pwm <=3D prev_pwm);
> +             igt_assert(pwm < pwm_without_abm);
> +             prev_pwm =3D pwm;
> +     }
> +
> +}
> +
> +static void abm_gradual(igt_display_t *display, int debugfs)
> +{
> +     int ret, i;
> +     int convergence_delay =3D 15;
> +     int prev_pwm, pwm, curr;
> +     int max_brightness;
> +
> +     ret =3D backlight_read_max_brightness(&max_brightness);
> +
> +     igt_assert_eq(ret, 0);
> +
> +     set_abm_level(display, 0);
> +     backlight_write_brightness(max_brightness);
> +
> +     sleep(convergence_delay);
> +     prev_pwm =3D read_target_backlight_pwm(debugfs);
> +     curr =3D read_current_backlight_pwm(debugfs);
> +
> +     igt_assert_eq(prev_pwm, curr);
> +     set_abm_level(display, 4);
> +     for (i =3D 0; i < 10; i++) {
> +             usleep(100000);
> +             pwm =3D read_current_backlight_pwm(debugfs);
> +             igt_assert(pwm < prev_pwm);

This seems like it very much depends on the usleep value above, the range o=
f expected pwm reduction between no ABM and ABM level 4, as well as how qui=
ckly/slowly this executes.

Should the usleep time be a function of the convergence_delay?

Could this give us flaky test results?

How many PWM steps have you usually seen for each iteration of this functio=
n? If it's large we're probably fine.

Harry

> +             prev_pwm =3D pwm;
> +     }
> +
> +     sleep(convergence_delay - 1);
> +
> +     prev_pwm =3D read_target_backlight_pwm(debugfs);
> +     curr =3D read_current_backlight_pwm(debugfs);
> +
> +     igt_assert_eq(prev_pwm, curr);
> +}
> +
> +igt_main
> +{
> +     igt_display_t display;
> +     int debugfs;
> +     enum pipe pipe;
> +     igt_output_t *output;
> +
> +     igt_skip_on_simulation();
> +
> +     igt_fixture {
> +             display.drm_fd =3D drm_open_driver_master(DRIVER_AMDGPU);
> +
> +             if (display.drm_fd =3D=3D -1)
> +                     igt_skip("Not an amdgpu driver.\n");
> +
> +             debugfs =3D igt_debugfs_dir(display.drm_fd);
> +
> +             kmstest_set_vt_graphics_mode();
> +
> +             igt_display_require(&display, display.drm_fd);
> +
> +             skip_if_incompatible(&display, debugfs);
> +
> +             for_each_pipe_with_valid_output(&display, pipe, output)
> +                     break;
> +     }
> +
> +     igt_subtest("dpms_cycle")
> +             backlight_dpms_cycle(&display, debugfs, output);
> +     igt_subtest("backlight_monotonic_basic")
> +             backlight_monotonic_basic(&display, debugfs);
> +     igt_subtest("backlight_monotonic_abm")
> +             backlight_monotonic_abm(&display, debugfs);
> +     igt_subtest("abm_enabled")
> +             abm_enabled(&display, debugfs);
> +     igt_subtest("abm_gradual")
> +             abm_gradual(&display, debugfs);
> +
> +     igt_fixture {
> +             igt_display_fini(&display);
> +     }
> +}
>

--_000_DM3PR1201MB10396B1B8FB1E90A1931D617EFAA0DM3PR1201MB1039_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0"></p>
<div>On my machine, the gradual brightness reduction gives the following pw=
m measurements</div>
<div><br>
</div>
<div>pwm changed from 65535 to 64758 (-777)</div>
<div>pwm changed from 64758 to 63530 (-1228)</div>
<div>pwm changed from 63530 to 62594 (-936)</div>
<div>pwm changed from 62594 to 61751 (-843)</div>
<div>pwm changed from 61751 to 60825 (-926)</div>
<div>pwm changed from 60825 to 59480 (-1345)</div>
<div>pwm changed from 59480 to 58064 (-1416)</div>
<div>pwm changed from 58064 to 56967 (-1097)</div>
<div>pwm changed from 56967 to 55956 (-1011)</div>
<div>pwm changed from 55956 to 55027 (-929)</div>
<br>
<p></p>
<p style=3D"margin-top:0;margin-bottom:0">I think we can assume a change of=
 at least 1</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Wentland, Harry<br>
<b>Sent:</b> November 29, 2018 3:45:30 PM<br>
<b>To:</b> Francis, David; igt-dev@lists.freedesktop.org<br>
<b>Subject:</b> Re: [igt-dev] [PATCH i-g-t] tests/amdgpu: Add test for Adap=
tive Backlight Management</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
On 2018-11-28 3:51 p.m., David Francis wrote:<br>
&gt; Adaptive Backlight Management (ABM) is a power-saving<br>
&gt; feature on AMD ASICs that reduces backlight while increasing<br>
&gt; pixel contrast and luminance.&nbsp; This test confirms that<br>
&gt; ABM is present and enabled, and that backlight performance<br>
&gt; is sane.&nbsp; It uses AMD-specific debugfs entries to<br>
&gt; read the backlight PWM values.<br>
&gt; <br>
&gt; It has 5 subtests:<br>
&gt; <br>
&gt; dpms_cycle<br>
&gt; Sets brightness to half, then confirms that value is restored<br>
&gt; after dpms off and then on.<br>
&gt; <br>
&gt; backlight_monotonic_basic<br>
&gt; Sets brightness to ten different values, confirming that<br>
&gt; higher brightness values are brighter.<br>
&gt; <br>
&gt; backlight_monotonic_abm<br>
&gt; Same as backlight_monotonic_basic, but with abm enabled.<br>
&gt; <br>
&gt; abm_enabled<br>
&gt; Sets abm to its four intensity levels, confirming that<br>
&gt; abm reduces the backlight, and the reduction is greater<br>
&gt; for higher abm level.<br>
&gt; <br>
&gt; abm_gradual<br>
&gt; Sets abm to off and then maximum intensity, confirming<br>
&gt; that brightness decreases continually over the first<br>
&gt; second and eventually reaches the target value.<br>
&gt; This test takes 30s to run.<br>
&gt; <br>
&gt; Signed-off-by: David Francis &lt;David.Francis@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/Makefile.sources |&nbsp;&nbsp; 1 &#43;<br>
&gt;&nbsp; tests/amdgpu/amd_abm.c | 361 &#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; 2 files changed, 362 insertions(&#43;)<br>
&gt;&nbsp; create mode 100644 tests/amdgpu/amd_abm.c<br>
&gt; <br>
&gt; diff --git a/tests/Makefile.sources b/tests/Makefile.sources<br>
&gt; index 5620c1d6..3d560bee 100644<br>
&gt; --- a/tests/Makefile.sources<br>
&gt; &#43;&#43;&#43; b/tests/Makefile.sources<br>
&gt; @@ -19,6 &#43;19,7 @@ AMDGPU_TESTS =3D \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu/amd_basic \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu/amd_cs_nop \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu/amd_prime \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu/amd_abm \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(NULL)<br>
&gt;&nbsp; <br>
&gt;&nbsp; TESTS_progs =3D \<br>
&gt; diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c<br>
&gt; new file mode 100644<br>
&gt; index 00000000..90a6f99e<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/tests/amdgpu/amd_abm.c<br>
&gt; @@ -0,0 &#43;1,361 @@<br>
&gt; &#43;/*<br>
&gt; &#43; * Copyright 2018 Advanced Micro Devices, Inc.<br>
&gt; &#43; *<br>
&gt; &#43; * Permission is hereby granted, free of charge, to any person ob=
taining a<br>
&gt; &#43; * copy of this software and associated documentation files (the =
&quot;Software&quot;),<br>
&gt; &#43; * to deal in the Software without restriction, including without=
 limitation<br>
&gt; &#43; * the rights to use, copy, modify, merge, publish, distribute, s=
ublicense,<br>
&gt; &#43; * and/or sell copies of the Software, and to permit persons to w=
hom the<br>
&gt; &#43; * Software is furnished to do so, subject to the following condi=
tions:<br>
&gt; &#43; *<br>
&gt; &#43; * The above copyright notice and this permission notice shall be=
 included in<br>
&gt; &#43; * all copies or substantial portions of the Software.<br>
&gt; &#43; *<br>
&gt; &#43; * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY O=
F ANY KIND, EXPRESS OR<br>
&gt; &#43; * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHA=
NTABILITY,<br>
&gt; &#43; * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN=
 NO EVENT SHALL<br>
&gt; &#43; * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, =
DAMAGES OR<br>
&gt; &#43; * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTH=
ERWISE,<br>
&gt; &#43; * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE=
 USE OR<br>
&gt; &#43; * OTHER DEALINGS IN THE SOFTWARE.<br>
&gt; &#43; */<br>
&gt; &#43;<br>
&gt; &#43;#include &quot;igt.h&quot;<br>
&gt; &#43;#include &quot;drmtest.h&quot;<br>
&gt; &#43;#include &quot;igt_kms.h&quot;<br>
&gt; &#43;#include &lt;limits.h&gt;<br>
&gt; &#43;#include &lt;errno.h&gt;<br>
&gt; &#43;#include &lt;stdbool.h&gt;<br>
&gt; &#43;#include &lt;stdlib.h&gt;<br>
&gt; &#43;#include &lt;stdio.h&gt;<br>
&gt; &#43;#include &lt;string.h&gt;<br>
&gt; &#43;#include &lt;fcntl.h&gt;<br>
&gt; &#43;#include &lt;time.h&gt;<br>
&gt; &#43;<br>
&gt; &#43;#define BACKLIGHT_PATH &quot;/sys/class/backlight/amdgpu_bl0&quot=
;<br>
&gt; &#43;<br>
&gt; &#43;static int read_current_backlight_pwm(int debugfs_dir)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; char buf[20];<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_debugfs_simple_read(debugfs_dir, &qu=
ot;amdgpu_current_backlight_pwm&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buf, sizeof(b=
uf));<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return strtol(buf, NULL, 0);<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;static int read_target_backlight_pwm(int debugfs_dir)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; char buf[20];<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_debugfs_simple_read(debugfs_dir, &qu=
ot;amdgpu_target_backlight_pwm&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buf, sizeof(b=
uf));<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return strtol(buf, NULL, 0);<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;static int backlight_write_brightness(int value)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int fd;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; char full[PATH_MAX];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; char src[64];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int len;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(snprintf(full, PATH_MAX, &quo=
t;%s/%s&quot;, BACKLIGHT_PATH, &quot;brightness&quot;) &lt; PATH_MAX);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(full, O_WRONLY);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (fd =3D=3D -1)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return -errno;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; len =3D snprintf(src, sizeof(src), &quot=
;%i&quot;, value);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; len =3D write(fd, src, len);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (len &lt; 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return len;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;static void set_abm_level(igt_display_t *display, int level)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int i, ret;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int output_id;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; drmModeObjectPropertiesPtr props;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t prop_id;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; drmModePropertyPtr prop;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t type =3D DRM_MODE_OBJECT_CONNEC=
TOR;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; display-&gt;n_outpu=
ts; i&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; output_id =3D display-&gt;outputs[i].id;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; props =3D drmModeObjectGetProperties(display-&gt;drm_fd, output_id,=
 type);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; for (i =3D 0; i &lt; props-&gt;count_props; i&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prop_id =3D props-&=
gt;props[i];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prop =3D drmModeGet=
Property(display-&gt;drm_fd, prop_id);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(prop);<b=
r>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strcmp(prop-&gt=
;name, &quot;abm level&quot;) =3D=3D 0) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drmModeObjectSetProperty(display-&gt;d=
rm_fd, output_id, type, prop_id, level);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeFreeProperty=
(prop);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;static int backlight_read_max_brightness(int *result)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int fd;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; char full[PATH_MAX];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; char dst[64];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int r, e;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(snprintf(full, PATH_MAX, &quo=
t;%s/%s&quot;, BACKLIGHT_PATH, &quot;max_brightness&quot;) &lt; PATH_MAX);<=
br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(full, O_RDONLY);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (fd =3D=3D -1)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return -errno;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; r =3D read(fd, dst, sizeof(dst));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (r &lt; 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return -e;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; *result =3D strtol(dst, NULL, 10);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return errno;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;static void skip_if_incompatible(igt_display_t *display, int debu=
gfs_dir)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret, i;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; char buf[20];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool abm_prop_exists;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int output_id;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; drmModeObjectPropertiesPtr props;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t type =3D DRM_MODE_OBJECT_CONNEC=
TOR;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t prop_id;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; drmModePropertyPtr prop;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_debugfs_simple_read(debugfs_=
dir, &quot;amdgpu_current_backlight_pwm&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buf, sizeof(b=
uf));<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (ret &lt; 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; igt_skip(&quot;No current backlight debugfs entry.\n&quot;);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_debugfs_simple_read(debugfs_=
dir, &quot;amdgpu_target_backlight_pwm&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buf, sizeof(b=
uf));<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (ret &lt; 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; igt_skip(&quot;No target backlight debugfs entry.\n&quot;);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; abm_prop_exists =3D false;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; display-&gt;n_outpu=
ts; i&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; output_id =3D display-&gt;outputs[i].id;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; props =3D drmModeObjectGetProperties(display-&gt;drm_fd, output_id,=
 type);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; for (i =3D 0; i &lt; props-&gt;count_props; i&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prop_id =3D props-&=
gt;props[i];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prop =3D drmModeGet=
Property(display-&gt;drm_fd, prop_id);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strcmp(prop-&gt=
;name, &quot;abm level&quot;) =3D=3D 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; abm_prop_exists =3D true;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeFreeProperty=
(prop);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!abm_prop_exists)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; igt_skip(&quot;No abm level property on any connector.\n&quot;);<br=
>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;<br>
&gt; &#43;static void backlight_dpms_cycle(igt_display_t *display, int debu=
gfs, igt_output_t *output)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int max_brightness;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int pwm_1, pwm_2;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D backlight_read_max_brightness(&a=
mp;max_brightness);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(display, 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; backlight_write_brightness(max_brightnes=
s / 2);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; usleep(100000);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; pwm_1 =3D read_target_backlight_pwm(debu=
gfs);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_set_connector_dpms(display-&gt;d=
rm_fd, output-&gt;config.connector, DRM_MODE_DPMS_OFF);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_set_connector_dpms(display-&gt;d=
rm_fd, output-&gt;config.connector, DRM_MODE_DPMS_ON);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; usleep(100000);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; pwm_2 =3D read_target_backlight_pwm(debu=
gfs);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(pwm_1, pwm_2);<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;static void backlight_monotonic_basic(igt_display_t *display, int=
 debugfs)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int max_brightness;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int prev_pwm, pwm;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int brightness_step;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int brightness;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D backlight_read_max_brightness(&a=
mp;max_brightness);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; brightness_step =3D max_brightness / 10;=
<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(display, 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; backlight_write_brightness(max_brightnes=
s);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; usleep(100000);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; prev_pwm =3D read_target_backlight_pwm(d=
ebugfs);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (brightness =3D max_brightness - bri=
ghtness_step;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; brightness=
 &gt; 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; brightness=
 -=3D brightness_step) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; backlight_write_brightness(brightness);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; usleep(100000);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pwm =3D read_target_backlight_pwm(debugfs);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; igt_assert(pwm &lt; prev_pwm);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; prev_pwm =3D pwm;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;static void backlight_monotonic_abm(igt_display_t *display, int d=
ebugfs)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret, i;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int max_brightness;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int prev_pwm, pwm;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int brightness_step;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int brightness;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D backlight_read_max_brightness(&a=
mp;max_brightness);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; brightness_step =3D max_brightness / 10;=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 1; i &lt; 5; i&#43;&#43;) {<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; set_abm_level(display, i);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; backlight_write_brightness(max_brightness);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; usleep(100000);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; prev_pwm =3D read_target_backlight_pwm(debugfs);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; for (brightness =3D max_brightness - brightness_step;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; brightness &gt; 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; brightness -=3D brightness_step) {<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; backlight_write_bri=
ghtness(brightness);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usleep(100000);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pwm =3D read_target=
_backlight_pwm(debugfs);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(pwm &lt;=
 prev_pwm);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prev_pwm =3D pwm;<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;static void abm_enabled(igt_display_t *display, int debugfs)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret, i;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int max_brightness;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int pwm, prev_pwm, pwm_without_abm;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D backlight_read_max_brightness(&a=
mp;max_brightness);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(display, 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; backlight_write_brightness(max_brightnes=
s);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; usleep(100000);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; prev_pwm =3D read_target_backlight_pwm(d=
ebugfs);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; pwm_without_abm =3D prev_pwm;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 1; i &lt; 5; i&#43;&#43;) {<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; set_abm_level(display, i);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; usleep(100000);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pwm =3D read_target_backlight_pwm(debugfs);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; igt_assert(pwm &lt;=3D prev_pwm);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; igt_assert(pwm &lt; pwm_without_abm);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; prev_pwm =3D pwm;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;static void abm_gradual(igt_display_t *display, int debugfs)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret, i;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int convergence_delay =3D 15;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int prev_pwm, pwm, curr;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int max_brightness;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D backlight_read_max_brightness(&a=
mp;max_brightness);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(display, 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; backlight_write_brightness(max_brightnes=
s);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; sleep(convergence_delay);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; prev_pwm =3D read_target_backlight_pwm(d=
ebugfs);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; curr =3D read_current_backlight_pwm(debu=
gfs);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(prev_pwm, curr);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(display, 4);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; 10; i&#43;&#43;) {<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; usleep(100000);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pwm =3D read_current_backlight_pwm(debugfs);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; igt_assert(pwm &lt; prev_pwm);<br>
<br>
This seems like it very much depends on the usleep value above, the range o=
f expected pwm reduction between no ABM and ABM level 4, as well as how qui=
ckly/slowly this executes.<br>
<br>
Should the usleep time be a function of the convergence_delay?<br>
<br>
Could this give us flaky test results?<br>
<br>
How many PWM steps have you usually seen for each iteration of this functio=
n? If it's large we're probably fine.<br>
<br>
Harry<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; prev_pwm =3D pwm;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; sleep(convergence_delay - 1);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; prev_pwm =3D read_target_backlight_pwm(d=
ebugfs);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; curr =3D read_current_backlight_pwm(debu=
gfs);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(prev_pwm, curr);<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;igt_main<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t display;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int debugfs;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; enum pipe pipe;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on_simulation();<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; display.drm_fd =3D drm_open_driver_master(DRIVER_AMDGPU);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (display.drm_fd =3D=3D -1)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip(&quot;Not =
an amdgpu driver.\n&quot;);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; debugfs =3D igt_debugfs_dir(display.drm_fd);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; kmstest_set_vt_graphics_mode();<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; igt_display_require(&amp;display, display.drm_fd);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; skip_if_incompatible(&amp;display, debugfs);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; for_each_pipe_with_valid_output(&amp;display, pipe, output)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;dpms_cycle&quot;)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; backlight_dpms_cycle(&amp;display, debugfs, output);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;backlight_monotonic_ba=
sic&quot;)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; backlight_monotonic_basic(&amp;display, debugfs);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;backlight_monotonic_ab=
m&quot;)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; backlight_monotonic_abm(&amp;display, debugfs);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;abm_enabled&quot;)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; abm_enabled(&amp;display, debugfs);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;abm_gradual&quot;)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; abm_gradual(&amp;display, debugfs);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; igt_display_fini(&amp;display);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;}<br>
&gt; <br>
</div>
</span></font></div>
</body>
</html>

--_000_DM3PR1201MB10396B1B8FB1E90A1931D617EFAA0DM3PR1201MB1039_--

--===============1458226043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1458226043==--
