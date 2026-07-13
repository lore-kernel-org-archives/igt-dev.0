Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6769C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 19:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7205210E662;
	Mon, 13 Jul 2026 19:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzeMYR2y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A2210E642
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 19:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783969556; x=1815505556;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kA1920VWSLAiepE4ydaFl8svlq7S69jQtm5vNC2vafU=;
 b=IzeMYR2y4jkbnP/qwhD8ftd1TSE9o5JgVeuFFTNwmdE6aArwJz3arKri
 53cLVQplzBv6VjI7KlTUM2bWf2igvMvp2QRpu4mQbQyN/xd6sQwm2gFt/
 LiaPHcyAd9HQPRpDfo0ELRNEfKxHjHYCMpvau8aJJjACAbZJmt6GYcpB9
 vh2SFSQc14hJeiiEcY/ox9idHM6ps1AYOhtt31TKRnfkWdfSzaSnVutId
 sEyx50f1eveLeCHXdmBdP2LD6WMvaj+8zb8mrJ2Q+quqYQITUbYuven8+
 v5W5bg7sjI1VhCvf4q753QcPKGYXDkRJR+b7S3qBtCmmRton6tovdfMGp g==;
X-CSE-ConnectionGUID: v5B/3tAhTmWjFQPzdNRWpw==
X-CSE-MsgGUID: YkXZLdJ8SHySD0fw97i3Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107381833"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="107381833"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 12:05:55 -0700
X-CSE-ConnectionGUID: zPuoSuxwRj+wzKrAJScayg==
X-CSE-MsgGUID: 9b/32mClRo+kdmWICQmcGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="259211595"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 12:05:53 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [i-g-t, v2] tests/intel/xe_exec_multi_queue: Check PXP is rejected on
 multi-queue
Date: Tue, 14 Jul 2026 03:05:37 +0800
Message-ID: <a5d7b699ffcbd7b590f824f67a7ca162eb59bf37.1783969453.git.jagmeet.randhawa@intel.com>
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
 tests/intel/xe_exec_multi_queue.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 9b41f87c7..6aa1fd5e4 100644
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
@@ -119,6 +124,18 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
 
+	/*
+	 * HWDRM is the only supported PXP type and is display-related, so it
+	 * cannot be combined with multi-queue. When PXP is supported the combo
+	 * must be rejected with -EINVAL; when unsupported the PXP extension
+	 * fails first with -ENODEV.
+	 */
+	multi_queue.base.next_extension = to_user_pointer(&pxp_hwdrm);
+	if (xe_wait_for_pxp_init(fd) == 0)
+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
+	else
+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -ENODEV);
+
 	/* Setting other queue properties are valid for Q0 */
 	multi_queue.base.next_extension = to_user_pointer(&priority);
 	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
-- 
2.53.0

