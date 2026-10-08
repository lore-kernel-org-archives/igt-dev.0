Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED40CA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 13:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5754810E092;
	Thu,  8 Oct 2026 13:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9dtEiKk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D55210E092
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 13:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791467663; x=1823003663;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8yeUIQqLFWqLdatx95LG3jteRWsY55jkaAIIXPjwLyM=;
 b=E9dtEiKkJDn3k9hPoPx+QjTH7BgJN44TIbEijkAp6OrBI270WDW8W5kc
 MzhKu9cmoadsw8u1MOGd1uMnZXklmrN6tCrWn/2T2ZeUjfFVxvTAIrHFs
 h0m8iPV8uXgnYSocmkdD9K2zH1zkgepSpEdUpPQCFRcl99yq/kqqr6m4V
 IDZFOkrCIS5F7n0EH2KQ6hQNYm74194cKIq4ERZsryvZOc4qe8e+G6SMf
 wvExpchOB/cCogyYZLq+923aS9nbGWPAwAb7zbu3CWtspvRHnrkVvJyyy
 M81QtGQn7P+PA34tSHXCaPT5EKjmulNaa27J35rs9rN2ZyJzat1ir72QY w==;
X-CSE-ConnectionGUID: Z7pVsHfkRqO3qa3knJevbw==
X-CSE-MsgGUID: 8SXnFdWPT228kRRY6KrGmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="277281"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="277281"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:54:23 -0700
X-CSE-ConnectionGUID: jNvw41TNSYm3RwsVXsDg2g==
X-CSE-MsgGUID: 3XAE11oHT/2HnokmevNqTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="54706"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:54:22 -0700
Message-ID: <f3951eff-b985-4069-8aaa-ad880bff6564@linux.intel.com>
Date: Thu, 8 Oct 2026 15:54:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/7] tools/vmtb: Rework VF scheduler provisioning
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260928072600.426902-1-adam.miszczak@linux.intel.com>
 <20260928072600.426902-3-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260928072600.426902-3-adam.miszczak@linux.intel.com>
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

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

On 9/28/2026 9:25 AM, Adam Miszczak wrote:
> Align default VF scheduling setup with the current xe KMD behavior.
> Scheduling settings: execution quanta (EQ) and preemption-timeout (PT)
> are set to 16ms by default (instead of infinite/0), therefore:
> - rename VfSchedulingMode.INFINITE → AUTO
> - update VmmTestingConfig default from INFINITE to AUTO
>
> Fix scheduler-only manual provisioning - support VF config variants
> where only the scheduler setup is needed (auto resources provisioning
> with a concrete scheduling mode). In this case load scheduler profile
> even when no matching resources profile exists.
>
> In addition, fix max VFs handling, improve assertions for creating VFs
> and skip unsupported test configs instead of failing.
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   .../configurators/vgpu_profile_config.py      | 20 +++++---
>   tools/vmtb/bench/exceptions.py                |  4 ++
>   tools/vmtb/bench/machines/physical/device.py  |  9 ++--
>   tools/vmtb/vmm_flows/conftest.py              | 46 +++++++++++--------
>   tools/vmtb/vmm_flows/test_basic.py            |  2 +-
>   5 files changed, 52 insertions(+), 29 deletions(-)
>
> diff --git a/tools/vmtb/bench/configurators/vgpu_profile_config.py b/tools/vmtb/bench/configurators/vgpu_profile_config.py
> index 4bddb641e..35a8a8835 100644
> --- a/tools/vmtb/bench/configurators/vgpu_profile_config.py
> +++ b/tools/vmtb/bench/configurators/vgpu_profile_config.py
> @@ -23,7 +23,7 @@ class VfProvisioningMode(Enum):
>   
>   
>   class VfSchedulingMode(str, Enum):
> -    INFINITE = 'Infinite' # Infinite EQ/PT - HW default
> +    AUTO = 'Auto' # Default EQ/PT (set by xe KMD automatically)
>       DEFAULT_PROFILE = 'Default_Profile' # Default vGPU scheduler profile
>       FLEXIBLE_30FPS = 'Flexible_30fps_GPUTimeSlicing'
>       FIXED_30FPS = 'Fixed_30fps_GPUTimeSlicing'
> @@ -87,8 +87,8 @@ class VgpuProfileConfigurator:
>                   break
>   
>           if not is_vf_resource_found:
> -            logger.error("vGPU VF resources profile %sxVF not found!", requested_num_vfs)
> -            raise exceptions.VgpuProfileError(f'vGPU VF resources profile {requested_num_vfs}xVF not found!')
> +            logger.warning("vGPU resources profile (%sxVF) not found!", requested_num_vfs)
> +            raise exceptions.VgpuProfileNotFound(f'vGPU resources profile ({requested_num_vfs}xVF) not found!')
>   
>           return vgpu_resources_config
>   
> @@ -99,7 +99,7 @@ class VgpuProfileConfigurator:
>           # pylint: disable=W0123
>           vgpu_scheduler_config = VgpuSchedulerConfig()
>   
> -        if requested_scheduler is VfSchedulingMode.INFINITE:
> +        if requested_scheduler is VfSchedulingMode.AUTO:
>               return vgpu_scheduler_config
>   
>           for scheduler in self.supported_vgpu_profiles.scheduler_configs:
> @@ -136,13 +136,19 @@ class VgpuProfileConfigurator:
>   
>           return vgpu_security_config
>   
> -    def get_vgpu_profile(self, requested_num_vfs: int, requested_scheduler: VfSchedulingMode) -> VgpuProfile:
> -        """Get vGPU profile for requested number of VFs, scheduler and security modes."""
> +    def get_vgpu_profile(self, requested_num_vfs: int, requested_scheduler: VfSchedulingMode,
> +                         require_resources: bool = True) -> VgpuProfile:
> +        """Get vGPU profile for requested number of VFs, scheduler and security modes.
> +        If require_resources is False, skip VF resources lookup
> +        (e.g. for auto provisioning where only the scheduler config is needed).
> +        """
>           logger.info("Requested vGPU profile: %s VFs / scheduling: %s", requested_num_vfs, requested_scheduler)
>   
>           vgpu_profile: VgpuProfile = VgpuProfile()
>           vgpu_profile.num_vfs = requested_num_vfs
> -        vgpu_profile.resources = self.select_vgpu_resources_profile(requested_num_vfs)
> +
> +        if require_resources:
> +            vgpu_profile.resources = self.select_vgpu_resources_profile(requested_num_vfs)
>   
>           if requested_scheduler is VfSchedulingMode.DEFAULT_PROFILE:
>               requested_scheduler = VfSchedulingMode(self.supported_vgpu_profiles.scheduler_config_default)
> diff --git a/tools/vmtb/bench/exceptions.py b/tools/vmtb/bench/exceptions.py
> index 1c151669a..557b44142 100644
> --- a/tools/vmtb/bench/exceptions.py
> +++ b/tools/vmtb/bench/exceptions.py
> @@ -40,6 +40,10 @@ class VgpuProfileError(BenchError):
>       pass
>   
>   
> +class VgpuProfileNotFound(VgpuProfileError):
> +    pass
> +
> +
>   class NotAvailableError(BenchError):
>       pass
>   
> diff --git a/tools/vmtb/bench/machines/physical/device.py b/tools/vmtb/bench/machines/physical/device.py
> index f1f24c65c..6c0dc4ff9 100644
> --- a/tools/vmtb/bench/machines/physical/device.py
> +++ b/tools/vmtb/bench/machines/physical/device.py
> @@ -59,7 +59,7 @@ class Device(DeviceInterface):
>               driver_module = importlib.import_module(module_name)
>               driver_class = getattr(driver_module, class_name)
>           except (ImportError, AttributeError) as exc:
> -            logging.error("Driver module/class is not available: %s", exc)
> +            logger.error("Driver module/class is not available: %s", exc)
>               raise exceptions.VmtbConfigError(f'Requested driver module {driver_name} is not available!')
>   
>           return driver_class(bdf)
> @@ -102,7 +102,9 @@ class Device(DeviceInterface):
>   
>           self.driver.set_numvfs(num)
>           ret = self.driver.get_numvfs()
> -        assert ret == num
> +        if ret != num:
> +            logger.error("Failed to create requested number of VFs - expected: %s, got: %s", num, ret)
> +            raise exceptions.HostError(f'Failed to create requested number of VFs ({num})')
>   
>           return ret
>   
> @@ -114,7 +116,8 @@ class Device(DeviceInterface):
>           self.driver.set_numvfs(0)
>           ret = self.driver.get_numvfs()
>           if ret != 0:
> -            raise exceptions.HostError('VFs not disabled after 0 write')
> +            logger.error("Failed to disable VFs - expected 0, got: %s", ret)
> +            raise exceptions.HostError('Failed to disable all VFs')
>   
>           logger.debug("[%s] Enable drivers autoprobe", self.pci_info.bdf)
>           self.set_drivers_autoprobe(True)
> diff --git a/tools/vmtb/vmm_flows/conftest.py b/tools/vmtb/vmm_flows/conftest.py
> index 02c297f93..ba6487c84 100644
> --- a/tools/vmtb/vmm_flows/conftest.py
> +++ b/tools/vmtb/vmm_flows/conftest.py
> @@ -44,7 +44,7 @@ class VmmTestingConfig:
>       - num_vfs: requested number of VFs to enable
>       - max_num_vms: maximal number of VMs (the value can be different than enabled number of VFs)
>       - provisioning_mode: auto (fair resources allocation by a driver) or vGPU profile
> -    - scheduling_mode: requested vGPU scheduling profile (infinite maps to default 0's)
> +    - scheduling_mode: requested vGPU scheduling profile (auto maps to default EQ=16ms and PT=16000us)
>       - auto_poweron_vm: assign VFs and power on VMs automatically in setup fixture
>       - auto_probe_vm_driver: probe guest DRM driver in setup fixture (VM must be powered on)
>       - unload_host_drivers_on_teardown: unload host DRM drivers in teardown fixture
> @@ -53,7 +53,7 @@ class VmmTestingConfig:
>       num_vfs: int = 1
>       max_num_vms: int = 2
>       provisioning_mode: VfProvisioningMode = VfProvisioningMode.AUTO
> -    scheduling_mode: VfSchedulingMode = VfSchedulingMode.INFINITE
> +    scheduling_mode: VfSchedulingMode = VfSchedulingMode.AUTO
>   
>       auto_poweron_vm: bool = True
>       auto_probe_vm_driver: bool = True
> @@ -68,8 +68,11 @@ class VmmTestingConfig:
>               self.num_vfs = 0 # Actual value set in VmmTestingSetup
>   
>       def __str__(self) -> str:
> -        test_config_id = (f'{self.num_vfs if not self.enable_max_vfs else "Max"}VF'
> -                          + f'-(P:{self.provisioning_mode.name} S:{self.scheduling_mode.name})')
> +        test_config_id = (f'{self.num_vfs if not self.enable_max_vfs else "Max"}VF')
> +
> +        if self.provisioning_mode is not VfProvisioningMode.AUTO or self.scheduling_mode is not VfSchedulingMode.AUTO:
> +            test_config_id += f'-(P:{self.provisioning_mode.name} S:{self.scheduling_mode.name})'
> +
>           return test_config_id
>   
>       def __repr__(self) -> str:
> @@ -126,10 +129,11 @@ class VmmTestingSetup:
>           self.wsim_wl_dir = vmtb_root_path / vmtb_config.config.wsim_wl_path / self.get_dut().gpu_model.name.lower()
>   
>           if (self.testing_config.provisioning_mode is VfProvisioningMode.VGPU_PROFILE
> -            or self.testing_config.scheduling_mode is not VfSchedulingMode.INFINITE):
> +            or self.testing_config.scheduling_mode is not VfSchedulingMode.AUTO):
> +            # vGPU profile or auto resources provisioning with concrete scheduling
>               self.vgpu_profile: VgpuProfile = self.get_vgpu_profile()
> -
> -        if self.testing_config.provisioning_mode is VfProvisioningMode.AUTO and self.testing_config.enable_max_vfs:
> +        elif self.testing_config.enable_max_vfs:
> +            # Auto provisioning (with default/auto scheduling) for max VFs (HW limit)
>               self.testing_config.num_vfs = self.total_vfs
>   
>           # Start maximum requested number of VMs, but not more than VFs supported by the given vGPU profile
> @@ -143,17 +147,22 @@ class VmmTestingSetup:
>       def get_vgpu_profile(self) -> VgpuProfile:
>           configurator = VgpuProfileConfigurator(self.vgpu_profiles_dir, self.get_dut().gpu_model)
>           if self.testing_config.enable_max_vfs:
> -            # Get a vGPU profile with the most VFs (not necessarily equal to sysfs/sriov_totalvfs)
> -            self.testing_config.num_vfs = max(configurator.supported_vgpu_profiles.vf_resources,
> -                                              key=lambda profile: profile.vf_count).vf_count
> -            logger.debug("Max VFs supported by vGPU profiles: %s", self.testing_config.num_vfs)
> +            if self.testing_config.provisioning_mode is VfProvisioningMode.VGPU_PROFILE:
> +                # Get a vGPU profile with the most VFs (not necessarily equal to sysfs/sriov_totalvfs)
> +                self.testing_config.num_vfs = max(configurator.supported_vgpu_profiles.vf_resources,
> +                                                  key=lambda profile: profile.vf_count).vf_count
> +                logger.debug("Max VFs supported by vGPU profiles: %s", self.testing_config.num_vfs)
> +            else:
> +                # Use HW VFs limit (sysfs/sriov_totalvfs) with auto resources provisioning and concrete scheduling
> +                self.testing_config.num_vfs = self.total_vfs
>   
>           try:
> +            require_resources = self.testing_config.provisioning_mode is VfProvisioningMode.VGPU_PROFILE
>               vgpu_profile = configurator.get_vgpu_profile(self.testing_config.num_vfs,
> -                                                         self.testing_config.scheduling_mode)
> -        except exceptions.VgpuProfileError as exc:
> -            logger.error("Suitable vGPU profile not found: %s", exc)
> -            raise exceptions.VgpuProfileError('Invalid test setup - vGPU profile not found!')
> +                                                         self.testing_config.scheduling_mode,
> +                                                         require_resources)
> +        except exceptions.VgpuProfileNotFound as exc:
> +            pytest.skip(f'Test config not supported: {exc}')
>   
>           return vgpu_profile
>   
> @@ -277,11 +286,12 @@ def fixture_setup_vms(get_vmtb_config, get_cmdline_config, get_host, request):
>       else:
>           device.driver.restore_auto_provisioning()
>   
> -    assert device.create_vf(num_vfs) == num_vfs
> +    assert num_vfs <= ts.total_vfs, f'Requested number of VFs ({num_vfs}) exceeds total VFs ({ts.total_vfs})'
> +    device.create_vf(num_vfs)
>   
>       if (ts.testing_config.provisioning_mode is VfProvisioningMode.AUTO and
> -        ts.testing_config.scheduling_mode is not VfSchedulingMode.INFINITE):
> -        # Auto resources provisioning with concrete scheduling (i.e. different than HW default: infinite).
> +        ts.testing_config.scheduling_mode is not VfSchedulingMode.AUTO):
> +        # Auto resources provisioning with scheduling override (i.e. different than default/auto).
>           # Scheduler params override must be done after enabling VFs
>           # to allow hard resources auto provisioning by KMD.
>           ts.vgpu_profile.print_scheduler_config()
> diff --git a/tools/vmtb/vmm_flows/test_basic.py b/tools/vmtb/vmm_flows/test_basic.py
> index 9b8731273..597ebbb68 100644
> --- a/tools/vmtb/vmm_flows/test_basic.py
> +++ b/tools/vmtb/vmm_flows/test_basic.py
> @@ -43,7 +43,7 @@ def set_test_config(test_variants: List[Tuple[int, VfProvisioningMode, VfSchedul
>   
>   test_variants_1 = [(1, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
>                      (2, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
> -                   (2, VfProvisioningMode.AUTO, VfSchedulingMode.INFINITE)]
> +                   (2, VfProvisioningMode.AUTO, VfSchedulingMode.AUTO)]
>   
>   @pytest.mark.parametrize('setup_vms', set_test_config(test_variants_1), ids=idfn_test_config, indirect=['setup_vms'])
>   class TestVmSetup:
