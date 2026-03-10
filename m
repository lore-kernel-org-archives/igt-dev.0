Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05BBEB1049
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574C910E235;
	Tue, 10 Mar 2026 10:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDGQgp3p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA40310E232
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773138992; x=1804674992;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=svkFADc4f2JWPomRx9z7KSzTGiBN/pmIC0EkGKRNt/Y=;
 b=YDGQgp3pAMkJt9U4ogWSALkoGN7sbmHph413yNjimS5Ur59Mf1BCWvcS
 S7FX5Ifr0ACasGtBS4JLWnWeFUDUKeRvTjVi47FflMCVyInVUy2+nE6cP
 qxmXSmDKNQqxdXRi+IUwQkUnq7IplNUSWZW0SBFwcFfmRGvCKxsHgevBN
 YRyLJWXe1Wi0rjEeNwQLkna/uA+x0Nz2PjqLOzmMDxZoydoMNp9S5BO+n
 46dhh2usPXE9FodkOslSyGT8SJ0LH/+fUDmGambyziTaVOI9EzFx/l+pD
 DNNAb0Y+f8AJCDfbrlm5CpEzbGWLk4ApsMJq06MBdrxl9b3nIu0+CiKa2 w==;
X-CSE-ConnectionGUID: I332euieQz+yYR7lfme6bA==
X-CSE-MsgGUID: VRYsnV2dQ3+HG6wn/yyeoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74058234"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74058234"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:36:32 -0700
X-CSE-ConnectionGUID: Wn/C0EGfSkmAqTSe+SyaUw==
X-CSE-MsgGUID: +2y4n8NRTlKrk4eS662OxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="220025512"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.135])
 ([172.28.180.135])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:36:30 -0700
Message-ID: <a084c2e6-adf6-4282-bc95-d31b77877a71@linux.intel.com>
Date: Tue, 10 Mar 2026 11:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 04/10] tools/vmtb: Extend IGT and WSIM abstractions
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
 <20260224075027.2409675-5-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260224075027.2409675-5-adam.miszczak@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 2/24/2026 8:50 AM, Adam Miszczak wrote:
> Introduce few improvements to IGT and gem_wsim executors:
>
> 1. Add gem_wsim workload descriptor resources config
> In order to place workload files in a common resources directory,
> extend VMTB config with a relevant entry and read the path in a conftest.
>
> Implement capability for device specific workload files in wsim resources
> directory (as different GPU devices may have various sets of engines).
> Wsim device specific path format looks as follows:
> [vmtb_root_path]/vmm_flows/resources/wsim/[device_name_abbr]/[wl_desc].wsim
> e.g.:
> - resources/wsim/ptl/wl.wsim
> - resources/wsim/bmg/wl.wsim
>
> 2. Support gem_wsim workload files on VM
> So far GemWsim was initialized with a simple string workload descriptor
> passed with '-w <workload>' option.
> However, multiple complex workloads are expected for a busy VF migration
> scenarios - therefore it would be handy to define it as workload files.
> Gem_wsim input files will be deployed as VMTB resources on a host,
> whereas we want to execute it on VM as well.
> Hence, content of the wsim workload file is copied to /tmp on a guest/host
> and executed from that location.
> In case of the host, original (resources) location will work
> as a wsim file input, however temp file is still used for simplicity
> and consistency (to avoid instance type checks).
>
> 3. Add IGT and WSIM results check function
> Extend IgtExecutor and GemWsim with new check_results() method to allow
> object-oriented approach for checking IGT/WSIM results and unify interfaces.
> Existing helper - igt_check(IgtExecutor) is still supported,
> but IgtExecutor.check_results() is now preferred.
> Also, implement IgtExecutor's is_running() (similarly to GemWsim)
> and keep the process state (ProcessResult).
>
> Introduced change simplifies supporting both IGT and gem_wsim workloads
> in busy migration tests.
>
> 4. Support IGT tests repeated execution
> Few planned VF busy migration scenarios require executing short IGT tests
> in a longer time slot (in a loop).
> To achieve it, allow IgtExecutor to accept expected number of IGT test
> repeats and reflect it in a testlist passed to the igt_runner
> (multiply requested test entries).
>
> By default, IgtExecutor's 'num_repeats' input parameter is set to 1,
> so in the usual case (single IGT execution) it doesn't need to be
> explicitly provided.
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/bench/configurators/vmtb_config.py |  4 +-
>   tools/vmtb/bench/executors/gem_wsim.py        | 45 +++++++++++++++----
>   tools/vmtb/bench/executors/igt.py             | 36 ++++++++++++---
>   tools/vmtb/bench/machines/physical/device.py  |  2 +-
>   tools/vmtb/vmm_flows/conftest.py              |  8 +++-
>   tools/vmtb/vmtb_config.json                   |  1 +
>   6 files changed, 78 insertions(+), 18 deletions(-)
>
> diff --git a/tools/vmtb/bench/configurators/vmtb_config.py b/tools/vmtb/bench/configurators/vmtb_config.py
> index 49dde4589..8fd2b87d5 100644
> --- a/tools/vmtb/bench/configurators/vmtb_config.py
> +++ b/tools/vmtb/bench/configurators/vmtb_config.py
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: MIT
> -# Copyright © 2024 Intel Corporation
> +# Copyright © 2024-2026 Intel Corporation
>   
>   import json
>   import logging
> @@ -40,6 +40,7 @@ class VmtbConfig:
>       host_config: VmtbHostConfig
>       guest_config: VmtbGuestConfig
>       vgpu_profiles_path: str
> +    wsim_wl_path: str
>       guc_ver_path: str
>       ci_host_dmesg_file: str
>   
> @@ -104,6 +105,7 @@ class VmtbConfigJsonReader:
>               host_config=vmtb_host_config,
>               guest_config=vmtb_guest_config,
>               vgpu_profiles_path=config_json['resources']['vgpu_profiles_path'],
> +            wsim_wl_path=config_json['resources']['wsim_wl_path'],
>               guc_ver_path=config_json['resources']['guc_ver_path'],
>               ci_host_dmesg_file=config_json['ci']['host_dmesg_file'])
>   
> diff --git a/tools/vmtb/bench/executors/gem_wsim.py b/tools/vmtb/bench/executors/gem_wsim.py
> index 46fa2291c..0cdfcc7e4 100644
> --- a/tools/vmtb/bench/executors/gem_wsim.py
> +++ b/tools/vmtb/bench/executors/gem_wsim.py
> @@ -1,9 +1,10 @@
>   # SPDX-License-Identifier: MIT
> -# Copyright © 2024 Intel Corporation
> +# Copyright © 2024-2026 Intel Corporation
>   
>   import logging
>   import re
>   import typing
> +from pathlib import Path
>   
>   from bench import exceptions
>   from bench.executors.shell import ShellExecutor
> @@ -23,13 +24,28 @@ PREEMPT_10MS_WORKLOAD = (f'1.DEFAULT.{int(ONE_CYCLE_DURATION_MS * 1000 / 2)}.0.0
>   NON_PREEMPT_10MS_WORKLOAD = f'X.1.0,X.2.0,{PREEMPT_10MS_WORKLOAD}'
>   
>   class GemWsim(ShellExecutor):
> -    def __init__(self, machine: MachineInterface, num_clients: int = 1, num_repeats: int = 1,
> -                 workload: str = PREEMPT_10MS_WORKLOAD, timeout: int = DEFAULT_TIMEOUT) -> None:
> -        super().__init__(
> -            machine,
> -            f'/usr/local/libexec/igt-gpu-tools/benchmarks/gem_wsim -w {workload} -c {num_clients} -r {num_repeats}',
> -            timeout)
> -        self.machine_id = str(machine)
> +    def __init__(self, target: MachineInterface,
> +                 num_clients: int = 1,
> +                 num_repeats: int = 1,
> +                 workload: str = PREEMPT_10MS_WORKLOAD,
> +                 timeout: int = DEFAULT_TIMEOUT) -> None:
> +
> +        self.machine_id = str(target)
> +        wl_file_path = Path(workload)
> +
> +        if wl_file_path.is_file():
> +            # Copy workload descriptor from the source host file
> +            # to the requested target machine (VM or host)
> +            workload = '/tmp/igt_workload.wsim'
> +            wl_desc = wl_file_path.read_text(encoding='utf-8')
> +            target.write_file_content(workload, wl_desc)
> +
> +            logger.debug("IGT/wsim workload descriptor:\n%s", wl_desc)
> +
> +        wsim_path = Path(target.get_igt_config().test_dir) / 'benchmarks' / 'gem_wsim'
> +        command = f'{wsim_path} -w {workload} -c {num_clients} -r {num_repeats}'
> +
> +        super().__init__(target, command, timeout)
>   
>       def __str__(self) -> str:
>           return f'gem_wsim({self.machine_id}:{self.pid})'
> @@ -49,6 +65,19 @@ class GemWsim(ShellExecutor):
>           raise exceptions.GemWsimError(f'{self}: exit_code: {proc_result.exit_code}'
>                                         f' stdout: {proc_result.stdout} stderr: {proc_result.stderr}')
>   
> +    def check_results(self) -> bool:
> +        """Verify gem_wsim execution results. Return True for workload success, False on fail."""
> +        # TODO: support also checking wsim workload: 'Verify Xe spinner batch completion'
> +        try:
> +            wl_results: GemWsimResult = self.wait_results()
> +        except exceptions.GemWsimError as exc:
> +            logger.error("[%s] WSIM failed: %s", self.target, exc)
> +            return False
> +
> +        logger.debug("[%s] WSIM passed in %ss (%s WL/s)",
> +                      self.target, wl_results.elapsed_sec, wl_results.workloads_per_sec)
> +        return True
> +
>   
>   def gem_wsim_parallel_exec_and_check(vms: typing.List[MachineInterface], workload: str, iterations: int,
>                                        expected: typing.Optional[GemWsimResult] = None) -> GemWsimResult:
> diff --git a/tools/vmtb/bench/executors/igt.py b/tools/vmtb/bench/executors/igt.py
> index 4296464c2..a08f71d54 100644
> --- a/tools/vmtb/bench/executors/igt.py
> +++ b/tools/vmtb/bench/executors/igt.py
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: MIT
> -# Copyright © 2024 Intel Corporation
> +# Copyright © 2024-2026 Intel Corporation
>   
>   import enum
>   import json
> @@ -34,6 +34,7 @@ igt_tests: typing.Dict[IgtType, typing.Tuple[str, str]] = {
>   class IgtExecutor(ExecutorInterface):
>       def __init__(self, target: MachineInterface,
>                    test: typing.Union[str, IgtType],
> +                 num_repeats: int = 1,
>                    timeout: int = DEFAULT_TIMEOUT) -> None:
>           self.igt_config = target.get_igt_config()
>   
> @@ -46,18 +47,25 @@ class IgtExecutor(ExecutorInterface):
>           self.results: typing.Dict[str, typing.Any] = {}
>           self.target: MachineInterface = target
>           self.igt: str = test if isinstance(test, str) else self.select_igt_variant(target.get_drm_driver_name(), test)
> -        self.target.write_file_content(testlist, self.igt)
> -        self.timeout: int = timeout
>   
>           logger.info("[%s] Execute IGT test: %s", target, self.igt)
> +        if num_repeats > 1:
> +            logger.debug("Repeat IGT execution %s times", num_repeats)
> +            self.igt = (self.igt + '\n') * num_repeats
> +
> +        self.target.write_file_content(testlist, self.igt)
> +        self.timeout: int = timeout
> +        self.proc_result = ProcessResult()
>           self.pid: int = self.target.execute(command)
>   
>       # Executor interface implementation
>       def status(self) -> ProcessResult:
> -        return self.target.execute_status(self.pid)
> +        self.proc_result = self.target.execute_status(self.pid)
> +        return self.proc_result
>   
>       def wait(self) -> ProcessResult:
> -        return self.target.execute_wait(self.pid, self.timeout)
> +        self.proc_result = self.target.execute_wait(self.pid, self.timeout)
> +        return self.proc_result
>   
>       def sendsig(self, sig: signal.Signals) -> None:
>           self.target.execute_signal(self.pid, sig)
> @@ -69,9 +77,25 @@ class IgtExecutor(ExecutorInterface):
>           self.sendsig(signal.SIGKILL)
>   
>       # IGT specific methods
> +    def is_running(self) -> bool:
> +        return not self.status().exited
> +
> +    def check_results(self) -> bool:
> +        """Verify IGT test results. Return True for test success, False on fail."""
> +        if not self.proc_result.exited:
> +            self.proc_result = self.wait()
> +
> +        if self.proc_result.exit_code == 0 and self.did_pass():
> +            logger.debug("[%s] IGT passed", self.target)
> +            return True
> +
> +        logger.error("[%s] IGT failed: %s", self.target, self.proc_result)
> +        return False
> +
>       def get_results_log(self) -> typing.Dict:
>           # Results are cached
>           if self.results:
> +            logger.debug("Get available IGT results from cache")
>               return self.results
>           path = posixpath.join(self.igt_config.result_dir, 'results.json')
>           result = self.target.read_file_content(path)
> @@ -95,7 +119,7 @@ class IgtExecutor(ExecutorInterface):
>                   continue
>               fail_case = fail_case + aggregate[key]
>   
> -        logger.debug('Full IGT test results:\n%s', json.dumps(results, indent=4))
> +        logger.debug("[%s] Full IGT test results:\n%s", self.target, json.dumps(results, indent=4))
>   
>           if fail_case > 0:
>               logger.error('Test failed!')
> diff --git a/tools/vmtb/bench/machines/physical/device.py b/tools/vmtb/bench/machines/physical/device.py
> index 887f607e4..a487c0e5f 100644
> --- a/tools/vmtb/bench/machines/physical/device.py
> +++ b/tools/vmtb/bench/machines/physical/device.py
> @@ -45,7 +45,7 @@ class Device(DeviceInterface):
>   
>       def __init__(self, bdf: str, driver: str) -> None:
>           self.pci_info = self.PciInfo(bdf)
> -        self.gpu_model: str = pci.get_gpu_model(self.pci_info.devid)
> +        self.gpu_model = pci.get_gpu_model(self.pci_info.devid)
>           self.driver: DriverInterface = self.instantiate_driver(driver, self.pci_info.minor_number)
>   
>       def __str__(self) -> str:
> diff --git a/tools/vmtb/vmm_flows/conftest.py b/tools/vmtb/vmm_flows/conftest.py
> index 3bfac01c4..28c0b5f00 100644
> --- a/tools/vmtb/vmm_flows/conftest.py
> +++ b/tools/vmtb/vmm_flows/conftest.py
> @@ -79,8 +79,6 @@ class VmmTestingSetup:
>           self.guest_os_image = vmtb_config.get_guest_config().os_image_path if cmdline_config['vm_image'] is None \
>                            else cmdline_config['vm_image']
>   
> -        self.vgpu_profiles_dir = vmtb_config.vmtb_config_file.parent / vmtb_config.config.vgpu_profiles_path
> -
>           self.host.drm_driver_name = vmtb_config.get_host_config().driver
>           self.host.igt_config = vmtb_config.get_host_config().igt_config
>   
> @@ -103,6 +101,12 @@ class VmmTestingSetup:
>                       self.get_dut().driver.get_name(),
>                       vf_migration_support)
>   
> +        vmtb_root_path = vmtb_config.vmtb_config_file.parent
> +        self.vgpu_profiles_dir = vmtb_root_path / vmtb_config.config.vgpu_profiles_path
> +        # Device specific wsim descriptors directory path, e.g.:
> +        # [vmtb_root]/vmm_flows/resources/wsim/ptl (last subdir is lowercase key/name from pci.GpuModel class)
> +        self.wsim_wl_dir = vmtb_root_path / vmtb_config.config.wsim_wl_path / self.get_dut().gpu_model.name.lower()
> +
>           self.vgpu_profile: VgpuProfile = self.get_vgpu_profile()
>   
>           # Start maximum requested number of VMs, but not more than VFs supported by the given vGPU profile
> diff --git a/tools/vmtb/vmtb_config.json b/tools/vmtb/vmtb_config.json
> index 640a64123..2b8fb43f3 100644
> --- a/tools/vmtb/vmtb_config.json
> +++ b/tools/vmtb/vmtb_config.json
> @@ -23,6 +23,7 @@
>       },
>       "resources": {
>           "vgpu_profiles_path": "vmm_flows/resources/vgpu_profiles",
> +        "wsim_wl_path": "vmm_flows/resources/wsim",
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>           "guc_ver_path": "vmm_flows/resources/guc"
>       },
>       "ci": {
