Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A55810E1EC
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Oct 2023 14:23:58 +0000 (UTC)
Date: Mon, 16 Oct 2023 14:23:31 +0000
To: igt-dev@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Message-ID: <20231016142327.2671-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: [igt-dev] [PATCH] tests/kms_closefb: add CLOSEFB IOCTL test
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

CLOSEFB is the same as RMFB but keeps the FB alive as long as any
plane is using it. Check the behavior of that IOCTL.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 tests/kms_closefb.c | 141 ++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build   |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 tests/kms_closefb.c

diff --git a/tests/kms_closefb.c b/tests/kms_closefb.c
new file mode 100644
index 000000000000..26e1670bd29a
--- /dev/null
+++ b/tests/kms_closefb.c
@@ -0,0 +1,141 @@
+/*
+ * Copyright =C2=A9 2023 Simon Ser
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
+ * The above copyright notice and this permission notice (including the ne=
xt
+ * paragraph) shall be included in all copies or substantial portions of t=
he
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHAL=
L
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEA=
LINGS
+ * IN THE SOFTWARE.
+ */
+
+#include "igt.h"
+#include "drmtest.h"
+#include <errno.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+#include <time.h>
+
+/**
+ * TEST: kms closefb
+ * Category: Display
+ * Description: This tests CLOSEFB behavior. Contrary to RMFB, the
+ *              framebuffers should not be removed from the CRTC.
+ *
+ * SUBTEST: closefb-ioctl
+ * Description: CLOSEFB is supposed to leave all planes intact.
+ */
+
+IGT_TEST_DESCRIPTION("This tests CLOSEFB behavior. Contrary to RMFB, the"
+=09=09     "framebuffers should not be removed from the CRTC.");
+
+// TODO: drop when shipped in kernel header
+#ifndef DRM_IOCTL_MODE_CLOSEFB
+#define DRM_IOCTL_MODE_CLOSEFB DRM_IOWR(0xD0, unsigned int)
+#endif
+
+/* 1. Set primary plane to a known FB.
+ * 2. Make sure GETCRTC returns the correct FB ID.
+ * 3. Call CLOSEFB on the FB.
+ * 4. Make sure GETCRTC returns non-0 FB ID.
+ */
+static void
+test_closefb(int *drm_fd, igt_display_t *display, igt_output_t *output,
+=09     enum pipe pipe)
+{
+=09struct igt_fb fb;
+=09drmModeModeInfo *mode;
+=09igt_plane_t *plane;
+=09drmModeCrtc *crtc;
+=09int ret;
+
+=09mode =3D igt_output_get_mode(output);
+=09plane =3D igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE=
_PRIMARY);
+
+=09igt_create_fb(*drm_fd, mode->hdisplay, mode->vdisplay,
+=09=09      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
+=09igt_plane_set_fb(plane, &fb);
+=09igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
+
+=09crtc =3D drmModeGetCrtc(*drm_fd, output->config.crtc->crtc_id);
+=09igt_assert_eq(crtc->buffer_id, fb.fb_id);
+=09drmModeFreeCrtc(crtc);
+
+=09ret =3D drmIoctl(*drm_fd, DRM_IOCTL_MODE_CLOSEFB, &fb.fb_id);
+=09igt_assert_eq(ret, 0);
+
+=09/* Re-open our DRM FD. Without CLOSEFB, this would implicitly turn off
+=09 * the CRTC and remove the FB (see test kms_rmfb@close-fd). */
+=09drm_close_driver(*drm_fd);
+=09*drm_fd =3D drm_open_driver_master(DRIVER_ANY);
+=09drmSetClientCap(*drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
+=09drmSetClientCap(*drm_fd, DRM_CLIENT_CAP_ATOMIC, 1);
+=09igt_pipe_refresh(display, pipe, true);
+
+=09/* Check that our CRTC still has the FB attached */
+=09crtc =3D drmModeGetCrtc(*drm_fd, output->config.crtc->crtc_id);
+=09igt_assert_eq(crtc->buffer_id, fb.fb_id);
+=09drmModeFreeCrtc(crtc);
+}
+
+static void
+run_closefb_test(int *drm_fd, igt_display_t *display)
+{
+=09igt_output_t *output;
+=09enum pipe pipe;
+
+=09for_each_pipe_with_single_output(display, pipe, output) {
+=09=09igt_display_reset(display);
+
+=09=09igt_output_set_pipe(output, pipe);
+
+=09=09igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+=09=09=09      igt_output_name(output))
+=09=09=09test_closefb(drm_fd, display, output, pipe);
+=09}
+}
+
+igt_main
+{
+=09int drm_fd;
+=09igt_display_t display;
+=09uint32_t fb_id =3D 0;
+=09int ret;
+
+=09igt_fixture {
+=09=09drm_fd =3D drm_open_driver_master(DRIVER_ANY);
+
+=09=09kmstest_set_vt_graphics_mode();
+
+=09=09igt_display_require(&display, drm_fd);
+=09=09igt_display_require_output(&display);
+
+=09=09/* Detect kernel support for CLOSEFB */
+=09=09ret =3D drmIoctl(drm_fd, DRM_IOCTL_MODE_CLOSEFB, &fb_id);
+=09=09igt_require(ret !=3D 0 && errno =3D=3D ENOENT);
+=09}
+
+=09igt_describe("CLOSEFB is supposed to not touch any plane the FB is "
+=09=09     "currently attached to. Check that behavior.");
+=09igt_subtest_with_dynamic("closefb-ioctl") {
+=09=09run_closefb_test(&drm_fd, &display);
+=09}
+
+=09igt_fixture {
+=09=09igt_display_fini(&display);
+=09=09drm_close_driver(drm_fd);
+=09}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2c2e1ca9acad..6b1b15973bde 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -21,6 +21,7 @@ test_progs =3D [
 =09'kms_atomic_interruptible',
 =09'kms_atomic_transition',
 =09'kms_bw',
+=09'kms_closefb',
 =09'kms_color',
 =09'kms_concurrent',
 =09'kms_content_protection',
--=20
2.42.0

