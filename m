Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD0A10E3AB
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 14:26:05 +0000 (UTC)
Date: Tue, 11 Jul 2023 14:20:45 +0000
To: igt-dev@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Message-ID: <20230711142039.2707-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: [igt-dev] [PATCH] tests/syncobj_eventfd: new test
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

This series implements a new test suite for the DRM_IOCTL_SYNCOBJ_EVENTFD
IOCTL introduced in [1].

[1]: https://lore.kernel.org/dri-devel/20221012123241.337774-1-contact@emer=
sion.fr/

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 include/drm-uapi/drm.h  |  22 +++
 lib/igt_syncobj.c       |  40 +++++
 lib/igt_syncobj.h       |   4 +
 tests/meson.build       |   1 +
 tests/syncobj_eventfd.c | 344 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 411 insertions(+)
 create mode 100644 tests/syncobj_eventfd.c

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 5e54c3aa4c3a..7368a533c74b 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -903,6 +903,27 @@ struct drm_syncobj_timeline_wait {
 =09__u32 pad;
 };
=20
+/**
+ * struct drm_syncobj_eventfd
+ * @handle: syncobj handle.
+ * @flags: Zero to wait for the point to be signalled, or
+ *         &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE to wait for a fence to b=
e
+ *         available for the point.
+ * @point: syncobj timeline point (set to zero for binary syncobjs).
+ * @fd: Existing eventfd to sent events to.
+ * @pad: Must be zero.
+ *
+ * Register an eventfd to be signalled by a syncobj. The eventfd counter w=
ill
+ * be incremented by one.
+ */
+struct drm_syncobj_eventfd {
+=09__u32 handle;
+=09__u32 flags;
+=09__u64 point;
+=09__s32 fd;
+=09__u32 pad;
+};
+
=20
 struct drm_syncobj_array {
 =09__u64 handles;
@@ -1089,6 +1110,7 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_QUERY=09=09DRM_IOWR(0xCB, struct drm_syncobj_tim=
eline_array)
 #define DRM_IOCTL_SYNCOBJ_TRANSFER=09DRM_IOWR(0xCC, struct drm_syncobj_tra=
nsfer)
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL=09DRM_IOWR(0xCD, struct drm_sync=
obj_timeline_array)
+#define DRM_IOCTL_SYNCOBJ_EVENTFD=09DRM_IOWR(0xCE, struct drm_syncobj_even=
tfd)
=20
 #define DRM_IOCTL_MODE_GETFB2=09=09DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
=20
diff --git a/lib/igt_syncobj.c b/lib/igt_syncobj.c
index a24ed10b7a0e..a53393bd7245 100644
--- a/lib/igt_syncobj.c
+++ b/lib/igt_syncobj.c
@@ -543,3 +543,43 @@ syncobj_timeline_to_timeline(int fd,
 =09=09=09=09=09 timeline_dst, point_dst,
 =09=09=09=09=09 timeline_src, point_src, 0), 0);
 }
+
+int
+__syncobj_eventfd(int fd, uint32_t handle, uint64_t point, uint32_t flags,
+=09=09  int ev_fd)
+{
+=09struct drm_syncobj_eventfd args;
+=09int ret;
+
+=09args.handle =3D handle;
+=09args.flags =3D flags;
+=09args.point =3D point;
+=09args.fd =3D ev_fd;
+=09args.pad =3D 0;
+
+=09ret =3D igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_EVENTFD, &args);
+=09if (ret) {
+=09=09ret =3D -errno;
+=09=09igt_assume(ret);
+=09=09errno =3D 0;
+=09}
+
+=09return ret;
+}
+
+/**
+ * syncobj_eventfd:
+ * @fd: The DRM file descriptor.
+ * @handle: A syncobj handle.
+ * @point: A point on the timeline syncobj, or 0 for binary syncobjs.
+ * @flags: Flags.
+ * @ev_fd: An eventfd.
+ *
+ * Wait for a syncobj with an eventfd.
+ */
+void
+syncobj_eventfd(int fd, uint32_t handle, uint64_t point, uint32_t flags,
+=09=09int ev_fd)
+{
+=09igt_assert_eq(__syncobj_eventfd(fd, handle, point, flags, ev_fd), 0);
+}
diff --git a/lib/igt_syncobj.h b/lib/igt_syncobj.h
index e6725671d900..3911696d52f0 100644
--- a/lib/igt_syncobj.h
+++ b/lib/igt_syncobj.h
@@ -65,5 +65,9 @@ void syncobj_timeline_to_timeline(int fd,
 =09=09=09=09  uint64_t timeline_src, uint32_t point_src);
 void syncobj_timeline_signal(int fd, uint32_t *handles, uint64_t *points,
 =09=09=09     uint32_t count);
+int __syncobj_eventfd(int fd, uint32_t handle, uint64_t point, uint32_t fl=
ags,
+=09=09      int ev_fd);
+void syncobj_eventfd(int fd, uint32_t handle, uint64_t point, uint32_t fla=
gs,
+=09=09     int ev_fd);
=20
 #endif /* IGT_SYNCOBJ_H */
diff --git a/tests/meson.build b/tests/meson.build
index d56e4c89daf3..9fc9199e267b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -78,6 +78,7 @@ test_progs =3D [
 =09'prime_udl',
 =09'prime_vgem',
 =09'syncobj_basic',
+=09'syncobj_eventfd',
 =09'syncobj_wait',
 =09'syncobj_timeline',
 =09'sw_sync',
diff --git a/tests/syncobj_eventfd.c b/tests/syncobj_eventfd.c
new file mode 100644
index 000000000000..f9659993a583
--- /dev/null
+++ b/tests/syncobj_eventfd.c
@@ -0,0 +1,344 @@
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
+#include "sw_sync.h"
+#include "igt_syncobj.h"
+#include <fcntl.h>
+#include <poll.h>
+#include <sys/eventfd.h>
+#include <stdint.h>
+#include "drm.h"
+/**
+ * TEST: syncobj eventfd
+ * Category: Infrastructure
+ * Description: Tests for the drm sync object eventfd API
+ * Feature: synchronization
+ * Functionality: semaphore
+ * Run type: FULL
+ * Sub-category: DRM
+ * Test category: GEM_Legacy
+ */
+
+IGT_TEST_DESCRIPTION("Tests for the drm sync object eventfd API");
+
+static bool
+has_syncobj_eventfd(int fd)
+{
+=09uint64_t value;
+=09int ret;
+
+=09if (drmGetCap(fd, DRM_CAP_SYNCOBJ, &value))
+=09=09return false;
+=09if (!value)
+=09=09return false;
+
+=09/* Try waiting for an invalid syncobj should fail with ENOENT */
+=09ret =3D __syncobj_eventfd(fd, 0, 0, 0, -1);
+=09return ret =3D=3D -ENOENT;
+}
+
+static int
+syncobj_attach_sw_sync(int fd, uint32_t handle, uint64_t point)
+{
+=09int timeline, fence;
+=09uint32_t syncobj;
+
+=09timeline =3D sw_sync_timeline_create();
+=09fence =3D sw_sync_timeline_create_fence(timeline, 1);
+
+=09if (point =3D=3D 0) {
+=09=09syncobj_import_sync_file(fd, handle, fence);
+=09} else {
+=09=09syncobj =3D syncobj_create(fd, 0);
+
+=09=09syncobj_import_sync_file(fd, syncobj, fence);
+=09=09syncobj_binary_to_timeline(fd, handle, point, syncobj);
+=09=09syncobj_destroy(fd, syncobj);
+=09}
+
+=09close(fence);
+
+=09return timeline;
+}
+
+static int
+ev_fd_read(int ev_fd)
+{
+=09uint64_t ev_fd_value;
+=09int ret;
+
+=09ret =3D read(ev_fd, &ev_fd_value, sizeof(ev_fd_value));
+=09if (ret =3D=3D -1)
+=09=09return -errno;
+=09igt_assert_eq(ret, sizeof(ev_fd_value));
+=09return 0;
+}
+
+static void
+ev_fd_poll_in(int ev_fd, bool avail)
+{
+=09struct pollfd pollfd;
+=09int ret;
+=09int timeout_ms;
+
+=09/* Wait 5s if we're expecting data, 10ms otherwise */
+=09timeout_ms =3D avail ? 5000 : 10;
+=09pollfd.fd =3D ev_fd;
+=09pollfd.events =3D POLLIN;
+=09pollfd.revents =3D 0;
+=09ret =3D poll(&pollfd, 1, timeout_ms);
+=09if (avail) {
+=09=09igt_assert(ret >=3D 0);
+=09=09igt_assert(pollfd.revents & POLLIN);
+=09} else {
+=09=09igt_assert_eq(ret, 0);
+=09}
+}
+
+static void
+ev_fd_assert_unsignaled(int ev_fd)
+{
+=09/* Poll the eventfd to give the kernel time to signal it, error out if
+=09 * that happens */
+=09ev_fd_poll_in(ev_fd, false);
+=09igt_assert_eq(ev_fd_read(ev_fd), -EAGAIN);
+}
+
+static void
+ev_fd_assert_signaled(int ev_fd)
+{
+=09ev_fd_poll_in(ev_fd, true);
+=09igt_assert_eq(ev_fd_read(ev_fd), 0);
+}
+
+static const char test_bad_flags_desc[] =3D
+=09"Verifies that passing bad flags is rejected";
+static void
+test_bad_flags(int fd)
+{
+=09uint32_t flags;
+=09uint32_t syncobj;
+=09int ev_fd;
+
+=09syncobj =3D syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
+=09flags =3D 0xdeadbeef;
+=09ev_fd =3D eventfd(0, EFD_NONBLOCK);
+=09igt_assert_eq(__syncobj_eventfd(fd, syncobj, 0, flags, ev_fd), -EINVAL)=
;
+
+=09close(ev_fd);
+=09syncobj_destroy(fd, syncobj);
+}
+
+static const char test_illegal_handle_desc[] =3D
+=09"Verifies that passing an invalid syncobj handle is rejected";
+static void
+test_illegal_handle(int fd)
+{
+=09int ev_fd;
+
+=09ev_fd =3D eventfd(0, EFD_NONBLOCK);
+=09igt_assert_eq(__syncobj_eventfd(fd, 0, 0, 0, ev_fd), -ENOENT);
+
+=09close(ev_fd);
+}
+
+static const char test_illegal_eventfd_desc[] =3D
+=09"Verifies that passing an invalid eventfd is rejected";
+static void
+test_illegal_eventfd(int fd)
+{
+=09int dev_null;
+=09uint32_t syncobj;
+
+=09syncobj =3D syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
+
+=09dev_null =3D open("/dev/null", O_RDWR);
+=09igt_assert(dev_null >=3D 0);
+
+=09igt_assert_eq(__syncobj_eventfd(fd, syncobj, 0, 0, dev_null), -EINVAL);
+
+=09close(dev_null);
+=09syncobj_destroy(fd, syncobj);
+}
+
+static const char test_bad_pad_desc[] =3D
+=09"Verifies that passing a non-zero padding is rejected";
+static void
+test_bad_pad(int fd)
+{
+=09struct drm_syncobj_eventfd args;
+=09int ret;
+
+=09args.handle =3D syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
+=09args.flags =3D 0;
+=09args.point =3D 0;
+=09args.fd =3D eventfd(0, EFD_NONBLOCK);
+=09args.pad =3D 0xdeadbeef;
+
+=09ret =3D drmIoctl(fd, DRM_IOCTL_SYNCOBJ_EVENTFD, &args);
+=09igt_assert(ret =3D=3D -1 && errno =3D=3D EINVAL);
+}
+
+static const char test_wait_desc[] =3D
+=09"Verifies waiting an already-materialized fence";
+static void
+test_wait(int fd, bool use_timeline)
+{
+=09uint32_t syncobj;
+=09int timeline, ev_fd_wait, ev_fd_avail;
+=09uint64_t point =3D use_timeline ? 1 : 0;
+
+=09syncobj =3D syncobj_create(fd, 0);
+=09timeline =3D syncobj_attach_sw_sync(fd, syncobj, point);
+=09ev_fd_wait =3D eventfd(0, EFD_NONBLOCK);
+=09ev_fd_avail =3D eventfd(0, EFD_NONBLOCK);
+
+=09syncobj_eventfd(fd, syncobj, point, 0, ev_fd_wait);
+=09syncobj_eventfd(fd, syncobj, point, DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILAB=
LE,
+=09=09=09ev_fd_avail);
+
+=09ev_fd_assert_unsignaled(ev_fd_wait);
+=09ev_fd_assert_signaled(ev_fd_avail);
+
+=09sw_sync_timeline_inc(timeline, 1);
+
+=09ev_fd_assert_signaled(ev_fd_wait);
+
+=09close(ev_fd_wait);
+=09close(ev_fd_avail);
+=09close(timeline);
+=09syncobj_destroy(fd, syncobj);
+}
+
+static const char test_wait_before_signal_desc[] =3D
+=09"Verifies waiting a fence not yet materialized";
+static void
+test_wait_before_signal(int fd, bool use_timeline)
+{
+=09uint32_t syncobj;
+=09int timeline, ev_fd_wait, ev_fd_avail;
+=09uint64_t point =3D use_timeline ? 1 : 0;
+
+=09syncobj =3D syncobj_create(fd, 0);
+=09ev_fd_wait =3D eventfd(0, EFD_NONBLOCK);
+=09ev_fd_avail =3D eventfd(0, EFD_NONBLOCK);
+
+=09syncobj_eventfd(fd, syncobj, point, 0, ev_fd_wait);
+=09syncobj_eventfd(fd, syncobj, point, DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILAB=
LE,
+=09=09=09ev_fd_avail);
+
+=09ev_fd_assert_unsignaled(ev_fd_wait);
+=09ev_fd_assert_unsignaled(ev_fd_avail);
+
+=09timeline =3D syncobj_attach_sw_sync(fd, syncobj, point);
+
+=09ev_fd_assert_unsignaled(ev_fd_wait);
+=09ev_fd_assert_signaled(ev_fd_avail);
+
+=09sw_sync_timeline_inc(timeline, 1);
+
+=09ev_fd_assert_signaled(ev_fd_wait);
+
+=09close(ev_fd_wait);
+=09close(ev_fd_avail);
+=09close(timeline);
+=09syncobj_destroy(fd, syncobj);
+}
+
+static const char test_wait_signaled_desc[] =3D
+=09"Verifies waiting an already-signaled fence";
+static void
+test_wait_signaled(int fd, bool use_timeline)
+{
+=09uint32_t syncobj;
+=09int timeline, ev_fd_wait, ev_fd_avail;
+=09uint64_t point =3D use_timeline ? 1 : 0;
+
+=09syncobj =3D syncobj_create(fd, 0);
+=09ev_fd_wait =3D eventfd(0, EFD_NONBLOCK);
+=09ev_fd_avail =3D eventfd(0, EFD_NONBLOCK);
+
+=09timeline =3D syncobj_attach_sw_sync(fd, syncobj, point);
+=09sw_sync_timeline_inc(timeline, 1);
+
+=09syncobj_eventfd(fd, syncobj, point, 0, ev_fd_wait);
+=09syncobj_eventfd(fd, syncobj, point, DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILAB=
LE,
+=09=09=09ev_fd_avail);
+
+=09ev_fd_assert_signaled(ev_fd_wait);
+=09ev_fd_assert_signaled(ev_fd_avail);
+
+=09close(ev_fd_wait);
+=09close(ev_fd_avail);
+=09close(timeline);
+=09syncobj_destroy(fd, syncobj);
+}
+
+igt_main
+{
+=09int fd =3D -1, i;
+
+=09igt_fixture {
+=09=09fd =3D drm_open_driver(DRIVER_ANY);
+=09=09igt_require(has_syncobj_eventfd(fd));
+=09=09igt_require_sw_sync();
+=09}
+
+=09igt_describe(test_bad_flags_desc);
+=09igt_subtest("invalid-bad-flags")
+=09=09test_bad_flags(fd);
+
+=09igt_describe(test_illegal_handle_desc);
+=09igt_subtest("invalid-illegal-handle")
+=09=09test_illegal_handle(fd);
+
+=09igt_describe(test_illegal_eventfd_desc);
+=09igt_subtest("invalid-illegal-eventfd")
+=09=09test_illegal_eventfd(fd);
+
+=09igt_describe(test_bad_pad_desc);
+=09igt_subtest("invalid-bad-pad")
+=09=09test_bad_pad(fd);
+
+=09for (i =3D 0; i < 2; i++) {
+=09=09bool use_timeline =3D i =3D=3D 1;
+=09=09const char *kind =3D use_timeline ? "timeline" : "binary";
+
+=09=09igt_describe(test_wait_desc);
+=09=09igt_subtest_f("%s-wait", kind)
+=09=09=09test_wait(fd, use_timeline);
+
+=09=09igt_describe(test_wait_before_signal_desc);
+=09=09igt_subtest_f("%s-wait-before-signal", kind)
+=09=09=09test_wait_before_signal(fd, use_timeline);
+
+=09=09igt_describe(test_wait_signaled_desc);
+=09=09igt_subtest_f("%s-wait-signaled", kind)
+=09=09=09test_wait_signaled(fd, use_timeline);
+=09}
+
+=09igt_fixture {
+=09=09drm_close_driver(fd);
+=09}
+}
--=20
2.41.0

