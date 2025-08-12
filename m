Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3522C87FCB
	for <igt-dev@archiver.kernel.org>; Tue, 12 Aug 2025 07:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C69D10E03B;
	Tue, 12 Aug 2025 07:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ciUwWKbX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B492310E03B
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Aug 2025 07:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754985082; x=1786521082;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1txes1dbMoN8Z9gW2FT7nADM+AlhCpz2VwMN80ZzRF0=;
 b=ciUwWKbXQY5juhSoQDXsfPKB9+3WXsjPjJz0nWcomCzs7tS+ZoerCA/P
 I2gFfD1WQlWtQh9/0jJeU+WOL73druUjPr/BhutxBZcr6EEBIRaDjXXY4
 MX2dYD6/YJjJFo9lt2V3MWXE/+s+xe3FVcEywdlkBt7fhCjXTzNOCS/Cl
 X/3G9LTQrzj/lncG/mtspah0rP62YX8497ppFeinEQX+Dav2lKfgejljF
 DlejiwpDhkgmwWhHR7L+tgr3SX8sNaouCh+VwFtvKotHpIlXjDN+lVVUg
 QhbFi0gVuav8Z0P3B0vN1K5dWS9uou55SfQPXVrX8qLvfUmdPFt281LYX A==;
X-CSE-ConnectionGUID: PZcN9AG4ReCr7JoGWUkclg==
X-CSE-MsgGUID: Ct5ZYqZ1Sb64ikKuXq3I5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67958912"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="67958912"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 00:51:21 -0700
X-CSE-ConnectionGUID: cWPBzPI2S6SeXKdLlgi1xw==
X-CSE-MsgGUID: G0j5BNfKQPuyTgOox69oFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="166511483"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa008.fm.intel.com with ESMTP; 12 Aug 2025 00:51:20 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/kms_atomic_transition: Change debug mask for
 multi-output modeset tests
Date: Tue, 12 Aug 2025 13:29:09 +0530
Message-Id: <20250812075909.2119126-1-pranay.samala@intel.com>
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

v2: Include all modeset tests (Rama)
    Access display structure and avoid temporary variable (Rama)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 8c6094987..1b81a01a3 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1096,6 +1096,17 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	return ret;
 }
 
+static int count_conn_outputs(igt_display_t *display)
+{
+	int conn_outputs = 0;
+
+	for (int i = 0; i < display->n_outputs; i++) {
+		if (igt_output_is_connected(&display->outputs[i]))
+			conn_outputs++;
+	}
+	return conn_outputs;
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1210,6 +1221,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(transition_tests); i++) {
+		if (strstr(transition_tests[i].name, "modeset"))
+			update_debug_mask_if_ci(DRM_UT_DRIVER);
+
 		igt_describe(transition_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
 			pipe_count = 0;
@@ -1250,6 +1264,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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

