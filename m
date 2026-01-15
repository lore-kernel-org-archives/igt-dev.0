Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FEAD4662B
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 22:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0088910E0DD;
	Thu, 15 Jan 2026 22:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ku9GoBh0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B1E10E0DD
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 22:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768516182; x=1800052182;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nhvWo3uAY3MoNUVFFcBNCvhw2iNO9SjFD7ymIMJkuTE=;
 b=Ku9GoBh0BYfOwd7edNMum+EzACECHS4cx/B4K61Ye5l0yFIyjAm3Xjy/
 VBa32cGfmv00FlqH/E0b1uu4DpBsAO8buueFAbLQ1N/jubMGnD5wqa9MR
 FS51m+9wZ2c2PcLt1oMJlt40qdYIA1dvERrD4RbTJyvW0Rw1bBLTecVO/
 dDx9yL8pDbaOuJmCoCcvAd5wbCi0MfgU0BjRpeMfY38+cQ1a+YJ25nHh5
 Am0u4aOfqEj4lHzWh1R24xlQg0CcCNczKzj3eJVJ7PFlUCW0dKlHt2rAA
 lS499Ax6avDsXMsEsnBbMF+lhnSjr8urhEWn6v9soab9c9VjStyaqRTEL g==;
X-CSE-ConnectionGUID: Zl329wnmTGmcPsb5a7M8rA==
X-CSE-MsgGUID: ubLuN0s9TXCJoeB6d7upwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69924780"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="69924780"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 14:29:42 -0800
X-CSE-ConnectionGUID: KgDOvj65R+yQigMqXdRjkw==
X-CSE-MsgGUID: PZr3+pCRQ++rSivGHNalkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="204207926"
Received: from dut6079bmgfrd.fm.intel.com ([10.80.54.95])
 by orviesa006.jf.intel.com with ESMTP; 15 Jan 2026 14:29:42 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2] lib/xe/xe_legacy: Cleanups in xe_legacy_test_mode()
Date: Thu, 15 Jan 2026 22:29:38 +0000
Message-Id: <20260115222938.330490-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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
4. Unmap data before returning to avoid a VM leak.
5. As i start from n_execs, which always will be non-zero, base_addr always
   will be assgined with addr.

Except for item 4, these changes should have no functional impact.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 lib/xe/xe_legacy.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 084445305..dcd7e2075 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -22,7 +22,6 @@
 #define CAT_ERROR			(0x1 << 5)
 #define CLOSE_EXEC_QUEUES		(0x1 << 2)
 #define CLOSE_FD			(0x1 << 1)
-/* Batch buffer element count, in number of dwords(u32) */
 #define GT_RESET			(0x1 << 0)
 #define MAX_N_EXECQUEUES		16
 
@@ -65,9 +64,6 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	} *data;
 	struct xe_spin_opts spin_opts = {
 		.preempt = flags & PREEMPT,
-#define THREE_SEC	(3 * 1000000000ull)
-		.ctx_ticks = flags & LONG_SPIN ?
-			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
 	};
 	int i, b;
 	int extra_execs = (flags & LONG_SPIN_REUSE_QUEUE) ? n_exec_queues : 0;
@@ -77,8 +73,14 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
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
@@ -175,6 +177,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			for (i = 0; i < n_exec_queues; i++)
 				xe_exec_queue_destroy(fd, exec_queues[i]);
 		}
+		munmap(data, bo_size);
 		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
@@ -187,8 +190,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	for (i = n_execs; i < n_execs + extra_execs; i++) {
-		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && !i)
-			? (addr + bo_size * 128) : addr;
+		u64 base_addr = addr;
 		u64 batch_offset = (char *)&data[i].batch - (char *)data;
 		u64 batch_addr = base_addr + batch_offset;
 		u64 sdi_offset = (char *)&data[i].data - (char *)data;
-- 
2.34.1

