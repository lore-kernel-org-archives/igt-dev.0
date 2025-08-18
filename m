Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD612CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 16:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644CF10E49D;
	Mon, 18 Aug 2025 16:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkGI9exr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D9D10E49D
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 16:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755533343; x=1787069343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j7TdJXx3HzhOa8imZYlEytqCur4MgttJufZWoQSE8o4=;
 b=PkGI9exrC/XGtibp8wotuUtQjh4yszae9Bka+17RPINK1bLFK4DNdDpZ
 yCRnerjbbDwzgOTbMxO/5+lw1tONqSID3ScpqCC41/bp5rOFwmgcCqp39
 nTZKRcU49hcmGBaRVuWo6MIaWTeyWu9FP0rBrZFjsFGkWooKL6zPXhuLw
 al/GB3CkMSoEKHECpgjCd9CWakWBJqSj/GcU5qdvUaw0320RhVP9Ku7N6
 MwO9Wmlkx8kMB8L+iVS4c2ya8wGnE6XgrdaBCD56bchuQUEANacL9TeWR
 0nkf5p2lYCAfes3GSIRZyft+ipmqtJZthIFnKhF0fY3H/Y6GbthVS1FWt Q==;
X-CSE-ConnectionGUID: /BVLrz7HQvWCKRIZqFdDdA==
X-CSE-MsgGUID: VSH8aUkXSw6dgWgKl52yYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75329196"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="75329196"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:09:03 -0700
X-CSE-ConnectionGUID: RhdOmn2mSAGR4ipUTCeP4A==
X-CSE-MsgGUID: deYkrbHFR7WRKbc2DRpV2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="168415986"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 18 Aug 2025 09:09:01 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 1/2] tests/kms_atomic_transition: Update debug mask
 for multi-output modeset tests
Date: Mon, 18 Aug 2025 21:46:48 +0530
Message-Id: <20250818161649.2157822-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250818161649.2157822-1-pranay.samala@intel.com>
References: <20250818161649.2157822-1-pranay.samala@intel.com>
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
v3: Move count_conn_outputs() to lib for future use (Rama)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 8c6094987..a13830965 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1210,6 +1210,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(transition_tests); i++) {
+		if (strstr(transition_tests[i].name, "modeset"))
+			update_debug_mask_if_ci(DRM_UT_DRIVER);
+
 		igt_describe(transition_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
 			pipe_count = 0;
@@ -1250,6 +1253,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(modeset_tests); i++) {
+		if (igt_get_connected_output_count(&data.display) > 2)
+			update_debug_mask_if_ci(DRM_UT_DRIVER);
+
 		igt_describe_f("%s", modeset_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", modeset_tests[i].name) {
 			for (j = 1; j <= count; j++) {
-- 
2.34.1

