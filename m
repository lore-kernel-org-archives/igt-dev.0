Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F702D2D0E3
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 12:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D354710E337;
	Tue, 13 Jan 2026 12:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsUgX4bI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEFE10E4BB
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768305909; x=1799841909;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5GKCqkQ4K602L3wqZnXJiDDHyFzJYMefHYReMqPHIsY=;
 b=ZsUgX4bIxey8COFfN+4BQHJRzl4G7XFbpSwmwor1SNT4qSbLLOxZdbTu
 VLi68usM5mD9VoaRqaZc9UL5ql1+raPeP2trDhbqsP7S5Cff1gTlj2AMN
 Nyif1Rml7hyZ5Ru7VYWFNIyWUBiZ0YD+05nubfkIO445Jg3ldkKhJuCCD
 gTlxH8HzhjLY8hIPUgQ53NyhtYuUvi3rHUThMzLS1irZjrvnVMmdqR02C
 djT7G5KoCuXBCsb/VDvnyidetIKEGbuKSRYkYjWHjPEWTVNSIGAA3mWRx
 jiI/1NIpQJJt3weh88G/XdCLe3A6hBRb38rjvvRLvrNtaR6KhnfpDb5qI Q==;
X-CSE-ConnectionGUID: iD3XcTZ+RKye85vGsxb0YA==
X-CSE-MsgGUID: 9beCwmAiTS2biF6Eo5yWxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="92256395"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="92256395"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:05:09 -0800
X-CSE-ConnectionGUID: WfAzLtgLSVyofocngsG+uw==
X-CSE-MsgGUID: x+GIW2nPSk6F82cWE+O2Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208835981"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.124.220.52])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:05:07 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 7/8] tests/intel/kms_pipe_stress: Eliminate double
 display.drm_fd initialization
Date: Tue, 13 Jan 2026 14:04:38 +0200
Message-ID: <20260113120439.12577-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
References: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
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

Stop initializing display.drm_fd twice. The first one
is done explicitly and the second time is done by
igt_display_require(). Just rely on igt_display_require().

Note that a bunch of other tests do still do something similar
by completely omitting the local fd varaible/member and just
using display.drm_fd everywhere. It's a somewhat strange way
to do things, but I decided to leave those alone at least for
now.

Done with cocci:
 #include "scripts/iterators.cocci"

@@
expression DISPLAY;
expression FD, E;
@@
- FD = DISPLAY.drm_fd = E;
+ FD = E;
...
(
igt_display_require(&DISPLAY, FD)
|
igt_display_require(&DISPLAY,
-	DISPLAY.drm_fd
+	FD
	)
)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_pipe_stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index e8e01556ba25..33ccac9fcee3 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -862,11 +862,11 @@ int igt_main() {
 	uint8_t format_idx = 0, tiling_idx = 0;
 
 	igt_fixture() {
-		data.drm_fd = data.display.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&data.display, data.display.drm_fd);
+		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
 		igt_display_require_output(&data.display);
 		data.devid = intel_get_drm_devid(data.drm_fd);
-- 
2.51.2

