Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25825CCA46C
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 17:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B4C10E151;
	Fri, 16 Oct 2026 17:04:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C450510E047
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 17:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792170161; x=1823706161;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FsuMdD/QSCRndK9cm9bpGwzFOTQsT8cz/fbEI+156Og=;
 b=MaSz2RkEB4DZYHG83THqbXe6PzdrEgaHRCRXD0xtnffGsoKTXcyojV7d
 F39Uqi3MkWjOj7qekdl73t5+sTxKf026PbGM3d7PeXO+6pvMyHcn4WA7A
 Vr82x0rNblqG6jNzf4BNck7ugQdgwZd/dNXkm1iLqXc3iKGeUZNEOl+mu
 qihb5BrwafEh64aTsN+zar8hhfAgN6to94jetaLTqj9fkKnvRUgXZhIOk
 QcZebD4pjJq8CxD2GijG9F70nTdhoy5ORud+HaiIDezFuJWSCbE9JiS7O
 UEayXcRWf9IU5JyVomhCQt1trepyZA3dw+FS0REpt5QCr2wXip6H7k0rb g==;
X-CSE-ConnectionGUID: 1oOnMA7jRiSNv0CMxJl7Zg==
X-CSE-MsgGUID: erqC9l/OTA+Ot+lHCA4FZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="824669"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="824669"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 10:02:41 -0700
X-CSE-ConnectionGUID: DTXria7jTHOGDuEwd2g11Q==
X-CSE-MsgGUID: CgfHmyHwQAOl/87rYxj3nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2415082"
Received: from manusebx-mobl.ger.corp.intel.com (HELO [10.245.80.139])
 ([10.245.80.139])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 10:02:40 -0700
Message-ID: <2c57bd4d-1cb5-433a-92c1-347ea6106941@linux.intel.com>
Date: Fri, 16 Oct 2026 19:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tools/vmtb: Reconfigure tests setup
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20261015071037.10898-1-adam.miszczak@linux.intel.com>
 <20261015071037.10898-4-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261015071037.10898-4-adam.miszczak@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

On 10/15/2026 9:10 AM, Adam Miszczak wrote:
> Switch test config variants from vGPU profiles to auto resources
> and scheduling provisioning (basic and migration tests).
>
> Drop the 'full' migration config variant - all busy migration tests
> by default run in the basic 1xVF and 2xVF scope.
>
> Add dedicated TestBusyMigrationParallel class with 4xVF and 6xVF
> config variants to validate parallel multi-VM migration:
> - 4xVMs migration: VM0->VM3 and VM1->VM2
> - 6xVMs migration: VM0->VM5, VM1->VM4 and VM2->VM3
> Raise default max_vms in test_migration config helper (2 -> 24)
> to allow running VMs on all enabled VFs.
>
> Remove manual EQ/PT override in test_migration::test_2vm_pause_resume
> (no longer needed since the driver provides finite defaults).
>
> Reduce max VMs number (4 -> 2) for test_basic::TestVfDriverLoadRemove
> to prevent host's memory depletion on systems with limited host RAM.
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/vmm_flows/test_basic.py     | 15 ++++----
>   tools/vmtb/vmm_flows/test_migration.py | 51 ++++++++++++--------------
>   2 files changed, 30 insertions(+), 36 deletions(-)
>
> diff --git a/tools/vmtb/vmm_flows/test_basic.py b/tools/vmtb/vmm_flows/test_basic.py
> index 597ebbb68..d7041c61f 100644
> --- a/tools/vmtb/vmm_flows/test_basic.py
> +++ b/tools/vmtb/vmm_flows/test_basic.py
> @@ -41,8 +41,7 @@ def set_test_config(test_variants: List[Tuple[int, VfProvisioningMode, VfSchedul
>       return test_configs
>   
>   
> -test_variants_1 = [(1, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
> -                   (2, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
> +test_variants_1 = [(1, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO),
>                      (2, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO)]
>   
>   @pytest.mark.parametrize('setup_vms', set_test_config(test_variants_1), ids=idfn_test_config, indirect=['setup_vms'])
> @@ -63,9 +62,9 @@ class TestVmSetup:
>               assert driver_check(vm)
>   
>   
> -test_variants_2 = [(1, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
> -                   (2, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
> -                   (4, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE)]
> +test_variants_2 = [(1, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO),
> +                   (2, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO),
> +                   (4, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO)]
>   
>   @pytest.mark.parametrize('setup_vms', set_test_config(test_variants_2), ids=idfn_test_config, indirect=['setup_vms'])
>   class TestVmWorkload:
> @@ -106,10 +105,10 @@ class TestVmWorkload:
>           logger.info("Execute wsim parallel on VMs - results: %s", result)
>   
>   
> -test_variants_3 = [(2, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
> -                   (4, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE)]
> +test_variants_3 = [(2, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO),
> +                   (4, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO)]
>   
> -@pytest.mark.parametrize('setup_vms', set_test_config(test_variants=test_variants_3, max_vms=4, vf_driver_load=False),
> +@pytest.mark.parametrize('setup_vms', set_test_config(test_variants=test_variants_3, max_vms=2, vf_driver_load=False),
>                            ids = idfn_test_config, indirect=['setup_vms'])
>   class TestVfDriverLoadRemove:
>       """Verify VF (guest) driver load or remove doesn't affect execution on the other VM:
> diff --git a/tools/vmtb/vmm_flows/test_migration.py b/tools/vmtb/vmm_flows/test_migration.py
> index c4f3f00a4..273ff5768 100644
> --- a/tools/vmtb/vmm_flows/test_migration.py
> +++ b/tools/vmtb/vmm_flows/test_migration.py
> @@ -30,17 +30,14 @@ IGT_RESTORE_DELAY = 3 # Time between VM resume and WL status check (post-restore
>   MS_IN_SEC = 1000
>   
>   
> -# Full configuration variant: 1xVF, 2xVF and MAXxVF with auto and vGPU profiles provisioning
> -# TODO: add max VFs variants
> -test_variants_full = [(1, VfProvisioningMode.AUTO, VfSchedulingMode.DEFAULT_PROFILE),
> -                      (2, VfProvisioningMode.AUTO, VfSchedulingMode.DEFAULT_PROFILE),
> -                      (1, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
> -                      (2, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE)]
> +# Basic configuration variant: 1xVF and 2xVF with auto provisioning
> +test_variants_basic = [(1, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO),
> +                       (2, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO)]
>   
>   
> -# Basic configuration variant: 1xVF and 2xVF with auto provisioning
> -test_variants_basic = [(1, VfProvisioningMode.AUTO, VfSchedulingMode.DEFAULT_PROFILE),
> -                       (2, VfProvisioningMode.AUTO, VfSchedulingMode.DEFAULT_PROFILE)]
> +# Parallel-migration configuration variant: 4xVF and 6xVF with auto provisioning
> +test_variants_parallel = [(4, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO),
> +                          (6, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO)]
>   
>   
>   # vGPU profiles configuration variant: 1xVF and 2xVF with vGPU profiles provisioning
> @@ -365,7 +362,7 @@ def idfn_workload(workload: MigrationWorkloadWsim):
>   
>   
>   def set_test_config(test_variants: List[Tuple[int, VfProvisioningMode, VfSchedulingMode]],
> -                    max_vms: int = 2, wa_reduce_vf_lmem: bool = False) -> List[VmmTestingConfig]:
> +                    max_vms: int = 24, wa_reduce_vf_lmem: bool = False) -> List[VmmTestingConfig]:
>       """Helper function to provide a parametrized test with a list of test configuration variants."""
>       test_configs: List[VmmTestingConfig] = []
>   
> @@ -380,7 +377,8 @@ def set_test_config(test_variants: List[Tuple[int, VfProvisioningMode, VfSchedul
>   # Busy migration TCs with WSIM workload
>   @pytest.mark.parametrize('set_migration_wl', [wsim_short_preempt],
>                            ids=idfn_workload, indirect=['set_migration_wl'])
> -@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_full), ids=idfn_test_config, indirect=['setup_vms'])
> +@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
> +                         ids=idfn_test_config, indirect=['setup_vms'])
>   class TestBusyMigrationWsim1(BaseTestBusyMigration):
>       """Save-restore VM state with VF busy executing short (5ms) preemptable batches.
>   
> @@ -468,7 +466,7 @@ class TestBusyMigrationIgtExecReset2(BaseTestBusyMigration):
>   
>   @pytest.mark.parametrize('set_migration_wl', [igt_exec_reset_long_spin_many_preempt_threads],
>                            ids=idfn_workload, indirect=['set_migration_wl'])
> -@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_full),
> +@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
>                            ids=idfn_test_config, indirect=['setup_vms'])
>   class TestBusyMigrationIgtExecReset3(BaseTestBusyMigration):
>       """Save-restore VM state with VF busy executing IGT xe_exec_reset@long-spin-many-preempt-threads."""
> @@ -508,7 +506,7 @@ class TestBusyMigrationIgtExecReset7(BaseTestBusyMigration):
>   
>   @pytest.mark.parametrize('set_migration_wl', [igt_exec_reset_long_spin_reuse_many_preempt_threads],
>                            ids=idfn_workload, indirect=['set_migration_wl'])
> -@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_full),
> +@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
>                            ids=idfn_test_config, indirect=['setup_vms'])
>   class TestBusyMigrationIgtExecReset8(BaseTestBusyMigration):
>       """Save-restore VM state with VF busy executing IGT xe_exec_reset@long-spin-reuse-many-preempt-threads."""
> @@ -532,7 +530,7 @@ class TestBusyMigrationIgtExecReset10(BaseTestBusyMigration):
>   
>   @pytest.mark.parametrize('set_migration_wl', [igt_exec_reset_long_spin_sys_reuse_many_preempt_threads],
>                            ids=idfn_workload, indirect=['set_migration_wl'])
> -@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_full),
> +@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
>                            ids=idfn_test_config, indirect=['setup_vms'])
>   class TestBusyMigrationIgtExecReset11(BaseTestBusyMigration):
>       """Save-restore VM state with VF busy executing IGT xe_exec_reset@long-spin-sys-reuse-many-preempt-threads."""
> @@ -540,7 +538,7 @@ class TestBusyMigrationIgtExecReset11(BaseTestBusyMigration):
>   
>   @pytest.mark.parametrize('set_migration_wl', [igt_exec_reset_long_spin_comp_reuse_many_preempt_threads],
>                            ids=idfn_workload, indirect=['set_migration_wl'])
> -@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_full),
> +@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
>                            ids=idfn_test_config, indirect=['setup_vms'])
>   class TestBusyMigrationIgtExecReset12(BaseTestBusyMigration):
>       """Save-restore VM state with VF busy executing IGT xe_exec_reset@long-spin-comp-reuse-many-preempt-threads."""
> @@ -580,7 +578,7 @@ class TestBusyMigrationIgtExecReset16(BaseTestBusyMigration):
>   
>   @pytest.mark.parametrize('set_migration_wl', [igt_exec_threads_basic],
>                            ids=idfn_workload, indirect=['set_migration_wl'])
> -@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_full),
> +@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
>                            ids=idfn_test_config, indirect=['setup_vms'])
>   class TestBusyMigrationIgtExecThreads1(BaseTestBusyMigration):
>       """Save-restore VM state with VF busy executing IGT xe_exec_threads@threads-basic."""
> @@ -604,7 +602,7 @@ class TestBusyMigrationIgtExecThreads3(BaseTestBusyMigration):
>   
>   @pytest.mark.parametrize('set_migration_wl', [igt_exec_threads_many_queues],
>                           ids=idfn_workload, indirect=['set_migration_wl'])
> -@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_full),
> +@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
>                            ids=idfn_test_config, indirect=['setup_vms'])
>   class TestBusyMigrationIgtExecThreads4(BaseTestBusyMigration):
>       """Save-restore VM state with VF busy executing IGT xe_exec_threads@threads-many-queues."""
> @@ -634,6 +632,14 @@ class TestBusyMigrationIgtComputePreempt(BaseTestBusyMigration):
>       """Save-restore VM state with VF busy executing IGT xe_compute_preempt@compute-preempt-many (CCS path)."""
>   
>   
> +@pytest.mark.parametrize('set_migration_wl', [igt_exec_threads_many_queues],
> +                        ids=idfn_workload, indirect=['set_migration_wl'])
> +@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_parallel),
> +                         ids=idfn_test_config, indirect=['setup_vms'])
> +class TestBusyMigrationParallel(BaseTestBusyMigration):
> +    """Save-restore multiple VMs state in parallel with VF busy executing IGT xe_exec_threads@threads-many-queues."""
> +
> +
>   @pytest.mark.parametrize('setup_vms', set_test_config(test_variants_basic),
>                            ids=idfn_test_config, indirect=['setup_vms'])
>   class TestIdleMigration:
> @@ -1175,8 +1181,6 @@ def test_2vm_pause_resume(create_1host_2vm):
>       vm1.assign_vf(vf2)
>       ts.poweron_vms()
>   
> -    pause_vf_num = 1
> -
>       assert modprobe_driver_run_check(vm0)
>       assert modprobe_driver_run_check(vm1)
>   
> @@ -1194,11 +1198,6 @@ def test_2vm_pause_resume(create_1host_2vm):
>       logger.debug("Submit IGT WL (gem_spin_batch) on VM1")
>       igt_vm1 = IgtExecutor(vm1, IgtType.SPIN_BATCH)
>   
> -    # Special handling of pausing VMs with infinite ExecQuanta - refer to SAS for details
> -    logger.debug("Set VF1 EQ/PF before the pause")
> -    ts.get_dut().driver.set_exec_quantum_ms(pause_vf_num, 1)
> -    ts.get_dut().driver.set_preempt_timeout_us(pause_vf_num, 100)
> -
>       logger.debug("Pause execution on VM0/VF1")
>       vm0.pause()
>   
> @@ -1208,10 +1207,6 @@ def test_2vm_pause_resume(create_1host_2vm):
>       logger.debug("Resume execution on VM0/VF1")
>       vm0.resume()
>   
> -    logger.debug("Reset VF1 EQ/PF to the initial values (infinite) after resume")
> -    ts.get_dut().driver.set_exec_quantum_ms(pause_vf_num, 0)
> -    ts.get_dut().driver.set_preempt_timeout_us(pause_vf_num, 0)
> -
>       result_vm0 = gem_wsim_vm0.wait_results() # Throws exception on wsim fail
>       assert expected_elapsed_sec * 0.8 < result_vm0.elapsed_sec < expected_elapsed_sec * 1.5
>       logger.debug("VM0 IGT WL (paused-resumed) finished successfully")
