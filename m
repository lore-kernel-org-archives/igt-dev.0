Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BBAC87FD1
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 08:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5A610E25C;
	Tue,  5 Aug 2025 08:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4ywWp44";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E4D10E25C
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Aug 2025 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754383333; x=1785919333;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JnRZ3Po9O1ojp/Wido4hs5miRF2Bl68aJFM1LngVXxA=;
 b=W4ywWp44wA0HIt7juupr3AUAsnIhpc5fVG4p4eSjVKAJydVUBR2G8R+j
 Yg27MYFQlJ/SXY6uKMJAjGbihGph+Sol9Z2FCBO5kg4hNrj01MzOZUQVv
 xHHxRoJzvZRbAkSUPPP1AmIYAyxJKKhrxWqnr8lLlBWl/QVWXu2B9QZWp
 LyTPfw2HRiJrDiZ9eSSRhH9/f1pwcYQ2rrXbTX4Z04OV3wO11GMacNE1t
 Ys0LTEvvKg4shc4YIOeBLT900jDa5eeIqTTaA5XBeI5DtLsktqDNmQsZQ
 Vwwc5ksxbo1HjU5uaZ4y6tSSRVuzKUjMghCqo8aNNrjXpBnTSPa7CEN2B Q==;
X-CSE-ConnectionGUID: ifIa1IkmToivX8SUcPKipw==
X-CSE-MsgGUID: MFSShAdqTkGslNoOLsD1PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56751495"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56751495"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 01:33:47 -0700
X-CSE-ConnectionGUID: 7oMrh1BNSRmvi4f2eCwyXw==
X-CSE-MsgGUID: ZoWyz14fSKeaXf+OSZuPfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="164089157"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa009.jf.intel.com with ESMTP; 05 Aug 2025 01:33:45 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_atomic_transition: Change debug mask for
 multi-output modeset tests
Date: Tue,  5 Aug 2025 14:11:31 +0530
Message-Id: <20250805084131.1512658-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

To prevent disk usage issues during CI runs with multi-output,
this patch limits debug logging to DRM_UT_DRIVER for modeset
transition tests when more than two outputs are connected

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 8c6094987..2bb2cc63b 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1096,6 +1096,19 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	return ret;
 }
 
+static int count_conn_outputs(igt_display_t *display)
+{
+	int conn_outputs = 0;
+	igt_output_t *output;
+
+	for (int i = 0; i < display->n_outputs; i++) {
+		output = &display->outputs[i];
+		if (igt_output_is_connected(output))
+			conn_outputs++;
+	}
+	return conn_outputs;
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1210,6 +1223,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(transition_tests); i++) {
+		if (strcmp(transition_tests[i].name, "plane-all-modeset-transition") == 0 ||
+		    strcmp(transition_tests[i].name, "plane-all-modeset-transition-fencing") == 0)
+			update_debug_mask_if_ci(DRM_UT_DRIVER);
+
 		igt_describe(transition_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
 			pipe_count = 0;
@@ -1250,6 +1267,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(modeset_tests); i++) {
+		if (count_conn_outputs(&data.display) > 2)
+			update_debug_mask_if_ci(DRM_UT_DRIVER);
+
 		igt_describe_f("%s", modeset_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", modeset_tests[i].name) {
 			for (j = 1; j <= count; j++) {
-- 
2.34.1

