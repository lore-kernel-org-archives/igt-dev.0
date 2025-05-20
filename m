Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA7CC3ABDD
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 11:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618E410E579;
	Tue, 20 May 2025 11:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQuMwHuz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB7210E598
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 11:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747740865; x=1779276865;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6d70GNwY6LJpO5vjv1nWlnseAS0MU/p0I7oZajoqSA0=;
 b=UQuMwHuzFwRi0nd6ceSHGZ1+BTugONk2Ddfafd3pP+hpiAsIEBeo3shy
 6FPau7eFHVnN9/fdUTvZdJ7n47gOeIs+4Lbww5HLWvJk+qrrjtgS6ZGWl
 x6WPe/Pvu2nBscsiUVgtXzUzh2cIRv+XVNvAC1LZIc8goc2XzDOfsBTX0
 1BtKs7WeUQJOLr9LMcLiFfuKNB3YnoDKd5eJQDoOdAvNhQ5w/oNMI39WZ
 zPKQUMeYM9gYsICeK3cjhjU9ZaMIMQOt8g5qfj/1XrIbqDfZHZSg5Kl8z
 mJGUibgMEu6ILg50z4HMISKmkNPpiDzHxEfEn8l8hbreZVXpZ66gfWli/ g==;
X-CSE-ConnectionGUID: 0LVqMY+yTGCknxUiRzqIUQ==
X-CSE-MsgGUID: pQ2ifDUXSJ+sFkCPpArIzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="37288151"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="37288151"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 04:34:25 -0700
X-CSE-ConnectionGUID: JnwIircORuS3qg7jcG1jaw==
X-CSE-MsgGUID: KGCNXvxzTcKnlx4Sj1kvvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140588286"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.227.88.132])
 by orviesa008.jf.intel.com with ESMTP; 20 May 2025 04:34:23 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com, katarzyna.piecielska@intel.com,
 kamil.konieczny@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH v4 i-g-t] tests/intel-ci: Add platform  Blocklist for Eudebug
Date: Tue, 20 May 2025 17:04:22 +0530
Message-Id: <20250520113422.2504-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.40.0
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Add blocklist file for LNL/BMG and core blocklist for debugger
functionality

v2: Add files to meson.build (Rama)
v3: Add .txt in meson.build (Rama)
v4: Arrange the entries in alphabetical order (Kamil)

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Ramadevi Gandi <ramadevi.gandi@intel.com>
Reviewed-by: Ramadevi Gandi <ramadevi.gandi@intel.com>
---
 tests/intel-ci/meson.build                  | 3 +++
 tests/intel-ci/xe.bmg.eudebug.blocklist.txt | 5 +++++
 tests/intel-ci/xe.eudebug.blocklist.txt     | 4 ++++
 tests/intel-ci/xe.lnl.eudebug.blocklist.txt | 6 ++++++
 4 files changed, 18 insertions(+)
 create mode 100644 tests/intel-ci/xe.bmg.eudebug.blocklist.txt
 create mode 100644 tests/intel-ci/xe.eudebug.blocklist.txt
 create mode 100644 tests/intel-ci/xe.lnl.eudebug.blocklist.txt

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index cb775e2f1..4aacb479d 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -11,8 +11,11 @@ intelci_files = [
   'xe.blocklist.txt',
   'xe.bmg.core.blocklist.txt',
   'xe.bmg.display.blocklist.txt',
+  'xe.bmg.eudebug.blocklist.txt',
+  'xe.eudebug.blocklist.txt',
   'xe.lnl.core.blocklist.txt',
   'xe.lnl.display.blocklist.txt',
+  'xe.lnl.eudebug.blocklist.txt',
   'xe-fast-feedback.testlist',
   'xe-fast-feedback-chamelium-only.testlist',
   'xe-sriov-vf.blocklist.txt',
diff --git a/tests/intel-ci/xe.bmg.eudebug.blocklist.txt b/tests/intel-ci/xe.bmg.eudebug.blocklist.txt
new file mode 100644
index 000000000..661e3122a
--- /dev/null
+++ b/tests/intel-ci/xe.bmg.eudebug.blocklist.txt
@@ -0,0 +1,5 @@
+#####################################################
+# BMG specific blocklist for Xe EUdebugger tests
+#####################################################
+igt@.*@.*tiles
+igt@.*@*multigpu.*
diff --git a/tests/intel-ci/xe.eudebug.blocklist.txt b/tests/intel-ci/xe.eudebug.blocklist.txt
new file mode 100644
index 000000000..e13a5cc2b
--- /dev/null
+++ b/tests/intel-ci/xe.eudebug.blocklist.txt
@@ -0,0 +1,4 @@
+#####################################################
+# Core Blocklist for Xe EUdebugger tests
+#####################################################
+igt@(?!.*xe.*eudebug.*|xe_exec_sip.*).*
diff --git a/tests/intel-ci/xe.lnl.eudebug.blocklist.txt b/tests/intel-ci/xe.lnl.eudebug.blocklist.txt
new file mode 100644
index 000000000..cabac8858
--- /dev/null
+++ b/tests/intel-ci/xe.lnl.eudebug.blocklist.txt
@@ -0,0 +1,6 @@
+#####################################################
+# LNL specific blocklist for Xe EUdebugger tests
+#####################################################
+igt@.*@.*tiles
+igt@.*@*multigpu.*
+igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
-- 
2.40.0

