Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEA9CC6B34
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 07:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E997B10EB80;
	Thu, 15 Oct 2026 07:54:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CC810EB9A
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 07:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792050716; x=1823586716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wKkjIsDwIMjZNhsGYdg1+hegnTaCqzgYM1ReiGB2wm4=;
 b=bHTDaf77lM6wX0ku2LT4fR6bcISesnIKydVJQzIWb9HifCgjUdu7yP2j
 0SgkQ/NwVFDf/aGt0HxvlpCCAOqz43RuzRnHKt8th6P+nD1lEvFf52cgL
 D7S64CWs79WKLBvTObsX5h5P87BIZmDEwNK+Ll4zJwmBC5FLXMoRxLMCV
 TLBG2ThnMpgo3eeVYdb11eKvGF7/Bms5ELHTg6IOHjmFA+NaebDd0qWTm
 VyecMQxLvkrvewOeuOBLZClGuRH6GzR7GcZNyRDkL2yftYxbRuaubUHeB
 7v+Trf/VhHvtahsK/FNenl+10RW8Ja8Kgp/I3b+zBVtzbqI30WhNNO1L6 w==;
X-CSE-ConnectionGUID: R7cRRb94RY+FbwBH0qMmzw==
X-CSE-MsgGUID: S/lGThQDSnizLyLc+dhRXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="814006"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="814006"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:51:56 -0700
X-CSE-ConnectionGUID: VQXE0LZ0QVWL7AwllYbcXw==
X-CSE-MsgGUID: ICuo+Y+WQpyAeFZ8vilpsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="3389390"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:51:55 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 3/3] tools/vmtb: Reconfigure tests setup
Date: Thu, 15 Oct 2026 09:10:37 +0200
Message-Id: <20261015071037.10898-4-adam.miszczak@linux.intel.com>
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

Switch test config variants from vGPU profiles to auto resources
and scheduling provisioning (basic and migration tests).

Drop the 'full' migration config variant - all busy migration tests
by default run in the basic 1xVF and 2xVF scope.

Add dedicated TestBusyMigrationParallel class with 4xVF and 6xVF
config variants to validate parallel multi-VM migration:
- 4xVMs migration: VM0->VM3 and VM1->VM2
- 6xVMs migration: VM0->VM5, VM1->VM4 and VM2->VM3
Raise default max_vms in test_migration config helper (2 -> 24)
to allow running VMs on all enabled VFs.

Remove manual EQ/PT override in test_migration::test_2vm_pause_resume
(no longer needed since the driver provides finite defaults).

Reduce max VMs number (4 -> 2) for test_basic::TestVfDriverLoadRemove
to prevent host's memory depletion on systems with limited host RAM.

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/vmm_flows/test_basic.py     | 15 ++++----
 tools/vmtb/vmm_flows/test_migration.py | 51 ++++++++++++--------------
 2 files changed, 30 insertions(+), 36 deletions(-)

diff --git a/tools/vmtb/vmm_flows/test_basic.py b/tools/vmtb/vmm_flows/test_basic.py
index 597ebbb68..d7041c61f 100644
--- a/tools/vmtb/vmm_flows/test_basic.py
+++ b/tools/vmtb/vmm_flows/test_basic.py
@@ -41,8 +41,7 @@ def set_test_config(test_variants: List[Tuple[int, VfProvisioningMode, VfSchedul
     return test_configs
 
 
-test_variants_1 = [(1, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
-                   (2, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
+test_variants_1 = [(1, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO),
                    (2, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO)]
 
 @pytest.mark.parametrize('setup_vms', set_test_config(test_variants_1), ids=idfn_test_config, indirect=['setup_vms'])
@@ -63,9 +62,9 @@ class TestVmSetup:
             assert driver_check(vm)
 
 
-test_variants_2 = [(1, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
-                   (2, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
-                   (4, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE)]
+test_variants_2 = [(1, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO),
+                   (2, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO),
+                   (4, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO)]
 
 @pytest.mark.parametrize('setup_vms', set_test_config(test_variants_2), ids=idfn_test_config, indirect=['setup_vms'])
 class TestVmWorkload:
@@ -106,10 +105,10 @@ class TestVmWorkload:
         logger.info("Execute wsim parallel on VMs - results: %s", result)
 
 
-test_variants_3 = [(2, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
-                   (4, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE)]
+test_variants_3 = [(2, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO),
+                   (4, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO)]
 
-@pytest.mark.parametrize('setup_vms', set_test_config(test_variants=test_variants_3, max_vms=4, vf_driver_load=False),
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants=test_variants_3, max_vms=2, vf_driver_load=False),
                          ids = idfn_test_config, indirect=['setup_vms'])
 class TestVfDriverLoadRemove:
     """Verify VF (guest) driver load or remove doesn't affect execution on the other VM:
diff --git a/tools/vmtb/vmm_flows/test_migration.py b/tools/vmtb/vmm_flows/test_migration.py
index c4f3f00a4..273ff5768 100644
--- a/tools/vmtb/vmm_flows/test_migration.py
+++ b/tools/vmtb/vmm_flows/test_migration.py
@@ -30,17 +30,14 @@ IGT_RESTORE_DELAY = 3 # Time between VM resume and WL status check (post-restore
 MS_IN_SEC = 1000
 
 
-# Full configuration variant: 1xVF, 2xVF and MAXxVF with auto and vGPU profiles provisioning
-# TODO: add max VFs variants
-test_variants_full = [(1, VfProvisioningMode.AUTO, VfSchedulingMode.DEFAULT_PROFILE),
-                      (2, VfProvisioningMode.AUTO, VfSchedulingMode.DEFAULT_PROFILE),
-                      (1, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
-                      (2, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE)]
+# Basic configuration variant: 1xVF and 2xVF with auto provisioning
+test_variants_basic = [(1, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO),
+                       (2, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO)]
 
 
-# Basic configuration variant: 1xVF and 2xVF with auto provisioning
-test_variants_basic = [(1, VfProvisioningMode.AUTO, VfSchedulingMode.DEFAULT_PROFILE),
-                       (2, VfProvisioningMode.AUTO, VfSchedulingMode.DEFAULT_PROFILE)]
+# Parallel-migration configuration variant: 4xVF and 6xVF with auto provisioning
+test_variants_parallel = [(4, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO),
+                          (6, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO)]
 
 
 # vGPU profiles configuration variant: 1xVF and 2xVF with vGPU profiles provisioning
@@ -365,7 +362,7 @@ def idfn_workload(workload: MigrationWorkloadWsim):
 
 
 def set_test_config(test_variants: List[Tuple[int, VfProvisioningMode, VfSchedulingMode]],
-                    max_vms: int = 2, wa_reduce_vf_lmem: bool = False) -> List[VmmTestingConfig]:
+                    max_vms: int = 24, wa_reduce_vf_lmem: bool = False) -> List[VmmTestingConfig]:
     """Helper function to provide a parametrized test with a list of test configuration variants."""
     test_configs: List[VmmTestingConfig] = []
 
@@ -380,7 +377,8 @@ def set_test_config(test_variants: List[Tuple[int, VfProvisioningMode, VfSchedul
 # Busy migration TCs with WSIM workload
 @pytest.mark.parametrize('set_migration_wl', [wsim_short_preempt],
                          ids=idfn_workload, indirect=['set_migration_wl'])
-@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_full), ids=idfn_test_config, indirect=['setup_vms'])
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
+                         ids=idfn_test_config, indirect=['setup_vms'])
 class TestBusyMigrationWsim1(BaseTestBusyMigration):
     """Save-restore VM state with VF busy executing short (5ms) preemptable batches.
 
@@ -468,7 +466,7 @@ class TestBusyMigrationIgtExecReset2(BaseTestBusyMigration):
 
 @pytest.mark.parametrize('set_migration_wl', [igt_exec_reset_long_spin_many_preempt_threads],
                          ids=idfn_workload, indirect=['set_migration_wl'])
-@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_full),
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
                          ids=idfn_test_config, indirect=['setup_vms'])
 class TestBusyMigrationIgtExecReset3(BaseTestBusyMigration):
     """Save-restore VM state with VF busy executing IGT xe_exec_reset@long-spin-many-preempt-threads."""
@@ -508,7 +506,7 @@ class TestBusyMigrationIgtExecReset7(BaseTestBusyMigration):
 
 @pytest.mark.parametrize('set_migration_wl', [igt_exec_reset_long_spin_reuse_many_preempt_threads],
                          ids=idfn_workload, indirect=['set_migration_wl'])
-@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_full),
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
                          ids=idfn_test_config, indirect=['setup_vms'])
 class TestBusyMigrationIgtExecReset8(BaseTestBusyMigration):
     """Save-restore VM state with VF busy executing IGT xe_exec_reset@long-spin-reuse-many-preempt-threads."""
@@ -532,7 +530,7 @@ class TestBusyMigrationIgtExecReset10(BaseTestBusyMigration):
 
 @pytest.mark.parametrize('set_migration_wl', [igt_exec_reset_long_spin_sys_reuse_many_preempt_threads],
                          ids=idfn_workload, indirect=['set_migration_wl'])
-@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_full),
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
                          ids=idfn_test_config, indirect=['setup_vms'])
 class TestBusyMigrationIgtExecReset11(BaseTestBusyMigration):
     """Save-restore VM state with VF busy executing IGT xe_exec_reset@long-spin-sys-reuse-many-preempt-threads."""
@@ -540,7 +538,7 @@ class TestBusyMigrationIgtExecReset11(BaseTestBusyMigration):
 
 @pytest.mark.parametrize('set_migration_wl', [igt_exec_reset_long_spin_comp_reuse_many_preempt_threads],
                          ids=idfn_workload, indirect=['set_migration_wl'])
-@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_full),
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
                          ids=idfn_test_config, indirect=['setup_vms'])
 class TestBusyMigrationIgtExecReset12(BaseTestBusyMigration):
     """Save-restore VM state with VF busy executing IGT xe_exec_reset@long-spin-comp-reuse-many-preempt-threads."""
@@ -580,7 +578,7 @@ class TestBusyMigrationIgtExecReset16(BaseTestBusyMigration):
 
 @pytest.mark.parametrize('set_migration_wl', [igt_exec_threads_basic],
                          ids=idfn_workload, indirect=['set_migration_wl'])
-@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_full),
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
                          ids=idfn_test_config, indirect=['setup_vms'])
 class TestBusyMigrationIgtExecThreads1(BaseTestBusyMigration):
     """Save-restore VM state with VF busy executing IGT xe_exec_threads@threads-basic."""
@@ -604,7 +602,7 @@ class TestBusyMigrationIgtExecThreads3(BaseTestBusyMigration):
 
 @pytest.mark.parametrize('set_migration_wl', [igt_exec_threads_many_queues],
                         ids=idfn_workload, indirect=['set_migration_wl'])
-@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_full),
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
                          ids=idfn_test_config, indirect=['setup_vms'])
 class TestBusyMigrationIgtExecThreads4(BaseTestBusyMigration):
     """Save-restore VM state with VF busy executing IGT xe_exec_threads@threads-many-queues."""
@@ -634,6 +632,14 @@ class TestBusyMigrationIgtComputePreempt(BaseTestBusyMigration):
     """Save-restore VM state with VF busy executing IGT xe_compute_preempt@compute-preempt-many (CCS path)."""
 
 
+@pytest.mark.parametrize('set_migration_wl', [igt_exec_threads_many_queues],
+                        ids=idfn_workload, indirect=['set_migration_wl'])
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_parallel),
+                         ids=idfn_test_config, indirect=['setup_vms'])
+class TestBusyMigrationParallel(BaseTestBusyMigration):
+    """Save-restore multiple VMs state in parallel with VF busy executing IGT xe_exec_threads@threads-many-queues."""
+
+
 @pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
                          ids=idfn_test_config, indirect=['setup_vms'])
 class TestIdleMigration:
@@ -1175,8 +1181,6 @@ def test_2vm_pause_resume(create_1host_2vm):
     vm1.assign_vf(vf2)
     ts.poweron_vms()
 
-    pause_vf_num = 1
-
     assert modprobe_driver_run_check(vm0)
     assert modprobe_driver_run_check(vm1)
 
@@ -1194,11 +1198,6 @@ def test_2vm_pause_resume(create_1host_2vm):
     logger.debug("Submit IGT WL (gem_spin_batch) on VM1")
     igt_vm1 = IgtExecutor(vm1, IgtType.SPIN_BATCH)
 
-    # Special handling of pausing VMs with infinite ExecQuanta - refer to SAS for details
-    logger.debug("Set VF1 EQ/PF before the pause")
-    ts.get_dut().driver.set_exec_quantum_ms(pause_vf_num, 1)
-    ts.get_dut().driver.set_preempt_timeout_us(pause_vf_num, 100)
-
     logger.debug("Pause execution on VM0/VF1")
     vm0.pause()
 
@@ -1208,10 +1207,6 @@ def test_2vm_pause_resume(create_1host_2vm):
     logger.debug("Resume execution on VM0/VF1")
     vm0.resume()
 
-    logger.debug("Reset VF1 EQ/PF to the initial values (infinite) after resume")
-    ts.get_dut().driver.set_exec_quantum_ms(pause_vf_num, 0)
-    ts.get_dut().driver.set_preempt_timeout_us(pause_vf_num, 0)
-
     result_vm0 = gem_wsim_vm0.wait_results() # Throws exception on wsim fail
     assert expected_elapsed_sec * 0.8 < result_vm0.elapsed_sec < expected_elapsed_sec * 1.5
     logger.debug("VM0 IGT WL (paused-resumed) finished successfully")
-- 
2.39.1

