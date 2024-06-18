Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AEBC2BA15
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 08:31:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CB310E5E1;
	Tue, 18 Jun 2024 08:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ft4feDui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D549610E5E2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718699460; x=1750235460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JTbSmupIljLypvw3fKSs8nPu7yH/lPUST5N9oEqETZM=;
 b=Ft4feDuib/ABuDregmM9WN+5EM+qC5rB1/zUU3dxv2zNeYZ/0nkIszjv
 DhwjB5Hu4qbutNkmFq1n7OsUE/joRsBaFzSZCUpqF8PiCameDVEQyUQg5
 aQFZIZoWImhrxJuq+4joY+/a1Cd036nC+p7ZPHCQx3K6g5pRFExrWQcpo
 IQLeCE0mrDEDOoybhOKTbEk8ipD8G1y1g+O9kfO9gqKmBw2lt+moy+0yu
 fYiEdduPCha3VL/rEs4hjWVSj9Xdkage8l/oM4TlB2kb2GyVfojXF59/P
 EiDCIo/BtYbZXTzdJr97O2gO5lM5o7D4zk7di8tKU8410TJK51UERDMvS w==;
X-CSE-ConnectionGUID: wGhkIh1NTaGBfMMXsfdSIw==
X-CSE-MsgGUID: STdDDi3GR2qfd2x+5KMjqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="38082179"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="38082179"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:31:00 -0700
X-CSE-ConnectionGUID: 83pmdTh7TgmEWrmHnXmY0w==
X-CSE-MsgGUID: pBQ7Qd6zQYSywmmhhjTdAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="64699564"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:30:58 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	jeevan.b@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V6 4/8] lib/igt_kms: Force joiner support in bigjoiner checks
Date: Tue, 18 Jun 2024 13:52:44 +0530
Message-ID: <20240618082248.4070611-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
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

As we recently introduced the option (through debugfs) to
force the bigjoiner, needs to extend the support in bigjoiner
checks to handle the force joiner.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9fdfadde1..d565e79ce 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6415,6 +6415,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 		enum pipe idx;
 		drmModeModeInfo *mode;
 		igt_output_t *output;
+		bool force_joiner;
 	} pipes[IGT_MAX_PIPES];
 	int max_dotclock;
 
@@ -6433,6 +6434,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 		pipes[pipes_in_use].idx = output->pending_pipe;
 		pipes[pipes_in_use].mode = igt_output_get_mode(output);
 		pipes[pipes_in_use].output = output;
+		pipes[pipes_in_use].force_joiner = igt_check_force_joiner_status(display->drm_fd, output->name);
 		pipes_in_use++;
 	}
 
@@ -6444,21 +6446,22 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	max_dotclock = igt_get_max_dotclock(display->drm_fd);
 
 	/*
-	 * if mode resolution > 5K (or) mode.clock > max dot-clock, then ignore
+	 * if force joiner (or) mode resolution > 5K (or) mode.clock > max dot-clock,
+	 * then ignore
 	 *  - if the consecutive pipe is not available
 	 *  - last crtc in single/multi-connector config
 	 *  - consecutive crtcs in multi-connector config
 	 *
 	 * in multi-connector config ignore if
-	 *  - previous crtc (mode resolution > 5K or mode.clock > max dot-clock) and
+	 *  - previous crtc (force joiner or mode resolution > 5K or mode.clock > max dot-clock) and
 	 *  - current & previous crtcs are consecutive
 	 */
 	for (i = 0; i < pipes_in_use; i++) {
-		if (igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
-			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz)",
+		if (pipes[i].force_joiner || igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
+			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
 				 kmstest_pipe_name(pipes[i].idx),
 				 igt_output_name(pipes[i].output),
-				 max_dotclock);
+				 max_dotclock, pipes[i].force_joiner ? "Yes" : "No");
 			kmstest_dump_mode(pipes[i].mode);
 
 			if (pipes[i].idx >= (total_pipes - 1)) {
@@ -6481,11 +6484,11 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 			}
 		}
 
-		if ((i > 0) && igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock)) {
-			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz)",
+		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock))) {
+			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
 				 kmstest_pipe_name(pipes[i - 1].idx),
 				 igt_output_name(pipes[i - 1].output),
-				 max_dotclock);
+				 max_dotclock, pipes[i - 1].force_joiner ? "Yes" : "No");
 			kmstest_dump_mode(pipes[i - 1].mode);
 
 			if (!display->pipes[pipes[i - 1].idx + 1].enabled) {
-- 
2.43.2

