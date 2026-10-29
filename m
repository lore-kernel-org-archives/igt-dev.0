Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69683606A329
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Al7tlqwZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244DF1120EE;
	Thu, 29 Oct 2026 09:01:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E277C1120EE
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 09:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793264414; x=1824800414;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m+JGkoFdplHbfF/aN0Mlytzvj9/G0XdEBVkBwaVD2cU=;
 b=Al7tlqwZXSzHEeVZFaSb69uOTzH+ueKaJrZlHWL4Lq1qQ6lw6ByNOfD8
 bsLlbO8QAftj5l0+1Ob1ViJdHnWadhXYrWVjFDjpHdOQdN2P6Ik+iBmSq
 BsW3Op939y5UeDnJqSmaqMjvAvQuuHj6kdhKfguA+55yh22Zjel7aETz/
 mTGWj+Rarvr9ZeMlKkOfarSBJ/ZpPVM3Kag2lP0831CzDyFAUq3ZUjfsn
 IoBIXqSeYB8fkCGGMS3XPPq+RXcPiaRKIeCXn5t3A634WZgOfd1d/2xY2
 ZGr4xM8XVOBDDpKtd3p5V1uy51vUpXkCbkkCwAk9k59EE3fp3nQvLvaYj w==;
X-CSE-ConnectionGUID: o828jvpvR6O8ushYCCIk9Q==
X-CSE-MsgGUID: 7egqUicJSwarNE22CQ4Fdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1991647"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1991647"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:00:14 -0700
X-CSE-ConnectionGUID: teHp1CZqTqC7vsYKoKuAjA==
X-CSE-MsgGUID: 2E3uhoE6T+q1j6iUFJmDDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5092876"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:00:11 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v6 00/10] Xe3P GPU Error Injection Test Suite with DRM RAS
 Netlink Support
Date: Thu, 29 Oct 2026 14:29:45 +0530
Message-Id: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

V6:
  - Fixed incorrect usage of normalize_nl_error() with standard errno values (Soham)
  - Updated aquire steering semaphore logic (Soham & Riana)
  - Merged 3 Correctable error injection functions into a single function to remove
    redundant code (Riana)
  - other minor optimizations and code cleanup (Soham, Riana & Kamil)

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
  lib/igt_drm_ras_nl: Introduce DRM RAS Netlink interface library
  lib/igt_drm_ras_nl: add get_error_counter support
  lib/igt_drm_ras_nl: add get_error_threshold command support
  lib/igt_drm_ras_nl: add set_error_threshold command support
  tests/intel/xe_err_injection: Add Core Compute Uncorr Error injection
  lib/igt_drm_ras_nl: add event notify subscription and event wait
    support
  tests/intel/xe_err_injection: Add Core Compute Corr Error injection
  tests/intel/xe_err_injection: add CRI GPU requirement check

 include/drm-uapi/drm_ras.h     |  67 ++++
 lib/igt_drm_ras_nl.c           | 618 +++++++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h           |  77 ++++
 lib/meson.build                |   7 +
 tests/intel/xe_err_injection.c | 599 ++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 6 files changed, 1369 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 lib/igt_drm_ras_nl.c
 create mode 100644 lib/igt_drm_ras_nl.h
 create mode 100644 tests/intel/xe_err_injection.c

-- 
2.34.1

