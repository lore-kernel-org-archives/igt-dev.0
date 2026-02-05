Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7B3EC1EA7
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 11:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C54D10E873;
	Thu,  5 Feb 2026 11:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBq1G1/A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547FC10E873
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 11:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770291350; x=1801827350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v569AsNH6dbV1d8ykY7chS4YA9CqovbDW6/6dIjIh6c=;
 b=PBq1G1/Ak7uGgS8t35ePONFZjPNF90Ee9c0m0byYD/K/DIrCps5ncie+
 MpIPWX7g8WXzlXP8gD5zQ0twvBMooMaOjNIdMEosJqYxhDOLWSDsvuSkc
 oYdFSJmneKN8s3AsN9LXFmooSVZ3SsvbHeeBkhEiHrjPlk2JbWtezGg2y
 e7HyQVg4whYtrrfTuEoHQ1+TSSw9z/ACBWEKpg4YcbsXEHu5otqjRUiyq
 NPuISZrlxz0RNthyqe6aJjXBEg2FuIy64fDFJS2uppx9jPsK6fBaUTqv/
 eQQWujuUk6GnUd1LZEFIjPhvEMKqwDzJtwUauYbZ0Id1Q0BCgJlj36AZc Q==;
X-CSE-ConnectionGUID: it54B+doTI65qMHzzdaf4Q==
X-CSE-MsgGUID: Wy3S5AaPS6O0bz3XEE2a3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71386095"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71386095"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 03:35:50 -0800
X-CSE-ConnectionGUID: EIoDEyvqQ76Q5Bhf7EUAgg==
X-CSE-MsgGUID: iaMRyam+Qb+yjgzzZfKTCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="248096047"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa001.jf.intel.com with ESMTP; 05 Feb 2026 03:35:49 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3 2/2] tests/kms_plane: Skip unsupported modifiers
Date: Thu,  5 Feb 2026 17:16:19 +0530
Message-Id: <20260205114619.1054849-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205114619.1054849-1-pranay.samala@intel.com>
References: <20260205114619.1054849-1-pranay.samala@intel.com>
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

Skip modifier subtests that are not supported.

v2: Avoid code duplication (Rama)

v3: Introduce pixel-format flag

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index a7b1bf25d..46d870764 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -167,6 +167,7 @@ enum {
 	TEST_PANNING_TOP_LEFT           = 1 << 2,
 	TEST_PANNING_BOTTOM_RIGHT       = 1 << 3,
 	TEST_SUSPEND_RESUME             = 1 << 4,
+	TEST_PIXEL_FORMAT               = 1 << 5,
 };
 
 static const struct {
@@ -1468,6 +1469,15 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 	int count = 0;
 
 	for_each_crtc_with_single_output(&data->display, crtc, data->output) {
+		if ((data->flags & TEST_PIXEL_FORMAT) &&
+		    !igt_display_has_format_mod(&data->display,
+						DRM_FORMAT_C8,
+						data->mod)) {
+			igt_info("Skipping: Modifier " IGT_MODIFIER_FMT " not supported\n",
+				 IGT_MODIFIER_ARGS(data->mod));
+			continue;
+		}
+
 		igt_display_reset(&data->display);
 
 		igt_output_set_crtc(data->output,
@@ -1496,6 +1506,7 @@ run_tests_for_pipe_plane(data_t *data)
 		igt_describe("verify the pixel formats for given plane and pipe");
 		igt_subtest_with_dynamic_f("pixel-format-%s-modifier", modifiers[i].str) {
 			data->mod = modifiers[i].modifier;
+			data->flags = TEST_PIXEL_FORMAT;
 			run_test(data, test_pixel_formats);
 		}
 	}
@@ -1506,6 +1517,7 @@ run_tests_for_pipe_plane(data_t *data)
 					   modifiers[i].str) {
 			data->mod = modifiers[i].modifier;
 			data->crop = 4;
+			data->flags = TEST_PIXEL_FORMAT;
 			run_test(data, test_pixel_formats);
 		}
 		data->crop = 0;
-- 
2.34.1

