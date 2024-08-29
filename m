Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78E9C8303E
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 18:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE2710E767;
	Thu, 29 Aug 2024 18:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2L8gJBc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED7A10E767
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 18:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724956155; x=1756492155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jtMW26HltHpcYgTLZZgy4ktzvs302rM8O6VuqpvnrQo=;
 b=I2L8gJBczPQvSJgELtjOdAGhpobYXUe93VcyRRYjJLYiXJJEzI9xSBjZ
 dko///l8l+uKFNDGhIsG4dOY+6Z54L59mFuppWUyA7mGWRjtgIQ6jJCUa
 o+yhV4wWcnSSgeJivi9nk9C0trxgMJn4HnCymfKmwniikUeRDupZy2jmT
 5f6FW4NL4xxRZk+TyZ4Twp9/8wNXsJFkmoPkiQzpeKO/sjl9Oa69U6/5P
 /JDS4RaD+Ug2mN+s0J3GRhiZK8K4yqvG+fNIg6aUj31f95vjjWHgNbyh7
 Hy0UT2zcD7dJiJklAbDG7l8+UaEHzSJZFprgU1cm9P7o8Pm1Px5fgMv7g w==;
X-CSE-ConnectionGUID: XYyCvPIsQPODL4V58JpXEg==
X-CSE-MsgGUID: kJB78meRRJG1MieuGGHlVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23700918"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="23700918"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 11:29:15 -0700
X-CSE-ConnectionGUID: lbPJpvRnSZqXmYo9/DVG9A==
X-CSE-MsgGUID: YzaMopxTSumftTryXH03Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="68051607"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 11:29:13 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, Nirmoy Das <nirmoy.das@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH i-g-t v4] tests/intel/xe_exec_fault_mode: Don't return early
Date: Thu, 29 Aug 2024 20:00:51 +0200
Message-ID: <20240829180051.3286-1-nirmoy.das@intel.com>
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

Tests that are causing pagefaults should wait for exec to queue
ban/finish otherwise pending engine resets because of on-going
pagefaults would cause failure in subsequent tests to fail.

Not all execs will generate page faults and in such case reading ban
property is not enough but the signal should either -EIO or 0.
so read that instead.

v2: specify timeout reason and iterate over exec_queues(Andrzej)
v3: increase timeout
v4: check for signal status to be -EIO/0.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 1f1f1e50b..fa050d0dc 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -329,6 +329,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				igt_assert_eq(data[i].data, 0xc0ffee);
 	}
 
+	if ((flags & INVALID_FAULT)) {
+		for (i = 0; i < n_execs; i++) {
+			int ret;
+			int64_t timeout = NSEC_PER_SEC;
+
+			ret = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+					       exec_queues[i % n_exec_queues], &timeout);
+			igt_assert(ret == -EIO || ret ==0);
+		}
+	}
+
 	for (i = 0; i < n_exec_queues; i++) {
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 		if (bind_exec_queues[i])
-- 
2.42.0

