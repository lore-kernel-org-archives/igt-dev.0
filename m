Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81935C71155
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 11:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F11710E356;
	Mon, 16 Jun 2025 11:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ip7K4Czy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5BD10E352
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750073142; x=1781609142;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+S9tIRQ+DkiSNkZ2JTN3hW/LreL9nInE0WV4Mgo8S1Q=;
 b=ip7K4CzyzgkXmyJmmdV0XRtJiJtVo8Og4NnZ/v8WxWZZwEkquZop1x+v
 2wM5H/PihVBb1FCE4nugWSsiGHksiucwXwiLBwhapG4S35b3Tu8QChoga
 qcBoh/q0W87gl38pQumvmEl2OKOMULpob+f6n4TS2Z2aLLCsNFLH3bohn
 H0cJfD3hCi2i4T3Y/SZs/kyoSbzfiNJFLlI5xV9njnbH1g7/N/Vv4vQjx
 QER8GqE5iVoIQcqvWi+pYGO2WAbalh57+gS4A0GMiKSDKF9oWXAnrN1s6
 qksgmnVlGTEBBIXc7qsOXe6yhmrwZQ2ZlklPXGjq6uvpqEFEXyqdSQU/l Q==;
X-CSE-ConnectionGUID: c6osHX+tT26QTgLKMHA70Q==
X-CSE-MsgGUID: 1sYtxc9gSsKqD6Y4+K6L5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63245728"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="63245728"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 04:25:41 -0700
X-CSE-ConnectionGUID: wzZMAhoKQUa20RZ0AEYwRw==
X-CSE-MsgGUID: zRNnQq9aQmOb6SOhdoWTrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="185708849"
Received: from unknown (HELO DUT2943PVC.iind.intel.com) ([10.190.215.47])
 by orviesa001.jf.intel.com with ESMTP; 16 Jun 2025 04:25:40 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v2 0/2]
Date: Mon, 16 Jun 2025 11:25:35 +0000
Message-ID: <20250616112538.32551-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

IGT subtest eu-busy-10-sec schedules and execute compute workload on
multiple CCS engine instances. To check per engine instance is utilized
graphical representation of engine busyness is required. Functions related
to graphical respresentation are integrated in IGT test xe_compute which has
dependency on
Patch tools/gputop/gputop: Add per-device engine activity stats in GPUTOP

Nishit Sharma (1):
  tests/intel/xe_compute: Add Compute workload Scheduling and Display EU
    busyness

Soham Purkait (1):
  tools/gputop/gputop: Add per-device engine activity stats in GPUTOP

 lib/igt_device_scan.c    | 128 +++++++
 lib/igt_device_scan.h    |   1 +
 lib/intel_compute.c      |  29 +-
 lib/intel_compute.h      |   2 +
 tests/intel/xe_compute.c | 774 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 tools/gputop/gputop.c    | 638 ++++++++++++++++++++++++++++++++
 tools/gputop/meson.build |   6 +
 tools/gputop/utils.c     |  51 +++
 tools/gputop/utils.h     |  64 ++++
 tools/gputop/xe_gputop.c | 378 +++++++++++++++++++
 tools/gputop/xe_gputop.h |  62 ++++
 tools/meson.build        |   6 +-
 13 files changed, 2132 insertions(+), 8 deletions(-)
 create mode 100644 tools/gputop/gputop.c
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.43.0

