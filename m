Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83B0C10F1A
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 06:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF6F112ADE;
	Sat,  4 May 2024 06:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkmgtcEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E97112AD8
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 06:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714805159; x=1746341159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MyWrrsPUNwLJJ+FaW9mb0iCg1kANTnmA7JeFwM9uL+Y=;
 b=fkmgtcEvOXpIYYJdzVUSypD9JAUL2+w3CKWx8ykbcV56K+zC2s2qEv1T
 OszpljZlH6BhMh9srXr9gYglVqFFpTzx7qSb/Ren7Zqw4i6nR2jIGKCmM
 yCBeSbwFlNGHsJhD8u6F0ANe43hMH66HoH6znXjnHkKNQejLcNygFGYpX
 UZohFuCUcJh4Y/kRt0fyGvgVYERNeigQLZ7ifA7Kxwd4rESPGMIu8XgY1
 gwqS4O6bBW1AgV0TBd5hKR4o2JdjNpSBsDtEEhnIJTew/qi7a5yb7q+WP
 0hNKGD6v2TdSmzi+/WyYJ9ohTrxRc7Ll93kUFRe7pC5BFeeQtg0H6rG+k w==;
X-CSE-ConnectionGUID: +Zfs99FnTQKh7mzxPZqKBw==
X-CSE-MsgGUID: 2LyfJZi7SsOIEmF+kZrZ4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10545769"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10545769"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:59 -0700
X-CSE-ConnectionGUID: A0VpvbLZRra/E+ttn+ZILQ==
X-CSE-MsgGUID: 8MmJ8XfsTJ6uhJc/2h6XKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="32169832"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 13/13] gputop: Add support to
 drm-cycles/drm-total-cycles
Date: Fri,  3 May 2024 23:46:43 -0700
Message-ID: <20240504064643.25863-14-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504064643.25863-1-lucas.demarchi@intel.com>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index aa88a8021..11e0db482 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -30,6 +30,11 @@
 #include "igt_drm_fdinfo.h"
 #include "drmtest.h"
 
+enum utilization_type {
+	UTILIZATION_TYPE_ENGINE_TIME,
+	UTILIZATION_TYPE_TOTAL_CYCLES,
+};
+
 static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
 
 static void n_spaces(const unsigned int n)
@@ -171,13 +176,33 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
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
@@ -208,8 +233,16 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
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

