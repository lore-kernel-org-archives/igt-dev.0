Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA6DC25B7C
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 10:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC4910E235;
	Fri, 24 May 2024 10:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lNgpgv5U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA16410E235
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 10:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716545961; x=1748081961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pB03ezZyykfMRJn1y6c2ocpkNeEUYt2YSWhVi6zosoY=;
 b=lNgpgv5U77FbL5ccPE2V38+NenKmwDWIFDc5V5H1jDVYf9Qyms5QOMWZ
 3IKP3mO98zAYz+9b/kG9Q9psK4GtZhooezHwYwWkn2FzlZJ1DJfoQ2ad+
 YKR+7s1i1W5KWXmsBMac47n7CNW7HBomWVyyGI78aTAJXIX3r9o1gY5aw
 XoPPkHYHCs14pTcgBVLvpJkbIHnK9V8laV6xQ3vwcWomb0G+peKMb+JAp
 j7anpkSn+UHj2tKqgP3jrRQ3qJe+8xs8awdyTbD3xe7pgS/yp2SSnls4L
 aL1nrxDcNBiiksbYfn7LjcCCwWJarzH8JnHH/Pmr/UgbPc5SArwErjMfY Q==;
X-CSE-ConnectionGUID: BafDaMTkTIi6lryFiPGKvQ==
X-CSE-MsgGUID: Cc6Y7O1nRMePh0YSoE2MHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12701360"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="12701360"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 03:19:20 -0700
X-CSE-ConnectionGUID: QsWpE3vDRj6yUwznteEUVg==
X-CSE-MsgGUID: Wmz6UCGmQhGCEgXa6EBfEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="33961980"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 03:19:19 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 3/3] tests/kms_color: Update all tests to use high
 resolution mode
Date: Fri, 24 May 2024 15:42:02 +0530
Message-ID: <20240524101202.2735010-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240524101202.2735010-1-bhanuprakash.modem@intel.com>
References: <20240524101202.2735010-1-bhanuprakash.modem@intel.com>
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

Instead of using the default mode, use the mode with highest
possible resolution.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 645a03537..75d28477b 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -771,6 +771,8 @@ static void test_cleanup(data_t *data)
 {
 	igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = NULL;
+	if (data->mode)
+		free(data->mode);
 }
 
 static void
@@ -785,7 +787,9 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 	 */
 	data->color_depth = 8;
 	data->drm_format = DRM_FORMAT_XRGB8888;
-	data->mode = igt_output_get_mode(data->output);
+	data->mode = malloc(sizeof(drmModeModeInfo));
+	igt_assert(data->mode);
+	memcpy(data->mode, output_mode_with_max_resolution(data->output), sizeof(drmModeModeInfo));
 
 	if (!pipe_output_combo_valid(data, p))
 		goto out;
@@ -824,7 +828,9 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	data->color_depth = 8;
 	delta = 1.0 / (1 << data->color_depth);
 	data->drm_format = DRM_FORMAT_XRGB8888;
-	data->mode = igt_output_get_mode(data->output);
+	data->mode = malloc(sizeof(drmModeModeInfo));
+	igt_assert(data->mode);
+	memcpy(data->mode, output_mode_with_max_resolution(data->output), sizeof(drmModeModeInfo));
 
 	if (!pipe_output_combo_valid(data, p))
 		goto out;
-- 
2.43.2

