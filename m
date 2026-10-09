Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCD6CA6015
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 05:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE0310E0FD;
	Fri,  9 Oct 2026 05:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhq+dJC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF2C10E0FD
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 05:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791523598; x=1823059598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/WRlxRypixeM0vydAU6X4lUR1dBvs9iEh2IBZCVZB6o=;
 b=jhq+dJC1ggwQIise+fQ2vkiAyraTTRzRR8EHodh73rjHOsw1uz6a27OX
 P3+m7BXlwdM34fn4GbZGj+hOHsPiMGmynJVRO7iufVeRY7IDCFr68GVCK
 nDosb7ut9tHiY/HzhpgvLOT1kloayJxY+TbnYXXOyW4n3k3D1IxdJxf7P
 EY6ahTd/2PO4ZL5WABciZfvcnF4Ek1N+f1U+u0kMkHXVNdpDW5rbt34lF
 fUcc0BgWOcnIKa9qgZ5gVWviFBPJT48sKA0U6CK9BLw9rhJdSI466R7b3
 A30JmZr43jhXUCh5UC72WshMG96J9krxCxDyR6ZNbskPg4Rqor2q7hMbR w==;
X-CSE-ConnectionGUID: qoYg7eoFS2qifbqc+LQ6GA==
X-CSE-MsgGUID: agT/VvCaT5qsbYacrkD64w==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="318183"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="318183"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:26:38 -0700
X-CSE-ConnectionGUID: DMCQ8SAIQZqcappqdQWLRw==
X-CSE-MsgGUID: CO+WebCNSGePp4/X/qHnvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="2040513"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:26:35 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2 0/7] Validate PM_PME signalling on display hotplug
Date: Fri,  9 Oct 2026 10:56:18 +0530
Message-ID: <20261009052625.419259-1-pranay.samala@intel.com>
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

v2:
- Rebase

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

