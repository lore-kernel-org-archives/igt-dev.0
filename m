Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0F7CFD2F6
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494E310E056;
	Sun, 23 Nov 2025 15:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nP7PIbmF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB16910E056
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910511; x=1795446511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BNu/EochOuEMTjDGSc1+Ybee02cM18/YDDCHU/VEdqY=;
 b=nP7PIbmFrL2+p5lvy5t1pMphqZ6nCGTVSi6n9jB6b0ikEj7zEDUW9iye
 GLDkeZQBkdR7J3y1xItewWoJGcxHKXQJ1V/0J7ZHfDEgWvtayqNdP6BVM
 8qykvvWT314zd+p6R0NbiqErP5/u670eQPRZfAGXsxe0OkUgHuUA62c8Q
 h64G9K5UNJiLGJmGP3lp/USizGBlG/f1Fq81iQ6NCmKPB5UCMZr2BDy2j
 Y85Qj/vhrIrrcMGcAWd7qjX8/t9J6vlQM/L19nM+WnEs9ro0BL5DrUKcS
 XGnxafEI3MelNKm+4gc1wrKRTnGyfX67ABWS2Mts8DipSK78C0a9h7/P2 w==;
X-CSE-ConnectionGUID: IGB331avTrO1pW/Knqy1rw==
X-CSE-MsgGUID: oPDN/oYRRH2rHyFpTCOy8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615173"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615173"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:31 -0800
X-CSE-ConnectionGUID: 47vcZohMRsik/PN8+GP0JA==
X-CSE-MsgGUID: aV8H2sSoTRGeLGaeXytxiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903747"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:31 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 09/35] tests/kms_rotation_crc: use display-aware pipe
 CRC helper
Date: Sun, 23 Nov 2025 20:53:46 +0530
Message-Id: <20251123152412.599801-10-kunal1.joshi@intel.com>
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

kms_rotation_crc creates pipe CRC helpers with igt_pipe_crc_new(fd, pipe, ...),
implicitly assuming that the logical pipe enum matches the CRTC index used in
the debugfs crtc-<index>/crc/ paths. That assumption can break when CRTC
indices and hardware pipes are not in a simple 1:1 mapping.

Switch both CRC users in this test to use igt_pipe_crc_new_for_display(display,
pipe, IGT_PIPE_CRC_SOURCE_AUTO) so that the CRC debugfs paths are derived from
display->pipes[pipe].crtc_offset instead of the pipe enum.

This makes kms_rotation_crc robust to non-trivial CRTC index to hardware pipe
mappings while preserving the rest of the test logic.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_rotation_crc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index e18768141..a4fa2dcbe 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -312,7 +312,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	 */
 	if (!is_amdgpu_device(data->gfx_fd))
 		igt_display_commit2(display, COMMIT_ATOMIC);
-	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
+	data->pipe_crc = igt_pipe_crc_new_for_display(display, pipe,
 				          IGT_PIPE_CRC_SOURCE_AUTO);
 
 	if (!is_amdgpu_device(data->gfx_fd) && start_crc)
@@ -952,8 +952,8 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		p[0].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		p[1].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
 
-		data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
-						  IGT_PIPE_CRC_SOURCE_AUTO);
+		data->pipe_crc = igt_pipe_crc_new_for_display(display, pipe,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_start(data->pipe_crc);
 
 		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
-- 
2.25.1

