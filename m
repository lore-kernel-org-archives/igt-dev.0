Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB55C369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 19:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B4510E1B2;
	Tue, 29 Apr 2025 19:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cw9NfN78";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C598010E1B2
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 19:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745956731; x=1777492731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HxqFyr05YkW0L8sSN3D+3DX7SdWQSrmAZfVYDbpa4vs=;
 b=Cw9NfN78E5TRuPfncxDTk0Pm2U4IxYnrWGVywr6is0p8zkFFq6I44cOZ
 OEwSbtqj/cF6GS84SUHv6TBML+dWvQQOmHTwkKZ4Eeuj3u/YYgT2rg4BQ
 Jzu1DUsyBw0hD/PnvGG217lExB6KrX7A7EZolg+nFXOltN9SbjTLQ3X5A
 SboEPMGNc0yCsdvSpX8LjyQIcgmvlQhGED1+GdTkgamrWbTrq+bDY6kEw
 v9S/e85dfAFxzzaYdEYVx6oiDFtU0FsPPr1staciuBSXIkR+sHAAbxV8j
 TIDIhZM5qm4mxo7IN2Hs0ETjsZoUR7UlXsnAOnLCFf3BJvEDIC3/uPVt1 A==;
X-CSE-ConnectionGUID: m99Wek0IRVK6Tk2FRNQqKQ==
X-CSE-MsgGUID: DC7poNI4TimcH8XS3QXfLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46843133"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="46843133"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 12:58:51 -0700
X-CSE-ConnectionGUID: kaqGo20GTeWEcVWW6fvrog==
X-CSE-MsgGUID: 4zh3YixZTj2JF+YpPuWQhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="133831319"
Received: from intel-s2600stb.iind.intel.com (HELO
 08ca91f16b80.iind.intel.com) ([10.66.234.77])
 by orviesa010.jf.intel.com with ESMTP; 29 Apr 2025 12:58:49 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, sapna1.singh@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com
Subject: [RFC] [PATCH 0/5] Extend IGT to support Android
Date: Tue, 29 Apr 2025 19:57:40 +0000
Message-ID: <20250429195745.40982-1-jeevaka.badrappan@intel.com>
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

 include/stub/glib.h      |  43 ++++++++++++++
 include/stub/libunwind.h |  20 +++++++
 include/stub/pids.h      |  41 ++++++++++++++
 lib/igt_aux.c            |   2 +-
 lib/igt_core.c           |   4 ++
 lib/igt_core.h           |   1 +
 lib/igt_device_scan.c    | 118 +++++++++++++++++++++++++++++----------
 lib/igt_dummyload.c      |   6 +-
 lib/igt_dummyload.h      |   2 +
 lib/igt_kmod.c           |  10 ++++
 lib/xe/xe_spin.c         |   2 +-
 tests/intel/xe_create.c  |   1 +
 tools/gputop.c           |   6 +-
 tools/intel_gpu_top.c    |   2 +-
 14 files changed, 221 insertions(+), 37 deletions(-)
 create mode 100644 include/stub/glib.h
 create mode 100644 include/stub/libunwind.h
 create mode 100644 include/stub/pids.h

-- 
2.49.0

