Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C053CD4F52
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 08:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71B210E73F;
	Mon, 18 May 2026 08:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pp3bECoK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E9F10E744
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 08:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779094093; x=1810630093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ivZz3pb4zTaH3Ht2wWAIbKda7wHthgzyoJYHCRVc31I=;
 b=Pp3bECoK+813NuiTZuqRwR7pn9aLTl97zPA+tkhRm6ZZ4MYRSOh1pAZC
 pJHurrs8rSmz0FMUckf867YB9qD7Wif2xub0g3VSV6q5mAhKRy5rCmGx7
 oMIqwsSNKGxnq+t9kJITXMr7lMCfBD1DFPLocIu5tIxyO049DKUn1taSx
 qRONwj04QnhmI7ocfVefU8LTlMIGJJeeWmiZpQIvxT7yKQdYRS3PQeXew
 GIGhIosGOK68PDcQRM9AtUHOLC5jJ1aAvy+r6Hc8oi7d7ZvQJSLM/x/or
 BMm+7kUGBcQal0VwB6tBZfHEw+5xU7lJfu64nNLSWryo7vUZdrIO9+dx/ A==;
X-CSE-ConnectionGUID: MYK0O3CDSSCmjWWn3xRyRg==
X-CSE-MsgGUID: cgBR0RPsSx+Ob9n9OMI+pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="83812212"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="83812212"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 01:48:13 -0700
X-CSE-ConnectionGUID: +Dxwtg0cQvehCktkvfPoMg==
X-CSE-MsgGUID: d7IuNVvrS6KdLwn846V5Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="243364264"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 01:48:12 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, jani.nikula@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_fb: Add IGT_FORMAT_MOD_PREFERRED helper
 modifier
Date: Mon, 18 May 2026 14:16:30 +0530
Message-ID: <20260518084631.1085515-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518084631.1085515-1-jeevan.b@intel.com>
References: <20260518084631.1085515-1-jeevan.b@intel.com>
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

Add IGT_FORMAT_MOD_PREFERRED as an internal FB modifier sentinel so tests
can request preferred tiling without hardcoding driver rules.

Resolve it in igt_fb_resolve_modifier() (never pass it to kernel) by
checking support for the requested format in this order:
X_TILED -> 4_TILED -> LINEAR.

v2:
- Switch from gen/driver policy to capability-based selection
- Drop Y_TILED preference

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_fb.c | 38 +++++++++++++++++++++++++++++++++++++-
 lib/igt_fb.h | 18 ++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index fa9220953..1b0e3f358 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -790,6 +790,40 @@ static int fb_num_planes(const struct igt_fb *fb)
 	return num_planes;
 }
 
+static uint64_t igt_fb_resolve_modifier(int fd, uint32_t format,
+					uint64_t modifier)
+{
+	static const uint64_t preferred_modifiers[] = {
+		I915_FORMAT_MOD_X_TILED,
+		I915_FORMAT_MOD_4_TILED,
+		DRM_FORMAT_MOD_LINEAR,
+	};
+	igt_display_t display;
+	uint64_t resolved = DRM_FORMAT_MOD_LINEAR;
+	int i;
+
+	if (modifier != IGT_FORMAT_MOD_PREFERRED)
+		return modifier;
+
+	igt_display_require(&display, fd);
+
+	for (i = 0; i < ARRAY_SIZE(preferred_modifiers); i++) {
+		if (preferred_modifiers[i] == DRM_FORMAT_MOD_LINEAR ||
+		    igt_display_has_format_mod(&display, format,
+					       preferred_modifiers[i])) {
+			resolved = preferred_modifiers[i];
+			break;
+		}
+	}
+
+	igt_display_fini(&display);
+
+	igt_debug("IGT_FORMAT_MOD_PREFERRED resolved to %s\n",
+		  igt_fb_modifier_name(resolved));
+
+	return resolved;
+}
+
 void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
 		 uint32_t drm_format, uint64_t modifier,
 		 enum igt_color_encoding color_encoding,
@@ -803,7 +837,7 @@ void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
 
 	fb->width = width;
 	fb->height = height;
-	fb->modifier = modifier;
+	fb->modifier = igt_fb_resolve_modifier(fd, drm_format, modifier);
 	fb->drm_format = drm_format;
 	fb->fd = fd;
 	fb->num_planes = fb_num_planes(fb);
@@ -5266,6 +5300,8 @@ void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
 const char *igt_fb_modifier_name(uint64_t modifier)
 {
 	switch (modifier) {
+	case IGT_FORMAT_MOD_PREFERRED:
+		return "preferred";
 	case DRM_FORMAT_MOD_LINEAR:
 		return "linear";
 	case I915_FORMAT_MOD_X_TILED:
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 8e5907dab..cd0923270 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -50,6 +50,24 @@ typedef struct _igt_crc igt_crc_t;
  */
 #define IGT_FORMAT_FLOAT fourcc_code('I', 'G', 'F', 'x')
 
+/**
+ * IGT_FORMAT_MOD_PREFERRED:
+ *
+ * Modifier used by tests to request the best tiling format for the
+ * current device. The actual modifier is selected inside igt_init_fb()
+ * based on device capabilities, so tests don't need to handle driver or
+ * generation-specific details.
+ *
+ * Default selection rules (capability-based):
+ *  - If X_TILED is supported for the requested format, use X_TILED
+ *  - Else if 4_TILED is supported for the requested format, use 4_TILED
+ *  - Else use LINEAR
+ *
+ * Note: This is a special placeholder value and must never be sent to
+ * the kernel. Modifier selection is logged in IGT debug output.
+ */
+#define IGT_FORMAT_MOD_PREFERRED  UINT64_C(0xfffffffffffffffe)
+
 #define IGT_FORMAT_FMT "%c%c%c%c(0x%08x)"
 #define IGT_FORMAT_ARGS(f) ((f) >> 0) & 0xff, ((f) >> 8) & 0xff, \
 		((f) >> 16) & 0xff, ((f) >> 24) & 0xff, (f)
-- 
2.43.0

