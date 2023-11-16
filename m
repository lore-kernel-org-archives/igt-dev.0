Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A4910E5DA
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 13:25:06 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Nov 2023 15:24:50 +0200
Message-ID: <20231116132452.2671-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20231116132452.2671-1-ville.syrjala@linux.intel.com>
References: <20231116132452.2671-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/igt_fb: Provide
 igt_fb_modifier_for_name()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add a function that given a modifier's human readable
name returns the actual modifier magic number.

TODO: figure out what to do about the "same" modifier with
      multiple platform variants...

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 10 ++++++++++
 lib/igt_fb.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 5670bc06c778..24275c06354b 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -4944,3 +4944,13 @@ const char *igt_fb_modifier_name(uint64_t modifier)
 
 	return "?";
 }
+
+uint64_t igt_fb_modifier_for_name(const char *name)
+{
+	for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
+		if (!strcasecmp(name, modifiers[i].name))
+			return modifiers[i].modifier;
+	}
+
+	return DRM_FORMAT_MOD_INVALID;
+}
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 834aaef54dea..3bb577c02cd9 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -230,6 +230,7 @@ int igt_fill_cts_color_square_framebuffer(uint32_t *pixmap,
 
 int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc);
 const char *igt_fb_modifier_name(uint64_t modifier);
+uint64_t igt_fb_modifier_for_name(const char *name);
 
 #endif /* __IGT_FB_H__ */
 
-- 
2.41.0
