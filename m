Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7388DC9830E
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 23:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9BF10E1BC;
	Fri, 25 Sep 2026 23:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Af3TGsM9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5170B10E193
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 23:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790379901; x=1821915901;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m5UtEjB45hwz+0zWag5/FyYZ1sCu+RStsLnFSWuKPos=;
 b=Af3TGsM9KRtM3hhvswCKHhbBAv8QiXireJIkfZPGy+HFPkxxTwPTY7X9
 iQ4uNSwFEKF7BBiBp1TNE+EE3cjs62AUVls7b+/WSKCfj02rb0ZS1+3fP
 85F5RtTKrah3Jwqmqv7NHSH1CGjOx9ReCy8GsepY5wpHYTJw7Oc1ZJcY7
 p3YFWxUdYpvSYXeeOy2J8jnuYXJ78F3ftE70XWVS130dkoTbr/HX2m/lB
 rz54k/O6kLRR+GhO5Jy7JtvZpffqbD+TNH199VpH5XJQ1DuFJTMfe0AE5
 qb+PQ97i5rZKQSA2tqWjN5oewCcy635hm/7QUog2SAzqS3XdF5ZzYnDdI Q==;
X-CSE-ConnectionGUID: SK2oPb4CSmieTTGBuTe6vw==
X-CSE-MsgGUID: r9ECB6D4Scyer7b79lsycA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="101699255"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="101699255"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 16:45:01 -0700
X-CSE-ConnectionGUID: Or5kGFOZTrGq2f46KVgLWw==
X-CSE-MsgGUID: iuq/yYPPRE+XGDnZOFIuYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="274609261"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2026 16:44:59 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH] tests/intel/xe_tlb: Wait for the rebind before the second exec
Date: Fri, 25 Sep 2026 23:44:48 +0000
Message-Id: <20260925234448.936777-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

The bo2 bind reuses sync[0] after its SIGNAL flag was cleared for the
first exec, so it signals nothing and the second exec waits on the
stale fence from the first bind. Without this dependency, the second
exec may run before the rebind's TLB invalidation completes and hit
the stale translation to bo1.

Reset sync[0] and set DRM_XE_SYNC_FLAG_SIGNAL before the bo2 bind so
the second exec waits for the rebind.

Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_tlb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
index 6c88631ac0..b322096d5c 100644
--- a/tests/intel/xe_tlb.c
+++ b/tests/intel/xe_tlb.c
@@ -102,6 +102,10 @@ static void tlb_invalidation(int fd, struct drm_xe_engine_class_instance *eci)
 	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_exec(fd, &exec);
 	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+
+	/* Signal sync[0] on the rebind so the next exec waits for it */
+	syncobj_reset(fd, &sync[0].handle, 1);
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_bind_async(fd, vm, bind_engine, bo2, 0, addr, bo_size, sync, 1);
 	data2 = xe_bo_map(fd, bo2, bo_size);
 
-- 
2.43.0

