Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA2AC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 15:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BDE10ECC1;
	Fri,  7 Jun 2024 15:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWvvfv1I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEEA10ECC8
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 15:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717774614; x=1749310614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x/P44GVB4lHahQWYDf2JeMO1td/YziSTA3X77SCAqiA=;
 b=EWvvfv1Ijxx4CjfvnN9V2/kWVBLS8L6NyXSV4+cHetAOdzwZWLL/jg6I
 CLbdLt+GSGU1oHlrRxQH5pkL7kXAV9ueSb5op7F7UeA7mbGeJNDbywSAJ
 IWON1K6JlGX7W/b1FjkyA084nN0bkPKOH4BjqPuCgu4tetU2aO+2nGpKK
 2x0/Vei9HGvttC8oiKdjfpsvRz8YZIBoyf1qQWSZheoxd4TR6jl9iN5v9
 ua7fHcONYBwv5WhtCGm5kAfjagjP6TrHocHshMEk9yWUpBhawUlQ1oK9u
 yFvpFpG371HgC4H0mp8HsB5gtf6v49vhP5OVlqvZYsyS2aEjQWMRUnWvn Q==;
X-CSE-ConnectionGUID: 4Y2Ho/uIR3+m2pTewIy2Ug==
X-CSE-MsgGUID: n3oUo+mTTAaq3/Ry9WvvZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14620075"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14620075"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:36:53 -0700
X-CSE-ConnectionGUID: D9xxcHkbSSSsiJch0b5JoQ==
X-CSE-MsgGUID: 0a7id8fUTgGRuLHk3YjCgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38805267"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:36:53 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 5/7] tests/core_hotunplug: Open the same driver
Date: Fri,  7 Jun 2024 17:36:17 +0200
Message-ID: <20240607153629.52596-6-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
References: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
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
---
 tests/core_hotunplug.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7ed9abd37..ddf11bb00 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -710,11 +710,16 @@ igt_main
 
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

