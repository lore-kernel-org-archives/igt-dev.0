Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4854C54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 15:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7FC10E348;
	Tue, 27 Aug 2024 15:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGNFI1dt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B440110E348
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 15:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724771822; x=1756307822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DRoL1SKwuvRiyA5cxkHXPMa2DL9AY+1Gs+mgV3G/1YA=;
 b=IGNFI1dtgTquoJctI/gaMOe+uCSq4VuoSq8rxrBoT5U/xkWtzHMFQHfL
 ALf/Yjmimf7Ru060IxnAzo9JxmyNDGUKQSas1HpRcNzLM2YvvpW1RpoSm
 ZCDsZWZ5NuhkKNFwVQTRzVnSv6ASXHh+nS1d9rEt4dFzzf2XC2Dp4UhPV
 Bdvkj5d5RbaU0mtbJKsWwc58Wc4PEOh8+uWre1u+o2ZngLwptinKk/9+L
 soD7qpcoSfRknpXVC02nk9RLDCgGTzTEcZfvs50jambm7woz5hh7LRlTY
 hDtXYbY3Bh5+doF/UZtXgAvYfXh05EKZFMPM3NB/BdiO6Ax+btL+DN63T A==;
X-CSE-ConnectionGUID: 1qg3vS2VT1aJHG1+7nvDgA==
X-CSE-MsgGUID: k26UkBpQSwikjZQG21mqFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34631184"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="34631184"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 08:17:02 -0700
X-CSE-ConnectionGUID: F0E0d2PvS22EpkuNfjj4oA==
X-CSE-MsgGUID: KuE20IoxQIOQa59iBVmmUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63062566"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 08:16:59 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, Nirmoy Das <nirmoy.das@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_exec_fault_mode: Don't return early
Date: Tue, 27 Aug 2024 16:48:37 +0200
Message-ID: <20240827144837.19718-1-nirmoy.das@intel.com>
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

v2: specify timeout reason and iterate over exec_queues(Andrzej)

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 1f1f1e50b..1722df641 100644
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
@@ -324,6 +340,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
 		       bind_exec_queues[0], NSEC_PER_SEC);
 
+	if ((flags & INVALID_FAULT)) {
+		igt_set_timeout(1, "waiting for ban");
+		for (i = 0; i < n_exec_queues; i++) {
+			while (!get_ban_property(fd, eci, vm, exec_queues[i]))
+				sched_yield();
+		}
+		igt_reset_timeout();
+	}
+
 	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
 		for (i = j; i < n_execs; i++)
 				igt_assert_eq(data[i].data, 0xc0ffee);
-- 
2.42.0

