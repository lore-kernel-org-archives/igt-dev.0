Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0EFF3C269
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 14:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE04710E4FA;
	Mon,  9 Mar 2026 14:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ee4owTHf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D284510E50A
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 14:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773066137; x=1804602137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SROLwkLU6hIe/eglqt0iqXHW0KpafCS9pnquurCeliU=;
 b=Ee4owTHfUa4RzqST3Vr7hnUaetoRVfxHkvf68iLq3zMFnt/wmldnsDKb
 WLuSB8yCgJaPahMZVw57pc8+KT5mMfGnm/enlFunY0YLUDDN3As+h4vfR
 nJnz/+ik+rToCfpJZOTzn9jxMU4s1Y9eGV0efbfnfEJPK5XJQjOOiy1CP
 J3DVLoajlMIVCIzTuLXNGb0z8H34unLRVD0olQzeVDhs2tSzHbRnxCq6r
 enTEwaabW1TqppM4rw1pxDsb5kYKZbmMynxw/oorcugmbbsREOEBvrG6C
 YfBgD6BS2GKbxEPoh9y3AdWRSbyOjW+XGQ5d14XBIV1TRBmt+7LFk34U9 Q==;
X-CSE-ConnectionGUID: PfQFzKSXR1qUgokv8ubymw==
X-CSE-MsgGUID: 4g/Aji+ASfeZmxj9xZMpLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="61659536"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="61659536"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:16 -0700
X-CSE-ConnectionGUID: eLZnUtYwT1KjUMjMGLeQXA==
X-CSE-MsgGUID: S64YLrRpQYKMvXRsqiMeBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224211909"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 05/10] tests/kms_cursor_edge_walk: use CRTC indexes
 instead of pipes for CRTC tracking
Date: Mon,  9 Mar 2026 16:21:39 +0200
Message-ID: <c95cad26d78f52c2102a9bdedeb4062af5257f21.1773066012.git.jani.nikula@intel.com>
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
 tests/kms_cursor_edge_walk.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 08c9de601ce3..8036d43d5eef 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -87,8 +87,8 @@ enum {
 };
 
 static bool extended;
-static enum pipe active_pipes[IGT_MAX_PIPES];
-static uint32_t last_pipe;
+static int active_crtcs[IGT_MAX_PIPES];
+static uint32_t last_crtc_index;
 
 static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 {
@@ -377,10 +377,10 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		kmstest_set_vt_graphics_mode();
 
 		/* Get active pipes. */
-		last_pipe = 0;
+		last_crtc_index = 0;
 		for_each_crtc(&data.display, crtc)
-			active_pipes[last_pipe++] = crtc->pipe;
-		last_pipe--;
+			active_crtcs[last_crtc_index++] = crtc->crtc_index;
+		last_crtc_index--;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
@@ -397,8 +397,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 								 crtc,
 								 data.output) {
 					data.crtc = crtc;
-					if (!extended && crtc->pipe != active_pipes[0] &&
-					    crtc->pipe != active_pipes[last_pipe])
+					if (!extended && crtc->crtc_index != active_crtcs[0] &&
+					    crtc->crtc_index != active_crtcs[last_crtc_index])
 						continue;
 
 					igt_display_reset(&data.display);
-- 
2.47.3

