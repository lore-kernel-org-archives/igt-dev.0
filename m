Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA837E9E2E4
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 11:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A75A10E00B;
	Wed, 11 Feb 2026 11:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EiAZICRQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393B810E00B
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 11:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770808748; x=1802344748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WOXIdDKhFWPVqlSFyvSVUlFCJlMQP6es7eRYLtdAP68=;
 b=EiAZICRQE9pxkhCPkycXCkYY5PgcIJ0NNJ13mw51ChNqhz+IsUqcixDE
 WHg6LiSUIfGTttJQguXMRZb7YLaFl71nqnMHjNUmzn05pygMKOMqw78Te
 WKV3ODVBKeNN/X5UcmdBL0kLlu/+WrZBPd+WOesXxbGW587+/h31qdbtT
 p+6Q6h8o6fZO+vSIY+iro4OsGu5v0qX7VbE1eV6gJ3sRflhjd9iJb/zQQ
 AGjrxUBnzPwuOzN5JdLReahMXdsoymcxIZxd7orOYERpUVsIt3G+ge/tx
 QfsCl2JKwWi7aIeDwgb6ejELtak+PfCRevibUV4s/0Y/9Gp6Ss2NiRVio Q==;
X-CSE-ConnectionGUID: psKfJLOmRH2fmavG15oMEA==
X-CSE-MsgGUID: eLI2y+ijTsSl08BdHxY44Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82592135"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82592135"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 03:19:08 -0800
X-CSE-ConnectionGUID: pLfAYe+XRuq+MQgElThnyw==
X-CSE-MsgGUID: K+0PACntQ4uQFf5j3qsgAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="217182281"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.85])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 03:19:06 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v4 i-g-t 0/6] PCI driver helpers and xe-vfio-pci FLR
 improvement
Date: Wed, 11 Feb 2026 12:18:24 +0100
Message-ID: <20260211111834.1140287-1-marcin.bernatowicz@linux.intel.com>
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

V4 -> V3:
- Clarify igt_pci_get_bound_driver_name() doc that driver/driver_len
  are optional (NULL/0 valid when only checking bound/unbound) (Lukasz)
- Drop patch checking IOMMU group presence before loading xe-vfio-pci
  (Lukasz)

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

Marcin Bernatowicz (6):
  lib/igt_sriov_device: Add helper to get VF PCI slot address
  lib/igt_pci: Add generic PCI driver override and bind/unbind helpers
  tests/intel/xe_sriov_flr: Attach VFs to xe-vfio-pci before initiating
    FLR
  lib/igt_kmod: Fix PCI bind/unbind for module/driver name mismatch
  tests/intel/xe_sriov_flr: Add --wait-flr-ms option
  tests/intel/xe_sriov_flr: Add --no-xe-vfio-pci option

 lib/igt_kmod.c             |  90 ++++++----
 lib/igt_pci.c              | 354 +++++++++++++++++++++++++++++++++++++
 lib/igt_pci.h              |  13 +-
 lib/igt_sriov_device.c     |  25 +++
 lib/igt_sriov_device.h     |   1 +
 tests/intel/xe_sriov_flr.c | 110 +++++++++++-
 6 files changed, 551 insertions(+), 42 deletions(-)

-- 
2.43.0

