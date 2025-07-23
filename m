Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDA6C83F25
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 05:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BD010E748;
	Wed, 23 Jul 2025 05:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="blFTS9xO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2EF10E747
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 05:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753250036; x=1784786036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f6rZ7XJzq7j3MtuvYiqIfbHEEcLpQ/2nugSlj6aK1NM=;
 b=blFTS9xOuU13N6k0CG9Xx1RxrtXM1EXQcOMniKP4Tl9Sqr9dJKaEjcmB
 gRwNBkTa4bC9UwNTNe4wiMGvjPk6zqs91yM6sZEAD4cABSQ/9rbbJu4oh
 TVb6YJW/AXzkaPTXOyWm/NXWtAgOYunjOOE9NA27phMNZ4yWzz18/286H
 m+bpVIxvHHZ61RlKqcDVZhNQqlF5aR1HxVLstFxbqrb7UTYMfUe/BcB2N
 1nmB1/k0ury2oNK3E5jisERB4taIdQsgUXZIf4SPPD8fcMs583e47lV+H
 z2Q3O46nZcUekV85WhagT/5zO4uwr6Laa2EpWCfonfsPy4gSlTU9oEddA A==;
X-CSE-ConnectionGUID: RosB93wmR4KFeHTy38gOeQ==
X-CSE-MsgGUID: t53dzF/lQmSfAORFBAouNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66950135"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="66950135"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 22:53:56 -0700
X-CSE-ConnectionGUID: PEefrOsRQ1WOyCWA6Pnp0Q==
X-CSE-MsgGUID: Q1V6/fG6QYe+zg3/gOSixw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="164794406"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 22:53:54 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, arun.r.murthy@intel.com,
 jeevan.b@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 3/5] tests/kms_async_flips: Add hang subtest
Date: Wed, 23 Jul 2025 11:23:51 +0530
Message-ID: <20250723055353.1137242-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723055353.1137242-1-karthik.b.s@intel.com>
References: <20250723055353.1137242-1-karthik.b.s@intel.com>
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
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_async_flips.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 2fa4f2e6f..1d8ee10a9 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -87,6 +87,9 @@
  * SUBTEST: async-flip-suspend-resume
  * Description: Verify the async flip functionality with suspend and resume cycle
  *
+ * SUBTEST: async-flip-hang
+ * Description: Verify the async flip functionality with hang cycle
+ *
  * SUBTEST: overlay-atomic
  * Description: Verify overlay planes with async flips in atomic API
  *
@@ -137,6 +140,7 @@ typedef struct {
 	enum pipe pipe;
 	bool alternate_sync_async;
 	bool suspend_resume;
+	bool hang;
 	struct buf_ops *bops;
 	bool atomic_path;
 	bool overlay_path;
@@ -387,9 +391,11 @@ static void test_async_flip(data_t *data)
 	int ret, frame;
 	long long int fps;
 	struct timeval start, end, diff;
-	int suspend_time = RUN_TIME / 2;
+	igt_hang_t hang;
+	uint64_t ahnd = 0;
+	int mid_time = RUN_TIME / 2;
 	float run_time;
-	bool temp = data->suspend_resume;
+	bool temp = data->suspend_resume || data->hang;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -454,11 +460,21 @@ static void test_async_flip(data_t *data)
 				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
 		}
 
-		if (data->suspend_resume && diff.tv_sec == suspend_time && temp) {
+		if (data->suspend_resume && diff.tv_sec == mid_time && temp) {
 			temp = false;
 			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 		}
 
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
 		/*
 		 * Temporarily Reduce test execution for all formats and modifiers.
 		 *
@@ -480,6 +496,11 @@ static void test_async_flip(data_t *data)
 	else
 		run_time = RUN_TIME;
 
+	if (data->hang) {
+		igt_post_hang_ring(data->drm_fd, hang);
+		put_ahnd(ahnd);
+	}
+
 	if (!data->alternate_sync_async && !data->async_mod_formats) {
 		fps = frame * 1000 / run_time;
 		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
@@ -1176,6 +1197,15 @@ igt_main
 		run_test_with_async_format_modifiers(&data, test_async_flip);
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

