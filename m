Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB179C79F83
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 07:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C03410F438;
	Thu,  3 Sep 2026 07:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbGXlnFC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48ACD10F415
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 07:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788420838; x=1819956838;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GLnh4slvLCUKZUNbVn1P2+O3MCEM6hvkAF+OIjGSkGw=;
 b=DbGXlnFCoQLRKHDuT5A8+O03bdhSplC5a2uEywmZk/lRESfchjis8I0l
 mUEb2bh3Ecf588/oUv/JeIn0GNiEYPzM9C61s8HniBW9wGgV4b961p1ue
 dQ/D6H89Lyr/M5b3CMpt9TY6eiJ+nO8F7+3dF425H8pPdQxJAdMoCAjLv
 HgIZMTpUev2BKR2wzSdurV7U/dVbC81LFcxkpnh4vBTMMUWnCBVOebXl+
 YLuQFeYdDGiLvxtJLz2WbHi/IDUEJ+D210fOQ5OqQphCZDm556b8KGSv6
 XBuODo6kIthip/phfIzEBY8ejW/oLWx5Q0AE7CaBIQ1npnBJYGcwW9QkM w==;
X-CSE-ConnectionGUID: Ew9+R6jlQDimM+258e7IVw==
X-CSE-MsgGUID: BtiwoezBR7e0ImHKjdQFlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88655680"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88655680"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:33:58 -0700
X-CSE-ConnectionGUID: cnxb0Pd4SNOOMnazr6vXRA==
X-CSE-MsgGUID: zhMrtyeNRS69imRq7XO9Mg==
X-ExtLoop1: 1
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:33:56 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v4 00/10] Xe3P GPU Error Injection Test Suite with DRM RAS
 Netlink Support
Date: Thu,  3 Sep 2026 13:03:25 +0530
Message-Id: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
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

V2: 
  - Added ACK/FINISH/ERR/SEQ_CHECK callbacks for netlink responses
  - Marked SET_ERROR_THRESHOLD command as response not required
  - Added support to parse all the error-report events until either it finds an event with 
    node_id and error_id matched or timeout 
  - Disabled multicast operation to perform unicast injection
  
V3:
  - Renamed all the library functions with prefix of "igt_" (Kamil)
  - Renamed all the test names with prefix of "test_"  (Kamil)
 
V4:
  - Sync Xe drm uapi with kernel commit b2207d4c4e84 (Jani Nikula)
  - Renamed all the library functions with prefix of "igt_drm_netlink_" (Jani Nikula)
  - Added 10 secs timeout while waiting for incoming netlink messages(nl_recvmsgs) (Soham)
  - Added Steer Semaphore while disabling and enabling multicast operation(Soham)
  - Increased device recovery check timeout from 5secs to 10secs (Mallesh)
  - updated error event name from error-notify to error-report to align with the latest changes
    in drm-uapi/drm_ras.h

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
 lib/igt_drm_netlink.c          | 557 ++++++++++++++++++++++++++++
 lib/igt_drm_netlink.h          |  38 ++
 lib/meson.build                |   9 +
 tests/intel/xe_err_injection.c | 648 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  42 +++
 tests/meson.build              |   1 +
 7 files changed, 1362 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 lib/igt_drm_netlink.c
 create mode 100644 lib/igt_drm_netlink.h
 create mode 100644 tests/intel/xe_err_injection.c
 create mode 100644 tests/intel/xe_err_injection.h

-- 
2.34.1

