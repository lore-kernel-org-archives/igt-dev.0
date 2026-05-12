Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E91CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A78D10EA89;
	Tue, 12 May 2026 12:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m16wgTu3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF3610E1D3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588554; x=1810124554;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=f8kuLzkwetjd2sIoFQA228GR4qp9ROGzBOvzn6w081g=;
 b=m16wgTu3yFtmoJYf6t9tHM6C5V4CwLhnnWoZtD4fVgMzGCgr54YJV5zl
 PSmcXr8rF8Q4aMXLBvTHTlJ+bwLWfUafMiLVadXUU4Tn5hZRwNZYtgMEq
 bPXsnX3eLm7LF7K9Io/npUyKig8ncp2xBU2UFhLqFmy2CjrMqzQ2Z14PX
 lHeChPansY7//FZzW+YEmKS6dujECFjwlrJ8DWl7BKSRO9IhDPS4gEcV4
 qRRFvbIm0AwUIMcVqVxR379qYo4jF2w6T7Td7TcHzUEs2ICZ3c4KrNmgV
 +CcJr3lb1bCEmwurSMQtWtgY/7dwTsywoi+CZ6Ry82h0/Kajn9EeTTFUM w==;
X-CSE-ConnectionGUID: KeIky8txSDy+/fgq7wF/nQ==
X-CSE-MsgGUID: DzYrnHNpRbGt7+uzZR6L7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78641390"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="78641390"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:34 -0700
X-CSE-ConnectionGUID: MpOEtKU8RNCk+79F7wVVhg==
X-CSE-MsgGUID: QcxjmJMMQ2OKuXm5MhYQhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="261502770"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:33 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/25] lib/kms: Make igt_fill_display_format_mod() more
 flexible
Date: Tue, 12 May 2026 15:21:30 +0300
Message-ID: <20260512122143.11013-13-ville.syrjala@linux.intel.com>
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

Currently igt_fill_display_format_mod() is hardcoded to operate
on display->format_mods (and its plane counterparts). We may
also want an async flip counterpart of this. To make that
possible adjust the code so that it can operate on other
igt_format_mods structures.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0d604bc76910..dc3486a795a4 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6327,7 +6327,8 @@ format_mods_union(struct igt_format_mods *format_mods_dst,
 				   format_mods_src->modifiers[i]);
 }
 
-static int display_format_mods_count(igt_display_t *display)
+static int display_format_mods_count(igt_display_t *display,
+				     const struct igt_format_mods *(*plane_format_mods)(igt_plane_t *plane))
 {
 	igt_crtc_t *crtc;
 	int count = 0;
@@ -6336,14 +6337,15 @@ static int display_format_mods_count(igt_display_t *display)
 		igt_plane_t *plane;
 
 		for_each_plane_on_crtc(crtc, plane)
-			count += plane->format_mods.count;
+			count += plane_format_mods(plane)->count;
 	}
 
 	return count;
 }
 
 static void display_format_mods_union(igt_display_t *display,
-				      struct igt_format_mods *format_mods)
+				      struct igt_format_mods *format_mods,
+				      const struct igt_format_mods *(*plane_format_mods)(igt_plane_t *plane))
 {
 	igt_crtc_t *crtc;
 
@@ -6351,29 +6353,41 @@ static void display_format_mods_union(igt_display_t *display,
 		igt_plane_t *plane;
 
 		for_each_plane_on_crtc(crtc, plane)
-			format_mods_union(format_mods, &plane->format_mods);
+			format_mods_union(format_mods, plane_format_mods(plane));
 	}
 }
 
-static void igt_fill_display_format_mod(igt_display_t *display)
+static void display_format_mods_fill(igt_display_t *display,
+				     struct igt_format_mods *format_mods,
+				     const struct igt_format_mods *(*plane_format_mods)(igt_plane_t *plane))
 {
-	int count = display_format_mods_count(display);
+	int count = display_format_mods_count(display, plane_format_mods);
 
 	if (!count)
 		return;
 
-	format_mods_alloc(&display->format_mods, count);
+	format_mods_alloc(format_mods, count);
 
 	/*
 	 * Initial count was an upper bound and may include
 	 * duplicates. The final count, without duplicates,
 	 * is determined while filling the arrays.
 	 */
-	display->format_mods.count = 0;
+	format_mods->count = 0;
 
-	display_format_mods_union(display, &display->format_mods);
+	display_format_mods_union(display, format_mods, plane_format_mods);
 
-	igt_assert_lte(display->format_mods.count, count);
+	igt_assert_lte(format_mods->count, count);
+}
+
+static const struct igt_format_mods *plane_format_mods(igt_plane_t *plane)
+{
+	return &plane->format_mods;
+}
+
+static void igt_fill_display_format_mod(igt_display_t *display)
+{
+	display_format_mods_fill(display, &display->format_mods, plane_format_mods);
 }
 
 /**
-- 
2.52.0

