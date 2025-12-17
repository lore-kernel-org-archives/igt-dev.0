Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB43D65C70
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 15:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E57210ED11;
	Wed, 17 Dec 2025 15:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNOufh6B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B7710ED11
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765985914; x=1797521914;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=O1dYqv++RkE7ZvGmN3j7xIpJ3CenqRkJ8avZFcqv5R0=;
 b=UNOufh6Bxh8gkv3PKpa62M2Fi7nEyLH+OU0Z/P1qhKyt+4Su6lhpb0Vr
 Ob1eeiwkgCwBt2xbqjkXdslk4lTrfRznFInFIgrdx/eOBbgDHhv4V47GC
 Pag99Y8SC73dxlgg2/+lhphe1ASSWph5HoVkNomx8p5R23bgH1f+4lRdp
 Lo4wCxP+FcPKJj75CeOOkFISCfZUvLMCDlx9AB46zZu8bemKv+207xj9Y
 TStsSU1f4yP9dKaNYm/U91EKwatbgwGd+lgGO9u5fnGxCnl8w7q33gc3p
 vXFQzH6Ahii1mZ4/nzimQ+qUVQpH43TdiEXXUKlqVdK4ON6ITnGySZwV6 g==;
X-CSE-ConnectionGUID: pP6ila1uQxSC1kl0HHq/Iw==
X-CSE-MsgGUID: QFFTC+vMQ7O9GsZZMHPPpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78235687"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="78235687"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:34 -0800
X-CSE-ConnectionGUID: UNWJs8dhQle9iyipXUaaew==
X-CSE-MsgGUID: q7geNQ15SvGpWQQ1PtP6tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="229013554"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:32 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/11] lib/kms: Pimp the priamry plane swapping
Date: Wed, 17 Dec 2025 17:37:55 +0200
Message-ID: <20251217153758.9369-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
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

Do the primary plane swap a bit more cleanly with a pair of
igt_swap()s. And while at it sprinkle some asserts around
to make sure we didn't screw anything up.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index ef3215332e29..69a430f01e21 100644
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

