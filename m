Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FEFCD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 06:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C2E10F3FE;
	Fri, 15 May 2026 06:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/2/I2wl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB5510F3FE
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 06:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778827309; x=1810363309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HJcPI3JYZctRVuXElnijzMGdCX81/U7XJc5yU375yag=;
 b=k/2/I2wlxCqTHJgaPQF4VYhakgtgAeNO628/gtj5qrgbMIYU4dyK86vo
 aZ0gHsbje+D8vx3Dv39iJVNJlVb2nL1eQg6FqNrS2tR+9/1W5vSZzVmJr
 dscriFD7HVMAh0pqyQeV2dz7BHuN2u9Ws34XK6JfES9tTm4YTQ6TG6rMh
 RXuYKB8hIjMLcFP8t9f4g4Fh0PZCMhSu6xE5YtF+rCWUR9RZC1ArwecuH
 tYfdCgSupEpbvnG7Bptdr2OlAi+asfzEvzpy2zNpsihPAdzjqGgWbm9+t
 gMhKTe4Xjslgk5s3hEiZfrN9gby/EoeQ47cavtBHORPa9ylPkZQEu8R/X Q==;
X-CSE-ConnectionGUID: UlSJ6QnGSa+TAqgQZnPR/w==
X-CSE-MsgGUID: GHlT9No5QPWPZe8W9rvjSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91162589"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="91162589"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 23:41:49 -0700
X-CSE-ConnectionGUID: OrLLFVrNSQes5OLZsBc/Lw==
X-CSE-MsgGUID: g+gWD4c1QVqgp6bzf6AeZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="262134849"
Received: from shawnle1-i9-build-machine.itwn.intel.com ([10.225.64.200])
 by fmviesa002.fm.intel.com with ESMTP; 14 May 2026 23:41:47 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lee Shawn C <shawn.c.lee@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [i-g-t, v6,
 1/2] Revert "tests/kms_vrr: Start virtual RR test above midpoint to
 avoid mode fallback"
Date: Fri, 15 May 2026 06:32:50 +0000
Message-Id: <20260515063251.2239524-2-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515063251.2239524-1-shawn.c.lee@intel.com>
References: <shawn.c.lee@intel.com>
 <20260515063251.2239524-1-shawn.c.lee@intel.com>
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

This reverts commit 862eb176244feac8ee711f381fe1be1fdc6a7ede.

The following patch will do full range testing. So no need to start at midpoint.

Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 tests/kms_vrr.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 6043d40f1d74..8f5c4a7c1501 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -786,16 +786,7 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 	/* Switch to Virtual RR */
 	virtual_mode = *igt_output_get_mode(output);
 
-	/*
-	 * Start virtual RR testing from above the midpoint of the VRR range when multiple
-	 * modes are available. This avoids the driver mode adjustment. which can cause an
-	 * unintended clock change.
-	 */
-	vrefresh = (output->config.connector->count_modes > 1) ?
-		   (((data->range.max + data->range.min) / 2) + step_size) :
-		   data->range.min + step_size;
-
-	for ( ; vrefresh < data->range.max; vrefresh += step_size) {
+	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
 		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
 
 		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
-- 
2.34.1

