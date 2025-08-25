Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1FBCA0FE7
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 16:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D214010E4F5;
	Mon, 25 Aug 2025 16:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3FKpBB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD71F10E4F5
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756138298; x=1787674298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=atXBrfEBVholEO+5xgU8CPCsAP2fO2SRL6lZ030+Zw0=;
 b=i3FKpBB5tdVohPW+X+3xzOR3qXNbJFb5pQNa3KPPhtVZ/IXGJU31Fh2u
 v7OIEsHyqeWIaRlsS0QI8Iv6SFvkRMBt5MxCo9q8vUbrPeh1fTWp7OwyT
 EFfj0YebvKVTW6UYX8szX7wGhGsivGSKxBhWtEQn/3iGTCfinn1y52K93
 yuvU/THAvQBGfEqAtA67oQNVP7ZCZTWQ78UBG38VYNDAe6ogev35CfS/p
 qasACUHf04tl9wKQJr+hIUGR0on7wP5tbIaBa9HFH00yGL6OYWb3O+/jq
 i6aBDXGoG63oIldyZ3y9xtIDyAjb29cwWzCSiyxcp+nlpTXxVwTPXb5o2 Q==;
X-CSE-ConnectionGUID: GoJT+liLQmWZu+/ZrkUAow==
X-CSE-MsgGUID: U5gIF+cpRf6vJHiqYNccpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58424925"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="58424925"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:11:37 -0700
X-CSE-ConnectionGUID: dSg2hv2TSambgMxzFQH1tQ==
X-CSE-MsgGUID: PSCn5hSGTtuKjw1mfBi+yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168939586"
Received: from tmistat.igk.intel.com ([10.91.214.42])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:11:36 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel-ci/: Extend VF and VM blocklists
Date: Mon, 25 Aug 2025 16:53:45 +0000
Message-Id: <20250825165346.504290-2-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250825165346.504290-1-jakub1.kolakowski@intel.com>
References: <20250825165346.504290-1-jakub1.kolakowski@intel.com>
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

Currently VF and VM blocklists are supposed to be short and only
contain tests that are breaking/aborting the CI run. However with the
huge amount of expected skips present in VM runs it is justified to
change the approach of using those blocklists and include all tests that
are expected to skip when driver is in VF mode.
Extend VF and VM blocklists and include expected skips. This should
speed up CI runs in configurations where driver is in VF mode (mainly VM
runs where many kms tests are skipping).

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 tests/intel-ci/xe-sriov-vf.blocklist.txt | 54 +++++++++++++++++++++++-
 tests/intel-ci/xe-sriov-vm.blocklist.txt | 52 +++++++++++++++++++++++
 2 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe-sriov-vf.blocklist.txt
index 03371d80c..69d647ef0 100644
--- a/tests/intel-ci/xe-sriov-vf.blocklist.txt
+++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
@@ -4,4 +4,56 @@
 #
 # Prevent potential module reloads during tests
 #
-igt@xe_module_load
+igt@xe_module_load@.*
+#
+# tests applicable for PF only
+#
+igt@sriov_basic.*
+igt@xe_eudebug_sriov.*
+igt@xe_pmu@.*fn-engine-activity.*
+igt@xe_sriov.*
+#
+# display related tests
+#
+igt@fbdev.*
+igt@kms.*
+igt@testdisplay
+igt@xe_pat@.*display.*
+igt@xe_pxp@.*display.*
+#
+# power management related tests
+#
+igt@xe_gt_freq.*
+igt@xe_pm_residency.*
+#
+# OA is disabled in VF mode
+#
+igt@xe_oa@.*
+igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs
+igt@xe_query@.*query-oa-units
+#
+# engine utilization data not available in VF mode
+#
+igt@xe_drm_fdinfo@.*utilization.*
+#
+# EU stall feature not available in VF mode
+#
+igt@xe_eu_stall.*
+#
+# The "mocs" debugfs entry is expected to be missing in VF mode
+#
+igt@xe_exec_reset@gt-mocs-reset
+igt@xe_live_ktest@xe_mocs
+igt@xe_pm@.*-mocs
+#
+# PCI power management capability not present in VF mode
+#
+igt@xe_pm@.*d3
+#
+# freq0 node not available for VF
+#
+igt@xe_pmu@gt-frequency
+#
+# The feature query_cs_cycles is not supported on VF
+#
+igt@xe_query@.*cs-cycles
\ No newline at end of file
diff --git a/tests/intel-ci/xe-sriov-vm.blocklist.txt b/tests/intel-ci/xe-sriov-vm.blocklist.txt
index 06ed60b52..6271b1a70 100644
--- a/tests/intel-ci/xe-sriov-vm.blocklist.txt
+++ b/tests/intel-ci/xe-sriov-vm.blocklist.txt
@@ -6,3 +6,55 @@
 #
 igt@xe_pm@s2idle.*
 igt@xe_ccs@suspend-resume
+#
+# tests applicable for PF only
+#
+igt@sriov_basic.*
+igt@xe_eudebug_sriov.*
+igt@xe_pmu@.*fn-engine-activity.*
+igt@xe_sriov.*
+#
+# display related tests
+#
+igt@fbdev.*
+igt@kms.*
+igt@testdisplay
+igt@xe_pat@.*display.*
+igt@xe_pxp@.*display.*
+#
+# power management related tests
+#
+igt@xe_gt_freq.*
+igt@xe_pm_residency.*
+#
+# OA is disabled in VF mode
+#
+igt@xe_oa@.*
+igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs
+igt@xe_query@.*query-oa-units
+#
+# engine utilization data not available in VF mode
+#
+igt@xe_drm_fdinfo@.*utilization.*
+#
+# EU stall feature not available in VF mode
+#
+igt@xe_eu_stall.*
+#
+# The "mocs" debugfs entry is expected to be missing in VF mode
+#
+igt@xe_exec_reset@gt-mocs-reset
+igt@xe_live_ktest@xe_mocs
+igt@xe_pm@.*-mocs
+#
+# PCI power management capability not present in VF mode
+#
+igt@xe_pm@.*d3
+#
+# freq0 node not available for VF
+#
+igt@xe_pmu@gt-frequency
+#
+# The feature query_cs_cycles is not supported on VF
+#
+igt@xe_query@.*cs-cycles
\ No newline at end of file
-- 
2.25.1

