Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF52C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 15:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D6E10E21B;
	Tue, 18 Mar 2025 15:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sz5LlOce";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B3910E21B
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 15:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742310630; x=1773846630;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lpUXiiSiPGFiY8qdEwhkOyJ1jNtSGKNYeoaXbIlEBGg=;
 b=Sz5LlOceEU/t3nKhxwmkAPvGtKWc9V797qO8wSQ1fCUliREoO232Vw1G
 VEZYGJX36ub6Hb8g9qSHuZpI4G7NosFOfe6EY+volW5pIWkXr4rLImTjL
 jxjjcVODjN3miXFGWFDguqtn02Uwd0azhKYzLOTK/WCdc8RRM6lHsRL4k
 gZoa7KgHQ6Z32vounpEmBlNr/6OLR6kHI52oK02wQzhHCzVP+QySUbv9f
 07dB+5ypOI/a1kqlDDfBBJr9xqmTi2y/rMyYmNnmG+J/WVxkiDmtEYkeT
 tM7ibYLttD4rUGYV4OVzyW2PRFPssCG4IZcPlmP4q3nY0CRpMbPEN8W5X A==;
X-CSE-ConnectionGUID: xpwVgsMySOq4jn7V9sLXcA==
X-CSE-MsgGUID: rfKbcmCYRTuobx779n0wMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="60989075"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="60989075"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 08:10:30 -0700
X-CSE-ConnectionGUID: 7VpnhDjlQ3CQq8r5R9lJRA==
X-CSE-MsgGUID: sAeAqiWLRC+Wo6uDi9OARg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="123227490"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 08:10:27 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v4 0/2] Add a check for power management PCI capability
Date: Tue, 18 Mar 2025 15:01:06 +0000
Message-Id: <20250318150108.1055169-1-jakub1.kolakowski@intel.com>
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

This patch series is introducing a helper for checking the presence of
power management PCI capability and it utilizes this new helper in
xe_pm tests that are related to D-states.

Introduce igt_has_pci_pm_capability(), a helper function to check
whether a PCI device supports the PCI Power Management (PM) capability.
With this helper one can make sure the capability is present on device
under test before proceeding with any actions related to PM.

Add a check for power management capability of device tested in tests
related to D3 states. Currently if test is started on configuration
that does not support the PM capability it doesn't skip, instead
depending on test it may fail, abort or timeout.
With this change test will skip with a clear message why it did.

v2:
- moved check for PCI PM capability to setup_d3() to avoid duplication
- edited commit messages of both patches
- changed description of helper function to indicate it is PCI capability
- changed name of helper function to igt_has_pci_pm_capability()
- shortened body of new helper without changing its functionality
v3:
- formatting changes
v4:
- replaced device.pci_root with device.pci_xe as argument given to
  igt_has_pci_pm_capability to use PCI device instead of PCI root port

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

Jakub Kolakowski (2):
  lib/igt_pm: Introduce helper to check for PM capability
  tests/intel/xe_pm: Add a check for power management capability

 lib/igt_pm.c        | 19 ++++++++++++++++++-
 lib/igt_pm.h        |  1 +
 tests/intel/xe_pm.c |  3 +++
 3 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.34.1

