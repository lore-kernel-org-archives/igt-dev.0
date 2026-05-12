Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAFFCD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E374610E0E5;
	Tue, 12 May 2026 12:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QE2+jur3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA7A10E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588523; x=1810124523;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gJiZLtzPC0kZpqYtz4WRq6R5MdOKnbDBCqeBpDT6Oyg=;
 b=QE2+jur3lEn6ioC1Cxvti8PQXf0TczDbqfVj0hbCV+ocytEAezQRfoVf
 go4xH8511akR/TM554V8mFRTbVOB6M7thSCV3xlPSoma9ODo8U4NcHFYN
 2BT8x7osXrMgNzBlKRZEAmRAUfM5zDTP9KchG5lwrUIUa9QBrns8XhI3h
 Mj2s12c2QT6ZgqmlB6cBqBxpfzmiqBi6qOIRhUc79+NRDzR++DEqnnssf
 1bN9ycKnm/UZNq0BAukQYBIu1kUjQFKfqxvFyafRFq9Z7flvIE1bz5hhL
 +ZYXzoRNgPMNHNaHUkQCjUciakClSFmtpnwPEPnHrgcQxTn2VKP+dQhKu A==;
X-CSE-ConnectionGUID: J6EBLH0TT7CZ7NMrdJv1Wg==
X-CSE-MsgGUID: 77dTdYmvT5i2YI2n399LRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79525677"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79525677"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:03 -0700
X-CSE-ConnectionGUID: 6G57+FEjS26jsuQobo1ksQ==
X-CSE-MsgGUID: Y19fGYLQRMydMFi/EZoOsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="235091379"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:02 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/25] lib/kms: Pass struct igt_format_mods to
 igt_parse_format_mod_blob()
Date: Tue, 12 May 2026 15:21:22 +0300
Message-ID: <20260512122143.11013-5-ville.syrjala@linux.intel.com>
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

Pass the entire format_mods struct to igt_parse_format_mod_blob()
instead of of the individual pieces. Not as messy and fragile as
the current approach.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b60bfa033bcd..6b42c50e9273 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6183,34 +6183,36 @@ static int igt_count_plane_format_mod(const struct drm_format_modifier_blob *blo
 }
 
 static void igt_parse_format_mod_blob(const struct drm_format_modifier_blob *blob_data,
-				      uint32_t **formats, uint64_t **modifiers, int *count)
+				      struct igt_format_mods *format_mods)
 {
 	const struct drm_format_modifier *m = modifiers_ptr(blob_data);
 	const uint32_t *f = formats_ptr(blob_data);
 	int idx = 0;
 
-	*count = igt_count_plane_format_mod(blob_data);
-	if (*count == 0)
+	format_mods->count = igt_count_plane_format_mod(blob_data);
+	if (format_mods->count == 0)
 		return;
 
-	*formats = calloc(*count, sizeof((*formats)[0]));
-	igt_assert(*formats);
-	*modifiers = calloc(*count, sizeof((*modifiers)[0]));
-	igt_assert(*modifiers);
+	format_mods->formats = calloc(format_mods->count,
+				       sizeof((format_mods->formats)[0]));
+	igt_assert(format_mods->formats);
+	format_mods->modifiers = calloc(format_mods->count,
+					 sizeof((format_mods->modifiers)[0]));
+	igt_assert(format_mods->modifiers);
 
 	for (int i = 0; i < blob_data->count_modifiers; i++) {
 		for (int j = 0; j < 64; j++) {
 			if (!(m[i].formats & (1ULL << j)))
 				continue;
 
-			(*formats)[idx] = f[m[i].offset + j];
-			(*modifiers)[idx] = m[i].modifier;
+			format_mods->formats[idx] = f[m[i].offset + j];
+			format_mods->modifiers[idx] = m[i].modifier;
 			idx++;
-			igt_assert_lte(idx, *count);
+			igt_assert_lte(idx, format_mods->count);
 		}
 	}
 
-	igt_assert_eq(idx, *count);
+	igt_assert_eq(idx, format_mods->count);
 }
 
 static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane)
@@ -6249,7 +6251,7 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 		return;
 
 	blob_data = (const struct drm_format_modifier_blob *)blob->data;
-	igt_parse_format_mod_blob(blob_data, &plane->format_mods.formats, &plane->format_mods.modifiers, &plane->format_mods.count);
+	igt_parse_format_mod_blob(blob_data, &plane->format_mods);
 	drmModeFreePropertyBlob(blob);
 
 	if (igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC)) {
@@ -6259,7 +6261,7 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 			return;
 
 		blob_data = (const struct drm_format_modifier_blob *)blob->data;
-		igt_parse_format_mod_blob(blob_data, &plane->format_mods_async.formats, &plane->format_mods_async.modifiers, &plane->format_mods_async.count);
+		igt_parse_format_mod_blob(blob_data, &plane->format_mods_async);
 		drmModeFreePropertyBlob(blob);
 	}
 }
-- 
2.52.0

