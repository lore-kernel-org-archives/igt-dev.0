Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28F3D4662B
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 21:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787DE10E7CA;
	Thu, 15 Jan 2026 21:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/7XrUFB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C7610E7CA
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 21:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768514297; x=1800050297;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vd4g1FaJwxQd041OlOEWX/a87CojGJdx25n021fgmLU=;
 b=W/7XrUFBPTUbHLOErH14ZjxFhCYZGCGYtQEKhpRSGH0eiYOW7iuxB0Yc
 BMLtJDS2yWF3Xp5ivCqva1Xpvt8gzsoruK8or0+zhJVponOPbRHZkiT5x
 ttPA/j7nzrqdlZ6SEdeE5L1C5dO8+WP/UljTN0is26KMk0tUJEPa4i0Mm
 LBiutDnTbNjiQx/eBaVBESTdYnar0eaAjpwE5X49RmQND+kGcFjQ4FPiN
 4hz4MT9APQFopnddIBcobDdITmHFcWfP1fZaJQ5NEKAJRzKHadBEnFbUD
 8efMu2VpEJHk+PM2aMXpy0ykgxRM5m1BYitrbkVSvBCYRE7kxmYLWV1yO w==;
X-CSE-ConnectionGUID: SEZYcaEnTim918JZGtM9bQ==
X-CSE-MsgGUID: rqiTiQueQu2rHUaDN9fhLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="92498917"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="92498917"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 13:58:17 -0800
X-CSE-ConnectionGUID: tugMnOBmThiiczORoQKYIQ==
X-CSE-MsgGUID: 2EsxdWlMTXOjUj3ZQnd++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="235760784"
Received: from dut6282dg2frd.fm.intel.com ([10.36.25.42])
 by orviesa002.jf.intel.com with ESMTP; 15 Jan 2026 13:58:16 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] lib/xe/xe_legacy: Cleanups in xe_legacy_test_mode()
Date: Thu, 15 Jan 2026 21:58:14 +0000
Message-ID: <20260115215814.283403-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.43.0
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

This commit performs a set of small cleanups in xe_legacy_test_mode():
1. Remove a duplicate comment for BATCH_DW_COUNT.
2. Move LONG_SPIN ctx_ticks initialization to after the fd is opened.
3. Add an assertion for CLOSE_FD to prevent fd leaks.
4. Replace space with tab in syncobj_create() line.
5. Unmap data before returning to avoid a VM leak.
6. As i start from n_execs, which always will be non-zero, base_addr always
   will be assgined with addr.

Except for item 5, these changes should have no functional impact.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 lib/xe/xe_legacy.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 4a6244657..5eacbb75a 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -22,7 +22,6 @@
 #define CAT_ERROR			(0x1 << 5)
 #define CLOSE_EXEC_QUEUES		(0x1 << 2)
 #define CLOSE_FD			(0x1 << 1)
-/* Batch buffer element count, in number of dwords(u32) */
 #define GT_RESET			(0x1 << 0)
 #define MAX_N_EXECQUEUES		16
 
@@ -71,9 +70,6 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	} *data;
 	struct xe_spin_opts spin_opts = {
 		.preempt = flags & PREEMPT,
-#define THREE_SEC	(3 * 1000000000ull)
-		.ctx_ticks = flags & LONG_SPIN ?
-			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
 	};
 	int i, b, hang_exec_queue = n_exec_queues / 2;
 	int fault_position = 0;
@@ -90,8 +86,14 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & COMPRESSION)
 		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
 
-	if (flags & CLOSE_FD)
+	if (flags & CLOSE_FD) {
+		igt_assert_eq(fd, -1);
 		fd = drm_open_driver(DRIVER_XE);
+	}
+
+#define THREE_SEC	(3 * 1000000000ull)
+	if (flags & LONG_SPIN)
+		spin_opts.ctx_ticks = xe_spin_nsec_to_ticks(fd, 0, THREE_SEC);
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * (n_execs + extra_execs);
@@ -128,7 +130,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		} else {
 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		}
- 		syncobjs[i] = syncobj_create(fd, 0);
+		syncobjs[i] = syncobj_create(fd, 0);
 	}
 
 	sync[0].handle = syncobj_create(fd, 0);
@@ -202,6 +204,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			for (i = 0; i < n_exec_queues; i++)
 				xe_exec_queue_destroy(fd, exec_queues[i]);
 		}
+		munmap(data, bo_size);
 		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
@@ -214,8 +217,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	for (i = n_execs; i < n_execs + extra_execs; i++) {
-		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && !i)
-			? (addr + bo_size * 128) : addr;
+		u64 base_addr = addr;
 		u64 batch_offset = (char *)&data[i].batch - (char *)data;
 		u64 batch_addr = base_addr + batch_offset;
 		u64 sdi_offset = (char *)&data[i].data - (char *)data;
-- 
2.43.0

