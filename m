Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CE8C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 12:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A35210E03A;
	Wed, 29 Jul 2026 12:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UlG6A7Ft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7570410E03A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 12:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785327636; x=1816863636;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q6iQpdFYDb5yNkR5lcwFAI6gvJfZLVQ/E5N7SndodrA=;
 b=UlG6A7FtSdaOHomHgetaKj2Ws4NiSjd8i1qfhO8QHNXlXgF9RLJhTLtJ
 zAUFFNHf3TWYFDs338zfT+WqlD2HnVSnHjSDUEUhY2/WlFv+X16KlYmuq
 K+CdqVkgOw0j5zTLHC6xPIY1OkOMOimMTit7V2opgIC/TVxSdynGXEfLG
 6r9IkrkKU0dBY7Cg/LyBZsPFjUXeyYI0PxoCWM8e+wxZIOofndRONbIPZ
 6NU5pJxJOPFQURfuyyawtJsVwJRxIpWNXlG64cGRT4Zq2A11CSUOdClHE
 YjX8VUMk8L+wY6g0Mj+W2zZd+XPufswSwJRzgN23KiJgx4/84xv48xdC1 Q==;
X-CSE-ConnectionGUID: rJQC84V7Qgy6VDd2fYNR2Q==
X-CSE-MsgGUID: 71Je9BwaSpyYeszAZCSNGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108725146"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108725146"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 05:20:35 -0700
X-CSE-ConnectionGUID: FOWYNfYvSRSVQJrylt1uLw==
X-CSE-MsgGUID: AE2FuP22TEy9B+OoM0V6Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="263802113"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 05:20:33 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH 0/8] Xe3P GPU Error Injection Test Suite with DRM RAS Netlink
 Support
Date: Wed, 29 Jul 2026 17:49:51 +0530
Message-Id: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series introduces comprehensive error injection testing capabilities
for Intel Xe3P GPUs, leveraging the DRM RAS (Reliability, Availability,
Serviceability) Generic Netlink interface for error reporting and event
notification.

The patch series focuses on the below key areas:

1. DRM RAS Netlink Library
Establishes the foundation by introducing a reusable DRM RAS netlink library that
provides kernel interface abstraction for error management:

- DRM RAS Generic Netlink interface initialization and socket management
- Error counter querying for per-node error tracking
- Error threshold configuration (get/set operations)
- Event notification subscription via multicast groups

2. Uncorrectable Error Verification
Implements GT Uncorrectable Unicast Walker Command Parity Error Injection:

- MMIO-based error injection mechanism
- AER (Advanced Error Reporting) recovery verification
- Validates Xe driver error handling and recovery flows
- Includes workload execution post-recovery for robustness testing

3. Correctable Error Verification
Adds support for L2 Bank Correctable Error Injection with threshold monitoring:

- Event notification framework for real-time error event monitoring
- Single and multi-iteration correctable error injection tests
- Error threshold validation (critical for detecting error saturation)

IGT Test Coverage includes:

- GT Uncorrectable Unicast Walker Command Parity Error
- L2 Bank Correctable Error (single injection)
- L2 Bank Correctable Error with threshold=1
- L2 Bank Correctable Error (16x injections)

Ravi Kishore Koppuravuri (8):
  lib/igt_drm_netlink: Introduce DRM RAS Generic Netlink interface
  lib/igt_drm_netlink: add get_error_counter support
  lib/igt_drm_netlink: add get_error_threshold command support
  lib/igt_drm_netlink: add set_error_threshold command support
  tests/intel/xe_err_injection: Add GT UC Unicast GAM Walker Command
    Parity Error Injection
  lib/igt_drm_netlink: add event notify subscription and event wait
    support
  tests/intel/xe_err_injection: Add tests for L2 bank Corr err threshold
    scenarios
  tests/intel/xe_err_injection: add CRI GPU requirement check

 include/drm-uapi/drm_ras.h     |  68 ++++
 lib/igt_drm_netlink.c          | 429 ++++++++++++++++++++++++
 lib/igt_drm_netlink.h          |  45 +++
 lib/meson.build                |   9 +
 tests/intel/xe_err_injection.c | 579 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  28 ++
 tests/meson.build              |   1 +
 7 files changed, 1159 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 lib/igt_drm_netlink.c
 create mode 100644 lib/igt_drm_netlink.h
 create mode 100644 tests/intel/xe_err_injection.c
 create mode 100644 tests/intel/xe_err_injection.h

-- 
2.34.1

