Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F25606A32C
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dqFM/LXG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D0A1122F8;
	Thu, 29 Oct 2026 14:00:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E551122F8
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 13:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793282399; x=1824818399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gqtj9qy5PB+6EWIuNt+QwGuPfazZHeRUBBOCPiQkaQo=;
 b=dqFM/LXGliph4Yic/mfoG6aCjk85XgjaciWYZUVmnotzFTvNaJ1NaBXY
 uaIbvonlabGasqAXwGet8VyE1glSB817TR1UUP0GuWYc2IXob9DGJneS6
 FFZP0E4tG5CYBjo1RFg9kT+/h2PlucbhgJueQmGG4ytY5Kx0fol9l+Aa9
 sVo4WXY32E/588zq//Knl8rze1HknhoSmwpczg89f3gm1AOOEn8gsP5SR
 +9FlJTafET9VY2TaLkthF6pql9fO2EfOJfYs9hsWHymR0mu6Jdv5ZGFEj
 09CYV40nkhVIH0at31HHsyxIQst5SGf2l2yNDRkD45KDyxHjRQka/SXkl w==;
X-CSE-ConnectionGUID: NBt6yJKUR5q4vgd3RTCmVw==
X-CSE-MsgGUID: lwts2LpxQ36iCD4bTQLEiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1938151"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1938151"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 06:59:59 -0700
X-CSE-ConnectionGUID: mes6DwxWSu+xDrTOOH8p1A==
X-CSE-MsgGUID: Usr5gVBVRQCl4H3B4VZVwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5115915"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by orviesa001.jf.intel.com with ESMTP; 29 Oct 2026 06:59:57 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	himanshu.girotra@intel.com
Cc: kamil.konieczny@linux.intel.com
Subject: [PATCH] tests/intel/xe_evict: reduce migration log volume in large
 threaded tests
Date: Thu, 29 Oct 2026 13:59:56 +0000
Message-ID: <20261029135956.1552334-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nishit Sharma <nishit.sharma@intel.com>

Large threaded eviction subtests can generate excessive kernel debug
output on high-VRAM devices. The Xe migration path logs once per 8 MiB
chunk, which can exceed the IGT runner's disk-usage limit and cause the
runner to kill the test.

Reduce n_execs from 16 to 12 for all large threaded eviction variants.
This lowers the working set and migration volume while retaining VRAM
overcommit and the existing queue/VM pairing requirements.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_evict.c | 48 ++++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 230357419..657b2328b 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -13,6 +13,7 @@
  */
 
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
@@ -850,13 +851,13 @@ int igt_main()
 			MIXED_THREADS | THREADED | MULTI_QUEUE },
 		{ "mixed-many-threads-small", 3, 16, 128, 1, 128,
 			THREADED },
-		{ "threads-large", 2, 2, 16, 3, 32,
+		{ "threads-large", 2, 2, 12, 3, 32,
 			THREADED },
-		{ "cm-threads-large", 2, 2, 16, 3, 32,
+		{ "cm-threads-large", 2, 2, 12, 3, 32,
 			COMPUTE_THREAD | THREADED },
-		{ "mixed-threads-large", 2, 2, 16, 3, 32,
+		{ "mixed-threads-large", 2, 2, 12, 3, 32,
 			MIXED_THREADS | THREADED },
-		{ "mixed-many-threads-large", 3, 2, 16, 3, 32,
+		{ "mixed-many-threads-large", 3, 2, 12, 3, 32,
 			THREADED },
 		{ "threads-small-multi-vm", 2, 16, 128, 1, 128,
 			MULTI_VM | THREADED },
@@ -864,11 +865,11 @@ int igt_main()
 			COMPUTE_THREAD | MULTI_VM | THREADED },
 		{ "mixed-threads-small-multi-vm", 2, 16, 128, 1, 128,
 			MIXED_THREADS | MULTI_VM | THREADED },
-		{ "threads-large-multi-vm", 2, 2, 16, 3, 32,
+		{ "threads-large-multi-vm", 2, 2, 12, 3, 32,
 			MULTI_VM | THREADED },
-		{ "cm-threads-large-multi-vm", 2, 2, 16, 3, 32,
+		{ "cm-threads-large-multi-vm", 2, 2, 12, 3, 32,
 			COMPUTE_THREAD | MULTI_VM | THREADED },
-		{ "mixed-threads-large-multi-vm", 2, 2, 16, 3, 32,
+		{ "mixed-threads-large-multi-vm", 2, 2, 12, 3, 32,
 			MIXED_THREADS | MULTI_VM | THREADED },
 		{ "beng-threads-small", 2, 16, 128, 1, 128,
 			THREADED | BIND_EXEC_QUEUE },
@@ -878,13 +879,13 @@ int igt_main()
 			MIXED_THREADS | THREADED | BIND_EXEC_QUEUE },
 		{ "beng-mixed-many-threads-small", 3, 16, 128, 1, 128,
 			THREADED | BIND_EXEC_QUEUE },
-		{ "beng-threads-large", 2, 2, 16, 3, 32,
+		{ "beng-threads-large", 2, 2, 12, 3, 32,
 			THREADED | BIND_EXEC_QUEUE },
-		{ "beng-cm-threads-large", 2, 2, 16, 3, 32,
+		{ "beng-cm-threads-large", 2, 2, 12, 3, 32,
 			COMPUTE_THREAD | THREADED | BIND_EXEC_QUEUE },
-		{ "beng-mixed-threads-large", 2, 2, 16, 3, 32,
+		{ "beng-mixed-threads-large", 2, 2, 12, 3, 32,
 			MIXED_THREADS | THREADED | BIND_EXEC_QUEUE },
-		{ "beng-mixed-many-threads-large", 3, 2, 16, 3, 32,
+		{ "beng-mixed-many-threads-large", 3, 2, 12, 3, 32,
 			THREADED | BIND_EXEC_QUEUE },
 		{ "beng-threads-small-multi-vm", 2, 16, 128, 1, 128,
 			MULTI_VM | THREADED | BIND_EXEC_QUEUE },
@@ -892,11 +893,11 @@ int igt_main()
 			COMPUTE_THREAD | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
 		{ "beng-mixed-threads-small-multi-vm", 2, 16, 128, 1, 128,
 			MIXED_THREADS | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
-		{ "beng-threads-large-multi-vm", 2, 2, 16, 3, 32,
+		{ "beng-threads-large-multi-vm", 2, 2, 12, 3, 32,
 			MULTI_VM | THREADED | BIND_EXEC_QUEUE },
-		{ "beng-cm-threads-large-multi-vm", 2, 2, 16, 3, 32,
+		{ "beng-cm-threads-large-multi-vm", 2, 2, 12, 3, 32,
 			COMPUTE_THREAD | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
-		{ "beng-mixed-threads-large-multi-vm", 2, 2, 16, 3, 32,
+		{ "beng-mixed-threads-large-multi-vm", 2, 2, 12, 3, 32,
 			MIXED_THREADS | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
 		{ NULL },
 	};
@@ -905,12 +906,31 @@ int igt_main()
 	int fd;
 
 	igt_fixture() {
+		int dir;
+
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(xe_has_vram(fd));
 		vram_size = xe_visible_vram_size(fd, 0);
 		igt_assert(vram_size);
 		system_size = igt_get_avail_ram_mb() << 20;
 
+		/*
+		 * The KMD emits a DRM_UT_DRIVER debug line for every 8 MiB chunk
+		 * it migrates, so the large eviction subtests can flood the log
+		 * on big-VRAM devices and exceed the runner's disk usage limit.
+		 * Under CI, drop only that category and restore it on exit.
+		 */
+		dir = igt_sysfs_drm_module_params_open();
+		if (dir >= 0) {
+			int debug_mask = igt_drm_debug_mask_get(dir);
+
+			close(dir);
+			if (debug_mask > 0 && (debug_mask & DRM_UT_DRIVER)) {
+				igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+				update_debug_mask_if_ci(debug_mask & ~DRM_UT_DRIVER);
+			}
+		}
+
 		xe_for_each_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
 				break;
-- 
2.43.0

