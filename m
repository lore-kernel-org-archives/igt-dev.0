Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17A6C71136
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 14:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82F210E728;
	Tue, 17 Jun 2025 14:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgQy08KM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F5310E728
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750170557; x=1781706557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J3duQsOv76i12hEcRagxb516jTWYNEHReG31dUxXDDU=;
 b=MgQy08KMUlWZCR+F0XYbePTfE1WikucZMigBCnKCfTMjZFBtEkkYGCl9
 QC+VVBUezSfyKYFHID6jwBWe2vZb08gL361eCeNdtog/hhtfD8WAsdQXJ
 CA4C2B++NjLCB4y5RP5GZzFcnnKDjlHNBXoNEvX1Ttj7VMnXXc4U68/O/
 2ZmAeyPqIajcJes0v7NSfGNaZ39kJ9oLho6ggWERIOxifGdfemeQVYWpN
 G1ji7eVNxTLr3ZbRQVJVhXQIXME7qLHts9cvxupB3mzwxas7agiNVkOwJ
 vehQ7AmTMTq738vorylq7kxexw6yP8nRHyuDKmG/yDzFBhpmgQR/3pcXh w==;
X-CSE-ConnectionGUID: luQOmn8mRwW/0ukxlMlyaQ==
X-CSE-MsgGUID: fCfJuPP4Q5Scs+T+NvvV1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63003371"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="63003371"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:29:16 -0700
X-CSE-ConnectionGUID: gcevnTiiTJOFz2G+7DUyFA==
X-CSE-MsgGUID: JBNRDXU/SNi/chn9z2cVcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="149687690"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:29:15 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v14 5/5] tests/kms_async_flips: Skip Async Flips with
 Linear Modifier
Date: Tue, 17 Jun 2025 19:57:07 +0530
Message-Id: <20250617142707.490235-6-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617142707.490235-1-santhosh.reddy.guddati@intel.com>
References: <20250617142707.490235-1-santhosh.reddy.guddati@intel.com>
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

Skip the linear modifier subtest on unsupported platforms

V2: Remove platform check and use in_formats_async (Chaitanya)
    Update the commit message

V3: Fix crash

v4: Handle the case for linear modifiers on platforms where
IN_FORMATS_ASYNC is not supported. (Chaitanya)

v5: Move the linear modifier support checks to run_test (Chaitanya)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index e176b2a28..0c8f4afae 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -799,6 +799,35 @@ static void test_crc(data_t *data)
 	igt_assert_lt(data->frame_count * 2, data->flip_count);
 }
 
+static void require_linear_modifier(data_t *data)
+{
+	enum pipe pipe = PIPE_A;
+
+	data->output = igt_get_single_output_for_pipe(&data->display, pipe);
+	igt_require_f(data->output, "No output found for pipe %s\n",
+		      kmstest_pipe_name(pipe));
+
+	igt_output_set_pipe(data->output, pipe);
+
+	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+	igt_require_f(data->plane, "No primary plane found for output %s\n",
+		      data->output->name);
+
+	if(!igt_plane_has_prop(data->plane, IGT_PLANE_IN_FORMATS_ASYNC)) {
+		data->modifier = DRM_FORMAT_MOD_LINEAR;
+	} else {
+		igt_assert_f(data->plane->async_format_mod_count > 0,
+			     "No async format/modifier supported\n");
+		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
+			if (data->plane->async_modifiers[i] == DRM_FORMAT_MOD_LINEAR) {
+				data->modifier = DRM_FORMAT_MOD_LINEAR;
+				return;
+			}
+		}
+		igt_skip("No linear modifier supported for async flips\n");
+	}
+}
+
 static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_display_t *display = &data->display;
@@ -806,6 +835,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
 	if (data->atomic_path)
 		require_atomic_async_cap(data);
 
+	if (data->linear_modifier)
+		require_linear_modifier(data);
+
 	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
 		igt_display_reset(display);
 
-- 
2.34.1

