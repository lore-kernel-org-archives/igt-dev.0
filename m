Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61765C55822
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 08:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EBF10ED8C;
	Wed,  5 Aug 2026 08:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRNDBtSb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824EB10ED90
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785919481; x=1817455481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0D0CHDoli2KR9PQBoIm0PpLYz6BONIZYc7w8mrqPq6c=;
 b=nRNDBtSbzUDHYOi7lOBqyMSgdr2gCg5II5AbHuGwjINQvXpiUtkLQjzG
 3v4y0sZ7d4ursDdMrPFh4cEszwXuFpH3t2epeK/LPhx6Z0R/KVBab/Iwv
 k89d4Jh4PTSQyum/jyXkePirT9qgh76fHh6MwB/hQZpboXlv2VO1klYHI
 cegEmhEz2tmjBuEOgsLLiv9YHPH51a/nGeLuUzd/WggKF+iREknf9+gu1
 tTxeMrgTDHUldQd7L/qcxWJP6PoKayA+gSEPiKLoxotkjAXK5ttAAZKFr
 G9F464dRWq+I0ZleSOEzM6FmGzeGj74YHi0fiJC7SO5vdf2xiIEf5biCC w==;
X-CSE-ConnectionGUID: Qyq/bDwQRPSZZh8HcQafOg==
X-CSE-MsgGUID: cgVic2i7SZieBxAZ94dPGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97647246"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="97647246"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 01:44:41 -0700
X-CSE-ConnectionGUID: PL2RgpHwQQOBMEHsZoCK7A==
X-CSE-MsgGUID: 8RvfxXWtQZCK5C4VzO2CDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="261186769"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 01:44:39 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 1/3] lib/i915/i915_dp: add UHBR helpers and
 const-correct set_link_params
Date: Wed,  5 Aug 2026 14:14:25 +0530
Message-ID: <20260805084428.708501-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805084428.708501-1-sowmiya.s@intel.com>
References: <20260805084428.708501-1-sowmiya.s@intel.com>
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

- const char * for i915_dp_set_link_params() to allow string literals
- Add i915_dp_is_uhbr_rate(): returns true for link rates >= 10 Gbps
- Add i915_dp_get_next_lower_rate(): parses force_link_rate debugfs list
  using strtok_r(), base-10 strtol() with errno/endptr checks

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/i915/i915_dp.c | 62 +++++++++++++++++++++++++++++++++++++++++++++-
 lib/i915/i915_dp.h |  4 ++-
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index e54058580..bf66347f5 100644
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
@@ -390,3 +390,63 @@ int i915_dp_get_max_supported_rate(int drm_fd, const igt_output_t *output)
 
 	return max_rate;
 }
+
+/**
+ * i915_dp_is_uhbr_rate:
+ * @link_rate: DP link rate in 10 kbit/s units, as reported by the
+ *	       i915_dp_*_link_rate debugfs files
+ *
+ * UHBR (Ultra High Bit Rate) link rates use 128b/132b channel encoding,
+ * everything below uses legacy 8b/10b. UHBR10 is 10 Gbps, i.e. 1000000 in
+ * 10 kbit/s units. Mirrors the kernel's drm_dp_is_uhbr_rate().
+ *
+ * Returns: true if @link_rate is a UHBR rate, false otherwise.
+ */
+bool i915_dp_is_uhbr_rate(int link_rate)
+{
+	return link_rate >= 1000000;
+}
+
+/**
+ * i915_dp_get_next_lower_rate:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @rate: reference link rate in 10 kbit/s units
+ *
+ * Parses the i915_dp_force_link_rate debugfs list (the source rates, printed
+ * with an "auto" entry and "[..]"/"*" markers) and returns the highest
+ * supported link rate strictly below @rate.
+ *
+ * Returns: highest supported rate below @rate in 10 kbit/s units, or 0 if none.
+ */
+int i915_dp_get_next_lower_rate(int drm_fd, igt_output_t *output, int rate)
+{
+	char buf[512], *token, *saveptr = NULL;
+	int res, next = 0;
+
+	res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
+					      "i915_dp_force_link_rate",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_rate\n",
+		     igt_output_name(output));
+
+	/* Delimiters strip the "auto" whitespace and the [ ] * markers. */
+	for (token = strtok_r(buf, " \t\n[]*", &saveptr); token;
+	     token = strtok_r(NULL, " \t\n[]*", &saveptr)) {
+		char *endptr;
+		long r;
+
+		if (!strcmp(token, "auto"))
+			continue;
+
+		errno = 0;
+		r = strtol(token, &endptr, 10);
+		if (errno || endptr == token || *endptr)
+			continue;
+
+		if (r < rate && r > next)
+			next = r;
+	}
+
+	return next;
+}
diff --git a/lib/i915/i915_dp.h b/lib/i915/i915_dp.h
index b13629147..6b39d0560 100644
--- a/lib/i915/i915_dp.h
+++ b/lib/i915/i915_dp.h
@@ -17,7 +17,9 @@ int i915_dp_get_pending_lt_failures(int drm_fd, igt_output_t *output);
 int i915_dp_get_pending_retrain(int drm_fd, igt_output_t *output);
 void i915_dp_reset_link_params(int drm_fd, igt_output_t *output);
 void i915_dp_set_link_params(int drm_fd, igt_output_t *output,
-			     char *link_rate, char *lane_count);
+			     const char *link_rate, const char *lane_count);
 int i915_dp_get_max_supported_rate(int drm_fd, const igt_output_t *output);
+int i915_dp_get_next_lower_rate(int drm_fd, igt_output_t *output, int rate);
+bool i915_dp_is_uhbr_rate(int link_rate);
 
 #endif
-- 
2.51.0

