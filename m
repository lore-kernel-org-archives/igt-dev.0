Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A404EC61DCB
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 18:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4C610E647;
	Fri, 28 Aug 2026 18:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNrd5eiC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948A310E647
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 18:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787940426; x=1819476426;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aMSler7gN2fUDybSzNu4s23pk5Z0qHHR8SVU84A5Pug=;
 b=kNrd5eiC/ZcRax43Q3XmGRmit+tCDV3Ubz3E4IGhtfv578XjPZz+p1hB
 S12d7yHgJ4W+K8+2qUX6gqGbyNYsUAZ6hnVZgPgclTZLYymgowba4GNdW
 5t96P4ajONsNUbnlvZo007OdbGMbK4MsjkgZA4stDTWa7hLQyw5l8MUzU
 u4N6NNUjvpXoF50NBhBt8j1y2D/UCqDouSXUnZ+fkMtm9hTzmpbcSwFpU
 KznHkUgzZZRGPZvlP5u600vDHHyD6IdAYqPECrWeT7PkUsn9+6nsq2r3v
 iEJsIX7eXQvkq6tJPJmRJj8aekEyL+HbX3ZUTU3lsNL6Ey8HKBwRVKDy0 A==;
X-CSE-ConnectionGUID: S3cRFnpQR22+Or0Ylvyghg==
X-CSE-MsgGUID: ph1GOasRRoOba6jERZ6vxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88310029"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="88310029"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 11:07:06 -0700
X-CSE-ConnectionGUID: nMIrNSkhQRuJslIfhwW9CQ==
X-CSE-MsgGUID: lT+ZoY/ZTyanpzI4i+1cpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="270167393"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 11:07:04 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ravi.kishore.koppuravuri@intel.com, raag.jadav@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t 0/2] tests/intel/xe_err_injection: Add Local
 Uncorrectable Error Injection Through LSC Storage
Date: Fri, 28 Aug 2026 23:36:21 +0530
Message-ID: <20260828180643.1707505-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
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

Adds coverage for local uncorrectable unicast LSC (Load/Store Cache)
storage errors.

The test injects into the LSC storage array, drives a heavy LSC
workload on all compute engines to trigger recovery, and validates
error counter increment. A post-recovery workload run confirms the
error counter stays stable.

Ravi Kishore Koppuravuri (1):
  From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com> DO
    NOT REVIEW. COMPILATION ONLY.

Soham Purkait (1):
  tests/intel/xe_err_injection: Add test for local Uncorrectable Error
    Injection through LSC Storage

 include/drm-uapi/drm_ras.h     |  67 +++
 lib/igt_drm_netlink.c          | 565 +++++++++++++++++++++++
 lib/igt_drm_netlink.h          |  48 ++
 lib/meson.build                |   9 +
 tests/intel/xe_err_injection.c | 810 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  39 ++
 tests/meson.build              |   1 +
 7 files changed, 1539 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 lib/igt_drm_netlink.c
 create mode 100644 lib/igt_drm_netlink.h
 create mode 100644 tests/intel/xe_err_injection.c
 create mode 100644 tests/intel/xe_err_injection.h

-- 
2.43.0

