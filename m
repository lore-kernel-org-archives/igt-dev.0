Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37166CD37B6
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 06:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3DB10ECA8;
	Wed, 13 May 2026 06:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VSgbbWK8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCB910EC91
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 06:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778653074; x=1810189074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s72v6XciSc3j6hE3QM7uL6dzkV+IwNO+yHCtWWWLa3o=;
 b=VSgbbWK8qpnq6XlItNebu6Ao6ZLYD7fRMjaWsHlJmW23LjECYHbhrnpu
 Eo5XphuzR8iUqbqSx/bNeFgVZX3VendxzKwA5K89nqLDVi5uZMVqesvJZ
 pJIE5R/8c/r02djXqkJy1rQT9f6L+7ygNoIW5FnJIpCvDp8v8mDRwOhwK
 zVI+86AYJY6dYlIipmuGQ1+qTXBwc19MkYSCeLj05cA2cBb0Kf6lJp+tZ
 v/vOuGNPWUfpwjf4wHBI8VJrrjklz8H5Vm1hdTz7VpJG6slTB8DgEFDIC
 gLQ7psK6f1hAqgOCavoFaSl1sPpS5jdfzh4l/aUVYdP4sL+DYqHXvG+c7 w==;
X-CSE-ConnectionGUID: 3kDRWVs4TCahv7JlVxEQhw==
X-CSE-MsgGUID: Tm84KBEOTwa0T6055Gi9DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79685143"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79685143"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 23:17:53 -0700
X-CSE-ConnectionGUID: ORLMHAVAQCGnaGUrZ30oUQ==
X-CSE-MsgGUID: VVC7dm6eT2ayA6SW4DzFKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="235320967"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 23:17:52 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v5 3/7] tests/intel/kms_pm_dc: Enable DC3CO test for
 PSR2/PR modes
Date: Wed, 13 May 2026 11:46:01 +0530
Message-ID: <20260513061605.645695-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513061605.645695-1-jeevan.b@intel.com>
References: <20260513061605.645695-1-jeevan.b@intel.com>
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
index 27fa5dc39..96c96e2db 100644
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
+			"when PSR2 or PR is active and system is in SLEEP state");
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

