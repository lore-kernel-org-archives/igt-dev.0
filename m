Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86F5C04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 09:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6035510FE33;
	Mon, 29 Apr 2024 09:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LxaO7jtH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6AE10FE33
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2024 09:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714382167; x=1745918167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=su1FinpZ2TtSt8vXsymyNY8bDAlQq0o+Yf7AuuJDqOY=;
 b=LxaO7jtH+dnJczEn4e6gbHZXFTrfHKrCXbx6wHJhpp9jieglBjPKTT9Y
 JTACdWrAALer6d86J/Q5J+KyvhPT3/5H4bdCuLd/cdaZB01fNotm7fCc6
 Fs0Q1N0zGEtMG1oGsLNkqzsk9lnwXSxu3wd8PdIP6vuDkh+t66A88l3iz
 QwRmBvvfX8rxprEdgDYRvVw1AT7ETHij2qGff92dMB91xSzCMS/4xpmWh
 FRViRMchFm52kL2beToTKtVANsgHTExNtRnayDAgG0fVFEzI5EaFXyr6c
 9A9j7iZs0apVHmCXAgz3SIb5ubUR5IielS1TRF9Akf1IC1ERwMVTQHoOm g==;
X-CSE-ConnectionGUID: zTpE3FB5RhWH6BsEzaL76g==
X-CSE-MsgGUID: AWW/U4UoRnmyZmIP24Sa8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="35428322"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="35428322"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:16:07 -0700
X-CSE-ConnectionGUID: Cpn/NgdcTmK4KjScWlchzw==
X-CSE-MsgGUID: uEyUb7cWTbSBhD1yfjr+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26059866"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:16:05 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V5 4/8] lib/igt_kms: Force joiner support in bigjoiner checks
Date: Mon, 29 Apr 2024 14:39:26 +0530
Message-ID: <20240429090930.1905110-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240429090930.1905110-1-bhanuprakash.modem@intel.com>
References: <20240429090930.1905110-1-bhanuprakash.modem@intel.com>
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
index ed5a3db74..7ab23ef12 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6396,6 +6396,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 		enum pipe idx;
 		drmModeModeInfo *mode;
 		igt_output_t *output;
+		bool force_joiner;
 	} pipes[IGT_MAX_PIPES];
 	int max_dotclock;
 
@@ -6414,6 +6415,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 		pipes[pipes_in_use].idx = output->pending_pipe;
 		pipes[pipes_in_use].mode = igt_output_get_mode(output);
 		pipes[pipes_in_use].output = output;
+		pipes[pipes_in_use].force_joiner = igt_check_force_joiner_status(display->drm_fd, output->name);
 		pipes_in_use++;
 	}
 
@@ -6425,21 +6427,22 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
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
@@ -6462,11 +6465,11 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
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

