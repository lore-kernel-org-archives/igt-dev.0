Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D4AD43370
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 01:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B3310E6DB;
	Fri, 12 Dec 2025 01:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HW8oPjEO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8C710E553
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 01:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765501885; x=1797037885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uQhZwz7dYEOTDWzb6rT331G+dlHMhmdo6D5bxtXglW0=;
 b=HW8oPjEOmyf1A0v5VfDzNjJtKsCZuKBiEwgmgQAsVmQYV7OARIDWDgzK
 DXVBwiOpNX47Vr3b7fpbmvCx52kQdmHVY3ytb5Vz9IiYY7n76M4+0wZKD
 Y0mBAkUwAiLRE0WZsx0s6U5YaLPJPJbraugM/ieh2oqrOSNGvsnNYnHms
 MucVFSrHcNe/3J+84TEo4sx+9V6kAr/+6jmobUwTWiy16OwAwc20pHgKp
 cCO5Z4optbz9dnhks4L9hqTfv41VkAVaQUuID94TP/Rw367EzsD57gWf8
 xYWZq0QZMrhJdpP0d3xFqCWPn87Yt/u19pNjYMmTGtJbd+8xNr35Y+uqe Q==;
X-CSE-ConnectionGUID: +2Rh5GrQQNS+1pKU1Cqjfg==
X-CSE-MsgGUID: ld8WPSICQQuzBr/gIy4AiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71118054"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71118054"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 17:11:25 -0800
X-CSE-ConnectionGUID: tUIBICklTpCl9K/AsPE0ig==
X-CSE-MsgGUID: 0sWWRBmlSe2Nj28/Xn0T6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196031267"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 17:11:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v5 18/18] tests/intel/xe_exec_multi_queue: Keep group active
 in exec-sanity
Date: Thu, 11 Dec 2025 17:11:30 -0800
Message-ID: <20251212011115.1685703-38-niranjana.vishwanathapura@intel.com>
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

In exec-sanity subtest, validate that job can be submitted
on secondary queue after closing the primary queue if the
user specifies the KEEP_ACTIVE flag while creating the group.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index c37aea0a2..888e7f1a8 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -282,6 +282,7 @@ __test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci, unsigned in
 	};
 	uint64_t ext = to_user_pointer(&multi_queue);
 	bool preempt_mode = flags & PREEMPT_MODE;
+	bool keep_active = flags & KEEP_ACTIVE;
 	int i;
 
 	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
@@ -293,9 +294,13 @@ __test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci, unsigned in
 		sync.handle = syncobj_create(fd, 0);
 	}
 
-	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
+	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
 	bo_size = xe_bb_size(fd, sizeof(struct xe_spin));
 
+	if (keep_active)
+		multi_queue.value |= DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
+
 	for (i = 0; i < NUM_QUEUES; i++) {
 		bo[i] = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
 				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
@@ -343,14 +348,27 @@ __test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci, unsigned in
 	/* Destroy primary queue */
 	xe_exec_queue_destroy(fd, exec_queues[0]);
 
-	/* Validate submission on secondary queues fail after destroying the primary */
+	/* Validate submission on secondary queues after destroying the primary */
 	xe_spin_init_opts(spin[1], .addr = addr[1]);
 	if (preempt_mode)
 		sync.addr = addr[1] + (char *)&spin[1]->exec_sync - (char *)spin[1];
 
 	exec.exec_queue_id = exec_queues[1];
 	exec.address = addr[1];
-	igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
+
+	if (keep_active) {
+		xe_exec(fd, &exec);
+		xe_spin_wait_started(spin[1]);
+		xe_spin_end(spin[1]);
+		if (preempt_mode) {
+			xe_wait_ufence(fd, &spin[1]->exec_sync, USER_FENCE_VALUE, exec_queues[1], fence_timeout);
+		} else {
+			igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+			syncobj_reset(fd, &sync.handle, 1);
+		}
+	} else {
+		igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
+	}
 
 	if (preempt_mode)
 		sync.addr = to_user_pointer(&vm_sync);
@@ -390,6 +408,8 @@ test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci)
 {
 	__test_exec_sanity(fd, eci, 0);
 	__test_exec_sanity(fd, eci, PREEMPT_MODE);
+	__test_exec_sanity(fd, eci, KEEP_ACTIVE);
+	__test_exec_sanity(fd, eci, PREEMPT_MODE | KEEP_ACTIVE);
 }
 
 static void
-- 
2.43.0

