Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764DECD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2752C10EA89;
	Tue, 12 May 2026 12:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPlO2ez/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83A810E1D3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588550; x=1810124550;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=c9SGEYgTWVkBla2zS+TqLN8yFxBykXnw+iNf3rFB1+s=;
 b=KPlO2ez/i5QywSLZFIwMIiSutTntSHYXQ9fs2AukhJbaDH0B03aVrKao
 XFognZmWxn3fNl88L80Fh7amnH8R6dxBkEPkg0jLXoD1ZarfaBtOTrhia
 qdPiKjKNaDPGJI4vC1Iq+yGaZZMpsFq4OKj11DS78aanrhUV/ZFysmvF8
 Tg7GISFC/anx+GTDipkmYLZoXtCMCtIbrAyIYXhc5jJi9gUrFOAjWHnw9
 DSCZUhr/1xcUYJ+4rhB+xW6z8kNGuVw+7eN/SsGo7mGQ2SUPBMkn9kBfM
 w8bJORVMINTQN3ShIc/4Gxsx/irvl0n3Hy8Ga3LFX24QDRlEHzTrWfpeV Q==;
X-CSE-ConnectionGUID: PgAe+WyQRHmR90llp5g0mg==
X-CSE-MsgGUID: U7LVWtolTL2aiLu2L2oPvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78641381"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="78641381"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:30 -0700
X-CSE-ConnectionGUID: 2oOcBXJ8TwSXQsA1njPBsw==
X-CSE-MsgGUID: 8IP09I4nRiOLlI0W8ZVllw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="261502753"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:29 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/25] lib/kms: Move and rename
 igt_count_display_format_mod()
Date: Tue, 12 May 2026 15:21:29 +0300
Message-ID: <20260512122143.11013-12-ville.syrjala@linux.intel.com>
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

igt_count_display_format_mod() is a tightly coupled counterpart
of display_format_mods_union(). They both have to implement the
exact same loop over crtcs+planes or things will fall apart.

Move the pair next to each other and name them similarly to keep
the relationship clear.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index ac0917d907a0..0d604bc76910 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6299,23 +6299,6 @@ bool igt_plane_has_format_mod(igt_plane_t *plane, uint32_t format,
 						       format, modifier);
 }
 
-static int igt_count_display_format_mod(igt_display_t *display)
-{
-	igt_crtc_t *crtc;
-	int count = 0;
-
-	for_each_crtc(display, crtc) {
-		igt_plane_t *plane;
-
-		for_each_plane_on_crtc(crtc,
-				       plane) {
-			count += plane->format_mods.count;
-		}
-	}
-
-	return count;
-}
-
 static void
 format_mods_append(struct igt_format_mods *format_mods,
 		   uint32_t format, uint64_t modifier)
@@ -6344,6 +6327,21 @@ format_mods_union(struct igt_format_mods *format_mods_dst,
 				   format_mods_src->modifiers[i]);
 }
 
+static int display_format_mods_count(igt_display_t *display)
+{
+	igt_crtc_t *crtc;
+	int count = 0;
+
+	for_each_crtc(display, crtc) {
+		igt_plane_t *plane;
+
+		for_each_plane_on_crtc(crtc, plane)
+			count += plane->format_mods.count;
+	}
+
+	return count;
+}
+
 static void display_format_mods_union(igt_display_t *display,
 				      struct igt_format_mods *format_mods)
 {
@@ -6359,7 +6357,7 @@ static void display_format_mods_union(igt_display_t *display,
 
 static void igt_fill_display_format_mod(igt_display_t *display)
 {
-	int count = igt_count_display_format_mod(display);
+	int count = display_format_mods_count(display);
 
 	if (!count)
 		return;
-- 
2.52.0

