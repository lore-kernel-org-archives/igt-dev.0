Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B180EC04FF8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 09:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575A110F7AC;
	Thu, 18 Apr 2024 09:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3HE65rZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB5210F7AC
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713432374; x=1744968374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xY4Y8LtRCDn2+hc7IqH3Q9ifdL7yUzluAHxnv1i0g64=;
 b=M3HE65rZ4zPUvdkMs76G4G8zz4YYTML2bfosmRM+faA/z4iW0fayvY4i
 WEptqjSvGh3wY8LCFzaz9QK9QE74JzJtMVakPE4EX0DTPhNyomMXFi50V
 3hyGAwbWebvXfecJKJG6X2BsR5TUltoULwiEzl/7N+kJCp737hj/+rOgq
 jK5XTmDdHzSp1iv9CYCMpf+7UBykgg/Fp3tTufmkL6lTfdxCA965eFVgg
 BOxIJQgmV//oatpU+hx2CTv0+JRjh1AtPxq+8/87cO78jlNzWa8nMb47g
 N09Xl0a1u79K6zowz9+mJpdhNgzv6aRkpuA6Ogr3L+xR4dEcyclwhBqvP g==;
X-CSE-ConnectionGUID: AjPb2yxUT56dQLx4Jwo4Sw==
X-CSE-MsgGUID: rxKuomJ0RTaU3pvlZrbMiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31447791"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="31447791"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 02:26:14 -0700
X-CSE-ConnectionGUID: bMO5Ma8BQqihw/KO+NbwTg==
X-CSE-MsgGUID: +NLNXA2TR0GpWQZjbuOj/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="53855385"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 02:26:12 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V2 2/6] lib/igt_kms: Force joiner support in bigjoiner checks
Date: Thu, 18 Apr 2024 14:49:55 +0530
Message-ID: <20240418091959.781560-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
References: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
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
index 4c43921ce..9258e8f3f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6338,6 +6338,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	struct {
 		enum pipe idx;
 		drmModeModeInfo *mode;
+		bool force_joiner;
 	} pipes[IGT_MAX_PIPES];
 	int max_dotclock;
 
@@ -6355,6 +6356,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 
 		pipes[pipes_in_use].idx = output->pending_pipe;
 		pipes[pipes_in_use].mode = igt_output_get_mode(output);
+		pipes[pipes_in_use].force_joiner = igt_check_force_joiner_status(display->drm_fd, output->name);
 		pipes_in_use++;
 	}
 
@@ -6366,21 +6368,24 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
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

