Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8129CC021BE
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 04:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7DA10EA35;
	Thu, 27 Feb 2025 04:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIrYM+dk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1240010EA25
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 04:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740629976; x=1772165976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dg0H63UZY40P34KJq3pb6sVe10u7eAs1OB+Cfxd5Sk0=;
 b=VIrYM+dkAYQPhQ+1WoWIiYQXdyzV7XnVszV3KRZ46oIw5T+/DpThCMhs
 zOLxAraiEpKytsyHWFBt7W/TU/ad3z1Mn88nSMHHD1t/sQm9r3/qAerQ2
 MQK72oclZfvCHw4dkTsoZ2gXglpjE6dBSlOatvtwApCXBBuglzm6aZL19
 Pl/4T+hY3l+SEFoKWXh3vo0nAL5f7cWYCYn5y0wU7pXq8FM+R4J4Txw+l
 svx8eDgo95I3ati6QMIUzcLsmrGW2vFgVC610kGnfAM8/Apxvmqygc8uZ
 YX+Ee5/yrF6cV9I0HCVq3D3+nDYdOvE+Uc+LpUoqzbr1+bQdcifkYw0uq g==;
X-CSE-ConnectionGUID: EcOq2UIhSiWsm4ovF+JTwg==
X-CSE-MsgGUID: 6rFGToW3QXm/dlj5kFYMeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44331556"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="44331556"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 20:19:36 -0800
X-CSE-ConnectionGUID: gvWCPpoaRvmzkZK/lWkKfQ==
X-CSE-MsgGUID: o00ocYm3Sjajvu9jlAcBSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117396415"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 20:19:35 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 1/2] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Date: Thu, 27 Feb 2025 09:45:44 +0530
Message-Id: <20250227041545.2465720-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227041545.2465720-1-santhosh.reddy.guddati@intel.com>
References: <20250227041545.2465720-1-santhosh.reddy.guddati@intel.com>
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

Parse "IN_FORMATS_ASYNC" plane property to identify supported
format modifier pairs for async flips

V2: Add new fields async_formats and reset idx.

V3: Improve commit message , remove unused declaration (Chaitanya)
    Introduce structure to hold a format modifier and its
    associated format list

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h | 17 ++++++++++++++-
 2 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cc3bb3ae7..c195d7b2d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -701,6 +701,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
 	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
+	[IGT_PLANE_IN_FORMATS_ASYNC] = "IN_FORMATS_ASYNC",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
@@ -5758,11 +5759,14 @@ static int igt_count_plane_format_mod(const struct drm_format_modifier_blob *blo
 
 static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane)
 {
-	const struct drm_format_modifier_blob *blob_data;
+	const struct drm_format_modifier_blob *blob_data, *async_blob_data;
+	const struct drm_format_modifier *async_modifiers;
 	drmModePropertyBlobPtr blob;
 	uint64_t blob_id;
 	int idx = 0;
 	int count;
+	int async_count, k;
+	const uint32_t *async_formats;
 
 	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
 		drmModePlanePtr p = plane->drm_plane;
@@ -5822,6 +5826,57 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 	}
 
 	igt_assert_eq(idx, plane->format_mod_count);
+
+	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC))
+		return;
+
+	blob_id = igt_plane_get_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC);
+	blob = drmModeGetPropertyBlob(display->drm_fd, blob_id);
+
+	if (!blob)
+		return;
+
+	async_blob_data = (const struct drm_format_modifier_blob *)blob->data;
+	async_count = igt_count_plane_format_mod(async_blob_data);
+
+	if (!async_count)
+		return;
+
+	plane->format_mod_pair = calloc(async_count, sizeof(plane->format_mod_pair[0]));
+	igt_assert(plane->format_mod_pair);
+
+	plane->async_format_mod_count = async_blob_data->count_modifiers;
+	async_modifiers = modifiers_ptr(async_blob_data);
+	async_formats = formats_ptr(async_blob_data);
+
+	for (int i = 0; i < async_blob_data->count_modifiers; i++) {
+		plane->format_mod_pair[i].modifier = async_modifiers[i].modifier;
+		plane->format_mod_pair[i].list.count = 0;
+
+		// count the number of formats supported by this modifier
+		for (int j = 0; j < 64; j++) {
+			if (async_modifiers[i].formats & (1ULL << j))
+				plane->format_mod_pair[i].list.count++;
+		}
+
+		// Allocate memory for the formats array
+		plane->format_mod_pair[i].list.formats = calloc(
+						plane->format_mod_pair[i].list.count,
+						sizeof(plane->format_mod_pair[i].list.formats[0])
+						);
+		igt_assert(plane->format_mod_pair[i].list.formats);
+
+		k = 0;
+		//Fill the formats array
+		for (int j = 0; j < 64; j++) {
+			if (async_modifiers[i].formats & (1ULL << j)) {
+				plane->format_mod_pair[i].list.formats[k] =
+					async_formats[async_modifiers[i].offset + j];
+				k++;
+			}
+		}
+
+	}
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 27b545f52..111b61d7c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -365,7 +365,8 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_HOTSPOT_X,
        IGT_PLANE_HOTSPOT_Y,
        IGT_PLANE_SIZE_HINTS,
-       IGT_NUM_PLANE_PROPS
+       IGT_PLANE_IN_FORMATS_ASYNC,
+       IGT_NUM_PLANE_PROPS,
 };
 
 /**
@@ -405,6 +406,16 @@ static inline bool igt_rotation_90_or_270(igt_rotation_t rotation)
 	return rotation & (IGT_ROTATION_90 | IGT_ROTATION_270);
 }
 
+typedef struct {
+	uint32_t *formats;
+	int count;
+} async_format_list;
+
+typedef struct {
+	uint64_t modifier;
+	async_format_list list;
+} igt_async_format_mod_t;
+
 typedef struct igt_plane {
 	/*< private >*/
 	igt_pipe_t *pipe;
@@ -438,8 +449,12 @@ typedef struct igt_plane {
 	uint64_t *modifiers;
 	uint32_t *formats;
 	int format_mod_count;
+
+	igt_async_format_mod_t *format_mod_pair;
+	int async_format_mod_count;
 } igt_plane_t;
 
+
 /*
  * This struct represents a hardware pipe
  *
-- 
2.34.1

