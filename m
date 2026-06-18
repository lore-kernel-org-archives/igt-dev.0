Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEBECD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 06:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69DE10EC4A;
	Thu, 18 Jun 2026 06:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lT1aBSHl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA78B10EC4A
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 06:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781764083; x=1813300083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8yjhOLgRkgyVwE9Lhf2hcJ9zNS5i+8r48Cj/rm8XQH0=;
 b=lT1aBSHlp7NztKFP9WkzQaAozjinJVXs5eIlUxsiSEWqYS+FpXtOk66g
 U9Oe9oADtDUJIgCMAzLTdsqSDN2uiEAcDUZscBMxPpSnNKdGZvZmnSnAj
 l9S9LR8gPCBeHk9xKa6yygIiBWsfSghkIrJxAr/zfVmSOUAaKMGzlPnxc
 f2dP35Y0bvkpHiFyCiiFDJ6vjdk8VBFR9R+WZc+bdUxRCN7WXJ+xx2/Um
 VqYDnnYyp9fcAbn284wFVf7e/Zs5O68Fhd7BGysSSaS3oj/TkLZUX1bSa
 YQ2I4s3PlHob0pdORsEZq9J2Cw9IfNCO8IsVV/x4DiVfLD2CyKdJi7rAH g==;
X-CSE-ConnectionGUID: WHbbqJzNRQarZZ7rhxqgTA==
X-CSE-MsgGUID: P/gonGdHSlG9LIyUu8jZ7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82358323"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="82358323"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:28:03 -0700
X-CSE-ConnectionGUID: TB95JbSpSDSyIFTS1RjgPQ==
X-CSE-MsgGUID: aGL3W4R6ToGQKK21G23xcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="253381037"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:28:01 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Subject: [PATCH i-g-t v10 3/7] tests/intel/kms_pm_dc: Enable DC3CO test for
 PSR2/PR modes
Date: Thu, 18 Jun 2026 11:57:45 +0530
Message-ID: <20260618062749.2789015-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618062749.2789015-1-jeevan.b@intel.com>
References: <20260618062749.2789015-1-jeevan.b@intel.com>
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

v2: Fix debug, remove trailing dash and merge mode and char to
    single strcut array.
v3: Minor cosmetic changes.
v4: Update commit message, use data->op_psr_mode directly, keep
    psr_wait_entry, and refresh dc3co description to cover PSR2/PR.
v5: Remove TGL check for PSR2.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 tests/intel/kms_pm_dc.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 73607e764..13f884e19 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -48,8 +48,8 @@
 
 /**
  * SUBTEST: dc3co-vpb-simulation
- * Description: Make sure that system enters DC3CO when PSR2 is active and system
- *              is in SLEEP state
+ * Description: Make sure that system enters DC3CO when PSR2 or PR is active and
+ *              system is in SLEEP state
  *
  * SUBTEST: dc5-dpms
  * Description: Validate display engine entry to DC5 state while all connectors's
@@ -113,6 +113,11 @@ typedef struct {
 	bool runtime_suspend_disabled;
 } data_t;
 
+struct dc3co_test_mode {
+	enum psr_mode mode;
+	const char *name;
+};
+
 static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
 
 static void set_output_on_pipe_b(data_t *data)
@@ -326,7 +331,8 @@ static void setup_dc3co(data_t *data)
 {
 	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, data->output);
 	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output),
-		      "PSR2 is not enabled\n");
+		      "%s is not enabled\n",
+		      data->op_psr_mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
 }
 
 static void test_dc3co_vpb_simulation(data_t *data)
@@ -704,12 +710,29 @@ int igt_main()
 	}
 
 	igt_describe("In this test we make sure that system enters DC3CO "
-		     "when PSR2 is active and system is in SLEEP state");
-	igt_subtest("dc3co-vpb-simulation") {
-		data.op_psr_mode = PSR_MODE_2;
-		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
-					     data.op_psr_mode, NULL));
-		test_dc3co_vpb_simulation(&data);
+		     "when PSR2 or PR is active and system is in SLEEP state");
+	igt_subtest_with_dynamic("dc3co-vpb-simulation") {
+		static const struct dc3co_test_mode dc3co_modes[] = {
+			{ PSR_MODE_2, "psr2" },
+			{ PR_MODE,    "pr"   },
+		};
+
+		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
+			const char *name = dc3co_modes[i].name;
+			data.op_psr_mode = dc3co_modes[i].mode;
+
+			igt_dynamic_f("%s", name) {
+				igt_require(psr_sink_support(data.drm_fd,
+							     data.debugfs_fd,
+							     data.op_psr_mode, NULL));
+
+				igt_require_f(intel_display_ver(data.devid) >= 35,
+					      "Platform does not support DC3CO with %s\n",
+					      data.op_psr_mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
+
+				test_dc3co_vpb_simulation(&data);
+			}
+		}
 	}
 
 	igt_describe("This test validates display engine entry to DC5 state "
-- 
2.43.0

