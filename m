Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A191C5B559
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 19:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FE110E0A8;
	Mon,  2 Jun 2025 19:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZxXaJpX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E060B10E0A8
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 19:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748892350; x=1780428350;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4tGSBfmJ/0GDcJ2dRP2R6Tdapqg9v//4KHZbWEKn/N0=;
 b=hZxXaJpXISpMDUhUM5CRwVDGTocNbfn+1peZJ3N5WAAcMxmjvG0rQIMY
 ffQFngyEnt5lZpkCQCQDwgpGPXJeR+KdgxaATG/xFYcWVLfefbAmUELl+
 fCEoQcqfUQA5LUA5Tx3HR1lGhhpJaLPk8yS/ui5YLhLegfHefcDm70wm8
 ro6ezXR2RXhpD/JfH3hScjWNMEzu/xkJ5d1+UeHq0B4Z8wZxcg0xT8y4c
 pDmy+cl0wxenxWQJCOcyFOOf7IgbYJiRViIkYlcGrFa8usJc7ZkR3VPz9
 2cHs68aMqxzQk3NT7Q1EX/cDIkMQ9i+xYlIgsFie5HuwBZkWqKsusAX/f w==;
X-CSE-ConnectionGUID: VCQw9kpcTs+mm2PnQ0y9Kw==
X-CSE-MsgGUID: xn6mQECcQpqLJPEgF6Da6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50777089"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="50777089"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 12:25:50 -0700
X-CSE-ConnectionGUID: B5UP+9F4RyqbZofv0EIAbg==
X-CSE-MsgGUID: 3HDqPPUtTfmWLb5B1t3VPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="144590206"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2025 12:25:47 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v12 00/11] Extend IGT to support Android
Date: Mon,  2 Jun 2025 19:25:04 +0000
Message-ID: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
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

Jeevaka Prabu Badrappan (10):
  lib/intel_batchbuffer: handle base64 encode fail
  tests/intel/*_intel_bb: handle base64 encode fail
  lib: Include local igt glib header for Android
  lib/igt_aux: Include local igt procps header for Android
  tests/intel: Include local glib header for Android
  tests/testdisplay: Include local glib header for Android
  runner: Include local glib header for Android
  tools: Include local glib header for Android
  tests/intel/xe_create: Conditionally define PAGE_SIZE for non-Android
    platforms
  lib/igt_device_scan: reuse igt hash

Sapna Singh (1):
  include/android: Add stub for procps and glib

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

