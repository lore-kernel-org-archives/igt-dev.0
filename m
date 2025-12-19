Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F64E6688C
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 20:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA79710F0AC;
	Fri, 19 Dec 2025 20:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJCBHdZc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1160010F0AC
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 20:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766176447; x=1797712447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SYyvZcfxPMlrYyCs7phurOP6QC/wM5mLQ2ybOTa0nls=;
 b=GJCBHdZcO+AIY7gmltHqiN7fzlJCCLfCKKDLvQfAt+BwqI73XNGNJiFk
 9HN+sb0iSdVdLRBB0LnyIvNjeK1ctgvoDo+WrHI0kQSBysW/NSyelOl56
 o6tXGkJmPY4Ks2c8aADecnERPJaho4/mrw7O8p9C6adBf0+Gb2Jcit1Tz
 oxpEe71OuI3ubtSCM+YQQnnqWbSiqDFCSyM6S2f3HPNcYS3gFBD/O7V4m
 T+ClGjCdHw7G+2eyRiqqZcZNnteqQmV7+Jr7CklUZsh/5wcDB2UXsSDyq
 0553+jTCK03Ipf/fDPXy+ENHfyr1XfvDI1F05BufQv3qr52sO/VaCTbcA g==;
X-CSE-ConnectionGUID: iNBdGGuwTPiWqx29Zsvacw==
X-CSE-MsgGUID: Vj9Q33y9Q7aK6frSjJdj1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68034140"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68034140"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:34:07 -0800
X-CSE-ConnectionGUID: IHveEBakRk6lcqy1+fBExA==
X-CSE-MsgGUID: piew/r6jSayn4d8ifyAE3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="222367589"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO localhost)
 ([10.124.220.15])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:34:06 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 09/11] lib/kms: Pimp the primary plane swapping
Date: Fri, 19 Dec 2025 22:33:25 +0200
Message-ID: <20251219203327.16573-10-ville.syrjala@linux.intel.com>
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

Do the primary plane swap a bit more cleanly with a pair of
igt_swap()s. And while at it sprinkle some asserts around
to make sure we didn't screw anything up.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 418fbb104a89..f38f3367958a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3025,7 +3025,6 @@ void igt_display_reset_outputs(igt_display_t *display)
 			igt_plane_t *old_primary = &pipe->planes[0];
 			igt_plane_t *new_primary =
 				igt_get_assigned_primary(output, pipe);
-			int new_primary_index = new_primary->index;
 
 			/*
 			 * If the driver-assigned primary plane isn't at
@@ -3034,12 +3033,21 @@ void igt_display_reset_outputs(igt_display_t *display)
 			 *
 			 * This way, the primary plane is always at index 0.
 			 */
-			if (new_primary_index != 0) {
-				new_primary->index = 0;
-				old_primary->index = new_primary_index;
+			if (new_primary->index != 0) {
+				igt_assert(old_primary != new_primary);
 
-				igt_swap(pipe->planes[new_primary_index],
-					 pipe->planes[0]);
+				igt_assert_eq(old_primary->index, 0);
+				igt_assert_neq(new_primary->index, 0);
+
+				igt_swap(*old_primary, *new_primary);
+				igt_swap(old_primary->index, new_primary->index);
+
+				igt_assert_neq(old_primary->index, 0);
+				igt_assert_eq(new_primary->index, 0);
+			} else {
+				igt_assert(old_primary == new_primary);
+
+				igt_assert_eq(old_primary->index, 0);
 			}
 		}
 	}
-- 
2.51.2

