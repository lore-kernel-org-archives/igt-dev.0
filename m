Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A905EC25B10
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 09:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3774910FE2D;
	Mon, 29 Apr 2024 09:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPRmN4nb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9B510FE2B
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2024 09:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714382162; x=1745918162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yDRnKMk1rC3JL6UEJOEQblPsDycw0CvW0Y0PfVa3zew=;
 b=QPRmN4nb8qmt4b1/HFHpmjvgUO1/NntlgidI3auOWzXgQf+iF+JK4/DG
 ufUFVThkfPezwhcvcFFTSjUkkVTfwAy/QTWmNU6yWIdPfJeChLQoW/cH/
 wdGidAwF+Tb5EMDZWaSNWhAYfuPeBsCBJx5o5witTJ3qqS/d9+raHJy18
 3t5tqQMXJlhEg6Xw9uYDDO37mKkKtGIrd3LZawcUt/8ToXAuQYb96poEo
 i6iCdRwCMpHHSYjLj4NpGPRgAYSdhS1uYIYNqgm+qp0rOup2Xhr5Z7IxA
 Ew/jEZGMXiL9i+ACWceo16fycIF/xoInVPeucPe921RLJzpzQRrC3bR6e Q==;
X-CSE-ConnectionGUID: uOuWrtMlTaq5UENV0ccfWA==
X-CSE-MsgGUID: /DcHFxHUQBGkYm2u2r2WqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="35428313"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="35428313"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:16:02 -0700
X-CSE-ConnectionGUID: 3S7GD1N5QleBASeXDOglFQ==
X-CSE-MsgGUID: PJh3H6I0TNOoTFJ2x0fIkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26059838"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:16:01 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V5 1/8] lib/igt_kms: Split the bigjoiner check into multiple
Date: Mon, 29 Apr 2024 14:39:23 +0530
Message-ID: <20240429090930.1905110-2-bhanuprakash.modem@intel.com>
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

To increase the readabilty, split the bigjoiner check
into multiple small ones. So that it would be easy to
extend/fix the logic further.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 57 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 98d3fb79c..6a41b535b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6357,6 +6357,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	struct {
 		enum pipe idx;
 		drmModeModeInfo *mode;
+		igt_output_t *output;
 	} pipes[IGT_MAX_PIPES];
 	int max_dotclock;
 
@@ -6374,11 +6375,12 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 
 		pipes[pipes_in_use].idx = output->pending_pipe;
 		pipes[pipes_in_use].mode = igt_output_get_mode(output);
+		pipes[pipes_in_use].output = output;
 		pipes_in_use++;
 	}
 
 	if (!pipes_in_use) {
-		igt_debug("We must set at least one output to pipe.\n");
+		igt_info("We must set at least one output to pipe.\n");
 		return true;
 	}
 
@@ -6395,16 +6397,51 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	 *  - current & previous crtcs are consecutive
 	 */
 	for (i = 0; i < pipes_in_use; i++) {
-		if ((igt_bigjoiner_possible(pipes[i].mode, max_dotclock) &&
-		     ((pipes[i].idx >= (total_pipes - 1)) ||
-		      (!display->pipes[pipes[i].idx + 1].enabled) ||
-		      ((i < (pipes_in_use - 1)) && (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)))) ||
-		    ((i > 0) && igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock) &&
-		     ((!display->pipes[pipes[i - 1].idx + 1].enabled) ||
-		      (abs(pipes[i].idx - pipes[i - 1].idx) <= 1)))) {
-			igt_debug("Pipe/Output combo is not possible with selected mode(s).\n");
+		if (igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
+			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz)",
+				 kmstest_pipe_name(pipes[i].idx),
+				 igt_output_name(pipes[i].output),
+				 max_dotclock);
+			kmstest_dump_mode(pipes[i].mode);
+
+			if (pipes[i].idx >= (total_pipes - 1)) {
+				igt_info("pipe-%s: Last pipe couldn't be used as a bigjoiner master.\n",
+					 kmstest_pipe_name(pipes[i].idx));
+				return false;
+			}
 
-			return false;
+			if (!display->pipes[pipes[i].idx + 1].enabled) {
+				igt_info("Consecutive pipe-%s: not available to use it as a bigjoiner slave.\n",
+					 kmstest_pipe_name(display->pipes[pipes[i].idx + 1].pipe));
+				return false;
+			}
+
+			if ((i < (pipes_in_use - 1)) &&
+			    (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)) {
+				igt_info("Consecutive pipe-%s: not free to use it as a bigjoiner slave.\n",
+					 kmstest_pipe_name(pipes[i + 1].idx));
+				return false;
+			}
+		}
+
+		if ((i > 0) && igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock)) {
+			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz)",
+				 kmstest_pipe_name(pipes[i - 1].idx),
+				 igt_output_name(pipes[i - 1].output),
+				 max_dotclock);
+			kmstest_dump_mode(pipes[i - 1].mode);
+
+			if (!display->pipes[pipes[i - 1].idx + 1].enabled) {
+				igt_info("Consecutive pipe-%s: not available to use it as a bigjoiner slave.\n",
+					 kmstest_pipe_name(display->pipes[pipes[i - 1].idx + 1].pipe));
+				return false;
+			}
+
+			if (abs(pipes[i].idx - pipes[i - 1].idx) <= 1) {
+				igt_info("Consecutive pipe-%s: not free to use it as a bigjoiner slave.\n",
+					 kmstest_pipe_name(pipes[i].idx));
+				return false;
+			}
 		}
 	}
 
-- 
2.43.2

