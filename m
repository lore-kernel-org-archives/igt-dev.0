Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1422CFC518
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8267110E18B;
	Sun, 23 Nov 2025 15:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSA/6WgZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E7310E152
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910544; x=1795446544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uSnlpOUVEL4jITGXn8Teg2H8vN0jzxyGCcroSVyURXk=;
 b=RSA/6WgZP1h3TcapvLYEIejgurVD0e88RJWeAXB/sTtfrX35S3FrcEru
 ZVavJQPFz2ftREDRmgfjj8+/UxzXFJNAD4dl/LxcHRRVGV+JMNRZhbQJ3
 qovu/4B0GtEXPOaYgBshej1DhJo8zpgv3LpWd6ZbdK84gyvTeoaPkLyOq
 SPq14YgTb27vy7XA2BWlFY7XaT+0nCM7NDnvpv5jOmk+x46fk7As1gc0u
 AJfY8gXTnLL9kaN0I5CcNXT+GBN08vsxN1W6Y26KPnLHa0HcJTKSIuBuo
 bQb5tIcEXU6O4TFiJzBoXpYM2qKCULbQNu+Y6ipvlK8ZZ/o3foCuEG8eQ Q==;
X-CSE-ConnectionGUID: K1cf3sIdSLaAvqaQ/SCAuQ==
X-CSE-MsgGUID: I4GFlu/vS9uPyWTm2NSeYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615226"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615226"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:09:04 -0800
X-CSE-ConnectionGUID: nCRfJCpGQGWBVt9abIH/OQ==
X-CSE-MsgGUID: IbpNyBUbSJuaLrb9rxi2tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903865"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:09:03 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 32/35] tests/intel/kms_flip_tiling: use display-aware
 pipe CRC helper
Date: Sun, 23 Nov 2025 20:54:09 +0530
Message-Id: <20251123152412.599801-33-kunal1.joshi@intel.com>
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

Switch pipe_crc_new() to use igt_pipe_crc_new_for_display() instead of igt_pipe_crc_new(). This avoids assuming that the pipe index matches the CRTC index and makes the CRC collection follow the current igt_display state.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_flip_tiling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index d078653e9..0d0fc235d 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -72,7 +72,7 @@ static void pipe_crc_new(data_t *data, int pipe)
 	if (data->pipe_crc)
 		return;
 
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display, pipe,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_assert(data->pipe_crc);
 	igt_pipe_crc_start(data->pipe_crc);
-- 
2.25.1

