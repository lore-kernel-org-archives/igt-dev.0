Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A6FC25B79
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 10:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F3B10E07A;
	Fri, 24 May 2024 10:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+GD7oz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226A510E07A
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 10:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716545960; x=1748081960;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9yG42t6Dine+yNpHin96XcuvoWdeNuUXreBQQHJITrs=;
 b=b+GD7oz8JIYLRnlmmuELlgV+7sHvQnLudf+RAI+UWFIkI/LrAW3Mh2/6
 9tyPsmpVqMyo+1nj0l5DVH6roMJ7LLb33GIV4VrGsRFkY2gHnVCKNA+Mg
 3DnJ++p7IPsjMBygnDafTq1Z/cwnbeTeaZBUgcYtlkJMeglB3oUNRqJD5
 L6rCjzCi76kzdAroOm1AknQ1sqzxpwMwwZ7C3Sdks1ddzB3aivYVP/otu
 wHWyZi7KNEAQ7hWvg+5VjlI2gdpkD66Niaqqr/WgHbDUDZ4c9ev47E7O9
 7wreuc2130xj1jNDA6ScPqyTRoeU1y2gU0l6RbPgXtho9RtoiC3q+y21+ A==;
X-CSE-ConnectionGUID: gUZL3voUQ/+RxuebjTBqkA==
X-CSE-MsgGUID: oTgtqRZHScWUSKWqk//EJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12701347"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="12701347"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 03:19:17 -0700
X-CSE-ConnectionGUID: G53BECgrSDaqr22/JmrUNw==
X-CSE-MsgGUID: taUCO3TFTDm0ZPQA/T+RvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="33961972"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 03:19:16 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 1/3] tests/kms_color_helper: Add a helper to get high
 resolution mode
Date: Fri, 24 May 2024 15:42:00 +0530
Message-ID: <20240524101202.2735010-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Add a helper to get the mode with highest possible resolution.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_helper.c | 14 ++++++++++++++
 tests/kms_color_helper.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 143dff43e..f7d5a0931 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -24,11 +24,25 @@
 
 #include "kms_color_helper.h"
 
+drmModeModeInfo *output_mode_with_max_resolution(igt_output_t *output)
+{
+	igt_info("Default mode: ");
+	kmstest_dump_mode(igt_output_get_mode(output));
+
+	igt_sort_connector_modes(output->config.connector, sort_drm_modes_by_res_dsc);
+
+	igt_info("High resolution mode: ");
+	kmstest_dump_mode(&output->config.connector->modes[0]);
+
+	return &output->config.connector->modes[0];
+}
+
 bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
 {
 	bool ret = true;
 
 	igt_output_set_pipe(data->output, pipe);
+	igt_output_override_mode(data->output, data->mode);
 	if (!intel_pipe_output_combo_valid(&data->display))
 		ret = false;
 	igt_output_set_pipe(data->output, PIPE_NONE);
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 23463b944..8162c440d 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -69,6 +69,7 @@ typedef struct {
 	color_t coeffs[];
 } gamma_lut_t;
 
+drmModeModeInfo *output_mode_with_max_resolution(igt_output_t *output);
 bool pipe_output_combo_valid(data_t *data, enum pipe pipe);
 bool panel_supports_deep_color(int fd, char *output_name);
 uint64_t get_max_bpc(igt_output_t *output);
-- 
2.43.2

