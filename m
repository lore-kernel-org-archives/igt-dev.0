Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B730D5C0C2
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 08:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FB510E767;
	Tue, 16 Dec 2025 08:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihGj0rCF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4807710E767
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 08:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765875139; x=1797411139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kOLtQmn1rywTEgmWBRhOhxwSsyBXZJ4KbxFh17LIzQQ=;
 b=ihGj0rCFz89m3PJZIv/CmYAApVP1+dmy/3vn/8hZ1mokMt+7cykgO7Fr
 4QIPfegfnQBeGuN/hPtFeipFygkmSZ0A1FvPacZIV+i258xznXIXCToM/
 OQUxRyHbyOdo4m6zVdh3UIK9LrdsdcZ+QL53xhX1egmoji2ua6J57gX9k
 NTKtZutynYOmCd1RhJFpiD+GRMFTwlQ8xz56WjkW6OOu8L+8bF/lFIbG6
 Ri50UHFV9ZHtGU7xEvhMeKUlpki4bIzS1jHSEZaAvDXDdS/QsiJvJ4xe1
 UwzCUau7ruuVP8FlGr6il6CofB06nF4oV5fJ5qoIdjIPZ9/fKWW9VoOJg g==;
X-CSE-ConnectionGUID: kDWjav7HTKqbj9nOtmB/BA==
X-CSE-MsgGUID: WkY4f63gRPW5T/4/jDaQBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67670030"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="67670030"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:52:19 -0800
X-CSE-ConnectionGUID: q3dfj/e5R6WlPl2eXdPL1A==
X-CSE-MsgGUID: W0OxD5rKQMGVii6AQ3mf5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197710610"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:52:18 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, jeevan.b@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 1/4] lib/igt_fb: Add wrappers for painting test
 patterns to framebuffers
Date: Tue, 16 Dec 2025 14:22:39 +0530
Message-ID: <20251216085242.2916476-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216085242.2916476-1-karthik.b.s@intel.com>
References: <20251216085242.2916476-1-karthik.b.s@intel.com>
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

v3: Remove the additional internal function. (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_fb.c | 53 +++++++++++++++++++++++++++++++++++++++++++---------
 lib/igt_fb.h |  3 +++
 2 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0a8299d26..cf088252d 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2017,6 +2017,48 @@ void igt_paint_test_pattern(cairo_t *cr, int width, int height)
 	igt_assert(!cairo_status(cr));
 }
 
+/**
+ * igt_paint_test_pattern_fb:
+ * @fd: open drm file descriptor
+ * @fb: pointer to an #igt_fb structure
+ *
+ * This function draws the standard IGT test pattern into @fb using cairo.
+ */
+void igt_paint_test_pattern_fb(int fd, struct igt_fb *fb)
+{
+	cairo_t *cr;
+
+	cr = igt_get_cairo_ctx(fd, fb);
+
+	igt_paint_test_pattern(cr, fb->width, fb->height);
+
+	igt_put_cairo_ctx(cr);
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
+	cairo_t *cr;
+
+	cr = igt_get_cairo_ctx(fd, fb);
+
+	igt_paint_color(cr, 0, 0, fb->width, fb->height, r, g, b);
+	igt_paint_test_pattern(cr, fb->width, fb->height);
+
+	igt_put_cairo_ctx(cr);
+}
+
 static cairo_status_t
 stdio_read_func(void *closure, unsigned char* data, unsigned int size)
 {
@@ -2277,14 +2319,11 @@ unsigned int igt_create_pattern_fb(int fd, int width, int height,
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
@@ -2319,15 +2358,11 @@ unsigned int igt_create_color_pattern_fb(int fd, int width, int height,
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

