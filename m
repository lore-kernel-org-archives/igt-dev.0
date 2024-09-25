Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EAFC369CA
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 10:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C47210E055;
	Wed, 25 Sep 2024 10:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGKPyZlP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6885F10E055
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727261080; x=1758797080;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=571W4TfJ6gfQPdUzEQWwJb9EiUg3uqAfHMywinE24do=;
 b=iGKPyZlPw7WK0cg/CDab4yv7uQEIG8DumiwW1KsIVsSeclvETXN3eZMF
 gYI6H+N23OqfWQrFUfSJ00Axgf42ePEwpPVWQSimls8WxTUmZijuVcyVK
 Ad5E0YHZCMMjOy7HiT0CDUFcemhzBS6rhCh155T+1Mnzta2WkbUdQHAC6
 GU9dN1AB/Y45/d7CpkIMko+o0ofg1XNMtRX/Z7n2loIYD39hoVGLy9coW
 Op6+i/kO5DkLL1a20WjnnMk30Ez8uD1o64j6uTXhKEGDk0RkFmoGCYBrO
 dOVZZVuqnsr6gOyh0MrGFhUp+LGlsvID3e5z5cQlW73TBOKokh/VOPFDL w==;
X-CSE-ConnectionGUID: zE7dicsqSL+yhfulB6bvCA==
X-CSE-MsgGUID: xGHLVF5yT6eDOhL9eOczcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="36865375"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="36865375"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 03:44:40 -0700
X-CSE-ConnectionGUID: PKLOgm0OQcOp0NwDwwfOHw==
X-CSE-MsgGUID: dYL+0EjEQoSPsCQnpuoWLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="71875315"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2024 03:44:39 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_reset: Skip syncobj_wait during the
 gt_reset
Date: Wed, 25 Sep 2024 16:01:41 +0530
Message-Id: <20240925103141.3442-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>

Skipping the syncobj_wait for the workloads which is submitted
before gt reset, since After gt reset There is no expectation
from the hardware/GuC/KMD that the workload will then
re-execute and complete.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_reset.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index b5d5f43ea..b1a7548c6 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -263,8 +263,9 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	}
 
 	for (i = 0; i < n_exec_queues && n_execs; i++)
-		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
-					NULL));
+		if (!(flags & GT_RESET))
+			igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX,
+						0, NULL));
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
@@ -410,7 +411,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	for (i = 0; i < n_exec_queues && n_execs; i++)
-		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+		if (!(flags & GT_RESET))
+			igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
 					NULL));
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-- 
2.34.1

