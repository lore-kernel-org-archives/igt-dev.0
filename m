Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DD2CA5FB8
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 17:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0651E10E639;
	Tue, 20 Jan 2026 17:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dy56srXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F3910E639
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 17:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768928725; x=1800464725;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L+oLKMo/gwByEzsAjL9WICYVCEFTXvKuf8pxStnoT6I=;
 b=Dy56srXLrJ90hO5viG6eQLFbfuj5WaZInh1rHyxS9yBJ/a9nlGLL+3nu
 qPejSwFG/0FZUMLywB64GIIbh8/11jPJgWl2VjlKKB21zBwpYVVY/WdCn
 aXIUrO+ScsmV+cCGHacjbXibeyzS5AzlF6YdppEhb6sKidMtPHib55djZ
 0OigNsJorQ8NYwdTVp2HFsVnRBOnJEb7PCVlKGd8ZLJnJWQ6tc6HkpDOJ
 VAP0ZewYkDSPx5gTuGhrXH4cJsi4nazZi6MYtmeadmwsZRyucwa8dNfh4
 UW9lMh8NiJDtoLVuA09JtjuxBFTKeq0HqvyAqM9lWbWv9KOO+HSMaQa51 Q==;
X-CSE-ConnectionGUID: kLfJQzZuQWycXXtUaDBIZA==
X-CSE-MsgGUID: 0BGDdnZXRGC2GA08SUAYRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70117695"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="70117695"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:05:25 -0800
X-CSE-ConnectionGUID: GY8TpJB+SvmuHCUFmXJHGw==
X-CSE-MsgGUID: VFBkLBUeR9qwGTwSs7iU5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206217705"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.32])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:05:24 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/gem_tiled_pread_basic: Create basic subtest
Date: Tue, 20 Jan 2026 18:05:07 +0100
Message-ID: <20260120170507.131181-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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

Create basic subtest and make proper cleanup in igt_fixture.
Also while at this, sort include headers.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_tiled_pread_basic.c | 40 +++++++++++++++++++----------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/tests/intel/gem_tiled_pread_basic.c b/tests/intel/gem_tiled_pread_basic.c
index 9b5d82865..7c6ef0540 100644
--- a/tests/intel/gem_tiled_pread_basic.c
+++ b/tests/intel/gem_tiled_pread_basic.c
@@ -35,19 +35,19 @@
  * other systems.
  */
 
-#include "igt.h"
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
+#include <errno.h>
 #include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
 #include <sys/stat.h>
 #include <sys/time.h>
-#include <sys/ioctl.h>
 
 #include "drm.h"
 #include "i915/gem_create.h"
+#include "igt.h"
 /**
  * TEST: gem tiled pread basic
  * Description: Test pread behavior on tiled objects with respect to the reported swizzling value.
@@ -57,7 +57,8 @@
  * Functionality: tiled pread/pwrite
  * Feature: gtt, mapping
  *
- * SUBTEST:
+ * SUBTEST: basic
+ * Description: Basic test to check swizzled offsets and values.
  */
 
 IGT_TEST_DESCRIPTION("Test pread behavior on tiled objects with respect to the"
@@ -127,19 +128,16 @@ calculate_expected(int offset, struct offset *dbg)
 	return (dbg->base_y + dbg->tile_y) * WIDTH + dbg->base_x + dbg->tile_x;
 }
 
-int igt_simple_main()
+static void
+basic_test(int fd)
 {
-	int fd;
 	int i, iter = 100;
 	uint32_t tiling, swizzle;
 	uint32_t handle;
 	uint32_t devid;
 
-	fd = drm_open_driver(DRIVER_INTEL);
-	igt_require(gem_available_fences(fd) > 0);
 	handle = create_bo(fd);
 	igt_require(gem_get_tiling(fd, handle, &tiling, &swizzle));
-	gem_require_pread_pwrite(fd);
 
 	devid = intel_get_drm_devid(fd);
 
@@ -231,7 +229,23 @@ int igt_simple_main()
 				     offset, offset + len,
 				     swizzle_str);
 		}
+	} /* for i < iter */
+}
+
+int igt_main()
+{
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_INTEL);
+		igt_require(gem_available_fences(fd) > 0);
+		gem_require_pread_pwrite(fd);
 	}
 
-	drm_close_driver(fd);
+	igt_subtest("basic")
+		basic_test(fd);
+
+	igt_fixture()
+		drm_close_driver(fd);
+
 }
-- 
2.52.0

