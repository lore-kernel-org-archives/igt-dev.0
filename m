Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A18CFC518
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687FA10E056;
	Sun, 23 Nov 2025 15:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJBedrsY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59D510E186
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910518; x=1795446518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ScXPO4FJsVTWGxFOhgenhuY7nCrJPAvB50JQHyvJL7I=;
 b=NJBedrsYmrxAE0Fx8yEebIYCq2C929l3n4S6RtA5JPy3j6FQQ014YyBN
 6CMfJq0hjeVIPIJuREL6ngIXW5UPp8d6ezsb0ptVm71oSqFWj//x7NB7A
 sJYsbFqO2hO/ySB321GMwGeRQNsPmi1+wT+XLrOasi6TNccop6HF4ViAv
 UMSQACukMfLJsjRgmNriLmQDgekEbwZE39d4NSXB60oqMozmGnLTtbShz
 1ygmHb8U5P0LN2cvjMZa2OSbcHIrNrimoI/cwm6gALohVRcOpL1KKIezZ
 dWZDXOA103jYh6CY3ot2LvN5cCkrpP+zeeGFhD80KzHPGfKlnSk5QPFJ6 Q==;
X-CSE-ConnectionGUID: bMQzYLHeSQiORuUO2pkPWg==
X-CSE-MsgGUID: wsboUGIlThiEFyZLej1ENw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615188"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615188"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:38 -0800
X-CSE-ConnectionGUID: j3Dg685UTU6XSoenh+K4Hw==
X-CSE-MsgGUID: a68ga9vAQj6bqRxT2igX9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903777"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:38 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 14/35] tests/kms_plane_alpha_blend,
 cursor: use display-aware pipe CRC helper
Date: Sun, 23 Nov 2025 20:53:51 +0530
Message-Id: <20251123152412.599801-15-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251123152412.599801-1-kunal1.joshi@intel.com>
References: <20251123152412.599801-1-kunal1.joshi@intel.com>
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

kms_plane_alpha_blend and kms_plane_cursor created pipe CRC helpers with
igt_pipe_crc_new(fd, pipe, ...), keying them directly off the logical pipe
index. That assumed the pipe enum matched the CRTC index used in the
crtc-<index>/crc/ debugfs paths, which can break on platforms where CRTCs and
hardware pipes are not in a simple 1:1 mapping.

Switch the CRC helper setup in these tests to use
igt_pipe_crc_new_for_display(&data->display, pipe, IGT_PIPE_CRC_SOURCE_AUTO) so
that the CRC debugfs paths are derived from display->pipes[pipe].crtc_offset
instead of the pipe enum.

This makes the plane alpha-blend and plane cursor tests robust to non-trivial
CRTC index to hardware pipe mappings while preserving the rest of their logic.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_plane_alpha_blend.c | 4 ++--
 tests/kms_plane_cursor.c      | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 696bb1e5e..d7543815c 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -218,8 +218,8 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 
 	/* create the pipe_crc object for this pipe */
 	igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
-					  IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display, pipe,
+						  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	mode = igt_output_get_mode(output);
 	w = mode->hdisplay;
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 9fa36bfd4..835ee17c7 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -107,8 +107,9 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
 
 	igt_require_pipe_crc(data->drm_fd);
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
-					  IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display,
+							   data->pipe_id,
+							   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* Overlay rectangle for a rect in the center of the screen */
 	data->or.x = data->mode->hdisplay / 4;
-- 
2.25.1

