Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1427CCD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36F110E0E5;
	Tue, 12 May 2026 12:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uh+3mriJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0226810E1D3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588547; x=1810124547;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YUgOtjD1wOe+aN2YtlQ2CnZjO8y9Cpx0GPkDLG85rUw=;
 b=Uh+3mriJf1ygc02dPhYK3xR8UB/KPbGI7/trBwngH/k1tJQAI7XS57qS
 uGEBRCRL5ZP23R1C4xmMIkLhlu3KPHVu72L6z8L/rkbMumHa5OiRzZMKp
 6mdx/p0+sFgVvUznxUgZyw0GCi2L94g/2YAuY3BNqVUnAL+sXxVY6fGUx
 ujnKGQdq5QA0Pvt7wt4WEnjI3MCVeEvwaUQhnSdV7cd+ekJVdJugsqcBT
 bodqrRWheb3ZYEw39M87Nj+i2466KkvLurJUI2gdpJW/03R1sCEj3rwWe
 A7jPWlaEtA1V1ALKGY5c8wOcewuRhWSGdgghSBKausygs/6w1ilIpfoNA Q==;
X-CSE-ConnectionGUID: ki7IxhcFSKqTo3G3/s7Ldg==
X-CSE-MsgGUID: 1lov07fzR7eok9HPrxuccw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78641374"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="78641374"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:26 -0700
X-CSE-ConnectionGUID: NaxdOE6XTSiqJHrLCViz/w==
X-CSE-MsgGUID: cxljZumPR9G64DVxhmb0+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="261502740"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:25 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/25] lib/kms: Extract display_format_mods_union()
Date: Tue, 12 May 2026 15:21:28 +0300
Message-ID: <20260512122143.11013-11-ville.syrjala@linux.intel.com>
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

Extract the loop over crtc+planes from igt_fill_display_format_mod()
into display_format_mods_union() that can be used to fill any
format_mods struct with the union of the planes' format_mods.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2f23d988438d..ac0917d907a0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6344,10 +6344,22 @@ format_mods_union(struct igt_format_mods *format_mods_dst,
 				   format_mods_src->modifiers[i]);
 }
 
+static void display_format_mods_union(igt_display_t *display,
+				      struct igt_format_mods *format_mods)
+{
+	igt_crtc_t *crtc;
+
+	for_each_crtc(display, crtc) {
+		igt_plane_t *plane;
+
+		for_each_plane_on_crtc(crtc, plane)
+			format_mods_union(format_mods, &plane->format_mods);
+	}
+}
+
 static void igt_fill_display_format_mod(igt_display_t *display)
 {
 	int count = igt_count_display_format_mod(display);
-	igt_crtc_t *crtc;
 
 	if (!count)
 		return;
@@ -6361,15 +6373,9 @@ static void igt_fill_display_format_mod(igt_display_t *display)
 	 */
 	display->format_mods.count = 0;
 
-	for_each_crtc(display, crtc) {
-		igt_plane_t *plane;
+	display_format_mods_union(display, &display->format_mods);
 
-		for_each_plane_on_crtc(crtc,
-				       plane) {
-			format_mods_union(&display->format_mods, &plane->format_mods);
-			igt_assert_lte(display->format_mods.count, count);
-		}
-	}
+	igt_assert_lte(display->format_mods.count, count);
 }
 
 /**
-- 
2.52.0

