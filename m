Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD51FCC6B2F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 07:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5966411212C;
	Thu, 15 Oct 2026 07:54:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39FC10EB80
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 07:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792050713; x=1823586713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1DL5tfxUJmR5O+lF15Tt5QjyPf6Ua6a8O0/6AEXvHrQ=;
 b=iH9ctpSud6AQnM/KLphpsXSwZANPrZEm5wAFszqopOZ+C8fKd6r7yNxo
 iwMNnLRVPu0w4/k7/md7zLwN2NbV6Un9RTOIcNgr4IVHMHduVdN69BXAm
 nZLekLJ+yfGhNVQam5sXYZpCboWVClmE4W49RxHFlaA3D7AT2NWSaT+s8
 yXfcvstMDxNSJPJX0h97dLsjALYj7Z7Jte6ocSSapfvdkkg6pONTe2zZU
 pMpQEDprQI85rkhj1+0pp9fHxGSijcAkI2zXYNnvqcWtWXcgqqyM1LJX+
 jIkx8dhTd9DFSvyt8/IPSqj1wKWdJ9E17WF+FcNkR/gNqgLtu05DWc4ew g==;
X-CSE-ConnectionGUID: 3DrLvZWAT4SwRw32Tgzjnw==
X-CSE-MsgGUID: FxZEztMwSWmcetDQ7HcRsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="799987"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="799987"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:51:53 -0700
X-CSE-ConnectionGUID: ePWA9cLuTRCQqjF2ObPnoQ==
X-CSE-MsgGUID: Hy0Ba2fJTaCtwwJ8a+u70A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1716891"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:51:51 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 2/3] tools/vmtb: Skip double migration tests on no-debug
 config
Date: Thu, 15 Oct 2026 09:10:36 +0200
Message-Id: <20261015071037.10898-3-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20261015071037.10898-1-adam.miszczak@linux.intel.com>
References: <20261015071037.10898-1-adam.miszczak@linux.intel.com>
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

Double migration tests depend on the debugfs 'resfix_stoppers' hook,
which is only exposed in a KMD debug build.
Add autoused 'is_test_supported' fixture to BaseTestDoubleMigration
that probes for the hook and skips test execution when it's absent
on a guest (first VM).

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/vmm_flows/test_migration.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/vmtb/vmm_flows/test_migration.py b/tools/vmtb/vmm_flows/test_migration.py
index 6853d87f4..c4f3f00a4 100644
--- a/tools/vmtb/vmm_flows/test_migration.py
+++ b/tools/vmtb/vmm_flows/test_migration.py
@@ -785,6 +785,19 @@ class BaseTestDoubleMigration:
     - restoring from initial (1st) or latter (2nd) migration
     """
 
+    @pytest.fixture(scope='class', autouse=True, name='is_test_supported')
+    def fixture_is_test_supported(self, setup_vms):
+        """Skip test on no-debug setup lacking the required debugfs 'resfix_stoppers' hook."""
+        ts: VmmTestingSetup = setup_vms
+        vm: VirtualMachine = ts.get_vm[0]
+        vm_debugfs_path = vm.get_dut().driver.debugfs_path
+
+        try:
+            vm.read_file_content(f'{vm_debugfs_path}/gt0/vf/resfix_stoppers')
+        except exceptions.GuestError:
+            logger.warning("Required debug hook not found (KMD no-debug config?)")
+            pytest.skip("Test scenario not supported on no-debug config")
+
     def __set_debugfs_resfix_stoppers(self, vm: VirtualMachine, stage: ResfixWaitStage):
         """Set resfix_stoppers:
         predefined checkpoints that allow the migration process to pause at specific stages.
-- 
2.39.1

