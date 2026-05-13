Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD27CD37AC
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 03:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E5F10E2DB;
	Wed, 13 May 2026 03:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIPfwrs/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056E310E2DB
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 03:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778642249; x=1810178249;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FJF6/ChyFDA8LPxK7fKR4Va7cP9kl71tdeMYpUeNdko=;
 b=bIPfwrs/TekN7Wo2U4dBq3Sm81VPjilztljFIS+HQNB33W23AEuOg9cx
 cjSLRfNSq+rpCUtl9a9Fm4zdD5PE1cJvhwMWpWwerBUPfmVJWGm5yhavt
 80F3No14Jxsr84ireBUkvJohls6OS1/lksyMdQo81wk3F1eiN5PClfJVD
 Va/aVbSwLuZ9nGbpFURUELuL8REXUDtCUVfolmQn2/onfon80ESIdWHkL
 TScNvTQ6ofT0NwghdQ8VB0m0/a0O65JOp8oHEsfDKdfIx27G4hmVinZKu
 1OKhpd0rFayOr2hb8+071+7nb4wW7OwnoY4MWMWxhX0wV2qfKwWmWMuqE Q==;
X-CSE-ConnectionGUID: 5EOLHrEdSk612BIFJ2xQlg==
X-CSE-MsgGUID: m1V5YAF7Q9aFb6xnb/2AKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90259673"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="90259673"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 20:17:29 -0700
X-CSE-ConnectionGUID: iww/p416TD2M3+cN0k3snw==
X-CSE-MsgGUID: yR0W0EqCRb2e3kJVHG1Fow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="233493895"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.10])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 20:17:27 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 16/25] lib/kms: Introduce igt_format_mods iterators
Date: Wed, 13 May 2026 06:17:24 +0300
Message-ID: <20260513031724.27229-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260512122143.11013-17-ville.syrjala@linux.intel.com>
References: <20260512122143.11013-17-ville.syrjala@linux.intel.com>
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

Add three new iterators:
- for_each_format_and_modifier()
- for_each_format_with_modifier()
- for_each_modifier_with_format()

Each one takes a igt_format_mods structure, and iterates it
accordingly.

Convert igt_format_mods_has_format_and_modifier() to use
for_each_format_and_modifier() as the first step.

v2: Fix _modifier type in igt_format_mods_has_format_and_modifier()
    Make the macros a bit more type safe

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_aux.h |  3 +++
 lib/igt_kms.c |  8 ++++----
 lib/igt_kms.h | 44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index 56761a3b3eaa..30530a4040ce 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -250,6 +250,9 @@ void igt_debug_interactive_mode_check(const char *var, const char *expected);
 			      __cmp(x, y, op), \
 			      __cmp_once(x, y, igt_unique(igt_tokencat(prefix, __x)), igt_unique(igt_tokencat(prefix, __y)), op))
 
+#define assert_type(x, type) \
+	(void)({_Static_assert(__builtin_types_compatible_p(typeof(x), type), #x " must be " #type);})
+
 #define min(x, y)	__careful_cmp(x, y, <, min)
 #define max(x, y)	__careful_cmp(x, y, >, max)
 
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b90d34e61359..75f7ca2d64e0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6288,11 +6288,11 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
 						    uint32_t format, uint64_t modifier)
 {
-	int i;
+	uint64_t _modifier;
+	uint32_t _format;
 
-	for (i = 0; i < format_mods->count; i++) {
-		if (format_mods->formats[i] == format &&
-		    format_mods->modifiers[i] == modifier)
+	for_each_format_and_modifier(format_mods, _format, _modifier) {
+		if (_format == format && _modifier == modifier)
 			return true;
 	}
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e02c5dd25d16..2f4526407aa2 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -828,6 +828,50 @@ igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display,
 		for_each_if (((format) = (plane)->drm_plane->formats[__i], \
 			      1))
 
+/**
+ * for_each_format_and_modifier:
+ * @format_mods: a pointer to an #igt_format_mod structure
+ * @format: format iterator
+ * @modifier: modifier iterator
+ *
+ * This for loop iterates over all format+modifier combinations.
+ */
+#define for_each_format_and_modifier(format_mods, format, modifier) \
+	for (int igt_unique(__i) = 0; igt_unique(__i) < (format_mods)->count; igt_unique(__i)++) \
+		for_each_if ((assert_type((format), uint32_t), \
+			      assert_type((modifier), uint64_t), \
+			      (format) = (format_mods)->formats[igt_unique(__i)], \
+			      (modifier) = (format_mods)->modifiers[igt_unique(__i)], \
+			      1))
+
+/**
+ * for_each_format_with_modifier:
+ * @format_mods: a pointer to an #igt_format_mod structure
+ * @modifier: specified modifier
+ * @format: format iterator
+ *
+ * This for loop iterates over all formats supporting @modifier.
+ */
+#define for_each_format_with_modifier(format_mods, format, modifier) \
+	for (int igt_unique(__i) = 0; igt_unique(__i) < (format_mods)->count; igt_unique(__i)++) \
+		for_each_if ((assert_type((format), uint32_t), \
+			      (format) = (format_mods)->formats[igt_unique(__i)], \
+			      (modifier) == (format_mods)->modifiers[igt_unique(__i)]))
+
+/**
+ * for_each_modifier_with_format:
+ * @format_mods: a pointer to an #igt_format_mod structure
+ * @format: specified format
+ * @modifier: modifier iterator
+ *
+ * This for loop iterates over all modifiers supporting @format.
+ */
+#define for_each_modifier_with_format(format_mods, format, modifier) \
+	for (int igt_unique(__i) = 0; igt_unique(__i) < (format_mods)->count; igt_unique(__i)++) \
+		for_each_if ((assert_type((modifier), uint64_t), \
+			      (modifier) = (format_mods)->modifiers[igt_unique(__i)], \
+			      (format) == (format_mods)->formats[igt_unique(__i)]))
+
 #define IGT_FIXED(i,f)	((i) << 16 | (f))
 
 /**
-- 
2.52.0

