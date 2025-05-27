Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45557C54ED1
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 05:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6C010E3AF;
	Tue, 27 May 2025 05:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ST8Sqp9m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340ED10E3AF
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 05:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748325261; x=1779861261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BxZFsVpesxgF5FMtLIGvB32KSut6YdFxYrySu7ADnhI=;
 b=ST8Sqp9mmTq9nB10dvjj+cQKh6+gUAjgil1lrcuNXBGxLXafZBRZTwXN
 IWJj2qoUUSMv+ITO25O+WEG6XpbDuU9LGPJCSyw7cx3iHjd6sjz4xzwe6
 Pf0VXRWjMdQ7UwV4zFwinNj3avo32rK3+z3S+wM3A76VXqMH0FIxBKBH3
 J61/YEoTuHwxbdVAUmdiS0SEPvo2xDgM8wxdFmWUSf1ugwkd0Q9pHuNhG
 Sj89zsAtFh/TjTs5k8n/QTXood2bxIqvdce/5oTFZgQeMmSN3YkGtvkcb
 UeFUQCJoB2DQjYiQGPGWy2KHgyaHzPiGOP6jTRb8CniGyyAQfwCcrZ8jb A==;
X-CSE-ConnectionGUID: 842ZIIgBQxKVghc0zkEjzg==
X-CSE-MsgGUID: U7HyHF7qRhGlkPgC3uCUBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50455632"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="50455632"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 22:54:21 -0700
X-CSE-ConnectionGUID: pH0dmjYPSH6Y0AQvNYsTLw==
X-CSE-MsgGUID: Fs05ca4qT8a//5VbrR8Weg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="179842451"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 22:54:19 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v12 5/5] tests/kms_async_flips: Skip Async Flips with
 Linear Modifier
Date: Tue, 27 May 2025 11:23:43 +0530
Message-Id: <20250527055343.247952-6-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527055343.247952-1-santhosh.reddy.guddati@intel.com>
References: <20250527055343.247952-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index f824f60f9..5aa05d039 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -901,6 +901,22 @@ static void run_test_with_async_format_modifiers(data_t *data, void (*test)(data
 	igt_vec_fini(&tested_formats);
 }
 
+static bool is_linear_supported(data_t *data)
+{
+	int i;
+
+	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
+		test_init(data);
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
@@ -988,6 +1004,8 @@ igt_main
 		igt_describe("Wait for page flip events in between successive asynchronous "
 			     "flips with linear modifiers");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear") {
+			igt_skip_on_f(!is_linear_supported(&data),
+						  "Async Flips with linear modifier are not supported");
 			test_init_ops(&data);
 			data.linear_modifier = true;
 			run_test(&data, test_async_flip);
@@ -996,6 +1014,8 @@ igt_main
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

