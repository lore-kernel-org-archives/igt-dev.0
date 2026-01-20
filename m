Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A68CA5FAF
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 17:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5F210E639;
	Tue, 20 Jan 2026 17:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQV/B7LC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6360E10E639
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 17:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768929469; x=1800465469;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kiVOgbovQkdAuk4aCCAD8mDLOXz0go3QoSiX1U4YN48=;
 b=OQV/B7LCvHQXXTZUrMjeepM9LjNW+73Yr4ar1ZF8FRHIVkCyWuCV9J7c
 BVOjFjCqZnpfK8QeNKO26WaDGSl95zT7+K7+l+v8SlXYHxR/vP2ff//O+
 ifxPF0uD3aaJ5l1V7Fp4o4jVXnd9s8LgQY75/NfFU3kFuwB5UsAZJcKm9
 bBRN/Uirx5o2wcbsWfiAQaiCVyrfSNxiGBgL5f0BYddnJxLJ7sa3hzFxd
 gGGgj/9cebTNZ1lyfRnC9+cR5mMjxoVpw1IVpveV3eo4ZGzsnVOMsM1qK
 6aXE5O3mMM7IPCaTcjKEnWbQ70JJpSdKJeu1lQVRQlvSyZWEjYvJeEQL4 Q==;
X-CSE-ConnectionGUID: e0O6sEiJTyuMhGiwbuMMRQ==
X-CSE-MsgGUID: ek2CSWlYS5SrzkHwAqtOIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81519261"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="81519261"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:49 -0800
X-CSE-ConnectionGUID: NklR54txTSep+gd7y7yUsw==
X-CSE-MsgGUID: 5wChNhmuQc2C0hygiH3aNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="205798579"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:48 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/12] lib/kms: Use igt_crtc_crc_new() even more
Date: Tue, 20 Jan 2026 19:16:55 +0200
Message-ID: <20260120171656.15840-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
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

Switch a few more igt_pipe_crc_new() uses over to
igt_crtc_crc_new(). These weren't caught by the previous
attempts and I the semantic patches were already getting
far too messy, so take care of these separately.

 #include "scripts/iterators.cocci"

@find@
identifier FD;
identifier DISPLAY;
@@
igt_display_require(&DISPLAY, FD);

@depends on find@
typedef igt_display_t;
identifier FUNC, DISPLAY, find.FD;
expression PIPE;
@@
FUNC(..., igt_display_t *DISPLAY ,...)
{
<...
- igt_pipe_crc_new(FD, PIPE
+ igt_crtc_crc_new(igt_crtc_for_pipe(DISPLAY, PIPE)
	,...)
...>
}

@depends on find@
typedef igt_display_t;
identifier DISPLAY, find.FD;
expression PIPE, E;
@@
 igt_display_t *DISPLAY = E;
<...
- igt_pipe_crc_new(FD, PIPE
+ igt_crtc_crc_new(igt_crtc_for_pipe(DISPLAY, PIPE)
	,...)
...>

@depends on find@
identifier find.FD;
identifier find.DISPLAY;
expression PIPE;
@@
- igt_pipe_crc_new(FD, PIPE
+ igt_crtc_crc_new(igt_crtc_for_pipe(&DISPLAY, PIPE)
	,...)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_draw_crc.c | 3 ++-
 tests/intel/xe_pat.c       | 3 ++-
 tests/kms_prime.c          | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index 6f9786ba2454..26bd1fbb1961 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -104,7 +104,8 @@ static void find_modeset_params(void)
 			continue;
 
 		mode = igt_output_get_mode(output);
-		pipe_crc = igt_pipe_crc_new(drm_fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+		pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&display, pipe),
+					    IGT_PIPE_CRC_SOURCE_AUTO);
 		/*Only one pipe/output is enough*/
 		break;
 	}
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index a7f8ab088d72..24339f688ce6 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -936,7 +936,8 @@ static void display_vs_wb_transient(int fd)
 			continue;
 
 		mode = igt_output_get_mode(output);
-		pipe_crc = igt_pipe_crc_new(fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+		pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&display, pipe),
+					    IGT_PIPE_CRC_SOURCE_AUTO);
 		break;
 	}
 
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index f443e9838a2b..f51c463211f4 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -401,7 +401,7 @@ static void test_crc(int exporter_fd, int importer_fd)
 	output = setup_display(importer_fd, &display, &pipe);
 
 	mode = igt_output_get_mode(output);
-	pipe_crc = igt_pipe_crc_new(importer_fd, pipe,
+	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&display, pipe),
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	for (i = 0; i < ARRAY_SIZE(colors); i++) {
-- 
2.52.0

