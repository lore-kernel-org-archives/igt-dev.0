Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF8AF531F1
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F2F10E072;
	Tue, 14 Apr 2026 07:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLgke/ez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7327510E584
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150903; x=1807686903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VZQXoYs8C4TS7wjeRjGkEsTVcce6r9z6zX5jq9Fh96M=;
 b=iLgke/ezV5hKKNFNaXyDSGouyjPosCid/ditVaNLqv4Hhx0Tsg7y/+U8
 xLGTECZTJsFRLRDLYyVL1uA/TyrwCnIU4VikTIOept8XuATn6ukfVD7sm
 yY9U9FloXttaXprNnadfWUfNGf76INMlqGakL+ZYIKKwjlOTWYj7HsizL
 Ftcxa+4YhDenyUMpBBVJThxFUYXQRrDKVjAPWLVfWrHoB53K5cYWSf3kS
 cuU5tXVUE/w1vfn8SV4ECACloXDAEHDoMJD9yOVx1h8nXe2jDl+6vHtr5
 8QZ5xGqsMpI7olyGZpueJjV/RDkwzzWgw4hufjg2/U2eHMkooUlQ/QCCf A==;
X-CSE-ConnectionGUID: 3q7XBZSbRHqTks56gTMzkw==
X-CSE-MsgGUID: /w0zA6uASoWsZeuLADSnew==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="102555752"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="102555752"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:03 -0700
X-CSE-ConnectionGUID: eco2luOITq+uYrLXPyW+Dw==
X-CSE-MsgGUID: WgUimN0yS/mPAhjj4mI/zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234046945"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 04/16] lib/kms: rename struct igt_display to _igt_display
Date: Tue, 14 Apr 2026 10:14:24 +0300
Message-ID: <ebfb243ade55da5e4c38d15e991be59436311633.1776150714.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776150714.git.jani.nikula@intel.com>
References: <cover.1776150714.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Prefer igt_display_t over struct igt_display, and rename the struct to
avoid accidental use. The named struct is only needed for the typedef
declaration.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 2 +-
 lib/igt_kms.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2dbf9ec38458..2d758b63c043 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4012,7 +4012,7 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
 					   igt_crtc_t *crtc,
 					   bool fail_on_error)
 {
-	struct igt_display *display = primary->crtc->display;
+	igt_display_t *display = primary->crtc->display;
 	igt_output_t *output = igt_crtc_get_output(crtc);
 	drmModeModeInfo *mode;
 	uint32_t fb_id, crtc_id;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9b8614c4e6b8..2e2870854634 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -378,7 +378,7 @@ extern const char * const igt_plane_prop_names[];
  */
 extern const char * const igt_colorop_prop_names[];
 
-typedef struct igt_display igt_display_t;
+typedef struct _igt_display igt_display_t;
 typedef struct igt_crtc igt_crtc_t;
 typedef uint32_t igt_fixed_t;			/* 16.16 fixed point */
 
@@ -516,7 +516,7 @@ typedef struct {
 	igt_crtc_t *crtc;
 } igt_output_crtc_t;
 
-struct igt_display {
+struct _igt_display {
 	int drm_fd;
 	int log_shift;
 	int n_crtcs;
-- 
2.47.3

