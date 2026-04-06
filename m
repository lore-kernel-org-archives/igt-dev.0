Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B02FB5173
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 23:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9417C10E056;
	Mon,  6 Apr 2026 23:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OREu+MtQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA0010E056
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775517344; x=1807053344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sJJKDdFy+iog+vhT4HWFbTznC2qAIteV9koq7VZaOBo=;
 b=OREu+MtQWnFsItx18YrU79X0a/Fg78tshYT0W6MLs+/qlp5d4tUhwRK3
 gZXabggaDjrcJdswEIiInDXn4Suj4Bf0JOiKyMKjMcMp6w0KQeev30NJC
 hwn7q0eFbWQWa1y9wy9lMKNBRUG+44FxcXN74zCxgjBg5+ELwqPKdM1YK
 w9k3v20cQ4fdngv33BCpqyNc0IzxjwZgySyVTkp9et7bcAR3FTAvvxxra
 lBHA/+N5HSRTyIADv+r5wqelK4pmSkw116G2QC/vGJ3SEkuksqJCPxHbV
 gfrjdOgKeIbfrBS/GthArDwzp9YbjvfcC3gygfHIo4u5KE/Ziqs6FLRls w==;
X-CSE-ConnectionGUID: 1DP8WAvqQTOn7fcJn7l9jg==
X-CSE-MsgGUID: MKMypGsPQ3awKxm2tkZ6JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76660628"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76660628"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 16:15:44 -0700
X-CSE-ConnectionGUID: LMrDGzlAQLe79H4vVcUfCA==
X-CSE-MsgGUID: sG+GEKnsSgefTPyzI//QMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="227164739"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa010.jf.intel.com with ESMTP; 06 Apr 2026 16:15:43 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: x.wang@intel.com, Zongyao Bai <zongyao.bai@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v3 2/5] tests/intel/xe_pat: drop redundant manual srand
 initialization
Date: Mon,  6 Apr 2026 23:15:37 +0000
Message-ID: <20260406231540.3238758-3-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406231540.3238758-1-zongyao.bai@intel.com>
References: <20251119231900.3797119-1-zongyao.bai@intel.com>
 <20260406231540.3238758-1-zongyao.bai@intel.com>
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

Remove manual seed initialization and srand() call from igt_fixture().
The IGT framework already handles random seed initialization via igt_srandom()

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_pat.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index e53e08877..79f9a87aa 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -2213,15 +2213,8 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	int fd;
 
 	igt_fixture() {
-		uint32_t seed;
-
 		fd = drm_open_driver(DRIVER_XE);
 		dev_id = intel_get_drm_devid(fd);
-
-		seed = time(NULL);
-		srand(seed);
-		igt_debug("seed: %d\n", seed);
-
 		xe_device_get(fd);
 	}
 
-- 
2.43.0

