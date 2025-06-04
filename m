Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CFFC5B555
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 17:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED9410E75F;
	Wed,  4 Jun 2025 17:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4K2is9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECE210E75F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 17:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749057570; x=1780593570;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1dAzrbuAMRFdbcST+tkthZeMs9UHEB8E12dN5hjJiIc=;
 b=Z4K2is9jeoeVZhC6B/iMD3vZk+Wf9aSMGEQB25jXOvo2VVES+NvEx4IV
 PWv2K/qYAu9btv05I4kf516uN84+jxrmrSzfxYmEqYODekxa2WqQvM9jS
 UWA5JBrR9St57Ez1qPBuK9ewia/b4hswaf9qgP1WWg3R7DP8cBuTgcuK1
 yiMuVwZAnPG1bG/cg38v0zoQqUSDrssC76nZYhcvvqDeMD4PUJQMTGfWt
 vbmIEcLmEIDxFdh3GHt3Vp2UM66ZnIeO4TFn3da0wPIYpNZBNp6fJsx0c
 NMT+rkTjgMXVR/N2OMr0suIHvNSmJs5KKK/USwDS5FTxp5Q3+VDDErKkr A==;
X-CSE-ConnectionGUID: YHfIil0rTm+u+jvC4Dpiig==
X-CSE-MsgGUID: iH1OpxjFQ5WSu/VFkSKqJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68595916"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="68595916"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:17:27 -0700
X-CSE-ConnectionGUID: tIW5VEzoS8CtbuvMuL6lRA==
X-CSE-MsgGUID: DcFjMPMeSg+I1uCGX6SWrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145203228"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2025 10:17:24 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v15 0/9] Extend IGT to support Android
Date: Wed,  4 Jun 2025 17:16:47 +0000
Message-ID: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
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
- Create stub implementation of GLib library to satisfy IGT dependencies
on Android.

Note:
- In case of linux systems, system libraries will be used whereas for
Android stubs will be used with reduced test coverage.
- Support will be provided to maintain Android support.

Jeevaka Prabu Badrappan (8):
  lib: Include local igt glib header for Android
  lib/igt_aux: Handle absence of libproc2 in Android
  tests/intel: Include local glib header for Android
  tests/testdisplay: Include local glib header for Android
  runner: Include local glib header for Android
  tools: Include local glib header for Android
  tests/intel/xe_create: Conditionally define PAGE_SIZE for non-Android
    platforms
  tools/intel_firmware_decode: Conditionally define __packed

Sapna Singh (1):
  include/android: Add stub for glib

 include/android/glib.h        | 55 +++++++++++++++++++++++++++++++++++
 lib/igt_aux.c                 | 10 +++----
 lib/igt_chamelium.c           |  4 +++
 lib/igt_core.c                |  4 +++
 lib/igt_rc.h                  |  4 +++
 lib/intel_batchbuffer.c       |  4 +++
 runner/executor.c             |  4 +++
 runner/settings.h             |  4 +++
 tests/intel/api_intel_bb.c    |  4 +++
 tests/intel/gem_ccs.c         |  4 +++
 tests/intel/xe_ccs.c          |  4 +++
 tests/intel/xe_create.c       |  2 ++
 tests/intel/xe_intel_bb.c     |  4 +++
 tests/testdisplay.h           |  4 +++
 tools/igt_dp_compliance.h     |  4 +++
 tools/intel_firmware_decode.c |  2 ++
 tools/intel_pm_rpm.c          |  4 +++
 tools/lsgpu.c                 |  4 +++
 18 files changed, 120 insertions(+), 5 deletions(-)
 create mode 100644 include/android/glib.h

-- 
2.49.0

