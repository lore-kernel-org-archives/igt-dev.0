Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22485CD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4E610EA7F;
	Tue, 12 May 2026 12:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nq5/pZx+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB29310EA8B
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588575; x=1810124575;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5ifXyWVXnOcyDV0WhP2X9Vg5CaGRE2y78taZV+oYS54=;
 b=Nq5/pZx+9lF64Uld5rieEg6dZ9J6RhkHCaOvk0b0UGrwIcgWBlWPG+za
 1Fppd9GLEDIyuwUxVVjbcdgFbv9VnsHK/93ZuCtjiWx25gYkydYjgRmQl
 GXMeaT+/GV5SfszkQHhWKuGr41CcWnj8BBw79afZe2OvlyRP5NkrZMUh0
 nqV6A2IUYj5oFRGNYzPHjFKBMBi0ifGuzd75t/QFHCyMwXrd1OkEpaNT5
 R84XqGMn++Ve4sH216JfS0mL7+6sFq+t/ZyrmdY/AkFfggLSFLha1/BU6
 Ue4xFUKp/bNpliofbmA8Yoxo36i9Z6awt/jbnARvKoGyTsaMZA02g3UgY A==;
X-CSE-ConnectionGUID: UlIbMxFYRxOe98axiakfjg==
X-CSE-MsgGUID: eNbQ7715TzmD2/uQ4xaU6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950037"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="104950037"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:55 -0700
X-CSE-ConnectionGUID: Rf3Pr5QqRYuYJBXcu3DyaQ==
X-CSE-MsgGUID: wEYGsCgQQTCcATtIuKq7iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="234691058"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:53 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 17/25] lib/kms: Add helpers to query igt_format_mods
Date: Tue, 12 May 2026 15:21:35 +0300
Message-ID: <20260512122143.11013-18-ville.syrjala@linux.intel.com>
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

Add three new helpers for igt_format_mods:
- igt_format_mods_has_format_and_modifier()
- igt_format_mods_has_format()
- igt_format_mods_has_modifier()

These should be useful to some tests, avoiding for the tests
to iterate the igt_format_mods directly.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 32 ++++++++++++++++++++++++++++++--
 lib/igt_kms.h |  8 ++++++++
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b1ca3970bfc2..7550600bbf5f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6285,8 +6285,8 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 	}
 }
 
-static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
-						    uint32_t format, uint64_t modifier)
+bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
+					     uint32_t format, uint64_t modifier)
 {
 	uint32_t _format, _modifier;
 
@@ -6298,6 +6298,34 @@ static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods
 	return false;
 }
 
+bool igt_format_mods_has_format(const struct igt_format_mods *format_mods,
+				uint32_t format)
+{
+	uint32_t _format, _modifier;
+
+	for_each_format_and_modifier(format_mods, _format, _modifier) {
+		if (_format == format)
+			return true;
+		(void)_modifier;
+	}
+
+	return false;
+}
+
+bool igt_format_mods_has_modifier(const struct igt_format_mods *format_mods,
+				  uint64_t modifier)
+{
+	uint32_t _format, _modifier;
+
+	for_each_format_and_modifier(format_mods, _format, _modifier) {
+		if (_modifier == modifier)
+			return true;
+		(void)_format;
+	}
+
+	return false;
+}
+
 /**
  * igt_plane_has_format_mod:
  * @plane: Target plane
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 52a2865e9b9c..745c2b04198a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1200,8 +1200,16 @@ bool igt_connector_event_detected(struct udev_monitor *mon, uint32_t conn_id,
 void igt_flush_uevents(struct udev_monitor *mon);
 void igt_cleanup_uevents(struct udev_monitor *mon);
 
+bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
+					     uint32_t format, uint64_t modifier);
+bool igt_format_mods_has_format(const struct igt_format_mods *format_mods,
+				uint32_t format);
+bool igt_format_mods_has_modifier(const struct igt_format_mods *format_mods,
+				  uint64_t modifier);
+
 bool igt_display_has_format_mod(igt_display_t *display, uint32_t format, uint64_t modifier);
 bool igt_plane_has_format_mod(igt_plane_t *plane, uint32_t format, uint64_t modifier);
+bool igt_plane_has_modifier(igt_plane_t *plane, uint64_t modifier);
 
 /**
  * igt_vblank_after_eq:
-- 
2.52.0

