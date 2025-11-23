Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C65CFD2F6
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EEF10E179;
	Sun, 23 Nov 2025 15:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNo7ksjZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1035210E179
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910503; x=1795446503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/lS6wjJyYKtHqS6IIwlXh+zIiJ4hHxK2i3HtRJICbMw=;
 b=gNo7ksjZoXxzpTJVP6vSe/caWp/3MrfX3kEa23xZTExGA6qRXYSXkDto
 SGK47Uok1CUwY+GP4IvePzS4CenrQVvtRWYypdpseHwU/tYmdIyXK2Qt1
 hH1a9aT8ljNloUgamKl/Op8pk7YTYpYHlobmv88E0imVoet5/F61M4IcM
 d5Wqbm6qSv4exM1vv5XoXHRRAX2nXDD7jA1ByibOqyJfGYW6zD7Y5DBrj
 Z9/iejefmc9huvOaEIhESlOgCDqJ36xyu7Tp4CdhKbIEcNuW+PxsRyN9e
 u6DwyPL8e1rKR3vomMkpNoK4N6oQuWl/RHuZAerF+cXe88npqpa4k+idw Q==;
X-CSE-ConnectionGUID: PieXafPnR5uLkpU3BuW8Rw==
X-CSE-MsgGUID: +TKQopVjQ3iulV5JAUd79w==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615163"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615163"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:23 -0800
X-CSE-ConnectionGUID: vGI7qrzzToit9quV1PXwbg==
X-CSE-MsgGUID: oQVVx57HT/GBytEVlEFIrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903722"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:22 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 03/35] tests/kms_color: use display-aware pipe CRC helper
Date: Sun, 23 Nov 2025 20:53:40 +0530
Message-Id: <20251123152412.599801-4-kunal1.joshi@intel.com>
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

kms_color currently constructs pipe CRC helpers by passing the pipe taken from
data->primary->pipe->pipe into igt_pipe_crc_new(fd, pipe, ...), implicitly
assuming that the pipe enum matches the CRTC index used in the debugfs
crtc-<index>/crc/ paths. That assumption no longer holds once CRTC indices and
hardware pipes diverge.

Update the test setup to use igt_pipe_crc_new_for_display(&data->display,
data->primary->pipe->pipe, IGT_PIPE_CRC_SOURCE_AUTO) so that the CRC debugfs
paths are derived from display->pipes[pipe].crtc_offset instead of the pipe
enum.

This makes kms_color resilient to non-trivial CRTC index to hardware pipe
mappings without otherwise changing the test logic.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_color.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index c424083b7..8daac5b41 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -755,7 +755,7 @@ static void test_setup(data_t *data, enum pipe p)
 	igt_require(pipe->n_planes >= 0);
 
 	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display,
 					  data->primary->pipe->pipe,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-- 
2.25.1

