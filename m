Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468E9CE8D49
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 06:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECED810E22B;
	Thu, 19 Sep 2024 06:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8Yg1J2r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0A510E22B
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 06:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726726775; x=1758262775;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BT5G7lm9NsE8pS/hHMus4lHLOP4t4EvYPMaZla+BHN8=;
 b=Q8Yg1J2r0waRmJkU3MhtGYx4ItV8r3poTfcmpJNLIWiXwHr6t07i21ay
 5JQLMc3tRF2BgYmmmMIxNFkT5ICg6dyCLUN57mwlTrATLSAR1iBnijoGu
 5/C6QAzCU2Rj/OBtpb3O5/3CTJ0txRcrj9IQA6vqzy5KxAxV+NipMzPUI
 lcGc6ADBgg7G1lRbdSvyGU4BiXABZq2zgGKS3hY4DefsKdUO/3BycVJig
 blQ6WUUZP9r+Jjy7zKIa9Cgk9scii0fQjrYhg3rSThrakKvqpHalsMumY
 B6tSsXIwpd9naalZ40CS9HY8jnNgO358QRSa+vjY4Xv4gehUxXEIllWJf Q==;
X-CSE-ConnectionGUID: Ps9Zl/OhQxKzgyecwy/OPg==
X-CSE-MsgGUID: wdlgzr0fQGCgdq5OHwRfQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29458072"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="29458072"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 23:19:35 -0700
X-CSE-ConnectionGUID: G7VcqqJCSUazRfc9fa9HWw==
X-CSE-MsgGUID: 2mMxF+/IQni9diFFuxpkbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="69835950"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 23:19:33 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_pm_residency: Print execution and sleep
 times
Date: Thu, 19 Sep 2024 12:03:52 +0530
Message-Id: <20240919063352.1607048-1-karthik.poosa@intel.com>
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

Print the workload execution and sleep times of the test to help diagnose
timeouts.
This will show how long the workload ran and how long the test slept.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_pm_residency.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 0e687558b..3c3b33ab1 100644
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
@@ -150,6 +150,8 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
 		 * Execute the above workload for ~1% of the elapsed time and sleep for
 		 * the rest of the time (~99%)
 		 */
+		igt_info("Sleeping for %ld ms\n", ((elapsed / 10)/1000));
+
 		usleep(elapsed / 10);
 	} while (!READ_ONCE(*done));
 
-- 
2.25.1

