Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2058DC54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 14:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F9B10EE4A;
	Thu, 22 May 2025 14:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nrx9FkH6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A130A10EA81
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 14:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747924482; x=1779460482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ycWTEv9f4V9hcybahVqMbLqmalDrQ+Sx5qTDFF0oynA=;
 b=Nrx9FkH6p//rTbOuGgD2B5HLPWVT5ieaNa9g1sb50oyYZ1XQhyYUeogV
 rpi6OLH3hI5lYLiseqDaCPVs3Qt/9Lrz+hDkSW82ukEQGBsrqAVhMKdHY
 TgGVj87SKnRmkjSrYRHGGhtcdUWkZgWaGaZKhvyy0OYhrob8udrcmbiv/
 mWx5i8gPKM7sUVfhSn7F5QBoGVx31R68m0Zw/1YoMdZKefGvgVRtmtj2C
 HLuBoCME68m8Qmj0dHQNQbT9TeSm+oktyhJdj/tGnCZh4YrqYArIY1U7d
 RXGQZXN28lEWVfPIXRzyRDbhY58roWge1RL8kKQWWuhqvxPNXdzHMa2n3 w==;
X-CSE-ConnectionGUID: 3l1ZRQhpSASlLyveMbCB4w==
X-CSE-MsgGUID: Wv9GkaN2RG2BwMYO7d9VKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75351147"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="75351147"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 07:34:41 -0700
X-CSE-ConnectionGUID: CNXWpTxKRyuGEXMFtAMBDA==
X-CSE-MsgGUID: beJ/TjwsRXOUiUa1bqiRkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="140495542"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 22 May 2025 07:34:39 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v10 0/7] Extend IGT to support Android
Date: Thu, 22 May 2025 14:34:12 +0000
Message-ID: <20250522143419.28888-1-jeevaka.badrappan@intel.com>
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

 include/android/glib.h     | 49 ++++++++++++++++++++++++
 include/android/procps.h   | 47 +++++++++++++++++++++++
 lib/igt_aux.c              |  4 ++
 lib/igt_chamelium.c        |  4 ++
 lib/igt_core.c             |  4 ++
 lib/igt_device_scan.c      | 78 +++++++++++++++++++-------------------
 lib/igt_rc.h               |  4 ++
 lib/intel_batchbuffer.c    |  4 ++
 lib/meson.build            |  1 +
 runner/executor.c          |  4 ++
 runner/settings.h          |  4 ++
 tests/intel/api_intel_bb.c |  4 ++
 tests/intel/gem_ccs.c      |  4 ++
 tests/intel/xe_ccs.c       |  4 ++
 tests/intel/xe_create.c    |  2 +
 tests/intel/xe_intel_bb.c  |  4 ++
 tests/testdisplay.h        |  4 ++
 tools/igt_dp_compliance.h  |  4 ++
 tools/intel_pm_rpm.c       |  4 ++
 tools/lsgpu.c              |  4 ++
 20 files changed, 199 insertions(+), 38 deletions(-)
 create mode 100644 include/android/glib.h
 create mode 100644 include/android/procps.h

-- 
2.49.0

