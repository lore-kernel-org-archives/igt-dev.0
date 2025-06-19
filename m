Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CA4C7115C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Jun 2025 11:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A1F10E9F7;
	Thu, 19 Jun 2025 11:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7Dv+NIT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D5510E9F6
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jun 2025 11:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750332225; x=1781868225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5M/QK4OAM8htkk5UpvPymE3cOC8QsHC9E9upA/sg0ok=;
 b=I7Dv+NIT0TC10kaNByr20efLYoMfMiR4v5fuN6O7YXlQzk1j6umhAdhj
 5mQK3pHuNqAUYjaICIFygYt1BmpNVDIS6GexzyUAaBT8hCd5IvZqurgQC
 O/CK3j94wTYRd8wLZlGeMZDClIKR747vZdXOgshHO9C91fRX+2PB/V0FI
 wVPbZA767nAXB4CrNdgaeO2+KNcJ+9GUmaBVWuEn2NJQW+QcfkNlQa1At
 XMYfHGmcONL5bcsDdPKJbpzcNccNi8itxXptrQy2EgQlOzOb/yZGXWrN1
 /ts3cukzdsTtOIa5cN2QvZz3D1IfbozX0FgoDZaEYcwUKE88a6yU+lsDx A==;
X-CSE-ConnectionGUID: HOMAP+TVTdO3d22fgU4ImA==
X-CSE-MsgGUID: z8RzGSdtQQG34J4teScSOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52664809"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="52664809"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 04:23:45 -0700
X-CSE-ConnectionGUID: Ptk0suzAS5iNblmMcUlxxw==
X-CSE-MsgGUID: EKYEDAf3Sua8uU6MYFfaMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="187829654"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 04:23:44 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, arun.r.murthy@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 2/3] tests/kms_async_flips: Add hang subtest
Date: Thu, 19 Jun 2025 16:53:33 +0530
Message-ID: <20250619112334.744213-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619112334.744213-1-karthik.b.s@intel.com>
References: <20250619112334.744213-1-karthik.b.s@intel.com>
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

Test functionality of async flips with hang.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 0f2d932e4..8587e4675 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -86,6 +86,9 @@
  * SUBTEST: async-flip-suspend-resume
  * Description: Verify the async flip functionality with suspend and resume cycle
  *
+ * SUBTEST: async-flip-hang
+ * Description: Verify the async flip functionality with hang cycle
+ *
  * SUBTEST: overlay-atomic
  * Description: Verify overlay planes with async flips in atomic API
  *
@@ -132,6 +135,7 @@ typedef struct {
 	enum pipe pipe;
 	bool alternate_sync_async;
 	bool suspend_resume;
+	bool hang;
 	bool allow_fail;
 	struct buf_ops *bops;
 	bool atomic_path;
@@ -376,8 +380,10 @@ static void test_async_flip(data_t *data)
 	int ret, frame;
 	long long int fps;
 	struct timeval start, end, diff;
-	int suspend_time = RUN_TIME / 2;
-	bool temp = data->suspend_resume;
+	igt_hang_t hang;
+	uint64_t ahnd = 0;
+	int mid_time = RUN_TIME / 2;
+	bool temp = data->suspend_resume || data->hang;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -433,13 +439,29 @@ static void test_async_flip(data_t *data)
 				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
 		}
 
-		if (data->suspend_resume && diff.tv_sec == suspend_time && temp) {
+		if (data->suspend_resume && diff.tv_sec == mid_time && temp) {
 			temp = false;
 			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 		}
+
+		if (data->hang && diff.tv_sec == mid_time && temp) {
+			temp = false;
+			memset(&hang, 0, sizeof(hang));
+
+			ahnd = is_i915_device(data->drm_fd) ?
+			       get_reloc_ahnd(data->drm_fd, 0) :
+			       intel_allocator_open(data->drm_fd, 0, INTEL_ALLOCATOR_RELOC);
+			hang = igt_hang_ring_with_ahnd(data->drm_fd, I915_EXEC_DEFAULT, ahnd);
+		}
+
 		frame++;
 	} while (diff.tv_sec < RUN_TIME);
 
+	if (data->hang) {
+		igt_post_hang_ring(data->drm_fd, hang);
+		put_ahnd(ahnd);
+	}
+
 	if (!data->alternate_sync_async) {
 		fps = frame * 1000 / RUN_TIME;
 		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
@@ -1032,6 +1054,15 @@ igt_main
 		data.suspend_resume = false;
 	}
 
+	igt_describe("Verify the async flip functionality after hang cycle");
+	igt_subtest_with_dynamic("async-flip-hang") {
+		igt_require(is_intel_device(data.drm_fd));
+		test_init_ops(&data);
+		data.hang = true;
+		run_test(&data, test_async_flip);
+		data.hang = false;
+	}
+
 	igt_fixture {
 		for (i = 0; i < NUM_FBS; i++) {
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.43.0

