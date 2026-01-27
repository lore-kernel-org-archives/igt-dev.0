Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988E3D25932
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 04:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3081710E26F;
	Tue, 27 Jan 2026 04:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NW+zvpTp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B101B10E1FD
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 04:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769487138; x=1801023138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Im7NvUNdA9ouh5fJ5OP8f1iZYUEsM4OKNKN2Nhbh4/k=;
 b=NW+zvpTpUi/+755PNb10RoPuiodyVfX9yWe91bx69Bfp7vpAhUZHVJ77
 g32QE5Ia/e9FjlaOIKFOprKRHclPo353CKAkrx3KMv3Mu4xDfy1LpZ45F
 fSd0nhyQi70XCGnsWjcrnTtgt/CzNBP9UyUgHe2PR+cXBfRNgySq71dC6
 zuN4q3AmaYtG0RDRiU8G8fWrq4Btq/4TYKM4vuGZIvkIKHu8EfxsEbxlp
 PzVF/e0t0tjdCRuk150xy6NV3yjmyOatGLBGi28e5eRIJ6eAsWbeM5j3s
 qHBk/M+M/LmPZYBdNiODh+CjHT+DT3GUBkAwfJH/kgljSbANGriEZAE1P w==;
X-CSE-ConnectionGUID: iE9Wyy9rQFS3Hzww+/exWA==
X-CSE-MsgGUID: Tz4xvHKgSjq+PwpnFeVMPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81783914"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81783914"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 20:12:18 -0800
X-CSE-ConnectionGUID: gd1OkeABQgK+jK7w+FZ+jw==
X-CSE-MsgGUID: LxgNCV6MTLi+JiVcosmMOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="212724493"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 20:12:17 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v7 3/9] tests/kms_writeback: Update checks for zero FB
 ID and empty writeback commit
Date: Tue, 27 Jan 2026 10:02:27 +0530
Message-ID: <20260127043233.254107-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127043233.254107-1-sowmiya.s@intel.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
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

Intel prohibits committing a framebuffer with fb_id 0
or performing an empty writeback commit. Update assertions
and validation checks accordingly to reflect this restriction.

v4: Restore drm_fd added in struct and access it from
    igt_display_t struct (Suraj)
v5: Revise commit message and subject with detailed
    explanation. (Suraj)
v6: Revise commit message (Suraj)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_writeback.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 691774777..defe43686 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -291,7 +291,7 @@ static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *
 
 	/* Zero WRITEBACK_FB_ID */
 	ret = do_writeback_test(output, 0, NULL, false);
-	igt_assert_eq(ret, 0);
+	igt_assert_eq(ret, is_intel_device(output->display->drm_fd) ? -EINVAL : 0);
 
 	/* Valid output buffer */
 	ret = do_writeback_test(output, valid_fb->fb_id, NULL, false);
@@ -406,7 +406,8 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
 
 	/* Two commits, the second with no writeback */
 	out_fbs[0] = output_fb;
-	writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
+	if (!is_intel_device(output->display->drm_fd))
+		writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
 
 	/* Two commits, both with writeback */
 	out_fbs[1] = output_fb;
-- 
2.43.0

