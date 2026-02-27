Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E79FD530E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A8D10EA52;
	Fri, 27 Feb 2026 08:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2x29w7C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F1910EA52
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179643; x=1803715643;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gX+SeZxFjfLXdGAcYUb4p++eiOroon0jfMbvrcGy0pY=;
 b=Q2x29w7Cqzt9aT6LMjf8Tc26EdoF1kBE1PJtmp3f043oeDYgEQWOufPH
 apdkaBA8HyUy0skXQ+PeKOx9g2FG105u8/VAopdraKApd1bGapvppaNvO
 XF/pOnUnKDCBYJCjbeStyy33P2vdi6TlnWKaleKYYG8xSvFwA/ilU3mHo
 ueFWaJtcNATlw6Rsuf1LaBZ6our03i6bo1EH4WbXJ/GFHlfmkiN7tNmtl
 FpqykNuDBBVwnWdv6kHnimg9qNoYfozQx1CEXVC/kgLIJHR+QbMVP+3lu
 NaxQJbb6/FMvvZCHOxoFwYhATj6q9AGTIE4M/kw3N/3+d/OWovV4OrDp6 g==;
X-CSE-ConnectionGUID: X4rB+Y1lRLe+K64+W/k9Ug==
X-CSE-MsgGUID: /iDrll7eTrOwnDhwRoXC9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="98727100"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="98727100"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:22 -0800
X-CSE-ConnectionGUID: GM6EBbE6R1KXhHKpxVtLug==
X-CSE-MsgGUID: SP0StrWYSFKnLxwhkKptiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="216065780"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:21 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/17] tests/kms: Clean up crtc->pipe comparions
Date: Fri, 27 Feb 2026 10:06:42 +0200
Message-ID: <20260227080653.30389-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
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

Change a few leftover crtc->pipe comparisons to
just compare the crtc pointers instead.

 #include "scripts/iterators.cocci"

@@
typedef igt_crtc_t;
igt_crtc_t *CRTC1;
igt_crtc_t *CRTC2;
binary operator OP = { ==, != };
@@
- CRTC1->pipe OP CRTC2->pipe
+ CRTC1 OP CRTC2

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_display_modes.c  | 2 +-
 tests/kms_plane_multiple.c | 2 +-
 tests/kms_tiled_display.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 6c17f002d8c8..18582cf1500c 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -201,7 +201,7 @@ static void run_extendedmode_test(data_t *data) {
 					      output1) {
 
 			for_each_crtc(display, crtc2) {
-				if (crtc->pipe == crtc2->pipe)
+				if (crtc == crtc2)
 					continue;
 
 				for_each_valid_output_on_crtc_local(display, crtc2,
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 660283df751d..d8a32d9526ad 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -548,7 +548,7 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 					      crtc,
 					      output1) {
 			for_each_crtc(display, crtc2) {
-				if (crtc->pipe == crtc2->pipe)
+				if (crtc == crtc2)
 					continue;
 
 				for_each_valid_output_on_crtc_local(display, crtc2,
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 8aae2bcaadba..95e45ed416d1 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -237,7 +237,7 @@ static void setup_mode(data_t *data)
 
 			if (count > 0) {
 				for (prev = count - 1; prev >= 0; prev--) {
-					if (crtc->pipe == conns[prev].crtc->pipe) {
+					if (crtc == conns[prev].crtc) {
 						pipe_in_use = true;
 						break;
 					}
-- 
2.52.0

