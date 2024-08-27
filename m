Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CB0C54735
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 11:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A720710E2FB;
	Tue, 27 Aug 2024 11:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJmEWtg1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F56E10E307
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 11:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724757647; x=1756293647;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6Dykk+GVLnZw+eUy6Z88LyDeZnmJvjzTLVcgjkQCpSQ=;
 b=KJmEWtg1rAgZ5BPbeCmZbkS2g4KbcXNxdrkWoMSfsAVe+Kxz6l4LhU06
 qcPFopyCKSM/4ENkC+GOu3+vKNnqPKcOKz+KAe2ruyG9W3bY2GDgkvJgi
 a+8wJ0uz0H+aUYMcsTFWN91atFUCEO5n7gnM9l+ylLw11V9AN8MDz65vB
 XNmImG2TQ3qm8wz7zp1wo/GQ5rU9G/rwJcPl8ZBsmdz3v7z3x3CjD7Rxk
 he3+rU9AlOUyYfzDF7FaqlL1nzh1Ccfa+V6YQMw+5uOA8/16eTNYlBM1m
 zqp8QEZzp6OI/9Zw0Mzc+FBe9cYwKX3a/hqXbA/Fek8DH89EgZQGAyUNL Q==;
X-CSE-ConnectionGUID: lEgl8YU/RT22yfGdqqbPBg==
X-CSE-MsgGUID: UA52hza6TWafhdxhbCpeZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23353068"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="23353068"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 04:20:47 -0700
X-CSE-ConnectionGUID: 3N7R56DETiib0Z1GJ3QikA==
X-CSE-MsgGUID: 4vDIiS76Q1CVVVscAwexmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62665680"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 04:20:45 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, Nirmoy Das <nirmoy.das@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_fault_mode: Don't return early
Date: Tue, 27 Aug 2024 12:52:22 +0200
Message-ID: <20240827105222.13650-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Tests that are causing pagefaults should wait for exec queue to be ban
otherwise pending engine resets because of on-going pagefaults would
cause failure in subsequent tests to fail.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 1f1f1e50b..339c79353 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -36,6 +36,22 @@
 #define INVALID_VA	(0x1 << 8)
 #define ENABLE_SCRATCH  (0x1 << 9)
 
+static int get_ban_property(int xe, struct drm_xe_engine_class_instance *eci,
+			    uint32_t vm, uint32_t exec_queue)
+{
+	struct drm_xe_exec_queue_get_property args = {
+		.value = -1,
+		.reserved[0] = 0,
+		.property = DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN,
+	};
+
+	args.exec_queue_id = exec_queue;
+
+	do_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY, &args);
+
+	return args.value;
+}
+
 /**
  * SUBTEST: invalid-va
  * Description: Access invalid va and check for EIO through user fence.
@@ -324,6 +340,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
 		       bind_exec_queues[0], NSEC_PER_SEC);
 
+	if ((flags & INVALID_FAULT)) {
+		igt_set_timeout(1, "");
+		for (i = 0; i < n_execs; i++) {
+			int e = i % n_exec_queues;
+				while (!get_ban_property(fd, eci, vm,
+							 exec_queues[e]))
+					sched_yield();
+		}
+		igt_reset_timeout();
+	}
+
 	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
 		for (i = j; i < n_execs; i++)
 				igt_assert_eq(data[i].data, 0xc0ffee);
-- 
2.42.0

