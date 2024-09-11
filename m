Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9B4EE0213
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 06:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8047510E9EE;
	Wed, 11 Sep 2024 06:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jl0nvhvr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E5610E9EE
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 06:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726037869; x=1757573869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U77Xra3s6F3PliPW3V8sK7uT2FIpEv9DO0HDpIdS4fA=;
 b=Jl0nvhvrSZlnIHCtb5nbhbwsPb9jt4SN0xtQvUd+8YxNjURWy/RieX7c
 yAD80MaZ/4ZrXC19qyvsM47VSxEmDSckJV8+UsJF35taoZ6wRfK8A/Mx0
 GfucA0QIAvcbg73sKtULbKW+0F6uCc0aysYUGJ57hI/kwd5ifSszCDg5i
 Ur+0z9C6Y2xi6QOVGsuXdPN4hpIDd+ldgdmjictASVsHjd2iriyXZ/0uJ
 xSt7Tnq/nX6jAHG+pVcmoJtZwYJ+ueIRl8YOlZMcFgcXZvzrTazOvxVH9
 fFO22eQ0HGKo7OfpYxGfz5GypHmwiS0pWgSVmPoRbbtqV79aUj10KGx3E w==;
X-CSE-ConnectionGUID: Ymb9HCiGTdWHORcT4Zfulg==
X-CSE-MsgGUID: 1wfX8Iu5TJ218jgSxBrEtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36173959"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="36173959"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 23:57:48 -0700
X-CSE-ConnectionGUID: NwT6gVczRc++ATxyesRQCw==
X-CSE-MsgGUID: t/4uOVNOTw2ZnUAHE9AnZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="66979292"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 23:57:47 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_async_flips: Async flips suspend resume
 test
Date: Wed, 11 Sep 2024 12:23:33 +0530
Message-Id: <20240911065333.556989-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906072824.509607-2-santhosh.reddy.guddati@intel.com>
References: <20240906072824.509607-2-santhosh.reddy.guddati@intel.com>
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

