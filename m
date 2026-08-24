Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80B2C5DF9C
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 16:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDFA10E15F;
	Mon, 24 Aug 2026 16:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DqrmQvHI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F9710E15F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 16:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787589711; x=1819125711;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UpLv7a+6TAn52EZc6PbyP+xuz33/S9IZPuJyb794S14=;
 b=DqrmQvHIemHN5GSC3JqhV+hrmTHcShqzTpjiJUQpNW1hcOxmS0XVuhZK
 kt+ZyevuKofLGjj4M4OWvLx6rlyFnzztDhYHpaOoG52TK/RZ9/GamCnWx
 yiMXYEGEtbJlKiPkgGOH5+Mk6ER94C2zTtpv9+lMMD7mijsj3IuKjT6Md
 BGiB6MhbRPgkysKnpQbJaK/WcOuOtoLUwLpnw742KTqyOhGLa36Dtfl5T
 4SqZbY/N90G+1Zr9oOKE6qhgOvR6xZGf40D8eTwgCYuJE01enLobMu/FH
 oUSRwG42LJLNq517meQFu7GLO1oNXeBDkXUGbMFbC2wqbeLV0gtvl3Xnr g==;
X-CSE-ConnectionGUID: xMG1lLQkR2qTcqWDXgOzhA==
X-CSE-MsgGUID: zkYB1LPoTU6xLT5FP2Lwiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88105657"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="88105657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:41:51 -0700
X-CSE-ConnectionGUID: J5Ubg5vNQK23p6XvX7hveQ==
X-CSE-MsgGUID: z0Y+dSsDQjOY900Er1h5cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="268993350"
Received: from unknown (HELO rkoppura-Z790I-AORUS-ULTRA.iind.intel.com)
 ([10.190.239.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:41:48 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v3 00/10] Xe3P GPU Error Injection Test Suite with DRM RAS
 Netlink Support
Date: Mon, 24 Aug 2026 22:11:23 +0530
Message-Id: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
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

Ravi Kishore Koppuravuri (10):
  drm-uapi/drm_ras: Add DRM RAS UAPI header
  lib/meson: Add libnl dependencies for DRM RAS support
  lib/igt_drm_netlink: Introduce DRM RAS Netlink interface library
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

 include/drm-uapi/drm_ras.h     |  67 ++++
 lib/igt_drm_netlink.c          | 565 ++++++++++++++++++++++++++++++
 lib/igt_drm_netlink.h          |  48 +++
 lib/meson.build                |   9 +
 tests/intel/xe_err_injection.c | 623 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  28 ++
 tests/meson.build              |   1 +
 7 files changed, 1341 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 lib/igt_drm_netlink.c
 create mode 100644 lib/igt_drm_netlink.h
 create mode 100644 tests/intel/xe_err_injection.c
 create mode 100644 tests/intel/xe_err_injection.h

-- 
2.34.1

