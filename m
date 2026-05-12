Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594B3CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7A310EA88;
	Tue, 12 May 2026 12:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hshjnde1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8530410E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588566; x=1810124566;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VXnB6VNWh8OBZ3P9Ovgb4Rky1STH3aJ3AIaqMRgxCsU=;
 b=hshjnde1tipl1cfr34vKhX7+dIGK/vx2+H5p2M/beQ0KFJtc7Ebm4obP
 b9hMMsw4wAg3YTwksd55ljfE/ut+czAtgXtqyK6L8yo0xQh4cQNfcsaZ5
 2J+ULMsjkk88rFthWqTaqCpo1KQnBm5z+ej3cWcq0Ta4gc19N69WNTaML
 GZ6ikumxhENNhrr+1A4b6+CSz44ZHtqwIwrOkKQfRP5K6WHeAKo3UFJ43
 yLqjGupvYU22QA0VRIfcdDFOZFzVkEdKhzu47upRcD38xsr2IRpJafbFG
 vQisAkPhry3TG16ERn/TFepzOpBtY/KY1fP4SKY4ZjXflJl0CXwRTksuf g==;
X-CSE-ConnectionGUID: gwaexuWpSb+WOZ3NEgcuAg==
X-CSE-MsgGUID: S2jkRV4eQjC6SmXCsOVMbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78641400"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="78641400"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:46 -0700
X-CSE-ConnectionGUID: GM0MPJq8TYen6ZeX0iLlHQ==
X-CSE-MsgGUID: qj40NrzWR5+P5CCACt/0Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="261502796"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:45 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 15/25] lib/kms: Encourage drivers to expose
 IN_FORMATS_ASYNC
Date: Tue, 12 May 2026 15:21:33 +0300
Message-ID: <20260512122143.11013-16-ville.syrjala@linux.intel.com>
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

Currently only i915/xe exposes the IN_FORMATS_ASYNC blob. Let's
try to encourage other drivers to join the party by issuing a
warning if we notice that the driver expose the normal
IN_FORMATS blob and claims to be async flip capable.

And in order to make tests less messy let's just assume that
all format+modifier combinations are async flip capable in this
case. Any driver that doesn't like it should just add support
for IN_FORMATS_ASYNC.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b81be73978a1..b90d34e61359 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6244,6 +6244,9 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 	uint64_t blob_id;
 
 	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
+		/* IN_FORMATS_ASYNC should never be present without IN_FORMATS */
+		igt_assert(!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC));
+
 		fill_plane_default_format_mods(plane, &plane->format_mods);
 
 		if (igt_has_drm_cap(display->drm_fd, DRM_CAP_ASYNC_PAGE_FLIP))
@@ -6259,6 +6262,15 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 
 	blob_data = (const struct drm_format_modifier_blob *)blob->data;
 	igt_parse_format_mod_blob(blob_data, &plane->format_mods);
+
+	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC) &&
+	    igt_has_drm_cap(display->drm_fd, DRM_CAP_ASYNC_PAGE_FLIP)) {
+		igt_warn("Driver has IN_FORMATS but no IN_FORMATS_ASYNC while supportiong async flips\n");
+
+		/* assume everything supports async flips */
+		igt_parse_format_mod_blob(blob_data, &plane->format_mods_async);
+	}
+
 	drmModeFreePropertyBlob(blob);
 
 	if (igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC)) {
-- 
2.52.0

