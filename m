Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2195DCD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 20:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFA410EA10;
	Wed, 27 May 2026 20:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+WF4pwS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB27E10EA0F
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 20:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779915445; x=1811451445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9zdYczKeiVOyoUXDNza3HgclkKBuAeMmzSb+UUBargY=;
 b=c+WF4pwSUf3q0hdYf0jKEAIwkTzD6IHaBg/0ZiyzA2vg/BFgP54qM+yF
 wCPgqhxUfEkWZyunDjs4m5TgxQAp5GyJgorcUN+4ZCWMnF8+zucVSQkjC
 hZ3MuE1vzQVB6qUk2jvFnOENcmK7TdvZSpWsMfAd3CpO1TExwvw887OBv
 3eqpCJmZjddqfC9oic8EwfHOa63oTrZ0iJphD2C0kN8ySQ0Hb5W+BA441
 LgXTsDNeJytiGesr8ZWjYZl0EqRNcEgMzfARMd4TJ3sogO2aeypIBGUHJ
 hNFbdhiHV7DrxED+nvagslvSOlk9QPl8uQHHkjIR5KdS1ZMPXhRzFqzXR A==;
X-CSE-ConnectionGUID: JqTg5oaCR4elo2GS+ktB8A==
X-CSE-MsgGUID: ngsc6HfxSaSzGIhb19TFig==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="103432170"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="103432170"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:57:25 -0700
X-CSE-ConnectionGUID: 1N2i3xrRTwqu4JtMgmaDow==
X-CSE-MsgGUID: hBt3KIXiRoeW5uGtDkUSCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="241317705"
Received: from kpleskax-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.94.249.221])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:57:23 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 7/8] tests/intel/xe_sriov_scheduling: Remove unused
 log_sample_values helper
Date: Wed, 27 May 2026 22:56:40 +0200
Message-ID: <20260527205644.2801165-8-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
References: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
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

Drop the unused sample logging helper after the throughput verification
path stopped relying on the detailed mismatch dump.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 47 -------------------------------
 1 file changed, 47 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 692f92e76..915442380 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -472,53 +472,6 @@ static void compute_common_time_frame_stats(struct subm_set *set)
 	}
 }
 
-static void log_sample_values(char *id, struct subm_stats *stats,
-			      double comparison_mean, double outlier_treshold)
-{
-	const uint64_t *values = stats->samples.values_u64;
-	unsigned int n = stats->samples.n_values;
-	char buffer[2048];
-	char *p = buffer, *pend = buffer + sizeof(buffer);
-	unsigned int i;
-	const unsigned int edge_items = 3;
-	bool is_outlier;
-	double tolerance = outlier_treshold * comparison_mean;
-
-	p += snprintf(p, pend - p,
-		      "[%s] start=%f end=%f nsamples=%u comparison_mean=%.2fms\n",
-		      id, stats->start_timestamp * 1e-9, stats->end_timestamp * 1e-9, n,
-		      comparison_mean * 1e-6);
-
-	for (i = 0; i < n && p < pend; ++i) {
-		is_outlier = fabs(values[i] - comparison_mean) > tolerance;
-
-		if (n <= 2 * edge_items || i < edge_items ||
-		    i >= n - edge_items || is_outlier) {
-			if (is_outlier) {
-				double pct_diff =
-					100 *
-					(comparison_mean ?
-						 (values[i] - comparison_mean) /
-							 comparison_mean :
-						 1.0);
-
-				p += snprintf(p, pend - p,
-					      "%0.2f @%d Pct Diff %0.2f%%\n",
-					      values[i] * 1e-6, i,
-					      pct_diff);
-			} else {
-				p += snprintf(p, pend - p, "%0.2f\n",
-					      values[i] * 1e-6);
-			}
-		}
-
-		if (i == edge_items && n > 2 * edge_items)
-			p += snprintf(p, pend - p, "...\n");
-	}
-
-	igt_debug("%s\n", buffer);
-}
-
 #define MIN_NUM_REPEATS 25
 #define MIN_EXEC_QUANTUM_MS 2
 #define MAX_EXEC_QUANTUM_MS 32
-- 
2.43.0

