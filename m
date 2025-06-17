Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2887C71157
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 14:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD3E10E06B;
	Tue, 17 Jun 2025 14:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LipZYhOs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C5F10E71A
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 14:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750170551; x=1781706551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NHxy8d0DC4d81xbW4xrYptztU6E3ET0Too6ZMEdSjQA=;
 b=LipZYhOsC5yqqtTL98IHpngWHS+QhICVuIGY/5Q5n0e0JvAhEICqEZep
 YqoMakIYDc1vbXtxOzNcmWAp0cX7UE51oF4voVrlfg6XUWnfnjDCPFY1e
 DPb1eCkXulXUGw1476avrOvypjZR5KK6LMugMYkbVnV+tRXKL9lbdpaJG
 afe7bQsLDkZ27YKOoFAfvTiDg6SlCinbIfdyJhEEXELSRLYO0qsu5MTMX
 mv6YVMTikQP+tZFQvhJz/YoGvAj6j9FOf4xG9kFhXkmAb1ObU/06m0i8g
 0NCjnmWrPW1tIH174iJkqzbLeV0cqyuiQwvoGTfhZKyyaWBFnJTDWjTos Q==;
X-CSE-ConnectionGUID: WE9NXPh5SyKRL+u+oz2MhQ==
X-CSE-MsgGUID: +vjOU68kTG6boEnKdg3LTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63003361"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="63003361"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:29:11 -0700
X-CSE-ConnectionGUID: sEcyUAjwTCqbp3SL5q5pxg==
X-CSE-MsgGUID: xYJriEg4RxCVfOVi4pQ3sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="149687586"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:29:09 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v14 2/5] tests/kms_async_flips: use in_formats_async for
 async modifiers
Date: Tue, 17 Jun 2025 19:57:04 +0530
Message-Id: <20250617142707.490235-3-santhosh.reddy.guddati@intel.com>
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

Utilise IN_FORMATS_ASYNC property exposed to get the list of
async supported modifier/format pair and improve the test coverage by
iterating through all the supported modifiers with XRGB8888 format.

V2: Improve run_test_with_modifiers to set data formats based on async
    formats.
    Update make_fb to use data formats instead of hard coded format

V3: Update commit message, remove complicated iterations (Chaitanya)

V4: Reduce the format+modifier combinations to reduce time needed to
    execute the tests. (Chaitanya)

V5: Remove unnecessary check for reduced formats. (Chaitanya)

V6: Introduce new test for all formats and modifiers, executing only one
    flip to reduce overall time.
    Update test_with_modifiers to use async modifiers and formats X8888.

V7: split the newly added subtest to separate commit and add condition
    to skip the test if async format modifiers are not available. Also
    remove data->fail as it is not needed with the new support (Chaitanya)

v8: Refactor and clean up code.

v9: Fix missing modifier assignment. (Introducd with rebase)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_async_flips.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 065ac9c49..bf14a1a93 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -436,6 +436,7 @@ static void test_async_flip(data_t *data)
 			data->suspend_resume = false;
 			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 		}
+
 		frame++;
 	} while (diff.tv_sec < RUN_TIME);
 
@@ -815,8 +816,11 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
 		test_init(data);
 
-		for (int i = 0; i < data->plane->format_mod_count; i++) {
-			uint64_t modifier = data->plane->modifiers[i];
+		igt_assert_f(data->plane->async_format_mod_count > 0,
+			     "No async format/modifier supported\n");
+
+		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
+			uint64_t modifier = data->plane->async_modifiers[i];
 
 			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
 				continue;
@@ -824,7 +828,6 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 			if (modifier == DRM_FORMAT_MOD_LINEAR)
 				continue;
 
-			data->allow_fail = true;
 			data->modifier = modifier;
 
 			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
-- 
2.34.1

