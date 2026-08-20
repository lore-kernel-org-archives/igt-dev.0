Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B47EC5DF87
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 12:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1062210E1D6;
	Thu, 20 Aug 2026 12:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FOSmvtgg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2281410E1D6
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 12:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787228183; x=1818764183;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a+s2X6kJswntwDHqbqQF5dyTyvqtCQconGHXDXpzKs0=;
 b=FOSmvtgghslR3qeNyglYHd4rndSt/VG8ArO/vFkleOimvnSuLLWDP882
 uW3tQeK4B9zo/57MrFgPEj/yD2l6VnKZv1DvPsSuLaYati4KU+lHwzGo4
 vh+7njTST7zvIbg0RDKCMeAXwd0xeXu9Q6wk3VyXROkyK9UsoKopoh/n0
 rOgTk2RpE7LAqmtX4pDYTU3BCwXUnXMw9+seL2qIYu/z1RUpANHQJX0HO
 f+Uf7+qvmaaYIxOwOjSjR/lexiryORzdKq5lYiI22R2Q8xXKmUPCeB8i7
 JtO1Cv7c1ttEO8F+7NYx+2eNpvpNH4iT0OrM25lx1aN/xJjSx/IwT+ZrN w==;
X-CSE-ConnectionGUID: 03m1WJ8uRsef25HxiOoywA==
X-CSE-MsgGUID: ikb4nC0yQom9s9CDXwVm4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98917279"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98917279"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 05:16:22 -0700
X-CSE-ConnectionGUID: p0lvUrdmTziYm1PXRATvpw==
X-CSE-MsgGUID: Pw/HwZfJT7SmBpRhf3CfSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="264675883"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 05:16:21 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v2 0/8] Xe3P GPU Error Injection Test Suite with DRM RAS
 Netlink Support
Date: Thu, 20 Aug 2026 17:45:52 +0530
Message-Id: <20260820121600.75052-1-ravi.kishore.koppuravuri@intel.com>
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
 lib/igt_drm_netlink.c          | 565 ++++++++++++++++++++++++++++++
 lib/igt_drm_netlink.h          |  50 +++
 lib/meson.build                |   9 +
 tests/intel/xe_err_injection.c | 615 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  28 ++
 tests/meson.build              |   1 +
 7 files changed, 1336 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 lib/igt_drm_netlink.c
 create mode 100644 lib/igt_drm_netlink.h
 create mode 100644 tests/intel/xe_err_injection.c
 create mode 100644 tests/intel/xe_err_injection.h

-- 
2.34.1

