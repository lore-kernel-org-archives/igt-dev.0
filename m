Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9C7CFD2F6
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619EB10E182;
	Sun, 23 Nov 2025 15:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVo5MNSU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6036610E182
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910524; x=1795446524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OSMul3+r/mbckfn4355DZQzVFlKa07dvOGebMDW6Iyo=;
 b=ZVo5MNSUkSmpEtJA3Y/jW37EzLAU8yc+zHyY9xZG5zRcCd0FlMP3EFoJ
 Lk6mnFCMPz7LLhJ0b50vq0luUle+BXDh4C9U637NIB4ILWmyfkUj5FuMm
 Sqz1a8spS6zn7HLjjXpcjQmEsz5qd/5PF1SqZ8ZUkTwERBY+qBahFfOsV
 2/TjfaUDhb709WUwMj52jzNvk40956KsiK1j42oPuLppF6qO/jDKTH8iQ
 RJn30YnJW5W9Q7v0vZjUnVQe053tFkDzqoBWS9BNI78XbqPouWIzoUe1J
 di8FjfHnDH6hyeEmPq59H2gPCiaLztIIDe8kyat79haFhW8mJDCoBt6em A==;
X-CSE-ConnectionGUID: 2JFP03ecRcWf3yPW3KNAhA==
X-CSE-MsgGUID: XDX04NPWQ6eY6Gyw2tiwtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615200"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615200"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:44 -0800
X-CSE-ConnectionGUID: Y+ReLP3jSWiwgH4QUPDs2g==
X-CSE-MsgGUID: 2zYsluTtRmq8CDLgM0dW9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903798"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:44 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 18/35] tests/kms_prime: use display-aware pipe CRC helper
Date: Sun, 23 Nov 2025 20:53:55 +0530
Message-Id: <20251123152412.599801-19-kunal1.joshi@intel.com>
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

kms_prime created pipe CRC helpers with igt_pipe_crc_new(fd, pipe, ...), keying
them directly off the logical pipe index. That assumed the pipe enum matched
the CRTC index used in the crtc-<index>/crc/ debugfs paths, which can break on
platforms where CRTCs and hardware pipes are not in a simple 1:1 mapping.

Switch the CRC helper setup in this test to use igt_pipe_crc_new_for_display(&display,
pipe, IGT_PIPE_CRC_SOURCE_AUTO) so that the CRC debugfs paths are derived from
display->pipes[pipe].crtc_offset instead of the pipe enum.

This makes kms_prime robust to non-trivial CRTC index to hardware pipe
mappings while preserving the rest of its logic.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_prime.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index aa3cc386c..08667249d 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -400,8 +400,8 @@ static void test_crc(int exporter_fd, int importer_fd)
 	output = setup_display(importer_fd, &display, &pipe);
 
 	mode = igt_output_get_mode(output);
-	pipe_crc = igt_pipe_crc_new(importer_fd, pipe,
-				    IGT_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc = igt_pipe_crc_new_for_display(&display, pipe,
+					       IGT_PIPE_CRC_SOURCE_AUTO);
 
 	for (i = 0; i < ARRAY_SIZE(colors); i++) {
 		prepare_scratch(exporter_fd, &scratch, mode, colors[i].color);
-- 
2.25.1

