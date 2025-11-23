Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FBACFC518
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771B810E152;
	Sun, 23 Nov 2025 15:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nizsxQZw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BC910E17F
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910510; x=1795446510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qn5DZCzUfDhg2yZGHLTSJX5h0kHq6hcGqGRNfaI5R4s=;
 b=nizsxQZwv/J+Oh4J567u2kbKY1D1J2i7oyxJot1PrthuqVHOTqsu9eGJ
 q6woIeXzzUW+jA1PXRR3MN751tGJ86v2thQPbAED0StczVdA0SgibKs/v
 0wYrsD5mUyhVx7t3xmKX3kbF21TYK6qX1a549UM1RaytZRbrjeo+DrHja
 +Mo/nkEhxV/v002xlNdRQp/+PIX9NfbKSFOUk12KXZeJxuOaNtbFP72Lt
 uXcle1ifVEKsIamSI7YLei+xEZXYm1tSGLn0cHgjDyACDHv1YujVATB3v
 gn31zOYJVJLdBRjBJIk2gGP+SkoLrqpBbvdNewLHlhAXoABYb7yCzk0cv Q==;
X-CSE-ConnectionGUID: Wqi9RaS4SviIL1Kgz6yj4g==
X-CSE-MsgGUID: bhbuUVIOTmCTvU9ABfPNxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615170"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615170"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:30 -0800
X-CSE-ConnectionGUID: qj5ZLrRNR06TeLnIU3h0JA==
X-CSE-MsgGUID: FCkCxpuLSmSg5fIM6nURDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903742"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:29 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 08/35] tests/kms_multipipe_modeset: use display-aware
 pipe CRC helper
Date: Sun, 23 Nov 2025 20:53:45 +0530
Message-Id: <20251123152412.599801-9-kunal1.joshi@intel.com>
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

kms_multipipe_modeset creates per-pipe CRC helpers with igt_pipe_crc_new(fd, i,
...), assuming that the loop index i matches the CRTC index used in the
debugfs crtc-<index>/crc/ paths. That assumption fails when CRTC indices and
hardware pipes are not in a simple 1:1 mapping.

Switch the test to use igt_pipe_crc_new_for_display(display, i,
IGT_PIPE_CRC_SOURCE_AUTO) so that the CRC debugfs paths are derived from
display->pipes[i].crtc_offset instead of the loop index directly.

This makes kms_multipipe_modeset robust to non-trivial CRTC index to hardware
pipe mappings while preserving the existing test behaviour.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_multipipe_modeset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index 69dc62e38..c325cbc91 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -80,8 +80,8 @@ static void run_test(data_t *data, int valid_outputs)
 
 		mode = NULL;
 
-		pipe_crcs[i] = igt_pipe_crc_new(display->drm_fd, i,
-						IGT_PIPE_CRC_SOURCE_AUTO);
+		pipe_crcs[i] = igt_pipe_crc_new_for_display(display, i,
+					IGT_PIPE_CRC_SOURCE_AUTO);
 
 		igt_output_set_pipe(output, i);
 		mode = igt_output_get_mode(output);
-- 
2.25.1

