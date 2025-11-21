Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AF0CFC29F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 19:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4125A10E2C2;
	Fri, 21 Nov 2025 19:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Deo6gSMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0D410E037
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 19:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763752033; x=1795288033;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bx+yAXkMQje6McIneLcT+Nf8fbm0tkLj+WCbsEo6PnA=;
 b=Deo6gSMSt7kRqF3aifkJcvJBAM7HOS5xFXipp1zNDxOxalLQhFie9hrm
 +7+2xAgPHMj+fupzIlveX65EzmuaK8rs0PLgsx7aNiQOhbsaYgOJhRjcc
 0VdS6KijJ3PjdWHxDYx9zQlYLrI4ha5lm7XBF7RI2y8Ja9a1AhKA8PrEC
 qLP05/BQ+mqlPi2g2GKPGYSILLjgO0tlVOEny34vqx6BPkf74LcDURs1K
 O82BLxa6XV9HVfrOsT1D6phq3SOtmes6ufsD4hBcY8r0TsvUW/0CWH+F8
 Pr9G9ZIvG1JR4LE7+ufKwhhtebt1Y4lzz2QCVtMTZtrw2b82FN6UyYFCz g==;
X-CSE-ConnectionGUID: RhUMXugsSeOiikFKlALy9w==
X-CSE-MsgGUID: 8ocGsA8YTbGgGDSWs09arA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="68454416"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="68454416"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:07:00 -0800
X-CSE-ConnectionGUID: s90u3MCJSZCS+zcgXLNeSg==
X-CSE-MsgGUID: H6Ayk54lTLezEJ4HOJ9W3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="192537628"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.31])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:06:59 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/8] lib/kms: Turn the igt_plane*prop*() marcos into
 functions
Date: Fri, 21 Nov 2025 21:06:30 +0200
Message-ID: <20251121190633.24522-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
References: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Use functions instead of macros for the plane property stuff.
Macros are generally not type safe, hideous to look at, and
a pain to modify. So using macros when you don't have to
is simply a bad idea.

With the type safe functions we now see that tests/kms_cursor_legacy
was using the wrong macros to set cursor properties. But I guess
in this case the implementation of the wrong macros was close
enough that they actually worked correctly.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h             | 33 ++++++++++++++++++++++-----------
 tests/kms_cursor_legacy.c |  4 ++--
 2 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 91776e73e309..9b2c2a7062fe 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -788,8 +788,11 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
  *
  * Check whether a given @prop changed for the @plane.
  */
-#define igt_plane_is_prop_changed(plane, prop) \
-	(!!((plane)->changed & (1 << (prop))))
+static inline bool igt_plane_is_prop_changed(igt_plane_t *plane,
+					     enum igt_atomic_plane_properties prop)
+{
+	return plane->changed & (1 << prop);
+}
 
 /**
  * igt_plane_set_prop_changed:
@@ -798,8 +801,11 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
  *
  * Sets the given @prop for the @plane.
  */
-#define igt_plane_set_prop_changed(plane, prop) \
-	(plane)->changed |= 1 << (prop)
+static inline void igt_plane_set_prop_changed(igt_plane_t *plane,
+					      enum igt_atomic_plane_properties prop)
+{
+	plane->changed |= 1 << prop;
+}
 
 /**
  * igt_plane_clear_prop_changed:
@@ -808,8 +814,11 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
  *
  * Clears the given @prop for the @plane.
  */
-#define igt_plane_clear_prop_changed(plane, prop) \
-	(plane)->changed &= ~(1 << (prop))
+static inline void igt_plane_clear_prop_changed(igt_plane_t *plane,
+						enum igt_atomic_plane_properties prop)
+{
+	plane->changed &= ~(1 << prop);
+}
 
 /**
  * igt_plane_set_prop_value:
@@ -819,11 +828,13 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
  *
  * Sets the given @prop with the @value for the @plane.
  */
-#define igt_plane_set_prop_value(plane, prop, value) \
-	do { \
-		plane->values[prop] = value; \
-		igt_plane_set_prop_changed(plane, prop); \
-	} while (0)
+static inline void igt_plane_set_prop_value(igt_plane_t *plane,
+					    enum igt_atomic_plane_properties prop,
+					    uint64_t value)
+{
+	plane->values[prop] = value;
+	igt_plane_set_prop_changed(plane, prop);
+}
 
 extern bool igt_plane_try_prop_enum(igt_plane_t *plane,
 				    enum igt_atomic_plane_properties prop,
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 865853c38fac..ca9e7a4cab00 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -403,8 +403,8 @@ static	igt_plane_t
 
 static void set_cursor_hotspot(igt_plane_t *cursor, int  hot_x, int hot_y)
 {
-	igt_output_set_prop_value(cursor, IGT_PLANE_HOTSPOT_X, hot_x);
-	igt_output_set_prop_value(cursor, IGT_PLANE_HOTSPOT_Y, hot_y);
+	igt_plane_set_prop_value(cursor, IGT_PLANE_HOTSPOT_X, hot_x);
+	igt_plane_set_prop_value(cursor, IGT_PLANE_HOTSPOT_Y, hot_y);
 }
 
 static void populate_cursor_args(igt_display_t *display, enum pipe pipe,
-- 
2.49.1

