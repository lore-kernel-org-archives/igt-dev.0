Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B949ECD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE9210EA82;
	Tue, 12 May 2026 12:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zg6S+riX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5933510E1D3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588543; x=1810124543;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+NXJJwArOcrJx0RhVBuG7oF0o4X4+HYTHoiQcXFVO8o=;
 b=Zg6S+riXzbfleUuaLKhXgucwr0dns4TLhUIlkEfmSNSu8pqdPtDyntNT
 aaQxVaFjTfk7zf41Y3qgfNO4aF+vdvPpkhEwGLUiKaH+KZ7KsRSual6Pi
 /L2PPtB9AsjsDphw+Fu3VRXOWP2jmhcebx1QNyOj3V7u521koXn5OvBEe
 fPyNtpi16TgH2WlK2+wpqYTOQL2ubmp1kYpV6IZPqJ4cvZufHkVrZ8Wvz
 6z8/IOQ7LVgL5rWyKOVJ88A2xkAgdOShMGItWlb5fzX1Ac0oSPfcZ9Cjm
 4nu+dPrp1STKE2IFa3Rl82YgD+5kja5RELngLJWXG5H5PdS4CTvU3WtDQ A==;
X-CSE-ConnectionGUID: CNRg7EhKRISpF7bQz2h1Aw==
X-CSE-MsgGUID: ZAcvaDIPSz2aD7nxydHxDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78641367"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="78641367"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:23 -0700
X-CSE-ConnectionGUID: rEkkr6ivT/mStfNu5EVscw==
X-CSE-MsgGUID: keTChcgHTfmmLEKf0BJmIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="261502729"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:22 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/25] lib/kms: Extract format_mods_union()
Date: Tue, 12 May 2026 15:21:27 +0300
Message-ID: <20260512122143.11013-10-ville.syrjala@linux.intel.com>
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

Extract format_mods_union() from inside igt_fill_display_format_mod()
to make the whole thing a bit more abstract and easier to understand.

Rename igt_add_display_format_mod() to format_mods_append() while
at it to keep things a bit shorted. This is all internal stuff to
lib/kms anyway so we don't the full namespace.

The assert needs to be moved out of the loop to avoid having to pass
the upper bound 'count' into format_mods_union(). That seems fine
as the assert will still catch any mistakes, assuming the didn't
already cause a segfault while filling the arrays.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f1a783aee6dd..2f23d988438d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6334,6 +6334,16 @@ format_mods_append(struct igt_format_mods *format_mods,
 	format_mods->count++;
 }
 
+static void
+format_mods_union(struct igt_format_mods *format_mods_dst,
+		  const struct igt_format_mods *format_mods_src)
+{
+	for (int i = 0; i < format_mods_src->count; i++)
+		format_mods_append(format_mods_dst,
+				   format_mods_src->formats[i],
+				   format_mods_src->modifiers[i]);
+}
+
 static void igt_fill_display_format_mod(igt_display_t *display)
 {
 	int count = igt_count_display_format_mod(display);
@@ -6356,12 +6366,8 @@ static void igt_fill_display_format_mod(igt_display_t *display)
 
 		for_each_plane_on_crtc(crtc,
 				       plane) {
-			for (int i = 0; i < plane->format_mods.count; i++) {
-				format_mods_append(&display->format_mods,
-						   plane->format_mods.formats[i],
-						   plane->format_mods.modifiers[i]);
-				igt_assert_lte(display->format_mods.count, count);
-			}
+			format_mods_union(&display->format_mods, &plane->format_mods);
+			igt_assert_lte(display->format_mods.count, count);
 		}
 	}
 }
-- 
2.52.0

