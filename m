Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3065D35151
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 09:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6185310EFC2;
	Wed,  1 Apr 2026 09:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KICA8OO1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF80910EA53
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775034030; x=1806570030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mgnvbpjycNtTSlkJ1H1DsT+Z82sqHBHsPwadJXG9B0w=;
 b=KICA8OO1YIHY+XPKJmCuXvuPmhP0cxfG2YXEBS+DHnUBtkZZdmB89L5G
 4K2nTBvKVQdFeQpGhI1qFGbI4D6iiCjLtI98DsINI4d2dGMBcI2DLKKF9
 0kP0DVfPIAECYdyCHPnd37LZXNyc2RFP/Gj3o3Glk1NNq9Xndd/hKaii/
 URDNn1CXY8gbOr68gRQR2MvIHtrU6Hi+GM308cSZugnI26HtwNiJF31e5
 TqRqSUeSlH0/bD+lp8DO2ZadYI4s4ord2cjZnGQVo64F56IDbBbLu68n7
 3SlPo8BOVvuyLA6eriVTnMNXKSAqwxskd9nQuX7pZkiZDKKNNGk+KPtza A==;
X-CSE-ConnectionGUID: WasyztWFRSek7pMpJF/odw==
X-CSE-MsgGUID: 4wR0BqBpS1WB4dPlOMbbAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76180914"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76180914"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 02:00:21 -0700
X-CSE-ConnectionGUID: iZBXlySZTDux8BBbLLUpKg==
X-CSE-MsgGUID: A2Z65dYGQ3u3kobx2Jyrhw==
X-ExtLoop1: 1
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 02:00:19 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] lib: Add modifier helper for querying
 driver-supported modifiers
Date: Wed,  1 Apr 2026 14:28:32 +0530
Message-ID: <20260401085851.627453-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401085851.627453-1-jeevan.b@intel.com>
References: <20260401085851.627453-1-jeevan.b@intel.com>
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

Introduce a new helper library that collects DRM format modifiers
reported by KMS planes via the IN_FORMATS property. Two functions are
added:

 - igt_get_all_supported_modifiers()
 - igt_get_basic_tiling_modifiers()

These helpers return unique modifier lists for a given format and will
be used by modifier-related tests.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_modifier.c | 310 +++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_modifier.h |  35 +++++
 lib/meson.build    |   1 +
 3 files changed, 346 insertions(+)
 create mode 100644 lib/igt_modifier.c
 create mode 100644 lib/igt_modifier.h

diff --git a/lib/igt_modifier.c b/lib/igt_modifier.c
new file mode 100644
index 000000000..561afb346
--- /dev/null
+++ b/lib/igt_modifier.c
@@ -0,0 +1,310 @@
+/*
+ * Copyright © 2026 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+/**
+ * SECTION:igt_modifier
+ * @short_description: Helpers to query supported DRM format modifiers
+ * @title: IGT Modifier Helpers
+ */
+
+#include <stdlib.h>
+#include <string.h>
+#include <stdbool.h>
+#include <errno.h>
+
+#include <drm_fourcc.h>
+#include <xf86drm.h>
+#include <xf86drmMode.h>
+
+#include "drmtest.h"
+#include "igt_modifier.h"
+#include "igt_core.h"
+
+/*
+ * Basic tiling modifier candidates.  Only those reported as actually
+ * supported by the driver for the requested format will be returned by
+ * igt_get_basic_tiling_modifiers().
+ */
+static const uint64_t basic_modifier_candidates[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	I915_FORMAT_MOD_X_TILED,
+	I915_FORMAT_MOD_Y_TILED,
+	I915_FORMAT_MOD_4_TILED,
+};
+
+static inline const uint32_t *
+blob_formats_ptr(const struct drm_format_modifier_blob *blob)
+{
+	return (const uint32_t *)((const char *)blob + blob->formats_offset);
+}
+
+static inline const struct drm_format_modifier *
+blob_modifiers_ptr(const struct drm_format_modifier_blob *blob)
+{
+	return (const struct drm_format_modifier *)
+		((const char *)blob + blob->modifiers_offset);
+}
+
+/*
+ * append_unique_modifier - add @mod to @list if not already present.
+ *
+ * @list:  pointer to the growing array (may be reallocated).
+ * @count: current number of entries.
+ * @mod:   modifier to add.
+ *
+ * Returns the new count.
+ */
+static int append_unique_modifier(uint64_t **list, int count, uint64_t mod)
+{
+	for (int i = 0; i < count; i++) {
+		if ((*list)[i] == mod)
+			return count;
+	}
+
+	*list = realloc(*list, (count + 1) * sizeof(**list));
+	igt_assert(*list);
+	(*list)[count] = mod;
+	return count + 1;
+}
+
+/*
+ * collect_modifiers_from_blob - parse an IN_FORMATS blob and collect every
+ * modifier that is paired with @format into @list.
+ *
+ * Returns the updated count of unique modifiers in @list.
+ */
+static int collect_modifiers_from_blob(const struct drm_format_modifier_blob *blob,
+				       uint32_t format,
+				       uint64_t **list, int count)
+{
+	const uint32_t *formats = blob_formats_ptr(blob);
+	const struct drm_format_modifier *mods = blob_modifiers_ptr(blob);
+
+	/* Find the index of @format in the blob's format array. */
+	int fmt_idx = -1;
+
+	for (uint32_t f = 0; f < blob->count_formats; f++) {
+		if (formats[f] == format) {
+			fmt_idx = (int)f;
+			break;
+		}
+	}
+
+	if (fmt_idx < 0)
+		return count;
+
+	/*
+	 * Each drm_format_modifier entry covers a window of 64 formats
+	 * starting at modifier.offset.  Check whether our format index falls
+	 * inside the window and whether the corresponding bit is set.
+	 */
+	for (uint32_t m = 0; m < blob->count_modifiers; m++) {
+		const struct drm_format_modifier *entry = &mods[m];
+		int rel = fmt_idx - (int)entry->offset;
+
+		if (rel < 0 || rel >= 64)
+			continue;
+
+		if (!(entry->formats & (UINT64_C(1) << rel)))
+			continue;
+
+		count = append_unique_modifier(list, count, entry->modifier);
+	}
+
+	return count;
+}
+
+/*
+ * query_plane_modifiers - iterate all KMS planes and collect supported
+ * modifiers for @format via the IN_FORMATS property blob.
+ *
+ * Falls back to DRM_FORMAT_MOD_LINEAR when a plane supports @format in the
+ * legacy format list but exposes no IN_FORMATS blob.
+ *
+ * Returns the number of unique modifiers written into *modifiers_out (>=0).
+ * The caller must free() the returned array.
+ */
+static int query_plane_modifiers(int drm_fd, uint32_t format,
+				 uint64_t **modifiers_out)
+{
+	drmModePlaneResPtr plane_res;
+	uint64_t *list = NULL;
+	int count = 0;
+
+	/* Universal planes capability is needed to see overlay and cursor planes. */
+	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
+
+	plane_res = drmModeGetPlaneResources(drm_fd);
+	if (!plane_res)
+		goto out;
+
+	for (uint32_t p = 0; p < plane_res->count_planes; p++) {
+		drmModePlanePtr plane;
+		drmModeObjectPropertiesPtr props;
+		drmModePropertyBlobPtr blob = NULL;
+		bool format_in_plane = false;
+
+		plane = drmModeGetPlane(drm_fd, plane_res->planes[p]);
+		if (!plane)
+			continue;
+
+		/* Check whether this plane supports @format at all. */
+		for (uint32_t f = 0; f < plane->count_formats; f++) {
+			if (plane->formats[f] == format) {
+				format_in_plane = true;
+				break;
+			}
+		}
+
+		if (!format_in_plane) {
+			drmModeFreePlane(plane);
+			continue;
+		}
+
+		props = drmModeObjectGetProperties(drm_fd, plane->plane_id,
+						   DRM_MODE_OBJECT_PLANE);
+		if (props) {
+			for (uint32_t i = 0; i < props->count_props; i++) {
+				drmModePropertyPtr prop =
+					drmModeGetProperty(drm_fd, props->props[i]);
+				if (!prop)
+					continue;
+
+				if (strcmp(prop->name, "IN_FORMATS") == 0 &&
+				    drm_property_type_is(prop, DRM_MODE_PROP_BLOB) &&
+				    props->prop_values[i] != 0) {
+					blob = drmModeGetPropertyBlob(
+						drm_fd, props->prop_values[i]);
+				}
+
+				drmModeFreeProperty(prop);
+
+				if (blob)
+					break;
+			}
+			drmModeFreeObjectProperties(props);
+		}
+
+		if (blob) {
+			const struct drm_format_modifier_blob *blob_data =
+				(const struct drm_format_modifier_blob *)blob->data;
+
+			count = collect_modifiers_from_blob(blob_data, format,
+							    &list, count);
+			drmModeFreePropertyBlob(blob);
+		} else {
+			/*
+			 * No IN_FORMATS blob: we know the format is supported
+			 * but not which modifiers; assume linear only.
+			 */
+			count = append_unique_modifier(&list, count,
+						       DRM_FORMAT_MOD_LINEAR);
+		}
+
+		drmModeFreePlane(plane);
+	}
+
+	drmModeFreePlaneResources(plane_res);
+
+out:
+	if (count == 0)
+		count = append_unique_modifier(&list, count,
+					       DRM_FORMAT_MOD_LINEAR);
+
+	*modifiers_out = list;
+	return count;
+}
+
+/**
+ * igt_get_all_supported_modifiers:
+ * @drm_fd:       open DRM file descriptor for the device under test
+ * @format:       DRM FOURCC pixel format (e.g. %DRM_FORMAT_XRGB8888)
+ * @modifiers_out: output pointer; set to a malloc'd array of unique modifiers
+ *                 on success. The caller must free() this array.
+ *
+ * Returns the number of modifiers in the returned array (always >= 1 because
+ * %DRM_FORMAT_MOD_LINEAR is used as a fallback).  The list is deduplicated
+ * across all KMS planes; it covers every modifier reported in the %IN_FORMATS
+ * plane property for the given @format on the running platform.
+ *
+ * Returns: number of entries in @modifiers_out (>= 1).
+ */
+int igt_get_all_supported_modifiers(int drm_fd, uint32_t format,
+				    uint64_t **modifiers_out)
+{
+	igt_assert(modifiers_out);
+	return query_plane_modifiers(drm_fd, format, modifiers_out);
+}
+
+/**
+ * igt_get_basic_tiling_modifiers:
+ * @drm_fd:       open DRM file descriptor for the device under test
+ * @format:       DRM FOURCC pixel format (e.g. %DRM_FORMAT_XRGB8888)
+ * @modifiers_out: output pointer; set to a malloc'd array of unique modifiers
+ *                 on success. The caller must free() this array.
+ *
+ * Returns the subset of the "basic" tiling modifiers that are actually
+ * supported by the driver for @format.  The basic set comprises:
+ *
+ * - %DRM_FORMAT_MOD_LINEAR
+ * - %I915_FORMAT_MOD_X_TILED
+ * - %I915_FORMAT_MOD_Y_TILED
+ * - %I915_FORMAT_MOD_4_TILED
+ *
+ * Only modifiers that are actually reported by the driver via the %IN_FORMATS
+ * KMS plane property are included in the result.
+ *
+ * Returns: number of entries in @modifiers_out (>= 1, since at least
+ * %DRM_FORMAT_MOD_LINEAR is always included as a fallback).
+ */
+int igt_get_basic_tiling_modifiers(int drm_fd, uint32_t format,
+				   uint64_t **modifiers_out)
+{
+	uint64_t *all = NULL;
+	uint64_t *basic = NULL;
+	int all_count, basic_count = 0;
+
+	igt_assert(modifiers_out);
+
+	all_count = query_plane_modifiers(drm_fd, format, &all);
+
+	for (int i = 0; i < all_count; i++) {
+		for (int j = 0; j < (int)ARRAY_SIZE(basic_modifier_candidates); j++) {
+			if (all[i] == basic_modifier_candidates[j]) {
+				basic_count = append_unique_modifier(&basic,
+								     basic_count,
+								     all[i]);
+				break;
+			}
+		}
+	}
+
+	free(all);
+
+	if (basic_count == 0)
+		basic_count = append_unique_modifier(&basic, basic_count,
+						     DRM_FORMAT_MOD_LINEAR);
+
+	*modifiers_out = basic;
+	return basic_count;
+}
diff --git a/lib/igt_modifier.h b/lib/igt_modifier.h
new file mode 100644
index 000000000..48ce769f5
--- /dev/null
+++ b/lib/igt_modifier.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright © 2026 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#ifndef __IGT_MODIFIER_H__
+#define __IGT_MODIFIER_H__
+
+#include <stdint.h>
+
+int igt_get_all_supported_modifiers(int drm_fd, uint32_t format,
+				    uint64_t **modifiers_out);
+
+int igt_get_basic_tiling_modifiers(int drm_fd, uint32_t format,
+				   uint64_t **modifiers_out);
+
+#endif /* __IGT_MODIFIER_H__ */
diff --git a/lib/meson.build b/lib/meson.build
index 5c4829345..ca2867eed 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -99,6 +99,7 @@ lib_sources = [
 	'igt_draw.c',
 	'igt_list.c',
 	'igt_map.c',
+        'igt_modifier.c',
 	'igt_panel.c',
 	'igt_pm.c',
 	'igt_dummyload.c',
-- 
2.43.0

