Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA78BC02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 18:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9999510E960;
	Wed, 12 Feb 2025 18:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fibiALZ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEDD10E960
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 18:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739386085; x=1770922085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YAjdIdNAHBPpbDSRxY6Z5K+xCXdjWSUoeFQ6lLSskTU=;
 b=fibiALZ9mRb5RMxoEFBQNyWMiTP6/Bx/F+xR4nxUN7tIFJ56BkqR1Rzu
 CVd/pEnRgMlcJ8tnWtX+u4WYdOwMP+g0PNlPFw+TM/9bXEhUmiXApN0xr
 i3sRO33AADA///mo5Y0/CgH1Jp1++Jqxh2/9y5M+NShBeniTTi2CqBZc+
 oa1LNPi8nsLFmZopkBvp/SaxOXO2ux83NMKKIVwAvt0bLdp0YukwIVzKN
 +D9Hk1krJCEd4lyk62ebHvNCFnUaMZAnWUDOndb7vH6Hqc79QHlaTwXt1
 jtibtHurHDBgTWH7+RP1IG7pwzhRvkqfVK9uTVVcWKgpWy9Ycz3NIuQNY w==;
X-CSE-ConnectionGUID: gDAdyo1oSjCPQL17IkDjHA==
X-CSE-MsgGUID: K4lQAT2ORhmYSIRo6bgIOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40209766"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="40209766"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:48:04 -0800
X-CSE-ConnectionGUID: UtZcgGg1SBCfOYe+dZJKag==
X-CSE-MsgGUID: OixNukeBTRyQHDpSpxXeUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117028598"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.17.221])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:48:01 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2 i-g-t 0/5] Add SR-IOV provisioning scheduling attributes
 and tests
Date: Wed, 12 Feb 2025 19:47:52 +0100
Message-Id: <20250212184757.586071-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Add helper functions to get and set SR-IOV provisioning scheduling
attributes. These functions provide an interface for accessing
provisioning attributes such as execution quantum, preemption timeout,
schedule if idle policy, schedule priority, and engine reset policy.
Include both returning and asserting versions to handle errors
appropriately.

Introduce a function to validate default SR-IOV scheduling attributes
for VFs and PF. This function skips the test if non-default attributes
are detected. The default attributes verified include:
- exec_quantum_ms set to 0 (infinite execution quantum)
- preempt_timeout_us set to 0 (infinite preemption timeout)
- sched_if_idle set to false
- reset_engine set to false
- sched_priority set to XE_SRIOV_SCHED_PRIORITY_LOW

Implement equal-throughput validation for VFs (PF is treated as VF0)
with identical workloads and scheduling settings.
Scheduling settings are adjusted to consider execution quantum, job
duration, and the number of VFs, while adhering to timeout constraints
and aiming for a sufficient number of job repeats. This approach
balances overall test duration with accuracy.

Verify the occurrence of engine resets
when non-preemptible workloads surpass the combined
duration of execution quantum and preemption timeout.

v2:
- After review corrections (update description, remove magic numbers,
  remove debug message for consistency with the remaining code,
  remove short command line options) (Lukasz)
- Refactor scheduling parameter preparation for reuse in other tests
- Replace hardcoded JOB_TIMEOUT_MS with sysfs_get_job_timeout_ms() to
  dynamically retrieve the value.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

Marcin Bernatowicz (5):
  lib/xe/xe_sriov_provisioning: Add scheduling attributes accessors
  lib/xe/xe_sriov_provisioning: Add helper to check default scheduling
    attributes
  tests/xe_sriov_scheduling: VF equal-throughput validation
  tests/xe_sriov_scheduling: nonpreempt-engine-resets subtest
  tests/xe_sriov_scheduling: Get job timeout from sysfs

 lib/xe/xe_sriov_provisioning.c    | 410 ++++++++++++++-
 lib/xe/xe_sriov_provisioning.h    |  55 +-
 tests/intel/xe_sriov_scheduling.c | 821 ++++++++++++++++++++++++++++++
 tests/meson.build                 |   1 +
 4 files changed, 1285 insertions(+), 2 deletions(-)
 create mode 100644 tests/intel/xe_sriov_scheduling.c

-- 
2.31.1

