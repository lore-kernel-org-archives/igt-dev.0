Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B243BCD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BA510E0E5;
	Tue, 12 May 2026 12:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBqALqQ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C2B10E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588535; x=1810124535;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=r83hVorbXQ3uJXlYn4+uba92OOwYmiIJWIxjKC8ACqo=;
 b=FBqALqQ/VYDtDNUONd/Dkv0OoxeX7+x9SBGJz0y+4f45jKFsSyJf+LI1
 9CW6hpPHjLkA/uj9AtsgAyyxgJr/g+z+AbZZIOXEK6xtSBsjiM0tHaWVb
 oJ6Fz4W2aVKgnzezmsZQls7woYRvlhz428xvo5Tl1umzLs9gV1YynktBS
 szP0gKD7v/JnVH8wDw5S8x2f+YwtiqTmkPI1xT9da+fvpN/rVxI7Lbao+
 MQNVZ6jbsob+0Ohuahl8WGiML1bMDdxuKAoOUcw6+p7e9u/IGlGPu0O31
 pf+LzDU5rJr/zAl6/p3KOpnmKGLCMUR8eNRbr7DAt5TQrz+4T/sUuUjDo g==;
X-CSE-ConnectionGUID: xOzrKtbeRbeCUSiMGRTcvw==
X-CSE-MsgGUID: NCJcoYneRDm2f1v7w5G0lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79525697"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79525697"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:15 -0700
X-CSE-ConnectionGUID: vQ5PdHvWRFuxBSSJzdDzaw==
X-CSE-MsgGUID: guih68iLS+eS9KgZQWLCZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="235091414"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:14 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/25] lib/kms: Extract
 igt_format_mods_has_format_with_modifier()
Date: Tue, 12 May 2026 15:21:25 +0300
Message-ID: <20260512122143.11013-8-ville.syrjala@linux.intel.com>
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

We have three copies of the same code to look for a specific
format+modifier combination in lib/igt_kms.c alone (more in
tests/). Consolidate the lib/igt_kms.c uses to a single function.
We'll take of tests/* later.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 48 +++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b3ee8a61683e..2a4e91d9ed7e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6270,6 +6270,20 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 	}
 }
 
+static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
+						    uint32_t format, uint64_t modifier)
+{
+	int i;
+
+	for (i = 0; i < format_mods->count; i++) {
+		if (format_mods->formats[i] == format &&
+		    format_mods->modifiers[i] == modifier)
+			return true;
+	}
+
+	return false;
+}
+
 /**
  * igt_plane_has_format_mod:
  * @plane: Target plane
@@ -6281,16 +6295,8 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 bool igt_plane_has_format_mod(igt_plane_t *plane, uint32_t format,
 			      uint64_t modifier)
 {
-	int i;
-
-	for (i = 0; i < plane->format_mods.count; i++) {
-		if (plane->format_mods.formats[i] == format &&
-		    plane->format_mods.modifiers[i] == modifier)
-			return true;
-
-	}
-
-	return false;
+	return igt_format_mods_has_format_and_modifier(&plane->format_mods,
+						       format, modifier);
 }
 
 static int igt_count_display_format_mod(igt_display_t *display)
@@ -6316,15 +6322,15 @@ igt_add_display_format_mod(igt_display_t *display, uint32_t format,
 {
 	int i;
 
-	for (i = 0; i < display->format_mods.count; i++) {
-		if (display->format_mods.formats[i] == format &&
-		    display->format_mods.modifiers[i] == modifier)
-			return;
+	if (igt_format_mods_has_format_and_modifier(&display->format_mods,
+						    format, modifier))
+		return;
 
-	}
+	i = display->format_mods.count;
 
 	display->format_mods.formats[i] = format;
 	display->format_mods.modifiers[i] = modifier;
+
 	display->format_mods.count++;
 }
 
@@ -6371,16 +6377,8 @@ static void igt_fill_display_format_mod(igt_display_t *display)
 bool igt_display_has_format_mod(igt_display_t *display, uint32_t format,
 				uint64_t modifier)
 {
-	int i;
-
-	for (i = 0; i < display->format_mods.count; i++) {
-		if (display->format_mods.formats[i] == format &&
-		    display->format_mods.modifiers[i] == modifier)
-			return true;
-
-	}
-
-	return false;
+	return igt_format_mods_has_format_and_modifier(&display->format_mods,
+						       format, modifier);
 }
 
 /**
-- 
2.52.0

