Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA2ACC6B1A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 19:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FF210E927;
	Tue, 13 Oct 2026 19:08:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBAF10E5E5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 19:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918433; x=1823454433;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jawQETw7WrZPz+j4W7S6TcBOpnR7AO2ihSvEBECgdOE=;
 b=kc0cdB2/54H1u1kBb2sWdQ1Z9QNxzTArRGpEtvJ75Pj8HUI149SgiFmp
 OaTDzRgzp0DdZvesgwEEGPajQUffJbStevTNkcTEOdbcWEoE2BOHbfiK+
 u7ffw5UkbH0UdS5psuh+AfIpnaVz3uU0nxF/upzDRL7PwoAytz/D22KL8
 pjpqiRqmuy482kwRSfDGHLmrcz1aaImmmSUjMy7T+FhMKOGja4g2fT9vL
 zQ6ZskqBUUVXx0NbiIxbmGQ8WqKhOIJphrCUKLFed24UJ3q3rtAEqj1vW
 gdVh9KcRpBXYDG9eJTcO3Lh0a3FiNSjfcsQx2JBTPwkGMZ5OvtF3sIhJN Q==;
X-CSE-ConnectionGUID: ym+7YwUXSlCPjqtCPGOxgQ==
X-CSE-MsgGUID: SlYeKz4tT+uG5qz7wG0H1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="687205"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="687205"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:13 -0700
X-CSE-ConnectionGUID: ZqLnlskLQB+Y+KZZ6MEnRA==
X-CSE-MsgGUID: usUgu1k1RIW0xL9bMAqXSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3004436"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:11 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v5 00/10] Xe3P GPU Error Injection Test Suite with DRM RAS
 Netlink Support
Date: Wed, 14 Oct 2026 00:36:41 +0530
Message-Id: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
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

V5:
  - Renamed all library functions and structures with the "igt_drm_ras_nl_" prefix (Soham & Riana)
  - Normalized libnl error codes to standard errnos (Soham)
  - Changed test name comparisons from strings to enums (Riana)
  - Added a guard to prevent duplicate multicast group subscriptions (Soham)
  - Removed libnl-cli and libnl-utils packages from dependencies (Soham)
  - Added UC test and post-recovery workload tests as dynamic subtests (Riana)
  - Updated AER recovery dmesg strings to use enum-indexed arrays (Soham)
  - Arranged header file inclusions in alphabetical order (Kamil)
  - Removed xe_err_injection.h and moved its contents into the .c file (Riana)
  - Prefixed all register address and bit value names with "XE_" (Riana)
  - Other cosmetic improvements (Riana & Soham)

V4:
  - Sync Xe drm uapi with kernel commit b2207d4c4e84 (Jani Nikula)
  - Renamed all the library functions with prefix of "igt_drm_netlink_" (Jani Nikula)
  - Added 10 secs timeout while waiting for incoming netlink messages(nl_recvmsgs) (Soham)
  - Added Steer Semaphore while disabling and enabling multicast operation(Soham)
  - Increased device recovery check timeout from 5secs to 10secs (Mallesh)
  - updated error event name from error-notify to error-report to align with the latest changes
    in drm-uapi/drm_ras.h

V3:
  - Renamed all the library functions with prefix of "igt_" (Kamil)
  - Renamed all the test names with prefix of "test_"  (Kamil)

V2: 
  - Added ACK/FINISH/ERR/SEQ_CHECK callbacks for netlink responses
  - Marked SET_ERROR_THRESHOLD command as response not required
  - Added support to parse all the error-report events until either it finds an event with 
    node_id and error_id matched or timeout 
  - Disabled multicast operation to perform unicast injection

Ravi Kishore Koppuravuri (10):
  drm-uapi/drm_ras: Sync with kernel b2207d4c4e84
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
 lib/igt_drm_ras_nl.c           | 610 ++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h           |  77 ++++
 lib/meson.build                |   7 +
 tests/intel/xe_err_injection.c | 698 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 6 files changed, 1460 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 lib/igt_drm_ras_nl.c
 create mode 100644 lib/igt_drm_ras_nl.h
 create mode 100644 tests/intel/xe_err_injection.c

-- 
2.34.1

