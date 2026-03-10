Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F451EB1049
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:43:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA3D89EF7;
	Tue, 10 Mar 2026 10:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWmn1rPi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B960E89EF7
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773139396; x=1804675396;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oqXKaiji88IKsM9hefYMe8K4br+zg1NQeh0dWMYjYNM=;
 b=JWmn1rPiKnoEiB+ZgrjnmBH9BQGGVEquQgPNpcGTlL7etznn+C6vGUTA
 n6qIhClOYKgWLClJ1s9zr+Ue9sQ3PVRNbB+sYBI4lcm0d0crwjnOZmPP3
 GGJTlVF5BPqpVY4DZX/AB+oJm5BQVSWh9jTLKzPoA6Kj1TM3e1PE60Ae3
 CxFCCoPgnvmU9HZenlXWBUqxEZUvY5fVptk9bsbHtDPmaPXo+1moCmqwJ
 DYzidPcqxjsRmojiWU4cDnt9Zlg7BbRrcNmoPNtuWyhIHPJRZsp5laqA/
 yHcSZeOUZQHPHyUX+WP1bm7M9yJIIKrTu3SjnqNhzQ70U8ANSlacw3o0s Q==;
X-CSE-ConnectionGUID: f3rJh9rvQby4Nuo6IrFovQ==
X-CSE-MsgGUID: IltsK+8dTAWiVXWyKv788A==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74223502"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74223502"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:43:15 -0700
X-CSE-ConnectionGUID: b5YCRnZBQKWNRdwY9O3AIQ==
X-CSE-MsgGUID: m8nVKo0kSTSYBnsCNVHMWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224758421"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.135])
 ([172.28.180.135])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:43:14 -0700
Message-ID: <ef0d162e-0e46-494f-9b8a-04a1f15748a1@linux.intel.com>
Date: Tue, 10 Mar 2026 11:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 06/10] tools/vmtb: Refactor driver interfaces
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
 <20260224075027.2409675-7-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260224075027.2409675-7-adam.miszczak@linux.intel.com>
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
> Introduce new common driver interface - base class for all DRM drivers.
> DriverInterface exposes basic functions like bind, unbind or reset
> and is extended by specialized classes representing PF and VF drivers.
> Both PF and VF driver classes implement methods to read/write sysfs/debugfs:
> a host uses standard Python's pathlib for filesystem operations,
> guest access it over QEMU Guest-Agent commands.
> Additionally, PfDriverInterface publishes functions to enable
> and provision VFs, configure scheduling etc.
> Concrete implementation of PF driver is provided by Xe driver class.
>
> Additional adjustments for xe provisioning:
> - scheduling configured via sysfs SRIOV admin tree:
>    /sys/bus/pci/drivers/xe/[BDF]/sriov_admin
> - support bulk settings (PF and all VFs) for EQ, PT and scheduling priority
> - align with a new 'sched_priority' file format:
>    low/normal/high strings instead of integers
> - remove 'sched_if_idle' attribute support - enable strict scheduling
>    via 'normal' scheduling priority
> - support new debugfs 'restore_auto_provisioning' attribute
>    to reenable auto-provisioning mode.
> - set LMEM and GGTT quotas exclusively on a root tile
> - in auto resources provisioning mode, setting scheduling parameters
>    should follow VFs enabling
>    (otherwise xe KMD sets custom provisioning mode for resources as well)
> - Device.reset_provisioning() clears (zeroes) provisioning attributes
>    and restores auto-provisioning
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/bench/drivers/driver_interface.py | 179 +++++++++++++---
>   tools/vmtb/bench/drivers/xe.py               | 207 ++++++++-----------
>   tools/vmtb/bench/machines/physical/device.py |  96 +++++----
>   tools/vmtb/vmm_flows/conftest.py             |  14 +-
>   4 files changed, 301 insertions(+), 195 deletions(-)
>
> diff --git a/tools/vmtb/bench/drivers/driver_interface.py b/tools/vmtb/bench/drivers/driver_interface.py
> index 3026fece7..0b0bd5abb 100644
> --- a/tools/vmtb/bench/drivers/driver_interface.py
> +++ b/tools/vmtb/bench/drivers/driver_interface.py
> @@ -3,13 +3,21 @@
>   
>   import abc
>   import enum
> +import logging
>   import typing
> +from pathlib import Path
>   
> +from bench import exceptions
> +from bench.machines.machine_interface import MachineInterface
> +from bench.helpers.log import LogDecorators
>   
> -class SchedulingPriority(enum.Enum):
> -    LOW = 0
> -    NORMAL = 1
> -    HIGH = 2
> +logger = logging.getLogger('DriverInterface')
> +
> +
> +class SchedulingPriority(str, enum.Enum):
> +    LOW = 'low'
> +    NORMAL = 'normal'
> +    HIGH = 'high'
>   
>   
>   class VfControl(str, enum.Enum):
> @@ -23,20 +31,85 @@ class VfControl(str, enum.Enum):
>   
>   
>   class DriverInterface(abc.ABC):
> +    """Base class for DRM drivers (Physical and Virtual).
> +    Provide common operations for all drivers like bind/unbind, reset etc.
> +    """
> +    def __init__(self, bdf: str) -> None:
> +        self.pci_bdf = bdf
> +        self.sysfs_device_path = Path('/sys/bus/pci/devices') / self.pci_bdf
> +        self.sysfs_driver_path = Path('/sys/bus/pci/drivers') / self.get_name()
> +        self.debugfs_path = Path('/sys/kernel/debug/dri') / self.pci_bdf
> +
> +    @abc.abstractmethod
> +    def get_name(self) -> str:
> +        raise NotImplementedError
> +
> +    @abc.abstractmethod
> +    def write_sysfs(self, path: Path, value: str) -> None:
> +        raise NotImplementedError
>   
> -    @staticmethod
>       @abc.abstractmethod
> -    def get_name() -> str:
> +    def read_sysfs(self, path: Path) -> str:
>           raise NotImplementedError
>   
>       @abc.abstractmethod
> -    def bind(self, bdf: str) -> None:
> +    def write_debugfs(self, file: str, value: str) -> None:
>           raise NotImplementedError
>   
>       @abc.abstractmethod
> -    def unbind(self, bdf: str) -> None:
> +    def read_debugfs(self, file: str) -> str:
>           raise NotImplementedError
>   
> +    @LogDecorators.parse_kmsg
> +    def bind(self) -> None:
> +        self.write_sysfs((self.sysfs_driver_path / 'bind'), self.pci_bdf)
> +
> +    @LogDecorators.parse_kmsg
> +    def unbind(self) -> None:
> +        self.write_sysfs((self.sysfs_driver_path / 'unbind'), self.pci_bdf)
> +
> +    @LogDecorators.parse_kmsg
> +    def flr(self) -> None:
> +        self.write_sysfs((self.sysfs_device_path / 'reset'), '1')
> +
> +
> +class PfDriverInterface(DriverInterface, abc.ABC):
> +    """Base class for PF drivers, extends common DriverInterface base class.
> +    Provide operations specific for PF drivers like read/write sysfs on Host,
> +    set number of VFs to enable, set/get provisioning related attributes etc.
> +    """
> +    @LogDecorators.parse_kmsg
> +    def __write_fs(self, path: Path, value: str) -> None:
> +        try:
> +            path.write_text(value)
> +            logger.debug("Write: %s -> %s", value, path)
> +        except Exception as exc:
> +            logger.error("Unable to write %s -> %s", value, path)
> +            raise exceptions.HostError(f'Could not write to {path}. Error: {exc}') from exc
> +
> +    @LogDecorators.parse_kmsg
> +    def __read_fs(self, path: Path) -> str:
> +        try:
> +            ret = path.read_text()
> +        except Exception as exc:
> +            logger.error("Unable to read %s", path)
> +            raise exceptions.HostError(f'Could not read from {path}. Error: {exc}') from exc
> +
> +        logger.debug("Read: %s -> %s", path, ret.strip())
> +        return ret
> +
> +    def write_sysfs(self, path: Path, value: str) -> None:
> +        self.__write_fs(path, value)
> +
> +    def read_sysfs(self, path: Path) -> str:
> +        return str(self.__read_fs(path))
> +
> +    def write_debugfs(self, file: str, value: str) -> None:
> +        self.__write_fs(self.debugfs_path / file, value)
> +
> +    def read_debugfs(self, file: str) -> str:
> +        return str(self.__read_fs(self.debugfs_path / file))
> +
>       @abc.abstractmethod
>       def get_totalvfs(self) -> int:
>           raise NotImplementedError
> @@ -70,17 +143,14 @@ class DriverInterface(abc.ABC):
>           raise NotImplementedError
>   
>       @abc.abstractmethod
> -    def get_auto_provisioning(self) -> bool:
> -        raise NotImplementedError
> -
> -    @abc.abstractmethod
> -    def set_auto_provisioning(self, val: bool) -> None:
> +    def restore_auto_provisioning(self) -> None:
>           raise NotImplementedError
>   
>       @abc.abstractmethod
>       def cancel_work(self) -> None:
>           raise NotImplementedError
>   
> +    # PF provisioning
>       @abc.abstractmethod
>       def get_pf_ggtt_spare(self, gt_num: int) -> int:
>           raise NotImplementedError
> @@ -113,14 +183,6 @@ class DriverInterface(abc.ABC):
>       def set_pf_doorbells_spare(self, gt_num: int, val: int) -> None:
>           raise NotImplementedError
>   
> -    @abc.abstractmethod
> -    def get_pf_sched_priority(self, gt_num: int) -> SchedulingPriority:
> -        raise NotImplementedError
> -
> -    @abc.abstractmethod
> -    def set_pf_sched_priority(self, gt_num: int, val: SchedulingPriority) -> None:
> -        raise NotImplementedError
> -
>       @abc.abstractmethod
>       def get_pf_policy_reset_engine(self, gt_num: int) -> int:
>           raise NotImplementedError
> @@ -137,14 +199,7 @@ class DriverInterface(abc.ABC):
>       def set_pf_policy_sample_period_ms(self, gt_num: int, val: int) -> None:
>           raise NotImplementedError
>   
> -    @abc.abstractmethod
> -    def get_pf_policy_sched_if_idle(self, gt_num: int) -> int:
> -        raise NotImplementedError
> -
> -    @abc.abstractmethod
> -    def set_pf_policy_sched_if_idle(self, gt_num: int, val: int) -> None:
> -        raise NotImplementedError
> -
> +    # VF provisioning
>       @abc.abstractmethod
>       def get_ggtt_quota(self, vf_num: int, gt_num: int) -> int:
>           raise NotImplementedError
> @@ -177,20 +232,53 @@ class DriverInterface(abc.ABC):
>       def set_doorbells_quota(self, vf_num: int, gt_num: int, val: int) -> None:
>           raise NotImplementedError
>   
> +    # Scheduling provisioning
> +    @abc.abstractmethod
> +    def get_exec_quantum_ms(self, fn_num: int) -> int:
> +        "Get execution quantum (ms) for PF/VF (EQ/exec_quantum_ms)."
> +        raise NotImplementedError
> +
> +    @abc.abstractmethod
> +    def set_exec_quantum_ms(self, fn_num: int, val: int) -> None:
> +        "Set execution quantum (ms) for PF/VF (EQ/exec_quantum_ms)."
> +        raise NotImplementedError
> +
> +    @abc.abstractmethod
> +    def set_bulk_exec_quantum_ms(self, val: int) -> None:
> +        "Set execution quantum (ms) for PF and all VFs (EQ/exec_quantum_ms)."
> +        raise NotImplementedError
> +
> +    @abc.abstractmethod
> +    def get_preempt_timeout_us(self, fn_num: int) -> int:
> +        "Get preemption timeout (us) for PF/VF (PT/preempt_timeout_us)."
> +        raise NotImplementedError
> +
> +    @abc.abstractmethod
> +    def set_preempt_timeout_us(self, fn_num: int, val: int) -> None:
> +        "Set preemption timeout (us) for PF/VF (PT/preempt_timeout_us)."
> +        raise NotImplementedError
> +
>       @abc.abstractmethod
> -    def get_exec_quantum_ms(self, vf_num: int, gt_num: int) -> int:
> +    def set_bulk_preempt_timeout_us(self, val: int) -> None:
> +        "Set preemption timeout (us) for PF and all VFs (PT/preempt_timeout_us)."
>           raise NotImplementedError
>   
>       @abc.abstractmethod
> -    def set_exec_quantum_ms(self, vf_num: int, gt_num: int, val: int) -> None:
> +    def get_sched_priority(self, fn_num: int) -> SchedulingPriority:
> +        "Get scheduling priority (sched_priority) of PF/VF: low, normal or high."
>           raise NotImplementedError
>   
>       @abc.abstractmethod
> -    def get_preempt_timeout_us(self, vf_num: int, gt_num: int) -> int:
> +    def set_pf_sched_priority(self, val: SchedulingPriority) -> None:
> +        "Set scheduling priority (sched_priority) for PF only."
> +        # Independent sched_prio setting is available only for PF
>           raise NotImplementedError
>   
>       @abc.abstractmethod
> -    def set_preempt_timeout_us(self, vf_num: int, gt_num: int, val: int) -> None:
> +    def set_bulk_sched_priority(self, val: SchedulingPriority) -> None:
> +        "Set scheduling priority (sched_priority) for PF and all VFs."
> +        # Set sched_prio for PF and all VFs.
> +        # Setting sched_priority for a single VF independently is not supported currently.
>           raise NotImplementedError
>   
>       @abc.abstractmethod
> @@ -200,3 +288,28 @@ class DriverInterface(abc.ABC):
>       @abc.abstractmethod
>       def get_ggtt_available(self, gt_num: int) -> typing.Tuple[int, int]:
>           raise NotImplementedError
> +
> +
> +class VfDriver(DriverInterface):
> +    """Base class for VF drivers, extends common DriverInterface base class.
> +    Provide operations specific for VF drivers like read/write sysfs on Guest/VM.
> +    """
> +    def __init__(self, bdf: str, vm: MachineInterface) -> None:
> +        # VirtualMachine instance is required for VM filesystem access via QEMU Guest-Agent
> +        self.vm: MachineInterface = vm
> +        super().__init__(bdf)
> +
> +    def get_name(self) -> str:
> +        return self.vm.get_drm_driver_name()
> +
> +    def write_sysfs(self, path: Path, value: str) -> None:
> +        self.vm.write_file_content(str(path), value)
> +
> +    def read_sysfs(self, path: Path) -> str:
> +        return self.vm.read_file_content(str(path))
> +
> +    def write_debugfs(self, file: str, value: str) -> None:
> +        self.vm.write_file_content(str(self.debugfs_path / file), value)
> +
> +    def read_debugfs(self, file: str) -> str:
> +        return self.vm.read_file_content(str(self.debugfs_path / file))
> diff --git a/tools/vmtb/bench/drivers/xe.py b/tools/vmtb/bench/drivers/xe.py
> index c2b9643bb..26e4e0a08 100644
> --- a/tools/vmtb/bench/drivers/xe.py
> +++ b/tools/vmtb/bench/drivers/xe.py
> @@ -2,85 +2,42 @@
>   # Copyright © 2024-2026 Intel Corporation
>   
>   import logging
> +import re
>   import typing
>   from pathlib import Path
>   
> -from bench import exceptions
> -from bench.drivers.driver_interface import (DriverInterface,
> +from bench.drivers.driver_interface import (PfDriverInterface,
>                                               SchedulingPriority, VfControl)
> -from bench.helpers.log import LogDecorators
>   
>   logger = logging.getLogger('XeDriver')
>   
>   
> -class XeDriver(DriverInterface):
> -    def __init__(self, card_index: int) -> None:
> -        self.sysfs_card_path = Path(f'/sys/class/drm/card{card_index}')
> -        self.debugfs_path = Path(f'/sys/kernel/debug/dri/{card_index}')
> -
> -    @staticmethod
> -    def get_name() -> str:
> +class XeDriver(PfDriverInterface):
> +    """Xe driver abstraction class, implements PfDriverInterface.
> +    Provide xe specific sysfs/debugfs access and other operations on Host.
> +    """
> +    def get_name(self) -> str:
>           return 'xe'
>   
> -    @LogDecorators.parse_kmsg
> -    def __write_fs(self, base_path: Path, name: str, value: str) -> None:
> -        path = base_path / name
> -        try:
> -            path.write_text(value)
> -            logger.debug("Write: %s -> %s", value, path)
> -        except Exception as exc:
> -            logger.error("Unable to write %s -> %s", value, path)
> -            raise exceptions.HostError(f'Could not write to {path}. Error: {exc}') from exc
> -
> -    @LogDecorators.parse_kmsg
> -    def __read_fs(self,  base_path: Path, name: str) -> str:
> -        path = base_path / name
> -        try:
> -            ret = path.read_text()
> -        except Exception as exc:
> -            logger.error("Unable to read %s", path)
> -            raise exceptions.HostError(f'Could not read from {path}. Error: {exc}') from exc
> -
> -        logger.debug("Read: %s -> %s", path, ret.strip())
> -        return ret
> -
> -    def __write_sysfs(self, name: str, value: str) -> None:
> -        self.__write_fs(self.sysfs_card_path / 'device', name, value)
> -
> -    def __read_sysfs(self, name: str) -> str:
> -        return str(self.__read_fs(self.sysfs_card_path / 'device', name))
> -
> -    def __write_debugfs(self, name: str, value: str) -> None:
> -        self.__write_fs(self.debugfs_path, name, value)
> -
> -    def __read_debugfs(self, name: str) -> str:
> -        return str(self.__read_fs(self.debugfs_path, name))
> -
> -    def bind(self, bdf: str) -> None:
> -        self.__write_sysfs('driver/bind', bdf)
> -
> -    def unbind(self, bdf: str) -> None:
> -        self.__write_sysfs('driver/unbind', bdf)
> -
>       def get_totalvfs(self) -> int:
> -        return int(self.__read_sysfs('sriov_totalvfs'))
> +        return int(self.read_sysfs(self.sysfs_device_path / 'sriov_totalvfs'))
>   
>       def get_numvfs(self) -> int:
> -        return int(self.__read_sysfs('sriov_numvfs'))
> +        return int(self.read_sysfs(self.sysfs_device_path / 'sriov_numvfs'))
>   
>       def set_numvfs(self, val: int) -> None:
> -        self.__write_sysfs('sriov_numvfs', str(val))
> +        self.write_sysfs(self.sysfs_device_path / 'sriov_numvfs', str(val))
>   
>       def get_drivers_autoprobe(self) -> int:
> -        return int(self.__read_sysfs('sriov_drivers_autoprobe'))
> +        return int(self.read_sysfs(self.sysfs_device_path / 'sriov_drivers_autoprobe'))
>   
>       def set_drivers_autoprobe(self, val: int) -> None:
> -        self.__write_sysfs('sriov_drivers_autoprobe', str(val))
> +        self.write_sysfs(self.sysfs_device_path / 'sriov_drivers_autoprobe', str(val))
>   
>       def get_num_gts(self) -> int:
>           gt_num = 0
>           # Fixme: tile0 only at the moment, add support for multiple tiles if needed
> -        path = self.sysfs_card_path / 'device' / 'tile0' / 'gt'
> +        path = self.sysfs_device_path / 'tile0' / 'gt'
>   
>           if path.exists():
>               gt_num = 1
> @@ -101,12 +58,9 @@ class XeDriver(DriverInterface):
>           path = self.debugfs_path / f'gt{gt_num}' / 'pf' / 'ggtt_spare'
>           return not path.exists()
>   
> -    def get_auto_provisioning(self) -> bool:
> -        raise exceptions.NotAvailableError('auto_provisioning attribute not available')
> -
> -    def set_auto_provisioning(self, val: bool) -> None:
> -        # No-op - xe driver doesn't publish this attribute
> -        pass
> +    def restore_auto_provisioning(self) -> None:
> +        path = self.debugfs_path / 'sriov' / 'restore_auto_provisioning'
> +        self.write_debugfs(str(path), str(1))
>   
>       def cancel_work(self) -> None:
>           # Function to cancel all remaing work on GPU (for test cleanup).
> @@ -114,84 +68,77 @@ class XeDriver(DriverInterface):
>           pass
>   
>       # Create debugfs path to given parameter (without a base part):
> -    # gt@gt_num/[pf|vf@vf_num]/@attr
> -    # @vf_num: VF number (1-based) or 0 for PF
> +    # gt@gt_num/[pf|vf@fn_num]/@attr
> +    # @fn_num: VF number (1-based) or 0 for PF
>       # @gt_num: GT instance number
>       # @subdir: subdirectory for attribute or empty string if not exists
>       # @attr: iov parameter name
>       # Returns: iov debugfs path to @attr
> -    def __helper_create_debugfs_path(self, vf_num: int, gt_num: int, subdir: str, attr: str) -> str:
> -        vf_gt_part = f'gt{gt_num}/pf' if vf_num == 0 else f'gt{gt_num}/vf{vf_num}'
> -        return f'{vf_gt_part}/{subdir}/{attr}'
> +    def __helper_create_debugfs_path(self, fn_num: int, gt_num: int, subdir: str, attr: str) -> str:
> +        gt_fn_part = f'gt{gt_num}/pf' if fn_num == 0 else f'gt{gt_num}/vf{fn_num}'
> +        return f'{gt_fn_part}/{subdir}/{attr}'
> +
> +    # Create sysfs sriov_admin path to given scheduling parameter (without a base part):
> +    # sriov_admin/[pf|vf@fn_num]/profile/@attr
> +    # @fn_num: VF number (1-based) or 0 for PF
> +    # @attr: iov parameter name
> +    # Returns: iov sysfs path to @attr
> +    def __helper_create_sriov_admin_path(self, fn_num: int, attr: str) -> str:
> +        fn_part = 'pf' if fn_num == 0 else f'vf{fn_num}'
> +        return f'sriov_admin/{fn_part}/profile/{attr}'
>   
>       # PF spare resources
>       # Debugfs location: [SRIOV debugfs base path]/gtM/pf/xxx_spare
>       def get_pf_ggtt_spare(self, gt_num: int) -> int:
>           path = self.__helper_create_debugfs_path(0, gt_num, '', 'ggtt_spare')
> -        return int(self.__read_debugfs(path))
> +        return int(self.read_debugfs(path))
>   
>       def set_pf_ggtt_spare(self, gt_num: int, val: int) -> None:
>           path = self.__helper_create_debugfs_path(0, gt_num, '',  'ggtt_spare')
> -        self.__write_debugfs(path, str(val))
> +        self.write_debugfs(path, str(val))
>   
>       def get_pf_lmem_spare(self, gt_num: int) -> int:
>           path = self.__helper_create_debugfs_path(0, gt_num, '', 'lmem_spare')
> -        return int(self.__read_debugfs(path)) if self.has_lmem() else 0
> +        return int(self.read_debugfs(path)) if self.has_lmem() else 0
>   
>       def set_pf_lmem_spare(self, gt_num: int, val: int) -> None:
>           path = self.__helper_create_debugfs_path(0, gt_num, '', 'lmem_spare')
>           if self.has_lmem():
> -            self.__write_debugfs(path, str(val))
> +            self.write_debugfs(path, str(val))
>   
>       def get_pf_contexts_spare(self, gt_num: int) -> int:
>           path = self.__helper_create_debugfs_path(0, gt_num, '', 'contexts_spare')
> -        return int(self.__read_debugfs(path))
> +        return int(self.read_debugfs(path))
>   
>       def set_pf_contexts_spare(self, gt_num: int, val: int) -> None:
>           path = self.__helper_create_debugfs_path(0, gt_num, '', 'contexts_spare')
> -        self.__write_debugfs(path, str(val))
> +        self.write_debugfs(path, str(val))
>   
>       def get_pf_doorbells_spare(self, gt_num: int) -> int:
>           path = self.__helper_create_debugfs_path(0, gt_num, '', 'doorbells_spare')
> -        return int(self.__read_debugfs(path))
> +        return int(self.read_debugfs(path))
>   
>       def set_pf_doorbells_spare(self, gt_num: int, val: int) -> None:
>           path = self.__helper_create_debugfs_path(0, gt_num, '', 'doorbells_spare')
> -        self.__write_debugfs(path, str(val))
> +        self.write_debugfs(path, str(val))
>   
>       # PF specific provisioning parameters
>       # Debugfs location: [SRIOV debugfs base path]/gtM/pf
> -    def get_pf_sched_priority(self, gt_num: int) -> SchedulingPriority:
> -        logger.warning("PF sched_priority param not available")
> -        return SchedulingPriority.LOW
> -
> -    def set_pf_sched_priority(self, gt_num: int, val: SchedulingPriority) -> None:
> -        logger.warning("PF sched_priority param not available")
> -
>       def get_pf_policy_reset_engine(self, gt_num: int) -> int:
>           path = self.__helper_create_debugfs_path(0, gt_num, '', 'reset_engine')
> -        return int(self.__read_debugfs(path))
> +        return int(self.read_debugfs(path))
>   
>       def set_pf_policy_reset_engine(self, gt_num: int, val: int) -> None:
>           path = self.__helper_create_debugfs_path(0, gt_num, '', 'reset_engine')
> -        self.__write_debugfs(path, str(val))
> +        self.write_debugfs(path, str(val))
>   
>       def get_pf_policy_sample_period_ms(self, gt_num: int) -> int:
>           path = self.__helper_create_debugfs_path(0, gt_num, '', 'sample_period_ms')
> -        return int(self.__read_debugfs(path))
> +        return int(self.read_debugfs(path))
>   
>       def set_pf_policy_sample_period_ms(self, gt_num: int, val: int) -> None:
>           path = self.__helper_create_debugfs_path(0, gt_num, '', 'sample_period_ms')
> -        self.__write_debugfs(path, str(val))
> -
> -    def get_pf_policy_sched_if_idle(self, gt_num: int) -> int:
> -        path = self.__helper_create_debugfs_path(0, gt_num, '', 'sched_if_idle')
> -        return int(self.__read_debugfs(path))
> -
> -    def set_pf_policy_sched_if_idle(self, gt_num: int, val: int) -> None:
> -        # In order to set strict scheduling policy, PF scheduling priority needs to be default
> -        path = self.__helper_create_debugfs_path(0, gt_num, '', 'sched_if_idle')
> -        self.__write_debugfs(path, str(val))
> +        self.write_debugfs(path, str(val))
>   
>       # VF and PF provisioning parameters
>       # Debugfs location: [SRIOV debugfs base path]/gtM/[pf|vfN]
> @@ -202,7 +149,7 @@ class XeDriver(DriverInterface):
>               return 0
>   
>           path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'ggtt_quota')
> -        return int(self.__read_debugfs(path))
> +        return int(self.read_debugfs(path))
>   
>       def set_ggtt_quota(self, vf_num: int, gt_num: int, val: int) -> None:
>           if vf_num == 0:
> @@ -210,7 +157,7 @@ class XeDriver(DriverInterface):
>               return
>   
>           path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'ggtt_quota')
> -        self.__write_debugfs(path, str(val))
> +        self.write_debugfs(path, str(val))
>   
>       def get_lmem_quota(self, vf_num: int, gt_num: int) -> int:
>           if vf_num == 0:
> @@ -218,7 +165,7 @@ class XeDriver(DriverInterface):
>               return 0
>   
>           path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'lmem_quota')
> -        return int(self.__read_debugfs(path)) if self.has_lmem() else 0
> +        return int(self.read_debugfs(path)) if self.has_lmem() else 0
>   
>       def set_lmem_quota(self, vf_num: int, gt_num: int, val: int) -> None:
>           if vf_num == 0:
> @@ -227,7 +174,7 @@ class XeDriver(DriverInterface):
>   
>           path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'lmem_quota')
>           if self.has_lmem():
> -            self.__write_debugfs(path, str(val))
> +            self.write_debugfs(path, str(val))
>   
>       def get_contexts_quota(self, vf_num: int, gt_num: int) -> int:
>           if vf_num == 0:
> @@ -235,7 +182,7 @@ class XeDriver(DriverInterface):
>               return 0
>   
>           path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'contexts_quota')
> -        return int(self.__read_debugfs(path))
> +        return int(self.read_debugfs(path))
>   
>       def set_contexts_quota(self, vf_num: int, gt_num: int, val: int) -> None:
>           if vf_num == 0:
> @@ -243,7 +190,7 @@ class XeDriver(DriverInterface):
>               return
>   
>           path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'contexts_quota')
> -        self.__write_debugfs(path, str(val))
> +        self.write_debugfs(path, str(val))
>   
>       def get_doorbells_quota(self, vf_num: int, gt_num: int) -> int:
>           if vf_num == 0:
> @@ -251,7 +198,7 @@ class XeDriver(DriverInterface):
>               return 0
>   
>           path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'doorbells_quota')
> -        return int(self.__read_debugfs(path))
> +        return int(self.read_debugfs(path))
>   
>       def set_doorbells_quota(self, vf_num: int, gt_num: int, val: int) -> None:
>           if vf_num == 0:
> @@ -259,23 +206,51 @@ class XeDriver(DriverInterface):
>               return
>   
>           path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'doorbells_quota')
> -        self.__write_debugfs(path, str(val))
> +        self.write_debugfs(path, str(val))
> +
> +    # VF and PF scheduling parameters
> +    # Sysfs location: [SRIOV sysfs base path]/sriov_admin/[pf|vfN]/profile
> +    # @fn_num: VF number (1-based) or 0 for PF
> +    def get_exec_quantum_ms(self, fn_num: int) -> int:
> +        sriov_admin_path = self.__helper_create_sriov_admin_path(fn_num, 'exec_quantum_ms')
> +        return int(self.read_sysfs(self.sysfs_device_path / sriov_admin_path))
> +
> +    def set_exec_quantum_ms(self, fn_num: int, val: int) -> None:
> +        sriov_admin_path = self.__helper_create_sriov_admin_path(fn_num, 'exec_quantum_ms')
> +        self.write_sysfs(self.sysfs_device_path / sriov_admin_path, str(val))
> +
> +    def set_bulk_exec_quantum_ms(self, val: int) -> None:
> +        self.write_sysfs(self.sysfs_device_path / 'sriov_admin/.bulk_profile/exec_quantum_ms', str(val))
> +
> +    def get_preempt_timeout_us(self, fn_num: int) -> int:
> +        sriov_admin_path = self.__helper_create_sriov_admin_path(fn_num, 'preempt_timeout_us')
> +        return int(self.read_sysfs(self.sysfs_device_path / sriov_admin_path))
> +
> +    def set_preempt_timeout_us(self, fn_num: int, val: int) -> None:
> +        sriov_admin_path = self.__helper_create_sriov_admin_path(fn_num, 'preempt_timeout_us')
> +        self.write_sysfs(self.sysfs_device_path / sriov_admin_path, str(val))
> +
> +    def set_bulk_preempt_timeout_us(self, val: int) -> None:
> +        self.write_sysfs(self.sysfs_device_path / 'sriov_admin/.bulk_profile/preempt_timeout_us', str(val))
> +
> +    def get_sched_priority(self, fn_num: int) -> SchedulingPriority:
> +        sriov_admin_path = self.__helper_create_sriov_admin_path(fn_num, 'sched_priority')
> +        ret = self.read_sysfs(self.sysfs_device_path / sriov_admin_path).rstrip()
>   
> -    def get_exec_quantum_ms(self, vf_num: int, gt_num: int) -> int:
> -        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'exec_quantum_ms')
> -        return int(self.__read_debugfs(path))
> +        match = re.search(r'\[(low|normal|high)\]', ret)
> +        if match:
> +            return SchedulingPriority(match.group(1))
>   
> -    def set_exec_quantum_ms(self, vf_num: int, gt_num: int, val: int) -> None:
> -        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'exec_quantum_ms')
> -        self.__write_debugfs(path, str(val))
> +        logger.error("Unexpected sched_priority value (must be low/normal/high)")
> +        raise ValueError('Unexpected sched_priority value (must be low/normal/high)')
>   
> -    def get_preempt_timeout_us(self, vf_num: int, gt_num: int) -> int:
> -        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'preempt_timeout_us')
> -        return int(self.__read_debugfs(path))
> +    def set_pf_sched_priority(self, val: SchedulingPriority) -> None:
> +        # Independent sched_prio setting is available for PF only
> +        sriov_admin_path = self.__helper_create_sriov_admin_path(0, 'sched_priority')
> +        self.write_sysfs(self.sysfs_device_path / sriov_admin_path, val)
>   
> -    def set_preempt_timeout_us(self, vf_num: int, gt_num: int, val: int) -> None:
> -        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'preempt_timeout_us')
> -        self.__write_debugfs(path, str(val))
> +    def set_bulk_sched_priority(self, val: SchedulingPriority) -> None:
> +        self.write_sysfs(self.sysfs_device_path / 'sriov_admin/.bulk_profile/sched_priority', val)
>   
>       # Control state of the running VF (WO)
>       # Debugfs location: [SRIOV debugfs base path]/gtM/vfN/control
> @@ -285,7 +260,7 @@ class XeDriver(DriverInterface):
>       # For debug purposes only.
>       def set_vf_control(self, vf_num: int, val: VfControl) -> None:
>           path = self.__helper_create_debugfs_path(vf_num, 0, '', 'control')
> -        self.__write_debugfs(path, val)
> +        self.write_debugfs(path, val)
>   
>       # Read [attribute]_available value from debugfs:
>       # /sys/kernel/debug/dri/[card_index]/gt@gt_num/pf/@attr_available
> diff --git a/tools/vmtb/bench/machines/physical/device.py b/tools/vmtb/bench/machines/physical/device.py
> index 250466733..f1f24c65c 100644
> --- a/tools/vmtb/bench/machines/physical/device.py
> +++ b/tools/vmtb/bench/machines/physical/device.py
> @@ -11,7 +11,7 @@ from bench import exceptions
>   from bench.configurators import pci
>   from bench.configurators.vgpu_profile import (VgpuProfile, VgpuResourcesConfig,
>                                                 VgpuSchedulerConfig)
> -from bench.drivers.driver_interface import DriverInterface, SchedulingPriority
> +from bench.drivers.driver_interface import PfDriverInterface, SchedulingPriority
>   from bench.helpers.log import LogDecorators
>   from bench.machines.device_interface import DeviceInterface
>   
> @@ -46,12 +46,12 @@ class Device(DeviceInterface):
>       def __init__(self, bdf: str, driver: str) -> None:
>           self.pci_info = self.PciInfo(bdf)
>           self.gpu_model = pci.get_gpu_model(self.pci_info.devid)
> -        self.driver: DriverInterface = self.instantiate_driver(driver, self.pci_info.minor_number)
> +        self.driver: PfDriverInterface = self.instantiate_driver(self.pci_info.bdf, driver)
>   
>       def __str__(self) -> str:
>           return f'Dev-{self.pci_info.bdf}'
>   
> -    def instantiate_driver(self, driver_name: str, card_index: int) -> Any:
> +    def instantiate_driver(self, bdf: str, driver_name: str) -> Any:
>           module_name = f'bench.drivers.{driver_name}'
>           class_name = f'{driver_name.capitalize()}Driver'
>   
> @@ -62,7 +62,7 @@ class Device(DeviceInterface):
>               logging.error("Driver module/class is not available: %s", exc)
>               raise exceptions.VmtbConfigError(f'Requested driver module {driver_name} is not available!')
>   
> -        return driver_class(card_index)
> +        return driver_class(bdf)
>   
>       def set_drivers_autoprobe(self, val: bool) -> None:
>           self.driver.set_drivers_autoprobe(int(val))
> @@ -164,26 +164,27 @@ class Device(DeviceInterface):
>           If 'set_resources' parameter is True - apply the full vGPU profile (hard resources and scheduling).
>           Otherwise, set only scheduling profile (e.g. in case of auto resources provisioning).
>           """
> -        main_gt_nums = [gt_num for gt_num in range(self.get_num_gts()) if not self.is_gt_media_type(gt_num)]
> -
> +        all_gt_nums = list(range(self.get_num_gts()))
> +        main_gt_nums = [gt_num for gt_num in all_gt_nums if not self.is_gt_media_type(gt_num)]
>           logger.info("[%s] Provision %sxVFs on main GT%s", self.pci_info.bdf, num_vfs, main_gt_nums)
>   
> -        for gt_num in main_gt_nums:
> +        for gt_num in all_gt_nums:
>               if set_resources:
>                   self.set_resources(0, gt_num, profile.resources)
> -            self.set_scheduling(0, gt_num, profile.scheduler)
>               self.driver.set_pf_policy_reset_engine(gt_num, int(profile.security.reset_after_vf_switch))
>   
> +        self.set_scheduling(0, profile.scheduler)
> +
>           for vf_num in range(1, num_vfs + 1):
> -            gt_nums = main_gt_nums
>               if len(main_gt_nums) > 1 and num_vfs > 1:
>                   # Multi-tile device Mode 2|3 - odd VFs on GT0, even on GT1
> -                gt_nums = [main_gt_nums[0] if vf_num % 2 else main_gt_nums[1]]
> +                all_gt_nums = [main_gt_nums[0] if vf_num % 2 else main_gt_nums[1]]
>   
> -            for gt_num in gt_nums:
> +            for gt_num in all_gt_nums:
>                   if set_resources:
>                       self.set_resources(vf_num, gt_num, profile.resources)
> -                self.set_scheduling(vf_num, gt_num, profile.scheduler)
> +
> +            self.set_scheduling(vf_num, profile.scheduler)
>   
>       def provision(self, profile: VgpuProfile) -> None:
>           """Provision PF and VF(s) based on requested vGPU profile."""
> @@ -194,44 +195,47 @@ class Device(DeviceInterface):
>           self.__set_provisioning(num_vfs, profile, set_resources=False)
>   
>       # fn_num = 0 for PF, 1..n for VF
> -    def set_scheduling(self, fn_num: int, gt_num: int, scheduling_config: VgpuSchedulerConfig) -> None:
> -        """Write sysfs/debugfs PF/VF scheduling attributes."""
> +    def set_scheduling(self, fn_num: int, scheduling_config: VgpuSchedulerConfig) -> None:
> +        """Write sysfs PF/VF scheduling attributes."""
>           logger.debug("[%s] Set scheduling for PCI Function %s", self.pci_info.bdf, fn_num)
> +
>           if fn_num == 0:
> -            self.driver.set_pf_policy_sched_if_idle(gt_num, int(scheduling_config.scheduleIfIdle))
> -            self.driver.set_exec_quantum_ms(0, gt_num, scheduling_config.pfExecutionQuanta)
> -            self.driver.set_preempt_timeout_us(0, gt_num, scheduling_config.pfPreemptionTimeout)
> +            eq, pt = scheduling_config.pfExecutionQuanta, scheduling_config.pfPreemptionTimeout
>           else:
> -            self.driver.set_exec_quantum_ms(fn_num, gt_num, scheduling_config.vfExecutionQuanta)
> -            self.driver.set_preempt_timeout_us(fn_num, gt_num, scheduling_config.vfPreemptionTimeout)
> +            eq, pt = scheduling_config.vfExecutionQuanta, scheduling_config.vfPreemptionTimeout
> +
> +        self.driver.set_exec_quantum_ms(fn_num, eq)
> +        self.driver.set_preempt_timeout_us(fn_num, pt)
> +
> +        if scheduling_config.scheduleIfIdle:
> +            self.driver.set_bulk_sched_priority(SchedulingPriority.NORMAL)
>   
>       def set_resources(self, fn_num: int, gt_num: int, resources_config: VgpuResourcesConfig) -> None:
> -        """Write sysfs/debugfs PF/VF resources attributes."""
> +        """Write debugfs PF/VF resources attributes."""
>           logger.debug("[%s] Set resources for PCI Function %s", self.pci_info.bdf, fn_num)
>           if fn_num == 0:
> -            self.driver.set_pf_ggtt_spare(gt_num, resources_config.pfGgtt)
> -            self.driver.set_pf_lmem_spare(gt_num, resources_config.pfLmem)
> +            if not self.is_gt_media_type(gt_num):
> +                self.driver.set_pf_ggtt_spare(gt_num, resources_config.pfGgtt)
> +                self.driver.set_pf_lmem_spare(gt_num, resources_config.pfLmem)
>               self.driver.set_pf_contexts_spare(gt_num, resources_config.pfContexts)
>               self.driver.set_pf_doorbells_spare(gt_num, resources_config.pfDoorbells)
>           else:
> -            self.driver.set_ggtt_quota(fn_num, gt_num, resources_config.vfGgtt)
> -            self.driver.set_lmem_quota(fn_num, gt_num, resources_config.vfLmem)
> +            if not self.is_gt_media_type(gt_num):
> +                self.driver.set_ggtt_quota(fn_num, gt_num, resources_config.vfGgtt)
> +                self.driver.set_lmem_quota(fn_num, gt_num, resources_config.vfLmem)
>               self.driver.set_contexts_quota(fn_num, gt_num, resources_config.vfContexts)
>               self.driver.set_doorbells_quota(fn_num, gt_num, resources_config.vfDoorbells)
>   
> -    def reset_provisioning(self, num_vfs: int) -> None:
> -        """Clear provisioning config for a requested number of VFs.
> -        Function calls the sysfs control interface to clear VF provisioning settings
> -        and restores the auto provisioning mode.
> -        """
> -        logger.info("[%s] Reset %s VFs provisioning configuration", self.pci_info.bdf, num_vfs)
> +    def clear_provisioning_attributes(self, num_vfs: int) -> None:
> +        """Clear provisioning attributes for a requested number of VFs."""
> +        # Provisioning config are likely wiped out by (xe) debugfs/restore_auto_provisioning,
> +        # but explicit clear shouldn't harm.
> +        self.driver.set_bulk_sched_priority(SchedulingPriority.LOW)
> +        self.driver.set_bulk_exec_quantum_ms(0)
> +        self.driver.set_bulk_preempt_timeout_us(0)
> +
>           for gt_num in range(self.get_num_gts()):
> -            if self.get_scheduling_priority(gt_num) != SchedulingPriority.LOW:
> -                self.set_scheduling_priority(gt_num, SchedulingPriority.LOW)
> -            self.driver.set_pf_policy_sched_if_idle(gt_num, 0)
>               self.driver.set_pf_policy_reset_engine(gt_num, 0)
> -            self.driver.set_exec_quantum_ms(0, gt_num, 0)
> -            self.driver.set_preempt_timeout_us(0, gt_num, 0)
>               self.driver.set_doorbells_quota(0, gt_num, 0)
>               # PF contexts cannot be set from sysfs
>   
> @@ -242,14 +246,24 @@ class Device(DeviceInterface):
>                       self.driver.set_ggtt_quota(vf_num, gt_num, 0)
>                       self.driver.set_lmem_quota(vf_num, gt_num, 0)
>   
> +    def reset_provisioning(self, num_vfs: int) -> None:
> +        """Clear provisioning config for a given number of VFs and restore auto provisioning mode."""
> +        logger.info("[%s] Reset %sxVF provisioning configuration", self.pci_info.bdf, num_vfs)
> +        self.clear_provisioning_attributes(num_vfs)
> +        self.driver.restore_auto_provisioning()
> +
>       def cancel_work(self) -> None:
>           """Drop and reset remaining GPU execution at exit."""
>           self.driver.cancel_work()
>   
> -    def get_scheduling_priority(self, gt_num: int) -> SchedulingPriority:
> -        return self.driver.get_pf_sched_priority(gt_num)
> +    def get_scheduling_priority(self, fn_num: int) -> SchedulingPriority:
> +        """Get scheduling priority for a given VF or PF."""
> +        return self.driver.get_sched_priority(fn_num)
> +
> +    def set_scheduling_priority(self, val: SchedulingPriority) -> None:
> +        """Set scheduling priority for PF and all VFs. Normal priority enables strict scheduling."""
> +        self.driver.set_bulk_sched_priority(val)
>   
> -    def set_scheduling_priority(self, gt_num: int, val: SchedulingPriority) -> None:
> -        # In order to set scheduling priority, strict scheduling policy needs to be default
> -        # self.drm_driver.set_pf_policy_sched_if_idle(gt_num, 0)
> -        self.driver.set_pf_sched_priority(gt_num, val)
> +    def set_pf_scheduling_priority(self, val: SchedulingPriority) -> None:
> +        """Set scheduling priority for PF only. High prioritizes PF execution over VFs."""
> +        self.driver.set_pf_sched_priority(val)
> diff --git a/tools/vmtb/vmm_flows/conftest.py b/tools/vmtb/vmm_flows/conftest.py
> index 12726416f..a2a6b6680 100644
> --- a/tools/vmtb/vmm_flows/conftest.py
> +++ b/tools/vmtb/vmm_flows/conftest.py
> @@ -253,14 +253,18 @@ def fixture_setup_vms(get_vmtb_config, get_cmdline_config, get_host, request):
>               ts.vgpu_profile.resources.vfLmem = org_vgpu_profile_vfLmem
>   
>       else:
> -        device.driver.set_auto_provisioning(True)
> -        if ts.testing_config.scheduling_mode is not VfSchedulingMode.INFINITE:
> -            # Auto provisioning with concrete scheduling (i.e. different than HW default: infinite)
> -            ts.vgpu_profile.print_scheduler_config()
> -            device.provision_scheduling(num_vfs, ts.vgpu_profile)
> +        device.driver.restore_auto_provisioning()
>   
>       assert device.create_vf(num_vfs) == num_vfs
>   
> +    if (ts.testing_config.provisioning_mode is VfProvisioningMode.AUTO and
> +        ts.testing_config.scheduling_mode is not VfSchedulingMode.INFINITE):
> +        # Auto resources provisioning with concrete scheduling (i.e. different than HW default: infinite).
> +        # Scheduler params override must be done after enabling VFs
> +        # to allow hard resources auto provisioning by KMD.
> +        ts.vgpu_profile.print_scheduler_config()
> +        device.provision_scheduling(num_vfs, ts.vgpu_profile)
> +
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>       if tc.auto_poweron_vm:
>           bdf_list = [device.get_vf_bdf(vf) for vf in range(1, num_vms + 1)]
>           for vm, bdf in zip(ts.get_vm, bdf_list):
