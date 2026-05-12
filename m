Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B2BCD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488B110EA85;
	Tue, 12 May 2026 12:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxqLtnTn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB1010E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588570; x=1810124570;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BZVoibUipt075U1q44hibG4AGF18PyJfIEyadxFL0N4=;
 b=HxqLtnTnbyxeB8shHXznUfjZpNg8yPytGW03NkTGVWFT4cF7p4mtVQIZ
 os6tJyrwhCGL/RrDlLfkQR+HDJiZu5due4DgpWn6yjUaq9odX35b+Fnvj
 NTGbO/OGHoUCg8tq5kYDa2fO/VY3czLcdJ/WRJGftWDbswf0w1bi1o8vE
 zxAInNWG7Gdy4ncU4vkvvdiRvG25FdwFCSDjYqqC717t222z9jSataJe1
 t67K6VveBYi7T03QRZZ355G5zY5s6SbgVPfSuT45qk1nybQb209q9ybK5
 IvovZccIxLm4e62gu0/urUFzB1AMWAm0DRAKmCpNHFIdsupL5JK8o0hWq Q==;
X-CSE-ConnectionGUID: MBDCYOdNSnGXe1gDuZkfbw==
X-CSE-MsgGUID: UPkeQtwWT12cI9Dxow6M8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78641403"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="78641403"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:50 -0700
X-CSE-ConnectionGUID: O9eW3TjrQKui8KvMujZvnw==
X-CSE-MsgGUID: TVZ++iWFSB+APYctCat9wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="261502799"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:49 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 16/25] lib/kms: Introduce igt_format_mods iterators
Date: Tue, 12 May 2026 15:21:34 +0300
Message-ID: <20260512122143.11013-17-ville.syrjala@linux.intel.com>
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

Add three new iterators:
- for_each_format_and_modifier()
- for_each_format_with_modifier()
- for_each_modifier_with_format()

Each one takes a igt_format_mods structure, and iterates it
accordingly.

Convert igt_format_mods_has_format_and_modifier() to use
for_each_format_and_modifier() as the first step.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c |  7 +++----
 lib/igt_kms.h | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b90d34e61359..b1ca3970bfc2 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6288,11 +6288,10 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
 						    uint32_t format, uint64_t modifier)
 {
-	int i;
+	uint32_t _format, _modifier;
 
-	for (i = 0; i < format_mods->count; i++) {
-		if (format_mods->formats[i] == format &&
-		    format_mods->modifiers[i] == modifier)
+	for_each_format_and_modifier(format_mods, _format, _modifier) {
+		if (_format == format && _modifier == modifier)
 			return true;
 	}
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e02c5dd25d16..52a2865e9b9c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -828,6 +828,46 @@ igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display,
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
+		for_each_if (((format) = (format_mods)->formats[igt_unique(__i)], \
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
+		for_each_if (((format) = (format_mods)->formats[igt_unique(__i)], \
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
+		for_each_if (((modifier) = (format_mods)->modifiers[igt_unique(__i)], \
+			      ((format) == (format_mods)->formats[igt_unique(__i)])))
+
 #define IGT_FIXED(i,f)	((i) << 16 | (f))
 
 /**
-- 
2.52.0

