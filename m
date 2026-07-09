Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6E2C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 19:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E095010E0D3;
	Thu,  9 Jul 2026 19:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ks2ij+Up";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C408088130
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 19:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783626772; x=1815162772;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=laa8tOFyxEijVKbyNd3fS7ZmpP1er2+5aldzrG3Fr/A=;
 b=Ks2ij+UpAe4iLD4dlVQX1MVURAHGZdWaBvqozL6SXRbGcMCHaBv8sfZ5
 MzRYHT8BkwMnMATRrn9S9AQ30j15Mi+p+XlPla/X6BCYCWd0uNou+3FYR
 IUIF80LaUNT2sIoaKfBYWR/FHCSexTD2/eyX/jF2sZ33N+xKrFSWHmGYz
 aayn26FSlLO95fUZ2LCSP2UJfhUrVNvE6B2rEoc8p4jWXixQjz5QgpUP8
 2ZtwRy1OuqkG6aiKr5dKxjoZbF/YhqpE6Os+ta8kkICB+Uxr8k7ic5fJ9
 FSg2uUIH8Hn2UNhpALiXi6oF04WDYBJivLxycRXqy5MDBBUXLVkzIzfaW w==;
X-CSE-ConnectionGUID: 6KwiQONLTIKI/j+P4e0koA==
X-CSE-MsgGUID: U3fGYe2STXOUGudkwQistg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83300850"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83300850"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 12:52:51 -0700
X-CSE-ConnectionGUID: Y/OUOnwORyuOwWg37eUfdw==
X-CSE-MsgGUID: OJwTf6ddQiKvTF6b18PVfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="284779704"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 12:52:50 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [i-g-t] tests/intel/xe_exec_multi_queue: Check PXP is rejected on
 multi-queue
Date: Fri, 10 Jul 2026 03:52:24 +0800
Message-ID: <4f88d137e4d769797789dae939455b918302793c.1783626314.git.jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.53.0
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

HWDRM is the only supported PXP type and is display related, so it
cannot be combined with a multi-queue exec queue group. Extend the
sanity subtest to create a multi-queue exec queue with the PXP HWDRM
property chained and verify the kernel rejects the combination.

When PXP is supported the combination must fail with -EINVAL; when
PXP is unsupported the PXP extension fails first with -ENODEV.
The expected error is selected based on xe_wait_for_pxp_init(),
so the test passes on platforms with and without PXP.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 9b41f87c7..21337b138 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -65,6 +65,11 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
 		.value = XE_EXEC_QUEUE_PRIORITY_NORMAL,
 	};
+	struct drm_xe_ext_set_property pxp_hwdrm = {
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE,
+		.value = DRM_XE_PXP_TYPE_HWDRM,
+	};
 	struct drm_xe_engine_class_instance vm_bind_eci = {
 		.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
 	};
@@ -72,7 +77,8 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
 	struct drm_xe_engine_class_instance *hwe;
 	uint32_t vm, vm2, val;
-	int i, n = 0;
+	int i, n = 0, ret, expected;
+	bool pxp_supported;
 
 	xe_for_each_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
@@ -119,6 +125,24 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
 
+	pxp_supported = (xe_wait_for_pxp_init(fd) == 0);
+	expected = pxp_supported ? -EINVAL : -ENODEV;
+
+	igt_debug("PXP supported on platform: %s\n", pxp_supported ? "yes" : "no");
+
+	/*
+	 * HWDRM is the only supported PXP type and is display-related, so i
+	 * cannot be combined with multi-queue. When PXP is supported the combo
+	 * must be rejected with -EINVAL; when unsupported the PXP extension
+	 * fails first with -ENODEV.
+	 */
+	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
+	multi_queue.base.next_extension = to_user_pointer(&pxp_hwdrm);
+	ret = __xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val);
+	igt_debug("multi-queue + PXP: kernel returned %d, expected %d\n", ret, expected);
+	igt_assert_eq(ret, expected);
+	multi_queue.base.next_extension = 0;
+
 	/* Setting other queue properties are valid for Q0 */
 	multi_queue.base.next_extension = to_user_pointer(&priority);
 	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
-- 
2.53.0

