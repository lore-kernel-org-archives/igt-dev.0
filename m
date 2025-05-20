Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C9BC3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 06:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2BB10E42D;
	Tue, 20 May 2025 06:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ld0GJCP/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BFB10E42D
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 06:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747723246; x=1779259246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xGupxhwW61MJTHFZjorSkdm3XaqCm4jHrgmd6lcFcc8=;
 b=Ld0GJCP/Bn3NYLc9llgiPSblDBwS0cQnLiQHPAV6DyZoLh2w0Pc3j9sx
 bSecjD6fD/iJ3RjBAWaVJPdx2YsVyXVl7nZYVqI/HOzqBcmGnAIGObSm4
 40eH0DWReSh6h2+BM+iAvHIaG6BS9hsu0JcYoeiKLBJBOG4ZajpXiy5Nz
 xQwamaLvUNnpBUsT8/y37HEtDx+0qW9fqlvoJLgz/+vKCrHHvzG57Wlth
 uSvboUMlzd2/8jC8mEjRG96WvXJ2NJmTcAtVzSCfj1MN4a3bavBcU/1U8
 jf133p1kY0V0xz/+o6fLfvDXVGDXkfBCDh9vY5jUOXiPDsC4r77biCSHT g==;
X-CSE-ConnectionGUID: HvK0QQHQQAGrwWoGQho0BA==
X-CSE-MsgGUID: 3W3FjaN/R3mH50vCJnHFfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48755447"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="48755447"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:40:46 -0700
X-CSE-ConnectionGUID: TjbUt6aZSg2MA5EHUhBJ3g==
X-CSE-MsgGUID: WRGvk3FqTmy7qORU0Uoa2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140105737"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:40:44 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH v9 2/4] tests/kms_async_flips: use in_formats_async for async
 modifiers
Date: Tue, 20 May 2025 12:01:21 +0530
Message-Id: <20250520063123.3309554-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250520063123.3309554-1-santhosh.reddy.guddati@intel.com>
References: <20250520063123.3309554-1-santhosh.reddy.guddati@intel.com>
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
index 97128cfad..3c6b7868c 100644
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
@@ -819,7 +823,6 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 			if (modifier == DRM_FORMAT_MOD_LINEAR)
 				continue;
 
-			data->allow_fail = true;
 			data->modifier = modifier;
 
 			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
-- 
2.34.1

