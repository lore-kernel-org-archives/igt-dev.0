Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37748C77B7F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 11:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE57410E364;
	Mon, 23 Jun 2025 11:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dqr6WajY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC2510E362
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 11:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750677108; x=1782213108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NHxy8d0DC4d81xbW4xrYptztU6E3ET0Too6ZMEdSjQA=;
 b=Dqr6WajYWVN7h+5n+CMr+sx3GBFfP64oWK6T2emD2x802aTu6FZ/P1LW
 Je1/+hiWlUKnyhJZEv+3dKfN5aq0j230tj93F/YqMkSbiV80RfaMJig5+
 6aK7Sobhh9bOXKy3cpZ0Zs7+2xyBIo+zA4pGoAnaRnwCDGJSrDwx98Twu
 v9+QNxOemPsHWy3drvcTs81xRX1YGsdedNmCw37VV5oWPklMQcP9Fw0Ys
 0fKjOTBxAaVjmTp9S+5dO91c687EGba9qqot6CTnE1DzFDOLCltp+Pqdx
 ry+7PuemoB4Att7C9puRivS2zvdQrcQjAznqC5+LlPOf1kjAWG7xmIcwW A==;
X-CSE-ConnectionGUID: dfYmM6d4TNavs5T/rRgwjA==
X-CSE-MsgGUID: bxZyeOc4Scqv2tiO6mX9UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="53018923"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="53018923"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:11:48 -0700
X-CSE-ConnectionGUID: X6Gx6oFXRzCNvR7rqaw90A==
X-CSE-MsgGUID: pFJapIF4SJqBXsVwtmvf5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="157063750"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:11:46 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v15 2/5] tests/kms_async_flips: use in_formats_async for
 async modifiers
Date: Mon, 23 Jun 2025 16:39:15 +0530
Message-Id: <20250623110918.606014-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623110918.606014-1-santhosh.reddy.guddati@intel.com>
References: <20250623110918.606014-1-santhosh.reddy.guddati@intel.com>
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

