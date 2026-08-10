Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37773C5AD55
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 13:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D7210E841;
	Mon, 10 Aug 2026 13:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPyG/HMO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5154610E86A
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 13:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786368744; x=1817904744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YV6DYnzNJ+Zh0nLgoKInq4aL7RBYwAPJ0sDGm8uVL/U=;
 b=VPyG/HMO5ivo/KEHCFNRlFcXhc9/Ih4Nd9Zsw0kPLHUtuk+S/n8Ib91n
 bC0G0B5zZJrBYXEzwMiQH5gvrncV0tqC6kzCpRJRSTXkGGNFxm05T1brM
 FH08izvkE4zf00N75Xw57WByhYX9ox5otiu6ct8MDRq9xLnRZjGeHZJGx
 Br85hwGXjeimG1v5PlQvLzRpLFMM2BAGo7CkfXVuPJG9QJq25FMYWUkkF
 hcOyEaZNqWufhHFjgAFkKXV3u6lehLagmJ/8vvL78UeaQ9+2fRIrmWKz2
 yyLBQfJ+CjvDc4p3FIZTpAhQH9fEGREW0E1B7L+NaeOkZ/8rKOuVSWeiB g==;
X-CSE-ConnectionGUID: FspauoZKQQK0ItFhbLf1+w==
X-CSE-MsgGUID: NdMpN5NNQUu3cUwTJDIsqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="98396768"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="98396768"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 06:32:24 -0700
X-CSE-ConnectionGUID: IO+AOKERR+qXQfU1l6uf6g==
X-CSE-MsgGUID: BJ7RkatvRvejZ/h71bonUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="266534850"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 06:32:22 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 1/3] lib/i915/i915_dp: Add UHBR helpers and
 const-correct set_link_params
Date: Mon, 10 Aug 2026 19:02:09 +0530
Message-ID: <20260810133212.829168-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810133212.829168-1-sowmiya.s@intel.com>
References: <20260810133212.829168-1-sowmiya.s@intel.com>
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

Add i915_dp_is_uhbr_rate() and i915_dp_get_next_lower_rate(), prep for
the UHBR-to-HBR fallback subtest later in this series; no caller yet.

i915_dp_get_next_lower_rate() parses intel_dp_allowed_link_configs
(source & sink & current limits) rather than i915_dp_force_link_rate,
since the latter is source-only and lets the kernel silently clamp a
rate the sink never advertised.

Also take link_rate/lane_count as const char * in
i915_dp_set_link_params() so callers can pass string literals.

v4: - name the UHBR10 threshold and make i915_dp_is_uhbr_rate() a
      static inline in the header to avoid a cross-TU call (Kunal)
    - parse intel_dp_allowed_link_configs instead of the source-only
      i915_dp_force_link_rate list in i915_dp_get_next_lower_rate()
      (Kunal)
    - avoid the implicit long to int narrowing on the return value
      (Kunal)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/i915/i915_dp.c | 58 +++++++++++++++++++++++++++++++++++++++++++++-
 lib/i915/i915_dp.h | 24 ++++++++++++++++++-
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index e54058580..3d570f7cc 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -334,7 +334,7 @@ void i915_dp_reset_link_params(int drm_fd, igt_output_t *output)
  * to set link rate and lane count to auto on exit
  */
 void i915_dp_set_link_params(int drm_fd, igt_output_t *output,
-			     char *link_rate, char *lane_count)
+			     const char *link_rate, const char *lane_count)
 {
 	bool valid;
 	drmModeConnector *temp;
@@ -390,3 +390,59 @@ int i915_dp_get_max_supported_rate(int drm_fd, const igt_output_t *output)
 
 	return max_rate;
 }
+
+/**
+ * i915_dp_get_next_lower_rate:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @rate: reference link rate in 10 kbit/s units
+ *
+ * Parse the intel_dp_allowed_link_configs debugfs file and return the highest
+ * allowed link rate strictly below @rate.
+ *
+ * This file lists the configurations the driver would actually pick from, i.e.
+ * the intersection of the source rates, the rates the sink advertises and the
+ * current link limits, as "<lanes>x<rate>" entries. The i915_dp_force_link_rate
+ * list is only the source rates: writing a rate from it that the sink never
+ * advertised still succeeds and the kernel silently clamps the effective rate
+ * down, so the caller would report a rate the link was never trained at.
+ *
+ * Returns: highest allowed rate below @rate in 10 kbit/s units, or 0 if none.
+ */
+int i915_dp_get_next_lower_rate(int drm_fd, igt_output_t *output, int rate)
+{
+	char buf[4096];
+	const char *p;
+	int res, next = 0;
+
+	res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
+					      "intel_dp_allowed_link_configs",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0,
+		     "Unable to read %s/intel_dp_allowed_link_configs\n",
+		     igt_output_name(output));
+
+	/*
+	 * Entries are "<lanes>x<rate>". Key off the 'x' separator rather than
+	 * tokenising the whole file, so the header and any decoration around
+	 * the list are skipped without having to model them.
+	 */
+	for (p = buf; (p = strchr(p, 'x')); p++) {
+		char *endptr;
+		long r;
+
+		/* Must be preceded by the lane count to be a config entry. */
+		if (p == buf || !isdigit((unsigned char)p[-1]))
+			continue;
+
+		errno = 0;
+		r = strtol(p + 1, &endptr, 10);
+		if (errno || endptr == p + 1)
+			continue;
+
+		if (r < rate && r > next)
+			next = (int)r;
+	}
+
+	return next;
+}
diff --git a/lib/i915/i915_dp.h b/lib/i915/i915_dp.h
index b13629147..5d17713e2 100644
--- a/lib/i915/i915_dp.h
+++ b/lib/i915/i915_dp.h
@@ -3,8 +3,29 @@
 #ifndef _I915_DP_H_
 #define _I915_DP_H_
 
+#include <stdbool.h>
+
 #include "igt_kms.h"
 
+/* DP link rates are in 10 kbit/s units; UHBR10 is 10 Gbps. */
+#define I915_DP_UHBR10_LINK_RATE	1000000
+
+/**
+ * i915_dp_is_uhbr_rate:
+ * @link_rate: DP link rate in 10 kbit/s units, as reported by the
+ *	       i915_dp_*_link_rate debugfs files
+ *
+ * UHBR (Ultra High Bit Rate) link rates use 128b/132b channel encoding,
+ * everything below uses legacy 8b/10b. Mirrors the kernel's
+ * drm_dp_is_uhbr_rate().
+ *
+ * Returns: true if @link_rate is a UHBR rate, false otherwise.
+ */
+static inline bool i915_dp_is_uhbr_rate(int link_rate)
+{
+	return link_rate >= I915_DP_UHBR10_LINK_RATE;
+}
+
 int i915_dp_get_current_link_rate(int drm_fd, igt_output_t *output);
 int i915_dp_get_current_lane_count(int drm_fd, igt_output_t *output);
 int i915_dp_get_max_link_rate(int drm_fd, igt_output_t *output);
@@ -17,7 +38,8 @@ int i915_dp_get_pending_lt_failures(int drm_fd, igt_output_t *output);
 int i915_dp_get_pending_retrain(int drm_fd, igt_output_t *output);
 void i915_dp_reset_link_params(int drm_fd, igt_output_t *output);
 void i915_dp_set_link_params(int drm_fd, igt_output_t *output,
-			     char *link_rate, char *lane_count);
+			     const char *link_rate, const char *lane_count);
 int i915_dp_get_max_supported_rate(int drm_fd, const igt_output_t *output);
+int i915_dp_get_next_lower_rate(int drm_fd, igt_output_t *output, int rate);
 
 #endif
-- 
2.51.0

