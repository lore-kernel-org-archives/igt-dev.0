Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BFBC3ABC0
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF55510E851;
	Wed,  7 May 2025 16:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLNN2DAj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B7E10E84F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633863; x=1778169863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sXgRVgGx7pxpscHQZZlxo/Cc5W0pDCCAhF8Uw4xHt4o=;
 b=BLNN2DAjC0qXnoFMRf3/hmmFYLlfHJZJJ1/663hFZTnLzJzyzAbbjdAP
 HJ+FxuYrPUF25RO2LlhyZVh1xgeBc2KTr3FJRoA4JhmG2Fz3K1bfKD95a
 9GwHBxtVbcnpEzbWk08/laYV5mprrNKZ71BUO+mlyQgku4Ny5uwb2xzxS
 jhOsyDpnr9Qm69cjFrazReLbLX6CLtCHN2uGBGUOzMixSOfZW4zXVPqOA
 9F34zb4PZ4er3emVp2tN/l3SoXDN0bH9ex9OdB67niFeFuRxL7ulBcoNE
 YpsJlV+q2HC6ir9KFaAorvqLZWFw/XlGamLi9cEqKB1Danjg3w8B0UYxx Q==;
X-CSE-ConnectionGUID: Vq9lLsfCQs+X2pvYjLVf4w==
X-CSE-MsgGUID: t5A94ZkXSVekzd2wvOzhaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48518916"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48518916"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:03:01 -0700
X-CSE-ConnectionGUID: HNPwp78LQVC3QKVoiLfhbQ==
X-CSE-MsgGUID: +gQd0WNZTRizc9yWdy0SVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173200202"
Received: from unknown (HELO 0a83d5f6e242.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 07 May 2025 09:02:58 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v4 00/15] Extend IGT to support Android
Date: Wed,  7 May 2025 16:01:33 +0000
Message-ID: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
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

The primary objective of this proposal is to extend the functionality of
IGT to Android environments.

Enabling IGT on Android will allow developers to perform comprehensive
testing of graphics drivers, ensuring robustness and reliability across
different platforms.

By providing stub implementations for libraries that are not natively
supported on Android, we will bridge the gap between Android and Linux
environments, promoting code reuse and reducing development time.

Changes done:
- Create stub implementations of GLib, libunwind, libprocps, and
other necessary libraries to satisfy IGT dependencies on Android.
- Replace glib hash table with igt hash implementation

Note:
- Incase of linux systems, system libraries will be used whereas for
Android stubs will be used with reduced test coverage.
- Support will be provided to maintain Android support.

Jeevaka Prabu Badrappan (14):
  lib: Include local igt procps, glib and unwind header for Android
  tests: Include local igt_glib header for Android
  runner: Include local igt_glib header for Android
  tools: Include local igt_glib header for Android
  tools/gputop: find program name from command line
  lib/igt_dummyload: Avoid pthread_cancel use by introducing an exit
    flag
  lib/xe/xe_spin: Avoid pthread_cancel use by introducing an exit flag
  lib/igt_core: Add print_backtrace placeholder for Android
  lib/igt_core: Conditionally define __noreturn for non-Android
    platforms
  tools/intel_gpu_top: Replace index with strchr
  tests/intel/xe_create: Conditionally define PAGE_SIZE for non-Android
    platforms
  lib/igt_device_scan: Replace return value of devs_compate to int
  lib/igt_device_scan: Replace rindex with strrchr
  lib/igt_device_scan: reuse igt hash

Sapna (1):
  Add stub for libunwind, procps and glib

 lib/igt_aux.c              |  4 ++
 lib/igt_chamelium.c        |  4 ++
 lib/igt_core.c             | 15 +++++++
 lib/igt_core.h             |  2 +
 lib/igt_device_scan.c      | 82 +++++++++++++++++++-------------------
 lib/igt_dummyload.c        |  6 +--
 lib/igt_dummyload.h        |  2 +
 lib/igt_glib.h             | 47 ++++++++++++++++++++++
 lib/igt_procps.h           | 46 +++++++++++++++++++++
 lib/igt_rc.h               |  4 ++
 lib/igt_unwind.h           | 25 ++++++++++++
 lib/intel_batchbuffer.c    |  4 ++
 lib/meson.build            |  1 +
 lib/xe/xe_spin.c           |  2 +-
 runner/executor.c          |  4 ++
 runner/settings.h          |  4 ++
 tests/intel/api_intel_bb.c |  4 ++
 tests/intel/gem_ccs.c      |  4 ++
 tests/intel/xe_ccs.c       |  4 ++
 tests/intel/xe_create.c    |  2 +
 tests/intel/xe_intel_bb.c  |  4 ++
 tests/testdisplay.h        |  4 ++
 tools/gputop.c             | 13 ++++--
 tools/igt_dp_compliance.h  |  4 ++
 tools/intel_gpu_top.c      |  2 +-
 tools/intel_pm_rpm.c       |  4 ++
 tools/lsgpu.c              |  4 ++
 27 files changed, 253 insertions(+), 48 deletions(-)
 create mode 100644 lib/igt_glib.h
 create mode 100644 lib/igt_procps.h
 create mode 100644 lib/igt_unwind.h

-- 
2.34.1

