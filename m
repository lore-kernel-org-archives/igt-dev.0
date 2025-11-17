Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C30CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 08:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDF310E2F2;
	Mon, 17 Nov 2025 08:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YI5OE7so";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5974410E18C
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 05:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763357145; x=1794893145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q7IX8EOlpnRDBsMvOdFpycQdy/nybkNW1R2h3VZXpGE=;
 b=YI5OE7soexssQLa1c71Nc5eBEr3thYt1wffdiVkJ+DRtjCLZaYak9ydw
 gZGp0bPsBslZLLE4NAvbfI7s/lCikZriWYPy7qDDPnTtmqrf/KKhlzr4e
 4Ccz/LktfTXJO37e3REMLNZay4MHxTp8GitjAHflSi4xz5VcPnp/Cvzt6
 EbnItgADtSOfM3W5/3bI1zH58brINkuHB5ZH1qodoX90yc8Lv7ISrkzT9
 yCegdiPu5S3bmAki3exn6U9Z9taTAfzshUAf8q7bqhUlEOMdmRDolnCU4
 R+zo+SGE/Sf6YUBzGf6bRA7r02yF+dz0ur1G6/kubiXJym7ojtUlpD3DE A==;
X-CSE-ConnectionGUID: sElaMs/nSZS0m9tPPBoOQA==
X-CSE-MsgGUID: WzGsveQrQ6SFqKU6b2J/lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="67955873"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="67955873"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 21:25:45 -0800
X-CSE-ConnectionGUID: 7AyEJh5dROeo5NxpO24row==
X-CSE-MsgGUID: 0ZuDXgqpSVqIZNGbcYxpvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="190372752"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 16 Nov 2025 21:25:43 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [v14 i-g-t 2/2] tests/intel/i915_pm_rps: Extend Multi-GT support to
 waitboost and reset tests
Date: Mon, 17 Nov 2025 10:55:09 +0530
Message-ID: <20251117052506.578422-6-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117052506.578422-4-mallesh.koujalagi@intel.com>
References: <20251117052506.578422-4-mallesh.koujalagi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Nov 2025 08:08:03 +0000
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

Builds upon the Multi-GT infrastructure to extend support for RPS test
scenarios including waitboost functionality and reset recovery testing
across Multi-GT.

This patch enhances the multi-GT test framework by:

- Adding Multi-GT support for waitboost functionality validation
- Extending reset test case to ensure compatibility with multi-GT setups

Waitboost and reset test cases validate that GPU frequency boosting and
reset recovery mechanism work correctly across Multi-GT configuration.

v11: Remove expected_val variable. (Vinay)
   - The restore_sysfs_on_each_gt function required for waitboost
     and reset test cases only.

v12: Use Single spinner in boost_freq function. (Vinay)

v13: Add the 4 spinners back since freq was not ramping.

v14: Revert igt_spin_free function. (Vinay).
   - Add GT-specific context binding to properly trigger
     waitboost mechanism in multi-GT scenarios.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 tests/intel/i915_pm_rps.c | 61 +++++++++++++++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 6 deletions(-)

diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index 9a1af20c9..359776a6d 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -629,17 +629,58 @@ static void stabilize_check(int *out, int gt_id)
 	igt_debug("Waited %d msec to stabilize cur\n", wait);
 }
 
+static void verify_sysfs_values(int gt)
+{
+	int current_val;
+
+	/* Verify MIN frequency */
+	current_val = readval(sysfs_files[gt][MIN].filp);
+	if (current_val != origfreqs[gt][MIN]) {
+		igt_warn("GT%d MIN freq verification failed: expected %d, got %d\n",
+			 gt, origfreqs[gt][MIN], current_val);
+	}
+
+	/* Verify MAX frequency */
+	current_val = readval(sysfs_files[gt][MAX].filp);
+	if (current_val != origfreqs[gt][MAX]) {
+		igt_warn("GT%d MAX freq verification failed: expected %d, got %d\n",
+			 gt, origfreqs[gt][MAX], current_val);
+	}
+
+	/* Verify BOOST frequency */
+	current_val = readval(sysfs_files[gt][BOOST].filp);
+	if (current_val != origfreqs[gt][BOOST]) {
+		igt_warn("GT%d BOOST freq verification failed: expected %d, got %d\n",
+			 gt, origfreqs[gt][BOOST], current_val);
+	}
+}
+
+static void restore_sysfs_on_each_gt(void)
+{
+	int tmp, gt;
+
+	i915_for_each_gt(drm_fd, tmp, gt) {
+		writeval(sysfs_files[gt][MIN].filp, origfreqs[gt][MIN], gt);
+		writeval(sysfs_files[gt][MAX].filp, origfreqs[gt][MAX], gt);
+		writeval(sysfs_files[gt][BOOST].filp, origfreqs[gt][BOOST], gt);
+		verify_sysfs_values(gt);
+	}
+}
+
 static void boost_freq(int fd, int *boost_freqs, int gt_id)
 {
+	const intel_ctx_t *ctx;
 	int64_t timeout = 1;
 	igt_spin_t *load;
-	/* We need to keep dependency spin offset for load->handle */
-	uint64_t ahnd = get_simple_l2h_ahnd(fd, 0);
+	uint64_t ahnd;
+
+	ctx = intel_ctx_create_for_gt(fd, gt_id);
+	ahnd = get_reloc_ahnd(fd, ctx->id);
 
-	load = igt_spin_new(fd, .ahnd = ahnd);
+	load = igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx);
 
 	/* Strip off extra fences from the object, and keep it from starting */
-	igt_spin_free(fd, igt_spin_new(fd, .ahnd = ahnd, .dependency = load->handle));
+	igt_spin_free(fd, igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx, .dependency = load->handle));
 
 	/* Waiting will grant us a boost to maximum */
 	gem_wait(fd, load->handle, &timeout);
@@ -652,6 +693,7 @@ static void boost_freq(int fd, int *boost_freqs, int gt_id)
 	gem_sync(fd, load->handle);
 	igt_spin_free(fd, load);
 	put_ahnd(ahnd);
+	intel_ctx_destroy(fd, ctx);
 }
 
 static void waitboost(int fd, bool reset, int gt_id)
@@ -696,9 +738,9 @@ static void waitboost(int fd, bool reset, int gt_id)
 	load_helper_stop();
 	idle_check(gt_id);
 
-	igt_assert_lt(pre_freqs[CUR], pre_freqs[MAX]);
+	igt_assert_lte(pre_freqs[CUR], pre_freqs[MAX]);
 	igt_assert_eq(boost_freqs[CUR], boost_freqs[BOOST]);
-	igt_assert_lt(post_freqs[CUR], post_freqs[MAX]);
+	igt_assert_lte(post_freqs[CUR], post_freqs[MAX]);
 }
 
 static uint32_t batch_create(int i915, uint64_t sz)
@@ -1208,7 +1250,10 @@ igt_main
 
 	/* Checks if we achieve boost using gem_wait */
 	igt_subtest("waitboost") {
+		restore_sysfs_on_each_gt();
+		sleep(1);
 		i915_for_each_gt(drm_fd, tmp, gt) {
+			igt_info("gt%u\n", gt);
 			waitboost(drm_fd, false, gt);
 		}
 	}
@@ -1226,8 +1271,12 @@ igt_main
 	/* Test boost frequency after GPU reset */
 	igt_subtest("reset") {
 		igt_hang_t hang;
+
+		restore_sysfs_on_each_gt();
+		sleep(1);
 		hang = igt_allow_hang(drm_fd, 0, 0);
 		i915_for_each_gt(drm_fd, tmp, gt) {
+			igt_info("gt%u\n", gt);
 			waitboost(drm_fd, true, gt);
 		}
 		igt_disallow_hang(drm_fd, hang);
-- 
2.45.2

