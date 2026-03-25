Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706A7106B503
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 11:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD5B10E7F2;
	Wed, 25 Mar 2026 11:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAqrG7fX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C12C10E7F2
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 11:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774439615; x=1805975615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vej2PEfWx1lnuHCXz5A8abSxnmPKUTPRnu4sMvgIAbQ=;
 b=MAqrG7fXlsu3KCiFjE9/c0FqKFXoJqynpQ2ZK78WDUTiyUTVBKWkDf6L
 I/phEfbAR8Q2y+YKL1813GlSk/7WC40tGQM+c2IIfT3aP/s+paw4tRvHJ
 qT9Tx8O+hcKYQTB5LYr2VAq1xhOzWgVcktXYyoq4guW2iYcTIDEvV0j/j
 7sh68+I4hQcw0uzUylx4XbYqvMDupwiP9QWU4RklBPv5PlG9B+K4vsokp
 dzBlrAwqJqi7hX7TZCCe4fC5LcYkOVEdyBE4VZLiWqJLboz84kM1swQ7J
 wYccoM22+ME0XqfKcuI3p2RoZ73y7LZpKzbwzCdvUjQRG40/V7tRxiBPR Q==;
X-CSE-ConnectionGUID: VWygw9BOTZeTDOvPV/ZwBw==
X-CSE-MsgGUID: bt5+3iGqRm2W7fs6qLQKrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79329155"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="79329155"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 04:53:35 -0700
X-CSE-ConnectionGUID: mww1/26ATHmkJkL45ndT7g==
X-CSE-MsgGUID: 0pUiCDlvShWGDTWpq300hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="224615419"
Received: from skishor1-nuc12snki73.iind.intel.com ([10.227.88.189])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 04:53:33 -0700
From: sumit kishore <sumit.kishore@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sumit kishore <sumit.kishore@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip test when no display
 is connected
Date: Wed, 25 Mar 2026 17:22:11 +0530
Message-ID: <20260325115211.316735-1-sumit.kishore@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add igt_display_require_output() to skip the test on headless systems
with no active display connected.

v2: Add igt_display_require_output. [Karthik]
v3: Update subject and description. [Swati]

Signed-off-by: sumit kishore <sumit.kishore@intel.com>
---
 tests/kms_plane_alpha_blend.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 3a67dd8cd..3a2649833 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -764,6 +764,9 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_display_require(&data.display, data.gfx_fd);
 		igt_require(data.display.is_atomic);
 
+		/* Check if at least one active display connected */
+		igt_display_require_output(&data.display);
+
 		/* Get active pipes. */
 		for_each_crtc(&data.display, crtc)
 			active_crtcs[last_crtc_index++] = crtc->crtc_index;
-- 
2.43.0

