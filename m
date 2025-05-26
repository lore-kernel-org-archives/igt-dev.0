Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59697C54FB3
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 05:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DCB10E26B;
	Mon, 26 May 2025 05:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OrjxJBqR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9EA10E26B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 05:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748238731; x=1779774731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yz7KDA2RTO9OFzi/A62Xw/lX/DS5nkfQatpoM0jezWo=;
 b=OrjxJBqRIy2e1XphqCyIAH7gc0GWLo1s3fvqaeWFrfrwNV4RG/0jZ34k
 kSho/z8Ow0wxqV8B9eBkd75E7oPc7ldZ25vIqhTSFtMCzQjlPXPhB76J7
 BJCJrW0LIZxQmCj1vKtxrCcRZYChJ4nJBRkA128pcmp85e0kr01VJvbNT
 M9qW6dFVWbD2aj9avt+/b1cysjW1F4gE99DYn51IZc7fF3xoFohffXZ8r
 z5a3qo9Fw50Szoq09hzNB9B4XFFeOqlmoim+EoT1wBggBfhYGDCTev/x9
 LA4wSgpGJHqblhLy4ok9fvno+Vvjf+YPs/hNE0Mo54lGjn/0Ggtv1BOk/ g==;
X-CSE-ConnectionGUID: USwYmhL/Tl688Wto8wnZ2Q==
X-CSE-MsgGUID: 4OjVvx7gTz+zwcsyU4cPjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="75595107"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="75595107"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2025 22:52:11 -0700
X-CSE-ConnectionGUID: sLeCNTjSRPG+T9aWghZ2Mw==
X-CSE-MsgGUID: qtQF2TQARNu42AGtgDnxIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142135728"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2025 22:52:10 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v11 5/5] tests/kms_async_flips: Skip Async Flips with
 Linear Modifier
Date: Mon, 26 May 2025 11:12:17 +0530
Message-Id: <20250526054217.127802-6-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526054217.127802-1-santhosh.reddy.guddati@intel.com>
References: <20250526054217.127802-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index f824f60f9..c144c8390 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -901,6 +901,18 @@ static void run_test_with_async_format_modifiers(data_t *data, void (*test)(data
 	igt_vec_fini(&tested_formats);
 }
 
+static bool is_linear_supported(data_t *data)
+{
+	int i;
+
+	for (i = 0; i < data->plane->async_format_mod_count; i++) {
+		if (data->plane->async_modifiers[i] == DRM_FORMAT_MOD_LINEAR)
+				return true;
+	}
+
+	return false;
+}
+
 static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 {
 	if (data->atomic_path)
@@ -988,6 +1000,9 @@ igt_main
 		igt_describe("Wait for page flip events in between successive asynchronous "
 			     "flips with linear modifiers");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear") {
+			igt_require(data.plane->async_format_mod_count > 0);
+			igt_skip_on_f(!is_linear_supported(&data),
+						  "Async Flips with linear modifier are not supported");
 			test_init_ops(&data);
 			data.linear_modifier = true;
 			run_test(&data, test_async_flip);
@@ -996,6 +1011,8 @@ igt_main
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

