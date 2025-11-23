Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28726CFD2F6
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A4B10E189;
	Sun, 23 Nov 2025 15:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0CwSUCu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E97B10E179
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910514; x=1795446514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Ydh7NVLJoXfkgp/TSiYfayHtQG1CPHy3z/vsYJ5YWY=;
 b=F0CwSUCuDdKrWROYIaxTwIJS7myRJV3xkhJRwsfO7M1WmEMKJ8T/NUny
 AUGic+bXXjINAGPSzuX78WgN/DQmoSriaVOTE7M1C8XwJYW7JAeGvJQEe
 1BIL6LQZW7W2seteej3CfszjSG9t1SxyQbDzD3gQMtnbX71fJTXZ3CHe8
 84X1yjdFvcuNQ1reyA57z2iJsUhHPi+06sqyha3lkFR/Pp3wjWFREpvXc
 3qQB205+T+DrvVpE/le4KCsYTGyu8LxLV3nN14ux7vTXs/tY3TCOFnhE5
 vb78Sunz6SCjzQeY6njL3rAJfyUOZGE/AmmH3+VpKaWgE7JyGwKp5+mj5 Q==;
X-CSE-ConnectionGUID: X2QYBDfyTPSGiqJ17skLPQ==
X-CSE-MsgGUID: v0si5gAxRqKPoPwcxhVPYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615177"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615177"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:34 -0800
X-CSE-ConnectionGUID: A7D3uDMQRcuBmH9HJNZo0w==
X-CSE-MsgGUID: svi59qo0SqK/Emr6uyUz+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903759"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:34 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 11/35] tests/kms_async_flips: use display-aware pipe CRC
 helper
Date: Sun, 23 Nov 2025 20:53:48 +0530
Message-Id: <20251123152412.599801-12-kunal1.joshi@intel.com>
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

kms_async_flips created pipe CRC helpers with igt_pipe_crc_new(fd, pipe, ...),
feeding it a pipe enum derived from kmstest_get_pipe_from_crtc_id(). That
implicitly assumed the logical pipe enum matched the CRTC index used for the
crtc-<index>/crc/ debugfs paths, which can break when CRTCs and hardware pipes
are not in a simple 1:1 mapping.

Switch the CRC user in this test to use igt_pipe_crc_new_for_display(&data->display,
..., IGT_PIPE_CRC_SOURCE_AUTO) so that the CRC debugfs paths are derived from
display->pipes[pipe].crtc_offset instead of the pipe enum.

This makes kms_async_flips robust to non-trivial CRTC index to hardware pipe
mappings while preserving the rest of the test logic.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_async_flips.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index cbe38889e..eae0d61f3 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -853,9 +853,9 @@ static void test_crc(data_t *data)
 			     &data->output->config.connector->connector_id, 1, mode);
 	igt_assert_eq(ret, 0);
 
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
-					  kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id),
-					  IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display,
+							  kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id),
+							  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_pipe_crc_start(data->pipe_crc);
 	igt_pipe_crc_get_single(data->pipe_crc, &data->ref_crc);
-- 
2.25.1

