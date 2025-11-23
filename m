Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D6FCFC518
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A92710E056;
	Sun, 23 Nov 2025 15:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dh6HGWLj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749E210E182
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910504; x=1795446504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bRhNDuwDxiUfigBtw1cdZ1zbeoUh5bIKzZgmi1aWhZk=;
 b=dh6HGWLjmV7SyHOAiUgV1CrRv+Oeutyk/PxZKlNailxLi88Pwqcy1JqY
 7JP8PLXlRGfnH2Pla4j/S/m9kMv9nAP6b5V0AOOPH5Nf7OObO9Sm8rU9G
 zAAlTR8rXildabzCxPbmYl4tl6P5kkFC4a5TSL9kOIUlYHM7gMeWLicsV
 ilrGglScxDRcOCk+PkxoI6UiNv5RkVXgKkpx2sRuYdQ9Mi03Y3cQeV7kN
 81OzbbvRfkxjCKZIh5/llYQNLD7BKR4tMz69bmVSSA8inOFKZuWCqSeIe
 DmDYRaSXlv79nfQtI7Y0VCcEqDtRGaWaenYAe2w04yRIuTqFIlu3vQm2J Q==;
X-CSE-ConnectionGUID: Nt6r51XFS3iBLSWT6XhBXA==
X-CSE-MsgGUID: p7FVyKNhTomfDm9J0O3P7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615164"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615164"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:24 -0800
X-CSE-ConnectionGUID: N84moOmCRuSHWiqtdutAJA==
X-CSE-MsgGUID: RiN/NIL3SaWzDYxxRqmf5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903726"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:24 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 04/35] tests/kms_cursor_crc: use display-aware pipe CRC
 helper
Date: Sun, 23 Nov 2025 20:53:41 +0530
Message-Id: <20251123152412.599801-5-kunal1.joshi@intel.com>
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

kms_cursor_crc creates pipe CRC helpers with igt_pipe_crc_new(fd, pipe, ...),
assuming that the logical pipe enum matches the CRTC index used in the debugfs
crtc-<index>/crc/ paths. That assumption can break when CRTC indices and
hardware pipes no longer have a 1:1 mapping.

Switch the test to use igt_pipe_crc_new_for_display(&data->display, data->pipe,
IGT_PIPE_CRC_SOURCE_AUTO) so that the CRC debugfs paths are derived from
display->pipes[pipe].crtc_offset instead of the pipe enum.

This makes kms_cursor_crc robust against non-trivial CRTC index to hardware
pipe mappings without changing the rest of the test logic.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_cursor_crc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 239bbd7b7..ceb7f6132 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -607,7 +607,7 @@ static void prepare_crtc(data_t *data, int cursor_w, int cursor_h)
 	/* create the pipe_crc object for this pipe */
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display, data->pipe,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* x/y position where the cursor is still fully visible */
-- 
2.25.1

