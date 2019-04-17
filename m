Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBCD6E059
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2019 14:08:55 +0000 (UTC)
From: "Francis, David" <David.Francis@amd.com>
Date: Wed, 17 Apr 2019 14:08:51 +0000
Message-ID: <BN8PR12MB3217B0570B3CEA8306442EF4EF250@BN8PR12MB3217.namprd12.prod.outlook.com>
References: <20190416174512.16328-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190416174512.16328-1-nicholas.kazlauskas@amd.com>
Content-Language: en-CA
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] amdgpu/amd_abm: Fix getting and setting
 abm level property
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2056005613=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============2056005613==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB3217B0570B3CEA8306442EF4EF250BN8PR12MB3217namp_"

--_000_BN8PR12MB3217B0570B3CEA8306442EF4EF250BN8PR12MB3217namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Patch is Reviewed-by: David Francis <david.francis@amd.com>

________________________________
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Sent: April 16, 2019 1:45:12 PM
To: igt-dev@lists.freedesktop.org
Cc: Kazlauskas, Nicholas; Francis, David; Li, Sun peng (Leo)
Subject: [PATCH i-g-t] amdgpu/amd_abm: Fix getting and setting abm level pr=
operty

This patch addresses a few problems:

1. Inner loop that iterates over the properties uses the same iterator
as the outer loop over connectors. If the eDP panel isn't on the first
output, then it won't be checked and the tests will skip.

2. We can get null pointer deferences if any of the DRM calls return
NULL.

3. The proplist isn't freed after being acquired.

These can be fixed by using the kmstest_get_property helper to
get the prop_id. The prop_id and KMS connector ID are then stored
for use later in the test when we need to set the ABM level.

All the necessary cached state has been placed into a data structure and
many callsites have been updated to make use of this.

Cc: David Francis <david.francis@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 tests/amdgpu/amd_abm.c | 147 ++++++++++++++++++-----------------------
 1 file changed, 63 insertions(+), 84 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 363b1e90..74156462 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -34,6 +34,14 @@

 #define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"

+typedef struct data {
+       igt_display_t display;
+       int drm_fd;
+       int debugfs;
+       uint32_t output_id;
+       uint32_t abm_prop_id;
+} data_t;
+
 static int read_current_backlight_pwm(int debugfs_dir)
 {
         char buf[20];
@@ -76,35 +84,14 @@ static int backlight_write_brightness(int value)
         return 0;
 }

-static void set_abm_level(igt_display_t *display, int level)
+static void set_abm_level(data_t *data, int level)
 {
-       int i, ret;
-       int output_id;
-       drmModeObjectPropertiesPtr props;
-       uint32_t prop_id;
-       drmModePropertyPtr prop;
         uint32_t type =3D DRM_MODE_OBJECT_CONNECTOR;
+       int ret;

-       for (i =3D 0; i < display->n_outputs; i++) {
-               output_id =3D display->outputs[i].id;
-               props =3D drmModeObjectGetProperties(display->drm_fd, outpu=
t_id, type);
-
-               for (i =3D 0; i < props->count_props; i++) {
-                       prop_id =3D props->props[i];
-                       prop =3D drmModeGetProperty(display->drm_fd, prop_i=
d);
-
-                       igt_assert(prop);
-
-                       if (strcmp(prop->name, "abm level") =3D=3D 0) {
-                               ret =3D drmModeObjectSetProperty(display->d=
rm_fd, output_id, type, prop_id, level);
-
-                               igt_assert_eq(ret, 0);
-                       }
-
-                       drmModeFreeProperty(prop);
-               }
-       }
-
+       ret =3D drmModeObjectSetProperty(data->drm_fd, data->output_id, typ=
e,
+                                      data->abm_prop_id, level);
+       igt_assert_eq(ret, 0);
 }

 static int backlight_read_max_brightness(int *result)
@@ -132,24 +119,21 @@ static int backlight_read_max_brightness(int *result)
         return errno;
 }

-static void skip_if_incompatible(igt_display_t *display, int debugfs_dir)
+static void test_init(data_t *data)
 {
+       igt_display_t *display =3D &data->display;
         int ret, i;
         char buf[20];
         bool abm_prop_exists;
-       int output_id;
-       drmModeObjectPropertiesPtr props;
         uint32_t type =3D DRM_MODE_OBJECT_CONNECTOR;
-       uint32_t prop_id;
-       drmModePropertyPtr prop;

-       ret =3D igt_debugfs_simple_read(debugfs_dir, "amdgpu_current_backli=
ght_pwm",
+       ret =3D igt_debugfs_simple_read(data->debugfs, "amdgpu_current_back=
light_pwm",
                          buf, sizeof(buf));

         if (ret < 0)
                 igt_skip("No current backlight debugfs entry.\n");

-       ret =3D igt_debugfs_simple_read(debugfs_dir, "amdgpu_target_backlig=
ht_pwm",
+       ret =3D igt_debugfs_simple_read(data->debugfs, "amdgpu_target_backl=
ight_pwm",
                          buf, sizeof(buf));

         if (ret < 0)
@@ -158,18 +142,14 @@ static void skip_if_incompatible(igt_display_t *displ=
ay, int debugfs_dir)
         abm_prop_exists =3D false;

         for (i =3D 0; i < display->n_outputs; i++) {
-               output_id =3D display->outputs[i].id;
-               props =3D drmModeObjectGetProperties(display->drm_fd, outpu=
t_id, type);
+               data->output_id =3D display->outputs[i].id;

-               for (i =3D 0; i < props->count_props; i++) {
-                       prop_id =3D props->props[i];
-                       prop =3D drmModeGetProperty(display->drm_fd, prop_i=
d);
+               abm_prop_exists =3D kmstest_get_property(
+                       data->drm_fd, data->output_id, type, "abm level",
+                       &data->abm_prop_id, NULL, NULL);

-                       if (strcmp(prop->name, "abm level") =3D=3D 0)
-                               abm_prop_exists =3D true;
-
-                       drmModeFreeProperty(prop);
-               }
+               if (abm_prop_exists)
+                       break;
         }

         if (!abm_prop_exists)
@@ -177,7 +157,7 @@ static void skip_if_incompatible(igt_display_t *display=
, int debugfs_dir)
 }


-static void backlight_dpms_cycle(igt_display_t *display, int debugfs, igt_=
output_t *output)
+static void backlight_dpms_cycle(data_t *data, igt_output_t *output)
 {
         int ret;
         int max_brightness;
@@ -186,19 +166,19 @@ static void backlight_dpms_cycle(igt_display_t *displ=
ay, int debugfs, igt_output
         ret =3D backlight_read_max_brightness(&max_brightness);
         igt_assert_eq(ret, 0);

-       set_abm_level(display, 0);
+       set_abm_level(data, 0);
         backlight_write_brightness(max_brightness / 2);
         usleep(100000);
-       pwm_1 =3D read_target_backlight_pwm(debugfs);
+       pwm_1 =3D read_target_backlight_pwm(data->debugfs);

-       kmstest_set_connector_dpms(display->drm_fd, output->config.connecto=
r, DRM_MODE_DPMS_OFF);
-       kmstest_set_connector_dpms(display->drm_fd, output->config.connecto=
r, DRM_MODE_DPMS_ON);
+       kmstest_set_connector_dpms(data->drm_fd, output->config.connector, =
DRM_MODE_DPMS_OFF);
+       kmstest_set_connector_dpms(data->drm_fd, output->config.connector, =
DRM_MODE_DPMS_ON);
         usleep(100000);
-       pwm_2 =3D read_target_backlight_pwm(debugfs);
+       pwm_2 =3D read_target_backlight_pwm(data->debugfs);
         igt_assert_eq(pwm_1, pwm_2);
 }

-static void backlight_monotonic_basic(igt_display_t *display, int debugfs)
+static void backlight_monotonic_basic(data_t *data)
 {
         int ret;
         int max_brightness;
@@ -211,23 +191,23 @@ static void backlight_monotonic_basic(igt_display_t *=
display, int debugfs)

         brightness_step =3D max_brightness / 10;

-       set_abm_level(display, 0);
+       set_abm_level(data, 0);
         backlight_write_brightness(max_brightness);
         usleep(100000);
-       prev_pwm =3D read_target_backlight_pwm(debugfs);
+       prev_pwm =3D read_target_backlight_pwm(data->debugfs);
         for (brightness =3D max_brightness - brightness_step;
              brightness > 0;
              brightness -=3D brightness_step) {
                 backlight_write_brightness(brightness);
                 usleep(100000);
-               pwm =3D read_target_backlight_pwm(debugfs);
+               pwm =3D read_target_backlight_pwm(data->debugfs);
                 igt_assert(pwm < prev_pwm);
                 prev_pwm =3D pwm;
         }

 }

-static void backlight_monotonic_abm(igt_display_t *display, int debugfs)
+static void backlight_monotonic_abm(data_t *data)
 {
         int ret, i;
         int max_brightness;
@@ -240,23 +220,23 @@ static void backlight_monotonic_abm(igt_display_t *di=
splay, int debugfs)

         brightness_step =3D max_brightness / 10;
         for (i =3D 1; i < 5; i++) {
-               set_abm_level(display, i);
+               set_abm_level(data, i);
                 backlight_write_brightness(max_brightness);
                 usleep(100000);
-               prev_pwm =3D read_target_backlight_pwm(debugfs);
+               prev_pwm =3D read_target_backlight_pwm(data->debugfs);
                 for (brightness =3D max_brightness - brightness_step;
                      brightness > 0;
                      brightness -=3D brightness_step) {
                         backlight_write_brightness(brightness);
                         usleep(100000);
-                       pwm =3D read_target_backlight_pwm(debugfs);
+                       pwm =3D read_target_backlight_pwm(data->debugfs);
                         igt_assert(pwm < prev_pwm);
                         prev_pwm =3D pwm;
                 }
         }
 }

-static void abm_enabled(igt_display_t *display, int debugfs)
+static void abm_enabled(data_t *data)
 {
         int ret, i;
         int max_brightness;
@@ -265,16 +245,16 @@ static void abm_enabled(igt_display_t *display, int d=
ebugfs)
         ret =3D backlight_read_max_brightness(&max_brightness);
         igt_assert_eq(ret, 0);

-       set_abm_level(display, 0);
+       set_abm_level(data, 0);
         backlight_write_brightness(max_brightness);
         usleep(100000);
-       prev_pwm =3D read_target_backlight_pwm(debugfs);
+       prev_pwm =3D read_target_backlight_pwm(data->debugfs);
         pwm_without_abm =3D prev_pwm;

         for (i =3D 1; i < 5; i++) {
-               set_abm_level(display, i);
+               set_abm_level(data, i);
                 usleep(100000);
-               pwm =3D read_target_backlight_pwm(debugfs);
+               pwm =3D read_target_backlight_pwm(data->debugfs);
                 igt_assert(pwm <=3D prev_pwm);
                 igt_assert(pwm < pwm_without_abm);
                 prev_pwm =3D pwm;
@@ -282,7 +262,7 @@ static void abm_enabled(igt_display_t *display, int deb=
ugfs)

 }

-static void abm_gradual(igt_display_t *display, int debugfs)
+static void abm_gradual(data_t *data)
 {
         int ret, i;
         int convergence_delay =3D 15;
@@ -293,71 +273,70 @@ static void abm_gradual(igt_display_t *display, int d=
ebugfs)

         igt_assert_eq(ret, 0);

-       set_abm_level(display, 0);
+       set_abm_level(data, 0);
         backlight_write_brightness(max_brightness);

         sleep(convergence_delay);
-       prev_pwm =3D read_target_backlight_pwm(debugfs);
-       curr =3D read_current_backlight_pwm(debugfs);
+       prev_pwm =3D read_target_backlight_pwm(data->debugfs);
+       curr =3D read_current_backlight_pwm(data->debugfs);

         igt_assert_eq(prev_pwm, curr);
-       set_abm_level(display, 4);
+       set_abm_level(data, 4);
         for (i =3D 0; i < 10; i++) {
                 usleep(100000);
-               pwm =3D read_current_backlight_pwm(debugfs);
+               pwm =3D read_current_backlight_pwm(data->debugfs);
                 igt_assert(pwm < prev_pwm);
                 prev_pwm =3D pwm;
         }

         sleep(convergence_delay - 1);

-       prev_pwm =3D read_target_backlight_pwm(debugfs);
-       curr =3D read_current_backlight_pwm(debugfs);
+       prev_pwm =3D read_target_backlight_pwm(data->debugfs);
+       curr =3D read_current_backlight_pwm(data->debugfs);

         igt_assert_eq(prev_pwm, curr);
 }

 igt_main
 {
-       igt_display_t display;
-       int debugfs;
+       data_t data =3D { 0 };
         enum pipe pipe;
         igt_output_t *output;

         igt_skip_on_simulation();

         igt_fixture {
-               display.drm_fd =3D drm_open_driver_master(DRIVER_AMDGPU);
+               data.drm_fd =3D drm_open_driver_master(DRIVER_AMDGPU);

-               if (display.drm_fd =3D=3D -1)
+               if (data.drm_fd =3D=3D -1)
                         igt_skip("Not an amdgpu driver.\n");

-               debugfs =3D igt_debugfs_dir(display.drm_fd);
+               data.debugfs =3D igt_debugfs_dir(data.drm_fd);

                 kmstest_set_vt_graphics_mode();

-               igt_display_require(&display, display.drm_fd);
+               igt_display_require(&data.display, data.drm_fd);

-               skip_if_incompatible(&display, debugfs);
+               test_init(&data);

-               for_each_pipe_with_valid_output(&display, pipe, output) {
+               for_each_pipe_with_valid_output(&data.display, pipe, output=
) {
                         if (output->config.connector->connector_type =3D=
=3D DRM_MODE_CONNECTOR_eDP)
                                 break;
                 }
         }

         igt_subtest("dpms_cycle")
-               backlight_dpms_cycle(&display, debugfs, output);
+               backlight_dpms_cycle(&data, output);
         igt_subtest("backlight_monotonic_basic")
-               backlight_monotonic_basic(&display, debugfs);
+               backlight_monotonic_basic(&data);
         igt_subtest("backlight_monotonic_abm")
-               backlight_monotonic_abm(&display, debugfs);
+               backlight_monotonic_abm(&data);
         igt_subtest("abm_enabled")
-               abm_enabled(&display, debugfs);
+               abm_enabled(&data);
         igt_subtest("abm_gradual")
-               abm_gradual(&display, debugfs);
+               abm_gradual(&data);

         igt_fixture {
-               igt_display_fini(&display);
+               igt_display_fini(&data.display);
         }
 }
--
2.17.1


--_000_BN8PR12MB3217B0570B3CEA8306442EF4EF250BN8PR12MB3217namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
<p style=3D"margin-top:0; margin-bottom:0">Patch is Reviewed-by: David Fran=
cis &lt;david.francis@amd.com&gt;</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Nicholas Kazlauskas &=
lt;nicholas.kazlauskas@amd.com&gt;<br>
<b>Sent:</b> April 16, 2019 1:45:12 PM<br>
<b>To:</b> igt-dev@lists.freedesktop.org<br>
<b>Cc:</b> Kazlauskas, Nicholas; Francis, David; Li, Sun peng (Leo)<br>
<b>Subject:</b> [PATCH i-g-t] amdgpu/amd_abm: Fix getting and setting abm l=
evel property</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">This patch addresses a few problems:<br>
<br>
1. Inner loop that iterates over the properties uses the same iterator<br>
as the outer loop over connectors. If the eDP panel isn't on the first<br>
output, then it won't be checked and the tests will skip.<br>
<br>
2. We can get null pointer deferences if any of the DRM calls return<br>
NULL.<br>
<br>
3. The proplist isn't freed after being acquired.<br>
<br>
These can be fixed by using the kmstest_get_property helper to<br>
get the prop_id. The prop_id and KMS connector ID are then stored<br>
for use later in the test when we need to set the ABM level.<br>
<br>
All the necessary cached state has been placed into a data structure and<br=
>
many callsites have been updated to make use of this.<br>
<br>
Cc: David Francis &lt;david.francis@amd.com&gt;<br>
Cc: Leo Li &lt;sunpeng.li@amd.com&gt;<br>
Signed-off-by: Nicholas Kazlauskas &lt;nicholas.kazlauskas@amd.com&gt;<br>
---<br>
&nbsp;tests/amdgpu/amd_abm.c | 147 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-----------------------<b=
r>
&nbsp;1 file changed, 63 insertions(&#43;), 84 deletions(-)<br>
<br>
diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c<br>
index 363b1e90..74156462 100644<br>
--- a/tests/amdgpu/amd_abm.c<br>
&#43;&#43;&#43; b/tests/amdgpu/amd_abm.c<br>
@@ -34,6 &#43;34,14 @@<br>
&nbsp;<br>
&nbsp;#define BACKLIGHT_PATH &quot;/sys/class/backlight/amdgpu_bl0&quot;<br=
>
&nbsp;<br>
&#43;typedef struct data {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t display;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int drm_fd;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int debugfs;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t output_id;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t abm_prop_id;<br>
&#43;} data_t;<br>
&#43;<br>
&nbsp;static int read_current_backlight_pwm(int debugfs_dir)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buf[20];<br>
@@ -76,35 &#43;84,14 @@ static int backlight_write_brightness(int value)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
-static void set_abm_level(igt_display_t *display, int level)<br>
&#43;static void set_abm_level(data_t *data, int level)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, ret;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int output_id;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeObjectPropertiesPtr props;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t prop_id;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModePropertyPtr prop;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t type =3D DRM_MODE=
_OBJECT_CONNECTOR;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; display-&gt;n_ou=
tputs; i&#43;&#43;) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; output_id =3D display-&gt;outputs[i].id;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; props =3D drmModeObjectGetProperties(display-&gt;drm_fd, output_=
id, type);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (i =3D 0; i &lt; props-&gt;count_props; i&#43;&#43;) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prop_id =3D prop=
s-&gt;props[i];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prop =3D drmMode=
GetProperty(display-&gt;drm_fd, prop_id);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(prop)=
;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strcmp(prop-=
&gt;name, &quot;abm level&quot;) =3D=3D 0) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drmModeObjectSetProperty(display-&g=
t;drm_fd, output_id, type, prop_id, level);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeFreePrope=
rty(prop);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drmModeObjectSetProperty(=
data-&gt;drm_fd, data-&gt;output_id, type,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; data-&gt;abm_prop_id, level);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static int backlight_read_max_brightness(int *result)<br>
@@ -132,24 &#43;119,21 @@ static int backlight_read_max_brightness(int *res=
ult)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return errno;<br>
&nbsp;}<br>
&nbsp;<br>
-static void skip_if_incompatible(igt_display_t *display, int debugfs_dir)<=
br>
&#43;static void test_init(data_t *data)<br>
&nbsp;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D &amp;d=
ata-&gt;display;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, i;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buf[20];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool abm_prop_exists;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int output_id;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeObjectPropertiesPtr props;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t type =3D DRM_MODE=
_OBJECT_CONNECTOR;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t prop_id;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModePropertyPtr prop;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_debugfs_simple_read(debug=
fs_dir, &quot;amdgpu_current_backlight_pwm&quot;,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_debugfs_simple_read(d=
ata-&gt;debugfs, &quot;amdgpu_current_backlight_pwm&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 buf, sizeof(buf));<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret &lt; 0)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_skip(&quot;No current backlight debugfs entry.\n&=
quot;);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_debugfs_simple_read(debug=
fs_dir, &quot;amdgpu_target_backlight_pwm&quot;,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_debugfs_simple_read(d=
ata-&gt;debugfs, &quot;amdgpu_target_backlight_pwm&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 buf, sizeof(buf));<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret &lt; 0)<br>
@@ -158,18 &#43;142,14 @@ static void skip_if_incompatible(igt_display_t *d=
isplay, int debugfs_dir)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abm_prop_exists =3D false;=
<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; displ=
ay-&gt;n_outputs; i&#43;&#43;) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; output_id =3D display-&gt;outputs[i].id;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; props =3D drmModeObjectGetProperties(display-&gt;drm_fd, output_=
id, type);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data-&gt;output_id =3D display-&gt;outputs[i].id;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (i =3D 0; i &lt; props-&gt;count_props; i&#43;&#43;) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prop_id =3D prop=
s-&gt;props[i];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prop =3D drmMode=
GetProperty(display-&gt;drm_fd, prop_id);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; abm_prop_exists =3D kmstest_get_property(<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;drm=
_fd, data-&gt;output_id, type, &quot;abm level&quot;,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;data-&g=
t;abm_prop_id, NULL, NULL);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strcmp(prop-=
&gt;name, &quot;abm level&quot;) =3D=3D 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abm_prop_exists =3D true;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeFreePrope=
rty(prop);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (abm_prop_exists)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!abm_prop_exists)<br>
@@ -177,7 &#43;157,7 @@ static void skip_if_incompatible(igt_display_t *dis=
play, int debugfs_dir)<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
-static void backlight_dpms_cycle(igt_display_t *display, int debugfs, igt_=
output_t *output)<br>
&#43;static void backlight_dpms_cycle(data_t *data, igt_output_t *output)<b=
r>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int max_brightness;<br>
@@ -186,19 &#43;166,19 @@ static void backlight_dpms_cycle(igt_display_t *d=
isplay, int debugfs, igt_output<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D backlight_read_max=
_brightness(&amp;max_brightness);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(display, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(data, 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; backlight_write_brightness=
(max_brightness / 2);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usleep(100000);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pwm_1 =3D read_target_backlight_pwm(d=
ebugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pwm_1 =3D read_target_backlight_p=
wm(data-&gt;debugfs);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_set_connector_dpms(display-&g=
t;drm_fd, output-&gt;config.connector, DRM_MODE_DPMS_OFF);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_set_connector_dpms(display-&g=
t;drm_fd, output-&gt;config.connector, DRM_MODE_DPMS_ON);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_set_connector_dpms(data-&=
gt;drm_fd, output-&gt;config.connector, DRM_MODE_DPMS_OFF);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_set_connector_dpms(data-&=
gt;drm_fd, output-&gt;config.connector, DRM_MODE_DPMS_ON);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usleep(100000);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pwm_2 =3D read_target_backlight_pwm(d=
ebugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pwm_2 =3D read_target_backlight_p=
wm(data-&gt;debugfs);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(pwm_1, pwm_2=
);<br>
&nbsp;}<br>
&nbsp;<br>
-static void backlight_monotonic_basic(igt_display_t *display, int debugfs)=
<br>
&#43;static void backlight_monotonic_basic(data_t *data)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int max_brightness;<br>
@@ -211,23 &#43;191,23 @@ static void backlight_monotonic_basic(igt_display=
_t *display, int debugfs)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; brightness_step =3D max_br=
ightness / 10;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(display, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(data, 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; backlight_write_brightness=
(max_brightness);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usleep(100000);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prev_pwm =3D read_target_backlight_pw=
m(debugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prev_pwm =3D read_target_backligh=
t_pwm(data-&gt;debugfs);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (brightness =3D max_br=
ightness - brightness_step;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; brightness &gt; 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; brightness -=3D brightness_step) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; backlight_write_brightness(brightness);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; usleep(100000);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pwm =3D read_target_backlight_pwm(debugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pwm =3D read_target_backlight_pwm(data-&gt;debugfs);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert(pwm &lt; prev_pwm);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; prev_pwm =3D pwm;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;}<br>
&nbsp;<br>
-static void backlight_monotonic_abm(igt_display_t *display, int debugfs)<b=
r>
&#43;static void backlight_monotonic_abm(data_t *data)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, i;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int max_brightness;<br>
@@ -240,23 &#43;220,23 @@ static void backlight_monotonic_abm(igt_display_t=
 *display, int debugfs)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; brightness_step =3D max_br=
ightness / 10;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 1; i &lt; 5; i&=
#43;&#43;) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; set_abm_level(display, i);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; set_abm_level(data, i);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; backlight_write_brightness(max_brightness);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; usleep(100000);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; prev_pwm =3D read_target_backlight_pwm(debugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; prev_pwm =3D read_target_backlight_pwm(data-&gt;debugfs);<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for (brightness =3D max_brightness - brightness_step;=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; brightness &gt; 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; brightness -=3D brightn=
ess_step) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; backl=
ight_write_brightness(brightness);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uslee=
p(100000);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pwm =3D read_tar=
get_backlight_pwm(debugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pwm =3D read=
_target_backlight_pwm(data-&gt;debugfs);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_a=
ssert(pwm &lt; prev_pwm);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prev_=
pwm =3D pwm;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;}<br>
&nbsp;<br>
-static void abm_enabled(igt_display_t *display, int debugfs)<br>
&#43;static void abm_enabled(data_t *data)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, i;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int max_brightness;<br>
@@ -265,16 &#43;245,16 @@ static void abm_enabled(igt_display_t *display, i=
nt debugfs)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D backlight_read_max=
_brightness(&amp;max_brightness);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(display, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(data, 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; backlight_write_brightness=
(max_brightness);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usleep(100000);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prev_pwm =3D read_target_backlight_pw=
m(debugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prev_pwm =3D read_target_backligh=
t_pwm(data-&gt;debugfs);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pwm_without_abm =3D prev_p=
wm;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 1; i &lt; 5; i&=
#43;&#43;) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; set_abm_level(display, i);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; set_abm_level(data, i);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; usleep(100000);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pwm =3D read_target_backlight_pwm(debugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pwm =3D read_target_backlight_pwm(data-&gt;debugfs);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert(pwm &lt;=3D prev_pwm);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert(pwm &lt; pwm_without_abm);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; prev_pwm =3D pwm;<br>
@@ -282,7 &#43;262,7 @@ static void abm_enabled(igt_display_t *display, int=
 debugfs)<br>
&nbsp;<br>
&nbsp;}<br>
&nbsp;<br>
-static void abm_gradual(igt_display_t *display, int debugfs)<br>
&#43;static void abm_gradual(data_t *data)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, i;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int convergence_delay =3D =
15;<br>
@@ -293,71 &#43;273,70 @@ static void abm_gradual(igt_display_t *display, i=
nt debugfs)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(display, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(data, 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; backlight_write_brightness=
(max_brightness);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sleep(convergence_delay);<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prev_pwm =3D read_target_backlight_pw=
m(debugfs);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; curr =3D read_current_backlight_pwm(d=
ebugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prev_pwm =3D read_target_backligh=
t_pwm(data-&gt;debugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; curr =3D read_current_backlight_p=
wm(data-&gt;debugfs);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(prev_pwm, cu=
rr);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(display, 4);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_abm_level(data, 4);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; 10; i=
&#43;&#43;) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; usleep(100000);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pwm =3D read_current_backlight_pwm(debugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pwm =3D read_current_backlight_pwm(data-&gt;debugfs);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert(pwm &lt; prev_pwm);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; prev_pwm =3D pwm;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sleep(convergence_delay - =
1);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prev_pwm =3D read_target_backlight_pw=
m(debugfs);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; curr =3D read_current_backlight_pwm(d=
ebugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prev_pwm =3D read_target_backligh=
t_pwm(data-&gt;debugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; curr =3D read_current_backlight_p=
wm(data-&gt;debugfs);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(prev_pwm, cu=
rr);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;igt_main<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t display;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int debugfs;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data_t data =3D { 0 };<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum pipe pipe;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on_simulation();<=
br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; display.drm_fd =3D drm_open_driver_master(DRIVER_AMDGPU);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data.drm_fd =3D drm_open_driver_master(DRIVER_AMDGPU);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (display.drm_fd =3D=3D -1)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (data.drm_fd =3D=3D -1)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_s=
kip(&quot;Not an amdgpu driver.\n&quot;);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; debugfs =3D igt_debugfs_dir(display.drm_fd);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data.debugfs =3D igt_debugfs_dir(data.drm_fd);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; kmstest_set_vt_graphics_mode();<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_display_require(&amp;display, display.drm_fd);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; igt_display_require(&amp;data.display, data.drm_fd);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; skip_if_incompatible(&amp;display, debugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; test_init(&amp;data);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for_each_pipe_with_valid_output(&amp;display, pipe, output) {<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; for_each_pipe_with_valid_output(&amp;data.display, pipe, out=
put) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (o=
utput-&gt;config.connector-&gt;connector_type =3D=3D DRM_MODE_CONNECTOR_eDP=
)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;dpms_cyc=
le&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; backlight_dpms_cycle(&amp;display, debugfs, output);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; backlight_dpms_cycle(&amp;data, output);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;backligh=
t_monotonic_basic&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; backlight_monotonic_basic(&amp;display, debugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; backlight_monotonic_basic(&amp;data);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;backligh=
t_monotonic_abm&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; backlight_monotonic_abm(&amp;display, debugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; backlight_monotonic_abm(&amp;data);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;abm_enab=
led&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; abm_enabled(&amp;display, debugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; abm_enabled(&amp;data);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;abm_grad=
ual&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; abm_gradual(&amp;display, debugfs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; abm_gradual(&amp;data);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_display_fini(&amp;display);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; igt_display_fini(&amp;data.display);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;}<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BN8PR12MB3217B0570B3CEA8306442EF4EF250BN8PR12MB3217namp_--

--===============2056005613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============2056005613==--
