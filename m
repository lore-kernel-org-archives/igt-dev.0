Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF0BE87839
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 15:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF10B10E28A;
	Tue,  3 Feb 2026 15:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WskqkTVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BAD10E28A
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 15:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770132856; x=1801668856;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YEpuw9RjQtywZlklBRTqz+11MkHbs6Tkgidpgoa81Ww=;
 b=WskqkTVBbASCifNC/cmI0CHP2SNck+vbtaLLXeqtVYC1GXZwTAe13/VQ
 HOUqVUHYNG/D0Qfw+Zhl4B70fKn4gmpgEmB0CxqQST26qgnyHYOg4Xaz7
 N/z1jM71q0dS9DMizjZW7e+gnkLjFjUNaU6hywIKBcrAa3a1dykYu9+9k
 rE1MpSe2mg0224WtAUrFSmicng0qbTKUY8u/b/+P6EbE4ZqTigoVdxJRH
 OqI3Q+xyknA3TaPbh8MnTydoeGJjLHG2hLzRN4hrIL6slaHXr78He4ZJ5
 kZzTcFs4zI0lTZLtz1J5QuEUNXXxVWEWZ56rjr/57eCsgLSUXOypXus9e Q==;
X-CSE-ConnectionGUID: eXe0pDKaTSyW9uycMz2wwQ==
X-CSE-MsgGUID: H45fVYJqTGGbngL4OCQWFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71204274"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71204274"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 07:34:16 -0800
X-CSE-ConnectionGUID: /+2rovM7Sm+wT/IOmalntA==
X-CSE-MsgGUID: bvlou1UnQd6jZLwSR1tsOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="247479394"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 07:34:15 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.winiarski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 0/4] PCI driver helpers and xe-vfio-pci FLR
 improvement
Date: Tue,  3 Feb 2026 16:33:41 +0100
Message-ID: <20260203153349.128551-1-marcin.bernatowicz@linux.intel.com>
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

V2 -> V1:
- Add igt_pci_get_bound_driver_name() to query the currently bound PCI
  driver via the /sys/bus/pci/devices/<BDF>/driver symlink.
- Extend igt_pci_bind_driver_override() and igt_pci_unbind_driver_override()
  with a timeout_ms parameter so callers can wait for bind/unbind to
  actually complete, instead of relying on drivers_probe write success.
  drivers_probe only initiates an async reprobe, so a successful write
  does not mean bind/unbind succeeded - verify the effective bound driver
  with a timeout.
- Unbind VFs only if they were successfully bound.

Marcin Bernatowicz (4):
  lib/igt_sriov_device: Add helper to get VF PCI slot address
  lib/igt_pci: Add generic PCI driver override and bind/unbind helpers
  tests/intel/xe_sriov_flr: Attach VFs to xe-vfio-pci before initiating
    FLR
  lib/igt_kmod: Fix PCI bind/unbind for module/driver name mismatch

 lib/igt_kmod.c             |  90 +++++-----
 lib/igt_pci.c              | 351 +++++++++++++++++++++++++++++++++++++
 lib/igt_pci.h              |  13 +-
 lib/igt_sriov_device.c     |  25 +++
 lib/igt_sriov_device.h     |   1 +
 tests/intel/xe_sriov_flr.c |  65 +++++++
 6 files changed, 505 insertions(+), 40 deletions(-)

-- 
2.43.0

