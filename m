Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9408AE9D40F
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 16:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226B810E6A7;
	Wed,  4 Feb 2026 16:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJuMEllI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3B410E6C6
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 16:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770222747; x=1801758747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=APIifRCUm0NYTbErhzwT30t7zy1p03ODKLOGelWgmZQ=;
 b=UJuMEllINZF1WuDXQTPjVLuT3a9LA6vIt7H5A6PsEDEzrgYvHUcYfKzs
 hirbwGCOfaBvRhVedeF7Gqc7YsDcfPZ2GiyM1zJGq2jCo7MUv8QI5Fvi+
 JuJoKWIvAn0EMIpZgowKznYAfO9xDRn67AJyzsJsjYyoj0dzpRpK+GEqe
 MGutVvtTEdeaJIj4aRp/P1vAznFWjR5GhVjzJuDcfWNTR+NMxzveCRW2J
 H7b/JHD5XWUJB6rntGBpPug94T8cE5ZNfFlq4wWlaHbV4mVvLj35EM092
 cR00oiVVri7RRKCp/G1oKh+eWyefFQUXDw5hjJeljzFUq3QDUzBMlSgHD g==;
X-CSE-ConnectionGUID: u6wfFcvcR/63MnHnFg/9uQ==
X-CSE-MsgGUID: mL+LgOiSQ4qu4+Envn8PJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71472358"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71472358"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:32:27 -0800
X-CSE-ConnectionGUID: AIFN8egWQc6yABHIUm4JSA==
X-CSE-MsgGUID: Gx7zmnPXSAqmdiaDsVceig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209315322"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.79])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:32:26 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v3 i-g-t 0/7] PCI driver helpers and xe-vfio-pci FLR
 improvement
Date: Wed,  4 Feb 2026 17:32:03 +0100
Message-ID: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

This series improves PCI driver management infrastructure in IGT
and updates the xe_sriov_flr test to rely on xe-vfio-pci FLR semantics.

It introduces generic PCI driver helpers for driver_override handling
and explicit bind/unbind operations.
Adds a small SR-IOV utility to resolve VF PCI slot addresses.
Fixes igt_kmod PCI bind/unbind logic to correctly handle module vs driver
name mismatches (e.g. xe_vfio_pci vs xe-vfio-pci), marking those helpers
as deprecated in favor of driver-level APIs.

The xe_sriov_flr test is updated to attach VFs to xe-vfio-pci
before initiating FLR, allowing the test to wait for FLR completion
via the driver.

V3 -> V2:
- Add --wait-flr-ms option to configure post FLR sleep time
- Add --no-xe-vfio-pci option to skip xe-vfio-pci load
- Skip xe-vfio-pci load/bind when IOMMU is off

V2 -> V1:
- Add igt_pci_get_bound_driver_name() to query the currently bound PCI
  driver via the /sys/bus/pci/devices/<BDF>/driver symlink.
- Extend igt_pci_bind_driver_override() and
  igt_pci_unbind_driver_override() with a timeout_ms parameter so callers
  can wait for bind/unbind to actually complete, instead of relying on
  drivers_probe write success. drivers_probe only initiates an async
  reprobe, so a successful write does not mean bind/unbind succeeded -
  verify the effective bound driver with a timeout.
- Unbind VFs only if they were successfully bound.

Marcin Bernatowicz (7):
  lib/igt_sriov_device: Add helper to get VF PCI slot address
  lib/igt_pci: Add generic PCI driver override and bind/unbind helpers
  tests/intel/xe_sriov_flr: Attach VFs to xe-vfio-pci before initiating
    FLR
  lib/igt_kmod: Fix PCI bind/unbind for module/driver name mismatch
  tests/intel/xe_sriov_flr: Add --wait-flr-ms option
  tests/intel/xe_sriov_flr: Add --no-xe-vfio-pci option
  tests/intel/xe_sriov_flr: Skip xe-vfio-pci load/bind when IOMMU is off

 lib/igt_kmod.c             |  90 +++++-----
 lib/igt_pci.c              | 351 +++++++++++++++++++++++++++++++++++++
 lib/igt_pci.h              |  13 +-
 lib/igt_sriov_device.c     |  25 +++
 lib/igt_sriov_device.h     |   1 +
 tests/intel/xe_sriov_flr.c | 147 +++++++++++++++-
 6 files changed, 585 insertions(+), 42 deletions(-)

-- 
2.43.0

