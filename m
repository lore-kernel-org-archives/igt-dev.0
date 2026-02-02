Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E71E73144
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 08:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAFA10E3B5;
	Mon,  2 Feb 2026 08:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPtZ68I7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED7410E39F
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 08:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770020668; x=1801556668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MJ94q3FhYLIUN56vUQ7t8u3wDmRjwCwOwwZUCwEhDfI=;
 b=aPtZ68I7vRzRUXzKbDl+bw8Uc3PfKE4zZpogxbpR+9X7q8A7914GE/l7
 yDjaIjs7tQmF7c6u/OYeoIrynTYLhVyTmkeEj/BXpu6yf9i2Xe0mHKshQ
 3BEHNBf+qBHqp3RdoDeSuYNzggAUZo459EBRrZZTU9yuYETfNgASQA7gY
 JBRYLuxMpEc01fV6wyYXQjeX6Li5OB0pkxEXDUVaSJlWi/AZWCY0oEfaP
 Ac++vZCEkgghKd88JKZLDbt2+bWvIG1w4ucIWiDPaMxwaKrZzPfzLimSn
 0M1GprsHj9urliXc+MUF74GHEHH8bavRAuX/eSWfikijzq6kpK/M2LER/ g==;
X-CSE-ConnectionGUID: p9BqowpCTrit2u7ch+bYsw==
X-CSE-MsgGUID: trwGo8J0Qiigf7ioO01WrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="58756438"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="58756438"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:24:28 -0800
X-CSE-ConnectionGUID: SrjpPNpoT5icFa7H6S4Nsw==
X-CSE-MsgGUID: WLmNDKPMQM+YO74PHZPzTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209455100"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 00:24:27 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 4/6] tests/kms_pipe_crc_basic: Use cleanup framework for
 pipe CRC
Date: Mon,  2 Feb 2026 14:15:37 +0530
Message-Id: <20260202084539.2524306-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260202084539.2524306-1-kunal1.joshi@intel.com>
References: <20260202084539.2524306-1-kunal1.joshi@intel.com>
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

Register pipe CRC resources with igt_cleanup_register_pipe_crc() after
creation. The exit handler will automatically clean up registered CRC
resources on test exit.

Remove manual igt_pipe_crc_free() calls at end of test functions since
the cleanup framework handles this automatically.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_pipe_crc_basic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 455b44d38..386cb15ef 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -275,6 +275,7 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
 
 	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
 				    IGT_PIPE_CRC_SOURCE_AUTO);
+	igt_cleanup_register_pipe_crc(pipe_crc);
 	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 
 	/* Flip FB1 with the primary plane & compare the CRC with ref CRC. */
@@ -285,7 +286,6 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
 	igt_assert_crc_equal(&crc, &ref_crc);
 
 	/* Clean-up */
-	igt_pipe_crc_free(pipe_crc);
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_crtc(output, NULL);
 	igt_display_commit(display);
@@ -302,6 +302,7 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 
 	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
 				    IGT_PIPE_CRC_SOURCE_AUTO);
+	igt_cleanup_register_pipe_crc(pipe_crc);
 
 	igt_display_reset(display);
 	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
@@ -331,7 +332,6 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 	igt_assert_crc_equal(&crc[0], &crc[1]);
 
 	/* Clean-up */
-	igt_pipe_crc_free(pipe_crc);
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_crtc(output, NULL);
 	igt_display_commit(display);
-- 
2.43.0

