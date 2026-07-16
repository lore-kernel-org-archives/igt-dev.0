Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AF1C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 21:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A2810E249;
	Thu, 16 Jul 2026 21:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmDrU6i4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D50E10E249
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 21:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784238671; x=1815774671;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9Tl3mV5wemfwQm/+CmPf3PAKB/xZcHt9Q4vHfvph//A=;
 b=QmDrU6i4DUaMi5ScmJJkzdJNwKwpIyB1HVR3t++7wbU2hGHw8kqOxgxT
 cDzWpzTlV1A7vOEADvMrYLA4ogA5gpLGu9/eLkKXjM/EJLC27noGbbUDG
 82Q/WmMpi4jSdEVqnTM4bR6fNQjIcmuNh/nyp6HNdNS63cl81mhQlVCih
 rdjd90+s8VF+5afh4KkoSsi4OykEs1OMgVd+drbmVSmNye2jRU1g2GP8g
 yoiN5OjcyPdRrn8EBVF3PIguE4bPytmjVNFK5G7KFsNIfC7urDQnhtaVr
 cmtx4SKN2iDomP/sL4b1/WYcy/n4SZ0fR5n4Imzoqmdp9etrdVb/1cDOM g==;
X-CSE-ConnectionGUID: bjRniDhGTcmr5bGUjgIezw==
X-CSE-MsgGUID: NzLeJg17RyaATE5L7P/Fgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="102466083"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="102466083"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 14:51:11 -0700
X-CSE-ConnectionGUID: hOTMt0vaTN+x4vCyn2ZtrQ==
X-CSE-MsgGUID: BGERWg7BRnuclHMxS1lq8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="257235123"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 14:51:09 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [i-g-t, v4] tests/intel/xe_exec_multi_queue: Check PXP is rejected on
 multi-queue
Date: Fri, 17 Jul 2026 05:50:52 +0800
Message-ID: <1ab366863a6e94a8da9ef84745a38f8a111b270d.1784238579.git.jagmeet.randhawa@intel.com>
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

The multi-queue property is chained before the PXP property, so the
kernel rejects the combination with -EINVAL while processing the PXP
extension, regardless of whether PXP is supported on the platform.

v4:
 - Add Niranjana's Reviewed-by.
v3:
 - Assert -EINVAL unconditionally instead of branching on
   xe_wait_for_pxp_init(); this ordering always returns -EINVAL
   with the KMD check in exec_queue_user_ext_check() (Niranjana).
v2:
 - Drop igt_debug() calls; use direct igt_assert_eq().
 - Remove redundant multi_queue.value set and next_extension reset
   (Niranjana).

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 9b41f87c7..b9f72968b 100644
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
@@ -119,6 +124,17 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
 
+	/*
+	 * HWDRM is the only supported PXP type and is display related, so it
+	 * cannot be combined with a multi-queue exec queue group. The
+	 * multi-queue property is chained before the PXP property here, so the
+	 * kernel rejects the combination with -EINVAL while processing the PXP
+	 * extension, before the PXP type is evaluated. The rejection therefore
+	 * happens regardless of whether PXP is supported on the platform.
+	 */
+	multi_queue.base.next_extension = to_user_pointer(&pxp_hwdrm);
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
+
 	/* Setting other queue properties are valid for Q0 */
 	multi_queue.base.next_extension = to_user_pointer(&priority);
 	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
-- 
2.53.0

