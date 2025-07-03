Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE5CC77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 14:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600C410E115;
	Thu,  3 Jul 2025 14:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="doUmsFpR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6727810E115
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 14:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751552755; x=1783088755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AZ92bSaH+NqlMaTyMVAkssqDNkLd+jWdh4B6xlrk0NE=;
 b=doUmsFpRbPXiBrO7EsJ9ynaHQxikEGEInQKonUmG56TUPk1HS5q1HCn3
 bDNhV85NRnYsxruTMxwc1ST/KzgpkkNkx+IO4tH53I0zEVz0OX59ypD4f
 2IY3a+D8sz+GhW+XyJRXf4r+QvnfIPeoF0gFDtHlhMHHGUWd5T0/3mNKa
 d2DMUxfKMk8Hc63g2PlFsDaqJm6RhgzWZqJsXMkqOkbBbDf+63n31rOBr
 vPQ9U3b+Uxy9oEMdi+7GsW7DB7HW3eA0ERtjlL2M4GQ33QiUXNB3VZkLH
 I7yM17j3FNxObeFagLhk7IYpw1K19syFwZ/x4iBPyfyFjiuzzFmFndfDb g==;
X-CSE-ConnectionGUID: e+Zy1Vu0RLG4A08/TZXccQ==
X-CSE-MsgGUID: LlNwQKlqSySUoaBJaCuqbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64931406"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="64931406"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:25:55 -0700
X-CSE-ConnectionGUID: J5ZIEEN6SmuWj0GjpzhT4A==
X-CSE-MsgGUID: uuFLiHabSumPNm9XxH7frg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="154149294"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:25:53 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_plane_scaling: Skip scalar2 downscale
 tests on Intel Gen14+ with specific conditions
Date: Thu,  3 Jul 2025 19:56:06 +0530
Message-ID: <20250703142606.108897-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703060353.74819-1-ramanaidu.naladala@intel.com>
References: <20250703060353.74819-1-ramanaidu.naladala@intel.com>
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

Add a conditional check to skip tests involving scalar2 downscale
operations on Intel devices. This avoids running unsupported
scenarios and helps prevent potential test failures.

v2: Use break for scalar2 downscale.

Bspec: 69901

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 63d35d76b..46a65fc5b 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1536,6 +1536,16 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			igt_describe(scaler_with_2_planes_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
 				for_each_pipe(&data.display, pipe) {
+					if (is_intel_device(data.drm_fd) &&
+					    (intel_display_ver(data.devid) >= 14) &&
+					    ((scaler_with_2_planes_tests[index].test_type ==
+					      TEST_PLANES_DOWNSCALE) ||
+					    (scaler_with_2_planes_tests[index].test_type ==
+					     TEST_PLANES_UPSCALE_DOWNSCALE)) &&
+					    (scaler_with_2_planes_tests[index]. sf_plane1 != 1)) {
+						igt_info("Scalar2 does not support downscale operation\n");
+						break;
+					}
 					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
 						for_each_valid_output_on_pipe(&data.display, pipe, output) {
 							igt_info("Trying on %s\n",
-- 
2.43.0

