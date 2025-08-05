Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2247AC87FD1
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 17:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE4B10E286;
	Tue,  5 Aug 2025 17:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXq0Ctmv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1667F10E286
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Aug 2025 17:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754416020; x=1785952020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rIJGTPLa9au6YDPznK/vIoclHlzie2Tdr42HyhjXpqU=;
 b=YXq0CtmvkjDv56bAvMWQRD4SfwVH0q2El1Oi4bJlILk0/0qrcjfncnKI
 02yh+Dv0+dHRMjLUSlqfYg967rQFoy2FC3F+tWmX5BkosMby2FnMZixnY
 yuGTvYjUCCMxpTM0O3g459iW5Gf15/+Lc2TENuO8zRW7PkoOKdjm/wPyc
 /buFm/eFHS3w9IE1NZUzzEuS5tC47Paf426nai8SAhFB81ggyvB3nnnCw
 nJ1WKQQ6yPhaFmK+Efz6+MwcSPcrFnaBa2xzJIZC9sagc3VUAZ1aehKBM
 tbsb2bMT4CZsgfuEIbI71oEiQ4Phyi4BaFpj8munhn/tYjM3K4JStDvfH g==;
X-CSE-ConnectionGUID: 8A/OiSWTRgK5bYdZvbTMdg==
X-CSE-MsgGUID: aJ79gIwYRlqR7jHMWqBySw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56806587"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56806587"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 10:46:59 -0700
X-CSE-ConnectionGUID: pG4vGSFpQTOSpV0chV5L1A==
X-CSE-MsgGUID: ApyjZ4t+RD2yQY4MjZ5GOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="195525478"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 10:46:57 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, riana.tauro@intel.com, badal.nilawar@intel.com,
 matthew.brost@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/intel/xe_exec_reset: Replace hardcoded sleep with GT C6
 polling
Date: Tue,  5 Aug 2025 23:14:30 +0530
Message-ID: <20250805174429.3755351-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

Replace insufficient sleep with extended GT C6 polling to ensure proper
power state transitions to RC6 and prevent subsequent RC6 test failures.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_exec_reset.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 7ae53c679..0c9503c7e 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -421,9 +421,12 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			for (i = 0; i < n_exec_queues; i++)
 				xe_exec_queue_destroy(fd, exec_queues[i]);
 		}
+
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, eci->gt_id), 1000, 10),
+			     "GT %d failed to enter C6\n", eci->gt_id);
+
 		drm_close_driver(fd);
-		/* FIXME: wait for idle */
-		usleep(150000);
+
 		return;
 	}
 
-- 
2.43.0

