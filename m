Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2D5C02182
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 20:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2529310E029;
	Mon, 20 Jan 2025 20:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+knFy14";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A383A10E029
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 20:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737405293; x=1768941293;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=05Q4O1BTsajfVj5dcaWoJio7cxdXcO198ZSrmaTAh7A=;
 b=m+knFy14eozAog+Pcr7+qMutMAzKukSV/MybqbQj5O+xAICsmDCBvq3s
 +Q+08HaICRwUf0eKd23x+IVGbCn8X/pqRA73Ays1zbDUGD4HgsdEe2VwM
 g45RzZqN6qMZ9HWRllDG/KxF6uvUHTb4uP8+KAD9sUZr6/rKPd6A31bP6
 eMGZj2lMszwdodOaHWOWNUcrTjWh4BFiQP6/TlHPIk/vfLg070Jt0+FfV
 +JG6MUG9aXW0WUC/djaQTbhM6ZWZZEfKUM7UocCa6uDm6tPxx1lW/NYqQ
 H3rUnFHxVDIQwXVt9vTRgS2c1MO78W2fFNZXMUeGjwWGjymPl4WyBc2g5 g==;
X-CSE-ConnectionGUID: 56fxyzfaQnGnBreQjEE7yw==
X-CSE-MsgGUID: fVgDiMhRTDuO/3hR1h920w==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37723102"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; d="scan'208";a="37723102"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 12:34:53 -0800
X-CSE-ConnectionGUID: yFQORDsAQlm6CO1bZk/vPg==
X-CSE-MsgGUID: pdehRY/8SvGkSnBxOKQYNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107519762"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.103])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 12:34:50 -0800
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
Subject: [PATCH i-g-t 0/4] Add SR-IOV provisioning scheduling attributes and
 tests
Date: Mon, 20 Jan 2025 21:34:41 +0100
Message-Id: <20250120203445.16285-1-marcin.bernatowicz@linux.intel.com>
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

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

Marcin Bernatowicz (4):
  lib/xe/xe_sriov_provisioning: Add scheduling attributes accessors
  lib/xe/xe_sriov_provisioning: Add helper to check default scheduling
    attributes
  tests/xe_sriov_scheduling: VF equal-throughput validation
  tests/xe_sriov_scheduling: nonpreempt-engine-resets subtest

 lib/xe/xe_sriov_provisioning.c    | 411 ++++++++++++++-
 lib/xe/xe_sriov_provisioning.h    |  54 ++
 tests/intel/xe_sriov_scheduling.c | 824 ++++++++++++++++++++++++++++++
 tests/meson.build                 |   1 +
 4 files changed, 1289 insertions(+), 1 deletion(-)
 create mode 100644 tests/intel/xe_sriov_scheduling.c

-- 
2.31.1

