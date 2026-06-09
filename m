Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F59CD8C85
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 03:48:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D0010E077;
	Tue,  9 Jun 2026 03:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UH5xZPgM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F4C10E075
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 03:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780976826; x=1812512826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=woRM4sEG2X20bUX5UlqosXz2rnozp5msWkZAGsTvX+Y=;
 b=UH5xZPgMQ/l3b89U/tPkXdqdbACJWVAGLnn9bI+zxeo/zaNr3+RJLOL9
 Qf4tes6twcbFzACe53IuzLTWJH61Gv13aDuFMQGzMgVs57fzTbdcsiPKA
 sxEaPDRBKCn7KvDCXNnaShj+R6ecmYFbGmnI0ICBBeYqUa6ufxRDIprU1
 yj+KY0nOVSz8POLi2QNVpTDTp7YKUOi4qRDS/BFY+luLUgpV/WkIzt2EJ
 jqokbD6pv0x+1l2WgNDZ4+T2UKv35MfjWIrMsyNMi9c9N5YHrvV2atwMz
 NI4jvsotegNRgGHdj3oRSHeQR26BmC3hK7iMb+Rh7tGRcIbA7KeJ8Cfyq g==;
X-CSE-ConnectionGUID: 7f/SIU4ZR92KZNMur74pMw==
X-CSE-MsgGUID: 76BaH8RtSJW4oMcTqU+dJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92050896"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="92050896"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 20:47:06 -0700
X-CSE-ConnectionGUID: f1UJYU1JSeG3N64GzdXIsA==
X-CSE-MsgGUID: Ns2mcpzFTSu0ZKCrEsz8Yw==
X-ExtLoop1: 1
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 20:47:04 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v9 3/7] tests/intel/kms_pm_dc: Enable DC3CO test for
 PSR2/PR modes
Date: Tue,  9 Jun 2026 09:16:46 +0530
Message-ID: <20260609034650.2281712-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609034650.2281712-1-jeevan.b@intel.com>
References: <20260609034650.2281712-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 45 ++++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 27fa5dc39..57dade47d 100644
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
@@ -110,6 +110,11 @@ typedef struct {
 	bool runtime_suspend_disabled;
 } data_t;
 
+struct dc3co_test_mode {
+	enum psr_mode mode;
+	const char *name;
+};
+
 static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
 
 static void set_output_on_pipe_b(data_t *data)
@@ -323,7 +328,8 @@ static void setup_dc3co(data_t *data)
 {
 	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, data->output);
 	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output),
-		      "PSR2 is not enabled\n");
+		      "%s is not enabled\n",
+		      data->op_psr_mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
 }
 
 static void test_dc3co_vpb_simulation(data_t *data)
@@ -658,12 +664,33 @@ int igt_main()
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
+				if (data.op_psr_mode == PSR_MODE_2)
+					igt_require_f(IS_TIGERLAKE(data.devid) ||
+						      intel_display_ver(data.devid) >= 35,
+						      "Platform does not support DC3CO with PSR2\n");
+				else
+					igt_require_f(intel_display_ver(data.devid) >= 35,
+						      "Platform does not support DC3CO with Panel Replay\n");
+
+				test_dc3co_vpb_simulation(&data);
+			}
+		}
 	}
 
 	igt_describe("This test validates display engine entry to DC5 state "
-- 
2.43.0

