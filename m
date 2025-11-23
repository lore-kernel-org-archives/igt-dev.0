Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC7CCFC518
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E6710E056;
	Sun, 23 Nov 2025 15:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fdke43b5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700D610E186
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910531; x=1795446531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Koje8gNeT8oEDr0aFfVRXgOcgjERXHqGijr6i2EPULg=;
 b=Fdke43b5apFFvWDpIo/hPpOtR7fJwLgHoclz/WZnG6LiYp/TASAYdHj8
 HYgZpUWzm4ZtiFctVH5VLiO4jj8K/fQnuetZE5SKmQ+mUPehGtvX0EVuQ
 CA/vNLXNSgLvltMsbe9x/hjoCLRdvWxAd+B4TrCDXKg8o5uEgLcT7Tufd
 0Ax70a84qYyilsF1KfUKkwxdoka3pqwWJh0oOUUwhlxw0MPmOTBb6jbN2
 v66zqYjEu353MPJAENa8OityGCW1A/iAuRNsHk4wsnkavIxKRrJVH32JY
 dR4jcKrgQxa6Kg7TL4OezcDCIGhfvI3xR40DH3rCOMUq+DPxvlna/3OrQ g==;
X-CSE-ConnectionGUID: 2aOYEl2yQUO7Cn/U8R/rEg==
X-CSE-MsgGUID: +PcIQlwFQoakEyHUE50GFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615212"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615212"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:51 -0800
X-CSE-ConnectionGUID: sYVuhZkcRBCP+wOIb8ibUw==
X-CSE-MsgGUID: WIgHMrWPTH2yiLRmM1nCDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903824"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:51 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 23/35] tests/xe_pxp: use display-aware pipe CRC helper
Date: Sun, 23 Nov 2025 20:54:00 +0530
Message-Id: <20251123152412.599801-24-kunal1.joshi@intel.com>
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

Switch xe_pxp display CRC comparison to igt_pipe_crc_new_for_display so the CRTC index is derived from the display state instead of assuming the pipe index matches the CRTC index.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/xe_pxp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 98f06ae13..63e15bf98 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -846,8 +846,8 @@ static void compare_crcs(int fd, igt_display_t *display, igt_fb_t *ref_fb, igt_f
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
 		pipe = &display->pipes[output->pending_pipe];
-		pipe_crc = igt_pipe_crc_new(fd, pipe->pipe,
-					    IGT_PIPE_CRC_SOURCE_AUTO);
+		pipe_crc = igt_pipe_crc_new_for_display(display, pipe->pipe,
+						       IGT_PIPE_CRC_SOURCE_AUTO);
 		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_pipe_connector_valid(pipe->pipe, output));
 		igt_output_set_pipe(output, pipe->pipe);
-- 
2.25.1

