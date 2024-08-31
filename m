Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E0BC5474C
	for <igt-dev@archiver.kernel.org>; Sat, 31 Aug 2024 05:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0FC10E02B;
	Sat, 31 Aug 2024 05:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ItquPALG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBF510E02B
 for <igt-dev@lists.freedesktop.org>; Sat, 31 Aug 2024 05:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725083859; x=1756619859;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gl8TPs0OAQnSVnRT4gOBfEJlRmaCBZZINYLjk4OMEF4=;
 b=ItquPALGFlfmtlFHDSXFG/T+1fC3t244jlar6DxvtAnT8JCqJfZO86L2
 a5rDEq+o79Y+M51p2DC3yPfG6d2poXvjd5tiynJ5a/KYBFHxtOz24y/Ht
 0LDE54Ge9O6aYuGGAG3+rFqu75qBYoSyw+eb60aeoJPNsVQ2Qu+zNnS0e
 ojjvqkkzaQXOapan6k0FKDUEGAWCAKDVc/OjEwOK+r/OoeHUb7O+d6ex2
 SjgK+c38bWEXk7qWc33FZZ/0ZuRgNZxGZrqiyQkSZxairrW8azgTtH+Yd
 f1ooYEvWqU2A3v4WFG7OOEXSNqdh9gIz7G7tugTDwInt84Qqe1RMRvQfM w==;
X-CSE-ConnectionGUID: vGYtbcbdQLC5gmp3X4OwFg==
X-CSE-MsgGUID: xqyxlcv8QTKai2zGvB6J/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="34303422"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; d="scan'208";a="34303422"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 22:57:38 -0700
X-CSE-ConnectionGUID: fWttdtNBR/CMkgUyUr6lvg==
X-CSE-MsgGUID: IkHFORRvRiCbhPD3buVIfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; d="scan'208";a="94907387"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa001.fm.intel.com with ESMTP; 30 Aug 2024 22:57:36 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com
Subject: [PATCH] tests/kms_vrr: Avoid race between freeing display reseources
Date: Sat, 31 Aug 2024 11:28:45 +0530
Message-ID: <20240831055845.2839510-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.46.0
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

While freeing display resources, that schedules driver to execute
panel power off, which races while scheduling next immediate test.
Giving time after freeing resources allows driver to avoid race
between next non blocking atomic commit and panel power off from
previous test.
---
 tests/kms_vrr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 36a22eebe..481a4253f 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1110,5 +1110,7 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
+		//Wait for 2 seconds to free-up acquired display resources
+		sleep(2);
 	}
 }
-- 
2.46.0

