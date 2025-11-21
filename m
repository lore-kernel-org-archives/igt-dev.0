Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBBBCFA749
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 08:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525E510E7EC;
	Fri, 21 Nov 2025 08:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TinFPu5E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFCD10E7EC
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 08:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763713079; x=1795249079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=02Jd2btVO9DmvyBH7tpGQBrtKIjXwXdX+2dYPFhlFwM=;
 b=TinFPu5E1HSvV0lma9XnRRB3UC4CWIpWCh205v5sDvdic3QDyoq/mx8n
 ey5l6kZbzVsokVLoOT9c1towUvg/x2zfWnGDYDRODCI/AL+RIlUEBCAiC
 Mh0XN9b/+hD2hf/LPzZgFLsOZyrlSKx97773nLTxekAXoyZZ6SvnWOtax
 UUjHIXlDgMqVAk/VHRN6HiROmj0jWdRvQt5LShD4RlD9D1r6CC1CpZqpa
 Z5kFIddFI2YNaQaCoIFn+CyTQy2v+A0rKYmIU2J2m6BI7z8a/4ti5B/bJ
 mwpX/8uuu1HIdxcREYpUzkpnFoGSczMYCHSW7Bc02NgPvWvCvrr8649kI w==;
X-CSE-ConnectionGUID: mVD9c5ukQ/eTNZus6DCBRg==
X-CSE-MsgGUID: rw25a6GoRVSeZ5j2xL+YLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65838373"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="65838373"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 00:17:58 -0800
X-CSE-ConnectionGUID: /8j+hP1IRlSc2jjCARUTZw==
X-CSE-MsgGUID: p02MbNi3SuGPrj7mdu6MlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="196768036"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 00:17:56 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/3] tests/kms_sharpness_filter: Skip pipes without
 sharpness-capable scaler[1]
Date: Fri, 21 Nov 2025 13:54:54 +0530
Message-Id: <20251121082454.1085001-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121082454.1085001-1-swati2.sharma@intel.com>
References: <20251121082454.1085001-1-swati2.sharma@intel.com>
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
 tests/kms_sharpness_filter.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index ef3ce3995..969d83151 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
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

