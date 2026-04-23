Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC64FDEE32
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 17:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D204310E36B;
	Thu, 23 Apr 2026 17:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7rM2f77";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CC210E36B
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 17:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776965766; x=1808501766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J/P2vMJBGRa1NX/XdDmb3IlhBn4zF3/Pf9dtDiDZ09Q=;
 b=j7rM2f77qlqa1876nXU0E8KMz7vYuHo255+XHeG7Z/g/0jFj8JVfUddp
 NXVzMyf2DeMBI1UgrFffSryt9K4/koyMPcvuSJtJZzmwetzwBDppLKqBH
 pYsP9WDzA8nq7hbz51BwqJ2697aCaaw8/kzsE0Vtx+wcjzLrb2zE9FpN0
 qXHJi2C0A/ED9Wa4q/GT00Zx9wE9RQwBSWb4ZIDN36529QP92F3K7ZPKQ
 kaCdxZ8g0uiBtrJdVqcZ4uHYSFs6pdo7IGOORJdMybe5o4xhoGQLcdrBh
 lHruwq8bvuz+wYlrYgqIiSnbLeXRQNBPgYOv0TBeSaF6tmkM4wHT2EkQA g==;
X-CSE-ConnectionGUID: vEZafqBxQQiAiyo4lOtQnA==
X-CSE-MsgGUID: pdHB5hVhS1umo/O1HcmWoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="78134702"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="78134702"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 10:36:05 -0700
X-CSE-ConnectionGUID: mwO/WDPVTpiU2jThTLAipA==
X-CSE-MsgGUID: nhEkqK2/Q0iI6/DEaWMiCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="229527348"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 10:36:03 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v3 3/6] tests/intel/kms_pm_dc: Enable DC3CO test for
 PSR2/PR modes
Date: Thu, 23 Apr 2026 23:04:00 +0530
Message-ID: <20260423173403.123706-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423173403.123706-1-jeevan.b@intel.com>
References: <20260423173403.123706-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 50 ++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 27fa5dc39..83652e9f8 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
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
@@ -319,18 +324,20 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
 }
 
-static void setup_dc3co(data_t *data)
+static void setup_dc3co(data_t *data, enum psr_mode mode)
 {
+	data->op_psr_mode = mode;
 	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, data->output);
-	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output),
-		      "PSR2 is not enabled\n");
+	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL),
+		      "%s is not enabled\n",
+		      mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
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
@@ -658,12 +665,33 @@ int igt_main()
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
+			enum psr_mode mode = dc3co_modes[i].mode;
+			const char *name = dc3co_modes[i].name;
+
+			igt_dynamic_f("%s", name) {
+				igt_require(psr_sink_support(data.drm_fd,
+							     data.debugfs_fd,
+							     mode, NULL));
+
+				if (mode == PSR_MODE_2)
+					igt_require_f(IS_TIGERLAKE(data.devid) ||
+						      intel_display_ver(data.devid) >= 35,
+						      "Platform does not support DC3CO with PSR2\n");
+				else
+					igt_require_f(intel_display_ver(data.devid) >= 35,
+						      "Platform does not support DC3CO with Panel Replay\n");
+
+				test_dc3co_vpb_simulation(&data, mode);
+			}
+		}
 	}
 
 	igt_describe("This test validates display engine entry to DC5 state "
-- 
2.43.0

