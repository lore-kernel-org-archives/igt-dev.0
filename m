Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D9FC4828F
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 15:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D42B10EF4F;
	Thu,  1 Feb 2024 15:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRiL60W9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D2410EF4F
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706802684; x=1738338684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J0Pzk3EiFeqklJF/wB5NorG/bjnLtLBWDeN/nWAkjmg=;
 b=QRiL60W9d2h+3g3HHpJ85PwxufMW+5jUnUXt+zy394GGRfTqk1tu8ZAK
 Zk/Qlmjf+ibuFpSnYM1ByHbbDAy/5rEndbPvh12I5sOaL5Mn3bn5U0I9K
 iAYptzzu4+QLqO9ZpBz+q195ArVySjLdt2kandmOWrokXMsF5RKwXzwPw
 3KbMTAZ/L6UKZXXCicEJ/ZYIG1oTWU8uS0SX7VyDP0ZJIk0c7ajRRou64
 3TOzPhkcXEfAxYA7ZRWzfDQmZLa39rH+IeuJoDABJW1RrYb+ioQ87u9Ya
 N6FQ+PCsmwywsuD0VNlUCPVMU+TYrxc/fqdoYGlmdivZMWZevWoo5U9TR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="102155"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="102155"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:51:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="114037"
Received: from msterni-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.112.128])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:51:23 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t v6 8/8] tests/intel/gem_mmap: add basic multi-GPU subtest
Date: Thu,  1 Feb 2024 16:50:47 +0100
Message-ID: <20240201155047.48608-9-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240201155047.48608-1-kamil.konieczny@linux.intel.com>
References: <20240201155047.48608-1-kamil.konieczny@linux.intel.com>
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

Test basic mmap for two or more GPU cards.

v2: renamed subtest to multigpu-basic (Kamil)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/gem_mmap.c | 77 +++++++++++++++++++++++++++---------------
 1 file changed, 50 insertions(+), 27 deletions(-)

diff --git a/tests/intel/gem_mmap.c b/tests/intel/gem_mmap.c
index d4ca1eda7..64ec25e87 100644
--- a/tests/intel/gem_mmap.c
+++ b/tests/intel/gem_mmap.c
@@ -38,6 +38,8 @@
 
 #include "drm.h"
 #include "i915/gem_create.h"
+#include "intel_multigpu.h"
+
 /**
  * TEST: gem mmap
  * Description: Basic MMAP IOCTL tests for memory regions.
@@ -79,6 +81,11 @@
  *   object.
  * Run type: FULL
  *
+ * SUBTEST: multigpu-basic
+ * Description:
+ *   Test basics of mmap on two or more GPUs.
+ * Run type: BAT
+ *
  * SUBTEST: pf-nonblock
  * Description:
  *   Verify that GTT page faults are asynchronous to GPU rendering and completes within a
@@ -209,12 +216,40 @@ static int mmap_ioctl(int i915, struct drm_i915_gem_mmap *arg)
 	return err;
 }
 
-igt_main
+static void test_basic(int i915, int pat)
 {
+	struct drm_i915_gem_mmap arg = {
+		.handle = gem_create(fd, OBJECT_SIZE),
+		.size = OBJECT_SIZE,
+	};
 	uint8_t expected[OBJECT_SIZE];
 	uint8_t buf[OBJECT_SIZE];
 	uint8_t *addr;
 
+	igt_assert_eq(mmap_ioctl(fd, &arg), 0);
+	addr = from_user_pointer(arg.addr_ptr);
+
+	igt_info("Testing contents of newly created object.\n");
+	memset(expected, 0, sizeof(expected));
+	igt_assert(memcmp(addr, expected, sizeof(expected)) == 0);
+
+	igt_info("Testing coherency of writes and mmap reads.\n");
+	memset(buf, 0, sizeof(buf));
+	memset(buf + 1024, pat, 1024);
+	memset(expected + 1024, pat, 1024);
+	gem_write(fd, arg.handle, 0, buf, OBJECT_SIZE);
+	igt_assert(memcmp(buf, addr, sizeof(buf)) == 0);
+
+	igt_info("Testing that mapping stays after close\n");
+	gem_close(fd, arg.handle);
+	igt_assert(memcmp(buf, addr, sizeof(buf)) == 0);
+
+	igt_info("Testing unmapping\n");
+	munmap(addr, OBJECT_SIZE);
+}
+
+igt_main
+{
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require(gem_has_legacy_mmap(fd));
@@ -306,36 +341,13 @@ igt_main
 
 	igt_describe("Test basics of newly mapped gem object like default content, write and read "
 		     "coherency, mapping existence after gem_close and unmapping.");
-	igt_subtest("basic") {
-		struct drm_i915_gem_mmap arg = {
-			.handle = gem_create(fd, OBJECT_SIZE),
-			.size = OBJECT_SIZE,
-		};
-		igt_assert_eq(mmap_ioctl(fd, &arg), 0);
-		addr = from_user_pointer(arg.addr_ptr);
-
-		igt_info("Testing contents of newly created object.\n");
-		memset(expected, 0, sizeof(expected));
-		igt_assert(memcmp(addr, expected, sizeof(expected)) == 0);
-
-		igt_info("Testing coherency of writes and mmap reads.\n");
-		memset(buf, 0, sizeof(buf));
-		memset(buf + 1024, 0x01, 1024);
-		memset(expected + 1024, 0x01, 1024);
-		gem_write(fd, arg.handle, 0, buf, OBJECT_SIZE);
-		igt_assert(memcmp(buf, addr, sizeof(buf)) == 0);
-
-		igt_info("Testing that mapping stays after close\n");
-		gem_close(fd, arg.handle);
-		igt_assert(memcmp(buf, addr, sizeof(buf)) == 0);
-
-		igt_info("Testing unmapping\n");
-		munmap(addr, OBJECT_SIZE);
-	}
+	igt_subtest("basic")
+		test_basic(fd, 1);
 
 	igt_describe("Map small buffer object though direct CPU access, bypassing GPU.");
 	igt_subtest("short-mmap") {
 		uint32_t handle = gem_create(fd, OBJECT_SIZE);
+		uint8_t *addr;
 
 		igt_assert(OBJECT_SIZE > 4096);
 
@@ -373,4 +385,15 @@ igt_main
 
 	igt_fixture
 		drm_close_driver(fd);
+
+	igt_describe("Test basics of mapped on two or more GPUs.");
+	igt_subtest("multigpu-basic") {
+		igt_multi_fork_foreach_gpu(gpu, DRIVER_INTEL) {
+			int pat = 1 + rand() % 128;
+
+			igt_info("Basic mmap test with pattern x%x\n", pat);
+			test_basic(gpu, pat);
+		}
+		igt_waitchildren();
+	}
 }
-- 
2.42.0

