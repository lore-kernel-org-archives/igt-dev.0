Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA93D44149
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 09:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F9310E59C;
	Fri, 12 Dec 2025 09:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0NIqUbG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B8A10E564
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765531891; x=1797067891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lwik/qS+MZW+Ex6VY0c0jMlo9HkHxXp3ZorbsyZFYDU=;
 b=Y0NIqUbGgSu0/rZa1kOskoyaNHd5QIPNovK8DqJyFCyM71izxsXxAWpr
 KbbH6NayqpK8+gcoHVGT+JNj2A28u/waxndmLlxPSOsh6j3ldxwJFpXVe
 s2q8p6XdqLcu9emWtV8Or12LVqZ5uIX4kuOjk5XEHzJUSbdqO/q0UzE84
 ZGZsoMfuTc5XUgM93GuW+iMyNGw5GU+qNyIpcl6VPcm1+UeUHF3JHcpDD
 RjZvECCmtyecd3B7l5NbqlfCctZ9ehi4v8S13ojOXGHmzDLolx9Vek2lt
 xqVCNflmCpjwG7r8ofImKT1t4XZadKN//NBxvkkt/HOSURtNMJiuz/0bT Q==;
X-CSE-ConnectionGUID: m1+P3sYVReWxVoHeGqRZbQ==
X-CSE-MsgGUID: 5b+KVqBVQ52f+rK1AQsyfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="84932431"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="84932431"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:31:30 -0800
X-CSE-ConnectionGUID: enoBK5BTRK6Mg16mnLz5kw==
X-CSE-MsgGUID: hoL4bBA5Sr+ycQUxs6GFJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197301255"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:31:28 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, jeevan.b@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 1/4] lib/igt_fb: Add wrappers for painting test
 patterns to framebuffers
Date: Fri, 12 Dec 2025 15:01:43 +0530
Message-ID: <20251212093146.2881962-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212093146.2881962-1-karthik.b.s@intel.com>
References: <20251212093146.2881962-1-karthik.b.s@intel.com>
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

v2: Add documentation for the wrappers. (Jeevan)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_fb.c | 73 +++++++++++++++++++++++++++++++++++++++++++++-------
 lib/igt_fb.h |  3 +++
 2 files changed, 67 insertions(+), 9 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0a8299d26..2ca7cf900 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2017,6 +2017,68 @@ void igt_paint_test_pattern(cairo_t *cr, int width, int height)
 	igt_assert(!cairo_status(cr));
 }
 
+/**
+ * paint_test_pattern_fb_common:
+ * @fd: open drm file descriptor
+ * @fb: pointer to an #igt_fb structure
+ * @fill_bg: whether to fill the fb with a solid background color
+ * @r: red value to use as fill color
+ * @g: green value to use as fill color
+ * @b: blue value to use as fill color
+ *
+ * Helper to paint the standard IGT test pattern into a framebuffer
+ * using a cairo drawing context. When @fill_bg is true, the framebuffer
+ * is filled to the provided RGB background color before drawing the
+ * test pattern.
+ *
+ * This is a private helper used by the public
+ * igt_paint_test_pattern_fb() and igt_paint_test_pattern_color_fb().
+ */
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
+/**
+ * igt_paint_test_pattern_fb:
+ * @fd: open drm file descriptor
+ * @fb: pointer to an #igt_fb structure
+ *
+ * This function draws the standard IGT test pattern into @fb using cairo.
+ */
+void igt_paint_test_pattern_fb(int fd, struct igt_fb *fb)
+{
+	paint_test_pattern_fb_common(fd, fb, false, 0, 0, 0);
+}
+
+/**
+ * igt_paint_test_pattern_color_fb:
+ * @fd: open drm file descriptor
+ * @fb: pointer to an #igt_fb structure
+ * @r: red value to use as fill color
+ * @g: green value to use as fill color
+ * @b: blue value to use as fill color
+ *
+ * This function fills the entire framebuffer with the given color,
+ * and then draws the standard test pattern into the @fb using cario.
+ */
+void igt_paint_test_pattern_color_fb(int fd, struct igt_fb *fb,
+				     double r, double g, double b)
+{
+	paint_test_pattern_fb_common(fd, fb, true, r, g, b);
+}
+
 static cairo_status_t
 stdio_read_func(void *closure, unsigned char* data, unsigned int size)
 {
@@ -2277,14 +2339,11 @@ unsigned int igt_create_pattern_fb(int fd, int width, int height,
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
@@ -2319,15 +2378,11 @@ unsigned int igt_create_color_pattern_fb(int fd, int width, int height,
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

