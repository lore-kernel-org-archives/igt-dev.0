Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39607EDE9AB
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 18:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF67210E8CD;
	Tue, 10 Sep 2024 18:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmoIhm9u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0343010E8CD
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 18:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991855; x=1757527855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U77Xra3s6F3PliPW3V8sK7uT2FIpEv9DO0HDpIdS4fA=;
 b=MmoIhm9ucfuw++ID47DLJFOvXps9w2X4uObrPBWA00uDYeVZ//a+yPpt
 C24otYT38AmHUXTqXZja8tNOJ7fw/dIxsy09qXmi+tww3kV+0HZSzP3rq
 ocKWZ4BdcfLb4OJ5gJOzmg2lPhSYKOj4fenjYUJn/rm7cjBbtYl8eA4Tq
 uptht5QCOpXoeP/rNfwCfx/RMZXJo6nDsJfhqlfigW7KW35tPKMP97Qux
 jhsXFam115KaqmEbG9hUriNotdTFSKG8I3gwGkHDckp4+IVwh1K0f4xmq
 PJ1jDvZ+iNbd9WbOV4vCxWuR4xEl+T710kIqxA77L/XDlVAAHtD7hDnhD w==;
X-CSE-ConnectionGUID: 9JTL4J3sT4aaqrZiVRndGQ==
X-CSE-MsgGUID: 0KZuIx3rTJ2Lk+LFUnnfyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42236962"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="42236962"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:10:55 -0700
X-CSE-ConnectionGUID: unfhQCjhSzKafVsczLZyNQ==
X-CSE-MsgGUID: zPF5NscyTZiwkF+IKv27IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="90388210"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 11:10:53 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/kms_async_flips: Async flips suspend resume test
Date: Tue, 10 Sep 2024 23:36:37 +0530
Message-Id: <20240910180637.553932-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906072824.509607-1-santhosh.reddy.guddati@intel.com>
References: <20240906072824.509607-1-santhosh.reddy.guddati@intel.com>
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
index 5b70c4033..8964e1db7 100644
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
+				igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+				suspend_time = 0;
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

