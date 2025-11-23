Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696ADCFA46B
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1843610E17F;
	Sun, 23 Nov 2025 15:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dS9JdP/9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE7610E056
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910521; x=1795446521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yJFEVfiD+Fx4YbLQlzxLicw4zZCO9sC7ksNGGHnRji4=;
 b=dS9JdP/9YGXEpeiLBsMZ//Z4fLmD/OwkbA14dn7GOS63yhkkYtefFMsO
 UT7UASpt2NzI+wlORu8Lip9nEormqgh8M9LCxjb9HwXYRd6ZJK/2+Wv32
 3rhQSgpkZucG7Tv1m7Yx1WytlBZ6JZJaZxdyg+HPiZfODN3fNfvt36wsO
 ELT8m3RLEPZ75PewfEWP8VLqctl0lfKbpWE4EAgUH29m/iVADeLfIFbHG
 lfl00mFpUxzTUB5QNhlkdhloaCz3sjmX415Fk2yDp5c1J+qMJkKbSBHgW
 Bv/KxpBAa71PPXkLwuU24yBarJRnYrKvrJmFhwtOUxkdl35EhSGqjjq+E Q==;
X-CSE-ConnectionGUID: 0917jS6vTTm34cOxzfUsqw==
X-CSE-MsgGUID: M1Cl6yzLQ/2oPidYkGYH0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615195"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615195"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:41 -0800
X-CSE-ConnectionGUID: IwTzdxbXTBG3LuDWD0VF+w==
X-CSE-MsgGUID: Dfrubby3TmmtS3vaj3LotQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903787"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:41 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 16/35] tests/kms_sharpness_filter: use display-aware
 pipe CRC helper
Date: Sun, 23 Nov 2025 20:53:53 +0530
Message-Id: <20251123152412.599801-17-kunal1.joshi@intel.com>
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

kms_sharpness_filter created pipe CRC helpers with igt_pipe_crc_new(fd, pipe, ...),
keying them directly off the logical pipe index. That assumed the pipe enum
matched the CRTC index used in the crtc-<index>/crc/ debugfs paths, which can
break on platforms where CRTCs and hardware pipes are not in a simple 1:1
mapping.

Switch the CRC helper setup in this test to use
igt_pipe_crc_new_for_display(&data->display, data->pipe_id, IGT_PIPE_CRC_SOURCE_AUTO)
so that the CRC debugfs paths are derived from display->pipes[pipe].crtc_offset
instead of the pipe enum.

This makes kms_sharpness_filter robust to non-trivial CRTC index to hardware
pipe mappings while preserving the rest of its logic.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_sharpness_filter.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index ef3ce3995..2f983a982 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -369,8 +369,9 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
 	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
-		pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
-					    IGT_PIPE_CRC_SOURCE_AUTO);
+		pipe_crc = igt_pipe_crc_new_for_display(&data->display,
+							    data->pipe_id,
+							    IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 	}
 
-- 
2.25.1

