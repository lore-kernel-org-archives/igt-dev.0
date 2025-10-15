Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8ECCCD185
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 07:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FC210E723;
	Wed, 15 Oct 2025 07:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PhRI1pnJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E765710E262
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 07:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760513734; x=1792049734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ycvnvdSIYFdle4lwCedao+c8nLIW6OMVlN85alCclRQ=;
 b=PhRI1pnJhe70DnudNKcGLlF9YFxzooFwLDZPoLg7mGE5TPLKJwI31tru
 vH8sYQ31zs1y8AAAZ47QwRJ595jD+34HASXlUFHMmwLS4kA7aF74umU94
 1+o+kA0dq4c/vsKNNrsRvts80/eh1kZdhBJubpMH4I7vXK5KOwBZFBy8P
 /J8BL/Lh8atQcVSqUoeD5ps1syqlvBwSj40o5vKUe49wjPFMPgTkxlVRd
 X4ANXO56C9bRI48dEg5dIjLJMmGSF+Zaz+Fdty4ToCoRKyTGr4E36AU3G
 4pUTSxQ/1oXQ7yiNSZW0T2UJcX3Foldr6sYtTjoVP1D69pHVaj6Ux23Hn Q==;
X-CSE-ConnectionGUID: Rtp+56kDRAa69Zyo4+/IDQ==
X-CSE-MsgGUID: mxNUVsPfRC+uRzLIXCP1+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62573602"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="62573602"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:35:23 -0700
X-CSE-ConnectionGUID: sOyvcbCsQMi4FxW2zwq/mw==
X-CSE-MsgGUID: NKGsYArxThqepk+pupuIbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="182882150"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 00:35:22 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 1/2] tests/kms_vrr: Dynamically verify LOBF across
 vrefresh steps
Date: Wed, 15 Oct 2025 13:05:07 +0530
Message-ID: <20251015073508.448186-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015073508.448186-1-ramanaidu.naladala@intel.com>
References: <20251015073508.448186-1-ramanaidu.naladala@intel.com>
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

Replace the static LOBF check with iterative vrefresh stepping
to detect LOBF enablement.

v2: Fix corner case highlighted in review comments.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 704620a7d..580527c59 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -870,6 +870,8 @@ static void
 test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
 	uint64_t rate[] = {0};
+	uint32_t step_size, vrefresh;
+	bool lobf_enabled = false;
 
 	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
 	prepare_test(data, output, pipe);
@@ -879,11 +881,24 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
-	igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
-	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[LOW_RR_MODE].vrefresh);
-	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
-	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
-		     "LOBF not enabled\n");
+
+	step_size = (data->range.max - data->range.min) / 5;
+
+	for (vrefresh = data->range.max - step_size;
+	     vrefresh >= data->range.min; vrefresh -= step_size) {
+		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
+		flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
+
+		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
+			lobf_enabled = true;
+			break;
+		}
+
+		if (vrefresh == data->range.min)
+			break;
+	}
+
+	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
 }
 
 static void
-- 
2.43.0

