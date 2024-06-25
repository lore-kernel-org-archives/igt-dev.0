Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90123C3064D
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 13:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062EE10E19D;
	Tue, 25 Jun 2024 13:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUNC/KOF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A17610E676
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 13:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719323651; x=1750859651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=liVXgbEBMATQomXBTbiYppIJCMuprjGwqb+c5M++kmc=;
 b=UUNC/KOFGK0pxUmES1CvH3R7LPCl3oReMGLwm7/vs7zS52QxjmoHmd/Y
 ABBzMTmuM2rPqxvLx9Zg0ExfaVENCzSmRxEpf4aLKNlH0IhVtGpsQsuO/
 Cm2BEwPYnni6KdOlldtrvFNCzUoxbS4Sd0cus8bo5pb9mwQWiKOlFLzha
 d2aiD3tAkM/0R4N6H+j0fMFzpS1pwOi2UObN1rZHvoERUM4SLxGUqp7Yt
 memO9ujwG9wusDgWc+33/2y3WD5cUX7BKwfhXXFZu4sZNHIbdhXygBrB2
 MQF/uj+NW2cnkCVAd3DCq1Sqp3hqoy7oeYDCaz6HwT6WDuVSK/ih20ryv w==;
X-CSE-ConnectionGUID: Y4gIk4/3Rw6rhrs0Jq460g==
X-CSE-MsgGUID: V7HzjirNSWiyRmTMIJ4Ihw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16486695"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16486695"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 06:54:11 -0700
X-CSE-ConnectionGUID: x7/EIKpLQYi6+qNUabq69w==
X-CSE-MsgGUID: UE/uPLUFQEWUZ088z6osDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48644176"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 06:54:10 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_debugfs: handle xe driver as well
Date: Tue, 25 Jun 2024 19:36:03 +0530
Message-Id: <20240625140605.1420518-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240625140605.1420518-1-kunal1.joshi@intel.com>
References: <20240625140605.1420518-1-kunal1.joshi@intel.com>
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

add support for xe driver as well

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index a7b54bae5..f4f749e30 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -502,7 +502,7 @@ bool igt_ignore_long_hpd(int drm_fd, bool enable)
 
 static void igt_hpd_storm_exit_handler(int sig)
 {
-	int fd = drm_open_driver(DRIVER_INTEL);
+	int fd = drm_open_driver(DRIVER_INTEL | DRIVER_XE);
 
 	/* Here we assume that only one i915 device will be ever present */
 	igt_hpd_storm_reset(fd);
-- 
2.25.1

