Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB2FCF9C6E
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 03:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352D210E369;
	Mon, 23 Sep 2024 03:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGIsIU0p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24EF10E368
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 03:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727063511; x=1758599511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x3X59CDWJiM+FftYu0DfTy8jzR0duaNtwSbhXPNUABw=;
 b=aGIsIU0pMnMShAupXNQTQ6tehR5uif//aG5UammAMdbPq/JyeXj+4QkJ
 7LAmtHyO6HEDUssmEBmPRDPZZPwA6sohW1/z0VMGhTiwfYizO5qUTm15+
 oxAK5mNWyFYXR1uZhC5Xq+rBAL5M0KHwz1mCgX2mNklRNWZYGKEd1CrX6
 Rw3lmTC4Dl2+c+chRFEZpuLJHlbZ7+I82UseSqBqwBmfNI9Hx6ds7KiMn
 PssFpQ/RAz+N3JKPb5qk/SK/4P6YfmBMdSqgV1augUkvQxb7MNfnvlU8E
 2IK8jyNxReo6tOFCB1vE5gyVdnI79I8xsAmBLmRRk3loznb2M+lkYplku w==;
X-CSE-ConnectionGUID: lcIJq1jmQi+dNeGLkxCmWw==
X-CSE-MsgGUID: 0ytNcSdbTkiyiXhEB2EcTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25941110"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="25941110"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 20:51:51 -0700
X-CSE-ConnectionGUID: 8jwYfZYvTzak2vNZ404law==
X-CSE-MsgGUID: p8mgDPXMQ4Sn2oaSP984tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="75882368"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 20:51:48 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com, vandita.kulkarni@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 1/2] tests/kms_async_flips: Async flips suspend
 resume test
Date: Mon, 23 Sep 2024 09:21:19 +0530
Message-Id: <20240923035120.673521-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923035120.673521-1-santhosh.reddy.guddati@intel.com>
References: <20240923035120.673521-1-santhosh.reddy.guddati@intel.com>
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

