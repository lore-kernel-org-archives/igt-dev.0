Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB0CCD484E
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 06:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F78210E02C;
	Tue, 12 May 2026 06:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0LvMAeS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F36410E02C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 06:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778566924; x=1810102924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oAuizqUMEBRdIBJJuOXdbeZ0csxcLTHurzEzGGc8k74=;
 b=G0LvMAeSw5mfRJ9bboC6ZdBYCklnlIko1esRvYpPca3bW3nVUZnpc9fL
 rYfLFY1tGsXViu/eSQCmx5EkMXDZe24OA4iJLeRDzEX8vlRebdcehEkdh
 Ua8G3DOsgJ7V/BaHHlbOmlX5dN7EU9bMsJ798Er7KIlNQ9ddUs2OP0AuA
 Odc1Y4SlEoSOPgLxNQ6TxGZ0GU8ki0i+8t+rxXpddFeAoaqYIMKS7hL7s
 xArId1pl6Ke2bBYMVQdbFZxTTSCnTUCZsTd7qZOroMPSJYuvXS/HpX2wh
 qtXxg2/lIFy+zs4x6h5X5ihUHDYSPpe0+tiv9admN5VlNrWWSBz6TQAAB Q==;
X-CSE-ConnectionGUID: 9al8nhNjTTe89ZmIQHowhA==
X-CSE-MsgGUID: nMVLRmc+TDOVrDp4uJM45Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="82033638"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="82033638"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 23:22:04 -0700
X-CSE-ConnectionGUID: mWgWPXzbRrKVjHneuCVW9g==
X-CSE-MsgGUID: gsILPCNKT6eoSmjEvJddkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="242032298"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 23:22:03 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@intel.com, ville.syrjala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/igt_fb: Add IGT_FORMAT_MOD_PREFERRED helper
 modifier
Date: Tue, 12 May 2026 11:50:17 +0530
Message-ID: <20260512062020.546220-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512062020.546220-1-jeevan.b@intel.com>
References: <20260512062020.546220-1-jeevan.b@intel.com>
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

lib/igt_fb: Add IGT_FORMAT_MOD_PREFERRED helper modifier

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
 lib/igt_fb.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_fb.h | 19 ++++++++++++++
 2 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index fa9220953..454a59859 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -790,6 +790,67 @@ static int fb_num_planes(const struct igt_fb *fb)
 	return num_planes;
 }
 
+/**
+ * igt_fb_resolve_modifier:
+ * @fd: DRM device fd
+ * @modifier: Requested modifier, may be IGT_FORMAT_MOD_PREFERRED
+ *
+ * Resolve the IGT_FORMAT_MOD_PREFERRED sentinel to an actual framebuffer
+ * modifier by checking device capabilities. Tries modifiers in order of
+ * preference: X-tile (compatibility), 4-tile (modern), then LINEAR (fallback).
+ * Returns the first supported modifier.
+ *
+ * This approach avoids hardcoded driver/generation checks and instead
+ * validates actual device capabilities.
+ *
+ * Returns: The resolved DRM format modifier that is supported by the device.
+ */
+static bool igt_fb_modifier_is_supported(int fd, uint32_t format,
+					 uint64_t modifier)
+{
+	igt_display_t display;
+	bool supported = false;
+
+	if (modifier == DRM_FORMAT_MOD_LINEAR)
+		return true; /* LINEAR is always supported */
+
+	igt_display_require(&display, fd);
+	supported = igt_display_has_format_mod(&display, format, modifier);
+	igt_display_fini(&display);
+
+	return supported;
+}
+
+static uint64_t igt_fb_resolve_modifier(int fd, uint32_t format,
+					 uint64_t modifier)
+{
+	uint64_t preferred_modifiers[] = {
+		I915_FORMAT_MOD_X_TILED,   /* X-tile: good compatibility */
+		I915_FORMAT_MOD_4_TILED,   /* 4-tile: modern, potentially better */
+		DRM_FORMAT_MOD_LINEAR      /* Linear: always fallback */
+	};
+	uint64_t resolved = DRM_FORMAT_MOD_LINEAR;
+
+	if (modifier != IGT_FORMAT_MOD_PREFERRED)
+		return modifier;
+
+	/* Try preferred modifiers in order, independent of driver checks. */
+	for (int i = 0; i < ARRAY_SIZE(preferred_modifiers); i++) {
+		if (igt_fb_modifier_is_supported(fd, format,
+						preferred_modifiers[i])) {
+			resolved = preferred_modifiers[i];
+			igt_debug("Found supported modifier: %s(0x%" PRIx64 ")\n",
+				  igt_fb_modifier_name(resolved), resolved);
+			break;
+		}
+	}
+
+	igt_debug("Resolved IGT_FORMAT_MOD_PREFERRED to %s(0x%" PRIx64 ")\n",
+		  igt_fb_modifier_name(resolved), resolved);
+
+	return resolved;
+}
+
 void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
 		 uint32_t drm_format, uint64_t modifier,
 		 enum igt_color_encoding color_encoding,
@@ -803,7 +864,13 @@ void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
 
 	fb->width = width;
 	fb->height = height;
-	fb->modifier = modifier;
+	fb->modifier = igt_fb_resolve_modifier(fd, drm_format, modifier);
+	/* Log the chosen modifier for debugging. */
+	if (modifier == IGT_FORMAT_MOD_PREFERRED) {
+		igt_debug("Created framebuffer: %dx%d, format=%s, modifier=%s(0x%" PRIx64 ")\n",
+			  width, height, igt_format_str(drm_format),
+			  igt_fb_modifier_name(fb->modifier), fb->modifier);
+	}
 	fb->drm_format = drm_format;
 	fb->fd = fd;
 	fb->num_planes = fb_num_planes(fb);
@@ -5266,6 +5333,8 @@ void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
 const char *igt_fb_modifier_name(uint64_t modifier)
 {
 	switch (modifier) {
+	case IGT_FORMAT_MOD_PREFERRED:
+		return "preferred";
 	case DRM_FORMAT_MOD_LINEAR:
 		return "linear";
 	case I915_FORMAT_MOD_X_TILED:
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 8e5907dab..27aa9e161 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -50,6 +50,25 @@ typedef struct _igt_crc igt_crc_t;
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
+
 #define IGT_FORMAT_FMT "%c%c%c%c(0x%08x)"
 #define IGT_FORMAT_ARGS(f) ((f) >> 0) & 0xff, ((f) >> 8) & 0xff, \
 		((f) >> 16) & 0xff, ((f) >> 24) & 0xff, (f)
-- 
2.43.0

