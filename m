Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58673C27C6E
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 15:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11E810ECB7;
	Fri,  7 Jun 2024 15:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSFixY5e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EBC10ECB7
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 15:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717774621; x=1749310621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dy2vSqRu7j9fcl7Ekb5jSj3lh7Llrk3XiJdGNs8OXxo=;
 b=dSFixY5egSR1k0+VTr0e9PZVB60odbzhe4l8MY4nm5P7I49S3YDy4Iur
 zh4pQDomfacJ3MU6hBms+DdBc7aXB1hiqSQw1JZu8ZjdT1Y+j6prFZgVF
 WTB7awM5jaVvIOaYDQNmuizCfDfURFhZZ0xKoaJM4lRq0rRE0MnOaOTYS
 LHg4LvahWxk3K/CzdR5CDCUxk6GiqcUqBT+dE6qHl8Kdc3l9se8sD1Por
 yUxIpmCZVnM3S8Ya2V4ZZKPJyQ+Btlz9yd9odnm6VamwqbdqiI5NNpGMz
 jBU+ffQ2p2Oq6/ffTSHn3K3dHCuUCx2DOEfbFASoaSBJWs80w3xPqK27h w==;
X-CSE-ConnectionGUID: bVbyEFDmQbek50sucRCwEg==
X-CSE-MsgGUID: /JXMTLEQTrCXO9GS49ozJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14620092"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14620092"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:37:01 -0700
X-CSE-ConnectionGUID: TX1wdLcVSp6+dGw5VU3E1A==
X-CSE-MsgGUID: ZjOvSt+XQNWvxkVkHvK6CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38805269"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:37:00 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 7/7] tests/core_hotunplug: Skip if no render available
Date: Fri,  7 Jun 2024 17:36:19 +0200
Message-ID: <20240607153629.52596-8-kamil.konieczny@linux.intel.com>
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

All subtests uses render device for health checks so skip
early if it is not present.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_hotunplug.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 3b0135fc8..da3374123 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -737,6 +737,10 @@ igt_main
 
 		igt_assert_eq(close_device(fd_drm, "", "selected "), -1);
 
+		fd_drm = __drm_open_driver_render(priv.chipset);
+		igt_skip_on_f(fd_drm < 0, "No known DRM render device found\n");
+		igt_assert_eq(close_device(fd_drm, "", "selected render "), -1);
+
 		prepare(&priv);
 	}
 
-- 
2.43.0

