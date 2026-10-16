Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41EACC6B38
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 17:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AA510E047;
	Fri, 16 Oct 2026 17:03:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E2D10E047
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 17:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792170128; x=1823706128;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eWo+LHfQd6oaOFJCIFGgBbosGlw/+gmdOBM1X7tJa2k=;
 b=S/vnDJzp+eZPoaQPEBPQyD29nvp8V/ZtTS7hBv4U0BI4HTFpl7+LwK/l
 72v1ZVV4Z0+A8pV1AzGBdJRetRrFO/FbW88iWGfPeJMWB4LFuCCRJIPXf
 kSiVPQXzfW5Ws0xZKmzT7sUJysu5eoQWsAVvq3m+aK8AQUc4i+xN+OpX8
 8W9l1wUs0IKTz7RHiOO6oj4Psv+QSzRw/X77zK41DOrCOTS5mJz0YetLJ
 SvTWypFmnjC0LylxTi3iRi/VbxHz6UUd0wBxKr4tBjcp9qiz0MN8vEjt1
 Rwim1TPnubgap/bUoZRQeAKh8yA5mbCpNXd1jJq7KAkWfIc+ZGmurEj7M g==;
X-CSE-ConnectionGUID: lbt90ljyRK6Hx20hR3K3hQ==
X-CSE-MsgGUID: OM0hc8EBSQaAk/NjJRuMmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="824561"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="824561"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 10:02:04 -0700
X-CSE-ConnectionGUID: HXCQlbOsTDSGa+fjMlEMQQ==
X-CSE-MsgGUID: uJHE0CbmQtCiNU5dUB3H9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2414844"
Received: from manusebx-mobl.ger.corp.intel.com (HELO [10.245.80.139])
 ([10.245.80.139])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 10:02:03 -0700
Message-ID: <359233ef-ce3a-4147-a408-0b107964fc0c@linux.intel.com>
Date: Fri, 16 Oct 2026 19:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tools/vmtb: Support parallel multi-VM busy
 migration
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20261015071037.10898-1-adam.miszczak@linux.intel.com>
 <20261015071037.10898-2-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261015071037.10898-2-adam.miszczak@linux.intel.com>
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
> Extend 'BaseTestBusyMigration' to support parallel VM save-restore:
> - determine 'migration_pairs' for concurrent multi-VM migrations
> - use two-phase async save/load operations to initiate migrations
>    on multiple VMs (based on test variants config) and then poll completion
> - execute IGT/WSIM workload on each source VM (with calibration done once)
> - perform single VM migration (same source and destination) for 1xVF/VM
> - leave one (center) VM unmigrated for odd VF/VM count configs
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/vmm_flows/test_migration.py | 171 ++++++++++++++++---------
>   1 file changed, 114 insertions(+), 57 deletions(-)
>
> diff --git a/tools/vmtb/vmm_flows/test_migration.py b/tools/vmtb/vmm_flows/test_migration.py
> index c13350fd2..6853d87f4 100644
> --- a/tools/vmtb/vmm_flows/test_migration.py
> +++ b/tools/vmtb/vmm_flows/test_migration.py
> @@ -160,6 +160,34 @@ class BaseTestBusyMigration:
>       # State save result flag: executing test_restore depends on prior test_save success
>       test_save_failed = True
>   
> +    @pytest.fixture(scope='class', name='set_migration_pairs')
> +    def fixture_set_migration_pairs(self, setup_vms):
> +        """Create migration pairs from edges to center: VM0->VM(N-1), VM1->VM(N-2), ... for NxVMs.
> +        For a single-VM setup use VM0->VM0, and for odd VM counts leave the center VM unmigrated.
> +        """
> +        ts: VmmTestingSetup = setup_vms
> +        num_vms = ts.get_num_vms()
> +
> +        if num_vms == 1:
> +            logger.info("Single VM migration: VM0->VM0 (save/restore on the same VM instance)")
> +            vm = ts.get_vm[0]
> +            return [(vm, vm)]
> +
> +        if num_vms % 2:
> +            logger.debug("Odd VM count: VM%s idle (not migrated)", ts.get_vm[num_vms // 2].vmnum)
> +
> +        migration_pairs: List[Tuple[VirtualMachine, VirtualMachine]] = []
> +        src_idx = 0
> +        dst_idx = num_vms - 1
> +        while src_idx < dst_idx:
> +            migration_pairs.append((ts.get_vm[src_idx], ts.get_vm[dst_idx]))
> +            src_idx += 1
> +            dst_idx -= 1
> +
> +        migration_pairs_str = ' / '.join([f'VM{src.vmnum}->VM{dst.vmnum}' for src, dst in migration_pairs])
> +        logger.info("Migration pair(s): %s", migration_pairs_str)
> +        return migration_pairs
> +
>       def __calibrate_igt_wl(self, vm: VirtualMachine, igt_wl: MigrationWorkloadIgt):
>           logger.info("Starting %s test loop calibration for migration workload", igt_wl.igt_test)
>           igt_exec =  IgtExecutor(vm, igt_wl.igt_test)
> @@ -175,9 +203,9 @@ class BaseTestBusyMigration:
>           logger.debug("Calibrated IGT workload loop: %s iteration(s) x ~%ss", igt_wl.num_repeats, igt_exec_time)
>   
>       @pytest.fixture(scope='class', name='run_source_workload')
> -    def fixture_run_source_workload(self, setup_vms, set_migration_wl):
> +    def fixture_run_source_workload(self, setup_vms, set_migration_wl, set_migration_pairs):
>           ts: VmmTestingSetup = setup_vms
> -        vm_src: VirtualMachine = ts.get_vm[0] # First VM as source
> +        source_vms = [vm_src for vm_src, _ in set_migration_pairs]
>           migration_wl = set_migration_wl # WSIM/IGT Workload variant
>   
>           if isinstance(migration_wl, MigrationWorkloadWsim):
> @@ -187,110 +215,139 @@ class BaseTestBusyMigration:
>                   raise exceptions.GemWsimError(f'gem_wsim workload file {wsim_file_path} not available!')
>   
>               # Run IGT wsim workload in pre-migration and check completion in post-migration
> -            return GemWsim(vm_src, migration_wl.num_clients, migration_wl.num_repeats, workload=wsim_file_path)
> +            return [GemWsim(vm_src, migration_wl.num_clients, migration_wl.num_repeats,
> +                            workload=wsim_file_path)
> +                    for vm_src in source_vms]
>   
>           if isinstance(migration_wl, MigrationWorkloadIgt):
> -            self.__calibrate_igt_wl(vm_src, migration_wl)
> -            return IgtExecutor(vm_src, migration_wl.igt_test, migration_wl.num_repeats)
> +            self.__calibrate_igt_wl(source_vms[0], migration_wl)
> +            return [IgtExecutor(vm_src, migration_wl.igt_test, migration_wl.num_repeats)
> +                    for vm_src in source_vms]
>   
>           logger.error("Invalid workload type passed to run_source_workload fixture")
>           raise exceptions.BenchError('Invalid workload type passed to run_source_workload fixture')
>   
> -    @pytest.fixture(scope='function', name='setup_destination_vm')
> -    def fixture_setup_destination_vm(self, setup_vms):
> -        ts: VmmTestingSetup = setup_vms
> -        vm_src: VirtualMachine = ts.get_vm[0]  # First VM as a source
> -        vm_dst: VirtualMachine = ts.get_vm[-1] # Last VM as a destination
> -        num_vms = ts.get_num_vms()
> +    @pytest.fixture(scope='function', name='setup_destination_vms')
> +    def fixture_setup_destination_vms(self, setup_vms, set_migration_pairs):
> +        migration_pairs = set_migration_pairs
>   
> -        if num_vms == 1:
> +        if len(migration_pairs) == 1 and migration_pairs[0][0] == migration_pairs[0][1]:
> +            vm_src, vm_dst = migration_pairs[0]
>               logger.debug("Single VM: the same source and destination VM instance")
>               assert vm_src == vm_dst
> -            return vm_dst
> +            return [vm_dst]
>   
> -        logger.debug("Multiple VMs: reload destination VM with the source image (with state snapshot)")
> +        logger.debug("Multiple VMs: reload destination VMs with matching source images (state snapshots)")
>   
> -        if vm_src.is_running():
> -            # QMP 'quit' is used for paused VM (cannot be powered off via guest-agent)
> -            vm_src.quit()
> +        destination_vms: List[VirtualMachine] = []
> +        for vm_src, vm_dst in migration_pairs:
> +            if vm_src.is_running():
> +                # QMP 'quit' is used for paused VM (cannot be powered off via guest-agent)
> +                vm_src.quit()
>   
> -        if vm_dst.is_running():
> -            vm_dst.quit()
> -            while vm_dst.is_running():
> -                time.sleep(1) # VM usually doesn't terminate immediately
> +            if vm_dst.is_running():
> +                vm_dst.quit()
> +                while vm_dst.is_running():
> +                    time.sleep(1) # VM usually doesn't terminate immediately
>   
> -        # Re-start destination VM with an image containing a state snapshot
> -        vm_dst.set_migration_source(vm_src.image)
> -        vm_dst.poweron()
> +            # Re-start destination VM with an image containing a state snapshot
> +            vm_dst.set_migration_source(vm_src.image)
> +            vm_dst.poweron()
> +            destination_vms.append(vm_dst)
>   
> -        return vm_dst
> +        return destination_vms
>   
> -    def test_save(self, setup_vms, run_source_workload):
> +    def test_save(self, setup_vms, run_source_workload, set_migration_pairs):
>           logger.info("Test VM busy migration: state save")
>           ts: VmmTestingSetup = setup_vms
> -        vm_src: VirtualMachine = ts.get_vm[0] # First VM as source
> +        source_vms = [vm_src for vm_src, _ in set_migration_pairs]
>   
>           logger.debug("Execute migration in-flight workload on source VM")
> -        migration_wl = run_source_workload
> +        migration_wls = run_source_workload
> +        assert len(migration_wls) == len(source_vms), 'Mismatch between source VMs and workloads'
>           time.sleep(IGT_INIT_DELAY)
> -        if not migration_wl.is_running():
> -            migration_wl.check_results()
> -            assert False, 'IGT/wsim migration workload is not running on source VM'
> +        for vm_num, migration_wl in enumerate(migration_wls):
> +            if not migration_wl.is_running():
> +                migration_wl.check_results()
> +                assert False, f'IGT/wsim migration workload is not running on source VM{vm_num}'
>   
>           # Pause VM and save snapshot
> -        logger.debug("Pause execution and save source VM state")
> +        logger.debug("Pause execution and save source VMs state")
>           try:
> -            vm_src.pause()
> -            vm_src.save_state()
> +            # Start all saves first, then poll completion independently
> +            for vm_src in source_vms:
> +                vm_src.pause()
> +                vm_src.save_state_init()
> +            for vm_src in source_vms:
> +                vm_src.save_state_check()
>           except exceptions.GuestError as exc:
>               logger.error("State save error: %s", exc)
>               assert False, 'VF migration failed on save'
>   
> -        logger.debug("Resume execution on source VM")
> -        vm_src.resume()
> +        logger.debug("Resume execution on source VMs")
> +        for vm_src in source_vms:
> +            vm_src.resume()
>   
> -        assert migration_wl.check_results(), 'VF migration workload failed on source VM (post-save)'
> +        for vm_num, migration_wl in enumerate(migration_wls):
> +            assert migration_wl.check_results(), f'VF migration workload failed on source VM{vm_num} (post-save)'
>   
>           if ts.get_num_vms() > 1:
> -            logger.debug("Multiple VMs: shutdown source VM")
> -            vm_src.poweroff()
> +            logger.debug("Multiple VMs: shutdown source VMs")
> +            for vm_src in source_vms:
> +                vm_src.poweroff()
>   
>           BaseTestBusyMigration.test_save_failed = False
>   
> -    def test_restore(self, setup_vms, setup_destination_vm, run_source_workload):
> +    def test_restore(self, setup_vms, setup_destination_vms, run_source_workload):
>           logger.info("Test VM busy migration: state restore")
>           if BaseTestBusyMigration.test_save_failed:
>               logger.error("State save failed - restore is pointless (fail immediately)")
>               assert False, 'test_save subtest failed - do not execute test_restore'
>   
>           ts: VmmTestingSetup = setup_vms
> -        vm_dst: VirtualMachine = setup_destination_vm
> -        migration_wl = run_source_workload # Get an instance of the IGT WL started in a save test
> +        destination_vms: List[VirtualMachine] = setup_destination_vms
> +        migration_wls = run_source_workload # Get instances of WLs started in a save test
> +        assert len(migration_wls) == len(destination_vms), 'Mismatch between destination VMs and workloads'
>   
> -        # Patch the source IgtExecutor/GemWsim instance with the current VM
> -        migration_wl.target = vm_dst
> -        migration_wl.clear_results()
> +        # Patch source IgtExecutor/GemWsim instances with destination VMs
> +        for migration_wl, vm_dst in zip(migration_wls, destination_vms):
> +            migration_wl.target = vm_dst
> +            migration_wl.clear_results()
>   
> -        # Load the source state snapshot
> -        logger.debug("Restore source state on the destination VM")
> -        vm_dst.load_state()
> -        vm_dst.resume()
> +        # Load source state snapshots
> +        logger.debug("Restore source states on destination VMs")
> +        try:
> +            for vm_dst in destination_vms:
> +                vm_dst.load_state_init()
> +            for vm_dst in destination_vms:
> +                vm_dst.load_state_check()
> +        except exceptions.GuestError as exc:
> +            logger.error("State load error: %s", exc)
> +            assert False, 'VF migration failed on load'
> +
> +        for vm_dst in destination_vms:
> +            vm_dst.resume()
>   
>           # TODO: add sync to VM class
> -        sync_value = random.randint(1, 0xFFFF)
> -        assert vm_dst.ga.sync(sync_value)['return'] == sync_value
> +        for vm_dst in destination_vms:
> +            sync_value = random.randint(1, 0xFFFF)
> +            assert vm_dst.ga.sync(sync_value)['return'] == sync_value
>   
> -        if not migration_wl.is_running():
> -            migration_wl.check_results()
> -            assert False, 'IGT/wsim migration workload is not running on destination VM'
> +        for vm_num, migration_wl in enumerate(migration_wls):
> +            if not migration_wl.is_running():
> +                migration_wl.check_results()
> +                assert False, f'IGT/wsim migration workload is not running on destination VM{vm_num}'
>   
>           time.sleep(IGT_RESTORE_DELAY)
>   
> -        assert migration_wl.check_results(), 'VF migration workload failed on destination VM (post-restore)'
> +        for vm_num, migration_wl in enumerate(migration_wls):
> +            assert migration_wl.check_results(), \
> +                f'VF migration workload failed on destination VM{vm_num} (post-restore)'
>   
> -        logger.debug("Check driver health on host and destination VM")
> +        logger.debug("Check driver health on host and destination VMs")
>           assert driver_check(ts.host)
> -        assert driver_check(vm_dst)
> +        for vm_dst in destination_vms:
> +            assert driver_check(vm_dst)
>   
>   
>   @pytest.fixture(scope='class', name='set_migration_wl')
