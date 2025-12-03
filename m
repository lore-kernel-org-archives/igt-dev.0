Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52F3D116F3
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DE210E746;
	Wed,  3 Dec 2025 09:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7YYSLoY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD1E10E746
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764753898; x=1796289898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cxV+sLLnCTNdGb9Say8f39blE1C+c+ythfWAC2erbj4=;
 b=k7YYSLoYuJpX4BdiLtiUzo8nIM0NpC3QvjcR8c76l4ZP0pWAHt5VIWaS
 iv8iilQwVV1+AxOBb7+egfGb81lGMD5p6goFsN3A0Kg7IlxuDdcLSgAqb
 tqYFtdMdkmspqDaqoHJV+Azc+bFVz7K9WY6mo200yuf23OFFgw10hhGm9
 /b/1gPvdQWKpXZmK7vhpL7x0oAUfaNdRmymS1yA52HTkg7sihV6SYRfTy
 qub597168UTblWtEE/wKjs4BrWWe2+awD+QbB7rBxg9ImLCzH3NJ8v42y
 vZdLHsJXc1J+EKHO8dtP60FUebpluGIj//ccmbQ2gc/tnelZc/KvenNpW g==;
X-CSE-ConnectionGUID: BHDDDgi6RXmj1w6sdVmv6g==
X-CSE-MsgGUID: /keLn1FGSHWIf5mvViKeqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66783632"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66783632"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:24:58 -0800
X-CSE-ConnectionGUID: S+spXBVdR16GSD1vKEcUew==
X-CSE-MsgGUID: VOB9VoPvRfyQ78/XDbtFLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="199569601"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:24:56 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 3/6] tests/kms_writeback: Add intel specific check
Date: Wed,  3 Dec 2025 15:13:04 +0530
Message-ID: <20251203094307.3187669-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251203094307.3187669-1-sowmiya.s@intel.com>
References: <20251203094307.3187669-1-sowmiya.s@intel.com>
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

Add intel checks for platform specific execution.

v4: Restore drm_fd added in struct and access it from
    igt_display_t struct
Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 15917d2e1..473f6c58c 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -290,7 +290,7 @@ static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *
 
 	/* Zero WRITEBACK_FB_ID */
 	ret = do_writeback_test(output, 0, NULL, false);
-	igt_assert_eq(ret, 0);
+	igt_assert_eq(ret, is_intel_device(output->display->drm_fd) ? -EINVAL : 0);
 
 	/* Valid output buffer */
 	ret = do_writeback_test(output, valid_fb->fb_id, NULL, false);
@@ -405,7 +405,8 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
 
 	/* Two commits, the second with no writeback */
 	out_fbs[0] = output_fb;
-	writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
+	if (!is_intel_device(output->display->drm_fd))
+		writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
 
 	/* Two commits, both with writeback */
 	out_fbs[1] = output_fb;
-- 
2.43.0

