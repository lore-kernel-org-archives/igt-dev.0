Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1D0CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 06:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF66410E169;
	Mon, 11 May 2026 06:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cmX6yyul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EBF10E169
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 06:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778482762; x=1810018762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E0nkS1ER+zAiBL8DNwwgtr5tgxycLP0t629N1QFJxis=;
 b=cmX6yyulId0a4q8eHQZ/L9J4jOpY51k1FjYrx5306E/6ypAL4yk1OUXF
 /Zz5XvDOy/H44wtMnpAwgLdS24pb1LSU1vp1tQqE/K5mlorg7GP1xsoFo
 6DACLq1HE26tXlixrtvFitjBDNZk7336VQH26rNJZowoghsTAGgIq3iIW
 Ea1g/5HyiNKqpoC8aFfqsoHBaseKOUadbTREwdnNwdsO/yULhMpTpqByB
 GnkNPyl94Jt0UTh9t9W7ZGyxBxaUbvuNPxc2fEHaofOizGqiZg3116LgN
 OgK8WuCoHDBHCJ/SyhnVNgF/+/iDTmAm5AT3A9tbk3+GQUhjxYD0hCPD5 A==;
X-CSE-ConnectionGUID: xglIcMT9SJ+iT20srMjCEQ==
X-CSE-MsgGUID: 5seC8qgrRgilLafu0iRarw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="102027246"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="102027246"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 23:59:21 -0700
X-CSE-ConnectionGUID: HtMhKN5bRzq0j9LUTaBVDw==
X-CSE-MsgGUID: gg3+2B9iTtyFHhxN7vRqRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="234303372"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 23:59:19 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, karthik.b.s@intel.com, jason-jh.lin@mediatek.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_content_protection: Remove redundant
 cleanup mst
Date: Mon, 11 May 2026 12:23:31 +0530
Message-Id: <20260511065331.664260-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Remove the double FB cleanup from mst subtests. The remove_fbs already
handles removal and the kernel's RMFB path detaches active planes
automatically.

Fixes: b4036b1a0f19 ("tests/kms_content_protection: Add FB cleanup for MST tests")
cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
cc: Karthik B.S <karthik.b.s@intel.com>
cc: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 6974b57e7..2c02ddfd2 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -1010,19 +1010,6 @@ test_content_protection_mst(int content_type)
 
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);
-
-	/* Detach planes before removing framebuffers */
-	for (count = 0; count < valid_outputs; count++) {
-		crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
-		prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc, false);
-	}
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	for (count = 0; count < valid_outputs; count++) {
-		crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
-		igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].red);
-		igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].green);
-	}
 }
 
 
-- 
2.34.1

