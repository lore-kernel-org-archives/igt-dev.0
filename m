Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F55AC3ABD8
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 15:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6F810E278;
	Mon, 19 May 2025 15:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3UvEPoX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4A010E278
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 15:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747667519; x=1779203519;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HlFvnETq9siulKRoSdzIXQFPYDv8Hb018NPOIJqEmpE=;
 b=J3UvEPoXMOZ3H0IiG3PWv7RbYDgNPGiGc3I2CUq2IndF0q0bjYjMdsj8
 MtB2i34kFuUnFHvPW/1hIC6bdfdxWAGpbvPk21cyL3Cnfhl186ZLUqwxP
 h+72Y6zNO389TPeM7P0FK7HwirEB+JcdPsb/EagcRWBb2b7STVKdJiFPl
 PbP0a423pdPw5rYfUMm/SilFdoncQl7/oEO7HBvvWlKnXHRhAbN75GnKK
 rwNFPJ80R5DGuLnUWfVGQ1FjzeUHmzLJcpkKTUfPN7J4/UzaZYhRCTboo
 thJCf7SGGMlla4n8d21496c0PxJEKIWxhMRx1bcieE6KvW042wiPfVYiM w==;
X-CSE-ConnectionGUID: +UwnGWwAR0mNAS1t+bPhEA==
X-CSE-MsgGUID: Ez4FoP1IRoi5XoNOiFLgyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49710521"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="49710521"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:11:58 -0700
X-CSE-ConnectionGUID: lgpGhRceQsWy3wLXaIY4Ig==
X-CSE-MsgGUID: o463BYSJTvSIjQtyXmVG9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139287872"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 19 May 2025 08:11:55 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v9 00/14] Extend IGT to support Android
Date: Mon, 19 May 2025 15:11:21 +0000
Message-ID: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
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

The primary objective of this proposal is to extend the functionality of
IGT to Android environments.

Enabling IGT on Android will allow developers to perform comprehensive
testing of graphics drivers, ensuring robustness and reliability across
different platforms.

By providing stub implementations for libraries that are not natively
supported on Android, we will bridge the gap between Android and Linux
environments, promoting code reuse and reducing development time.

Changes done:
- Create stub implementations of GLib, libprocps libraries to satisfy
IGT dependencies on Android.
- Replace glib hash table with igt hash implementation

Note:
- Incase of linux systems, system libraries will be used whereas for
Android stubs will be used with reduced test coverage.
- Support will be provided to maintain Android support.

Jeevaka Prabu Badrappan (13):
  lib: Include local igt procps, glib header for Android
  tests: Include local glib header for Android
  runner: Include local glib header for Android
  tools: Include local glib header for Android
  tools/gputop: find program name from command line
  lib/igt_dummyload: Avoid pthread_cancel use by overriding timer value
  lib/xe/xe_spin: Avoid pthread_cancel use by overriding timer value
  lib/igt_core: Add a dummy workaround when libunwind is not present
  lib/igt_core: Conditionally define __noreturn for non-Android
    platforms
  tools/intel_gpu_top: Replace index with strchr
  tests/intel/xe_create: Conditionally define PAGE_SIZE for non-Android
    platforms
  lib/igt_device_scan: Replace rindex with strrchr
  lib/igt_device_scan: reuse igt hash

Sapna (1):
  Add stub for procps and glib

 include/android/glib.h     | 49 +++++++++++++++++++++++
 include/android/procps.h   | 47 ++++++++++++++++++++++
 lib/igt_aux.c              |  4 ++
 lib/igt_chamelium.c        |  4 ++
 lib/igt_core.c             | 17 ++++++++
 lib/igt_core.h             |  2 +
 lib/igt_device_scan.c      | 82 +++++++++++++++++++-------------------
 lib/igt_dummyload.c        |  9 +++++
 lib/igt_rc.h               |  4 ++
 lib/intel_batchbuffer.c    |  4 ++
 lib/meson.build            |  1 +
 lib/xe/xe_spin.c           | 10 +++++
 meson.build                |  3 ++
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
 26 files changed, 249 insertions(+), 44 deletions(-)
 create mode 100644 include/android/glib.h
 create mode 100644 include/android/procps.h

-- 
2.49.0

