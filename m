Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7242ED3C526
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 03:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2593A10E654;
	Wed, 10 Dec 2025 03:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1W8gsJv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D0210E654
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 03:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765337007; x=1796873007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FTVAYsIDtC62VuHL0AAj7MEitImz+/Qsz2JJpLM2OII=;
 b=A1W8gsJvlsJuF55MiZoEpJX2jjPdqTWGVtTvRVdmSBcwLNcebKtx9+iS
 A17/pD+OsPbgZ4G1oGSdEKb6AodtM73SVv/vg1KEaEBDyq7rLLm1zgc+1
 iPMzsF99/4l0+kNxtOzX5RnG7rIqHA2nPHMbDRy/xQCSD/FQFr1PWrB+1
 q6XlWIGj1YxRo7FYLWQ5KRyizL4o2ZBSFHD86Q+VpQvnwS1/hLfba0/dh
 fRkMpTI0wFcsCwENf1Fhm4gx8RtIrdoWwfwGQrnWqO7Nl++advD1IdGrC
 UH86XQjR+o94LYQAXqEfUgF2LmW7lAysfnqStyYgnPjzSoQ4vDrX7DZeh w==;
X-CSE-ConnectionGUID: sLhl0hPuSt+eowoTa8yCnw==
X-CSE-MsgGUID: C8UvSm3ZSO6q+nm9uTrhAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66481255"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="66481255"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:23:27 -0800
X-CSE-ConnectionGUID: ZxzixG2FTFWT4HOsgdTNoQ==
X-CSE-MsgGUID: USXm/lpXTM2lUtOPMUXBbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="200822727"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:23:26 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/4] lib/igt_fb: Add wrappers for painting test patterns
 to framebuffers
Date: Wed, 10 Dec 2025 08:53:46 +0530
Message-ID: <20251210032349.2781106-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210032349.2781106-1-karthik.b.s@intel.com>
References: <20251210032349.2781106-1-karthik.b.s@intel.com>
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

Several tests manually create a cairo context, optionally fill a
background color, paint the standard IGT test pattern, and then
destroy the context. Add helper functions to wrap the igt cairo paint
functions which can be used in test binaries to avoid code duplication
and improve readability.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_fb.c | 38 +++++++++++++++++++++++++++++---------
 lib/igt_fb.h |  3 +++
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0a8299d26..ef16fafb9 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2017,6 +2017,33 @@ void igt_paint_test_pattern(cairo_t *cr, int width, int height)
 	igt_assert(!cairo_status(cr));
 }
 
+static void paint_test_pattern_fb_common(int fd, struct igt_fb *fb,
+					 bool fill_bg,
+					 double r, double g, double b)
+{
+	cairo_t *cr;
+
+	cr = igt_get_cairo_ctx(fd, fb);
+
+	if (fill_bg)
+		igt_paint_color(cr, 0, 0, fb->width, fb->height, r, g, b);
+
+	igt_paint_test_pattern(cr, fb->width, fb->height);
+
+	igt_put_cairo_ctx(cr);
+}
+
+void igt_paint_test_pattern_fb(int fd, struct igt_fb *fb)
+{
+	paint_test_pattern_fb_common(fd, fb, false, 0, 0, 0);
+}
+
+void igt_paint_test_pattern_color_fb(int fd, struct igt_fb *fb,
+				     double r, double g, double b)
+{
+	paint_test_pattern_fb_common(fd, fb, true, r, g, b);
+}
+
 static cairo_status_t
 stdio_read_func(void *closure, unsigned char* data, unsigned int size)
 {
@@ -2277,14 +2304,11 @@ unsigned int igt_create_pattern_fb(int fd, int width, int height,
 				   struct igt_fb *fb /* out */)
 {
 	unsigned int fb_id;
-	cairo_t *cr;
 
 	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
 	igt_assert(fb_id);
 
-	cr = igt_get_cairo_ctx(fd, fb);
-	igt_paint_test_pattern(cr, width, height);
-	igt_put_cairo_ctx(cr);
+	igt_paint_test_pattern_fb(fd, fb);
 
 	return fb_id;
 }
@@ -2319,15 +2343,11 @@ unsigned int igt_create_color_pattern_fb(int fd, int width, int height,
 					 struct igt_fb *fb /* out */)
 {
 	unsigned int fb_id;
-	cairo_t *cr;
 
 	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
 	igt_assert(fb_id);
 
-	cr = igt_get_cairo_ctx(fd, fb);
-	igt_paint_color(cr, 0, 0, width, height, r, g, b);
-	igt_paint_test_pattern(cr, width, height);
-	igt_put_cairo_ctx(cr);
+	igt_paint_test_pattern_color_fb(fd, fb, r, g, b);
 
 	return fb_id;
 }
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index ac0e0909e..8e5907dab 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -210,6 +210,9 @@ void igt_paint_color_gradient_range(cairo_t *cr, int x, int y, int w, int h,
 				    double sr, double sg, double sb,
 				    double er, double eg, double eb);
 void igt_paint_test_pattern(cairo_t *cr, int width, int height);
+void igt_paint_test_pattern_fb(int fd, struct igt_fb *fb);
+void igt_paint_test_pattern_color_fb(int fd, struct igt_fb *fb,
+				     double r, double g, double b);
 void igt_paint_image(cairo_t *cr, const char *filename,
 			 int dst_x, int dst_y, int dst_width, int dst_height);
 int igt_cairo_printf_line(cairo_t *cr, enum igt_text_align align,
-- 
2.43.0

