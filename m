Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D7EC36013
	for <igt-dev@archiver.kernel.org>; Tue, 17 Sep 2024 11:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E5110E46F;
	Tue, 17 Sep 2024 11:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUSetCu3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154E110E476
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Sep 2024 11:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726572293; x=1758108293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=suNX7uYPHbQynVTgXhy3zJKyRtNm3L4gwf5TIAcshS8=;
 b=GUSetCu3d08DjEcLo9Z6tsrmh36pS/Edw7M0Blp2sjbHN6uWPs84RYMP
 oWMGdUNEgNh03P/Bbi/t5n3ItuW+n8wD50vskzI3j1sswfr2008c5cCTi
 /UO/uy+JnXq8YyAH/hfq64itZWB2rKwEeIGCG2W6PYWj9eH964/FagNq5
 k1MbfH3FdQHzyBf3nUmLpy5pPDU4AS2vegsLDR7E9VMoR3FiaDLWlbICE
 m/xL+sOE3KmqP1/tw8s8bCY0c1gJBtqyHq+ZWOsIRAA4qmxHPHnmd+Cb5
 IIZS+FGdfcLlUcXWEXSEEd+Ad8JZIQZeL8g4afL5gi9khxbslBXzzm/hd w==;
X-CSE-ConnectionGUID: 3t+16I9vQxGeX/yWAda6dg==
X-CSE-MsgGUID: meJ0tGZCTMacD4dwX6/wmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29207435"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29207435"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 04:24:53 -0700
X-CSE-ConnectionGUID: YGzFjSC/SPScWlxOgwQc1w==
X-CSE-MsgGUID: Ebm8SaZ4SWC5Gns+cBfmSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="73249900"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 04:24:51 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_pm_residency: [DO NOT REVIEW] Assert
 if sleep more than 120 s
Date: Tue, 17 Sep 2024 17:08:58 +0530
Message-Id: <20240917113859.1499723-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240917113859.1499723-1-karthik.poosa@intel.com>
References: <20240917113859.1499723-1-karthik.poosa@intel.com>
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

Assert if sleep > 120 seconds in xe_pm_residency.
Change a print from igt_debug to igt_info to get execution time of
current run.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_pm_residency.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 0e687558b..716ddc24a 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -139,7 +139,7 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
 		elapsed = igt_nsec_elapsed(&tv);
 		igt_assert_eq(data->data, done[1]);
 
-		igt_debug("Execution took %.3fms (submit %.1fus, wait %.1fus)\n",
+		igt_info("Execution took %.3fms (submit %.1fus, wait %.1fus)\n",
 			  1e-6 * elapsed,
 			  1e-3 * submit,
 			  1e-3 * (elapsed - submit));
@@ -150,6 +150,9 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
 		 * Execute the above workload for ~1% of the elapsed time and sleep for
 		 * the rest of the time (~99%)
 		 */
+		igt_info("sleeping for %ld ms\n", ((elapsed / 10)/1000));
+		igt_assert((uint64_t)(elapsed / 10) < (uint64_t)(120 * USEC_PER_SEC));
+
 		usleep(elapsed / 10);
 	} while (!READ_ONCE(*done));
 
-- 
2.25.1

