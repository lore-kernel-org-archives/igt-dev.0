Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA52CDB46B
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 06:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977A310E08E;
	Mon, 22 Jun 2026 06:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lflOVC8m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8397610E08E
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 06:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782108897; x=1813644897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y1uNR6BwZtLz2iP2b+45L+dMFs/CLgRhK2GTik8vBjE=;
 b=lflOVC8ml/F11MPzP++T9s2kuX2z8E/ulpybmnkv1u0mTPvNcY0X3VKR
 yPsRSxK4zXMugLVoU1rCmgDq5db1FT73Ev/djVvRQ+/Sm4FYpJ/L3AYc9
 S1weJo7dXblC8KcWEWLAvQQCKl26Fhu6wF9JEd19cn4B9oIm9lKZwW7P8
 ZjjC3fP53zePvcyd+bTqd5ouDZDMKwevcZ4V3UrPcYx5swRzeee0ft/Lc
 m1wNlLISB7rJdTGJvfdzgS0nogHtj6QOEKZ/g5vWXeK32jAXaG+ehiFd3
 gOWExrKrk4ScS9O26EcMuL8AyodnEE78DTor6p/ZTACJHAxi0EMMxMvUo g==;
X-CSE-ConnectionGUID: w4iwmMqqREerjU5sKgRkkw==
X-CSE-MsgGUID: xy22fRy0RS+eRRUNU+FNiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93947598"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="93947598"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 23:14:57 -0700
X-CSE-ConnectionGUID: shR3QgarQY2P5Bx5s4i0vw==
X-CSE-MsgGUID: cXpZPPlvQCqDnH3AkMBxOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="244785347"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 23:14:55 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] lib/igt_kms, tests: Update joiner comments for clarity
Date: Mon, 22 Jun 2026 11:44:49 +0530
Message-ID: <20260622061449.3030039-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

Clean up joiner-related comments to match what the code actually
checks. Remove hardcoded 5K/10K wording and update comments to refer
to bigjoiner/ultrajoiner helper checks.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c            | 17 +++++++++--------
 tests/intel/kms_joiner.c |  8 ++++----
 tests/kms_flip.c         |  4 ++--
 tests/kms_setmode.c      |  5 ++---
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e82d32130..8f45397f4 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7047,10 +7047,11 @@ int intel_get_max_pipe_hdisplay(int drm_fd)
  * @mode: libdrm mode
  * @max_dotclock: Max pixel clock frequency
  *
- * Bigjoiner will come into the picture, when the requested
- * mode resolution > 5K or mode clock > max_dotclock.
+ * Bigjoiner is required when the requested mode exceeds single-pipe
+ * platform limits, i.e. hdisplay is above the platform threshold or
+ * clock is above @max_dotclock.
  *
- * Returns: True if mode requires Bigjoiner, else False.
+ * Returns: True if mode requires bigjoiner, else False.
  */
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
 {
@@ -7065,10 +7066,10 @@ bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
  * @max_dot_clock: max dot clock frequency
  * @mode: libdrm mode to be filled
  *
- * Bigjoiner will come in to the picture when the
- * resolution > 5K or clock > max-dot-clock.
+ * Finds the first connector mode that requires bigjoiner support based on
+ * igt_bigjoiner_possible(), while excluding modes that require ultrajoiner.
  *
- * Returns: True if big joiner found in connector modes
+ * Returns: True if a bigjoiner mode is found.
  */
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode)
@@ -7385,14 +7386,14 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	max_dotclock = igt_get_max_dotclock(display->drm_fd);
 
 	/*
-	 * if force joiner (or) mode resolution > 5K (or) mode.clock > max dot-clock,
+	 * if force joiner is enabled (or) the mode requires bigjoiner support,
 	 * then ignore
 	 *  - if the consecutive pipe is not available
 	 *  - last crtc in single/multi-connector config
 	 *  - consecutive crtcs in multi-connector config
 	 *
 	 * in multi-connector config ignore if
-	 *  - previous crtc (force joiner or mode resolution > 5K or mode.clock > max dot-clock) and
+	 *  - previous crtc (force joiner or mode requires bigjoiner support) and
 	 *  - current & previous crtcs are consecutive
 	 */
 	for (i = 0; i < pipes_in_use; i++) {
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index e6039cf9f..d26eb3b01 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -651,10 +651,10 @@ int igt_main()
 			drmModeConnector *connector = output->config.connector;
 
 			/*
-			 * Bigjoiner will come in to the picture when the
-			 * resolution > 5K or clock > max-dot-clock.
-			 * Ultrajoiner will come in to the picture when the
-			 * resolution > 10K or clock > 2 * max-dot-clock.
+			 * Bigjoiner is required when a mode exceeds the single-pipe
+			 * platform limits checked by igt_bigjoiner_possible().
+			 * Ultrajoiner is required when a mode exceeds the limits checked
+			 * by igt_ultrajoiner_possible().
 			 */
 			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
 			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 1ef9492ba..d6514637e 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1787,12 +1787,12 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	/*
 	 * Handle BW limitations on intel hardware:
 	 *
-	 * if force joiner (or) mode resolution > 5K (or) mode clock > max_dotclock, then ignore
+	 * if force joiner is enabled (or) the mode requires bigjoiner support, then ignore
 	 *  - last crtc in single/multi-connector config
 	 *  - consecutive crtcs in multi-connector config
 	 *
 	 * in multi-connector config ignore if
-	 *  - previous crtc (force joiner or mode resolution > 5K or mode clock > max_dotclock) and
+	 *  - previous crtc (force joiner or mode requires bigjoiner support) and
 	 *  - current & previous crtcs are consecutive
 	 */
 	if (!is_intel_device(drm_fd))
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 3adc4534c..1db9a6830 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -795,14 +795,13 @@ static void test_one_combination(const struct test_config *tconf,
 			/*
 			 * Handle BW limitations on intel hardware:
 			 *
-			 * if force joiner (or) mode resolution > 5K (or) mode clock > max_dotclock,
+			 * if force joiner is enabled (or) the mode requires bigjoiner support,
 			 * then ignore
 			 *   - last crtc in single/multi-connector config
 			 *   - consecutive crtcs in multi-connector config
 			 *
 			 * in multi-connector config ignore if
-			 *   - previous crtc (force joiner (or) mode resolution > 5K (or)
-			 *     mode clock > max_dotclock) and
+			 *   - previous crtc (force joiner (or) mode requires bigjoiner support) and
 			 *   - current & previous crtcs are consecutive
 			 */
 			if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
-- 
2.43.0

