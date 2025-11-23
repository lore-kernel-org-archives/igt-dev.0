Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6799CFC518
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F99410E17F;
	Sun, 23 Nov 2025 15:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YC4Td5E0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1895110E17F
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910513; x=1795446513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5zjfI0qG3TpygorXCqNQ7e8FLPRheMNzFKJX40Xr/6Y=;
 b=YC4Td5E0wACmDYkJJ7DScrQMndYaHwF+P/b47MJLNw7eIuLSz7XqrX8D
 mW1A8DATWN/xRPk/o+ki3+a8whRLL6h3QEWxWYc7xsVJdC2dBQhma/jbU
 H1eAI7u7COVe5HR5TXnchXwI4ekQvuyUAJiq5zR51pX12ZdqePvS8s9CC
 4vGl868GAmIdwrLtjmYcU9qtGVZkrR8qN/xprM22ze56lM9yNHGds+2a+
 /eQWpZTi8pzmE4g16FsrLTX7LmTCGahsNpuyDFC/jQRalKg8svGU4G5d7
 QTPvszzcKOxzCOpI2jVrXMrf3ZxGU5ztyjmPUcHkhiyxm9vZ3N+Kwzz0y Q==;
X-CSE-ConnectionGUID: olRIVBzmSwOvoTr9XMqvjw==
X-CSE-MsgGUID: 4QHvzqiUQG+8bcTQaaeIGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615175"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615175"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:33 -0800
X-CSE-ConnectionGUID: 6bzXlMZfSQi1sdDm0GixsA==
X-CSE-MsgGUID: EBBml5ljRqCHSYjvv1ML2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903753"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:32 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 10/35] tests/kms_plane_lowres: use display-aware pipe
 CRC helper
Date: Sun, 23 Nov 2025 20:53:47 +0530
Message-Id: <20251123152412.599801-11-kunal1.joshi@intel.com>
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

kms_plane_lowres creates pipe CRC helpers with igt_pipe_crc_new(fd, pipe, ...),
implicitly assuming that the logical pipe enum matches the CRTC index used in
the debugfs crtc-<index>/crc/ paths. That assumption can break when CRTC
indices and hardware pipes are not in a simple 1:1 mapping.

Switch the CRC user in this test to use igt_pipe_crc_new_for_display(&data->display,
data->pipe, IGT_PIPE_CRC_SOURCE_AUTO) so that the CRC debugfs paths are derived
from display->pipes[pipe].crtc_offset instead of the pipe enum.

This makes kms_plane_lowres robust to non-trivial CRTC index to hardware pipe
mappings while preserving the rest of the test logic.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_plane_lowres.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 4ed098e41..42a3d1721 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -306,7 +306,8 @@ static void run_test(data_t *data, uint64_t modifier)
 			if (!intel_pipe_output_combo_valid(&data->display))
 				continue;
 
-			data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
+			data->pipe_crc = igt_pipe_crc_new_for_display(&data->display,
+							  data->pipe,
 							  IGT_PIPE_CRC_SOURCE_AUTO);
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), data->output->name)
-- 
2.25.1

