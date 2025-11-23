Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880C2CFA46B
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3531310E189;
	Sun, 23 Nov 2025 15:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfHSBM3n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA8A10E189
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910534; x=1795446534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FLN4H/XfpajqxqvQuq/P16ES/dXbNkpC4h3t2FwdJ6o=;
 b=gfHSBM3nQ1B1WhfjzkPrSJAmsHQyP5CYTDB8r9tMtmJB/Hd4vUdMWqfH
 8phfSPh/zTYupRpKOsYhnMITiKGRh1S2iCzd6kTGm8EaMZIDX555bNc7J
 cE/zd9t+UugDZEZvfZh4NGpztoe3+Hzv0RlrWgbSErHXZ81rOmlz4d1/Q
 yU+B8vhLp/N4iqAjIw0OfABVOnWlkzjFlQwjGbwsxVL+iKOSVVsTPKrQ6
 hycOG7ipQRRSamZepShJiQgFaGok0fW6tjx/bDaCz8zjhDM9I6weBNEHO
 ciOGLVy8ZS6xI9Yn2DTO6o7hyNhTP/t9sCpsr69QqEJ1y6RupNyTUfaHl Q==;
X-CSE-ConnectionGUID: ibsJ0H7/RXOFF5x0TFyOPA==
X-CSE-MsgGUID: fbrdHxGKStCWj3juE0GkZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615216"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615216"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:54 -0800
X-CSE-ConnectionGUID: e1DXuXMhQEaF+iiaSAbYTQ==
X-CSE-MsgGUID: 8i8CSp7bQOOTYyBmNd4S+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903830"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:53 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 25/35] tests/kms_mmap_write_crc: use display-aware pipe
 CRC helper
Date: Sun, 23 Nov 2025 20:54:02 +0530
Message-Id: <20251123152412.599801-26-kunal1.joshi@intel.com>
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

Switch kms_mmap_write_crc to igt_pipe_crc_new_for_display so CRC collection uses the display mapping rather than assuming the pipe index matches the CRTC index.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_mmap_write_crc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index 74ba70edd..24f41e47d 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -210,8 +210,9 @@ static void prepare_crtc(data_t *data)
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
 
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					  IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display,
+					   data->pipe,
+					   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc for the white fb */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
-- 
2.25.1

