Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75597C25B78
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 16:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0526010E273;
	Tue, 21 May 2024 16:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bsLphtQO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924A110E633
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716308127; x=1747844127;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LCcsB1El7O4CEphDM9LrTuEuPZTuGLUh2X0wEL7LGPI=;
 b=bsLphtQOjhuEGS0gBYqCdLIjJ5IL9WhWm/NSBQLnSFo9tV4u4uhRuk3L
 Pbm6LFgotaYmqGBvVm+IxVIiEg+noqw4HBCD6DWERtx2Qabfm8E+qxwvm
 FxtSqcwN6YsnbAaqHhhDHXL9VMVV+NSbit2aZAXmtQRwr5FWtDvqCpEGk
 0OnuWJtOalnVowCw/Sd1ySnBWWWMaBjCeDZfkvE5xzVE/3L3A+stAqy7g
 IIJ1y3LANzvEEGVrByH9pYUQwEzMPIDAtIyJC4uocjGl87kiFHqHMJhjc
 qTEmyJxYKcWuG6tSr39mBBCxFIYkcwNVvJbLdd+2cbVMgwkJDeiOwf0OH w==;
X-CSE-ConnectionGUID: NbE99GjMQIWXqJ/jPQs9bA==
X-CSE-MsgGUID: s+4+66BSQo+nZzfcaHHIdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23920040"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="23920040"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 09:15:25 -0700
X-CSE-ConnectionGUID: g7LNDya5Qaqhe+7sod1IpQ==
X-CSE-MsgGUID: NtdBIRQoTe+C902UPXz3Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="32896292"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 09:15:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI 6/6] gputop: Add support to drm-cycles/drm-total-cycles
Date: Tue, 21 May 2024 09:15:25 -0700
Message-ID: <20240521161525.159720-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240521161525.159720-1-lucas.demarchi@intel.com>
References: <20240521161525.159720-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add support for using only GPU timestamps to calculate the utilization.
It uses drm-cycles and drm-total-cycles read from fdinfo. For any
2 samples, the utilization is calculated as:

	         u[i+1] - u[i]
	pct  = -----------------
	        Gt[i+1] - Gt[i]

with u == drm-cycles and Gt == drm-total-cycles.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Link: https://lore.kernel.org/r/20240504064643.25863-14-lucas.demarchi@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index c06cbe738..6c7cf6927 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -31,6 +31,11 @@
 #include "igt_drm_fdinfo.h"
 #include "drmtest.h"
 
+enum utilization_type {
+	UTILIZATION_TYPE_ENGINE_TIME,
+	UTILIZATION_TYPE_TOTAL_CYCLES,
+};
+
 static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
 
 static void n_spaces(const unsigned int n)
@@ -174,13 +179,33 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 	     double t, int lines, int con_w, int con_h,
 	     unsigned int period_us, int *engine_w)
 {
+	enum utilization_type utilization_type;
 	unsigned int i;
 	uint64_t sz;
 	int len;
 
+	if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_TOTAL_CYCLES &&
+	    c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_CYCLES)
+		utilization_type = UTILIZATION_TYPE_TOTAL_CYCLES;
+	else if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME)
+		utilization_type = UTILIZATION_TYPE_ENGINE_TIME;
+	else
+		return 0;
+
+	if (c->samples < 2)
+		return 0;
+
 	/* Filter out idle clients. */
-	if (!c->total_engine_time || c->samples < 2)
-		return lines;
+	switch (utilization_type) {
+	case UTILIZATION_TYPE_ENGINE_TIME:
+	       if (!c->total_engine_time)
+		       return 0;
+	       break;
+	case UTILIZATION_TYPE_TOTAL_CYCLES:
+	       if (!c->total_total_cycles)
+		       return 0;
+	       break;
+	}
 
 	/* Print header when moving to a different DRM card. */
 	if (newheader(c, *prevc)) {
@@ -211,8 +236,16 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 		if (!c->engines->capacity[i])
 			continue;
 
-		pct = (double)c->utilization[i].delta_engine_time / period_us / 1e3 * 100 /
-		      c->engines->capacity[i];
+		switch (utilization_type) {
+		case UTILIZATION_TYPE_ENGINE_TIME:
+			pct = (double)c->utilization[i].delta_engine_time / period_us / 1e3 * 100 /
+				c->engines->capacity[i];
+			break;
+		case UTILIZATION_TYPE_TOTAL_CYCLES:
+			pct = (double)c->utilization[i].delta_cycles / c->utilization[i].delta_total_cycles * 100 /
+				c->engines->capacity[i];
+			break;
+		}
 
 		/*
 		 * Guard against fluctuations between our scanning period and
-- 
2.43.0

