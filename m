Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382D3C5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 12:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E6B10EAF0;
	Tue, 18 Aug 2026 12:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SChyjesr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FDA10E3EB
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 12:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787056778; x=1818592778;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uWoJVqB/p4Vxk7Y4xUb1Y93LvnVrU5+yYVl0NkRWirQ=;
 b=SChyjesrqLHk4d7hqlLhA2+/PPcw3/hpOMawWV8IHbcxLqOPslS05GnG
 IfhVIkWac+iZe+ClkIsnvQMpkTcXC0yNMoShND15dE0teKlHMCaIRnWdG
 t2c6zZVnHNTno5crrDIhGq48SrSGi4bLTC6/KBUsV+/ZhtPUrDLPJcevf
 c9AINjYjzbH6AfSjcTArKH4OsH4Vl8Mnrkgv9T8EeQSChh+TaTNBVnDCJ
 Xve5X5gToDrDk7qIODD2qv7ytyOWGwfltAJpaCle7IIAQIO2ePuT6t+aM
 58x8RjGBmIcfhnhyo5HuFnG0nCFCF7TQfMZhR6JxwPJrhuo3GH0C+29SL w==;
X-CSE-ConnectionGUID: 1fpQRDdXTTWH6RQXZwFYOA==
X-CSE-MsgGUID: wukO5s3ZS2C5/BNQn5CJhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="113089396"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="113089396"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:39:36 -0700
X-CSE-ConnectionGUID: kX9JwvinR/GTaiLp9NOg0w==
X-CSE-MsgGUID: puQaszb5Se6RlYm7dR32Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="261930156"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.106])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:39:35 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t 0/6] Order SR-IOV scheduling provisioning safely
Date: Tue, 18 Aug 2026 14:39:24 +0200
Message-ID: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Provisioning execution quantum, preemption timeout and scheduling priority is
not order independent. Zero execution quantum and zero preemption timeout both
mean infinity, and a function left at a priority above LOW with infinite
timeslicing may never be switched away from by GuC. That is a risky state which
can be left via PAUSE/FLR, so the safe sequences are:

  setup:   exec_quantum, preempt_timeout, sched_priority
  cleanup: sched_priority (LOW), exec_quantum (0), preempt_timeout (0)

The restore helpers in lib did the opposite on cleanup, clearing timeslicing
first and dropping priority last. That transits through the risky state
whenever a test raised priority, and is reachable from xe_pmu, which restores
defaults while VFs are still enabled, and from the SR-IOV exit handler on abort
or signal.

Scheduling parameters should also only be reset once VFs are disabled, since
resetting them while VFs are still active can leave cleanup incomplete and make
subsequent VF probing fail.

Patch 1 was posted standalone before and is included here because the rest of
the series builds on it. Patch 2 renames the restore helpers to say scheduling
defaults, since they never touched resource provisioning. Patch 3 is the
ordering fix itself and stands on its own. Patch 4 adds a bulk setter enforcing
the setup order and rejecting infinite timeslicing, so the invalid combination
is unrepresentable rather than merely avoided by convention. Patches 5 and 6
move the tests over, and align xe_pmu cleanup with xe_sriov_scheduling.

Assisted-by: Copilot:Claude-Opus-5
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Marcin Bernatowicz (6):
  tests/intel/xe_sriov_scheduling: Disable VFs before resetting sched
    params
  lib/xe/xe_sriov_admin: Rename restore defaults helpers
  lib/xe/xe_sriov_admin: Lower priority before clearing timeslicing
  lib/xe/xe_sriov_admin: Add bulk scheduling params setter
  tests/intel/xe_sriov_scheduling: Use safe scheduling params helpers
  tests/intel/xe_pmu: Disable VFs before restoring sched params

 lib/xe/xe_sriov_admin.c           | 111 +++++++++++++++++++++++-------
 lib/xe/xe_sriov_admin.h           |  32 +++++++--
 tests/intel/xe_pmu.c              |   4 +-
 tests/intel/xe_sriov_admin.c      |   4 +-
 tests/intel/xe_sriov_scheduling.c |  88 +++++++----------------
 5 files changed, 140 insertions(+), 99 deletions(-)

-- 
2.43.0

