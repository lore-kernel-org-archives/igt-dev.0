Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DF8C3600C
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 10:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E57910E6AD;
	Wed, 26 Mar 2025 10:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQEfRUlw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA7E10E6AD
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 10:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742985225; x=1774521225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MOWbibTk7V3NDHmf2hvKqMJTDkUEL/1ZdnxguWFdNXM=;
 b=eQEfRUlwfojTQEYCV3tWBw+DxE0nXH5g0GUVp/jJwVbeP17rOEW5awer
 UNM/IOVEScq7o1OYG6aNyOA746AiE6BAJKwWDT4TeG2CZ2luPySoJyBCO
 AnthAF9z98LzegLltoIXYUd5kZmVcxnj91Jpcl0XmF5I5jbJd57ArGJ8Y
 /AKzggLZgt+YdpWXNae/LBu/xWR1xr7zcH5cWKtgt6TFyCD+qyWgsz7uM
 CRtJFGBexVrA/7OMUMiVXgQZaUhT4o1u2jgwb46IGLTdYFh15LB8rI+BM
 0BuZwrgkqMGG3uv0QlA0JOOsDVO/xFWxHcYCshYlZboU29El8AvLYVh75 g==;
X-CSE-ConnectionGUID: CNRai2ZaSN6p6BmjlV1VPA==
X-CSE-MsgGUID: SJqxeGRJS5uoxSlOx+bSCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44144463"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44144463"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 03:33:45 -0700
X-CSE-ConnectionGUID: 1yTwdAQYTC687mOvtsnBnw==
X-CSE-MsgGUID: J7YkMZQVS2O+qGeG9RTjdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="161923242"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 03:33:43 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v8 4/4] tests/kms_async_flips: Remove allow_fail flag
 from async flip tests
Date: Wed, 26 Mar 2025 15:57:58 +0530
Message-Id: <20250326102758.2728285-5-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326102758.2728285-1-santhosh.reddy.guddati@intel.com>
References: <20250326102758.2728285-1-santhosh.reddy.guddati@intel.com>
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
index fe3e4f491..663e72841 100644
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
@@ -347,7 +346,7 @@ static void test_async_flip(data_t *data)
 
 		ret = perform_flip(data, frame, flags);
 
-		if (frame == 1 && data->allow_fail)
+		if (frame == 1)
 			igt_skip_on(ret == -EINVAL);
 		else
 			igt_assert_eq(ret, 0);
@@ -724,7 +723,6 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			continue;
 
 		test_init(data);
-		data->allow_fail = false;
 		data->modifier = default_modifier(data);
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
 			/*
-- 
2.34.1

