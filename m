Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8873DC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 09:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E34C10E0F9;
	Thu, 27 Mar 2025 09:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GiQlooNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9007210E0F9
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 09:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743066878; x=1774602878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5EkKPRz0Zm7YUaY9eZcPjDzs8gCFMPgQBp0injjD5rA=;
 b=GiQlooNh6LDKWqkuhdWUNUomIN9O8XRGw2Bwe4LVlnV2kKyKHig48bZo
 QB4RGJiplK996Yzq7yYOgasDGrgOblblG/oLcfFEY72znZEZq2bk5Tdrj
 3JvU7ZDUOpIPKte1TjuxEW9vsE5puQZ6sD/m+RNyuSgK0CwYsX+0d9Wp0
 aO6UQ1/P1Xl4HEkGYoTt4Fm9wUkGe6O6vsav6/Y0MlAOLxq5aPY/odxFs
 E+94+QT9pfG/iT7pnFP/Lni4L2f1oflLbX/ETYt8QtJzeIjIpqW1qojGr
 2ddlTC8pPDFzOlr4PB8s2/cZU5K6sJn04VhzwJmyYT8fm+BkOz6ExwgjI A==;
X-CSE-ConnectionGUID: yP47BU+5QlOa7mK09Vht1g==
X-CSE-MsgGUID: pQQzqLqPQk6zg7b5GLydZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69749315"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="69749315"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 02:14:38 -0700
X-CSE-ConnectionGUID: ROUtEaGiSQ27LUyzf4ljhg==
X-CSE-MsgGUID: mIyZuwZfTJC9fIucZQq8RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="162311504"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 02:14:37 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v8 2/4] tests/kms_async_flips: use in_formats_async for
 async modifiers
Date: Thu, 27 Mar 2025 14:38:49 +0530
Message-Id: <20250327090851.2740672-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327090851.2740672-1-santhosh.reddy.guddati@intel.com>
References: <20250327090851.2740672-1-santhosh.reddy.guddati@intel.com>
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
 tests/kms_async_flips.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index da426f753..f26c2c3fa 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -348,6 +348,7 @@ static void test_async_flip(data_t *data)
 			data->suspend_resume = false;
 			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 		}
+
 		frame++;
 	} while (diff.tv_sec < RUN_TIME);
 
@@ -715,12 +716,14 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
 		test_init(data);
 
-		for (int i = 0; i < data->plane->format_mod_count; i++) {
+		igt_assert_f(data->plane->async_format_mod_count > 0,
+			     "No async format/modifier supported\n");
+
+		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
 			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
 				continue;
 
-			data->allow_fail = true;
-			data->modifier = data->plane->modifiers[i];
+			data->modifier = data->plane->async_modifiers[i];
 
 			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
 				      data->output->name,
-- 
2.25.1

