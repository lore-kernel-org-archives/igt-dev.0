Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D52EB1043
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E0210E250;
	Tue, 10 Mar 2026 10:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JL5cOmFu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D1B10E6AC
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773139926; x=1804675926;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Kf5XsWXmaQpDhNuU0rluQ20YacMDKeGUUMZ0NFCSh90=;
 b=JL5cOmFuenwHx+DXDR2DuO5Lob0anPS/J/Zt+g46jVGJQgwBJFwMOPPe
 4R8LOJul8yc7n2BRVPNTWWgRq1zU1Qz1GhSLyI+92seRi3cKHW60y/w/w
 M3XhbqMi47LXsLfYZrD5y+XhmcbXjTxJ/gGqoIXqRNYSNrTxeNW5XvuvV
 XeMCV5WDXBLOHOfvXcB5vIacqzMkbYSWxhQIm0AnK2uMTNUuG3FZ8Nnsl
 rSXF0eSJFZJM1j8Gb4kCTQAkGU9Uw5cTyyKJYypgTLiFtMF3OJiOFAoVa
 vfs0Dprhp+zDK/Ao6BEJWBM/pT7z9XFSxB+IVQHkcyQsHHwa0+pF2kZtj g==;
X-CSE-ConnectionGUID: di5lcslCSy2oMRjuOLhRxw==
X-CSE-MsgGUID: 4O36X+L9Td+P2DgYfswTXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74060641"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74060641"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:52:06 -0700
X-CSE-ConnectionGUID: P0U612oGRwazy3PbR+xyOA==
X-CSE-MsgGUID: pJJ21e0NT4mQo7E1Y96y7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="220029227"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.135])
 ([172.28.180.135])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:52:05 -0700
Message-ID: <a95129bc-6cb5-4ebb-aa60-438cda7bf961@linux.intel.com>
Date: Tue, 10 Mar 2026 11:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 09/10] tools/vmtb: Support max VFs configuration
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
 <20260224075027.2409675-10-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260224075027.2409675-10-adam.miszczak@linux.intel.com>
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


On 2/24/2026 8:50 AM, Adam Miszczak wrote:
> Enable maximum VFs test configuration variant, for both:
> auto-provisioning and vGPU profiles.
> Max VFs is device-specific value read via sysfs.
> For auto-provisioning, max VFs always equals sysfs/sriov_totalvfs,
> but the highest supported number of VFs defined by vGPU profiles
> may differ from the hardware max value.
>
> Max VFs test config variant can be requested by passing MAX_VFS label
> to VmmTestingConfig structure (num_vfs) or convenience tuple, for example:
> test_variants = [(MAX_VFS, VfProvisioningMode.AUTO, VfSchedulingMode.INFINITE),
>                   (MAX_VFS, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE)]
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/vmm_flows/conftest.py | 29 ++++++++++++++++++++++++++---
>   1 file changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/tools/vmtb/vmm_flows/conftest.py b/tools/vmtb/vmm_flows/conftest.py
> index ae149d652..02c297f93 100644
> --- a/tools/vmtb/vmm_flows/conftest.py
> +++ b/tools/vmtb/vmm_flows/conftest.py
> @@ -32,6 +32,10 @@ def pytest_addoption(parser):
>                        help='Device card index for test execution')
>   
>   
> +# Label indicating Max VFs configurarion variant, intended for pass to VmmTestingConfig.
> +MAX_VFS = "Max"
> +
> +
>   @dataclass
>   class VmmTestingConfig:
>       """Structure represents test configuration used by a setup fixture.
> @@ -54,16 +58,23 @@ class VmmTestingConfig:
>       auto_poweron_vm: bool = True
>       auto_probe_vm_driver: bool = True
>       unload_host_drivers_on_teardown: bool = False
> +    enable_max_vfs: bool = False
>       # Temporary W/A: reduce size of LMEM assigned to VFs to speed up a VF state save-restore process
>       wa_reduce_vf_lmem: bool = False
>   
> +    def __post_init__(self):
> +        if self.num_vfs is MAX_VFS:
> +            self.enable_max_vfs = True
> +            self.num_vfs = 0 # Actual value set in VmmTestingSetup
> +
>       def __str__(self) -> str:
> -        test_config_id = f'{self.num_vfs}VF-(P:{self.provisioning_mode.name} S:{self.scheduling_mode.name})'
> +        test_config_id = (f'{self.num_vfs if not self.enable_max_vfs else "Max"}VF'
> +                          + f'-(P:{self.provisioning_mode.name} S:{self.scheduling_mode.name})')
>           return test_config_id
>   
>       def __repr__(self) -> str:
>           return (f'\nVmmTestingConfig:'
> -                f'\nNum VFs = {self.num_vfs} / max num VMs = {self.max_num_vms}'
> +                f'\nNum VFs = {self.num_vfs if not self.enable_max_vfs else "Max"} / max num VMs = {self.max_num_vms}'
>                   f'\nVF provisioning mode = {self.provisioning_mode.name}'
>                   f'\nVF scheduling mode = {self.scheduling_mode.name}'
>                   f'\nSetup flags:'
> @@ -89,6 +100,7 @@ class VmmTestingSetup:
>           self.host.load_drivers()
>           self.host.discover_devices()
>           self.dut: Device = self.host.get_device(self.dut_index)
> +        self.total_vfs: int = self.get_dut().driver.get_totalvfs()
>   
>           # VF migration requires vendor specific VFIO driver (e.g. xe-vfio-pci)
>           vf_migration_support: bool = self.host.is_driver_loaded(f'{self.host.drm_driver_name}-vfio-pci')
> @@ -98,11 +110,13 @@ class VmmTestingSetup:
>                       "\n\tPCI BDF: %s "
>                       "\n\tDevice ID: %s (%s)"
>                       "\n\tHost DRM driver: %s"
> -                    "\n\tVF migration support: %s",
> +                    "\n\tMax VFs supported: %s"
> +                    "\n\tVF migration supported: %s",
>                       self.dut_index,
>                       self.get_dut().pci_info.bdf,
>                       self.get_dut().pci_info.devid, self.get_dut().gpu_model,
>                       self.get_dut().driver.get_name(),
> +                    self.total_vfs,
>                       vf_migration_support)
>   
>           vmtb_root_path = vmtb_config.vmtb_config_file.parent
> @@ -115,6 +129,9 @@ class VmmTestingSetup:
>               or self.testing_config.scheduling_mode is not VfSchedulingMode.INFINITE):
>               self.vgpu_profile: VgpuProfile = self.get_vgpu_profile()
>   
> +        if self.testing_config.provisioning_mode is VfProvisioningMode.AUTO and self.testing_config.enable_max_vfs:
> +            self.testing_config.num_vfs = self.total_vfs
> +
>           # Start maximum requested number of VMs, but not more than VFs supported by the given vGPU profile
>           self.vms: typing.List[VirtualMachine] = [
>               VirtualMachine(vm_idx, self.guest_os_image,
> @@ -125,6 +142,12 @@ class VmmTestingSetup:
>   
>       def get_vgpu_profile(self) -> VgpuProfile:
>           configurator = VgpuProfileConfigurator(self.vgpu_profiles_dir, self.get_dut().gpu_model)
> +        if self.testing_config.enable_max_vfs:
> +            # Get a vGPU profile with the most VFs (not necessarily equal to sysfs/sriov_totalvfs)
> +            self.testing_config.num_vfs = max(configurator.supported_vgpu_profiles.vf_resources,
> +                                              key=lambda profile: profile.vf_count).vf_count
> +            logger.debug("Max VFs supported by vGPU profiles: %s", self.testing_config.num_vfs)
> +
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>           try:
>               vgpu_profile = configurator.get_vgpu_profile(self.testing_config.num_vfs,
>                                                            self.testing_config.scheduling_mode)
