Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3039CFA46B
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9084D10E182;
	Sun, 23 Nov 2025 15:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WtJXXHfL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558EC10E182
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910517; x=1795446517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rw83obAnFxI5XDL/xv7bM+MBlFvStL+Q51503MSkeU0=;
 b=WtJXXHfLRC47gaIn+SUYzvbllF0n1D0Y3i/GNnYwEW1T261X8xNgrxNP
 oiAIsg9Afs4KQL9irJJWmfCrKXzWXWotVc6fEyF0FdZFDqSqiNK12Cj4q
 fsV9QEfl3kREmMkTX9BL5kz3czrj2hfSeF4+DMiPUX+WYbvIwNrWbHC59
 53WCGOoNO9TrLkrfEg+n4fI4gOz/bQH8TEam/LxsU80CYn5ivJOBf5p1m
 R93sbJ8Nf1qdDGP11g88MOQCda4B3ye5YBJkfSgebJZLojdGTZzGb4huA
 00EgtwUZit3xaAon7gNFn62RdlRIH3Nx3NFWxpuCRtZsG5bbxKMQAZ5iA Q==;
X-CSE-ConnectionGUID: o+KuDMjmRra/tqzzltIA4Q==
X-CSE-MsgGUID: uu3J1E3/SgWI8OduAwMulA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615187"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615187"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:37 -0800
X-CSE-ConnectionGUID: UL5CmIhfQ7qXwGLKNueDwg==
X-CSE-MsgGUID: xqwEtvEURiW7L9iJgIKPjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903770"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:36 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 13/35] tests/kms_plane: use display-aware pipe CRC helper
Date: Sun, 23 Nov 2025 20:53:50 +0530
Message-Id: <20251123152412.599801-14-kunal1.joshi@intel.com>
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

kms_plane created pipe CRC helpers with igt_pipe_crc_new(fd, pipe, ...),
keying them directly off the logical pipe index. That assumed the pipe enum
matched the CRTC index used in the crtc-<index>/crc/ debugfs paths, which can
break on platforms where CRTCs and hardware pipes are not in a simple 1:1
mapping.

Switch the CRC helper setup in this test to use igt_pipe_crc_new_for_display(&data->display,
pipe, IGT_PIPE_CRC_SOURCE_AUTO) so that the CRC debugfs paths are derived from
display->pipes[pipe].crtc_offset instead of the pipe enum.

This makes kms_plane robust to non-trivial CRTC index to hardware pipe mappings
while preserving the rest of the test logic.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 02d4da4cb..5af91af3f 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -130,8 +130,8 @@ static void test_init(data_t *data, enum pipe pipe)
 	igt_require(data->display.pipes[pipe].n_planes > 0);
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
-					  IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display, pipe,
+						  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_display_reset(&data->display);
 }
 
-- 
2.25.1

