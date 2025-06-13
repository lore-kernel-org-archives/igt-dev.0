Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4153BC61DB2
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 08:02:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6F010E8F8;
	Fri, 13 Jun 2025 08:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYwMKTP2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B630A10E8F8
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 08:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749801775; x=1781337775;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CDQISs3E6Z9vCwyGIniybyz7QnYDLmxfdZKDPIfanCI=;
 b=GYwMKTP256JEY0Pp55vDeXOOGlMskY/ZHMr0med93YI/jbFmA/gHlH+5
 J4zr8NyA8rYkieZZUmTz90utzCE+Z/Fvk0PMpFPcdoBGamMx9zWGNe2ja
 884Vn3/YQhFePKikJ7uyCvU5YavJYimX83FDhCazGt/EUUWucm8C+X2Al
 hH/e1bWgDkhnRZAXasSuyxLlULniYWzV4MkyElNX7aR4l6TFxONUn+o97
 UW47eS/O0vVdB95K0A/U5YQ89uIsKEaJzr9rUfz9cAYntri/mD0ZdVPZP
 CcSNfEWHhlsDNooKPQpggnO3aEYypEi5OFzgUDoRVgAUn72klpBLuk5ly w==;
X-CSE-ConnectionGUID: vEyAk1ifRuGwKCousnEnUA==
X-CSE-MsgGUID: kY4hVpxnSum1cGpmPk3ffw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51726097"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="51726097"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 01:02:54 -0700
X-CSE-ConnectionGUID: QTCsEwu2RXuDxQAUFp3hsw==
X-CSE-MsgGUID: EIM5nEfDTL+fQgl648+S1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="178659695"
Received: from unknown (HELO DUT2943PVC.iind.intel.com) ([10.190.215.47])
 by orviesa002.jf.intel.com with ESMTP; 13 Jun 2025 01:02:53 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 0/2]
Date: Fri, 13 Jun 2025 08:02:49 +0000
Message-ID: <20250613080251.570961-1-nishit.sharma@intel.com>
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
 tests/intel/xe_compute.c | 756 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 tools/gputop/gputop.c    | 638 +++++++++++++++++++++++++++++++++
 tools/gputop/meson.build |   6 +
 tools/gputop/utils.c     |  51 +++
 tools/gputop/utils.h     |  64 ++++
 tools/gputop/xe_gputop.c | 378 ++++++++++++++++++++
 tools/gputop/xe_gputop.h |  62 ++++
 tools/meson.build        |   6 +-
 13 files changed, 2114 insertions(+), 8 deletions(-)
 create mode 100644 tools/gputop/gputop.c
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.43.0

