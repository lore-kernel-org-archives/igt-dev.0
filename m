Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CF8E73140
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 08:24:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7782010E39F;
	Mon,  2 Feb 2026 08:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQRsRLEK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDF810E2DD
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 08:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770020666; x=1801556666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x5kC4Wm2xPGvNS+g561AFcJoCIlFT0oDbil6nN3xMBI=;
 b=mQRsRLEKo9ahGkcR4210EKNVEYZQK8F+YSb0WZosAJzUMLZE36YUUCSR
 6qrlR24kp+JQwGHYKw7W7tfd+Kdjs8p5utxnILYRBl09UcMLGu9+eyga0
 s3fmlzVTA760pDRiEvbyk3MiLIeva8SUJmPjENJ78/U4J+xGqce5WRPxv
 b5pzt9gHjRowTwSuNRSdKok+9d3/OKULDbjndcC5d+aUdIXx/9vnjkW1P
 zkI6QC0qtxAGVFbzZWpgjp9ZrTliiYsU/T4DEN2bZUd7jJfFUn7BQwLaN
 cPxRXBUVnOKWZokjqPLnwnramFNsTTFNHx9mKr4C6BP88CEouX46h6ozP g==;
X-CSE-ConnectionGUID: 7VhcmMqyQVu3RRppuxZEqw==
X-CSE-MsgGUID: g9V+yN2YTRukQ2+BYtF1zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="58756436"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="58756436"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:24:26 -0800
X-CSE-ConnectionGUID: yEOjKC7nRQ+fg2c4SwbqsA==
X-CSE-MsgGUID: spY79g2ARyuYei4Vb8xrEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209455094"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 00:24:26 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/6] tests/kms_pipe_crc_basic: Use cleanup framework for
 framebuffers
Date: Mon,  2 Feb 2026 14:15:36 +0530
Message-Id: <20260202084539.2524306-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260202084539.2524306-1-kunal1.joshi@intel.com>
References: <20260202084539.2524306-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
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

Register framebuffers with igt_cleanup_register_fb() after creation.
The exit handler will automatically clean up registered framebuffers
on test exit, including early exits from failures, skips, or assertions.

Remove manual igt_remove_fb() calls at end of test functions since
the cleanup framework handles this automatically.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_pipe_crc_basic.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index fb2f5f8eb..455b44d38 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -32,6 +32,7 @@
 
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "igt_cleanup.h"
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
@@ -158,6 +159,7 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 					colors[c].g,
 					colors[c].b,
 					&data->fb);
+		igt_cleanup_register_fb(data->drm_fd, &data->fb);
 
 		igt_plane_set_fb(primary, &data->fb);
 
@@ -258,11 +260,14 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
 			DRM_FORMAT_MOD_LINEAR,
 			1.0, 1.0, 1.0,
 			&fb0);
+	igt_cleanup_register_fb(data->drm_fd, &fb0);
+
 	igt_create_color_fb(data->drm_fd,
 			mode->hdisplay, mode->vdisplay, plane_format,
 			DRM_FORMAT_MOD_LINEAR,
 			1.0, 1.0, 1.0,
 			&fb1);
+	igt_cleanup_register_fb(data->drm_fd, &fb1);
 
 	/* Flip FB0 with the primary plane & collect the CRC as ref CRC. */
 	igt_plane_set_fb(primary, &fb0);
@@ -284,9 +289,6 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_crtc(output, NULL);
 	igt_display_commit(display);
-
-	igt_remove_fb(data->drm_fd, &fb0);
-	igt_remove_fb(data->drm_fd, &fb1);
 }
 
 static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
@@ -310,6 +312,7 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 			    DRM_FORMAT_XRGB8888,
 			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 1.0, 0.0, &data->fb);
+	igt_cleanup_register_fb(data->drm_fd, &data->fb);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &data->fb);
@@ -332,7 +335,6 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_crtc(output, NULL);
 	igt_display_commit(display);
-	igt_remove_fb(data->drm_fd, &data->fb);
 }
 
 static bool pipe_output_combo_valid(igt_display_t *display,
-- 
2.43.0

