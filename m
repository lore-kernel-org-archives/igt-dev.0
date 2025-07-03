Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BC8C83030
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 06:03:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2010810E133;
	Thu,  3 Jul 2025 06:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRG00wpG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCA010E133
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 06:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751522618; x=1783058618;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WafAK+wwrs2xW6ZpXL8vB2IyAlW6v+z+fG4KhePBvhE=;
 b=cRG00wpGSCLodJXlnJlwtBzdoQNffQ8/aqjkyGZBkQ6RC51GfchGlCqL
 nDUgrkvt4y8Qu/RWM83mxeQUtScYCrhzj4NEUS3LKsEwyp5Zc8y7XKzxC
 b58mELAV5eqvmFj1DDFEBzg4T0wT0QTVOHkfrd8eTdszK50/ZfIcndnt/
 hxMePAu2YwrtFpU2Vt7bWBkYRc7FPShUSSQkybYCIc5zoUr3TcVM2+8bZ
 G+LHF1g5IwrPGproyg6MwahNIy2ih2xAZXwNnDb59OMOcPSaEZx7ok7vu
 uWAnFyjKiMLORzv+wdoI2vRcJ959uJsxnGD3IrR6WjRRUHt59oZa4y2tO A==;
X-CSE-ConnectionGUID: yNgTNPRVQzWbDR/cCIopNw==
X-CSE-MsgGUID: za1MmbloQfaSCSdRuIDSpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41461501"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="41461501"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:03:38 -0700
X-CSE-ConnectionGUID: CJh+DfDsRkm9F1A4YVLRDw==
X-CSE-MsgGUID: 9nDh8JYUT0CTMVQgfQuXYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="154042237"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:03:37 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_plane_scaling: Skip scalar2 downscale
 tests on Intel Gen14+ with specific conditions
Date: Thu,  3 Jul 2025 11:33:53 +0530
Message-ID: <20250703060353.74819-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Bspec: 69901

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 63d35d76b..353e3054b 100644
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
+						igt_info("Scalar2 does not support downscale operation");
+						continue;
+					}
 					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
 						for_each_valid_output_on_pipe(&data.display, pipe, output) {
 							igt_info("Trying on %s\n",
-- 
2.43.0

