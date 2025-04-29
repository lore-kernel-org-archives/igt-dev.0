Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE9AC369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 20:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF90D10E096;
	Tue, 29 Apr 2025 20:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUKRh2Y7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF47610E127
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 20:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745959265; x=1777495265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v0s8aL+9f9uTGyqeDhWbzdl+OznK1LTB//HBYt5Pgag=;
 b=SUKRh2Y7HNT4TB7b6dlkGk/Sk6k+HzUTzEB9zPqj2gLEiXbPSo1PhB8c
 E6iZWEw7Y9/U3Ch8yfrlXvVjsYVaiZAYFq2/FSvxWvA04K3V7x8UnLghe
 KH8UFg6KgwBcNT3w+ppB57oEsY7cur0HbJhRT4cTnqtk8EB4U+0i0ZX6D
 qrDtlhH4da5XGCLxnvg9Zl1z/OsbDG2U2b4C3yStZTbFBC4FTN8fYjnQD
 OQZFNdSwf+N1ka3UBCO/wzV5VeuzSvyF94MoRfh3liVUYoT29+7bqrWFU
 4iq4qEcdVSBSza9VDBoTBflnXVfip1NtbLJWUV2hhTqhKsJ+d8Dkw/sbc w==;
X-CSE-ConnectionGUID: aONdROGsQUabYXkziXJktg==
X-CSE-MsgGUID: ZuXKgTuFSo648K5MXhH6mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47484521"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="47484521"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:41:04 -0700
X-CSE-ConnectionGUID: bB5t03WhTQO5MWdDgVf6cQ==
X-CSE-MsgGUID: +D+S/vbBS9Gw2nrh6fHEsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="133832027"
Received: from intel-s2600stb.iind.intel.com (HELO
 08ca91f16b80.iind.intel.com) ([10.66.234.77])
 by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2025 13:41:02 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, sapna1.singh@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com
Subject: [PATCH v2 0/5] Extend IGT to support Android
Date: Tue, 29 Apr 2025 20:39:55 +0000
Message-ID: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
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
- Replace glib hash table with generic hash table implementation

Note:
- Incase of linux systems, system libraries will be used whereas for
Android stubs will be used with reduced test coverage.
- Support will be provided to maintain Android support.

Jeevaka Prabu Badrappan (4):
  Replace program_invocation_short_name with prog_name from command line
  Avoid use of pthread_cancel by introducing an exit flag
  Replace glib hash table with c specific implementation
  igt-gpu-tools: Changes to compile for Android

Sapna (1):
  Add stub for libunwind, procps and glib

 include/stub/glib.h          |  43 +++++++++++++
 include/stub/libproc2/pids.h |  41 ++++++++++++
 include/stub/libunwind.h     |  20 ++++++
 lib/igt_core.c               |   4 ++
 lib/igt_core.h               |   1 +
 lib/igt_device_scan.c        | 118 ++++++++++++++++++++++++++---------
 lib/igt_dummyload.c          |   6 +-
 lib/igt_dummyload.h          |   2 +
 lib/igt_kmod.c               |  10 +++
 lib/xe/xe_spin.c             |   2 +-
 tests/intel/xe_create.c      |   1 +
 tools/gputop.c               |   6 +-
 tools/intel_gpu_top.c        |   2 +-
 13 files changed, 220 insertions(+), 36 deletions(-)
 create mode 100644 include/stub/glib.h
 create mode 100644 include/stub/libproc2/pids.h
 create mode 100644 include/stub/libunwind.h

-- 
2.49.0

