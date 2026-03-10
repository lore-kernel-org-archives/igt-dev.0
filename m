Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CFBEB1042
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F5B10E214;
	Tue, 10 Mar 2026 10:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvfv6ij8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2985F10E214
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773138206; x=1804674206;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b0COpVZfMQqOj8JLrPIrXQN0EfT2EY3a0b1I2xmrNUs=;
 b=cvfv6ij8UEScateJzyWYRTFrpjGy/VGZ4y8WdqmvPsJHNGhNNCvUOL/9
 PmaJh0fKQntvLAiJzWCLJZrHmBT9xvJYhPiHKFq71YpxFS6E8NubS2VZ7
 Z3hfEOyZQ9VUpzJ9kkHlwyicuiCiIDSQa1tEWiYxUJ6phmNSkxWOKJub9
 HKFjtjNJBEXPQb/YK1ghKEcd99SHwgXfKCTO5N3KaRImb2mkhtYfziOEI
 Uy91cuHq5gCt7C/oo71DI8TF5eYHP/MJriQlHTLG6Bi9zMPJ3N0niMMW+
 4U4vurXxINNN24S0BwXf1GSelrz0em9+OJCGIAorUrfAMQu8Nke53DqaP w==;
X-CSE-ConnectionGUID: xh9/ZOtWRbKdjGh7BPQOig==
X-CSE-MsgGUID: byc5C4vKStW5WfyUE0jlow==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="61752233"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="61752233"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:23:24 -0700
X-CSE-ConnectionGUID: BbGcYgUNT7Wca4ExyDzEZQ==
X-CSE-MsgGUID: W5zxieSOQkGB9EZyrSEWRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="215469179"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.135])
 ([172.28.180.135])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:23:23 -0700
Message-ID: <fd3379a5-487d-4707-96c5-13f72dc746e8@linux.intel.com>
Date: Tue, 10 Mar 2026 11:22:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 01/10] tools/vmtb: Update QEMU parameters
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
 <20260224075027.2409675-2-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260224075027.2409675-2-adam.miszczak@linux.intel.com>
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
> 1. Enable SSH access to VM/Guest OS
>
> Add QEMU options to open guest SSH connection:
> - enable default emulated NIC
> - redirect host's TCP port 10000+N connections to
>    guest's SSH server on port 22
>    (where N is booted VM number, starting from 0)
>
> For example, login to VM0 (from host) as:
> $ ssh -p 10000 gta@localhost
>
> 2. Enable migration based on VFIO driver
>
> Set 'enable-migration' option introducing QEMU VF migration support.
>
> VF migration is supported by a vendor specific VFIO driver (xe-vfio-pci).
> In case of regular 'vfio-pci', QEMU command option 'enable-migration'
> should not be explicitly enabled to prevent VM start failure:
> 'vfio 0000:00:02.1: VFIO migration is not supported in kernel'
>
> 3. Disable QEMU emulated VGA card
>
> Disable standard emulated VGA on QEMU VMs to avoid issues
> emerging from a bochs DRM driver.
> Standard VGA is enumerated as PCI device BDF 00:02.0
> on minor 0 (drm/card0) - this causes troubles with VirtualMachine class
> reserving card0 for passed VF.
> Also, bochs driver obscures guest dmesg with verbose debug logs.
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/bench/machines/virtual/vm.py | 14 ++++++++++----
>   tools/vmtb/vmm_flows/conftest.py        | 25 +++++++++++++++----------
>   2 files changed, 25 insertions(+), 14 deletions(-)
>
> diff --git a/tools/vmtb/bench/machines/virtual/vm.py b/tools/vmtb/bench/machines/virtual/vm.py
> index e75de590d..9f4ca1de7 100644
> --- a/tools/vmtb/bench/machines/virtual/vm.py
> +++ b/tools/vmtb/bench/machines/virtual/vm.py
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: MIT
> -# Copyright © 2024 Intel Corporation
> +# Copyright © 2024-2026 Intel Corporation
>   
>   import base64
>   import json
> @@ -58,7 +58,8 @@ class VirtualMachine(MachineInterface):
>   
>               return timeout_wrapper
>   
> -    def __init__(self, vm_number: int, backing_image: str, driver: str, igt_config: VmtbIgtConfig) -> None:
> +    def __init__(self, vm_number: int, backing_image: str, driver: str,
> +                 igt_config: VmtbIgtConfig, vf_migration_support: bool) -> None:
>           self.vf_bdf: typing.Optional[str] = None
>           self.process: typing.Optional[subprocess.Popen] = None
>           self.vmnum: int = vm_number
> @@ -68,6 +69,7 @@ class VirtualMachine(MachineInterface):
>           self.qmp_sockpath = posixpath.join('/tmp', f'mon{self.vmnum}.sock')
>           self.drm_driver_name: str = driver
>           self.igt_config: VmtbIgtConfig = igt_config
> +        self.vf_migration: bool = vf_migration_support
>   
>           if not posixpath.exists(backing_image):
>               logger.error('No image for VM%s', self.vmnum)
> @@ -153,6 +155,9 @@ class VirtualMachine(MachineInterface):
>                      '-vnc', f':{self.vmnum}',
>                      '-serial', 'stdio',
>                      '-m', '4096',
> +                   '-vga', 'none',
> +                   '-net', 'nic',
> +                   '-net', f'user,hostfwd=tcp::{10000 + self.vmnum}-:22',
>                      '-drive', f'file={self.image if not self.migrate_destination_vm else self.migrate_source_image}',
>                      '-chardev', f'socket,path={self.questagent_sockpath},server=on,wait=off,id=qga{self.vmnum}',
>                      '-device', 'virtio-serial',
> @@ -161,8 +166,9 @@ class VirtualMachine(MachineInterface):
>                      '-mon', f'chardev=mon{self.vmnum},mode=control']
>   
>           if self.vf_bdf:
> -            command.extend(['-enable-kvm', '-cpu', 'host'])
> -            command.extend(['-device', f'vfio-pci,host={self.vf_bdf},enable-migration=on'])
> +            command.extend(['-enable-kvm', '-cpu', 'host', '-device', f'vfio-pci,host={self.vf_bdf}'])
> +            if self.vf_migration:
> +                command[-1] += ',enable-migration=on'
>   
>           if self.migrate_destination_vm:
>               # If VM is migration destination - run in stopped/prelaunch state (explicit resume required)
> diff --git a/tools/vmtb/vmm_flows/conftest.py b/tools/vmtb/vmm_flows/conftest.py
> index 7b6eacd51..675312253 100644
> --- a/tools/vmtb/vmm_flows/conftest.py
> +++ b/tools/vmtb/vmm_flows/conftest.py
> @@ -1,26 +1,25 @@
>   # SPDX-License-Identifier: MIT
> -# Copyright © 2024 Intel Corporation
> +# Copyright © 2024-2026 Intel Corporation
>   
>   import json
>   import logging
>   import re
>   import typing
> -
>   from dataclasses import dataclass
>   from pathlib import Path
>   
>   import pytest
>   
>   from bench import exceptions
> -from bench.helpers.helpers import (modprobe_driver, modprobe_driver_check)
> -from bench.helpers.log import HOST_DMESG_FILE
> -from bench.configurators.vgpu_profile_config import VgpuProfileConfigurator, VfSchedulingMode
>   from bench.configurators.vgpu_profile import VgpuProfile
> +from bench.configurators.vgpu_profile_config import (VfSchedulingMode,
> +                                                     VgpuProfileConfigurator)
>   from bench.configurators.vmtb_config import VmtbConfigurator
> -from bench.machines.host import Host, Device
> +from bench.helpers.helpers import modprobe_driver, modprobe_driver_check
> +from bench.helpers.log import HOST_DMESG_FILE
> +from bench.machines.host import Device, Host
>   from bench.machines.virtual.vm import VirtualMachine
>   
> -
>   logger = logging.getLogger('Conftest')
>   
>   
> @@ -89,15 +88,20 @@ class VmmTestingSetup:
>           self.host.load_drivers()
>           self.host.discover_devices()
>   
> +        # VF migration requires vendor specific VFIO driver (e.g. xe-vfio-pci)
> +        vf_migration_support: bool = self.host.is_driver_loaded(f'{self.host.drm_driver_name}-vfio-pci')
> +
>           logger.info("\nDUT info:"
>                       "\n\tCard index: %s"
>                       "\n\tPCI BDF: %s "
>                       "\n\tDevice ID: %s (%s)"
> -                    "\n\tHost DRM driver: %s",
> +                    "\n\tHost DRM driver: %s"
> +                    "\n\tVF migration support: %s",
>                       self.host.dut_index,
>                       self.get_dut().pci_info.bdf,
>                       self.get_dut().pci_info.devid, self.get_dut().gpu_model,
> -                    self.get_dut().driver.get_name())
> +                    self.get_dut().driver.get_name(),
> +                    vf_migration_support)
>   
>           self.vgpu_profile: VgpuProfile = self.get_vgpu_profile()
>   
> @@ -105,7 +109,8 @@ class VmmTestingSetup:
>           self.vms: typing.List[VirtualMachine] = [
>               VirtualMachine(vm_idx, self.guest_os_image,
>                              vmtb_config.get_guest_config().driver,
> -                           vmtb_config.get_guest_config().igt_config)
> +                           vmtb_config.get_guest_config().igt_config,
> +                           vf_migration_support)
>               for vm_idx in range(min(self.vgpu_profile.num_vfs, self.testing_config.max_num_vms))]
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>   
>       def get_vgpu_profile(self) -> VgpuProfile:
