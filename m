Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96B1C7EE31
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 04:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B6B10E93B;
	Fri, 27 Jun 2025 04:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvJQkvH0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05F810E93B
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 04:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750997273; x=1782533273;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NzMppUNMOZQoQ3iAxtGbef4w0njAghvRXhf1+mNvJso=;
 b=gvJQkvH0XMnnRvuFpq2RdZ091nr+7sKhEdF44PPmMeyg0qjTI2RlEYEM
 ugXFer51i+z52Ta11MX7b2zf9G17OBmLsDYFlMhg5nlHPqSrXt8osR8tC
 LvG7CqUwPoLSgqbROH3jvuJC1EwAa/F4pYfeaPw92/AP/3nL3IkUpKrtK
 1fe73S4PSciOR1FLO7m6R7j0VcRmlEoL9qQRKamUMcfwmj1D7xGTjkus7
 eDVanW6IiJKuNt6b4rZcnu0NNwG7TThjRViDniAhv8YfoG/TkfbTnqMC0
 uUZUPdTdX3B7Ucb642rkikYWMxCw5wMWKWnHxcCfY4pfrLPycbTg4k/CX w==;
X-CSE-ConnectionGUID: Yu9ZRY7uTKyz2CLpLA7YKA==
X-CSE-MsgGUID: KquFDUEWSDKhiITCYWumcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="57112705"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="57112705"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 21:07:52 -0700
X-CSE-ConnectionGUID: MwyEw6SkQMa3j+14F+IyUg==
X-CSE-MsgGUID: iM105ib/Q1yDtt4b/hyQwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="152103800"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 21:07:50 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/kms_async_flips: Fix mixed declaration warning
Date: Fri, 27 Jun 2025 09:35:19 +0530
Message-Id: <20250627040519.677664-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

- Move struct format_mod declaration to the top of skip_async_format_mod
- No functional change; fixes build warning caused by below commit.

Fixes: aa4b2e0b81d2 ("tests/kms_async_flips: Add test for all async format modifiers")

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index dc3a0f92a..ddac904ce 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -860,6 +860,12 @@ static bool skip_async_format_mod(data_t *data,
 			    uint32_t format, uint64_t modifier,
 			    struct igt_vec *tested_formats)
 {
+	/* test each format "class" only once in non-extended tests */
+	struct format_mod rf = {
+		.format = igt_reduce_format(format),
+		.modifier = modifier,
+	};
+
 	/* igt doesn't know how to sw generate UBWC: */
 	if (is_msm_device(data->drm_fd) &&
 	    modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
@@ -870,12 +876,6 @@ static bool skip_async_format_mod(data_t *data,
 	    igt_reduce_format(format) == DRM_FORMAT_XRGB2101010)
 		return true;
 
-	/* test each format "class" only once in non-extended tests */
-	struct format_mod rf = {
-		.format = igt_reduce_format(format),
-		.modifier = modifier,
-	};
-
 	if (igt_vec_index(tested_formats, &rf) >= 0)
 		return true;
 
-- 
2.34.1

