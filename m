Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A48C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC5710E043;
	Wed, 16 Sep 2026 11:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDFxqgGD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3E210E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557128; x=1821093128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U1xSFEqBKa6e3UZCvqR0CDibWm3onNHkd+qVit/U/KA=;
 b=QDFxqgGD5gR7Fb6+YOWwqScdpRqUclIyX0opyT/WNBuYeputmtSxvxhn
 TQsxIbfq9IJ3UlWdKZyp1Wwa9ZIKfnUpV611/cZwx4WacJ/9tJFEItmlc
 Q8PMEZ8L8zQ6DvPeVV87kMdxI0JBf8GqQXJYMo3fHTTHPozUhh/nNEt/X
 SM/lW4U+s2ojOdEcSlnPaUeiFQhviTnoEv8+3wJRNZPAkDVDWQxMw0tJN
 lV+Du8Dw+Xpx+jMpDNSnqT6RXC/z2nf62Gzfv0DcNM2AyCIIVZBlmm0Bz
 JLSBKBqt5ANF1dhXdTFj4R66ip6DUON5cnnPLZPo3Lsn36J4XuqXVbYFS A==;
X-CSE-ConnectionGUID: VuffKZrZT+yOKev9WmkC/A==
X-CSE-MsgGUID: cL2OqHCNQRupMhjPamu2Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440582"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440582"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:12:08 -0700
X-CSE-ConnectionGUID: ndw7pdo0QqmaRSSIn0McBQ==
X-CSE-MsgGUID: F2lRxh44SVe5MFqkL9WY4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296801077"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:12:05 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 16/16] tools/intel_hdcp: Say what the numbers in a
 transition line mean
Date: Wed, 16 Sep 2026 16:37:09 +0530
Message-ID: <20260916110718.596603-17-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
References: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
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

The tail of a transition line read

  UNDESIRED -> ENABLED (after 104195 ms)  [auth 342 ms]

which needs the source open to interpret. "after" is not after anything
named, and the two durations look like they ought to agree when in fact
they measure different things: 104195 ms is how long the property sat in
UNDESIRED before it moved, and 342 ms is how long the kernel took to
authenticate once this tool asked for protection. Name the state the
dwell belongs to:

  UNDESIRED -> ENABLED (104.2 s in UNDESIRED, authenticated in 342 ms)
  ENABLED -> UNDESIRED (96.3 s in ENABLED)

The dwell is a human-scale idle period, so print it in seconds; the
authentication is the sub-second measurement of interest and stays in
milliseconds. Same wording on the on-screen log, where the worst case
still occupies 72% of the width at 4K.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 64a0523895..d28534a31c 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -348,15 +348,15 @@ static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
 
 static void print_transition(const struct cp_transition *t)
 {
-	char auth[40] = "";
+	char auth[48] = "";
 
 	if (t->since_request_ms)
-		snprintf(auth, sizeof(auth), "  [auth %" PRIu64 " ms]",
+		snprintf(auth, sizeof(auth), ", authenticated in %" PRIu64 " ms",
 			 t->since_request_ms);
 
-	printf("[%7.3f] Content Protection: %-9s -> %-9s (after %" PRIu64 " ms)%s\n",
+	printf("[%7.3f] Content Protection: %-9s -> %-9s (%.1f s in %s%s)\n",
 	       t->ms / 1000.0, cp_state_name(t->from), cp_state_name(t->to),
-	       t->dwell_ms, auth);
+	       t->dwell_ms / 1000.0, cp_state_name(t->from), auth);
 }
 
 /*
@@ -1079,16 +1079,18 @@ static void draw_transition_log(cairo_t *cr, data_t *data, double y)
 	for (i = 0; i < n; i++) {
 		const struct cp_transition *t =
 			&data->recent[(first + i) % ARRAY_SIZE(data->recent)];
-		char auth[32] = "";
+		char auth[48] = "";
 
 		if (t->since_request_ms)
-			snprintf(auth, sizeof(auth), "   auth %" PRIu64 " ms",
+			snprintf(auth, sizeof(auth),
+				 ", authenticated in %" PRIu64 " ms",
 				 t->since_request_ms);
 
 		snprintf(line[i], sizeof(line[i]),
-			 "%8.3fs  %-9s -> %-9s  after %5" PRIu64 " ms%s",
+			 "%8.3fs  %-9s -> %-9s  (%.1f s in %s%s)",
 			 t->ms / 1000.0, cp_state_name(t->from),
-			 cp_state_name(t->to), t->dwell_ms, auth);
+			 cp_state_name(t->to), t->dwell_ms / 1000.0,
+			 cp_state_name(t->from), auth);
 
 		cairo_text_extents(cr, line[i], &ext);
 		if (ext.width > widest)
-- 
2.43.0

