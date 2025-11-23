Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A6FCFD2F6
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4200510E182;
	Sun, 23 Nov 2025 15:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8/s0q2l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DBF10E152
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910542; x=1795446542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AbzuBUozYcYtKhxvKzEQgW6F1qcv2Lvg4Z+e3p7dIis=;
 b=n8/s0q2lyWA6UbGRn+30zWsu1J3MG6i9uZsKodCnyd+ISOghQa9MgA5w
 ft6vzZEFvKC0yrLgFyicVCcIiT0V9sEIjPicCXIh2i7ljg7lPtC4Wzqh7
 GCLL16RpBSGpB0CHvtqGXHDQWYHXqlK+EyDlAHMgxqNMd2qhDC+y4NuKQ
 nGpCETe6fhwtHgmP6K7wyvFI8R1qNByJ3XixrVbHfBSfY86wqQ2hCvytn
 kj3zazfWW4cW9QenBvO1SotekqtgZXCfor4BY6QWZdtVrDABbweNgWTnA
 szmF9vvg9Q3X/B0uFPMmSUwMubcApZ1U7AsVMX7GZ+xpvREoioTphXPaY w==;
X-CSE-ConnectionGUID: VHYp7HAuTR2Ngchp4FRsKw==
X-CSE-MsgGUID: yOXO9zeoR4GRC2wYU41LiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615223"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615223"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:09:02 -0800
X-CSE-ConnectionGUID: HVnTWzQKTu+FL66ejEmMIQ==
X-CSE-MsgGUID: b+mPwMNmTYytnoXCM0YHqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903860"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:09:02 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 31/35] tests/tests/intel/kms_flip_scaled_crc: use
 display-aware pipe CRC helper
Date: Sun, 23 Nov 2025 20:54:08 +0530
Message-Id: <20251123152412.599801-32-kunal1.joshi@intel.com>
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

Switch kms_flip_scaled_crc CRC call sites to igt_pipe_crc_new_for_display
so they derive the CRTC index from the display state instead of assuming
the pipe index equals the CRTC index.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_flip_scaled_crc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index e866c62fc..c49716782 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -635,8 +635,8 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 		igt_pipe_crc_stop(data->pipe_crc);
 		igt_pipe_crc_free(data->pipe_crc);
 	}
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
-					  IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display, pipe,
+						      IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_plane_set_position(primary, 0, 0);
 	igt_plane_set_fb(primary, &data->small_fb);
-- 
2.25.1

