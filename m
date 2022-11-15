Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466EF10E1C4
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 20:21:44 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 17:21:01 -0300
Message-Id: <20221115202101.278995-6-mcanal@igalia.com>
In-Reply-To: <20221115202101.278995-1-mcanal@igalia.com>
References: <20221115202101.278995-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/5] tests/vc4: Skip VC4 tests if they are
 running on BCM2711/RaspberryPi4
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently, if the VC4 tests are run on BCM2711/Raspberry Pi 4, they will
fail with no warning. So, add igt_require to the VC4 tests to check if
VC4 has rendering capabilities before running the tests.

In order to check if VC4 is running on BCM2711/Raspberry Pi 4, create a
function that checks the return of DRM_VC4_GET_PARAM IOCTL when the
parameter DRM_VC4_PARAM_V3D_IDENT0 is asked. If the IOCTL fails with
errno EINVAL, it means that the tests are being run on
BCM2711/Raspberry Pi 4.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_vc4.c               | 8 ++++++++
 lib/igt_vc4.h               | 1 +
 tests/vc4/vc4_create_bo.c   | 1 +
 tests/vc4/vc4_dmabuf_poll.c | 4 +++-
 tests/vc4/vc4_label_bo.c    | 4 +++-
 tests/vc4/vc4_perfmon.c     | 4 +++-
 tests/vc4/vc4_tiling.c      | 4 +++-
 tests/vc4/vc4_wait_bo.c     | 1 +
 tests/vc4/vc4_wait_seqno.c  | 4 +++-
 9 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/lib/igt_vc4.c b/lib/igt_vc4.c
index f73f8a86..2df58e4f 100644
--- a/lib/igt_vc4.c
+++ b/lib/igt_vc4.c
@@ -59,6 +59,14 @@ bool igt_vc4_is_tiled(uint64_t modifier)
 	}
 }
 
+bool igt_vc4_is_v3d(int fd)
+{
+	struct drm_vc4_get_param arg = {
+		.param = DRM_VC4_PARAM_V3D_IDENT0,
+	};
+	return !(igt_ioctl(fd, DRM_IOCTL_VC4_GET_PARAM, &arg) == -1 && errno == EINVAL);
+}
+
 /**
  * igt_vc4_get_cleared_bo:
  * @fd: device file descriptor
diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
index 71f213e6..384d7d6e 100644
--- a/lib/igt_vc4.h
+++ b/lib/igt_vc4.h
@@ -34,6 +34,7 @@ void *igt_vc4_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned prot);
 int igt_vc4_get_param(int fd, uint32_t param, uint64_t *val);
 bool igt_vc4_purgeable_bo(int fd, int handle, bool purgeable);
 bool igt_vc4_is_tiled(uint64_t modifier);
+bool igt_vc4_is_v3d(int fd);
 
 uint32_t igt_vc4_perfmon_create(int fd, uint32_t ncounters, uint8_t *events);
 void igt_vc4_perfmon_get_values(int fd, uint32_t id);
diff --git a/tests/vc4/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
index c4909b49..c17f25b0 100644
--- a/tests/vc4/vc4_create_bo.c
+++ b/tests/vc4/vc4_create_bo.c
@@ -30,6 +30,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_VC4);
+		igt_require(igt_vc4_is_v3d(fd));
 	}
 
 	igt_subtest("create-bo-4096") {
diff --git a/tests/vc4/vc4_dmabuf_poll.c b/tests/vc4/vc4_dmabuf_poll.c
index da99964b..c76d4950 100644
--- a/tests/vc4/vc4_dmabuf_poll.c
+++ b/tests/vc4/vc4_dmabuf_poll.c
@@ -59,8 +59,10 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture {
 		fd = drm_open_driver(DRIVER_VC4);
+		igt_require(igt_vc4_is_v3d(fd));
+	}
 
 	igt_subtest("poll-write-waits-until-write-done") {
 		poll_write_bo_test(fd, POLLOUT);
diff --git a/tests/vc4/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
index dd8b5f9a..252bd1ed 100644
--- a/tests/vc4/vc4_label_bo.c
+++ b/tests/vc4/vc4_label_bo.c
@@ -43,8 +43,10 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture {
 		fd = drm_open_driver(DRIVER_VC4);
+		igt_require(igt_vc4_is_v3d(fd));
+	}
 
 	igt_subtest("set-label") {
 		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
diff --git a/tests/vc4/vc4_perfmon.c b/tests/vc4/vc4_perfmon.c
index ca7567fd..30186519 100644
--- a/tests/vc4/vc4_perfmon.c
+++ b/tests/vc4/vc4_perfmon.c
@@ -12,8 +12,10 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture {
 		fd = drm_open_driver(DRIVER_VC4);
+		igt_require(igt_vc4_is_v3d(fd));
+	}
 
 	igt_describe("Make sure a perfmon cannot be created with zero counters.");
 	igt_subtest("create-perfmon-0") {
diff --git a/tests/vc4/vc4_tiling.c b/tests/vc4/vc4_tiling.c
index 372b1fed..f5bf31f5 100644
--- a/tests/vc4/vc4_tiling.c
+++ b/tests/vc4/vc4_tiling.c
@@ -28,8 +28,10 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture {
 		fd = drm_open_driver(DRIVER_VC4);
+		igt_require(igt_vc4_is_v3d(fd));
+	}
 
 	igt_subtest("get-bad-handle") {
 		struct drm_vc4_get_tiling get = {
diff --git a/tests/vc4/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
index 386642b9..c88a4ac4 100644
--- a/tests/vc4/vc4_wait_bo.c
+++ b/tests/vc4/vc4_wait_bo.c
@@ -64,6 +64,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_VC4);
+		igt_require(igt_vc4_is_v3d(fd));
 		bo_handle = igt_vc4_create_bo(fd, PAGE_SIZE);
 	}
 
diff --git a/tests/vc4/vc4_wait_seqno.c b/tests/vc4/vc4_wait_seqno.c
index 61485bbf..78984fa3 100644
--- a/tests/vc4/vc4_wait_seqno.c
+++ b/tests/vc4/vc4_wait_seqno.c
@@ -28,8 +28,10 @@ igt_main
 {
 	int fd;
 
-	igt_fixture
+	igt_fixture {
 		fd = drm_open_driver(DRIVER_VC4);
+		igt_require(igt_vc4_is_v3d(fd));
+	}
 
 	/* A 64-bit seqno should never hit the maximum value over the
 	 * lifetime of the system.  (A submit per 1000 cycles at 1Ghz
-- 
2.38.1
