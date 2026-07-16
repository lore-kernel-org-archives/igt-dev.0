Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2EDC44512
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 20:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE44D10F3D2;
	Thu, 16 Jul 2026 20:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VP/+iT2o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF90A10F3D2
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 20:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784234475; x=1815770475;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G0j88asP7NDOxdBKXlcg9ORygCaXe9OWSXvFRgX3dxA=;
 b=VP/+iT2oLYFpo5qaCBlXXtP4WeP6/5RdpRND3tLSrwjGS/aeDLgwzK3P
 3Qe0TptkttP/tRCGsPWs/aa75OtfK/EdhoqslX8lfoPWckmVjKHOCRUhQ
 /MOqubKbPOHT9ltqUFQ1UmGbBrzKfAh+JAkf/UFt6GAe3OI1GAloScu2M
 dSbRLHlvSGWxOzHEKeLVAoHraUDRcqB2AJhJXXEEFAVizvkaWJvnX/FE6
 b8tJwsMjgzIbPJOF62ZpAxPe6koTsTp4Gx7PmK/5+mZPwvC8sV0tNjhju
 VKeQk5DrSwn5UR3aqLx9ItfGyD4Gw1WY9VNWb42J5Yy2VAxADMSmKimWl g==;
X-CSE-ConnectionGUID: Byejh0v7SWC22m+dUo0vjg==
X-CSE-MsgGUID: LtGJRbGdRJOYc4sIcJKNOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88810283"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="88810283"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 13:41:14 -0700
X-CSE-ConnectionGUID: 7mkp8EKQQQmDFp4py/fFyA==
X-CSE-MsgGUID: VFgIW5ZQTw6K48qCbFDe1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="253202105"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 13:41:12 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [i-g-t, v3] tests/intel/xe_exec_multi_queue: Check PXP is rejected on
 multi-queue
Date: Fri, 17 Jul 2026 04:41:03 +0800
Message-ID: <82d8609cce6a2e22be972e9e917011b90c5e6f43.1784234143.git.jagmeet.randhawa@intel.com>
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

v3:
 - Assert -EINVAL unconditionally instead of branching on
   xe_wait_for_pxp_init(); this ordering always returns -EINVAL
   with the KMD check in exec_queue_user_ext_check() (Niranjana).
v2:
 - Drop igt_debug() calls; use direct igt_assert_eq().
 - Remove redundant multi_queue.value set and next_extension reset
   (Niranjana).

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
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

