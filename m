Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B752ACFD2F6
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E22610E152;
	Sun, 23 Nov 2025 15:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q24oU664";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CDE10E186
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910520; x=1795446520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q2gnh8bwdO/Bsu/U76/eBhrOX7hpdAukOWw3RDqJr8c=;
 b=Q24oU664J4xd6bpTpgd9/ZcUQ0Cfjzp05MDK3gM1G/4JFpPNjAOCbTG/
 qUej0tgQjaeyWWO8Kz0iMRa/J4JOD66Zyk3I8JgEsgXqDi/czzVSrXn+D
 T+CPiMH+oxNOF0NI2rvP4uPqnXUJk6XFJQvPs6AvX3UYm7ZPFdzlSxjrJ
 GW/CyqAC8v+78jbdaTah2WaORXaoLaTnZnfYS5XSPGK8XbzWrZp3RB/+Y
 8pPiYcb5OlhV/JMuJQ+hTlx5MUe4YTvCw6Y8+QB6hGaLTAzy9E6KgjP07
 QKBSxQEYM/vRBfE/loQbUfEsreJxo4MYP5AqtmbJuPERqC7bqkXmFQbfK w==;
X-CSE-ConnectionGUID: 8PKU1EZWTuKryuQyYoP+wg==
X-CSE-MsgGUID: k4lRNZz2RzukIXWja7rBpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615192"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615192"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:40 -0800
X-CSE-ConnectionGUID: re+b2fWMT9eip5FTlPtdZg==
X-CSE-MsgGUID: QhNORaoxQs+0czWPxDkkpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903783"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:39 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 15/35] tests/kms_plane_multiple: use display-aware pipe
 CRC helper
Date: Sun, 23 Nov 2025 20:53:52 +0530
Message-Id: <20251123152412.599801-16-kunal1.joshi@intel.com>
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

kms_plane_multiple created pipe CRC helpers with igt_pipe_crc_new(fd, pipe, ...),
keying them directly off the logical pipe index. That assumed the pipe enum
matched the CRTC index used in the crtc-<index>/crc/ debugfs paths, which can
break on platforms where CRTCs and hardware pipes are not in a simple 1:1
mapping.

Switch the CRC helper setup in this test to use
igt_pipe_crc_new_for_display(&data->display, pipe, IGT_PIPE_CRC_SOURCE_AUTO)
so that the CRC debugfs paths are derived from display->pipes[pipe].crtc_offset
instead of the pipe enum.

This makes kms_plane_multiple robust to non-trivial CRTC index to hardware pipe
mappings while preserving the rest of its logic.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_plane_multiple.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 4e6ca780a..205e5f59d 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -107,8 +107,8 @@ struct {
  */
 static void test_init(data_t *data, enum pipe pipe, int n_planes)
 {
-	data->pipe_crc1 = igt_pipe_crc_new(data->drm_fd, pipe,
-					  IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc1 = igt_pipe_crc_new_for_display(&data->display, pipe,
+						  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
 	igt_assert_f(data->plane1 != NULL, "Failed to allocate memory for planes\n");
@@ -416,10 +416,10 @@ test_plane_position(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t
 
 static void test_init_2_display(data_t *data, enum pipe pipe1, enum pipe pipe2, int n_planes)
 {
-	data->pipe_crc1 = igt_pipe_crc_new(data->drm_fd, pipe1,
-					   IGT_PIPE_CRC_SOURCE_AUTO);
-	data->pipe_crc2 = igt_pipe_crc_new(data->drm_fd, pipe2,
-					   IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc1 = igt_pipe_crc_new_for_display(&data->display, pipe1,
+						  IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc2 = igt_pipe_crc_new_for_display(&data->display, pipe2,
+						  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
 	igt_assert_f(data->plane1 != NULL, "Failed to allocate memory for planes\n");
-- 
2.25.1

