Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A4BC54E93
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 10:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0909810E06A;
	Wed, 28 Aug 2024 10:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/rpCnTI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EB110E06A
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724840620; x=1756376620;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1UIAkFLXSVEtGPiD0l1flS9DtE4t2boIjEJY6mxHwqg=;
 b=P/rpCnTI9fd2BH3Ln8rBWSYkJZzo2ugl9elW8wJclox4g3C9xHxzkJVe
 qRhJB6r1yxo3uvKXsvHmg6GnfGQsAT78uqnMziYLBIarHCZH4uAzuvS4Z
 9iul63SjOA41xMtxJ4RZCEGE7WsE8Tn4FmR2RvIsZr+whnUthm+4w6e2r
 +WIiuO07KMMv+8+0TPELlUqh7VSHZ7pooCyBWtBzavrfEAhOIPdP4V131
 Bg3Arz898Yn1F6+Wluh9+git3yCOtQL2tJ22DwoPyhV1/J5pCPvM7fnol
 C+CO7v9n2QiF2G8rL7LN1jtpXMPCm+umXp13zp0AC0jM9wDZkJS9AqR6B Q==;
X-CSE-ConnectionGUID: AkQ09RskS5CDtMBGAmReQA==
X-CSE-MsgGUID: h4m7/EhUTnKVJg0F/ZD7PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="40865105"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="40865105"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 03:23:39 -0700
X-CSE-ConnectionGUID: Hi64xj9TSSiJ1dJtK9IRLA==
X-CSE-MsgGUID: EdA9gC2wR7GNR1gUrK6abw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="63220007"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 03:23:37 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, Nirmoy Das <nirmoy.das@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/xe_exec_fault_mode: Don't return early
Date: Wed, 28 Aug 2024 11:55:14 +0200
Message-ID: <20240828095514.15613-1-nirmoy.das@intel.com>
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

Set a larger 5 sec timeout if still tests fail, we can blame
driver in such case.

v2: specify timeout reason and iterate over exec_queues(Andrzej)
v3: increase timeout

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 1f1f1e50b..e3e6047e7 100644
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
+		igt_set_timeout(5, "waiting for ban");
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

