Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1EBC77B7F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 09:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E7510E55B;
	Tue, 24 Jun 2025 09:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HerEIePC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E85D8952F
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750757084; x=1782293084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IkEjx5FfWfXBkRT7orpmJI9BsNcPBpeRq6Q4yyCUyM0=;
 b=HerEIePCu32KqrBcvhHBqwkjBCRTTpYGndL3bG1bDFsthbwuxYdIzfB4
 UY5gw0qx5PdaqqAxSw8Sbiy+pXufd3SLX6ruS0ebTxSpFXQim3uAIcWBj
 jJAywLIOrEL+x7lKuud7b7/K7VU8dAN3DVaStFyWZxBboLFRzLF7oaXzk
 G8cq9JdcpBcsD+TQv8PO0zn3uay7YoJbVOJTiqh+WArsVNIJuQkqAnwAj
 hRnFP226+0Ke9/SKRXDwp9jY6A0qUesrkobUI99VMywJpcURbxeQR5jiY
 iEBXrvxGL3VXPZYLc40XIwBwKVpiRCvGAxw7V4xMFH3bolCKQUCb/IYHX g==;
X-CSE-ConnectionGUID: 1iJbGsReQ6yUMhcM2EoIWA==
X-CSE-MsgGUID: 3bh+n0lgSC2K3KAKQjLNRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64418990"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="64418990"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:24:27 -0700
X-CSE-ConnectionGUID: YQsi/T4MTsmhnYdbw1lvOQ==
X-CSE-MsgGUID: PVoR5KVoQGGS/4AyeZXeCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="157630912"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:24:25 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, arun.r.murthy@intel.com,
 jeevan.b@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 3/4] tests/kms_async_flips: Add hang subtest
Date: Tue, 24 Jun 2025 14:54:19 +0530
Message-ID: <20250624092421.785063-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624092421.785063-1-karthik.b.s@intel.com>
References: <20250624092421.785063-1-karthik.b.s@intel.com>
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
 tests/kms_async_flips.c | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 677da5aba..5e39ca520 100644
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
@@ -376,9 +380,11 @@ static void test_async_flip(data_t *data)
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
 
@@ -434,10 +440,21 @@ static void test_async_flip(data_t *data)
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
 
@@ -446,6 +463,11 @@ static void test_async_flip(data_t *data)
 	else
 		run_time = RUN_TIME;
 
+	if (data->hang) {
+		igt_post_hang_ring(data->drm_fd, hang);
+		put_ahnd(ahnd);
+	}
+
 	if (!data->alternate_sync_async) {
 		fps = frame * 1000 / run_time;
 		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
@@ -1038,6 +1060,15 @@ igt_main
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

