Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B418EC55ABF
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 15:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CB310EAEC;
	Tue,  4 Aug 2026 15:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7azvgVN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4DC10EAE9
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2026 15:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785857244; x=1817393244;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mns/fXnA9+jBfy+Cx4vxh4zS5+BkMlRtdiq8NUYGpsI=;
 b=d7azvgVNQmtgQNTJhyyYsYgWviiWht+6n4ap+MGAw7dT6jVn5np8LgMs
 s0A3LdXNlPSfYxg/FVIiGI2Y3HFR0jfl3A1KUNhhMUXUFy8PfP1oAAiPv
 z08IlyrZZkzZqegMFnhzi5EADp4POYQmKxrpbdIPUDSttf2b7u7j171ma
 M8vKTQlerAKiOyWks+T9Nx/RSVbeMv7lPGXSMRzqO+oGLHMHnlExg840M
 MZMcQvC4AhduAL/gCyeWjAKgn1Vn8BBqAyiaq239QJqLdg1Y5SrZBBsYx
 8aJ5yVjEgwZlaRGvCg9ah8exJbtGQI8tL0PxumOkQ8TkUJdNrdD1Uzy6Y w==;
X-CSE-ConnectionGUID: DKckyjcETba1GAw0JuYM0g==
X-CSE-MsgGUID: fUYV+zOzTz+IMZXn5695Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="96771050"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="96771050"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 08:27:24 -0700
X-CSE-ConnectionGUID: yJRCc7aLSHKfiVh56rgcGw==
X-CSE-MsgGUID: f8UJXNjKRrOheMvuQYBYaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="291473534"
Received: from tmistat.igk.intel.com ([10.91.34.58])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 08:27:23 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci: Add expected skips to VF/VM blocklists
Date: Tue,  4 Aug 2026 16:20:19 +0000
Message-ID: <20260804162019.628281-1-jakub1.kolakowski@intel.com>
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

igt@xe_wedged@wedged-at-any-timeout, igt@xe_wedged@wedged-mode-toggle
and igt@xe_pat@pat-sw-hw.* are expected skips in VF mode.
Add those tests to VF and VM blocklists.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel-ci/xe.sriov-vf.blocklist.txt | 11 ++++++++++-
 tests/intel-ci/xe.sriov-vm.blocklist.txt | 11 ++++++++++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/xe.sriov-vf.blocklist.txt b/tests/intel-ci/xe.sriov-vf.blocklist.txt
index 4a19aa943..ea0f478f4 100644
--- a/tests/intel-ci/xe.sriov-vf.blocklist.txt
+++ b/tests/intel-ci/xe.sriov-vf.blocklist.txt
@@ -60,4 +60,13 @@ igt@xe_query@.*cs-cycles
 #
 # Tests that need to be executed in VM instead.
 #
-igt@xe_live_ktest.*
\ No newline at end of file
+igt@xe_live_ktest.*
+#
+# driver rejects attempts to set wedged_mode=2 on a VF
+#
+igt@xe_wedged@wedged-at-any-timeout
+igt@xe_wedged@wedged-mode-toggle
+#
+# On VF HW PAT may not be readable
+#
+igt@xe_pat@pat-sw-hw.*
diff --git a/tests/intel-ci/xe.sriov-vm.blocklist.txt b/tests/intel-ci/xe.sriov-vm.blocklist.txt
index 6271b1a70..09b3540aa 100644
--- a/tests/intel-ci/xe.sriov-vm.blocklist.txt
+++ b/tests/intel-ci/xe.sriov-vm.blocklist.txt
@@ -57,4 +57,13 @@ igt@xe_pmu@gt-frequency
 #
 # The feature query_cs_cycles is not supported on VF
 #
-igt@xe_query@.*cs-cycles
\ No newline at end of file
+igt@xe_query@.*cs-cycles
+#
+# driver rejects attempts to set wedged_mode=2 on a VF
+#
+igt@xe_wedged@wedged-at-any-timeout
+igt@xe_wedged@wedged-mode-toggle
+#
+# On VF HW PAT may not be readable
+#
+igt@xe_pat@pat-sw-hw.*
-- 
2.43.0

