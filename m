Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9640CCD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D58F10EA7F;
	Tue, 12 May 2026 12:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaoMEPj0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F4010E1D3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588527; x=1810124527;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=48xDxVm7+xZpkNRkw9ONV5V6DlWm4zJnNBGBKyl/heI=;
 b=OaoMEPj0txK9PGX7Y1g74XYogI2wXMDLrtODDsyLIDIH7M79iYnA3k3l
 WFSw9J+CcbJor/ldbWqNGB3r9KuJ4L4SDHBKjq9aQ/IJstoWu1bDIkQuw
 Tdj0p4fM9zjkYrAWynPV+7iDq2yPRKanj286ljxF0jXxuOBOUKT9Jowws
 BDFcmRlrBxVPWZJWMiEr9UNHNmgjPiowTIo9q5rRHUv6eaGYJV+nGVmUg
 C5/SOjLGQ80Ojw0lzS1eFCBgaJg/YUPuAYQC6GkOCoDCao/sWyo2n/1nN
 w92PDZsqwKFFjsraShWWPWOFBKUxJbgILwQp+6ZHB550dKJL3s9i5qGeF Q==;
X-CSE-ConnectionGUID: rXvLuRoqRVudEet1l0ghGA==
X-CSE-MsgGUID: l+G2x+JORZKifuAV0tiCYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79525688"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79525688"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:07 -0700
X-CSE-ConnectionGUID: 3xxlMzZcRu+RC/v2aTozwg==
X-CSE-MsgGUID: GumMm+5YRliIr/mnb6W/0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="235091386"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:06 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/25] lib/kms: Extract format_mods_alloc()
Date: Tue, 12 May 2026 15:21:23 +0300
Message-ID: <20260512122143.11013-6-ville.syrjala@linux.intel.com>
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

We have three copies of the code that allocates the format+modifier
arrays. Consolidate them to a single copy.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 43 ++++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6b42c50e9273..b39cba8ae5e1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6182,6 +6182,20 @@ static int igt_count_plane_format_mod(const struct drm_format_modifier_blob *blo
 	return count;
 }
 
+static void format_mods_alloc(struct igt_format_mods *format_mods, int count)
+{
+	format_mods->count = count;
+
+	if (count == 0)
+		return;
+
+	format_mods->formats = calloc(count, sizeof(format_mods->formats[0]));
+	igt_assert(format_mods->formats);
+
+	format_mods->modifiers = calloc(count, sizeof(format_mods->modifiers[0]));
+	igt_assert(format_mods->modifiers);
+}
+
 static void igt_parse_format_mod_blob(const struct drm_format_modifier_blob *blob_data,
 				      struct igt_format_mods *format_mods)
 {
@@ -6189,16 +6203,7 @@ static void igt_parse_format_mod_blob(const struct drm_format_modifier_blob *blo
 	const uint32_t *f = formats_ptr(blob_data);
 	int idx = 0;
 
-	format_mods->count = igt_count_plane_format_mod(blob_data);
-	if (format_mods->count == 0)
-		return;
-
-	format_mods->formats = calloc(format_mods->count,
-				       sizeof((format_mods->formats)[0]));
-	igt_assert(format_mods->formats);
-	format_mods->modifiers = calloc(format_mods->count,
-					 sizeof((format_mods->modifiers)[0]));
-	igt_assert(format_mods->modifiers);
+	format_mods_alloc(format_mods, igt_count_plane_format_mod(blob_data));
 
 	for (int i = 0; i < blob_data->count_modifiers; i++) {
 		for (int j = 0; j < 64; j++) {
@@ -6227,11 +6232,7 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 
 		count = p->count_formats;
 
-		plane->format_mods.count = count;
-		plane->format_mods.formats = calloc(count, sizeof(plane->format_mods.formats[0]));
-		igt_assert(plane->format_mods.formats);
-		plane->format_mods.modifiers = calloc(count, sizeof(plane->format_mods.modifiers[0]));
-		igt_assert(plane->format_mods.modifiers);
+		format_mods_alloc(&plane->format_mods, count);
 
 		/*
 		 * We don't know which modifiers are
@@ -6332,10 +6333,14 @@ static void igt_fill_display_format_mod(igt_display_t *display)
 	if (!count)
 		return;
 
-	display->format_mods.formats = calloc(count, sizeof(display->format_mods.formats[0]));
-	igt_assert(display->format_mods.formats);
-	display->format_mods.modifiers = calloc(count, sizeof(display->format_mods.modifiers[0]));
-	igt_assert(display->format_mods.modifiers);
+	format_mods_alloc(&display->format_mods, count);
+
+	/*
+	 * Initial count was an upper bound and may include
+	 * duplicates. The final count, without duplicates,
+	 * is determined while filling the arrays.
+	 */
+	display->format_mods.count = 0;
 
 	for_each_crtc(display, crtc) {
 		igt_plane_t *plane;
-- 
2.52.0

