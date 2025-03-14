Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B48C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 11:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2CD10E9D9;
	Fri, 14 Mar 2025 11:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5OgcyGn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B558510E9D9
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741952223; x=1773488223;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EMWYcYl8/Y9DihGhauydFZR51ucE4SNM/zsxOU+rnL8=;
 b=X5OgcyGnjuMVFoYv/dhISd8GrjhWdieW8VRV83OF0o8mOZLMNV/+YkYr
 NdColDnya7z96ve7CiAN2AzECaTH6bOLj6gxLkKSwQxxI6CT968+SBe+N
 yXCSgrTgXFKWUGLk33bwHNLmgvYJT+3mS0OLylIQ7grUaEg/9u0wuJbp/
 YGOA26GzXqEahlSNJMqrZHBJ/RcTFrU5C83grz7BGYVJV46JOc/tTXZT2
 9v2voJzYVld0FaM5I3QVNvHNqU70DwZy7VU61/dnHx8aNQPkov6XE+Mef
 DpNSuSA4HqVvCuw8p8U5saJOwZmHQEPrwYtZDUE1zT4mCNnr/avnj1kD/ g==;
X-CSE-ConnectionGUID: D8E98PL2RgCOOgEniG3aQw==
X-CSE-MsgGUID: GbhRuABPRaWtpqRRjwP8iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="60497483"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="60497483"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 04:37:02 -0700
X-CSE-ConnectionGUID: ftOSRtQcS+2z+5qQwWFU6g==
X-CSE-MsgGUID: asw1SqqyQBKmJ253i4Irzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126293464"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 04:37:00 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v2 0/2] Add a check for power management PCI capability
Date: Fri, 14 Mar 2025 11:27:30 +0000
Message-Id: <20250314112732.795523-1-jakub1.kolakowski@intel.com>
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

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

Jakub Kolakowski (2):
  lib/igt_pm: Introduce helper to check for PM capability
  tests/intel/xe_pm: Add a check for power management capability

 lib/igt_pm.c        | 18 ++++++++++++++++++
 lib/igt_pm.h        |  1 +
 tests/intel/xe_pm.c |  4 ++++
 3 files changed, 23 insertions(+)

-- 
2.34.1

