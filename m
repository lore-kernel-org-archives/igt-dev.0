Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777D7C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 14:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C02110E21A;
	Mon,  5 Aug 2024 14:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fw5fl0u1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BECA10E21A
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722868658; x=1754404658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fafvuHQ1m4KCJj0fMk9NDRQlWGdglwGk0IQs2Lfi9G0=;
 b=fw5fl0u1peROZ13uTc4MRvSE65R7H6GUGkCdvohZClahXtHFkHS/76M0
 wgv54wVM/uICfAgI1CbgV8IA2JzesLfJVq/9z7gDyi4ucZXwmfzv9HqKW
 Yb+pHFn7JijClkjjoxJapej1csR1wf2HlxCotFp0q+z/WWZnrNpIzVbKM
 Np+Dc5YRFCOUO8uuf+dGFSfacX9oj70PEWnEIKsdfHKrnbw8pFM3Tzbem
 Ir/tZq+xeos73RRzPRDQ96tavYOGVaUf6HcBSvuiXYmy0xOyPcKJ0JuXI
 LEtPeepaFyjO3OLnyulTDK0GS+718pEjed4mXq28SBrimsD5JUWd4zoul A==;
X-CSE-ConnectionGUID: kKUcx0vQTLONcCjUJs7yaw==
X-CSE-MsgGUID: MtNDm29+RVOtNGlutkWVFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24702281"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="24702281"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:38 -0700
X-CSE-ConnectionGUID: qajhBktTRTyD+iLNPRhfXg==
X-CSE-MsgGUID: COsTsfi1SDGz8kNXGgrLbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56755020"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.245.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:37 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v2 4/8] tests/core_hotunplug: Open the same driver
Date: Mon,  5 Aug 2024 16:37:07 +0200
Message-ID: <20240805143713.76034-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
References: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
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

Make sure any later opens will use the same driver as the first
one. Also while at this, print driver name before test starts.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/core_hotunplug.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 617332b0f..cc715a234 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -681,11 +681,16 @@ igt_main
 
 	igt_fixture {
 		int fd_drm;
+		char driver[32] = {};
 
 		fd_drm = __drm_open_driver(DRIVER_ANY);
 		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
 
 		priv.chipset = drm_get_chipset(fd_drm);
+		/* Make sure it opens the same driver */
+		__get_drm_device_name(fd_drm, driver, sizeof(driver) - 1);
+		__set_forced_driver(driver);
+		igt_info("DRM driver: %s\n", driver);
 
 		if (is_i915_device(fd_drm)) {
 			gem_quiescent_gpu(fd_drm);
-- 
2.43.0

