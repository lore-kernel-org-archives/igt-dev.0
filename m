Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389F4CF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 22:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB3410E4A6;
	Mon, 23 Sep 2024 22:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDq4ZYW/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B65C10E4A6
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 22:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727129516; x=1758665516;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aL8dKx5qDx/Ho00hionYiaO1Sim5gJjTFUnnz75rtvM=;
 b=LDq4ZYW/8OEzl4n7PasYQ2wiMYMAHtVikEtOO24iWVKs1lxwahIBWaqo
 XqE0Y4LFz1sOT3q7QbMEZJtitbb4SKMFmaLdsNGM6SJHz62wd7rW2iHmC
 Ku2hoxdRvzV/nwNS+f88pNalfgrdxzrpkWsTzITHVmBjjmFwtZTON7wsF
 KMSVtx8ab3seviaFc5N8xca+lebWS4KkhHpiGTchm3rvNLBun90rAir/6
 TMW8ZS9DRuq0T67TwbxofAN/KKKuLNS5tGM+a4xyruHXdgEtOn9v8Z8KZ
 w0vbhqb3Ji2Uh4tnmAyYuwBDsRVW2gxQLJzmMzloN2SIaf+TPdisYXO5h A==;
X-CSE-ConnectionGUID: YBZgJY/iR5O+X7PTGQ/FDA==
X-CSE-MsgGUID: VIw13lp6SP2aKFuKwV/EGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43615578"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="43615578"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 15:11:56 -0700
X-CSE-ConnectionGUID: wptf6RItRWmjLivlBc8MZQ==
X-CSE-MsgGUID: ecrp5I7KQbKlEPQNfCY9EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71244247"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.110.192])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 15:11:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 0/5] Add forcewake support for xe
Date: Mon, 23 Sep 2024 17:11:41 -0500
Message-ID: <20240923221146.125848-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
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

Add forcewake for xe, both in tools and tests.

v2: Use a new igt_open_forcewake_handle_for_pcidev() helper
    rather than changing tools and lib.

Lucas De Marchi (5):
  lib/igt_gt: Fix forcewake open
  lib/igt_gt: Make igt_open_forcewake_handle() xe-compatible
  lib/igt_gt: Add igt_open_forcewake_handle_for_pcidev()
  treewide: Fix intel_register_access_init()
  lib/igt_gt: Stop passing fd == -1 in igt_open_forcewake_handle()

 benchmarks/gem_latency.c       |  2 +-
 lib/igt_gt.c                   | 50 +++++++++++++++++++++++++++++++++-
 lib/igt_gt.h                   |  3 ++
 lib/intel_io.h                 |  2 +-
 lib/intel_mmio.c               |  6 ++--
 tests/intel/gem_exec_endless.c |  2 +-
 tests/intel/gem_exec_latency.c |  2 +-
 tests/intel/gen7_exec_parse.c  |  2 +-
 tests/intel/xe_oa.c            |  3 +-
 tools/intel_display_poller.c   |  2 +-
 tools/intel_forcewaked.c       |  4 +--
 tools/intel_infoframes.c       |  2 +-
 tools/intel_l3_parity.c        |  2 +-
 tools/intel_panel_fitter.c     |  2 +-
 tools/intel_perf_counters.c    |  2 +-
 tools/intel_reg.c              |  6 ++--
 tools/intel_watermark.c        | 16 +++++------
 17 files changed, 79 insertions(+), 29 deletions(-)

-- 
2.46.1

