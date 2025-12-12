Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62EAD43371
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 01:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F22E10E6D7;
	Fri, 12 Dec 2025 01:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAh6dJx6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAA310E351
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 01:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765501885; x=1797037885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x8es6Jl9NyaNDTh6z5sWfPcCXW3jtGghVOEFCpgMTR0=;
 b=CAh6dJx6aDHcJhGes1tjSp/1B1msfxAG+ciRP3sw5nMirt+gSlqiroy7
 Ls3BYxqmmlnPMfdeimekmSJwsYX/TlwPLO0TEJOctzun/2CiQ8e/LWnuG
 vmARmmwNFMbdsR7/2g6Cn4A7KHUj2xXsmKduGkqq2vBOWGsUzbCmldUOY
 2jpt39oJ5P3O7N8szXlpN2YXW2758/idHsI4BmhzaO8KgdgcuB3pYfKlf
 nnHuj6UV1jAxN+S/M9a8zpy3jROdi8X5WhFFKDZ+mMAv1ieFKrggSiK3p
 DxjlXgisQK+UQdqs6ZqaFjYaChsiTUC3ppDzcFu4q8HTdZSekchv0qmPF w==;
X-CSE-ConnectionGUID: tG3YDxJVRCyx85NYXwy8pA==
X-CSE-MsgGUID: dxYHcnc2SP6zFsgDLMSt4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71118053"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71118053"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 17:11:25 -0800
X-CSE-ConnectionGUID: 2rfF3YXWRAqgzGNqcBOO/A==
X-CSE-MsgGUID: b5Wplk0RQMyyge+YUb0CkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196031262"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 17:11:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v5 17/18] tests/intel/xe_exec_multi_queue: Sanity test
 KEEP_ACTIVE flag
Date: Thu, 11 Dec 2025 17:11:29 -0800
Message-ID: <20251212011115.1685703-37-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212011115.1685703-20-niranjana.vishwanathapura@intel.com>
References: <20251212011115.1685703-20-niranjana.vishwanathapura@intel.com>
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

Add DRM_XE_MULTI_GROUP_KEEP_ACTIVE to valid flags list.
Validate that KEEP_ACTIVE is not supported in preempt mode
unless fault mode is set.

v3: Remove redundant preempt_mode check (Stuart)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 6bc6f9f63..c37aea0a2 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -37,10 +37,12 @@
 #define FAULT_MODE		(0x1 << 6)
 #define SMEM			(0x1 << 7)
 #define WAIT_MODE		(0x1 << 8)
+#define KEEP_ACTIVE		(0x1 << 9)
 
 #define MAX_INSTANCE 9
 
-#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
+#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE |        \
+				      DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
 
 #define BASE_ADDRESS	0x1a0000
 
@@ -84,7 +86,8 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	if (!n)
 		return;
 
-	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
+	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
 
 	/* Invalid flags */
 	while (!invalid_flag)
@@ -119,6 +122,15 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
 
+	/* KEEP_ACTIVE not supported in preempt mode without fault_mode */
+	if (preempt_mode) {
+		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+		multi_queue.value |= DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
+		igt_assert_eq(__xe_exec_queue_create(fd, vm2, 1, 1, eci, ext, &val), -EINVAL);
+		multi_queue.value &= ~DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
+		xe_vm_destroy(fd, vm2);
+	}
+
 	/* Setting other queue properties are valid for Q0 */
 	multi_queue.base.next_extension = to_user_pointer(&priority);
 	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
@@ -219,6 +231,21 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	igt_waitchildren();
 
 	xe_vm_destroy(fd, vm);
+
+	/* Validate closing FD while keeping group active */
+	fd = drm_open_driver(DRIVER_XE);
+	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
+
+	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE | DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
+	multi_queue.base.next_extension = 0;
+	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
+
+	multi_queue.value = exec_queues[0];
+	for (i = 1; i < MAX_N_EXEC_QUEUES; i++)
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+
+	drm_close_driver(fd);
 }
 
 /**
-- 
2.43.0

