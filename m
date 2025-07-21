Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4848CC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 15:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F051010E477;
	Mon, 21 Jul 2025 15:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5HRExCq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEB110E2BC
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 15:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753113548; x=1784649548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GsOO5qcTHpDYeShToIc4xbc7DOD2sUKcbkk99AhGEZo=;
 b=T5HRExCqXnV2Ff43Jmk7HhOUeyGEqviwpQ2XGDWl8eszWhElshBadXvh
 FI9CQPufHNubYmTBIpPTtdmbpYqYDmdqFCiKfeMgvu2057Dbe/+obV3AV
 Qr/+NBGQwmBnmobT5l/yOMGYv8oipv2H/A8cxqRrt6ry8G6lgxZaW91Ju
 pM9wMqTXTRt+tvm7uKwaqPLd8R+RZxCMmpLJAfETrwgMsDMqfmYrrlpD5
 9HArp3cE7fToiMQY7j6yBGGdkqGxcJdUH+VK6toeRzvcCgbw6CGzOuIEw
 PaHBwSjSBQDU1H7Dv7YXtMBjXo2vFUNuYDEdGsYUfnzcfyqruLHEKqvBr g==;
X-CSE-ConnectionGUID: 6msmsz0jTvaGGM28anGsbg==
X-CSE-MsgGUID: ICHlNKezR9KBiY3aAM30OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="65597037"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="65597037"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 08:59:05 -0700
X-CSE-ConnectionGUID: vmlTB7hSQf6CFUDINuiImg==
X-CSE-MsgGUID: 0zP8/X0dRLSGPz88BrpCWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="162924237"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.55])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 08:58:50 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Vignesh Raman <vignesh.raman@collabora.com>
Subject: [PATCH i-g-t v2 2/2] lib/igt_vc4: Fix musl libc compilation
Date: Mon, 21 Jul 2025 17:58:24 +0200
Message-ID: <20250721155824.112474-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721155824.112474-1-kamil.konieczny@linux.intel.com>
References: <20250721155824.112474-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Fix gcc compilation on Void Linux with musl C libs, where
PAGE_SIZE is already defined. As this is specific for GPU use
VC4_GPU_PAGE_SIZE.

Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_vc4.h               |  2 +-
 tests/vc4/vc4_create_bo.c   |  4 ++--
 tests/vc4/vc4_label_bo.c    |  6 +++---
 tests/vc4/vc4_lookup_fail.c |  2 +-
 tests/vc4/vc4_mmap.c        | 12 ++++++------
 tests/vc4/vc4_tiling.c      | 12 ++++++------
 tests/vc4/vc4_wait_bo.c     |  4 ++--
 7 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
index fe7173c50..901bb25f8 100644
--- a/lib/igt_vc4.h
+++ b/lib/igt_vc4.h
@@ -31,7 +31,7 @@
 #include "igt_fb.h"
 #include "vc4_drm.h"
 
-#define PAGE_SIZE 4096
+#define VC4_GPU_PAGE_SIZE 4096
 
 uint32_t igt_vc4_get_cleared_bo(int fd, size_t size, uint32_t clearval);
 int igt_vc4_create_bo(int fd, size_t size);
diff --git a/tests/vc4/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
index ba7db1985..c67f626f9 100644
--- a/tests/vc4/vc4_create_bo.c
+++ b/tests/vc4/vc4_create_bo.c
@@ -34,7 +34,7 @@ igt_main
 	}
 
 	igt_subtest("create-bo-4096") {
-		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
+		int handle = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
 		gem_close(fd, handle);
 	}
 
@@ -53,7 +53,7 @@ igt_main
 		 * to convince it to land as the only one of its size in the
 		 * kernel BO cache
 		 */
-		size_t size = 3 * PAGE_SIZE, i;
+		size_t size = 3 * VC4_GPU_PAGE_SIZE, i;
 
 		/* Make a BO and free it on our main fd. */
 		handle = igt_vc4_create_bo(fd, size);
diff --git a/tests/vc4/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
index 5d626a92d..dc0ddaa15 100644
--- a/tests/vc4/vc4_label_bo.c
+++ b/tests/vc4/vc4_label_bo.c
@@ -49,7 +49,7 @@ igt_main
 	}
 
 	igt_subtest("set-label") {
-		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
+		int handle = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
 		set_label(fd, handle, "a test label", 0);
 		set_label(fd, handle, "a new test label", 0);
 		gem_close(fd, handle);
@@ -60,7 +60,7 @@ igt_main
 	}
 
 	igt_subtest("set-bad-name") {
-		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
+		int handle = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
 
 		struct drm_vc4_label_bo label = {
 			.handle = handle,
@@ -74,7 +74,7 @@ igt_main
 	}
 
 	igt_subtest("set-kernel-name") {
-		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
+		int handle = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
 		set_label(fd, handle, "BCL", 0);
 		set_label(fd, handle, "a test label", 0);
 		set_label(fd, handle, "BCL", 0);
diff --git a/tests/vc4/vc4_lookup_fail.c b/tests/vc4/vc4_lookup_fail.c
index 9f179a3fd..76b52ecf3 100644
--- a/tests/vc4/vc4_lookup_fail.c
+++ b/tests/vc4/vc4_lookup_fail.c
@@ -33,7 +33,7 @@ igt_main
 		fd = drm_open_driver(DRIVER_VC4);
 
 	igt_subtest("bad-color-write") {
-		uint32_t size = PAGE_SIZE;
+		uint32_t size = VC4_GPU_PAGE_SIZE;
 		/* A single row will be a page. */
 		uint32_t width = 1024;
 		uint32_t height = size / (width * 4);
diff --git a/tests/vc4/vc4_mmap.c b/tests/vc4/vc4_mmap.c
index fef25f334..7ca08811e 100644
--- a/tests/vc4/vc4_mmap.c
+++ b/tests/vc4/vc4_mmap.c
@@ -28,16 +28,16 @@ igt_main
 	igt_describe("Test basics of newly mapped bo like default content, write and read "
 		     "coherency, mapping existence after gem_close and unmapping.");
 	igt_subtest("mmap-bo") {
-		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
-		uint32_t *map = igt_vc4_mmap_bo(fd, handle, PAGE_SIZE, PROT_READ | PROT_WRITE);
-		uint8_t expected[PAGE_SIZE];
+		int handle = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
+		uint32_t *map = igt_vc4_mmap_bo(fd, handle, VC4_GPU_PAGE_SIZE, PROT_READ | PROT_WRITE);
+		uint8_t expected[VC4_GPU_PAGE_SIZE];
 
 		/* Testing contents of newly created objects. */
 		memset(expected, 0, sizeof(expected));
 		igt_assert_eq(memcmp(map, expected, sizeof(expected)), 0);
 
-		memset(map, 0xd0, PAGE_SIZE);
-		memset(expected, 0xd0, PAGE_SIZE);
+		memset(map, 0xd0, VC4_GPU_PAGE_SIZE);
+		memset(expected, 0xd0, VC4_GPU_PAGE_SIZE);
 		igt_assert_eq(memcmp(expected, map, sizeof(expected)), 0);
 
 		/* Testing that mapping stays after close */
@@ -45,7 +45,7 @@ igt_main
 		igt_assert_eq(memcmp(expected, map, sizeof(expected)), 0);
 
 		/* Testing unmapping */
-		munmap(map, PAGE_SIZE);
+		munmap(map, VC4_GPU_PAGE_SIZE);
 	}
 
 	igt_fixture
diff --git a/tests/vc4/vc4_tiling.c b/tests/vc4/vc4_tiling.c
index e9d3ebfb3..923e210e7 100644
--- a/tests/vc4/vc4_tiling.c
+++ b/tests/vc4/vc4_tiling.c
@@ -49,7 +49,7 @@ igt_main
 	}
 
 	igt_subtest("get-bad-flags") {
-		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
+		int bo = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
 		struct drm_vc4_get_tiling get = {
 			.handle = bo,
 			.flags = 0xd0d0d0d0,
@@ -59,7 +59,7 @@ igt_main
 	}
 
 	igt_subtest("set-bad-flags") {
-		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
+		int bo = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
 		struct drm_vc4_set_tiling set = {
 			.handle = bo,
 			.flags = 0xd0d0d0d0,
@@ -70,7 +70,7 @@ igt_main
 	}
 
 	igt_subtest("get-bad-modifier") {
-		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
+		int bo = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
 		struct drm_vc4_get_tiling get = {
 			.handle = bo,
 			.modifier = 0xd0d0d0d0,
@@ -80,7 +80,7 @@ igt_main
 	}
 
 	igt_subtest("set-bad-modifier") {
-		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
+		int bo = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
 		struct drm_vc4_set_tiling set = {
 			.handle = bo,
 			.modifier = 0xd0d0d0d0,
@@ -90,7 +90,7 @@ igt_main
 	}
 
 	igt_subtest("set-get") {
-		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
+		int bo = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
 
 		/* Default is untiled. */
 		igt_assert(igt_vc4_get_tiling(fd, bo) == DRM_FORMAT_MOD_LINEAR);
@@ -111,7 +111,7 @@ igt_main
 		/* Some size that probably nobody else is using, to
 		 * encourage getting the same BO back from the cache.
 		 */
-		int size = 91 * PAGE_SIZE;
+		int size = 91 * VC4_GPU_PAGE_SIZE;
 		int bo;
 
 		bo = igt_vc4_create_bo(fd, size);
diff --git a/tests/vc4/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
index d309acc95..3f4fb4dc6 100644
--- a/tests/vc4/vc4_wait_bo.c
+++ b/tests/vc4/vc4_wait_bo.c
@@ -28,7 +28,7 @@
 static void
 test_used_bo(int fd, uint64_t timeout)
 {
-	size_t size = PAGE_SIZE;
+	size_t size = VC4_GPU_PAGE_SIZE;
 	uint32_t clearval = 0xaabbccdd + timeout;
 	int handle = igt_vc4_get_cleared_bo(fd, size, clearval);
 	struct drm_vc4_wait_bo wait = {
@@ -65,7 +65,7 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_VC4);
 		igt_require(igt_vc4_is_v3d(fd));
-		bo_handle = igt_vc4_create_bo(fd, PAGE_SIZE);
+		bo_handle = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
 	}
 
 	igt_subtest("bad-bo") {
-- 
2.50.1

