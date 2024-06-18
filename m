Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D9DC27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 05:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E8C10E1B9;
	Tue, 18 Jun 2024 05:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGE0biy1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B004610E102
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 05:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718688221; x=1750224221;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wq7yhYip5dHwEINAnXLsshbMtWiRt7hHnsq/Qqhv2hc=;
 b=LGE0biy14vZ0HSO/FBSmLpMo5cZlcOmyLKr/KjhXykClEiCvYnjP1/PL
 N6I+edmS6A4g4J5TKj2BdAZQCZmgncwmtqogfExS77BRJ9u1mlRoClDbo
 ruGuvjcmpzrdEbK1zPwBJhLIUm015jXzjQyH/l6kRqcOl5DCwRc6clMcr
 vXtcjkAQchVxc35E/qIdaXjhmw2Poc+q5Uk/VeeOUAFjdzXVH0UFk2k11
 4JVCtsWSU95dEt8ZL95SD3kOG4dTT0onIlPvXDIzW0tDQxbdfcPDcuzDQ
 dzJrc5DhU/MUURX95BOV1fDSZ2GFgYr61tUSnoX23j8b1UylT/tSXPAh6 g==;
X-CSE-ConnectionGUID: N/vUXk4tRW+NQyM3OCuKNg==
X-CSE-MsgGUID: w04BYa+kTVudfB7rdgwOsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26660053"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="26660053"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:23:40 -0700
X-CSE-ConnectionGUID: NVI8L5ecQxKDtgFyQSC82g==
X-CSE-MsgGUID: ePoEhZ3LSraBmJuJ5HuNYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41525072"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.150])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:23:39 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 00/12] Introduce intel_tiling_detect tool
Date: Tue, 18 Jun 2024 07:23:23 +0200
Message-Id: <20240618052335.152588-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

I'm going to verify all tilings we claim in intel-cmds-info as
if I'm not wrong we have Yf tiling instead Tile4 on early gen12
platforms (TGL, DG1).

For the above I need to verify are documentation and code correct
and if not fix it.

v2: addressing comments

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Zbigniew Kempczyński (12):
  lib/intel_bufops: Fix offset returned for Tile4
  lib/intel_bufops: Fix mapping/unmapping for i915 and xe
  lib/intel_bufops: Add linear-to-none copy path
  lib/intel_bufops: Add Tile4 in linear_to and to_linear helpers
  lib/intel_bufops: Add Yf tiling
  lib/intel_blt: Add Yf tiling in block-copy
  lib/intel_bufops: Add Ys tiling in linear_to and to_linear path
  lib/intel_bufops: Drop unnecessary Tile4 function assignment
  lib/intel_bufops: Preparation for adding software tiling for Tile64
  lib/intel_bufops: Drop Tile4 swizzling
  lib/intel_bufops: Don't disable x and y on platforms without swizzling
  tools/intel_tiling_detect: Introduce tiling detection tool

 lib/intel_blt.c             |   4 +
 lib/intel_bufops.c          | 146 +++++++-----
 lib/intel_cmds_info.h       |   1 +
 tools/intel_tiling_detect.c | 444 ++++++++++++++++++++++++++++++++++++
 tools/meson.build           |   1 +
 5 files changed, 540 insertions(+), 56 deletions(-)
 create mode 100644 tools/intel_tiling_detect.c

-- 
2.34.1

