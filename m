Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97615D262B2
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 05:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E13310E175;
	Wed, 21 Jan 2026 05:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yx4smOlf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BD510E6B4
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 05:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768973161; x=1800509161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UunKla4Xnyzw6WskrGdir2qQ07/DLsnOrmyDnUPtlTM=;
 b=Yx4smOlfacghbNOShP5kSdxzPjtAW2P1YtkGVEvKSEK4XYWqiwK27OKC
 gbhGFlAnmnDUooHhfJdRmxDdm4RE5dS9EtYQmLKcWCTG3IYje9svrZ7mm
 X51JGheFmpegEqggjOQIDvEXa+wl2pnwZzap9SBOMM6PFBTMtMgj8/zut
 3E/MCSkmhKpsy5kzIb/kXYEAO95/z6n+nXKLGkY4zX6r2yveX+9PPT2nN
 wZmBjtpYkFa/8whz0P5P/8LQSvt6WH4u//uJmYx7gb/1sDtSnaC0gf1q6
 O2ynucmNUHxmufIKVP4bxhRmVrZWFvwP81UvmUhbywCJgayagH8G33kCJ w==;
X-CSE-ConnectionGUID: qaGUriXfRJGFbDTAy0XVHg==
X-CSE-MsgGUID: lP1F1rs1QAin8CI/pCljgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81303510"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="81303510"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 21:26:00 -0800
X-CSE-ConnectionGUID: 2IDVBLWiRVSjXKYLiZyX5Q==
X-CSE-MsgGUID: qlMCGd54TAmNa3WQMUjG+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="210839429"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 21:25:59 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, juha-pekka.heikkila@intel.com,
 ramanaidu.naladala@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/kms_flip_scaled_crc: Move require checks at the
 beginning of the subtest
Date: Wed, 21 Jan 2026 10:51:58 +0530
Message-ID: <20260121052158.491159-1-karthik.b.s@intel.com>
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

Previously, setup_fb() contained the igt_require() for format + modifier,
causing the dynamic test to be intialized only to skip eventually if the
combination is unsupported.
This patch moves format/modifier checks to the per-subtest level.

Additionally, linear framebuffers combined with REFLECT_X rotation are
not supported on Intel platforms prior to gen35. To make this explicit and
reduce CI run time, the test now performs an early skip for this
combination, clearly stating the reason in the skip message.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_flip_scaled_crc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 954b46b5f..91e5793f4 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -670,9 +670,6 @@ const struct {
 static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
 		     uint32_t height, uint64_t format, uint64_t modifier)
 {
-	igt_require(igt_display_has_format_mod(&data->display, format,
-					       modifier));
-
 	igt_create_color_fb(data->drm_fd, width, height,
 			    format, modifier, 0, 1, 0, newfb);
 }
@@ -901,6 +898,18 @@ int igt_main()
 	for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
 		igt_describe(flip_scenario_test[index].describe);
 		igt_subtest_with_dynamic(flip_scenario_test[index].name) {
+			igt_require(igt_display_has_format_mod(&data.display,
+							       flip_scenario_test[index].firstformat,
+							       flip_scenario_test[index].firstmodifier));
+			igt_require(igt_display_has_format_mod(&data.display,
+							       flip_scenario_test[index].secondformat,
+							       flip_scenario_test[index].secondmodifier));
+
+			if(flip_scenario_test[index].secondmodifier == DRM_FORMAT_MOD_LINEAR &&
+			   flip_scenario_test[index].secondrotation & IGT_REFLECT_X)
+				igt_require_f(data.gen >= 35,
+					      "Linear fb with REFLECT_X unsupported");
+
 			free_fbs(&data);
 			for_each_pipe(&data.display, pipe) {
 				bool found = false;
-- 
2.43.0

