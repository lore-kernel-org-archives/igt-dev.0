Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894C6CFD2F6
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD1D10E152;
	Sun, 23 Nov 2025 15:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7ckDc8H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA32810E182
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910506; x=1795446506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xXJuSxSITApQIe5S7s3GVwxFH5pX8qpUqWbO4IRtLB8=;
 b=V7ckDc8HWlm3mVUPsnj+QlssKgr8Qsa6g8nw9/YVbr1y3994Am9rqWgd
 WJ9gsnSj4DsodpUxyLT5JTnb8I75IIdsZ8RVuP9A/SIdZYDDean9Gj7OC
 1yl9rJ4H8yZfcPVPGLPW/oXeAwrE0ppAp4/V+ZaEGHgnp+K9km83OoX2a
 IIOhYGI0svQnSP/mGiDh+xBAb0/A8RWx1+rCcpbSaUDHJKZvwK/gzZP7H
 swBvMGmsWTXuBFHKmVImR4kqw7SEqGcJtCASMmGS6B1TqPYIHYCbaocM5
 YkSN0ilEy7l6ECf7CDZz3eYoPbUrxJrBZUpgh4LL+O3HtJh91O3+ubdX9 Q==;
X-CSE-ConnectionGUID: qQbyqvSdScSZuzz0d3fB7Q==
X-CSE-MsgGUID: M87MOh1bRJu30i/DUVG/Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615165"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615165"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:25 -0800
X-CSE-ConnectionGUID: aUfSqJE0Qm2265a0AKZm9A==
X-CSE-MsgGUID: Qs+NerzmQ8S1YzFW14703w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903731"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:25 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 05/35] tests/kms_cursor_legacy: use display-aware pipe
 CRC helper
Date: Sun, 23 Nov 2025 20:53:42 +0530
Message-Id: <20251123152412.599801-6-kunal1.joshi@intel.com>
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

kms_cursor_legacy constructs pipe CRC helpers with igt_pipe_crc_new(fd, pipe,
...), assuming that the logical pipe enum matches the CRTC index used in the
debugfs crtc-<index>/crc/ paths. That assumption breaks once CRTC indices and
hardware pipes are no longer 1:1.

Switch both cursor tests in this file to use
igt_pipe_crc_new_for_display(display, pipe, IGT_PIPE_CRC_SOURCE_AUTO) so that
the CRC debugfs paths are derived from display->pipes[pipe].crtc_offset
instead of the pipe enum.

This makes kms_cursor_legacy resilient to non-trivial CRTC index to hardware
pipe mappings while keeping the rest of the test logic unchanged.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_cursor_legacy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 865853c38..8dfefd84a 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1605,7 +1605,7 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe,
+	pipe_crc = igt_pipe_crc_new_for_display(display, pipe,
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
@@ -1686,7 +1686,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe,
+	pipe_crc = igt_pipe_crc_new_for_display(display, pipe,
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
-- 
2.25.1

