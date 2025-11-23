Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4D3CFC518
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D6710E17F;
	Sun, 23 Nov 2025 15:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRjRZTzk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0601A10E152
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910523; x=1795446523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HCp75zxfMujoWJQIhUVUPQASgVDmKM1pUouKsCttJrI=;
 b=QRjRZTzkNH0mI7qooPfLRD1X4UAXScFgQpSs/NSYe3BcfcstqtoUflkJ
 8W7TglXpzLvWqqMSI0heRQwUPy51c0u/kalp2wpr1gzbnZ1OFkIU2XIkR
 M+umBqarYTuAE6cvx2micWeMIuYk7bQsaG1B8K6/AeSyDllnV+ektha2W
 0YXi2/loztEoEKQvs65dcqN6ttQOoF1s3/e0+sveLF2iq3hZWEVqyV/BG
 eQpUeJdOrDh1QaWJC5J8DU8Chyq8JKBrwypj2xpXqDqobwdro+mTKqqcp
 iOFjVEKHEiMtha5RukyTdFtWGhZL8+faXvR90D33Ph2VsiK+QrMXreE70 Q==;
X-CSE-ConnectionGUID: TFmd0EZ6Q2qQDUBNHAoPsw==
X-CSE-MsgGUID: TCVAN6SXS1uo1XHwdb5arQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615197"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615197"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:42 -0800
X-CSE-ConnectionGUID: GFyrVFaqR6inZu9IaaxZiQ==
X-CSE-MsgGUID: 2qnZz9+URAuL1aXpMHuQTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903792"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:42 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 17/35] tests/kms_universal_plane: use display-aware pipe
 CRC helper
Date: Sun, 23 Nov 2025 20:53:54 +0530
Message-Id: <20251123152412.599801-18-kunal1.joshi@intel.com>
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

kms_universal_plane created pipe CRC helpers with igt_pipe_crc_new(fd, pipe, ...),
keying them directly off the logical pipe index. That assumed the pipe enum
matched the CRTC index used in the crtc-<index>/crc/ debugfs paths, which can
break on platforms where CRTCs and hardware pipes are not in a simple 1:1
mapping.

Switch the CRC helper setup in this test to use
igt_pipe_crc_new_for_display(&data->display, pipe, IGT_PIPE_CRC_SOURCE_AUTO)
so that the CRC debugfs paths are derived from display->pipes[pipe].crtc_offset
instead of the pipe enum.

This makes kms_universal_plane robust to non-trivial CRTC index to hardware
pipe mappings while preserving the rest of its logic.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_universal_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 2d9716575..e2ce2df8a 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -96,8 +96,8 @@ functional_test_init(functional_test_t *test, igt_output_t *output, enum pipe pi
 	data_t *data = test->data;
 	drmModeModeInfo *mode;
 
-	test->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
-					  IGT_PIPE_CRC_SOURCE_AUTO);
+	test->pipe_crc = igt_pipe_crc_new_for_display(&data->display, pipe,
+						  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_pipe(output, pipe);
 
-- 
2.25.1

