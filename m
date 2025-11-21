Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968E9CFC26E
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 12:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4922C10E030;
	Fri, 21 Nov 2025 12:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+QmscsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F1889F49
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763727891; x=1795263891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M2KbnKJN/z+XkoMJFYDBSIS2EOqNuWkl+mgkvp3SHNc=;
 b=N+QmscsWSDba4jxF38a7jTc3ahMelF4OawwBpIxPstkMDfHXZ1/z+qX2
 1Id+JqBw2Ks2Uv56mjg2jfW9G8dW6aDCJYb1CPIqglv/dpqnaOawHDwqP
 o+dKIoxm8y4mmV1/yIV/EPhbdjF7afgG42kVlkcHVfp8df6ZaNszkehHF
 2LJvIHVuc5Q5ukS5vexlg00tP2k0Feepmz4PduCaiUCze4mw753e/hjab
 AP8r3+xQgS2/wyav/q7wCep950cukJ2QOpx+AjS0sAMRW1r8H9EZyOA/L
 wSV4mtSl5k6ACmgSJY7aMV9T8k0sdYkhBJeLX66vkxfs0fbONcbnixwUE w==;
X-CSE-ConnectionGUID: 6OE7wfRbTTauDll/tn6IIA==
X-CSE-MsgGUID: MQFIHPmzRZm84f8j2jXa+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77289596"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="77289596"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 04:24:50 -0800
X-CSE-ConnectionGUID: mf4KoGsaQ5mBz35EW1YbAg==
X-CSE-MsgGUID: kCAjm0t/QgWbRmzezOn32A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="215047364"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 04:24:49 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 6/6] tests/intel/kms_sharpness_filter: Skip pipes
 without sharpness-capable scaler[1]
Date: Fri, 21 Nov 2025 18:01:34 +0530
Message-Id: <20251121123134.1099006-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121123134.1099006-1-swati2.sharma@intel.com>
References: <20251121123134.1099006-1-swati2.sharma@intel.com>
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

Sharpness Filter is implemented only in scaler[1] (the second scaler).
Scaler[0] does not contain the sharpness hardware block.

The test now explicitly checks for the presence of "scaler[1]" in
i915_display_info. If scaler[1] is missing, the pipe cannot
support sharpness and the subtest is skipped.
Bspec: 69908

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index ef3ce3995..969d83151 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -439,6 +439,12 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			data->pipe = &display->pipes[data->pipe_id];
 			data->mode = igt_output_get_mode(data->output);
 
+			if (!has_scaler_block(display, pipe, 1)) {
+				 igt_info("%s: Doesn't support scaler[1].\n",
+				 kmstest_pipe_name(data->pipe_id));
+				 continue;
+			}
+
 			if (!has_sharpness_filter(data->pipe)) {
 				igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
 				kmstest_pipe_name(data->pipe_id));
-- 
2.25.1

