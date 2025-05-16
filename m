Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DC6C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 17:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B94A10EB44;
	Fri, 16 May 2025 17:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7jWnGbz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACB310EB44
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 17:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747415533; x=1778951533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y1A87r9QhbA36L9klg45Yh0zDx2wwYErTBlf4lIqY4I=;
 b=E7jWnGbzOyjD5hDZK5vPjbSs+tZRzJuZxJswW/W+ZhipCy7ZU4muvAhD
 wMOYn2xXIHhsOOwH/OH8BpkPO5izFsCYVkJIbaLaLF+NrSbfhLGPZLGXu
 Iya1Pa0tcPV3aWXGr8FOKWh2bvLdrKG6XZMdxHusFO8YgHItYAN53k8Su
 e2OsLUmRFK4I92OiMYaCbZ3aSLUDRB25bw+3D2ApdkDMZ3w5xBNWqqMMb
 1sywY4Vq6T6A0tU1itvDwGwRdPonWoJHhRO3ycYVw93buO34JzKNsHqTd
 kLpVDTGd7MBUODWHD3SnJWZ9NW1IVidP1S6A7lka+DMlR6OkpcIilmsvd A==;
X-CSE-ConnectionGUID: y/nAfjO4Shaiz1LT+ccsnQ==
X-CSE-MsgGUID: 6JzOXyTtReG4BIquJ814iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49297049"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49297049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:12:13 -0700
X-CSE-ConnectionGUID: wc7fIp0bQSSTi1X2gTEfkA==
X-CSE-MsgGUID: SZX2SwXIRRWDkXZFoORYqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="138793447"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 16 May 2025 10:12:10 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v7 00/14] Extend IGT to support Android
Date: Fri, 16 May 2025 17:11:39 +0000
Message-ID: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
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
- Create stub implementations of GLib, libunwind, libprocps, and
other necessary libraries to satisfy IGT dependencies on Android.
- Replace glib hash table with igt hash implementation

Note:
- Incase of linux systems, system libraries will be used whereas for
Android stubs will be used with reduced test coverage.
- Support will be provided to maintain Android support.

Jeevaka Prabu Badrappan (13):
  lib: Include local igt procps, glib and unwind header for Android
  tests: Include local igt_glib header for Android
  runner: Include local igt_glib header for Android
  tools: Include local igt_glib header for Android
  tools/gputop: find program name from command line
  lib/igt_dummyload: Avoid pthread_cancel use by overriding timer value
  lib/xe/xe_spin: Avoid pthread_cancel use by introducing an exit flag
  lib/igt_core: Implement conditional backtrace support using
    HAVE_LIBUNWIND
  lib/igt_core: Conditionally define __noreturn for non-Android
    platforms
  tools/intel_gpu_top: Replace index with strchr
  tests/intel/xe_create: Conditionally define PAGE_SIZE for non-Android
    platforms
  lib/igt_device_scan: Replace rindex with strrchr
  lib/igt_device_scan: reuse igt hash

Sapna (1):
  Add stub for libunwind, procps and glib

 include/android/glib.h     | 49 +++++++++++++++++++++++
 include/android/procps.h   | 47 ++++++++++++++++++++++
 include/android/unwind.h   | 22 ++++++++++
 lib/igt_aux.c              |  4 ++
 lib/igt_chamelium.c        |  4 ++
 lib/igt_core.c             | 12 ++++++
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
 27 files changed, 266 insertions(+), 44 deletions(-)
 create mode 100644 include/android/glib.h
 create mode 100644 include/android/procps.h
 create mode 100644 include/android/unwind.h

-- 
2.49.0

