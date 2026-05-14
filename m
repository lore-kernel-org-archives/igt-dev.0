Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ED9CD4F25
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 16:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA8C10E3BF;
	Thu, 14 May 2026 16:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TXG4q8do";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DB610E3BF
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 16:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778774733; x=1810310733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0mMwyW91TnfmVX2ygg0P49AOBEKTSTPy7m95OIbqy7M=;
 b=TXG4q8doUQnamvwOWl5sFG8YByGfTjRsNEtPen7fXMcNM7x/rCnBi7S2
 oNC1/xrd/HHFdeyv+S2XWAYxdSHBYUAsdpWM5jrbB5hmQvuTOOJhRXG3X
 A+q1vBRlIBEE3cNeaSHUS9AjnUouXdHycxN09rfWFjBPHTxa+a33Yu4f8
 dooaXRI1X9OvRb7/OdvY2Q+Y3o5yuhmWEjpaIuSwl26H+H3+FHd43pL6P
 akRTPM6u2KCzPqV44EJ7XRbAXzJnVj1uCEB4dHCoqgyZQaxJAkE9dOO8A
 a6vYqCs5LIPF17SehcuoRb+uWqaJEi3wcm9ouQvupLN/SdK4VQZBDh0Ih w==;
X-CSE-ConnectionGUID: ztgjpc6cTuieK/ea6DAGsA==
X-CSE-MsgGUID: H8dfIRWxQvai2clRt8i17A==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79892016"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="79892016"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 09:05:31 -0700
X-CSE-ConnectionGUID: 6wHbfOJ0R/2lmUCvEGxtuQ==
X-CSE-MsgGUID: Ro6V8ahKT5KFWgONwf+q0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="268771737"
Received: from tmistat.igk.intel.com ([10.91.34.58])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 09:05:29 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Ramadevi Gandi <ramadevi.gandi@intel.com>,
 Srinivasula Reddy Pondugula <p.srinivasula.reddy@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel-ci: Update VF and VM blocklists
Date: Thu, 14 May 2026 16:57:23 +0000
Message-ID: <20260514165723.10559-1-jakub1.kolakowski@intel.com>
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

Add tests related to survivability mode and HWMON. Also add selected
xe_pmu tests.

Cc: Ramadevi Gandi <ramadevi.gandi@intel.com>
Cc: Srinivasula Reddy Pondugula <p.srinivasula.reddy@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel-ci/xe.sriov-vf.blocklist.txt | 14 ++++++++++++--
 tests/intel-ci/xe.sriov-vm.blocklist.txt | 15 +++++++++++++--
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/tests/intel-ci/xe.sriov-vf.blocklist.txt b/tests/intel-ci/xe.sriov-vf.blocklist.txt
index 4a19aa943..fab92c523 100644
--- a/tests/intel-ci/xe.sriov-vf.blocklist.txt
+++ b/tests/intel-ci/xe.sriov-vf.blocklist.txt
@@ -10,7 +10,8 @@ igt@xe_module_load@.*
 #
 igt@sriov_basic.*
 igt@xe_eudebug_sriov.*
-igt@xe_pmu@.*fn-engine-activity.*
+igt@xe_pmu@.*engine-activity-.*
+igt@xe_pmu@gt-c6-idle
 igt@xe_sriov.*
 #
 # display related tests
@@ -58,6 +59,15 @@ igt@xe_pmu@gt-frequency
 #
 igt@xe_query@.*cs-cycles
 #
+# survivability mode is not supported in VF.
+#
+igt@xe_configfs@survivability-mode
+igt@xe_survivability@.*
+#
+# HWMON is not supported inside VF.
+#
+igt@intel_hwmon@hwmon-(read|write)
+#
 # Tests that need to be executed in VM instead.
 #
-igt@xe_live_ktest.*
\ No newline at end of file
+igt@xe_live_ktest.*
diff --git a/tests/intel-ci/xe.sriov-vm.blocklist.txt b/tests/intel-ci/xe.sriov-vm.blocklist.txt
index 6271b1a70..f60b0de26 100644
--- a/tests/intel-ci/xe.sriov-vm.blocklist.txt
+++ b/tests/intel-ci/xe.sriov-vm.blocklist.txt
@@ -11,7 +11,8 @@ igt@xe_ccs@suspend-resume
 #
 igt@sriov_basic.*
 igt@xe_eudebug_sriov.*
-igt@xe_pmu@.*fn-engine-activity.*
+igt@xe_pmu@.*engine-activity-.*
+igt@xe_pmu@gt-c6-idle
 igt@xe_sriov.*
 #
 # display related tests
@@ -57,4 +58,14 @@ igt@xe_pmu@gt-frequency
 #
 # The feature query_cs_cycles is not supported on VF
 #
-igt@xe_query@.*cs-cycles
\ No newline at end of file
+igt@xe_query@.*cs-cycles
+#
+# survivability mode is not supported in VF.
+#
+igt@xe_configfs@survivability-mode
+igt@xe_survivability@.*
+#
+# HWMON is not supported inside VF.
+#
+igt@intel_hwmon@hwmon-(read|write)
+#
-- 
2.43.0

