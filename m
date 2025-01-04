Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456D7E77199
	for <igt-dev@archiver.kernel.org>; Sat,  4 Jan 2025 11:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4A810E14D;
	Sat,  4 Jan 2025 11:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/RtRUaf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEAC10E14D
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Jan 2025 11:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735990388; x=1767526388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vh/hRmY+VT0GUKvoFAJVBZl4hzwxD1IYHE/WBw+Y1ck=;
 b=N/RtRUafgkH30eC2kkfkygKV+K1b0sxtP7zXahEsr35DKONGkRfbZ9ll
 hfLYVnLta3RgW17hZJBvP9NSy/tlmFMNjDIzxOIHP7u0DU0pBmOiJMmje
 YMeIUmqrTy2iUk95Knqn2HSDMNXrEZ0YUZiUbn4NUvwZcOR2avaUq9SQl
 bVXaQbJwcTtiPAWJjAsX6rHhtcczeUNxEAM+Bl7zqKDl8q1ztXi790fyE
 KU7xBiNi2nhQjxYrdfzll/oLPoBtbVgAhsj8hggDTViOvqpJMNY780a3q
 8xMeEt27TLOaZnipNuXltwo6OP4zKnCgbmiqgB1ANCED8pAInzpDWC8LA w==;
X-CSE-ConnectionGUID: pnQmgqQlQ/epeRXdoCGGuA==
X-CSE-MsgGUID: 0eedKB7rRdK9t7KKdTFWQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36325825"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="36325825"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2025 03:33:08 -0800
X-CSE-ConnectionGUID: xVMUYnxUR3CUbX+qdSOrpQ==
X-CSE-MsgGUID: wewltWKFSCG9OiNPevNhJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="139322026"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2025 03:33:07 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, pranay.samala@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/kms_scaling_modes: Add informative
 messages for skipped scaling mode tests
Date: Sat,  4 Jan 2025 17:01:27 +0530
Message-ID: <20250104113128.893119-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104113128.893119-1-ramanaidu.naladala@intel.com>
References: <20250104113128.893119-1-ramanaidu.naladala@intel.com>
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

Add `igt_info` messages to provide more context when skipping outputs
that do not support scaling mode. Include `igt_info` messages to
indicate when invalid pipe/output combinations are skipped.

V1: Fix alignment issues. (Pranay)
V2: Update skip message and alignment issue. (Swati, Pranay)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_scaling_modes.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 5fd34c4b2..4e6a32414 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -117,8 +117,11 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		igt_display_reset(display);
 
-		if (!has_scaling_mode(output))
+		if (!has_scaling_mode(output)) {
+			igt_info("%s: Doesn't support IGT_CONNECTOR_SCALING_MODE\n",
+				 igt_output_name(output));
 			continue;
+		}
 
 		igt_output_set_pipe(output, pipe);
 		if (!intel_pipe_output_combo_valid(display))
-- 
2.43.0

