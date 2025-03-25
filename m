Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48171C3600B
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 12:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6A710E55C;
	Tue, 25 Mar 2025 12:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kO3l8PFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10C810E55C
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 12:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742905327; x=1774441327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1QKYelsRhsVVSg3mA4o9ojmUTvVqCKS1p8DEuAdSBJQ=;
 b=kO3l8PFIPbf9nPZrLjc5msldT8lPZLLaBomWwSh9gIMXVDpHqKXwnw1t
 pYpLyaeFjLCLZYrfRDFmebfZZsRDYQ3WWkgTmO9SnJWRG+yWE2Hlvasu2
 JAHLSYLKDSVhTAzxfHsyEquDbOP4AanF9WBPe1TYYtQ2xCKUUgiHe2y0O
 Nm/5ICOL0o4zesx9s2OSG8RrCbJ165cDNS7gAoSDonN0xqNa7xWkvTHyY
 /5iHX2+9ML5UykcG49wFdbK6Q1VD3gPwtCn1yo/nJv4XM+AYQX4vJB7ub
 ON2TIqKea57pd+gkPt6618iNEloDVu9Su2+O1f3yTG0GFligZGBHuqgN3 g==;
X-CSE-ConnectionGUID: uw1/P7uaQ96NUE+Npj0OMg==
X-CSE-MsgGUID: 7MLOjPlfT2+W7kLBLHpwhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="48022640"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="48022640"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 05:22:06 -0700
X-CSE-ConnectionGUID: FhYrLE9XQZqgrjizT8rcBA==
X-CSE-MsgGUID: WLA7gonTT7ima81yEND27w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124391635"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 05:22:05 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 4/4] tests/kms_async_flips: Remove allow_fail flag
 from async flip tests
Date: Tue, 25 Mar 2025 17:46:25 +0530
Message-Id: <20250325121625.2718374-5-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250325121625.2718374-1-santhosh.reddy.guddati@intel.com>
References: <20250325121625.2718374-1-santhosh.reddy.guddati@intel.com>
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

Remove allow_fail flag as the async supported format modifiers are
now known to the user space. The test now executes for all supported
format modifiers.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 1fdd13b99..0f2ad8acf 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -123,7 +123,6 @@ typedef struct {
 	enum pipe pipe;
 	bool alternate_sync_async;
 	bool suspend_resume;
-	bool allow_fail;
 	struct buf_ops *bops;
 	bool atomic_path;
 	unsigned int plane_format;
@@ -338,7 +337,7 @@ static void test_async_flip(data_t *data)
 
 		ret = perform_flip(data, frame, flags);
 
-		if (frame == 1 && data->allow_fail)
+		if (frame == 1)
 			igt_skip_on(ret == -EINVAL);
 		else
 			igt_assert_eq(ret, 0);
@@ -715,7 +714,6 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			continue;
 
 		test_init(data);
-		data->allow_fail = false;
 		data->modifier = default_modifier(data);
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
 			/*
-- 
2.34.1

