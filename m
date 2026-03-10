Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DE2EB1043
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638CB10E235;
	Tue, 10 Mar 2026 10:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dl5EI+cd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E3C10E235
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773139511; x=1804675511;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HTb0W6KSFmQ3ZeEWIxSzW4WGlwPJvMLkpsaeCcGHBhM=;
 b=dl5EI+cdiMP8/X+VE+frP1ORwQjkRqHEh04Jfqw8xYTGdB6Sveocn3kV
 erjvKEqdpbRnJnJWLoNd3VhMm+6NhdyPof0y/xSpJ8R3UKSxHKUALC6mO
 TzomZmxEAMkTtLl9H3AwLlbIpsPpQBjMgDBub0si8Vk6+/icb2mlKD5Hn
 bxDrECneMesZgW600qk9x0sjROMwwAIhup3pPLrrVmQ+lcY3UXeFzQa1f
 ZyhHNvaBvC9WaAKUsjPopkrP/XvIosBg+7quKThjh/Oz6g1/MTGpthZcA
 GAtZFUFmgLCdns1afBSuA/YmW3LK77DF/AvEP+tpd5Y4MdXYEE+7CWy1j Q==;
X-CSE-ConnectionGUID: tA2pJl8PQFKNb0/ug7PMRQ==
X-CSE-MsgGUID: 9J6/SYkDQFyfGep/QKKp6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="77787855"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="77787855"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:45:10 -0700
X-CSE-ConnectionGUID: VDIwhkovReaXMAST45Jl7g==
X-CSE-MsgGUID: HrFr0TxAQjqPmKJgEAwQNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="215474436"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.135])
 ([172.28.180.135])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:45:09 -0700
Message-ID: <265e75e3-0f4d-469d-af04-b3dffb8788d3@linux.intel.com>
Date: Tue, 10 Mar 2026 11:45:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 07/10] tools/vmtb: Introduce VirtualDevice class
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
 <20260224075027.2409675-8-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260224075027.2409675-8-adam.miszczak@linux.intel.com>
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
> VirtualDevice represents GPU device enumerated on VM/Guest OS
> (composited into VirtualMachine class).
> Implement methods common of all devices like bind/unbind driver,
> number of GTs as well as VF specific getter of assigned resources
> read from debugfs self_config file.
> Similarly to physical Device, PciInfo instance with PCI BDF,
> Device ID and minor device is embedded as inner class.
>
> VirtualDevice needs to keep a reference to the VirtualMachine
> (and pass it to VfDriver) to access Guest OS via QEMU Guest-Agent
> running on VM level.
>
> Additionally:
> - add dir_list function to a common MachineInterface
>    (used currently by VirtualDevice)
> - remove physical device specific functions:
>    create/remove VF from a base DeviceInterface class.
> - adjust debugfs/self_config reader
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/bench/machines/device_interface.py |  14 +-
>   tools/vmtb/bench/machines/host.py             |   5 +
>   .../vmtb/bench/machines/machine_interface.py  |   6 +-
>   tools/vmtb/bench/machines/virtual/device.py   | 179 ++++++++++++++++++
>   tools/vmtb/bench/machines/virtual/vm.py       |   5 +
>   5 files changed, 198 insertions(+), 11 deletions(-)
>   create mode 100644 tools/vmtb/bench/machines/virtual/device.py
>
> diff --git a/tools/vmtb/bench/machines/device_interface.py b/tools/vmtb/bench/machines/device_interface.py
> index e8d4068e8..0eff493f0 100644
> --- a/tools/vmtb/bench/machines/device_interface.py
> +++ b/tools/vmtb/bench/machines/device_interface.py
> @@ -1,19 +1,13 @@
>   # SPDX-License-Identifier: MIT
> -# Copyright © 2024 Intel Corporation
> +# Copyright © 2024-2026 Intel Corporation
>   
>   import abc
>   
>   
>   class DeviceInterface(abc.ABC):
> -
> -    @abc.abstractmethod
> -    def create_vf(self, num: int) -> int:
> -        raise NotImplementedError
> -
> -    @abc.abstractmethod
> -    def remove_vfs(self) -> int:
> -        raise NotImplementedError
> -
> +    """Base class for devices (Physical and Virtual).
> +    Provide common operations for all devices like bind/unbind driver.
> +    """
>       @abc.abstractmethod
>       def bind_driver(self) -> None:
>           raise NotImplementedError
> diff --git a/tools/vmtb/bench/machines/host.py b/tools/vmtb/bench/machines/host.py
> index aecc7709a..b6cfb62ef 100644
> --- a/tools/vmtb/bench/machines/host.py
> +++ b/tools/vmtb/bench/machines/host.py
> @@ -99,6 +99,11 @@ class Host(MachineInterface):
>       def dir_exists(self, path: str) -> bool:
>           return Path(path).is_dir()
>   
> +    def dir_list(self, path: str) -> typing.List[str]:
> +        # TODO: implement, currently no-op to fulfill MachineInterface requirement
> +        logger.warning("Host.dir_list() is not implemented yet!")
> +        return []
> +
>       def get_drm_driver_name(self) -> str:
>           # Used as a part of MachineInterface for helpers
>           return self.drm_driver_name
> diff --git a/tools/vmtb/bench/machines/machine_interface.py b/tools/vmtb/bench/machines/machine_interface.py
> index 8daa2cda3..d67c3db74 100644
> --- a/tools/vmtb/bench/machines/machine_interface.py
> +++ b/tools/vmtb/bench/machines/machine_interface.py
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: MIT
> -# Copyright © 2024 Intel Corporation
> +# Copyright © 2024-2026 Intel Corporation
>   
>   import abc
>   import enum
> @@ -56,6 +56,10 @@ class MachineInterface(metaclass=abc.ABCMeta):
>       def dir_exists(self, path: str) -> bool:
>           raise NotImplementedError
>   
> +    @abc.abstractmethod
> +    def dir_list(self, path: str) -> typing.List[str]:
> +        raise NotImplementedError
> +
>       @abc.abstractmethod
>       def get_drm_driver_name(self) -> str:
>           raise NotImplementedError
> diff --git a/tools/vmtb/bench/machines/virtual/device.py b/tools/vmtb/bench/machines/virtual/device.py
> new file mode 100644
> index 000000000..c838db59d
> --- /dev/null
> +++ b/tools/vmtb/bench/machines/virtual/device.py
> @@ -0,0 +1,179 @@
> +# SPDX-License-Identifier: MIT
> +# Copyright © 2025-2026 Intel Corporation
> +
> +import logging
> +import re
> +import typing
> +
> +from bench import exceptions
> +from bench.configurators import pci
> +from bench.drivers.driver_interface import DriverInterface, VfDriver
> +from bench.machines.device_interface import DeviceInterface
> +from bench.machines.machine_interface import MachineInterface
> +
> +logger = logging.getLogger('VirtualDevice')
> +
> +
> +class VirtualDevice(DeviceInterface):
> +    class PciInfo:
> +        def __init__(self, bdf: str, vm: MachineInterface) -> None:
> +            self.bdf: str = bdf
> +            self.vm: MachineInterface = vm
> +            self.devid: str = self.get_device_id(self.bdf)
> +            self.minor_number: int = self.get_device_minor_number(self.bdf)
> +
> +        def get_device_minor_number(self, bdf: str) -> int:
> +            drm_dir = f'/sys/bus/pci/devices/{bdf}/drm'
> +
> +            for dir_name in self.vm.dir_list(drm_dir):
> +                if 'card' in dir_name:
> +                    index_match = re.match(r'card(?P<card_index>\d+)', dir_name)
> +                    if index_match:
> +                        return int(index_match.group('card_index'))
> +
> +            logger.error("Could not determine minor number (card index) for device %s", bdf)
> +            raise exceptions.HostError(f'Could not determine minor number (card index) for device {bdf}')
> +
> +        def get_device_id(self, bdf: str) -> str:
> +            device_file = f'/sys/bus/pci/devices/{bdf}/device'
> +            devid = self.vm.read_file_content(device_file)
> +
> +            return devid.strip()[2:] # Strip whitespaces and 0x
> +
> +    def __init__(self, bdf: str, vm: MachineInterface) -> None:
> +        self.pci_info = self.PciInfo(bdf, vm)
> +        self.gpu_model = pci.get_gpu_model(self.pci_info.devid)
> +        # Reference to VirtualMachine - required for Guest-Agent use (e.g. guest file read/write):
> +        self.vm: MachineInterface = vm
> +        self.driver: DriverInterface = VfDriver(self.pci_info.bdf, self.vm)
> +
> +        # Resources provisioned to the VF/VM:
> +        self._lmem_size: typing.Optional[int] = None
> +        self._ggtt_size: typing.Optional[int] = None
> +        self._contexts: typing.Optional[int] = None
> +        self._doorbells: typing.Optional[int] = None
> +        # Tile mask is relevant for multi-tile devices:
> +        self._tile_mask: typing.Optional[int] = None
> +
> +    def __str__(self) -> str:
> +        return f'VirtualDevice-{self.pci_info.bdf}'
> +
> +    def bind_driver(self) -> None:
> +        logger.debug("Bind %s driver to virtual device - PCI BDF: %s",
> +                     self.vm.get_drm_driver_name(), self.pci_info.bdf)
> +        self.driver.bind()
> +
> +    def unbind_driver(self) -> None:
> +        logger.debug("Unbind %s driver from virtual device - PCI BDF: %s",
> +                     self.vm.get_drm_driver_name(), self.pci_info.bdf)
> +        self.driver.unbind()
> +
> +    @property
> +    def lmem_size(self) -> typing.Optional[int]:
> +        if self._lmem_size is None:
> +            self.get_debugfs_selfconfig()
> +
> +        return self._lmem_size
> +
> +    @property
> +    def ggtt_size(self) -> typing.Optional[int]:
> +        if self._ggtt_size is None:
> +            self.get_debugfs_selfconfig()
> +
> +        return self._ggtt_size
> +
> +    @property
> +    def contexts(self) -> typing.Optional[int]:
> +        if self._contexts is None:
> +            self.get_debugfs_selfconfig()
> +
> +        return self._contexts
> +
> +    @property
> +    def doorbells(self) -> typing.Optional[int]:
> +        if self._doorbells is None:
> +            self.get_debugfs_selfconfig()
> +
> +        return self._doorbells
> +
> +    @property
> +    def tile_mask(self) -> typing.Optional[int]:
> +        if self._tile_mask is None:
> +            self.get_debugfs_selfconfig()
> +
> +        return self._tile_mask
> +
> +    def get_num_gts(self) -> int:
> +        """Get number of GTs for a device based on exposed sysfs gt nodes."""
> +        gt_num = 0
> +        # Fixme: tile0 only at the moment, add support for multiple tiles if needed
> +        path = self.driver.sysfs_device_path / 'tile0'
> +
> +        if self.vm.dir_exists(str(path / 'gt')):
> +            gt_num = 1
> +        else:
> +            while self.vm.dir_exists(str(path / f'gt{gt_num}')):
> +                gt_num += 1
> +
> +        return gt_num
> +
> +    # helper_convert_units_to_bytes - convert size with units to bytes
> +    # @size_str: multiple-byte unit size with suffix (K/M/G)
> +    # Returns: size in bytes
> +    # TODO: function perhaps could be moved to some new utils module
> +    # improve - consider regex to handle various formats eg. both M and MB
> +    def helper_convert_units_to_bytes(self, size_str: str) -> int:
> +        size_str = size_str.upper()
> +        size_int = 0
> +
> +        if size_str.endswith('B'):
> +            size_int = int(size_str[0:-1])
> +        elif size_str.endswith('K'):
> +            size_int = int(size_str[0:-1]) * 1024
> +        elif size_str.endswith('M'):
> +            size_int = int(size_str[0:-1]) * 1024**2
> +        elif size_str.endswith('G'):
> +            size_int = int(size_str[0:-1]) * 1024**3
> +
> +        return size_int
> +
> +    # __parse_selfconfig_size - parses size string from debugfs/self_config
> +    # GGTT/LMEM size on xe has the following format:
> +    # GGTT size:      536870912 (512 MiB)
> +    # whereas on i915 (unit suffix):
> +    # GGTT size:     524288K
> +    # @size_str: size string read from self_config file
> +    # (with unit suffix (B/K/M/G) or in bytes (without suffix))
> +    # Returns: size in bytes
> +    def __parse_selfconfig_size(self, size_str: str) -> int:
> +        retval = 0
> +        size_match = re.search(r'(?P<size_units>^\d+[BKMG])|(?P<size_bytes>^\d+)', size_str.strip())
> +        if size_match:
> +            if size_match.group('size_units'):
> +                # i915 specific format (in B/K/M/G units)
> +                retval = self.helper_convert_units_to_bytes(size_match.group('size_units'))
> +            elif size_match.group('size_bytes'):
> +                # Xe specific format (in Bytes)
> +                retval = int(size_match.group('size_bytes'))
> +            else:
> +                logger.warning("Unexpected size pattern match!")
> +
> +        return retval
> +
> +    def get_debugfs_selfconfig(self, gt_num: int = 0) -> None:
> +        """Read hard resources allocated to VF from debugfs selfconfig file."""
> +        out = self.driver.read_debugfs(f'gt{gt_num}/vf/self_config')
> +
> +        for line in out.splitlines():
> +            param, value = line.split(':')
> +
> +            if param == 'GGTT size':
> +                self._ggtt_size = self.__parse_selfconfig_size(value)
> +            elif param == 'LMEM size':
> +                self._lmem_size = self.__parse_selfconfig_size(value)
> +            elif param.find('contexts') != -1:
> +                self._contexts = int(value)
> +            elif param.find('doorbells') != -1:
> +                self._doorbells = int(value)
> +            elif param == 'tile mask':
> +                self._tile_mask = int(value, base=16)
> diff --git a/tools/vmtb/bench/machines/virtual/vm.py b/tools/vmtb/bench/machines/virtual/vm.py
> index 9f4ca1de7..312e87e4b 100644
> --- a/tools/vmtb/bench/machines/virtual/vm.py
> +++ b/tools/vmtb/bench/machines/virtual/vm.py
> @@ -518,6 +518,11 @@ class VirtualMachine(MachineInterface):
>               return False
>           return True
>   
> +    def dir_list(self, path: str) -> typing.List[str]:
> +        # TODO: implement, currently no-op to fulfill MachineInterface requirement
> +        logger.warning("VirtualMachine.dir_list() is not implemented yet!")
> +        return []
> +
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>       def link_exists(self, path: str) -> bool:
>           pid = self.execute(f'/bin/sh -c "[ -h {path} ]"')
>           status = self.execute_wait(pid)
