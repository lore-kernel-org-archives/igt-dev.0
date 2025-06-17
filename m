Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1023C71157
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 14:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A7D10E727;
	Tue, 17 Jun 2025 14:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ezx7j9tY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA43510E723
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750170555; x=1781706555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B/whhNR6i/tnxLOXgIMqWs9t3eGRTMdlCoMhDIeJM+w=;
 b=Ezx7j9tY3jgt7fJgSmoJPV9w6ElUPJR279GVVKzuOW7x8zPJsH9LpWui
 5bHvljg/2ujGAa56cZ72urb1PaTch3KI0cNaKf0/S4dlOB5bHWU0+w+n8
 Bl+277uCLRqaFk+aDATpj8TUbGbwtAVL3bgDbW2+9AMoqxy1rh2ZVrxfq
 Y+O5Vm6lyc5ORK10UWx0IQgXC2CR7FQSR6jjSnGvxOw6Nf1jLCqlrg5zQ
 2r/15tj2lfSuUt9gIa9kAs4tIb0Rzo1t7y9AeKORHzdF6V9veOtaz+49N
 MJqpFhdDs+I44lDubuSkOGbq35ev7raxMMDwTIZrvfXnLmVCeM6dUlqYt Q==;
X-CSE-ConnectionGUID: 0IiE/LbLQxCB5E/SuQZZ1Q==
X-CSE-MsgGUID: mJVq42pgS8mb/DhmVls+Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63003368"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="63003368"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:29:14 -0700
X-CSE-ConnectionGUID: mJuGgzgrTxCQgKW1dk5lBw==
X-CSE-MsgGUID: qimHTcCmStqeq3QfpNHv8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="149687654"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:29:13 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v14 4/5] tests/kms_async_flips: Remove allow_fail flag
 from async flip tests
Date: Tue, 17 Jun 2025 19:57:06 +0530
Message-Id: <20250617142707.490235-5-santhosh.reddy.guddati@intel.com>
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

Remove allow_fail flag as the async supported format modifiers are
now known to the user space. The test now executes for all supported
format modifiers.

V2: Remove check for frame 1, as no longer needed now as valid
    modifiers are being in use. (Chaitanya)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_async_flips.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 496d1c2c8..e176b2a28 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -136,7 +136,6 @@ typedef struct {
 	enum pipe pipe;
 	bool alternate_sync_async;
 	bool suspend_resume;
-	bool allow_fail;
 	struct buf_ops *bops;
 	bool atomic_path;
 	bool overlay_path;
@@ -435,7 +434,7 @@ static void test_async_flip(data_t *data)
 		 * configuration. Therefore allow EINVAL failure and skip the
 		 * test for AMD devices.
 		 */
-		if ((frame == 1 && data->allow_fail) || is_amdgpu_device(data->drm_fd))
+		if (is_amdgpu_device(data->drm_fd))
 			igt_skip_on(ret == -EINVAL);
 		else
 			igt_assert_eq(ret, 0);
@@ -815,12 +814,6 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			continue;
 
 		test_init(data);
-
-		if (data->linear_modifier && is_intel_device(data->drm_fd))
-			data->allow_fail = true;
-		else
-			data->allow_fail = false;
-
 		data->modifier = data->linear_modifier ? DRM_FORMAT_MOD_LINEAR : default_modifier(data);
 
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
-- 
2.34.1

