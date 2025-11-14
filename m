Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21079CE8D76
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 19:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFDF10E25B;
	Fri, 14 Nov 2025 19:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUT+YXiu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE6210E25B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 19:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763147284; x=1794683284;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xRaOlYYowYFGyemmQ3jhBDHc5E1yhooSJS9jhVrIesE=;
 b=PUT+YXiuyvJmF5VKSOVxvxhYZxsEbJgz15lAUwqLX8h3IxzxZZK/rta9
 yFbse9AfPfph6DOkwS2hgtPyAEpV8sKlQa/5OFdYoEfY7HkPxyhR7XZtb
 xKbKKdoGsomT59HTk+svwqyugfXH4DehaLceVTueOSN/xoq1pkQffTCRq
 vO9tyNpfuPpAraRKLC5QcRY1VxUOZEBBtRzNjz4RSQS2gYgkSzCvSqAD7
 ZJskD2L9PPbePjsj+R/pE68pXi7JVE4UqigFCDZ72o5e5/Ak0WyiXXExf
 EmdRbXnrAgeKjc48rFq2S5rLztO/8vofCPUNdgblNd0+d1Na8WoWPEOFM Q==;
X-CSE-ConnectionGUID: lhERA9f7Qvy9MKLIdcvnsQ==
X-CSE-MsgGUID: GAkPZoBpTjShSOoEq6HPHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="52818085"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="52818085"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:08:04 -0800
X-CSE-ConnectionGUID: WUZDM13HTqulGP0Lb018oA==
X-CSE-MsgGUID: AOGawgy4SP2RhqM0DCi7SA==
X-ExtLoop1: 1
Received: from mkrakus-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.23.186])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:08:01 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/5] Xe SR-IOV admin scheduling helpers and test updates
Date: Fri, 14 Nov 2025 20:07:50 +0100
Message-ID: <20251114190757.2295174-1-marcin.bernatowicz@linux.intel.com>
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

This series adds SR-IOV admin sysfs scheduling helpers and updates the
Xe SR-IOV tests to use them.

Patches 1–2 add string conversion utilities for sched_priority and
sched_priority_mask. Patch 3 introduces the SR-IOV admin sysfs accessors
for execution quantum, preemption timeout, scheduling priority, VF stop
and restoring defaults, following recent kernel changes:

  Link: https://lore.kernel.org/intel-xe/20251030222348.186658-1-michal.wajdeczko@intel.com/

Patches 4–5 update xe_sriov_scheduling to use the admin interface when
present and improve cleanup handling.

Marcin Bernatowicz (5):
  lib/xe/xe_sriov_provisioning: Add string conversion helpers for
    scheduling priority
  lib/xe/xe_sriov_provisioning: Add sched priority mask to string helper
  lib/xe/xe_sriov_admin: Add SR-IOV admin sysfs accessors
  tests/intel/xe_sriov_scheduling: Avoid assert on scheduling params
    restore in cleanup
  tests/intel/xe_sriov_scheduling: Prefer SR-IOV admin sysfs accessors

 lib/meson.build                   |   1 +
 lib/xe/xe_sriov_admin.c           | 670 ++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_admin.h           |  56 +++
 lib/xe/xe_sriov_provisioning.c    | 112 +++++
 lib/xe/xe_sriov_provisioning.h    |  13 +
 tests/intel/xe_sriov_scheduling.c |  62 ++-
 6 files changed, 903 insertions(+), 11 deletions(-)
 create mode 100644 lib/xe/xe_sriov_admin.c
 create mode 100644 lib/xe/xe_sriov_admin.h

-- 
2.43.0

