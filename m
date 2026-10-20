Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6988606A32E
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZyJS4xPg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E81A10E270;
	Tue, 20 Oct 2026 14:12:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEC910E270
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792505522; x=1824041522;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LPnU0HQeJCnj/gt4YeJidr+wf3w6pbvl4iV64igmbco=;
 b=ZyJS4xPgkCo01LOIeoFeUEKHXTOC5bssnG/gJ4gTJJnX88SyVM97FQe7
 dXTsAopBwkBc53on0Gnu23inXgDlchui3s10/CguRk05wQWqgr0ilsrKX
 xSnSHWf3osCJHMm2C3Pftz37oa79Yz1Uwgfm79gB3UxnNOow4aLOlPsJ4
 oagTytaaUqEjlCvhgZkEobjlTqIh7U+qSpQ+jYddVNsqiv5CDA5890pAR
 0YPgBP3Wr6sfNZrjYl5CTGkmBOJhhrbvVeoa6Qp8w9W50QVf9SdIpHOwR
 1kHjgErG1ZF4xVTqG0gAn0zsHpf9/knpmyxG+sXjCG8MRwJ3zhdrPyOOF g==;
X-CSE-ConnectionGUID: ObGSGXtKQK6A2bYCPi2cdQ==
X-CSE-MsgGUID: UEJLUF8CRkyxFcF6YHz9eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1309534"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1309534"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:02 -0700
X-CSE-ConnectionGUID: iFU6DDY/SZq9X7eLcWVMJQ==
X-CSE-MsgGUID: wnu4kNjhRrqR0Nyr7ikP1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2775691"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:00 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 0/7] Validate PM_PME signalling on display hotplug
Date: Tue, 20 Oct 2026 19:41:44 +0530
Message-ID: <20261020141151.753331-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

So the new subtest runs against the same suspended device in three steps:

  Control: suspend with power/wakeup disabled, so PME is not armed, and
           check the device is woken by the poll within two periods.
           This proves polling is live on the setup and that the test
           catches a poll wake, and measures what one costs.
  Phase 1: arm PME, hold the device idle in D3hot for 25s and check it
           never wakes.
  Phase 2: plug and then unplug from D3hot and check that each produces
           a uevent, that the connector status updated, and that
           power/wakeup_active_count incremented, i.e. that the resume
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

Patch 6 adds igt_kms_poll_save(), _set() and _restore() to igt_kms.
Converting the two tests that already open code this is left to a
separate series.

Patch 7 adds the subtest.

v2:
- Rebase

v3:
- 2/7: check power_state before touching config space, report D3cold
  from it, return errors from PME_En/PME_Status reads, generic
  kerneldoc (Kunal)
- 4/7: drop the xe note, document the counter reset on enable (Kunal)
- 5/7: mention the PME poll route, return -1 when there is no wakeup
  source (Kunal)
- 6/7: move to igt_kms and rename, document that setting the parameter
  does not restart a stopped poll worker (Kunal)
- 7/7: decide D3hot once, settle before baselines, watch the idle
  window once, add the control run, fix the uevent/latency race, check
  requirements before changing state and restore it on failure, misc
  cleanups (Kunal)

Pranay Samala (7):
  lib/igt_pci: Add PCI Power Management capability register layout
  lib/igt_pm: Add PCI PME capability and D state accessors
  lib/igt_pm: Factor out power attribute path construction
  lib/igt_pm: Add power/wakeup accessors
  lib/igt_pm: Add power/wakeup_active_count accessor
  lib/igt_kms: Add drm_kms_helper.poll save/restore helpers
  tests/chamelium/kms_chamelium_hpd: Add HPD from runtime suspended
    D3hot

 lib/igt_kms.c                       | 101 ++++++
 lib/igt_kms.h                       |   3 +
 lib/igt_pci.h                       |  12 +
 lib/igt_pm.c                        | 450 +++++++++++++++++++++++-
 lib/igt_pm.h                        |   9 +
 tests/chamelium/kms_chamelium_hpd.c | 528 ++++++++++++++++++++++++++++
 6 files changed, 1094 insertions(+), 9 deletions(-)

-- 
2.53.0

