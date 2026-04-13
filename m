Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9064FF34C63
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 16:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C58810E4D7;
	Mon, 13 Apr 2026 16:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9i98pAy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C8910E462
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776099137; x=1807635137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d7gu84VKPFFRe75QKxi8Js4jUHg7ZluB5CZl6GG/PtI=;
 b=h9i98pAyhLJ0xs1UWax5iEgc4aTx9c9U149YhPen4PUYG/+SJVXSQjq3
 gueR9Ta065cjXqBVzxyABIyoCp9FxDodu/r6DGMTjJaQuvAcvW8WnM74S
 5I4N9J/y9XaKoeObSsDzLmX/bDK+S+V/7jRi0sTiJJOaJcodtgt6ys94U
 SURLYctB7EzCRaxz39Ydh1jiKvRkvlly8IMskcCyRkTQQu8ZPDe3BEQtg
 mw2QwkN6t4t1uBKZ+QIPgAe0Vc992CyOn9k5FeevTv1VuztaDNhZNpf6G
 oVI0sUpYzlk/oRRKcfhg3/bkCIhzAPyLjEHdf4GjETiDp1u5T3isu4Ot8 w==;
X-CSE-ConnectionGUID: zGDFXziQTJSUMtQNr+1A3w==
X-CSE-MsgGUID: yA4HRlwuRgSbQPPPBZqkng==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88489003"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="88489003"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 09:52:17 -0700
X-CSE-ConnectionGUID: /bK5yv7wT2SDw1jV76OWRQ==
X-CSE-MsgGUID: t2DKhj7SSmeCr/TvQiqStA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="233868114"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 09:52:15 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, dev@lankhorst.se,
 ramanaidu.naladala@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_fb: Add IGT_FORMAT_MOD_PREFERRED helper
 modifier
Date: Mon, 13 Apr 2026 22:20:05 +0530
Message-ID: <20260413165006.46987-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413165006.46987-1-jeevan.b@intel.com>
References: <20260413165006.46987-1-jeevan.b@intel.com>
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

Add a new IGT‑internal framebuffer modifier,
IGT_FORMAT_MOD_PREFERRED, allowing tests to request the preferred
non‑linear tiling for a platform without hardcoding
driver‑specific modifiers.

The modifier is resolved in igt_fb_resolve_modifier() using simple
platform rules (Intel, VC4, fallback to linear) and is never passed to
the kernel. It is defined outside the valid DRM modifier range and used
only as an internal sentinel.

This provides a driver‑agnostic way for tests to pick an optimal
modifier, avoiding per‑test hacks.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_fb.c | 27 ++++++++++++++++++++++++++-
 lib/igt_fb.h | 21 +++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index fa9220953..9c3d0338b 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -790,6 +790,29 @@ static int fb_num_planes(const struct igt_fb *fb)
 	return num_planes;
 }
 
+static uint64_t igt_fb_resolve_modifier(int fd, uint64_t modifier)
+{
+	if (modifier != IGT_FORMAT_MOD_PREFERRED)
+		return modifier;
+
+	if (is_xe_device(fd)) {
+		return I915_FORMAT_MOD_4_TILED;
+	} else if (is_i915_device(fd)) {
+		int ver = intel_display_ver(intel_get_drm_devid(fd));
+
+		if (ver >= 13)
+			return I915_FORMAT_MOD_4_TILED;
+		else if (ver >= 9)
+			return I915_FORMAT_MOD_Y_TILED;
+		else
+			return I915_FORMAT_MOD_X_TILED;
+	} else if (is_vc4_device(fd))
+		return DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED;
+
+	/* For AMD, nouveau, and any other driver, fall back to linear. */
+	return DRM_FORMAT_MOD_LINEAR;
+}
+
 void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
 		 uint32_t drm_format, uint64_t modifier,
 		 enum igt_color_encoding color_encoding,
@@ -803,7 +826,7 @@ void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
 
 	fb->width = width;
 	fb->height = height;
-	fb->modifier = modifier;
+	fb->modifier = igt_fb_resolve_modifier(fd, modifier);
 	fb->drm_format = drm_format;
 	fb->fd = fd;
 	fb->num_planes = fb_num_planes(fb);
@@ -5266,6 +5289,8 @@ void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
 const char *igt_fb_modifier_name(uint64_t modifier)
 {
 	switch (modifier) {
+	case IGT_FORMAT_MOD_PREFERRED:
+		return "preferred";
 	case DRM_FORMAT_MOD_LINEAR:
 		return "linear";
 	case I915_FORMAT_MOD_X_TILED:
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 8e5907dab..5380b3dfa 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -50,6 +50,27 @@ typedef struct _igt_crc igt_crc_t;
  */
 #define IGT_FORMAT_FLOAT fourcc_code('I', 'G', 'F', 'x')
 
+/**
+ * IGT_FORMAT_MOD_PREFERRED:
+ *
+ * Modifier used by tests to request the best tiling format for the
+ * current device. The actual modifier is selected inside igt_init_fb(),
+ * so tests don’t need to handle driver-specific details.
+ *
+ * Selection rules:
+ *  - Intel Xe:              4_TILED
+ *  - Intel i915 (gen ≥13):  4_TILED
+ *  - Intel i915 (gen 9–12): Y_TILED
+ *  - Intel i915 (gen <9):   X_TILED
+ *  - Broadcom VC4:          T_TILED
+ *  - Others:                LINEAR (fallback)
+ *
+ * Note: This is a special placeholder value and must never be sent to
+ * the kernel.
+ */
+#define IGT_FORMAT_MOD_PREFERRED  UINT64_C(0xfffffffffffffffe)
+
+
 #define IGT_FORMAT_FMT "%c%c%c%c(0x%08x)"
 #define IGT_FORMAT_ARGS(f) ((f) >> 0) & 0xff, ((f) >> 8) & 0xff, \
 		((f) >> 16) & 0xff, ((f) >> 24) & 0xff, (f)
-- 
2.43.0

