Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B14BCCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 09:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B116310E857;
	Thu,  6 Nov 2025 09:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AoVVNOgC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A97310E856
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762420946; x=1793956946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RLdb48BLUo973J5w92urgHnO9vYZuqM9uqYxB1UrHfc=;
 b=AoVVNOgC1bmeqoMzekbOaE11W+lpBrn2KT4LuWMzc431fEi4lJFnUq+E
 l7NXeTbLPruCQ2mEhg6iE8WZ79SG+oBTX/FPBSVwTKz9LbqNOkf5SWrhi
 G5X7QUpM18dIB1Ge20oD/4QxUj19OHpxse2tD5GBjmW0WkOakrxwu9ym8
 BnQth9YzL4WvugFbXiRJNacFRDERdgZhGaSLNsEBe96CazbS9rwMVI4gV
 1LLLYvtF6Ow9q6N15WE3GrOwG2ncphzTz85LRzjGBlNBh/WHEQClEo8ar
 5oH3VHIzBaMTQuwA6/dGX5Rg7n65GdobAY4lOwEioP0IlbogPjB/zwm8V A==;
X-CSE-ConnectionGUID: XgC9FU3vT3iJkKllij5xdw==
X-CSE-MsgGUID: zcgy2NklRCS/icPADfwnjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75236908"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75236908"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:22:26 -0800
X-CSE-ConnectionGUID: 47ZowgmoRO6i9v+depomDg==
X-CSE-MsgGUID: HykPrr/UTkqxCiQS5O6gcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187553267"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 01:22:25 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/kms_plane_scaling: Reduce debug log level
 in CI for scaling tests
Date: Thu,  6 Nov 2025 14:52:02 +0530
Message-ID: <20251106092204.1505129-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106092204.1505129-1-ramanaidu.naladala@intel.com>
References: <20251106092204.1505129-1-ramanaidu.naladala@intel.com>
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

Reduce excessive logging in CI environments when multiple outputs
are connected. It prevents CI runners from exceeding disk usage
limits.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 63d35d76b..34c8f8a64 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -32,6 +32,7 @@
 
 #include "igt.h"
 #include "igt_vec.h"
+#include "igt_sysfs.h"
 #include <math.h>
 
 /**
@@ -1358,11 +1359,15 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.devid = is_intel_device(data.drm_fd) ?
 			intel_get_drm_devid(data.drm_fd) : 0;
 		igt_require(data.display.is_atomic);
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 	}
 
 	igt_subtest_group {
 		igt_output_t *output;
 
+		if (igt_get_connected_output_count(&data.display) > 1)
+			update_debug_mask_if_ci(DRM_UT_DRIVER | DRM_UT_CORE);
+
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
 			igt_describe(scaler_with_pixel_format_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {
-- 
2.43.0

