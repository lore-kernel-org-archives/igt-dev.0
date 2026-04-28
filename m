Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2A0FF886C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 08:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B7C10E320;
	Tue, 28 Apr 2026 08:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNnw7ZZW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B8C10E320
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 08:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777366751; x=1808902751;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I/f252IqyL404EWf8fo1+S//9LLAvDc7xUUhvxL3Gxk=;
 b=DNnw7ZZWtmVkgEhBVRv39uLpd+tnVzvOfRr3pEdzceU5zxvJgtuepD+K
 hlteMlmg5AVHMp7EO+nIHobGCFEqW1RRduEkYRdQFMqB8JoYLU418m5bG
 LFMqawxQzm0bhNzLoc26+mR3StpU5l0KIQ3WPedSGHdVM7YCNaT0RZf5U
 +sZMYziSD31WtIovQYWn5ohFyg5vF1JvPC0yD7aOLiBHeKtkmfdZQVf+a
 AgJa3HXtUxfy4zsc2yPRMlPY237b2yA35wS+mHB1MNtifD2Fib9fn+pBn
 HShev1837H4PciiKv1x3kidGSX1vlcEJ+BMj7moGyGrbcw13eagEFiNL4 g==;
X-CSE-ConnectionGUID: ALG5BEmuT7+Zt7pLFh8Abw==
X-CSE-MsgGUID: PwZLEzi1QcCwQTI/dQe+5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78461007"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78461007"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:59:11 -0700
X-CSE-ConnectionGUID: nMcVU8W0R0G8U3s/ZiSMtw==
X-CSE-MsgGUID: 8Xn9J2VyTHi9Bbhk5QFRPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="237854286"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:59:09 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t] tools/vmtb: Add VMTB fast-feedback testlist
Date: Tue, 28 Apr 2026 10:22:43 +0200
Message-Id: <20260428082243.299243-1-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
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

Enable basic VM tests as BATs:
- create and provision VFs, assign to VMs and probe guest driver
- execute simple IGT workloads on booted VMs

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 .../vmtb/vmm_flows/intel-ci/fast-feedback.testlist | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist

diff --git a/tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist b/tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist
new file mode 100644
index 000000000..37c4dea3a
--- /dev/null
+++ b/tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist
@@ -0,0 +1,14 @@
+#####################################################
+#
+# VMM Flows fast-feedback test list:
+# defines tests to be executed pre-/post-merge BATs.
+#
+# This is allow list, needs to be extended if new
+# tests need to be added to scope.
+#
+#####################################################
+######################
+# Basic VF/VM create
+######################
+test_basic.py::TestVmSetup
+test_basic.py::TestVmWorkload
-- 
2.39.1

