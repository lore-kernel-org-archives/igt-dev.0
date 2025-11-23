Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD289CFD318
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6265610E17F;
	Sun, 23 Nov 2025 15:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jj/1JhiE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F03210E179
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910501; x=1795446501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FUb+JPhbOEldj0JvxRciTUaeYN/2wwL/8lTJ8TvrUj8=;
 b=Jj/1JhiE/nALGLGS5f4rz0+BhnLBz7KutsxqqDRo9AXd0KZ94nHXPnkK
 lqeEAmfx85sHaOHoUcchGpQ4Xj/ZTqSBkA4a8tYDSsgOC+GupJfG7y0Ku
 imQsjM4+tZnpRBXRKaUhgiSJJVBhn2mIYh54NU+MAPQxtur+lA0ektacj
 Nhy2elOHRcBDswrZ+woyu+2+L+NAALRHohHbuDrI6kfRZ4wKfkzLxmE6a
 RlTFxSBm43OE2IAGTe/HEfvuNOWb5unGZgzAG+Es5LStlSsFj0Ft8xqz1
 V3WpRoGcvQARFgtPngkx/oipdu+uvuFWQ6PXlPsuUpiSdmBEYapzIaJ9Y w==;
X-CSE-ConnectionGUID: De/F1N3aQXyEI3n8i4pSqg==
X-CSE-MsgGUID: 2/NMTZi7TOiNPCO3tB5VyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615162"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615162"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:21 -0800
X-CSE-ConnectionGUID: bHxFZ10FQ22SpxQA++NpYA==
X-CSE-MsgGUID: GadECMYmQUaJiWQ2GrwNKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903719"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:21 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 02/35] tests/kms_atomic: use display-aware pipe CRC
 helper
Date: Sun, 23 Nov 2025 20:53:39 +0530
Message-Id: <20251123152412.599801-3-kunal1.joshi@intel.com>
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

kms_atomic currently constructs pipe CRC helpers by passing the logical pipe
enum directly into igt_pipe_crc_new(fd, pipe, ...), which assumes that the
pipe number matches the CRTC index used in the debugfs crtc-<index>/crc/
paths. That assumption breaks once CRTC indices and hardware pipes are no
longer 1:1.

Update kms_atomic to use igt_pipe_crc_new_for_display(&data->display, pipe,
IGT_PIPE_CRC_SOURCE_AUTO) so that the CRC debugfs paths are derived from
display->pipes[pipe].crtc_offset instead of the pipe enum.

This makes kms_atomic robust to non-trivial CRTC index to hardware pipe
mappings while keeping the test logic otherwise unchanged.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_atomic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 474df3fa4..baa53a184 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -474,8 +474,8 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	/* create the pipe_crc object for this pipe */
-	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
-				    IGT_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc = igt_pipe_crc_new_for_display(&data->display, pipe,
+				   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc */
 	igt_pipe_crc_start(pipe_crc);
-- 
2.25.1

