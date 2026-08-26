Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542E1C61DC2
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 09:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E586110E275;
	Wed, 26 Aug 2026 09:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IeaGIaDV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46D210EC92
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787737975; x=1819273975;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yi9pkn812YrEDqMBoiEbDge3dF2FHYPtaOgIch85PqI=;
 b=IeaGIaDVcFO+Cqw1ANa0+mQEJ7C9Ly0/DMRLtTSEL19inWZWFf5Ony94
 HDiuZIMltoY3sI7OUYbWlr7dJVik/bE4tKZEb7lpEUWaql46SXuVAmAfB
 3w/NZ2VPtTEwfxPOSnQh19B0WTJnf9NijLBug8bwvy1hv9J0gS3xHzBHR
 tgyuaSSKsvZSRUGsOBXnD9b6qibG+DTO3F/wbl/BF58Vo/rGXuWk7d2Hk
 7zUw681dWo+CCvPlPyXScK9t5LxQ37Cp2hYBnn2Mrulntipo0U1/Li8Wb
 dnAcvbWB9rqNNi3PtDWwhkqbqaR/ano7pChi4yJjlY2GezJnVX5hJ4ab7 w==;
X-CSE-ConnectionGUID: mcTGZFZPTZW66QElKLLNEA==
X-CSE-MsgGUID: YU5aMCPrSTmQKzZqTqI9BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88344851"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88344851"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:52:55 -0700
X-CSE-ConnectionGUID: E1mr/uGzTLKMNmnbuHMESA==
X-CSE-MsgGUID: 5P+0ppIdSB+066h0JpcrEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="292388834"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:52:53 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [RFC 0/7] Validate PM_PME signalling on display hotplug
Date: Wed, 26 Aug 2026 15:36:31 +0530
Message-ID: <20260826100639.273731-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
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

A display hotplug can be signalled as a PCI PME while the graphics device
is runtime suspended in D3hot. That lets the driver leave the
drm_kms_helper connector poll worker disabled across runtime suspend, so
the device stays parked instead of being resumed every ~10s just to probe
connectors.

The property worth validating is therefore not "does a hotplug still
work" - the polling fallback delivers that too, just slowly and at the
cost of the power saving. It is "does the hotplug work while polling
stays off". A test that only toggles HPD and waits for a uevent passes
either way, and would not notice the feature regressing into the
fallback.

So the new subtest runs two phases against the same suspended device:

  Phase 1: hold the device idle in D3hot for 25s and check from PCI
           config space that it never leaves D3hot. This is the power
           saving.
  Phase 2: toggle HPD from D3hot and check that a uevent arrives, that
           the connector status updated, and that
           power/wakeup_active_count incremented - i.e. that the resume
           was signalled by the device and not initiated by the host.

Patches 1-2 add the PCI Power Management capability register layout and
accessors for PME_Support, PME_En, PME_Status and the PowerState field.
PME_Status tells a device that signalled and was not acknowledged apart
from one that never signalled at all, which makes a failure report
actionable instead of just "no uevent".

Patches 3-5 add accessors for power/wakeup and power/wakeup_active_count.
active_count is used rather than wakeup_count because the latter never
moves for a runtime resume.

Patch 6 adds igt_pm_kms_poll_save(), _set() and _restore(). Converting
the two tests that already open code this is sent separately, since one
of them also has a pre-existing restore-without-save bug unrelated to
PME. That series carries an identical copy of patch 6 so it applies on
its own; whichever of the two is applied second should drop its copy.

Patch 7 adds the subtest.

Pranay Samala (7):
  lib/igt_pci: Add PCI Power Management capability register layout
  lib/igt_pm: Add PCI PME capability and D state accessors
  lib/igt_pm: Factor out power attribute path construction
  lib/igt_pm: Add power/wakeup accessors
  lib/igt_pm: Add power/wakeup_active_count accessor
  lib/igt_pm: Add drm_kms_helper.poll save/restore helpers
  tests/chamelium/kms_chamelium_hpd: Add HPD from runtime suspended
    D3hot

 lib/igt_pci.h                       |  12 +
 lib/igt_pm.c                        | 449 +++++++++++++++++++++++++++-
 lib/igt_pm.h                        |  12 +
 tests/chamelium/kms_chamelium_hpd.c | 344 +++++++++++++++++++++
 4 files changed, 808 insertions(+), 9 deletions(-)

-- 
2.53.0

