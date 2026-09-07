Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30460C79F89
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 14:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42BF10E851;
	Mon,  7 Sep 2026 14:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6vcy1nL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5097510E853
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 14:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788790150; x=1820326150;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=voIG0fd6cEl7CHOl97ta0cLYtBg/WSjym0MBX9v50HQ=;
 b=R6vcy1nLWCvXde8Pm93LyHRZwJ3HBqC/wotcMFendHKcmawT9d26SVVU
 0f5/YWjtJN8zuLvRHG4wFSbgnqtClrKDWi0vrOcuJAtSw/m2EqMb6iuLF
 O1fRR6B7bYgigjhaYznhMqiFLCmfX1b8wblDgPFI4ahNQ+synqs9U4XOU
 cwwAOOuOormKYObd3WCiHSS89dsn2J/PXanU1qg1fWihvAP94IExCs1fl
 sfYr41seNmz+fRnnhQ+lQSOIHNr3P9FfJvA3uYNrYStUdT6YySx7ZXPVz
 u4H3eZIo3fTgGRh5vCr35rMCsllv71kekuOTtMsl8gff+VgWDC/RpPpN9 A==;
X-CSE-ConnectionGUID: OSBIhSFxS+avan3eH7F4Fw==
X-CSE-MsgGUID: 7jWUQN0ZR3y/q8HMjfm1Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100355086"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="100355086"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 07:09:10 -0700
X-CSE-ConnectionGUID: MEzX7CtPS+2C/4nEo89MbA==
X-CSE-MsgGUID: PfxdRzjoS2Gkl1xIGt8iCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274522296"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 07:09:07 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 0/7] Validate PM_PME signalling on display hotplug
Date: Mon,  7 Sep 2026 19:52:52 +0530
Message-ID: <20260907142259.750528-1-pranay.samala@intel.com>
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
PME_Status distinguishes a device that signalled but was never
acknowledged from one that never signalled at all, which makes a failure
report actionable instead of just "no uevent".

Patches 3-5 add the power/wakeup and power/wakeup_active_count
accessors, with patch 3 factoring out the path construction they share.
active_count is used rather than wakeup_count because the latter never
moves for a runtime resume.

Patch 6 adds igt_pm_kms_poll_save(), _set() and _restore(). The two
tests that already open code this are converted in a separate series
that depends on this one, since one of them also has a pre-existing
restore-without-save bug unrelated to PME.

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
 lib/igt_pm.c                        | 457 +++++++++++++++++++++++++++-
 lib/igt_pm.h                        |  12 +
 tests/chamelium/kms_chamelium_hpd.c | 344 +++++++++++++++++++++
 4 files changed, 816 insertions(+), 9 deletions(-)

-- 
2.53.0

