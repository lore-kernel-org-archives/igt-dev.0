Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7EDC5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 17:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764B510E745;
	Thu, 29 May 2025 17:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXnE8iSh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA87610E745
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 17:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748538798; x=1780074798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1HkMj442FcJP5mMWozI2o0rNCFcNgUxfX6SFyPwH6O8=;
 b=dXnE8iShWmKYpW28WNNzlMuK9x3Q4dqzNAmFCpoh3yB9ZjgoZ2hVEOxD
 WZ0I9qY+Ohm76dP3bhdJbrQIaBcjoJia0JDiz9uDN/e/T6UBOUa3ugjUU
 9hiSZh/bXPvTwB2+3tVW/mTe+rw3PYvqUEv7Qq+hEuKHL9temoJys7mWs
 wq43yXK2p/jk2RJrZGRgVT2sC+jY81CyXokNqoU22TeJB1NaV+ZLsfe32
 e89KOE/j7vEDjjbYKD8a+0N1DANpDPvOSHSiJlabBYcaTkAVSfx3cl5Fp
 QvECpQAn1AwakLZF425MDgWcHsuXw4U1UKMn+29sjg3FHqucHpa6m1FUf g==;
X-CSE-ConnectionGUID: LstOGxDoT0GmGsKP8jswJg==
X-CSE-MsgGUID: oOjcMeDYTmegW6Rjc2ZhzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="62016791"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="62016791"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:13:18 -0700
X-CSE-ConnectionGUID: GoCiOcFXT0mFa2EdqOseiA==
X-CSE-MsgGUID: zv9CLdRbQI6DFeV09WvdiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143537942"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 29 May 2025 10:13:14 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v11 0/7] Extend IGT to support Android
Date: Thu, 29 May 2025 17:12:39 +0000
Message-ID: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
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

Jeevaka Prabu Badrappan (6):
  lib: Include local igt procps, glib header for Android
  tests: Include local glib header for Android
  runner: Include local glib header for Android
  tools: Include local glib header for Android
  tests/intel/xe_create: Conditionally define PAGE_SIZE for non-Android
    platforms
  lib/igt_device_scan: reuse igt hash

Sapna (1):
  Add stub for procps and glib

 include/android/glib.h     | 42 ++++++++++++++++++++
 include/android/procps.h   | 46 ++++++++++++++++++++++
 lib/igt_aux.c              |  6 ++-
 lib/igt_chamelium.c        |  4 ++
 lib/igt_core.c             |  4 ++
 lib/igt_device_scan.c      | 78 +++++++++++++++++++-------------------
 lib/igt_rc.h               |  4 ++
 lib/intel_batchbuffer.c    |  7 ++++
 lib/meson.build            |  1 +
 runner/executor.c          |  4 ++
 runner/settings.h          |  4 ++
 tests/intel/api_intel_bb.c |  7 ++++
 tests/intel/gem_ccs.c      |  4 ++
 tests/intel/xe_ccs.c       |  4 ++
 tests/intel/xe_create.c    |  2 +
 tests/intel/xe_intel_bb.c  |  7 ++++
 tests/testdisplay.h        |  4 ++
 tools/igt_dp_compliance.h  |  4 ++
 tools/intel_pm_rpm.c       |  4 ++
 tools/lsgpu.c              |  4 ++
 20 files changed, 201 insertions(+), 39 deletions(-)
 create mode 100644 include/android/glib.h
 create mode 100644 include/android/procps.h

-- 
2.49.0

