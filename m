Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2F9EB104A
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73E710E237;
	Tue, 10 Mar 2026 10:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGZLKzXr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5331A10E23B
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773139138; x=1804675138;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ykgrbOEARbW6YawwJAJavBsUD8lwxt25oXkGujGT4n4=;
 b=oGZLKzXr8FSZ+th6snI4FdmC1QnQ7WgVWRO1zvz2FvBTbDBNdODrwaOZ
 xiSZ4fzE9V6WWgW8Ri8vdaWRovF7X/LoPJYt74TRozgfo1yXN3KCi8dc2
 Ne7Mndhd8r2tFkQm7beNp3ykYcNDMn7QRPzv+1uEEtUXo2YSIQlBgv/zX
 nPXXzkknusInmPsfHVkABvHH8AkQyhhGLOGSv4pQTB9f62Qg1dTfCYuvM
 Jmn9EYJKICr6p3EqaoNYX74V5i71A2SBKm77V8p8EW0yN10x1ANiayVWX
 i+ta794c6El7sSlJFdjp6kbRUvgqw7nLwwtVRc11bJwktkp26YJFQ5f4e A==;
X-CSE-ConnectionGUID: fmzUVkJvQLOFW8F0x3wC8Q==
X-CSE-MsgGUID: cUdraYzbQc+ic27HBNOIIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74059144"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74059144"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:38:58 -0700
X-CSE-ConnectionGUID: BOmBtVH1RgqCfMYX+MeyPA==
X-CSE-MsgGUID: Nr9jx78QTOO0/6A4hkhSfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="219196929"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.135])
 ([172.28.180.135])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:38:55 -0700
Message-ID: <ab17e76e-9f85-427b-b6c7-31ad71d181bc@linux.intel.com>
Date: Tue, 10 Mar 2026 11:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 05/10] tools/vmtb: VF auto/fair provisioning support
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
 <20260224075027.2409675-6-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260224075027.2409675-6-adam.miszczak@linux.intel.com>
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
> Currently test variants allow provisioning with vGPU profiles only,
> however, xe KMD supports also fair resources allocation (auto-provisioning).
> Therefore, the following provisioning modes shall be supported from now:
> - vGPU profile: both PF/VF resources and scheduling (via debugfs)
> - fair/auto provisioning (driver defaults for resources and scheduling)
> - fair/auto resources provisioning with concrete scheduling profile
>
> Test variants are now specified as a list of 3-element tuples:
>     test_variants_N = [(num_of_vfs, VfProvisioningMode.X, VfSchedulingMode.Y), ...]
> Test ID printed in the following format:
>     test_name[NxVF-(P:provisioning_mode S:scheduling_mode)]
>
> Additional changes:
> - align parametrized tests with the new variants format
> - use Device methods: set_resources and set_scheduling
>    for relevant provisioning modes
> - split vGPU profile printing to resources and scheduler part
> - fix PF lmem_spare getter/setter to check for LMEM presence
> - detect standalone media GT for proper VF provisioning
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   .../vmtb/bench/configurators/vgpu_profile.py  | 37 +++++---
>   .../configurators/vgpu_profile_config.py      |  7 +-
>   tools/vmtb/bench/drivers/driver_interface.py  |  6 +-
>   tools/vmtb/bench/drivers/xe.py                | 16 +++-
>   tools/vmtb/bench/machines/physical/device.py  | 58 +++++++-----
>   tools/vmtb/vmm_flows/conftest.py              | 89 ++++++++++++++-----
>   tools/vmtb/vmm_flows/test_basic.py            | 21 +++--
>   7 files changed, 164 insertions(+), 70 deletions(-)
>
> diff --git a/tools/vmtb/bench/configurators/vgpu_profile.py b/tools/vmtb/bench/configurators/vgpu_profile.py
> index 7c536c1d0..c680fdb83 100644
> --- a/tools/vmtb/bench/configurators/vgpu_profile.py
> +++ b/tools/vmtb/bench/configurators/vgpu_profile.py
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: MIT
> -# Copyright © 2024 Intel Corporation
> +# Copyright © 2024-2026 Intel Corporation
>   
>   import json
>   import logging
> @@ -55,8 +55,19 @@ class VgpuProfile:
>       def print_parameters(self) -> None:
>           logger.info(
>               "\nvGPU Profile:\n"
> -            "   Num VFs = %s\n"
> -            "\nResources:\n"
> +            "   Num VFs = %s\n",
> +            self.num_vfs)
> +        self.print_resources_config()
> +        self.print_scheduler_config()
> +        logger.info(
> +            "\nSecurity:\n"
> +            "   Reset After Vf Switch = %s\n",
> +            self.security.reset_after_vf_switch
> +        )
> +
> +    def print_resources_config(self) -> None:
> +        logger.info(
> +            "\nResources config:\n"
>               "   PF:\n"
>               "\tLMEM = %s B\n"
>               "\tContexts = %s\n"
> @@ -66,24 +77,24 @@ class VgpuProfile:
>               "\tLMEM = %s B\n"
>               "\tContexts = %s\n"
>               "\tDoorbells = %s\n"
> -            "\tGGTT = %s B\n"
> -            "\nScheduling:\n"
> +            "\tGGTT = %s B\n",
> +            self.resources.pfLmem, self.resources.pfContexts, self.resources.pfDoorbells, self.resources.pfGgtt,
> +            self.resources.vfLmem, self.resources.vfContexts, self.resources.vfDoorbells, self.resources.vfGgtt,
> +        )
> +
> +    def print_scheduler_config(self) -> None:
> +        logger.info(
> +            "\nScheduling config:\n"
>               "   Schedule If Idle = %s\n"
>               "   PF:\n"
>               "\tExecution Quanta = %s ms\n"
>               "\tPreemption Timeout = %s us\n"
>               "   VF:\n"
>               "\tExecution Quanta = %s ms\n"
> -            "\tPreemption Timeout = %s us\n"
> -            "\nSecurity:\n"
> -            "   Reset After Vf Switch = %s\n",
> -            self.num_vfs,
> -            self.resources.pfLmem, self.resources.pfContexts, self.resources.pfDoorbells, self.resources.pfGgtt,
> -            self.resources.vfLmem, self.resources.vfContexts, self.resources.vfDoorbells, self.resources.vfGgtt,
> +            "\tPreemption Timeout = %s us\n",
>               self.scheduler.scheduleIfIdle,
>               self.scheduler.pfExecutionQuanta, self.scheduler.pfPreemptionTimeout,
> -            self.scheduler.vfExecutionQuanta, self.scheduler.vfPreemptionTimeout,
> -            self.security.reset_after_vf_switch
> +            self.scheduler.vfExecutionQuanta, self.scheduler.vfPreemptionTimeout
>           )
>   
>   
> diff --git a/tools/vmtb/bench/configurators/vgpu_profile_config.py b/tools/vmtb/bench/configurators/vgpu_profile_config.py
> index 915cfb2b8..4bddb641e 100644
> --- a/tools/vmtb/bench/configurators/vgpu_profile_config.py
> +++ b/tools/vmtb/bench/configurators/vgpu_profile_config.py
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: MIT
> -# Copyright © 2024 Intel Corporation
> +# Copyright © 2024-2026 Intel Corporation
>   
>   import logging
>   from enum import Enum
> @@ -17,6 +17,11 @@ from bench.configurators.vgpu_profile import (VgpuProfile,
>   logger = logging.getLogger('DeviceConfigurator')
>   
>   
> +class VfProvisioningMode(Enum):
> +    VGPU_PROFILE = 0
> +    AUTO = 1
> +
> +
>   class VfSchedulingMode(str, Enum):
>       INFINITE = 'Infinite' # Infinite EQ/PT - HW default
>       DEFAULT_PROFILE = 'Default_Profile' # Default vGPU scheduler profile
> diff --git a/tools/vmtb/bench/drivers/driver_interface.py b/tools/vmtb/bench/drivers/driver_interface.py
> index af2f96837..3026fece7 100644
> --- a/tools/vmtb/bench/drivers/driver_interface.py
> +++ b/tools/vmtb/bench/drivers/driver_interface.py
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: MIT
> -# Copyright © 2024 Intel Corporation
> +# Copyright © 2024-2026 Intel Corporation
>   
>   import abc
>   import enum
> @@ -65,6 +65,10 @@ class DriverInterface(abc.ABC):
>       def has_lmem(self) -> bool:
>           raise NotImplementedError
>   
> +    @abc.abstractmethod
> +    def is_media_gt(self, gt_num: int) -> bool:
> +        raise NotImplementedError
> +
>       @abc.abstractmethod
>       def get_auto_provisioning(self) -> bool:
>           raise NotImplementedError
> diff --git a/tools/vmtb/bench/drivers/xe.py b/tools/vmtb/bench/drivers/xe.py
> index 009cec5be..c2b9643bb 100644
> --- a/tools/vmtb/bench/drivers/xe.py
> +++ b/tools/vmtb/bench/drivers/xe.py
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: MIT
> -# Copyright © 2024 Intel Corporation
> +# Copyright © 2024-2026 Intel Corporation
>   
>   import logging
>   import typing
> @@ -95,11 +95,18 @@ class XeDriver(DriverInterface):
>           path = self.debugfs_path / 'gt0' / 'pf' / 'lmem_spare'
>           return path.exists()
>   
> +    def is_media_gt(self, gt_num: int) -> bool:
> +        # XXX: is lack of PF's ggtt/lmem_spare or VF's ggtt/lmem_quota
> +        # a best way to check for standalone media GT?
> +        path = self.debugfs_path / f'gt{gt_num}' / 'pf' / 'ggtt_spare'
> +        return not path.exists()
> +
>       def get_auto_provisioning(self) -> bool:
>           raise exceptions.NotAvailableError('auto_provisioning attribute not available')
>   
>       def set_auto_provisioning(self, val: bool) -> None:
> -        raise exceptions.NotAvailableError('auto_provisioning attribute not available')
> +        # No-op - xe driver doesn't publish this attribute
> +        pass
>   
>       def cancel_work(self) -> None:
>           # Function to cancel all remaing work on GPU (for test cleanup).
> @@ -129,11 +136,12 @@ class XeDriver(DriverInterface):
>   
>       def get_pf_lmem_spare(self, gt_num: int) -> int:
>           path = self.__helper_create_debugfs_path(0, gt_num, '', 'lmem_spare')
> -        return int(self.__read_debugfs(path))
> +        return int(self.__read_debugfs(path)) if self.has_lmem() else 0
>   
>       def set_pf_lmem_spare(self, gt_num: int, val: int) -> None:
>           path = self.__helper_create_debugfs_path(0, gt_num, '', 'lmem_spare')
> -        self.__write_debugfs(path, str(val))
> +        if self.has_lmem():
> +            self.__write_debugfs(path, str(val))
>   
>       def get_pf_contexts_spare(self, gt_num: int) -> int:
>           path = self.__helper_create_debugfs_path(0, gt_num, '', 'contexts_spare')
> diff --git a/tools/vmtb/bench/machines/physical/device.py b/tools/vmtb/bench/machines/physical/device.py
> index a487c0e5f..250466733 100644
> --- a/tools/vmtb/bench/machines/physical/device.py
> +++ b/tools/vmtb/bench/machines/physical/device.py
> @@ -83,6 +83,9 @@ class Device(DeviceInterface):
>       def has_lmem(self) -> bool:
>           return self.driver.has_lmem()
>   
> +    def is_gt_media_type(self, gt_num: int) -> bool:
> +        return self.driver.is_media_gt(gt_num)
> +
>       def create_vf(self, num: int) -> int:
>           """Enable a requested number of VFs.
>           Disable SRIOV drivers autoprobe to allow VFIO driver override for VFs.
> @@ -156,37 +159,44 @@ class Device(DeviceInterface):
>           bdf_list = [self.get_vf_bdf(vf) for vf in vf_list]
>           return bdf_list
>   
> -    def provision(self, profile: VgpuProfile) -> None:
> -        logger.info("[%s] Provision VFs - set vGPU profile for %s VFs", self.pci_info.bdf, profile.num_vfs)
> +    def __set_provisioning(self, num_vfs: int, profile: VgpuProfile, set_resources: bool) -> None:
> +        """Helper to write provisioning attributes over sysfs/debugfs for PF and requested number of VFs.
> +        If 'set_resources' parameter is True - apply the full vGPU profile (hard resources and scheduling).
> +        Otherwise, set only scheduling profile (e.g. in case of auto resources provisioning).
> +        """
> +        main_gt_nums = [gt_num for gt_num in range(self.get_num_gts()) if not self.is_gt_media_type(gt_num)]
>   
> -        num_vfs = profile.num_vfs
> -        num_gts = self.get_num_gts() # Number of tiles (GTs)
> -        gt_nums = [0] if num_gts == 1 else [0, 1] # Tile (GT) numbers/indexes
> +        logger.info("[%s] Provision %sxVFs on main GT%s", self.pci_info.bdf, num_vfs, main_gt_nums)
>   
> -        for gt_num in gt_nums:
> -            self.driver.set_pf_policy_sched_if_idle(gt_num, int(profile.scheduler.scheduleIfIdle))
> +        for gt_num in main_gt_nums:
> +            if set_resources:
> +                self.set_resources(0, gt_num, profile.resources)
> +            self.set_scheduling(0, gt_num, profile.scheduler)
>               self.driver.set_pf_policy_reset_engine(gt_num, int(profile.security.reset_after_vf_switch))
> -            self.driver.set_exec_quantum_ms(0, gt_num, profile.scheduler.pfExecutionQuanta)
> -            self.driver.set_preempt_timeout_us(0, gt_num, profile.scheduler.pfPreemptionTimeout)
> -            self.driver.set_doorbells_quota(0, gt_num, profile.resources.pfDoorbells)
> -            # PF contexts are currently assigned by the driver and cannot be reprovisioned from sysfs
>   
>           for vf_num in range(1, num_vfs + 1):
> -            if num_gts > 1 and num_vfs > 1:
> +            gt_nums = main_gt_nums
> +            if len(main_gt_nums) > 1 and num_vfs > 1:
>                   # Multi-tile device Mode 2|3 - odd VFs on GT0, even on GT1
> -                gt_nums = [0] if vf_num % 2 else [1]
> +                gt_nums = [main_gt_nums[0] if vf_num % 2 else main_gt_nums[1]]
>   
>               for gt_num in gt_nums:
> -                self.driver.set_lmem_quota(vf_num, gt_num, profile.resources.vfLmem)
> -                self.driver.set_ggtt_quota(vf_num, gt_num, profile.resources.vfGgtt)
> -                self.driver.set_contexts_quota(vf_num, gt_num, profile.resources.vfContexts)
> -                self.driver.set_doorbells_quota(vf_num, gt_num, profile.resources.vfDoorbells)
> -                self.driver.set_exec_quantum_ms(vf_num, gt_num, profile.scheduler.vfExecutionQuanta)
> -                self.driver.set_preempt_timeout_us(vf_num, gt_num, profile.scheduler.vfPreemptionTimeout)
> +                if set_resources:
> +                    self.set_resources(vf_num, gt_num, profile.resources)
> +                self.set_scheduling(vf_num, gt_num, profile.scheduler)
> +
> +    def provision(self, profile: VgpuProfile) -> None:
> +        """Provision PF and VF(s) based on requested vGPU profile."""
> +        self.__set_provisioning(profile.num_vfs, profile, set_resources=True)
> +
> +    def provision_scheduling(self, num_vfs: int, profile: VgpuProfile) -> None:
> +        """Provision PF and VF(s) scheduling based on requested vGPU profile's scheduler config."""
> +        self.__set_provisioning(num_vfs, profile, set_resources=False)
>   
>       # fn_num = 0 for PF, 1..n for VF
>       def set_scheduling(self, fn_num: int, gt_num: int, scheduling_config: VgpuSchedulerConfig) -> None:
> -        logger.info("[%s] Provision scheduling config for PCI Function %s", self.pci_info.bdf, fn_num)
> +        """Write sysfs/debugfs PF/VF scheduling attributes."""
> +        logger.debug("[%s] Set scheduling for PCI Function %s", self.pci_info.bdf, fn_num)
>           if fn_num == 0:
>               self.driver.set_pf_policy_sched_if_idle(gt_num, int(scheduling_config.scheduleIfIdle))
>               self.driver.set_exec_quantum_ms(0, gt_num, scheduling_config.pfExecutionQuanta)
> @@ -196,7 +206,8 @@ class Device(DeviceInterface):
>               self.driver.set_preempt_timeout_us(fn_num, gt_num, scheduling_config.vfPreemptionTimeout)
>   
>       def set_resources(self, fn_num: int, gt_num: int, resources_config: VgpuResourcesConfig) -> None:
> -        logger.info("[%s] Provision resources config for PCI Function %s", self.pci_info.bdf, fn_num)
> +        """Write sysfs/debugfs PF/VF resources attributes."""
> +        logger.debug("[%s] Set resources for PCI Function %s", self.pci_info.bdf, fn_num)
>           if fn_num == 0:
>               self.driver.set_pf_ggtt_spare(gt_num, resources_config.pfGgtt)
>               self.driver.set_pf_lmem_spare(gt_num, resources_config.pfLmem)
> @@ -227,8 +238,9 @@ class Device(DeviceInterface):
>               for vf_num in range(1, num_vfs + 1):
>                   self.driver.set_contexts_quota(vf_num, gt_num, 0)
>                   self.driver.set_doorbells_quota(vf_num, gt_num, 0)
> -                self.driver.set_ggtt_quota(vf_num, gt_num, 0)
> -                self.driver.set_lmem_quota(vf_num, gt_num, 0)
> +                if not self.is_gt_media_type(gt_num):
> +                    self.driver.set_ggtt_quota(vf_num, gt_num, 0)
> +                    self.driver.set_lmem_quota(vf_num, gt_num, 0)
>   
>       def cancel_work(self) -> None:
>           """Drop and reset remaining GPU execution at exit."""
> diff --git a/tools/vmtb/vmm_flows/conftest.py b/tools/vmtb/vmm_flows/conftest.py
> index 28c0b5f00..12726416f 100644
> --- a/tools/vmtb/vmm_flows/conftest.py
> +++ b/tools/vmtb/vmm_flows/conftest.py
> @@ -12,7 +12,8 @@ import pytest
>   
>   from bench import exceptions
>   from bench.configurators.vgpu_profile import VgpuProfile
> -from bench.configurators.vgpu_profile_config import (VfSchedulingMode,
> +from bench.configurators.vgpu_profile_config import (VfProvisioningMode,
> +                                                     VfSchedulingMode,
>                                                        VgpuProfileConfigurator)
>   from bench.configurators.vmtb_config import VmtbConfigurator
>   from bench.helpers.helpers import modprobe_driver, modprobe_driver_check
> @@ -39,6 +40,7 @@ class VmmTestingConfig:
>       Available settings:
>       - num_vfs: requested number of VFs to enable
>       - max_num_vms: maximal number of VMs (the value can be different than enabled number of VFs)
> +    - provisioning_mode: auto (fair resources allocation by a driver) or vGPU profile
>       - scheduling_mode: requested vGPU scheduling profile (infinite maps to default 0's)
>       - auto_poweron_vm: assign VFs and power on VMs automatically in setup fixture
>       - auto_probe_vm_driver: probe guest DRM driver in setup fixture (VM must be powered on)
> @@ -47,6 +49,7 @@ class VmmTestingConfig:
>       """
>       num_vfs: int = 1
>       max_num_vms: int = 2
> +    provisioning_mode: VfProvisioningMode = VfProvisioningMode.AUTO
>       scheduling_mode: VfSchedulingMode = VfSchedulingMode.INFINITE
>   
>       auto_poweron_vm: bool = True
> @@ -56,12 +59,14 @@ class VmmTestingConfig:
>       wa_reduce_vf_lmem: bool = False
>   
>       def __str__(self) -> str:
> -        return f'{self.num_vfs}VF'
> +        test_config_id = f'{self.num_vfs}VF-(P:{self.provisioning_mode.name} S:{self.scheduling_mode.name})'
> +        return test_config_id
>   
>       def __repr__(self) -> str:
>           return (f'\nVmmTestingConfig:'
>                   f'\nNum VFs = {self.num_vfs} / max num VMs = {self.max_num_vms}'
> -                f'\nVF scheduling mode = {self.scheduling_mode}'
> +                f'\nVF provisioning mode = {self.provisioning_mode.name}'
> +                f'\nVF scheduling mode = {self.scheduling_mode.name}'
>                   f'\nSetup flags:'
>                   f'\n\tVM - auto power-on = {self.auto_poweron_vm}'
>                   f'\n\tVM - auto DRM driver probe = {self.auto_probe_vm_driver}'
> @@ -107,7 +112,9 @@ class VmmTestingSetup:
>           # [vmtb_root]/vmm_flows/resources/wsim/ptl (last subdir is lowercase key/name from pci.GpuModel class)
>           self.wsim_wl_dir = vmtb_root_path / vmtb_config.config.wsim_wl_path / self.get_dut().gpu_model.name.lower()
>   
> -        self.vgpu_profile: VgpuProfile = self.get_vgpu_profile()
> +        if (self.testing_config.provisioning_mode is VfProvisioningMode.VGPU_PROFILE
> +            or self.testing_config.scheduling_mode is not VfSchedulingMode.INFINITE):
> +            self.vgpu_profile: VgpuProfile = self.get_vgpu_profile()
>   
>           # Start maximum requested number of VMs, but not more than VFs supported by the given vGPU profile
>           self.vms: typing.List[VirtualMachine] = [
> @@ -115,7 +122,7 @@ class VmmTestingSetup:
>                              vmtb_config.get_guest_config().driver,
>                              vmtb_config.get_guest_config().igt_config,
>                              vf_migration_support)
> -            for vm_idx in range(min(self.vgpu_profile.num_vfs, self.testing_config.max_num_vms))]
> +            for vm_idx in range(min(self.testing_config.num_vfs, self.testing_config.max_num_vms))]
>   
>       def get_vgpu_profile(self) -> VgpuProfile:
>           configurator = VgpuProfileConfigurator(self.vgpu_profiles_dir, self.get_dut().gpu_model)
> @@ -126,8 +133,6 @@ class VmmTestingSetup:
>               logger.error("Suitable vGPU profile not found: %s", exc)
>               raise exceptions.VgpuProfileError('Invalid test setup - vGPU profile not found!')
>   
> -        vgpu_profile.print_parameters()
> -
>           return vgpu_profile
>   
>       def get_dut(self) -> Device:
> @@ -224,20 +229,35 @@ def fixture_setup_vms(get_vmtb_config, get_cmdline_config, get_host, request):
>       ts: VmmTestingSetup = VmmTestingSetup(get_vmtb_config, get_cmdline_config, host, tc)
>   
>       device: Device = ts.get_dut()
> -    num_vfs = ts.vgpu_profile.num_vfs
> +    num_vfs = ts.testing_config.num_vfs
>       num_vms = ts.get_num_vms()
>   
>       logger.info('[Test setup: %sVF-%sVM]', num_vfs, num_vms)
>   
> -    # XXX: VF migration on discrete devices (with LMEM) is currently quite slow.
> -    # As a temporary workaround, reduce size of LMEM assigned to VFs to speed up a state save/load process.
> -    if tc.wa_reduce_vf_lmem and device.has_lmem():
> -        logger.debug("W/A: reduce VFs LMEM quota to accelerate state save/restore")
> -        org_vgpu_profile_vfLmem = ts.vgpu_profile.resources.vfLmem
> -        # Assign max 512 MB to VF
> -        ts.vgpu_profile.resources.vfLmem = min(ts.vgpu_profile.resources.vfLmem // 2, 536870912)
> -
> -    device.provision(ts.vgpu_profile)
> +    if ts.testing_config.provisioning_mode is VfProvisioningMode.VGPU_PROFILE:
> +        # XXX: Double migration is slow on discrete GPUs (with VRAM),
> +        # As a workaround, reduce VRAM size assigned to VFs to speed up a save process.
> +        # This w/a should be removed when a save/restore time improves.
> +        if tc.wa_reduce_vf_lmem and device.has_lmem():
> +            logger.debug("W/A: reduce VFs LMEM quota to accelerate state save")
> +            org_vgpu_profile_vfLmem = ts.vgpu_profile.resources.vfLmem
> +            # Assign max 512 MB to VF
> +            ts.vgpu_profile.resources.vfLmem = min(ts.vgpu_profile.resources.vfLmem // 2, 536870912)
> +
> +        ts.vgpu_profile.print_parameters()
> +        device.provision(ts.vgpu_profile)
> +
> +        # XXX: cleanup counterpart for VFs LMEM quota workaround:
> +        # restore original value after vGPU profile applied
> +        if tc.wa_reduce_vf_lmem and device.has_lmem():
> +            ts.vgpu_profile.resources.vfLmem = org_vgpu_profile_vfLmem
> +
> +    else:
> +        device.driver.set_auto_provisioning(True)
> +        if ts.testing_config.scheduling_mode is not VfSchedulingMode.INFINITE:
> +            # Auto provisioning with concrete scheduling (i.e. different than HW default: infinite)
> +            ts.vgpu_profile.print_scheduler_config()
> +            device.provision_scheduling(num_vfs, ts.vgpu_profile)
>   
>       assert device.create_vf(num_vfs) == num_vfs
>   
> @@ -257,10 +277,39 @@ def fixture_setup_vms(get_vmtb_config, get_cmdline_config, get_host, request):
>       yield ts
>   
>       logger.info('[Test teardown: %sVF-%sVM]', num_vfs, num_vms)
> -    # XXX: cleanup counterpart for VFs LMEM quota workaround - restore original value
> -    if tc.wa_reduce_vf_lmem and device.has_lmem():
> -        ts.vgpu_profile.resources.vfLmem = org_vgpu_profile_vfLmem
> +    ts.teardown()
>   
> +
> +# Obsolete fixtures 'create_Xhost_Yvm' - 'fixture_setup_vms' is preferred
> +@pytest.fixture(scope='function')
> +def create_1host_1vm(get_vmtb_config, get_cmdline_config, get_host):
> +    num_vfs, num_vms = 1, 1
> +    ts: VmmTestingSetup = VmmTestingSetup(get_vmtb_config, get_cmdline_config, get_host,
> +                                          VmmTestingConfig(num_vfs, num_vms))
> +
> +    logger.info('[Test setup: %sVF-%sVM]', num_vfs, num_vms)
> +    logger.debug(repr(ts.testing_config))
> +
> +    logger.info('[Test execution: %sVF-%sVM]', num_vfs, num_vms)
> +    yield ts
> +
> +    logger.info('[Test teardown: %sVF-%sVM]', num_vfs, num_vms)
> +    ts.teardown()
> +
> +
> +@pytest.fixture(scope='function')
> +def create_1host_2vm(get_vmtb_config, get_cmdline_config, get_host):
> +    num_vfs, num_vms = 2, 2
> +    ts: VmmTestingSetup = VmmTestingSetup(get_vmtb_config, get_cmdline_config, get_host,
> +                                          VmmTestingConfig(num_vfs, num_vms))
> +
> +    logger.info('[Test setup: %sVF-%sVM]', num_vfs, num_vms)
> +    logger.debug(repr(ts.testing_config))
> +
> +    logger.info('[Test execution: %sVF-%sVM]', num_vfs, num_vms)
> +    yield ts
> +
> +    logger.info('[Test teardown: %sVF-%sVM]', num_vfs, num_vms)
>       ts.teardown()
>   
>   
> diff --git a/tools/vmtb/vmm_flows/test_basic.py b/tools/vmtb/vmm_flows/test_basic.py
> index 1d3a68b36..9b8731273 100644
> --- a/tools/vmtb/vmm_flows/test_basic.py
> +++ b/tools/vmtb/vmm_flows/test_basic.py
> @@ -7,7 +7,7 @@ from typing import List, Tuple
>   
>   import pytest
>   
> -from bench.configurators.vgpu_profile_config import VfSchedulingMode
> +from bench.configurators.vgpu_profile_config import VfProvisioningMode, VfSchedulingMode
>   from bench.executors.gem_wsim import (ONE_CYCLE_DURATION_MS,
>                                         PREEMPT_10MS_WORKLOAD, GemWsim,
>                                         GemWsimResult,
> @@ -27,20 +27,23 @@ DELAY_FOR_WORKLOAD_SEC = 2 # Waiting gem_wsim to be running [seconds]
>   DELAY_FOR_RELOAD_SEC = 3 # Waiting before driver reloading [seconds]
>   
>   
> -def set_test_config(test_variants: List[Tuple[int, VfSchedulingMode]],
> +def set_test_config(test_variants: List[Tuple[int, VfProvisioningMode, VfSchedulingMode]],
>                       max_vms: int = 2, vf_driver_load: bool = True) -> List[VmmTestingConfig]:
>       """Helper function to provide a parametrized test with a list of test configuration variants."""
>       logger.debug("Init test variants: %s", test_variants)
>       test_configs: List[VmmTestingConfig] = []
>   
>       for config in test_variants:
> -        (num_vfs, scheduling_mode) = config
> -        test_configs.append(VmmTestingConfig(num_vfs, max_vms, scheduling_mode, auto_probe_vm_driver=vf_driver_load))
> +        (num_vfs, provisioning_mode, scheduling_mode) = config
> +        test_configs.append(VmmTestingConfig(num_vfs, max_vms, provisioning_mode, scheduling_mode,
> +                                             auto_probe_vm_driver=vf_driver_load))
>   
>       return test_configs
>   
>   
> -test_variants_1 = [(1, VfSchedulingMode.DEFAULT_PROFILE), (2, VfSchedulingMode.DEFAULT_PROFILE)]
> +test_variants_1 = [(1, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
> +                   (2, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
> +                   (2, VfProvisioningMode.AUTO, VfSchedulingMode.INFINITE)]
>   
>   @pytest.mark.parametrize('setup_vms', set_test_config(test_variants_1), ids=idfn_test_config, indirect=['setup_vms'])
>   class TestVmSetup:
> @@ -60,8 +63,9 @@ class TestVmSetup:
>               assert driver_check(vm)
>   
>   
> -test_variants_2 = [(1, VfSchedulingMode.DEFAULT_PROFILE), (2, VfSchedulingMode.DEFAULT_PROFILE),
> -                   (4, VfSchedulingMode.DEFAULT_PROFILE)]
> +test_variants_2 = [(1, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
> +                   (2, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
> +                   (4, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE)]
>   
>   @pytest.mark.parametrize('setup_vms', set_test_config(test_variants_2), ids=idfn_test_config, indirect=['setup_vms'])
>   class TestVmWorkload:
> @@ -102,7 +106,8 @@ class TestVmWorkload:
>           logger.info("Execute wsim parallel on VMs - results: %s", result)
>   
>   
> -test_variants_3 = [(2, VfSchedulingMode.DEFAULT_PROFILE), (4, VfSchedulingMode.DEFAULT_PROFILE)]
> +test_variants_3 = [(2, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE),
> +                   (4, VfProvisioningMode.VGPU_PROFILE, VfSchedulingMode.DEFAULT_PROFILE)]
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>   
>   @pytest.mark.parametrize('setup_vms', set_test_config(test_variants=test_variants_3, max_vms=4, vf_driver_load=False),
>                            ids = idfn_test_config, indirect=['setup_vms'])
