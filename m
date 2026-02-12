Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F09EDF020
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 03:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7D310E1FD;
	Thu, 12 Feb 2026 03:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YO8KC8iO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E50D10E1FD
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 03:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770866535; x=1802402535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c+9EFuw0LRZ43OeNIE4KJWTYmsmjwX0dbjpwUtzzJEI=;
 b=YO8KC8iO/NGJrvulOaHFZMoz9b8okRTMOfm9XjZqpOgH6GBpXTF0KK2h
 MwLU49GoD5CCnVkF3llFQhtTdAXSdzQOCIGMSvnJz4Zav75Va3I+HzeZl
 d209ZbAkNftn5dw4gFmxmWUo7FqbvxPRL/RlSCrf5k9aQHkQ4V7vHlGzG
 S/00w+r/Pipu9AFX14ub0mVmxGmIZn/gWmWuRAkzCr6vg4br+ZDLT8/Uc
 uhNlPXTweRSU7yADBUBhN/aW8WFPiX/zRuDHFVVTZBFIcfBX5EGiqRx2N
 moi4YUvfmbbIey2NFRHm/MVwKjSDJu72BhBJoj6msk1tKae6G4mm1QofB g==;
X-CSE-ConnectionGUID: Z8q/VxuaSrSaZF8jLiZzsw==
X-CSE-MsgGUID: b/I8kQOtTv6HjhV0R7+g8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="82667079"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="82667079"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 19:22:14 -0800
X-CSE-ConnectionGUID: 7fTmx/w8R/CKDecRsipOCw==
X-CSE-MsgGUID: 1U1syrNHQPO8bf6fvfXnqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="216613953"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 19:22:13 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/kms_color: Skip the test early if no outputs found
Date: Thu, 12 Feb 2026 08:48:16 +0530
Message-ID: <20260212031816.896622-1-karthik.b.s@intel.com>
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

Add igt_display_require_output call in the initial test fixture to avoid
skipping the subtest down the line if output is not found.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_color.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index a50793651..aea7e008f 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1168,6 +1168,7 @@ int igt_main()
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
 	}
 
 	igt_subtest_group()
-- 
2.43.0

