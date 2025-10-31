Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A31CCFA05
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2666810E30B;
	Fri, 31 Oct 2025 18:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KK6vVYS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF03610E2FE
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935763; x=1793471763;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=imUtavFV6MUVKQJ6I5ARa4WSgl+vaEpxA1K1JMYZGmk=;
 b=KK6vVYS+q8REii8ysPQZf6q57bGuS2xm3Fg+vuhKpm8aZhZURFGQGk0A
 rjq6eaLrCWypB9JMoP6RoZjLBVn9YIu9b/aurPcPQs74o9W1xOt6h2qKF
 yC54WJ89JfmbqahupXHwRHBBK53EY7eSpWoYwBAZ0lgJoIoITU2re8SJ8
 JL7tvE1sEiEUkzQAnarV0beTOb7iu/wCmO7Iahxh+X/5qrjk/Dd4DfM5Z
 Ul14Wk43cMFwD7UkPv0YK/RLoXBZVJgpHazR7xUwQA5vvqRD9UJOTdwkq
 vHEGDKtL7iQPc6y0QFORkWGnkJ1FHXGrxo1S5Ewe1aAqhwNFns005wvSt g==;
X-CSE-ConnectionGUID: GOgY4EO3TkGtQUc0iSzImw==
X-CSE-MsgGUID: Kt5NDraKQg2L3qPJ+v8MXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="81514639"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="81514639"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:02 -0700
X-CSE-ConnectionGUID: LRSBflq/RD+JzcDqrdxobg==
X-CSE-MsgGUID: nLYju6hjQcqIPBSD+NIwFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650041"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 18/18] tests/xe_exec_multi_queue: Keep group active in
 exec-sanity
Date: Fri, 31 Oct 2025 11:35:55 -0700
Message-ID: <20251031183555.1882721-19-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
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
---
 tests/intel/xe_exec_multi_queue.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index ee2b92293..bdd9851bb 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -268,6 +268,7 @@ __test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci, unsigned in
 	};
 	uint64_t ext = to_user_pointer(&multi_queue);
 	bool preempt_mode = flags & PREEMPT_MODE;
+	bool keep_active = flags & KEEP_ACTIVE;
 	int i;
 
 	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
@@ -279,9 +280,13 @@ __test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci, unsigned in
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
@@ -328,14 +333,27 @@ __test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci, unsigned in
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
@@ -375,6 +393,8 @@ test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci)
 {
 	__test_exec_sanity(fd, eci, 0);
 	__test_exec_sanity(fd, eci, PREEMPT_MODE);
+	__test_exec_sanity(fd, eci, KEEP_ACTIVE);
+	__test_exec_sanity(fd, eci, PREEMPT_MODE | KEEP_ACTIVE);
 }
 
 static void
-- 
2.43.0

