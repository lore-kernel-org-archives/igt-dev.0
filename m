Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67E2ECD6C5
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9728310E62C;
	Wed, 11 Feb 2026 16:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUCjjesh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDA310E62C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827669; x=1802363669;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=k0ucNQ3LNzCbxtFHBHjITedOoWx7sTwfhqjXmsToYZE=;
 b=hUCjjeshO109Y7G82oG09auV5xxypGagEtZhdZ3FOZOw89aKxXM9ZO9q
 sSwzcTsRUGJjPzaLbJYtsMYjTA3vfiWASOy7zf5D8ZBLcSbNYHE8NLwNR
 4wHVHMM3bN9Fpi7obPQfT+TNHcqg3xXNvIf8tPP9WCHwO1EhoApKql0MF
 wbQYEUGNHUaJjodbidnVwxbSRs7vkJhAMyTmgn8OdiR8v4khzDNMHReA2
 gXH8nxmdUGOlx8vDlLFJjsrZqWU28Y2k4nPrBxCChbvYWOL2wpdptj033
 /KqMCNgkAJYysEoGjrRUwqBzVyc8y6b4Iy5wBWQT/qPGAiNVvKJACCB4K g==;
X-CSE-ConnectionGUID: 27AIc1n1R/GpiJbxjNWrqQ==
X-CSE-MsgGUID: NuOXKav4TlGsey1uVhIDdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83082179"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="83082179"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:29 -0800
X-CSE-ConnectionGUID: Bsn6Ra1gSAydIIulNvCbCQ==
X-CSE-MsgGUID: oNQoD1a7QnWisfdTaImUvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="211405379"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:28 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/17] tests/kms_atomic_interruptible: s/crtc/drm_crtc/
Date: Wed, 11 Feb 2026 18:33:52 +0200
Message-ID: <20260211163404.2018-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
References: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
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

Change the name of the 'struct drm_mode_crtc' typed variable
from 'crtc' to 'drm_crtc'. This leaves the 'crtc' name available
for an upcoming 'igt_crtc_t' typed variable.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_atomic_interruptible.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 9ff43ef4a868..4b29a196d807 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -177,7 +177,7 @@ static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t
 	igt_while_interruptible(true) {
 		switch (test_type) {
 			case test_legacy_modeset: {
-				struct drm_mode_crtc crtc = {
+				struct drm_mode_crtc drm_crtc = {
 					.set_connectors_ptr = (uint64_t)(uintptr_t)&output->id,
 					.count_connectors = 1,
 					.crtc_id = primary->crtc->crtc_id,
@@ -186,7 +186,7 @@ static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t
 					.mode = *(struct drm_mode_modeinfo*)mode,
 				};
 
-				do_ioctl(display->drm_fd, DRM_IOCTL_MODE_SETCRTC, &crtc);
+				do_ioctl(display->drm_fd, DRM_IOCTL_MODE_SETCRTC, &drm_crtc);
 				break;
 			}
 			case test_atomic_modeset: {
-- 
2.52.0

