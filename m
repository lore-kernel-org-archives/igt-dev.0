Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6B0EC0463
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 09:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCC310E753;
	Tue,  3 Mar 2026 09:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wc4Dml9J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE0510E753
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772530757; x=1804066757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JoN8Keo+cpOhq1gVJU2lHMgnmSgGpyV//NATVRf1hMI=;
 b=Wc4Dml9JYmRHNXKee4TYBAEOaomQLGjODfjyy6znK/7nyDtee2O69svd
 V4Mku3Rvf1InuWIHdPL01QClDo9wRHuF7blgyLFTF0Fz2dCyPPiR7U7vC
 TRciuO4WUXnSO3Fc6lGo1MZtVPyW59GSbRBdCbpV0eLamu+gEVz8cl2Ll
 pi7jX/5IdALiq9gkkY+/nLjlsf8GG4+onpGP62liiYr8HzpS2E34eNZCN
 dpa/tUbQFcauFOOodAMwyB5AlCW0XHnWpQve3yHDMWwQ/EEjeIVIeiBi0
 LwzK2EDhEAMeOaISz40aTh/4pdIsMiHYeMQZJYsaDL6j/QJMyiQjd2ro2 g==;
X-CSE-ConnectionGUID: 0YC5XxgIQjS1HHQAWXOpTQ==
X-CSE-MsgGUID: DrwZtfAVQ6+uEQQJGc6iTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="76160016"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="76160016"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 01:39:17 -0800
X-CSE-ConnectionGUID: dJ4OJTwbQpexZCKx/GYy2w==
X-CSE-MsgGUID: NbDDq9qIQF2ONB2xAdMTbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="222097845"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 01:39:15 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, mohammed.thasleem@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/kms_pm_dc: Enable DC3CO test for
 PSR2/PR modes
Date: Tue,  3 Mar 2026 15:09:26 +0530
Message-ID: <20260303093928.569925-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303093928.569925-1-jeevan.b@intel.com>
References: <20260303093928.569925-1-jeevan.b@intel.com>
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

Enable DC3CO with PSR2/PR mode on TGL and for platforms with
display version greater than 35.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 507b6168d..10450474a 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -315,19 +315,19 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 	check_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
 }
 
-static void setup_dc3co(data_t *data)
+static void setup_dc3co(data_t *data, enum psr_mode mode)
 {
-	data->op_psr_mode = PSR_MODE_2;
+	data->op_psr_mode = mode;
 	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, NULL);
 	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL),
-		      "PSR2 is not enabled\n");
+		      "PSR2/PR is not enabled\n");
 }
 
-static void test_dc3co_vpb_simulation(data_t *data)
+static void test_dc3co_vpb_simulation(data_t *data, enum psr_mode mode)
 {
 	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
 	setup_output(data);
-	setup_dc3co(data);
+	setup_dc3co(data, mode);
 	setup_videoplayback(data);
 	check_dc3co_with_videoplayback_like_load(data);
 	cleanup_dc3co_fbs(data);
@@ -638,10 +638,26 @@ int igt_main()
 
 	igt_describe("In this test we make sure that system enters DC3CO "
 		     "when PSR2 is active and system is in SLEEP state");
-	igt_subtest("dc3co-vpb-simulation") {
-		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
-					     PSR_MODE_2, NULL));
-		test_dc3co_vpb_simulation(&data);
+	igt_subtest_with_dynamic("dc3co-vpb-simulation") {
+		int modes[] = {PSR_MODE_2, PR_MODE};
+		const char *append_subtest_name[2] = {
+			"psr2-",
+			"pr-",
+		};
+
+		for (int i = 0; i < ARRAY_SIZE(modes); i++) {
+			igt_dynamic_f("%s-dc3co-basic", append_subtest_name[i]) {
+				igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+							     modes[i], NULL));
+
+				if (modes[i] == PSR_MODE_2)
+					igt_require(IS_TIGERLAKE(data.devid) ||
+						    intel_display_ver(data.devid) >= 35);
+				else if (modes[i] == PR_MODE)
+					igt_require(intel_display_ver(data.devid) >= 35);
+				test_dc3co_vpb_simulation(&data, modes[i]);
+			}
+		}
 	}
 
 	igt_describe("This test validates display engine entry to DC5 state "
-- 
2.43.0

