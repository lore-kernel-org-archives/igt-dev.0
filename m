Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3690FF3C26D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 14:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE3610E4FA;
	Mon,  9 Mar 2026 14:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5O3aMKQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A34610E4FA
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 14:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773066143; x=1804602143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dxuMW6eiuQtWHQ9Lf/nV0GpXZPe7Q3oHjK1MUYzl0NA=;
 b=f5O3aMKQLz4ffx+5+1bNV1VgMR+gNly9o82g8r3DWm5TuypkpA6FefGs
 OenMhFgpVZhLm0zo3nrsVXjaKb39XVbRNWFej3DUOstvVg1xky42D5HMK
 1wKkfJfnmkZFefeDcBZps/zx8XKZjwRCCa0wkyfJXmoXrZP2Yq04/Jz+o
 mMli7YnnGyThwBWwGqsesTQzfm9jBgauFPhOipgUKfLj2QxRhVTy6SL27
 1w0qxCteVezSnWst6tzBrL0iayb3D58P+QRZkOBY7IRRDnG2hLmbvpdh5
 uz+0edYMNE8d7uriG3KCsORxDz+wrDUG9PPotw5yhUNCMUnavOF4XNReR A==;
X-CSE-ConnectionGUID: 1kENvnilRHeWsnxTslTppw==
X-CSE-MsgGUID: cLuMZNt+RAytb0atPwbx0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="91660511"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="91660511"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:23 -0700
X-CSE-ConnectionGUID: 3thzwJVQSx2GP+QRjceWsQ==
X-CSE-MsgGUID: r/edR0W3TkS+xRsih58+LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="250241367"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 06/10] tests/kms_pipe_crc_basic: use CRTC indexes
 instead of pipes for CRTC tracking
Date: Mon,  9 Mar 2026 16:21:40 +0200
Message-ID: <179575cea3bb0e5c1542540a12fa61580062cdab.1773066012.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773066012.git.jani.nikula@intel.com>
References: <cover.1773066012.git.jani.nikula@intel.com>
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

The test tracks	"active" CRTCs in a dedicated array. This does not
depend on pipes in any way. Switch to using CRTC indexes instead.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_pipe_crc_basic.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 207707ff2e2d..42e1415452f4 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -78,8 +78,8 @@
  */
 
 static bool extended;
-static enum pipe active_pipes[IGT_MAX_PIPES];
-static uint32_t last_pipe;
+static int active_crtcs[IGT_MAX_PIPES];
+static uint32_t last_crtc_index;
 
 typedef struct {
 	int drm_fd;
@@ -99,8 +99,8 @@ static struct {
 static bool simulation_constraint(igt_crtc_t *crtc)
 {
 	if (igt_run_in_simulation() && !extended &&
-	    crtc->pipe != active_pipes[0] &&
-	    crtc->pipe != active_pipes[last_pipe])
+	    crtc->crtc_index != active_crtcs[0] &&
+	    crtc->crtc_index != active_crtcs[last_crtc_index])
 		return true;
 
 	return false;
@@ -392,7 +392,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			"Hang test for pipe CRC read." },
 	};
 	int i;
-	last_pipe = 0;
+	last_crtc_index = 0;
 
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -409,8 +409,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 		/* Get active pipes. */
 		for_each_crtc(&data.display, crtc)
-			active_pipes[last_pipe++] = crtc->pipe;
-		last_pipe--;
+			active_crtcs[last_crtc_index++] = crtc->crtc_index;
+		last_crtc_index--;
 	}
 
 	igt_describe("Tests error handling when the bad source is set.");
-- 
2.47.3

