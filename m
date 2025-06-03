Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D583C61CE5
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 09:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C54310E5AC;
	Tue,  3 Jun 2025 09:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtAjduUp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5872310E5AC
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 09:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748942945; x=1780478945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RD2w7DY5abFvJMLNG7c4jVs0J48dFfySTm/vxtZU4ys=;
 b=MtAjduUp1BZtMPO77Z1tgnxTbaXf6AM8rh4704xzCSzlWFOXDHyMSKnI
 /Bw0FJCEr0L7K7n8WLE/ck6Mv6juLUdMGzUiN0jWe2nKZRnOTJclsS/kh
 EchREtee9aHjm7c2L1polBLSpkeE8jCMQVrsb4S26ZYkhQVEq64blFEIi
 Pxd55uCeyH4NCw3IuO3YNi/3Gu0HYEwX7YmgrtzTUYr7SQPHmKW5zG8eH
 2hbRqMqvgy3rTB9aRKW40JiRA4r4Fk2L8+fMZvTdmMuSXS+jtxe3911VR
 HNv7pylJJa7q+ItXLk9yBMzd8EwoISGU2fP2GiZkaA8EiFhKi3Z/WKgjC w==;
X-CSE-ConnectionGUID: H6cM4yXaSpCZsey9ZhNa6Q==
X-CSE-MsgGUID: Z0Wy8BjXR6qCDJpTgjcvOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50892435"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="50892435"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 02:29:05 -0700
X-CSE-ConnectionGUID: VnfTQvaxQlyoY78dWlRCAA==
X-CSE-MsgGUID: A/RI9qfUTpqGKXlWPlxSdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="145761025"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 02:29:03 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v13 5/5] tests/kms_async_flips: Skip Async Flips with
 Linear Modifier
Date: Tue,  3 Jun 2025 14:57:58 +0530
Message-Id: <20250603092758.371150-6-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603092758.371150-1-santhosh.reddy.guddati@intel.com>
References: <20250603092758.371150-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index f824f60f9..586ee5d84 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -901,6 +901,28 @@ static void run_test_with_async_format_modifiers(data_t *data, void (*test)(data
 	igt_vec_fini(&tested_formats);
 }
 
+static bool is_linear_supported(data_t *data)
+{
+	int i;
+
+	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
+		test_init(data);
+
+		/* for drivers that doesn't support IN_FORMATS_ASYNC yet,
+		 * assume linear modifier is supported.
+		 */
+		if (!igt_plane_has_prop(data->plane, IGT_PLANE_IN_FORMATS_ASYNC))
+			return true;
+
+		for (i = 0; i < data->plane->async_format_mod_count; i++) {
+			if (data->plane->async_modifiers[i] == DRM_FORMAT_MOD_LINEAR)
+				return true;
+		}
+	}
+
+	return false;
+}
+
 static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 {
 	if (data->atomic_path)
@@ -988,6 +1010,8 @@ igt_main
 		igt_describe("Wait for page flip events in between successive asynchronous "
 			     "flips with linear modifiers");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear") {
+			igt_skip_on_f(!is_linear_supported(&data),
+						  "Async Flips with linear modifier are not supported");
 			test_init_ops(&data);
 			data.linear_modifier = true;
 			run_test(&data, test_async_flip);
@@ -996,6 +1020,8 @@ igt_main
 		igt_describe("Wait for page flip events in between successive asynchronous "
 			     "flips using atomic path with linear modifiers");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear-atomic") {
+			igt_skip_on_f(!is_linear_supported(&data),
+						  "Async Flips with linear modifier are not supported");
 			test_init_ops(&data);
 			data.linear_modifier = true;
 			run_test(&data, test_async_flip);
-- 
2.34.1

