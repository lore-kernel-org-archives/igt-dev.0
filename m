Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD286CD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C9310EA88;
	Tue, 12 May 2026 12:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UCHS/lOs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D8410E1D3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588531; x=1810124531;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UntE5N12N6REM/s9CA4aEFz4VAwXNKLrGafQ8ILhy+I=;
 b=UCHS/lOsKTzoFwq96NloWVzASQdOzCAFidMam/3ZMrIwpElna8HTll6o
 WZslqdGz3tCIRd+RIdEaEup9C/Cpg0jFF+dmfuMhgep1a/527roitDepk
 wKg4t7zNtf7uvb0Ffpjr0U+1KjY7DVxAB4FqVu7XaMwgMewVBTI6sPqye
 qPsazwaeu2/4Y/T7NQ8uNX423qdykZn5TCf5Z3xKTe+ZS/HItdE0wfycr
 T377D2I+68vjyAihWbc1PxETtQM2MgjLiKuUa1Pi4hMeLvzkXe8lz2SyY
 0IjUAq4aKn45LtrcF1mqlJEsQfr9cqDK5DBx7pK6vFotm5OiVfR1lJvvk g==;
X-CSE-ConnectionGUID: kjw0OfIZS46dny5TCm5EpA==
X-CSE-MsgGUID: DG9VGJNdSniJR7hAN626zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79525690"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79525690"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:11 -0700
X-CSE-ConnectionGUID: 3kGTZIknRvyK5GSJGO6bEw==
X-CSE-MsgGUID: 3UiIcvHHTiq6UGx2/DHKVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="235091394"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:10 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/25] lib/kms: Extract fill_plane_default_format_mods()
Date: Tue, 12 May 2026 15:21:24 +0300
Message-ID: <20260512122143.11013-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Extract the code that fills the format+modifier arrays when
the plane doesn't have the IN_FORMATs blob. I plan to reuse
this to also fill the async format+modifier list.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b39cba8ae5e1..b3ee8a61683e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6220,28 +6220,31 @@ static void igt_parse_format_mod_blob(const struct drm_format_modifier_blob *blo
 	igt_assert_eq(idx, format_mods->count);
 }
 
+static void fill_plane_default_format_mods(igt_plane_t *plane,
+					   struct igt_format_mods *format_mods)
+{
+	drmModePlanePtr p = plane->drm_plane;
+
+	format_mods_alloc(format_mods, p->count_formats);
+
+	/*
+	 * We don't know which modifiers are
+	 * supported, so we'll assume linear only.
+	 */
+	for (int i = 0; i < plane->format_mods.count; i++) {
+		format_mods->formats[i] = p->formats[i];
+		format_mods->modifiers[i] = DRM_FORMAT_MOD_LINEAR;
+	}
+}
+
 static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane)
 {
 	const struct drm_format_modifier_blob *blob_data;
 	drmModePropertyBlobPtr blob;
 	uint64_t blob_id;
-	int count = 0;
 
 	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
-		drmModePlanePtr p = plane->drm_plane;
-
-		count = p->count_formats;
-
-		format_mods_alloc(&plane->format_mods, count);
-
-		/*
-		 * We don't know which modifiers are
-		 * supported, so we'll assume linear only.
-		 */
-		for (int i = 0; i < count; i++) {
-			plane->format_mods.formats[i] = p->formats[i];
-			plane->format_mods.modifiers[i] = DRM_FORMAT_MOD_LINEAR;
-		}
+		fill_plane_default_format_mods(plane, &plane->format_mods);
 
 		return;
 	}
-- 
2.52.0

