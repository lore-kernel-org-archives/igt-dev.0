Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35651C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 12:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD37E10FC28;
	Tue, 23 Apr 2024 12:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azIEexM0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CD510FC28
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 12:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713875581; x=1745411581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BM3bLy8zEXhcgAzm6oKpRYPd2qRHMYXnu7t3OqXC+1E=;
 b=azIEexM0IoRiY3EpT9SO3e5cKMJvh7aRAOKMs+e2NfR6VTCyrSl/g1vz
 8gjyTGVl1U7uGnVw3CU+gmcEuiwlRd/K2bAzFFmI5ecKjO/2kTRXL37dC
 u5Rbv/BxwzOW8lSXumaeYgXCVbUl5bamFp/Pdsj/30PWlRqY3igboXHNp
 FBqjhdZxF1JRcgpjCSb5vGoEQiHVJu5GGOeqE7U01oKeRreNqtjUIAJHa
 IFjcSIWsfUuqTBcEsHrzbQq3NNqI5wZkNfI0+rFSp8ry9npzSZlEayA7c
 2REERvJ9ry0O0O6w+Ufiw2XS66j3criwOh/qXeRKM8gp8xGa2GW6BqYAN Q==;
X-CSE-ConnectionGUID: CgaFzqFBTFGqUjHXj3jDvw==
X-CSE-MsgGUID: 5YeJPp0WSMyUbZMYZCCQdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20067050"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20067050"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:33:01 -0700
X-CSE-ConnectionGUID: +N9585pVTUatjbjpYgbXgQ==
X-CSE-MsgGUID: CMb3Z1hTTIWjCQy+PiH0Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24361334"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:32:59 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V4 3/7] lib/igt_kms: Force joiner support in bigjoiner checks
Date: Tue, 23 Apr 2024 17:56:32 +0530
Message-ID: <20240423122636.1241111-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240423122636.1241111-1-bhanuprakash.modem@intel.com>
References: <20240423122636.1241111-1-bhanuprakash.modem@intel.com>
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
 lib/igt_kms.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f47d85977..3d6835dcf 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6395,6 +6395,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	struct {
 		enum pipe idx;
 		drmModeModeInfo *mode;
+		bool force_joiner;
 	} pipes[IGT_MAX_PIPES];
 	int max_dotclock;
 
@@ -6412,6 +6413,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 
 		pipes[pipes_in_use].idx = output->pending_pipe;
 		pipes[pipes_in_use].mode = igt_output_get_mode(output);
+		pipes[pipes_in_use].force_joiner = igt_check_force_joiner_status(display->drm_fd, output->name);
 		pipes_in_use++;
 	}
 
@@ -6423,21 +6425,24 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
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
-		if ((igt_bigjoiner_possible(pipes[i].mode, max_dotclock) &&
+		if (((pipes[i].force_joiner ||
+		      igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) &&
 		     ((pipes[i].idx >= (total_pipes - 1)) ||
 		      (!display->pipes[pipes[i].idx + 1].enabled) ||
 		      ((i < (pipes_in_use - 1)) && (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)))) ||
-		    ((i > 0) && igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock) &&
+		    ((i > 0) && (pipes[i - 1].force_joiner ||
+				 igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock)) &&
 		     ((!display->pipes[pipes[i - 1].idx + 1].enabled) ||
 		      (abs(pipes[i].idx - pipes[i - 1].idx) <= 1)))) {
 			igt_debug("Pipe/Output combo is not possible with selected mode(s).\n");
-- 
2.43.2

