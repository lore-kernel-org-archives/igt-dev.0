Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF52FCD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:24:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD6610EA7F;
	Tue, 12 May 2026 12:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaLBC5ZD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CCD10E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588539; x=1810124539;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pCl9l+ZZD0MAvZePFhlAqdU8Vy60j/WzyRWW5Lb+QSY=;
 b=VaLBC5ZDua9yT8wvSLup44/4xatYmtkb13tdFREcUo2oDd74w1UWp3yi
 oUSdFgQVgKLQMRbnczaXtxJCTt2cMJ8+n/5bRkwT2gEKf7zz1brg8iePx
 GDgEhVEeDBI9Uc1j6G281AffI6srhyV5MgaYkqhGUZD4+K0gIRjn78pGu
 n8zQzPgSoPUuaeCihSTyRGzeAjsP17Q8Rg0LP2KBEPciJn9WYOKWQ/c0X
 cCTmpRSfqc/rX6wg3Pkxy+s2H2e7igkJuaEO6bpS4BBBjM4ljUB04JzpE
 R/7Kq1JRJQFC9gdl52WpepfGPuWhLrkR6+TZMykglZqK4N7eTnBeHPQZE g==;
X-CSE-ConnectionGUID: AWAaZ5Q3SsyCopN2HSU2cw==
X-CSE-MsgGUID: WjFkbar2RsCYZb37BaOoZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79525702"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79525702"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:19 -0700
X-CSE-ConnectionGUID: PXziuH8mSqe/7ELPJeKXSA==
X-CSE-MsgGUID: MqvKw9D4T36mFd2upklzAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="235091434"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:18 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/25] lib/kms: Pass target format_mods to
 igt_add_display_format_mod()
Date: Tue, 12 May 2026 15:21:26 +0300
Message-ID: <20260512122143.11013-9-ville.syrjala@linux.intel.com>
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

Generalize igt_add_display_format_mod() into format_mods_append() that
can be used to add a format+mod into any struct igt_format_mods.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2a4e91d9ed7e..f1a783aee6dd 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6317,21 +6317,21 @@ static int igt_count_display_format_mod(igt_display_t *display)
 }
 
 static void
-igt_add_display_format_mod(igt_display_t *display, uint32_t format,
-			   uint64_t modifier)
+format_mods_append(struct igt_format_mods *format_mods,
+		   uint32_t format, uint64_t modifier)
 {
 	int i;
 
-	if (igt_format_mods_has_format_and_modifier(&display->format_mods,
+	if (igt_format_mods_has_format_and_modifier(format_mods,
 						    format, modifier))
 		return;
 
-	i = display->format_mods.count;
+	i = format_mods->count;
 
-	display->format_mods.formats[i] = format;
-	display->format_mods.modifiers[i] = modifier;
+	format_mods->formats[i] = format;
+	format_mods->modifiers[i] = modifier;
 
-	display->format_mods.count++;
+	format_mods->count++;
 }
 
 static void igt_fill_display_format_mod(igt_display_t *display)
@@ -6357,9 +6357,9 @@ static void igt_fill_display_format_mod(igt_display_t *display)
 		for_each_plane_on_crtc(crtc,
 				       plane) {
 			for (int i = 0; i < plane->format_mods.count; i++) {
-				igt_add_display_format_mod(display,
-							   plane->format_mods.formats[i],
-							   plane->format_mods.modifiers[i]);
+				format_mods_append(&display->format_mods,
+						   plane->format_mods.formats[i],
+						   plane->format_mods.modifiers[i]);
 				igt_assert_lte(display->format_mods.count, count);
 			}
 		}
-- 
2.52.0

