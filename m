Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C36CF8572
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 09:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5740010E7E7;
	Thu,  3 Oct 2024 09:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1ya/ds3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3194D10E7E2
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 09:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727948900; x=1759484900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v7W0tKIdQCOxH1DH0U1vBlfxsne8wSdWlhqQMtUEPSw=;
 b=B1ya/ds3JPeiZmkRJoNG0kwgOqa6LoJbjOW8dQrK1OH1koXJGzzaWLhf
 meTnOI0gf9hohoHdxgrWNF8PA5lvjoVDBPDv5jk2Yyh/uJB0TQvrwO5BM
 IOZ118jL4wLg91+0p6z9Gn1ivxg0LD7SfqLwmDcJb5IE3u/zP1jmULSoX
 IkYwek8Y7t3KRjqIopf4cYIvkmkaIHaDd37X3ZtyTnQHIDuR7ts3rPKGJ
 84sAtCp6h6wOPJooV/QUalHPeyz8/7JUGZ/v1V1brONLx5SmuGZYK0bWU
 V2TNImxgxVioXzcpBYM3hkeLQM0pgZsi7Is8d0jfykyh9Y4JtnJVzDoEV A==;
X-CSE-ConnectionGUID: /yWiDN3oQ9auMqdturWN5g==
X-CSE-MsgGUID: xj/r8LFCRE2qvBnUf7V4fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27021997"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27021997"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 02:48:17 -0700
X-CSE-ConnectionGUID: lbulD0w2QvKu4exHAbVr/Q==
X-CSE-MsgGUID: RQBuqE/JTquH9wcVHMNDjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="105065617"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 02:48:15 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 1/1] tests/kms_async_flips: Async flips suspend
 resume test
Date: Thu,  3 Oct 2024 15:17:10 +0530
Message-Id: <20241003094710.2650821-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003094710.2650821-1-santhosh.reddy.guddati@intel.com>
References: <20241003094710.2650821-1-santhosh.reddy.guddati@intel.com>
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

Test functionality of async flips with suspend and resume.

v2: Re-use existing function and use s/r API (Swathi)
v7: reset suspend_resume flags (Karthik)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5b70c4033..5dec71291 100644
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
+	int suspend_time = RUN_TIME / 2;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -312,6 +317,10 @@ static void test_async_flip(data_t *data)
 				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
 		}
 
+		if (data->suspend_resume && diff.tv_sec == suspend_time) {
+			data->suspend_resume = false;
+			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
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

