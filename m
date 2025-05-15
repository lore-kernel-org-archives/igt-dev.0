Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60CEC3ABDD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 09:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F3B10E7DF;
	Thu, 15 May 2025 09:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHPsifuU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884D910E7DE
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 09:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747301309; x=1778837309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v6d7VtciaTuZ3kTAp2vVxHWJdYbKSeer/OTFQkGvFtI=;
 b=YHPsifuU1ff+BoEy655pW51WH1khrhkif4OAh1SldMDgyUhgn1KHlo3t
 5IjzI/EcuKbGY/lUbEOtV2z/gnUoeSAwH3lZLQtqz4HEo2BYZwPRKSfJg
 dtPoKEgxwa4Cd16lSo4fqy+CEg7f/Bp+xcRWOT3sFf3FeLrYplojrX4kh
 OhhMhaB5C9aiAtZI+fxsTNqEkpr2dutUHSupvgLCnDnfwf837M9QdqzAf
 lFElWOpjYl7p5VOlD6E24/y8+vrzIXY/ppnyrG9L9wbD/HQwlhKZpaYyB
 U+qtVOsaTuftDVBb4dVxdnALuLiUrdzFB6D1F8cO7zc8tmWxGPwszMDMD A==;
X-CSE-ConnectionGUID: vc8ACNo4StePWSMcRZCdIA==
X-CSE-MsgGUID: 2za8kkC0ThKKK4ftUCkpsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="53039195"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="53039195"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:28:29 -0700
X-CSE-ConnectionGUID: QProBo/dRIOE90/eMcueOQ==
X-CSE-MsgGUID: eJAbu9/OTAGmluklt8enpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="138359847"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:28:27 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v9 2/4] tests/kms_async_flips: use in_formats_async for
 async modifiers
Date: Thu, 15 May 2025 14:49:22 +0530
Message-Id: <20250515091924.3294094-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515091924.3294094-1-santhosh.reddy.guddati@intel.com>
References: <20250515091924.3294094-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_async_flips.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 97128cfad..503a5a842 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -431,6 +431,7 @@ static void test_async_flip(data_t *data)
 			data->suspend_resume = false;
 			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 		}
+
 		frame++;
 	} while (diff.tv_sec < RUN_TIME);
 
@@ -810,8 +811,11 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
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
@@ -819,9 +823,6 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 			if (modifier == DRM_FORMAT_MOD_LINEAR)
 				continue;
 
-			data->allow_fail = true;
-			data->modifier = modifier;
-
 			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
 				      data->output->name,
 				      igt_fb_modifier_name(modifier)) {
-- 
2.34.1

