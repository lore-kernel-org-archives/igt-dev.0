Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B490ACD5BB4
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 06:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E1A10E4A2;
	Tue, 26 May 2026 06:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HjIjFpD+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FF210E49A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 06:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779777774; x=1811313774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WbA/nufDdFCyogv6YPiSuR8y5In3n2/3ONJE259blCg=;
 b=HjIjFpD+Ru1AfmyOwv2BMB2kLqIUDpCZIIzv+1J4cXxo7EwzFzia+3tK
 bJ7HoAIfNz+mB6w+dT6CNSsmSyOYN5HP98X2CE6ZAR/+AXaEc1eXGMw0t
 61vUXLbpUK4ZL2EFif7UZ+nBJ5oBhCQPmED1pwK/6woY4Lq/WytDm+zJ/
 kGG9WP7X53d6rMAsOwOEr+GV5UW0cgs92Zj22oq46rD8r37BFzMLVPH0b
 8ckWRpbK/oWlAOhSXQN4sorTIswBhPI1SJ1o6eLDhMyE38/pi/PCsq5Hm
 q8no/5iQRCc3I5jPskZYydVLTKSmx9YDelqJ1oHANA4VsRADD4aaoSOZo Q==;
X-CSE-ConnectionGUID: oh080loMRSCNGFlZna7J3w==
X-CSE-MsgGUID: 570O4DsMQNK7FtwpLKj2gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80617990"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80617990"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 23:42:54 -0700
X-CSE-ConnectionGUID: ALAhlPE6SAq79jSgl1TivQ==
X-CSE-MsgGUID: GRq8fd1XTIGEON3MCzCEVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="265689316"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 23:42:52 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v7 6/7] tests/intel/kms_pm_dc: Add new test for DC3CO
 recovery after DC6
Date: Tue, 26 May 2026 12:11:03 +0530
Message-ID: <20260526064105.1818876-7-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526064105.1818876-1-jeevan.b@intel.com>
References: <20260526064105.1818876-1-jeevan.b@intel.com>
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

Adds a test to verify DC3CO continues to function properly
after a DC6 power cycle.

v2: Use test_dc_state_dpms for the DPMS/DC6 cycle.
    Drop redundant PSR re-enable after DPMS/DC6.
v3: Refactor dynamic block to avoid duplicates.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 51 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 620ba9329..59cb9983d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -55,6 +55,11 @@
  * Description: Verify that DC3CO entry does not cause frame drops and successfully
  *              enters the power state
  *
+ * SUBTEST: dc3co-after-dc6
+ * Description: Verify DC3CO entry is still functional after a DC6 entry and
+ *              exit cycle, ensuring DC3CO is not broken by deeper power state
+ *              transitions.
+ *
  * SUBTEST: dc5-dpms
  * Description: Validate display engine entry to DC5 state while all connectors's
  *              DPMS property set to OFF
@@ -623,6 +628,19 @@ static int has_panels_without_dc_support(igt_display_t *display)
 	return external_panel;
 }
 
+static void test_dc3co_after_dc6(data_t *data)
+{
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC6);
+
+	setup_output(data);
+	setup_dc3co(data);
+	test_dc_state_dpms(data, IGT_INTEL_CHECK_DC6);
+	setup_videoplayback(data);
+	check_dc3co_with_videoplayback_like_load(data);
+	cleanup_dc3co_fbs(data);
+}
+
 static void test_deep_pkgc_state(data_t *data)
 {
 	unsigned int pre_val = 0, cur_val = 0;
@@ -803,6 +821,39 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Verify DC3CO entry is still functional after a DC6 entry "
+		     "and exit cycle");
+	igt_subtest_with_dynamic("dc3co-after-dc6") {
+		static const struct dc3co_test_mode dc3co_modes[] = {
+			{ PSR_MODE_2, "psr2" },
+			{ PR_MODE,    "pr"   },
+		};
+
+		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
+			      "PC8+ residencies not supported\n");
+
+		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
+			const char *name = dc3co_modes[i].name;
+			data.op_psr_mode = dc3co_modes[i].mode;
+
+			igt_dynamic_f("%s", name) {
+				igt_require(psr_sink_support(data.drm_fd,
+						     data.debugfs_fd,
+						     data.op_psr_mode, NULL));
+
+				if (data.op_psr_mode == PSR_MODE_2)
+					igt_require_f(IS_TIGERLAKE(data.devid) ||
+						      intel_display_ver(data.devid) >= 35,
+						      "Platform does not support DC3CO with PSR2\n");
+				else
+					igt_require_f(intel_display_ver(data.devid) >= 35,
+						      "Platform does not support DC3CO with Panel Replay\n");
+
+				test_dc3co_after_dc6(&data);
+			}
+		}
+	}
+
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
-- 
2.43.0

