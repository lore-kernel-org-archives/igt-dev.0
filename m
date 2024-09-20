Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B045CF58E8
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 08:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDA310E7CD;
	Fri, 20 Sep 2024 08:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jcJrTMyJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45F210E7CD
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726819254; x=1758355254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x3X59CDWJiM+FftYu0DfTy8jzR0duaNtwSbhXPNUABw=;
 b=jcJrTMyJWdv3+dHA5+hOP4b5TXVD1OFM2MfzbW4G/xfs2uIHwopN0OEA
 Y1+UxU9Z3//JY2LeskhAWC9hxPc9zdkpdD4qwc1liuIB0JSPzIEqSDQX8
 JLkayqAA/+YadnUr9c9VFCfw0oS1OWA3c8rIxhUIHcym7z3ZQmw32Mpvf
 ESUjEn6IDuyx9frV4AzzlePskk9cniMnViXBHqN0ZKJ0YBZ7HDAfVwidu
 Sub4bUMZh7/HtI0f+RHakW/RilxDe+/aJPyJLXgr98gP5pWxCG8r4KM5M
 T9i6LnR3gcH+ADx4KPEd/iEb92Xk0bYXpi4NhFl3OtqrvioPTPlmB1n7N Q==;
X-CSE-ConnectionGUID: X9MYQKl5ROy7lgytOvTPQA==
X-CSE-MsgGUID: R96tca/vTViMaX2hPaE9bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25690807"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25690807"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 01:00:54 -0700
X-CSE-ConnectionGUID: B4YweEvmRb6Nw5IoZzsftQ==
X-CSE-MsgGUID: 2/HvFd46RAakod9LN+L00Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="75003628"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 01:00:51 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com, vandita.kulkarni@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 1/2] tests/kms_async_flips: Async flips suspend
 resume test
Date: Fri, 20 Sep 2024 13:30:34 +0530
Message-Id: <20240920080035.633836-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920080035.633836-1-santhosh.reddy.guddati@intel.com>
References: <20240920080035.633836-1-santhosh.reddy.guddati@intel.com>
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

Test functionality of async flips with suspend and resume

v2: Re-use existing function and use s/r API (Swathi)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5b70c4033..08510e70d 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -66,6 +66,9 @@
  *
  * SUBTEST: invalid-async-flip
  * Description: Negative case to verify if changes in fb are rejected from kernel as expected
+ *
+ * SUBTEST: async-flip-suspend-resume
+ * Description: Verify the async flip functionality with suspend and resume cycle
  */
 
 #define CURSOR_POS 128
@@ -99,6 +102,7 @@ typedef struct {
 	bool flip_pending;
 	enum pipe pipe;
 	bool alternate_sync_async;
+	bool suspend_resume;
 	bool allow_fail;
 	struct buf_ops *bops;
 } data_t;
@@ -260,6 +264,7 @@ static void test_async_flip(data_t *data)
 	int ret, frame;
 	long long int fps;
 	struct timeval start, end, diff;
+	int suspend_time = 1;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -312,6 +317,10 @@ static void test_async_flip(data_t *data)
 				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
 		}
 
+		if (data->suspend_resume && diff.tv_sec == suspend_time) {
+			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+			suspend_time = 0;
+		}
 		frame++;
 	} while (diff.tv_sec < RUN_TIME);
 
@@ -750,6 +759,12 @@ igt_main
 		run_test(&data, test_crc);
 	}
 
+	igt_describe("Verify the async flip functionality after suspend and resume cycle");
+	igt_subtest_with_dynamic("async-flip-suspend-resume") {
+		data.suspend_resume = true;
+		run_test(&data, test_async_flip);
+	}
+
 	igt_fixture {
 		for (i = 0; i < NUM_FBS; i++)
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.34.1

