Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2165D44C41
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 13:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8FA10E752;
	Thu, 15 Jan 2026 13:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="acFMbyq5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDCD10E752
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 13:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768483102; x=1800019102;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V8qvcMJRHAJqAIr3eu5vVf+6LzO5B2bhwuLcugoUS34=;
 b=acFMbyq5VuDHvJeCaebTqZbjlHQfSZ9RCM4nAghN7RWEgb0p3vqKPyLq
 iJUPfgJCGjBWqKNbynEYOAbVXnppvwI3ukhZPaxO1ow5k3F/h0zj9dyZb
 KENXqOxRB29NWhfdk9mvgDCQv0/+WXRATSZYMhPsYCZtWiWDKGDKAtfHP
 W1bpIYmQTKbc0e1QGhpRQM6knDQDyaQrg7OQg955C5G+RaiBZRP+MHRA9
 1DFTIx1HftnwTulQldPVBSFmhAll87orC/pEDBBI43Zai3ixXOhxiFP4U
 UkFexixlIvKG0kG+6W3NewsPyfYwU3Dn+k58FGDhNgoCSHsGIR1zYl4w4 Q==;
X-CSE-ConnectionGUID: urqoOyllQn+8d4PqAoPZ0w==
X-CSE-MsgGUID: y8QwT+jDR/+HQIwU2Vob/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69523471"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="69523471"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:18:22 -0800
X-CSE-ConnectionGUID: At+x+HO6S/Gq6a40FtAXfA==
X-CSE-MsgGUID: AlSm0cmuR6+LMkFxln7GvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="205008505"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.180.143])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:18:20 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.winiarski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/4] PCI driver helpers and xe-vfio-pci FLR improvement
Date: Thu, 15 Jan 2026 14:18:05 +0100
Message-ID: <20260115131812.256678-1-marcin.bernatowicz@linux.intel.com>
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

Marcin Bernatowicz (4):
  lib/igt_sriov_device: Add helper to get VF PCI slot address
  lib/igt_pci: Add generic PCI driver override and bind/unbind helpers
  tests/intel/xe_sriov_flr: Attach VFs to xe-vfio-pci before initiating
    FLR
  lib/igt_kmod: Fix PCI bind/unbind for module/driver name mismatch

 lib/igt_kmod.c             |  90 ++++++++-------
 lib/igt_pci.c              | 228 +++++++++++++++++++++++++++++++++++++
 lib/igt_pci.h              |   8 ++
 lib/igt_sriov_device.c     |  25 ++++
 lib/igt_sriov_device.h     |   1 +
 tests/intel/xe_sriov_flr.c |  45 ++++++++
 6 files changed, 358 insertions(+), 39 deletions(-)

-- 
2.43.0

