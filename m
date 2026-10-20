Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F038606A332
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mBP8Hf3x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE3610F3B2;
	Tue, 20 Oct 2026 08:26:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBE010F380
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792484735; x=1824020735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XmRiPyOx7NshfAZbnOdqnWD56EqrGcXKpDlnB36oOx0=;
 b=mBP8Hf3xD3sRXquNdoigzAAglcFgkpuGAZkscKWeUOFuPy8qJfiN6iht
 20qjsySEbcBmJiqJ65hiXEGEUupIokCHN4IXGbmOX/qtUGCBwnz2UuuLC
 NUsskWvWsGLZg/Jmq6Fx4dx+gnRnn5pZomwrMh4Hs69Dcst9zhhZGlxEc
 7QGEDyTg8E71aVJO02A1ZvzCgshVnVfsSyA/U1GAvWBVJA40BVa95XsS3
 oIT9g7gq7ySe+iV+M4HT1dNm+tG9ju4Obs9CCv04c9XHzH4mh10DvqVT7
 CHv3fcbcS6/O+CDqZEauVMufNDJGkYBfo5tePchQhIMgKRn+i+9y201mk A==;
X-CSE-ConnectionGUID: HL9ZnDCtT9m1FWI/vuZJ7g==
X-CSE-MsgGUID: GYEwe8vlQIynfLRf32bRoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1049115"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1049115"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:25:34 -0700
X-CSE-ConnectionGUID: DwcDnrjzRDCnfhtqnMg5ew==
X-CSE-MsgGUID: uqRjf1RETfGJzzlTiVlR4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2645089"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:25:33 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, jakub1.kolakowski@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t] tools/vmtb: Add VMTB BMG and PTL testlists
Date: Tue, 20 Oct 2026 09:44:32 +0200
Message-Id: <20261020074432.58422-1-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add testlists to enable VMTB full test runs on BMG and PTL:
- basic VF driver load/remove
- idle VF migration (save-restore)
- busy VF migration with WSIM and IGT workloads
- double migration with resfix stoppers (requires debug KMD build)

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/vmm_flows/intel-ci/bmg.testlist | 25 ++++++++++++++++++++++
 tools/vmtb/vmm_flows/intel-ci/ptl.testlist | 20 +++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 tools/vmtb/vmm_flows/intel-ci/bmg.testlist
 create mode 100644 tools/vmtb/vmm_flows/intel-ci/ptl.testlist

diff --git a/tools/vmtb/vmm_flows/intel-ci/bmg.testlist b/tools/vmtb/vmm_flows/intel-ci/bmg.testlist
new file mode 100644
index 000000000..a0b8a0b7a
--- /dev/null
+++ b/tools/vmtb/vmm_flows/intel-ci/bmg.testlist
@@ -0,0 +1,25 @@
+#####################################################
+#
+# VMM Flows BMG test list:
+# defines tests to be executed on BMG only.
+#
+#####################################################
+##########################
+# Basic VF/VM operations
+##########################
+test_basic.py::TestVfDriverLoadRemove
+#######################################
+# VF/VM save-restore - cold migration
+#######################################
+test_migration.py::TestIdleMigration
+test_migration.py::TestBusyMigrationWsim2
+test_migration.py::TestBusyMigrationWsim3
+test_migration.py::TestBusyMigrationIgtExecReset1
+test_migration.py::TestBusyMigrationIgtExecReset8
+test_migration.py::TestBusyMigrationIgtExecReset11
+test_migration.py::TestBusyMigrationIgtExecReset12
+test_migration.py::TestBusyMigrationIgtExecReset13
+test_migration.py::TestBusyMigrationIgtExecThreads1
+test_migration.py::TestBusyMigrationIgtExecThreads4
+test_migration.py::TestDoubleMigration1Resfix1
+test_migration.py::TestDoubleMigration2Resfix2
diff --git a/tools/vmtb/vmm_flows/intel-ci/ptl.testlist b/tools/vmtb/vmm_flows/intel-ci/ptl.testlist
new file mode 100644
index 000000000..d7be6190d
--- /dev/null
+++ b/tools/vmtb/vmm_flows/intel-ci/ptl.testlist
@@ -0,0 +1,20 @@
+#####################################################
+#
+# VMM Flows PTL test list:
+# defines tests to be executed on PTL only.
+#
+#####################################################
+##########################
+# Basic VF/VM operations
+##########################
+test_basic.py::TestVfDriverLoadRemove
+#######################################
+# VF/VM save-restore - cold migration
+#######################################
+test_migration.py::TestIdleMigration
+test_migration.py::TestBusyMigrationWsim1
+test_migration.py::TestBusyMigrationIgtExecReset1
+test_migration.py::TestBusyMigrationIgtExecThreads1
+test_migration.py::TestBusyMigrationIgtComputePreempt
+test_migration.py::TestDoubleMigration1Resfix3
+test_migration.py::TestDoubleMigration2Resfix4
-- 
2.39.1

