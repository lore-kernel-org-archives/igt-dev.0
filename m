Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FAE10E1D1
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 18:41:19 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Nov 2022 15:40:35 -0300
Message-Id: <20221129184038.72946-5-mcanal@igalia.com>
In-Reply-To: <20221129184038.72946-1-mcanal@igalia.com>
References: <20221129184038.72946-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 4/7] tests/v3d: Add igt_describe() to all
 V3D subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

igt_describe() helps improve the documentation of the tests by
explaining the general idea behind the test. So, add test descriptions
to all V3D subtests using igt_describe().

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/v3d/v3d_get_bo_offset.c | 5 +++++
 tests/v3d/v3d_get_param.c     | 5 +++++
 tests/v3d/v3d_mmap.c          | 3 +++
 3 files changed, 13 insertions(+)

diff --git a/tests/v3d/v3d_get_bo_offset.c b/tests/v3d/v3d_get_bo_offset.c
index 976a28b8..f0318016 100644
--- a/tests/v3d/v3d_get_bo_offset.c
+++ b/tests/v3d/v3d_get_bo_offset.c
@@ -24,6 +24,8 @@
 #include "igt.h"
 #include "igt_v3d.h"
 
+IGT_TEST_DESCRIPTION("Tests for the V3D's get BO offset IOCTL");
+
 igt_main
 {
 	int fd;
@@ -31,6 +33,8 @@ igt_main
 	igt_fixture
 		fd = drm_open_driver(DRIVER_V3D);
 
+	igt_describe("Make sure the offset returned by the creation of the BO is "
+		     "the same as the offset returned by the IOCTL");
 	igt_subtest("create-get-offsets") {
 		struct v3d_bo *bos[2] = {
 			igt_v3d_create_bo(fd, 4096),
@@ -54,6 +58,7 @@ igt_main
 		igt_v3d_free_bo(fd, bos[1]);
 	}
 
+	igt_describe("Make sure an offset cannot be returned for an invalid BO handle.");
 	igt_subtest("get-bad-handle") {
 		struct drm_v3d_get_bo_offset get = {
 			.handle = 0xd0d0d0d0,
diff --git a/tests/v3d/v3d_get_param.c b/tests/v3d/v3d_get_param.c
index 816a3c7d..0ca330eb 100644
--- a/tests/v3d/v3d_get_param.c
+++ b/tests/v3d/v3d_get_param.c
@@ -24,6 +24,8 @@
 #include "igt.h"
 #include "igt_v3d.h"
 
+IGT_TEST_DESCRIPTION("Tests for the V3D's get params IOCTL");
+
 igt_main
 {
 	int fd;
@@ -31,6 +33,7 @@ igt_main
 	igt_fixture
 		fd = drm_open_driver(DRIVER_V3D);
 
+	igt_describe("Sanity check for getting existent params.");
 	igt_subtest("base-params") {
 		enum drm_v3d_param last_base_param =
 			DRM_V3D_PARAM_V3D_CORE0_IDENT2;
@@ -48,6 +51,7 @@ igt_main
 			      0x443356 /* "V3D" */);
 	}
 
+	igt_describe("Make sure that getting params fails for non-existent params identifiers.");
 	igt_subtest("get-bad-param") {
 		struct drm_v3d_get_param get = {
 			.param = 0xd0d0d0d0,
@@ -55,6 +59,7 @@ igt_main
 		do_ioctl_err(fd, DRM_IOCTL_V3D_GET_PARAM, &get, EINVAL);
 	}
 
+	igt_describe("Make sure that getting params fails for non-zero pad.");
 	igt_subtest("get-bad-flags") {
 		struct drm_v3d_get_param get = {
 			.param = DRM_V3D_PARAM_V3D_HUB_IDENT1,
diff --git a/tests/v3d/v3d_mmap.c b/tests/v3d/v3d_mmap.c
index ad441607..5e2385bd 100644
--- a/tests/v3d/v3d_mmap.c
+++ b/tests/v3d/v3d_mmap.c
@@ -24,6 +24,8 @@
 #include "igt.h"
 #include "igt_v3d.h"
 
+IGT_TEST_DESCRIPTION("Tests for the V3D's mmap IOCTL");
+
 igt_main
 {
 	int fd;
@@ -31,6 +33,7 @@ igt_main
 	igt_fixture
 		fd = drm_open_driver(DRIVER_V3D);
 
+	igt_describe("Make sure an invalid BO cannot be mapped.");
 	igt_subtest("mmap-bad-handle") {
 		struct drm_v3d_mmap_bo get = {
 			.handle = 0xd0d0d0d0,
-- 
2.38.1
