Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4A3E66884
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 20:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC0D10F0AA;
	Fri, 19 Dec 2025 20:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dt3nAfKq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169AE10F0AC
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 20:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766176443; x=1797712443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=irlA9ueY4VSp1sNTiZig4leGT0WSJzL3/B0Mgx+cd5A=;
 b=dt3nAfKqJMyMhf75WZtH7XcM0hk2pHz0pZvoleeQzPbNDBKPxBJc971D
 6/71e72GXCfKhzBcYxpNeZ5NGeg+/G5AaIIJ3YICrY6zRYO2mwHaUrQqc
 BcVdGjdTYNA24b7OJi799v2TlSB4nb9VSDK6Q0euiGlK6JHY4d/McJq5I
 h7n52wx64bxOmGV+4WRc7teWuuGioODYIW7IbI45LF3MMEqzfhzQvED1A
 +o+pQj8jeeocUB1uKA0dV0o/qraWkZY01Iwd8Al96cjWvLX7+4PkaAdm7
 9h+LfnsTOf8MJLB97/TH7i8ISxGMq8FCJafeRJdeyns5E0WnOCINAAbSY g==;
X-CSE-ConnectionGUID: NtjfMJkgRqO26JCigf1+4g==
X-CSE-MsgGUID: S7DN01yvRvKi8QXSPd3vlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68034139"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68034139"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:34:03 -0800
X-CSE-ConnectionGUID: 8YXcy4GvRWugMZ9xLu3lXQ==
X-CSE-MsgGUID: oQjs8vboSNyEEA/+n088iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="222367582"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO localhost)
 ([10.124.220.15])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:34:02 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 08/11] lib/kms: Use '{old,
 new}_primary' variable names in plane swapping
Date: Fri, 19 Dec 2025 22:33:24 +0200
Message-ID: <20251219203327.16573-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251219203327.16573-1-ville.syrjala@linux.intel.com>
References: <20251219203327.16573-1-ville.syrjala@linux.intel.com>
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

Make the primary plane swapping a bit less confusing by
renaming the variables to '{old,new}_primary'

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2b805261e4ef..418fbb104a89 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3022,10 +3022,10 @@ void igt_display_reset_outputs(igt_display_t *display)
 		output = igt_get_single_output_for_pipe(display, i);
 
 		if (pipe->num_primary_planes > 1) {
-			igt_plane_t *primary = &pipe->planes[0];
-			igt_plane_t *assigned_primary =
+			igt_plane_t *old_primary = &pipe->planes[0];
+			igt_plane_t *new_primary =
 				igt_get_assigned_primary(output, pipe);
-			int assigned_primary_index = assigned_primary->index;
+			int new_primary_index = new_primary->index;
 
 			/*
 			 * If the driver-assigned primary plane isn't at
@@ -3034,11 +3034,11 @@ void igt_display_reset_outputs(igt_display_t *display)
 			 *
 			 * This way, the primary plane is always at index 0.
 			 */
-			if (assigned_primary_index != 0) {
-				assigned_primary->index = 0;
-				primary->index = assigned_primary_index;
+			if (new_primary_index != 0) {
+				new_primary->index = 0;
+				old_primary->index = new_primary_index;
 
-				igt_swap(pipe->planes[assigned_primary_index],
+				igt_swap(pipe->planes[new_primary_index],
 					 pipe->planes[0]);
 			}
 		}
-- 
2.51.2

