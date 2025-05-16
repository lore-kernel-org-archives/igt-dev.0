Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B22C3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 16:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32EE10EB0F;
	Fri, 16 May 2025 16:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rdi7B7SK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD70210EB0F
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 16:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747411577; x=1778947577;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KNIheQrDofdNPG+LvorMOFZTWjeXpV0TuPVF7eY+ptI=;
 b=Rdi7B7SKGCv7mttjUHfg925EFrNyFSjxsM8ngb2DUeQJL05qKWUtzb0v
 YG3FK8IDuQdxXwUJp8ewqFWe+MWDfeLxMVkow5nqYJ6hSvhqK6OdyOMKa
 jib0CazHs/9NP42S6vZyu0IiVcCzF9zoDiwrN3RAhoeP3yVdhky1AdX1b
 wsBnh8ottFxPCckMYXHFx/45G+4doCKUBPxUGOef7ESKxnUdrlRkQR+Gr
 34u/sFOIDpKa7wlfx7l8Icn5aCXXT082ipXt4oQe/amG/Zz+qy+qu+qjr
 OK06kEBzM5+MxRQk3EevA+u2P67Mv9XxZ2hjA4iaBBB7V0/kHKSP0EvyZ A==;
X-CSE-ConnectionGUID: BkONznjoS/K4wJI1rEQgBg==
X-CSE-MsgGUID: iQWNpUdFRGW91djge+XTUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66941047"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="66941047"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 09:06:16 -0700
X-CSE-ConnectionGUID: NPZQkD9VSbepR5CWR0aC9g==
X-CSE-MsgGUID: mFIn+plaQa6ic8sY3WT4wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169772431"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 09:06:14 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v6 00/14] Extend IGT to support Android
Date: Fri, 16 May 2025 16:05:37 +0000
Message-ID: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
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
 26 files changed, 263 insertions(+), 44 deletions(-)
 create mode 100644 include/android/glib.h
 create mode 100644 include/android/procps.h
 create mode 100644 include/android/unwind.h

-- 
2.49.0

