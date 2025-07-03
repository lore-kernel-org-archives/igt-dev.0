Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CF5C83F03
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 15:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB2B10E883;
	Thu,  3 Jul 2025 15:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U66fARFJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FEA10E887
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 15:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751555997; x=1783091997;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ll6Lylmk/61R1ZcoiB05WjUQkV3QgTHBjWRFNvp+9p8=;
 b=U66fARFJlcuDnFyEp1dDVQDTLGRwCh3/X92da6S9DIgEOezhIk6JMxbF
 yzB73KABogjyTd6yozSZ42aMbK68S6K6SsCEUR7MKVSqUVf5xzry/wPdC
 4W1ro54+OkBNfPcfX5ZVt9lJ7v6/4fGxetWUFDqvgwJyAs09mcrChSJwi
 BZsKLKQjFYzKdTx/mrxsZ1dXWjI/vXJ6bzWPJP4N9BjgB1QfyR+pFNcOA
 ZY+j0DXzIayrefiPEbKjar51TxlE5kcj02+DjSch2tj9cwBpsee9FRZT3
 UcOIIJZsE8QRDuoBO+lay/MWtcrIbRYqe1JrkMRsaEG/A5Bw8jf6Nx3Pi A==;
X-CSE-ConnectionGUID: K4zFGCXzSYy9gjE7WAw78Q==
X-CSE-MsgGUID: 6nZWX0n4SPq9Gtdh2merMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79326845"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="79326845"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:19:57 -0700
X-CSE-ConnectionGUID: +OK1rEEZQdqmB7GjII1biQ==
X-CSE-MsgGUID: XvDZ8Jb9TjWKkNAqmxkbxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="191575644"
Received: from unknown (HELO DUT2943PVC.iind.intel.com) ([10.190.215.47])
 by orviesa001.jf.intel.com with ESMTP; 03 Jul 2025 08:19:56 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 0/2]
Date: Thu,  3 Jul 2025 15:19:52 +0000
Message-ID: <20250703151954.159617-1-nishit.sharma@intel.com>
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
and display on console few structures and headers are are used in IGT test
xe_compute which has dependency on
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
 tests/intel/xe_compute.c | 764 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 tools/gputop/gputop.c    | 638 ++++++++++++++++++++++++++++++++
 tools/gputop/meson.build |   6 +
 tools/gputop/utils.c     |  51 +++
 tools/gputop/utils.h     |  64 ++++
 tools/gputop/xe_gputop.c | 378 +++++++++++++++++++
 tools/gputop/xe_gputop.h |  62 ++++
 tools/meson.build        |   6 +-
 13 files changed, 2122 insertions(+), 8 deletions(-)
 create mode 100644 tools/gputop/gputop.c
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.43.0

