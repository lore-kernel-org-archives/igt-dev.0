Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4901C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5288C10E043;
	Wed, 16 Sep 2026 11:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="So93P+Nd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0313010E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557126; x=1821093126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TZgA8AB0wiuTyu517SfAKaF89mWqG62W4ZBFup5eD7Q=;
 b=So93P+NdC5puU2gF/YenaY0xKd1dzSj30rwbDB/lGJbZtHVvwA9owDeS
 gPxodI2Sf6UEnRn3Osxc18wCWyJann4sgZiADTzbWpGYfIk51Hi3RSGC/
 2VZcBiwu4tkjVfXVMOOY3SDcj6GirBDNppme74NFz1jOwa5Qt9HfLbPc4
 KpF33MBghgmefjRmtJHAxVOx0zSMtOjEEW4eQLt87OoPd8UoZNeFN1/J6
 3XrbRMWJP6SQi5HMbI/E5SVSyi3YAfmtgjxOOZS8HhN30uAi6Q6Yz2MAA
 FGzgawTrecAuTKid8yRoZurSf1eYEjBmEU3K39fHScRm3NC+mM5AlohR4 w==;
X-CSE-ConnectionGUID: mk7QBRGUTBu5hqODin/wCw==
X-CSE-MsgGUID: DPQpyJYqRHOCqDHLr1rR5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440579"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440579"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:12:05 -0700
X-CSE-ConnectionGUID: CDbBQzZYTdKwRC4DxhO8kA==
X-CSE-MsgGUID: FtjJG34LQuicPCQjSozn1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296801063"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:12:02 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 15/16] tools/intel_hdcp: Colour the overlay by HDCP
 state
Date: Wed, 16 Sep 2026 16:37:08 +0530
Message-ID: <20260916110718.596603-16-santhosh.reddy.guddati@intel.com>
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

Use distinct colours for protected HDCP1.4, HDCP2.2 Type 0, and HDCP2.2
Type 1 states. Leave unprotected and pending states unchanged.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 076a878049..64a0523895 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -920,15 +920,32 @@ static const char *hdcp_type_name(enum hdcp_type type)
 
 /*
  * Colour follows the state the kernel reports, not the one that was asked
- * for: amber while authentication is in flight, green only once the kernel
- * has moved the property to ENABLED. Keying the colour off the request, as
- * this used to, turned the screen green whether or not the link came up.
+ * for: amber while authentication is in flight, and a protected colour only
+ * once the kernel has moved the property to ENABLED.
+ *
+ * Once protected, the hue says which flavour of protection is in force.
+ * "Green means good" hides the difference between a 1.4 link and a 2.2 Type 1
+ * one, which is the difference the tool exists to show, so a re-authentication
+ * that silently landed on a weaker link is visible from across the room.
+ * UNDESIRED and DESIRED are questions about the state alone and ignore the
+ * type.
  */
-static void cp_state_color(int state, double *r, double *g, double *b)
+static void cp_state_color(int state, enum hdcp_type type,
+			   double *r, double *g, double *b)
 {
 	switch (state) {
 	case CP_ENABLED:
-		*r = 0.04; *g = 0.38; *b = 0.16;
+		switch (type) {
+		case HDCP_TYPE_1_4:		/* teal */
+			*r = 0.03; *g = 0.33; *b = 0.35;
+			break;
+		case HDCP_TYPE_2_2_TYPE_1:	/* violet */
+			*r = 0.30; *g = 0.13; *b = 0.46;
+			break;
+		default:			/* 2.2 Type 0: green */
+			*r = 0.04; *g = 0.38; *b = 0.16;
+			break;
+		}
 		break;
 	case CP_DESIRED:
 		*r = 0.55; *g = 0.34; *b = 0.04;
@@ -975,7 +992,7 @@ static double draw_state_badge(cairo_t *cr, data_t *data, int state, double cy)
 	bx = (w - bw) / 2;
 	by = cy - bh / 2;
 
-	cp_state_color(state, &r, &g, &b);
+	cp_state_color(state, data->hdcp_type, &r, &g, &b);
 
 	rounded_rect(cr, bx, by, bw, bh, h * 0.02);
 	cairo_set_source_rgba(cr, r, g, b, 0.92);
@@ -1102,7 +1119,7 @@ static void draw_video_frame(data_t *data, struct igt_fb *fb, int state,
 
 	cr = igt_get_cairo_ctx(data->fd, fb);
 
-	cp_state_color(state, &r, &g, &b);
+	cp_state_color(state, data->hdcp_type, &r, &g, &b);
 	cairo_set_source_rgb(cr, r * 0.5, g * 0.5, b * 0.5);
 	cairo_paint(cr);
 
-- 
2.43.0

