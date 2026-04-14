Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1F9ED7B95
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 09:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D729A10E58E;
	Tue, 14 Apr 2026 09:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLJuPE3k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213CD10E58E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 09:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776160338; x=1807696338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WHiSCq2SNo/bDcNMwWXhDwu2q/Dxz84SzMR+y404Ff0=;
 b=CLJuPE3kbj70oWMw+OaLAJFNWyUqyX3jMZEZHcnxRwwNWVE0IlGcY3P+
 /mHyCFYezLIMmHFoQv2Fu5YFe6K/Qs/22lODEYEpJm6AmTaeZ333pM3+V
 Y6g3mu6gXscZWV3kuZGafkbXUpDO/j7v+zOILrk3NV5cgWZs4swzy2tAw
 gD+Ypin4zvxQx06HZr7sYNm8nG0n0oiLbSszV9rZapMHGnUhHh2XPsyyP
 M8AEG7YzaRiRmSnYNFFzHzCmGXzHd+6/yYFgwLFFWyJfM+S7328JZIRr2
 WdbaXnqzge31YOMmHwMesSc4HdnKQiOStppEXo3uKYabf68dBRc3nD4Oz w==;
X-CSE-ConnectionGUID: bM+32LlMTqeV5TXd1rGnrA==
X-CSE-MsgGUID: rG8pr4BCQU6xO1wB+1LHgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77293509"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77293509"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:52:18 -0700
X-CSE-ConnectionGUID: fSNrz2FtR4mBw40mR9Qeig==
X-CSE-MsgGUID: H+4S1ZcaQ7eV0Y5tlm4weQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234979981"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 02:52:16 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 2/4] tests/intel/kms_pm_dc: Enable DC3CO test for
 PSR2/PR modes
Date: Tue, 14 Apr 2026 15:20:12 +0530
Message-ID: <20260414095014.55950-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414095014.55950-1-jeevan.b@intel.com>
References: <20260414095014.55950-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 45 ++++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index f1380ea69..910263c9f 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -110,6 +110,11 @@ typedef struct {
 	bool runtime_suspend_disabled;
 } data_t;
 
+struct dc3co_test_mode {
+    enum psr_mode mode;
+    const char *name;
+};
+
 static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
 
 static void set_output_on_pipe_b(data_t *data)
@@ -315,19 +320,19 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
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
+		      "PSR2/PR mode is not enabled\n");
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
@@ -655,11 +660,31 @@ int igt_main()
 	}
 
 	igt_describe("In this test we make sure that system enters DC3CO "
-		     "when PSR2 is active and system is in SLEEP state");
-	igt_subtest("dc3co-vpb-simulation") {
-		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
-					     PSR_MODE_2, NULL));
-		test_dc3co_vpb_simulation(&data);
+		     "when PSR2 or PR is active and system is in SLEEP state");
+	igt_subtest_with_dynamic("dc3co-vpb-simulation") {
+		static const struct dc3co_test_mode dc3co_modes[] = {
+			{ PSR_MODE_2, "psr2" },
+			{ PR_MODE,    "pr"   },
+		};
+
+		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
+			enum psr_mode mode = dc3co_modes[i].mode;
+			const char *name = dc3co_modes[i].name;
+
+			igt_dynamic_f("%s-dc3co-basic", name) {
+				igt_require(psr_sink_support(data.drm_fd,
+							     data.debugfs_fd,
+							     mode, NULL));
+
+				if (mode == PSR_MODE_2)
+					igt_require(IS_TIGERLAKE(data.devid) ||
+								intel_display_ver(data.devid) >= 35);
+				else /* PR_MODE */
+					igt_require(intel_display_ver(data.devid) >= 35);
+
+				test_dc3co_vpb_simulation(&data, mode);
+			}
+		}
 	}
 
 	igt_describe("This test validates display engine entry to DC5 state "
-- 
2.43.0

