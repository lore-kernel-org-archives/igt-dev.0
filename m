Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3608BEB1049
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B734010E250;
	Tue, 10 Mar 2026 10:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djtd5EyA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E475C10E23B
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773139638; x=1804675638;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=phdhS8DJrjbimjZtt4LFWqnhaG97LvF9rNDWoIPZB68=;
 b=djtd5EyAKrqL5Bu2zwGjn/gTQOUyXcJcGxCkiJRPXhzPglKVhZ18LMG0
 4M8WRcoTx8wLJH6wRU2p5CSRc2SGacRBR1Kim0ds4FzLbAa/+FRevJh0M
 pq+ae67Okn8K2z9N4V4MGZtYsUGJCW9JnmccUInrTNQfcKC4A4KSyaoIz
 fxijnqZnx1M1XDNoaTw9O9ImMQNoRm0M86mNRC4YxbhsglYqkT7Ds+20U
 VAOX3W5q6TwV+ve2RzHRi9PFypM0VDe9P1ZrXxxd0EW0s8LUG2+CD09We
 UwZ5sTvxIgnsvYtjUb4x5FRth+cArOeJJhLMTitJhL+pQC/dzYm8AJ7NB Q==;
X-CSE-ConnectionGUID: 6X2B4811RIuhvf11U3BJ3Q==
X-CSE-MsgGUID: yJJiIepuTrapvotuqv6B7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85538585"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85538585"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:47:18 -0700
X-CSE-ConnectionGUID: laTUQMhKRHe4mI+iIKuGBg==
X-CSE-MsgGUID: jDTPBHvaR5SgPSXpQvHuVw==
X-ExtLoop1: 1
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.135])
 ([172.28.180.135])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:47:16 -0700
Message-ID: <f431aaae-d659-497c-9b55-e3b8a7add8d8@linux.intel.com>
Date: Tue, 10 Mar 2026 11:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 08/10] tools/vmtb: Redesign VirtualMachine class
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
 <20260224075027.2409675-9-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260224075027.2409675-9-adam.miszczak@linux.intel.com>
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
> Split original VirtualMachine class into specialized abstractions:
> VirtualMachine, VirtualDevice and VfDriver.
> Extend new VirtualMachine with new functions to load and remove DRM driver
> and discover devices on Guest OS.
>
> Redesigned abstractions have the following responsibilities:
> - VirtualMachine supports operations like start/stop VM, load/unload driver,
>    enumerate virtual devices, execute process on guest,
>    power states handling, save/load state etc.
> - VirtualDevice represents GPU device visible on a guest OS
>    (resources allocated to VF, local PCI BDF, Device ID)
> - VfDriver handles low-level functions of virtual device
>    as sysfs/debugfs access
>
> New implementation provides placeholders for multiple VFs passed to VM,
> but currently only single VF (one virtual GPU per VM) is supported.
>
> Additionally, create separate VM/Guest kernel log files,
> located in a root VMTB directory.
> VM dmesg is also propagated to logfile.log as previously.
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/bench/machines/virtual/vm.py | 252 +++++++++++-------------
>   tools/vmtb/vmm_flows/conftest.py        |   7 +-
>   2 files changed, 116 insertions(+), 143 deletions(-)
>
> diff --git a/tools/vmtb/bench/machines/virtual/vm.py b/tools/vmtb/bench/machines/virtual/vm.py
> index 312e87e4b..2469af965 100644
> --- a/tools/vmtb/bench/machines/virtual/vm.py
> +++ b/tools/vmtb/bench/machines/virtual/vm.py
> @@ -4,14 +4,14 @@
>   import base64
>   import json
>   import logging
> -import os
> -import posixpath
> +import re
>   import shlex
>   import signal
>   import subprocess
>   import threading
>   import time
>   import typing
> +from pathlib import Path
>   from types import FrameType
>   
>   from bench import exceptions
> @@ -21,6 +21,7 @@ from bench.machines.machine_interface import (DEFAULT_TIMEOUT,
>                                                 SuspendMode)
>   from bench.machines.virtual.backends.guestagent import GuestAgentBackend
>   from bench.machines.virtual.backends.qmp_monitor import QmpMonitor
> +from bench.machines.virtual.device import VirtualDevice
>   
>   logger = logging.getLogger('VirtualMachine')
>   
> @@ -60,40 +61,34 @@ class VirtualMachine(MachineInterface):
>   
>       def __init__(self, vm_number: int, backing_image: str, driver: str,
>                    igt_config: VmtbIgtConfig, vf_migration_support: bool) -> None:
> -        self.vf_bdf: typing.Optional[str] = None
> -        self.process: typing.Optional[subprocess.Popen] = None
>           self.vmnum: int = vm_number
> -        self.card_num: int = 0
> -        self.sysfs_prefix_path = posixpath.join('/sys/class/drm/', f'card{str(self.card_num)}')
> -        self.questagent_sockpath = posixpath.join('/tmp', f'qga{self.vmnum}.sock')
> -        self.qmp_sockpath = posixpath.join('/tmp', f'mon{self.vmnum}.sock')
>           self.drm_driver_name: str = driver
>           self.igt_config: VmtbIgtConfig = igt_config
>           self.vf_migration: bool = vf_migration_support
>   
> -        if not posixpath.exists(backing_image):
> +        # Passed VFs and VirtualDevices list - placeholder for multiple VFs passed to single VM:
> +        # currently only one VF/VirtualDevice per VM supported (ie. passed_vf_bdfs[0]).
> +        # TODO: add support for multiple VFs/VirtualDevices per VM
> +        self.passed_vf_bdfs: typing.List[str] = []
> +        self.gpu_devices: typing.List[VirtualDevice] = []
> +        self.process: typing.Optional[subprocess.Popen] = None
> +
> +        self.questagent_sockpath = Path('/tmp') / f'qga{self.vmnum}.sock'
> +        self.qmp_sockpath = Path('/tmp') / f'mon{self.vmnum}.sock'
> +
> +        if not Path(backing_image).exists():
>               logger.error('No image for VM%s', self.vmnum)
>               raise exceptions.GuestError(f'No image for VM{self.vmnum}')
> +
>           self.image: str = self.__create_qemu_image(backing_image)
> +
>           self.migrate_source_image: typing.Optional[str] = None
>           self.migrate_destination_vm: bool = False
>   
> -        # Resources provisioned to the VF/VM:
> -        self._lmem_size: typing.Optional[int] = None
> -        self._ggtt_size: typing.Optional[int] = None
> -        self._contexts: typing.Optional[int] = None
> -        self._doorbells: typing.Optional[int] = None
> -
> -        # GT number and tile is relevant mainly for multi-tile devices
> -        # List of all GTs used by a given VF:
> -        # - for single-tile: only root [0]
> -        # - for multi-tile Mode 2/3: either root [0] or remote [1]
> -        # - for multi-tile Mode 1: spans on both tiles [0, 1]
> -        self._gt_nums: typing.List[int] = []
> -        self._tile_mask: typing.Optional[int] = None
> +        self.dmesg_logger = self.__setup_dmesg_logger()
>   
>       def __str__(self) -> str:
> -        return f'VM{self.vmnum}_{self.vf_bdf}'
> +        return f'VM{self.vmnum}-VF:{self.passed_vf_bdfs[0] if self.passed_vf_bdfs else 'N/A'}'
>   
>       def __del__(self) -> None:
>           if not self.is_running():
> @@ -112,6 +107,18 @@ class VirtualMachine(MachineInterface):
>               print('QEMU did not terminate, killing it')
>               self.process.kill()
>   
> +    def __setup_dmesg_logger(self) -> logging.Logger:
> +        """Configure VM dmesg logger.
> +        Logs are directed to dedicated vm[NUM]_dmesg.log and propagated to logfile.log.
> +        """
> +        dmesg_logger = logging.getLogger(f'VM{self.vmnum}-kmsg')
> +        # Remove any existing logger handlers to avoid duplicated prints for parametrized tests
> +        dmesg_logger.handlers.clear()
> +        dmesg_log_handler = logging.FileHandler(f'vm{self.vmnum}_dmesg.log')
> +        dmesg_logger.addHandler(dmesg_log_handler)
> +
> +        return dmesg_logger
> +
>       def __get_backing_file_format(self, backing_file: str) -> typing.Any:
>           """Get the format of the backing image file using qemu-img info."""
>           command = ['qemu-img', 'info', '--output=json', backing_file]
> @@ -143,14 +150,13 @@ class VirtualMachine(MachineInterface):
>           return output_image
>   
>       def __log_qemu_output(self, out: typing.TextIO) -> None:
> -        stdoutlog = logging.getLogger(f'VM{self.vmnum}-kmsg')
>           for line in iter(out.readline, ''):
> -            stdoutlog.debug(line.strip())
> +            self.dmesg_logger.debug(line.strip())
>   
>       def __sockets_exists(self) -> bool:
> -        return os.path.exists(self.questagent_sockpath) and os.path.exists(self.qmp_sockpath)
> +        return self.questagent_sockpath.exists() and self.qmp_sockpath.exists()
>   
> -    def __get_popen_command(self) -> typing.List[str]:
> +    def __prepare_qemu_command(self) -> typing.List[str]:
>           command = ['qemu-system-x86_64',
>                      '-vnc', f':{self.vmnum}',
>                      '-serial', 'stdio',
> @@ -165,8 +171,8 @@ class VirtualMachine(MachineInterface):
>                      '-chardev', f'socket,id=mon{self.vmnum},path=/tmp/mon{self.vmnum}.sock,server=on,wait=off',
>                      '-mon', f'chardev=mon{self.vmnum},mode=control']
>   
> -        if self.vf_bdf:
> -            command.extend(['-enable-kvm', '-cpu', 'host', '-device', f'vfio-pci,host={self.vf_bdf}'])
> +        if self.passed_vf_bdfs:
> +            command.extend(['-enable-kvm', '-cpu', 'host', '-device', f'vfio-pci,host={self.passed_vf_bdfs[0]}'])
>               if self.vf_migration:
>                   command[-1] += ',enable-migration=on'
>   
> @@ -185,77 +191,82 @@ class VirtualMachine(MachineInterface):
>               cur = cur[key]
>           return cur
>   
> -    @property
> -    def get_vm_num(self) -> int:
> -        return self.vmnum
> -
>       def assign_vf(self, vf_bdf: str) -> None:
> -        self.vf_bdf = vf_bdf
> +        """Pass VFs to VM - required to run QEMU (prior to VM power on)"""
> +        self.passed_vf_bdfs.append(vf_bdf)
>   
>       def set_migration_source(self, src_image: str) -> None:
>           self.migrate_source_image = src_image
>           self.migrate_destination_vm = True
>   
> -    @property
> -    def lmem_size(self) -> typing.Optional[int]:
> -        if self._lmem_size is None:
> -            self.helper_get_debugfs_selfconfig()
> -
> -        return self._lmem_size
> -
> -    @property
> -    def ggtt_size(self) -> typing.Optional[int]:
> -        if self._ggtt_size is None:
> -            self.helper_get_debugfs_selfconfig()
> -
> -        return self._ggtt_size
> -
> -    @property
> -    def contexts(self) -> typing.Optional[int]:
> -        if self._contexts is None:
> -            self.helper_get_debugfs_selfconfig()
> -
> -        return self._contexts
> -
> -    @property
> -    def doorbells(self) -> typing.Optional[int]:
> -        if self._doorbells is None:
> -            self.helper_get_debugfs_selfconfig()
> -
> -        return self._doorbells
> -
> -    @property
> -    def tile_mask(self) -> typing.Optional[int]:
> -        if self._tile_mask is None:
> -            self.helper_get_debugfs_selfconfig()
> -
> -        return self._tile_mask
> -
> -    @property
> -    def gt_nums(self) -> typing.List[int]:
> -        self._gt_nums = self.get_gt_num_from_sysfs()
> -        if not self._gt_nums:
> -            logger.warning("VM sysfs: missing GT index")
> -            self._gt_nums = [0]
> -
> -        return self._gt_nums
> -
> -    def get_gt_num_from_sysfs(self) -> typing.List[int]:
> -        # Get GT number of VF passed to a VM, based on an exisitng a sysfs path
> -        vm_gt_num = []
> -        if self.dir_exists(posixpath.join(self.sysfs_prefix_path, 'gt/gt0')):
> -            vm_gt_num.append(0)
> -        if self.dir_exists(posixpath.join(self.sysfs_prefix_path, 'gt/gt1')):
> -            vm_gt_num.append(1)
> -
> -        return vm_gt_num
> -
>       def get_drm_driver_name(self) -> str:
>           return self.drm_driver_name
>   
>       def get_igt_config(self) -> VmtbIgtConfig:
>           return self.igt_config
>   
> +    def get_dut(self) -> VirtualDevice:
> +        # Currently only one first enumerated device is supported (virtual card0)
> +        return self.gpu_devices[0]
> +
> +    def is_drm_driver_loaded(self) -> bool:
> +        return self.dir_exists(f'/sys/bus/pci/drivers/{self.drm_driver_name}')
> +
> +    def load_drm_driver(self) -> None:
> +        """Load (modprobe) guest DRM driver."""
> +        if not self.is_drm_driver_loaded():
> +            logger.debug("VirtualMachine - load DRM driver")
> +            drv_probe_pid = self.execute(f'modprobe {self.drm_driver_name}')
> +            if self.execute_wait(drv_probe_pid).exit_code != 0:
> +                logger.error("%s driver probe failed on guest!", self.drm_driver_name)
> +                raise exceptions.GuestError(f'{self.drm_driver_name} driver probe failed on guest!')
> +
> +    def unload_drm_driver(self) -> None:
> +        """Unload (remove) guest DRM driver."""
> +        logger.debug("VirtualMachine - unload DRM driver")
> +        for device in self.gpu_devices:
> +            logger.debug("Unbind %s from virtual device %s", self.drm_driver_name, device.pci_info.bdf)
> +            device.unbind_driver()
> +
> +        rmmod_pid = self.execute(f'modprobe -rf {self.drm_driver_name}')
> +        if self.execute_wait(rmmod_pid).exit_code != 0:
> +            logger.error("DRM driver remove failed!")
> +            raise exceptions.HostError('DRM driver remove failed!')
> +
> +        logger.debug("%s successfully removed", self.drm_driver_name)
> +
> +    def discover_devices(self) -> None:
> +        """Detect all (virtual) PCI GPU devices on the guest and initialize VirtualDevice list."""
> +        if not self.is_drm_driver_loaded():
> +            logger.error("Unable to discover devices on guest - %s driver is not loaded!", self.drm_driver_name)
> +            raise exceptions.HostError(
> +                f'Unable to discover devices on guest - {self.drm_driver_name} driver is not loaded!')
> +
> +        detected_devices: typing.List[VirtualDevice] = []
> +        drv_path = Path('/sys/bus/pci/drivers/') / self.drm_driver_name
> +
> +        dev_dir_ls = self.dir_list(str(drv_path))
> +
> +        # Look for a directory name with a PCI BDF (e.g. 0000:1a:00.0)
> +        for bdf in dev_dir_ls:
> +            match = re.match(r'\d{4}(?::[0-9a-z-A-Z]{2}){2}.[0-7]', bdf)
> +            if match:
> +                device = VirtualDevice(bdf, self)
> +                detected_devices.append(device)
> +
> +        # Output list of detected devices sorted by an ascending card index (device minor number)
> +        self.gpu_devices = sorted(detected_devices, key=lambda dev: dev.pci_info.minor_number)
> +
> +        if not self.gpu_devices:
> +            logger.error("Virtualized GPU PCI device (bound to %s driver) not detected!", self.drm_driver_name)
> +            raise exceptions.GuestError(
> +                f'Virtualized GPU PCI device (bound to {self.drm_driver_name} driver) not detected!')
> +
> +        logger.debug("Detected virtualized GPU PCI device(s):")
> +        for dev in self.gpu_devices:
> +            logger.debug("[virtual card%s] PCI BDF: %s / DevID: %s (%s)",
> +                          dev.pci_info.minor_number, dev.pci_info.bdf, dev.pci_info.devid, dev.gpu_model)
> +
>       @Decorators.timeout_signal
>       def poweron(self) -> None:
>           logger.debug('Powering on VM%s', self.vmnum)
> @@ -263,7 +274,7 @@ class VirtualMachine(MachineInterface):
>               logger.warning('VM%s already running', self.vmnum)
>               return
>   
> -        command = self.__get_popen_command()
> +        command = self.__prepare_qemu_command()
>           # We don't want to kill the process created here (like 'with' would do) so disable the following linter issue:
>           # R1732: consider-using-with (Consider using 'with' for resource-allocating operations)
>           # pylint: disable=R1732
> @@ -292,8 +303,8 @@ class VirtualMachine(MachineInterface):
>                   logger.info('waiting for socket')
>                   time.sleep(1)
>               # Passing five minutes timeout for every command
> -            self.ga = GuestAgentBackend(self.questagent_sockpath, 300)
> -            self.qm = QmpMonitor(self.qmp_sockpath, 300)
> +            self.ga = GuestAgentBackend(str(self.questagent_sockpath), 300)
> +            self.qm = QmpMonitor(str(self.qmp_sockpath), 300)
>               vm_status = self.qm.query_status()
>   
>               if not self.migrate_destination_vm and vm_status != 'running':
> @@ -317,6 +328,7 @@ class VirtualMachine(MachineInterface):
>   
>       @Decorators.timeout_signal
>       def poweroff(self) -> None:
> +        """Power off VM via the Guest-Agent guest-shutdown(powerdown) command."""
>           logger.debug('Powering off VM%s', self.vmnum)
>           assert self.process
>           if not self.is_running():
> @@ -338,8 +350,9 @@ class VirtualMachine(MachineInterface):
>   
>               if self.__sockets_exists():
>                   # Remove leftovers and notify about unclear qemu shutdown
> -                os.remove(self.questagent_sockpath)
> -                os.remove(self.qmp_sockpath)
> +                self.questagent_sockpath.unlink()
> +                self.qmp_sockpath.unlink()
> +                logger.error('VM%s was not gracefully powered off - sockets exist', self.vmnum)
>                   raise exceptions.GuestError(f'VM{self.vmnum} was not gracefully powered off - sockets exist')
>   
>       def reboot(self) -> None:
> @@ -441,7 +454,7 @@ class VirtualMachine(MachineInterface):
>           ret = execout.get('return')
>           if ret:
>               pid: int = ret.get('pid')
> -            logger.debug('Running %s on VM%s with pid %s', command, self.vmnum, pid)
> +            logger.debug("Run command on VM%s: %s (PID: %s)", self.vmnum, command, pid)
>               return pid
>   
>           logger.error('Command %s did not return pid', command)
> @@ -519,9 +532,12 @@ class VirtualMachine(MachineInterface):
>           return True
>   
>       def dir_list(self, path: str) -> typing.List[str]:
> -        # TODO: implement, currently no-op to fulfill MachineInterface requirement
> -        logger.warning("VirtualMachine.dir_list() is not implemented yet!")
> -        return []
> +        pid = self.execute(f'/bin/sh -c "ls {path}"')
> +        status: ProcessResult = self.execute_wait(pid)
> +        if status.exit_code:
> +            raise exceptions.GuestError(f'VM ls failed - error: {status.exit_code}')
> +
> +        return status.stdout.split()
>   
>       def link_exists(self, path: str) -> bool:
>           pid = self.execute(f'/bin/sh -c "[ -h {path} ]"')
> @@ -571,45 +587,3 @@ class VirtualMachine(MachineInterface):
>               raise exceptions.GuestError(f'VM{self.vmnum} state load error: {job_error}')
>   
>           logger.debug('VM state load finished successfully')
> -
> -    # helper_convert_units_to_bytes - convert size with units to bytes
> -    # @size_str: multiple-byte unit size with suffix (K/M/G)
> -    # Returns: size in bytes
> -    # TODO: function perhaps could be moved to some new utils module
> -    # improve - consider regex to handle various formats eg. both M and MB
> -    def helper_convert_units_to_bytes(self, size_str: str) -> int:
> -        size_str = size_str.upper()
> -        size_int = 0
> -
> -        if size_str.endswith('B'):
> -            size_int = int(size_str[0:-1])
> -        elif size_str.endswith('K'):
> -            size_int = int(size_str[0:-1]) * 1024
> -        elif size_str.endswith('M'):
> -            size_int = int(size_str[0:-1]) * 1024**2
> -        elif size_str.endswith('G'):
> -            size_int = int(size_str[0:-1]) * 1024**3
> -
> -        return size_int
> -
> -    # helper_get_debugfs_selfconfig - read resources allocated to VF from debugfs:
> -    # /sys/kernel/debug/dri/@card/gt@gt_num/iov/self_config
> -    # @card: card number
> -    # @gt_num: GT instance number
> -    def helper_get_debugfs_selfconfig(self, card: int = 0, gt_num: int = 0) -> None:
> -        path = posixpath.join(f'/sys/kernel/debug/dri/{card}/gt{gt_num}/iov/self_config')
> -        out = self.read_file_content(path)
> -
> -        for line in out.splitlines():
> -            param, value = line.split(':')
> -
> -            if param == 'GGTT size':
> -                self._ggtt_size = self.helper_convert_units_to_bytes(value)
> -            elif param == 'LMEM size':
> -                self._lmem_size = self.helper_convert_units_to_bytes(value)
> -            elif param == 'contexts':
> -                self._contexts = int(value)
> -            elif param == 'doorbells':
> -                self._doorbells = int(value)
> -            elif param == 'tile mask':
> -                self._tile_mask = int(value, base=16)
> diff --git a/tools/vmtb/vmm_flows/conftest.py b/tools/vmtb/vmm_flows/conftest.py
> index a2a6b6680..ae149d652 100644
> --- a/tools/vmtb/vmm_flows/conftest.py
> +++ b/tools/vmtb/vmm_flows/conftest.py
> @@ -16,7 +16,6 @@ from bench.configurators.vgpu_profile_config import (VfProvisioningMode,
>                                                        VfSchedulingMode,
>                                                        VgpuProfileConfigurator)
>   from bench.configurators.vmtb_config import VmtbConfigurator
> -from bench.helpers.helpers import modprobe_driver, modprobe_driver_check
>   from bench.helpers.log import HOST_DMESG_FILE
>   from bench.machines.host import Device, Host
>   from bench.machines.virtual.vm import VirtualMachine
> @@ -273,9 +272,9 @@ def fixture_setup_vms(get_vmtb_config, get_cmdline_config, get_host, request):
>           ts.poweron_vms()
>   
>           if tc.auto_probe_vm_driver:
> -            modprobe_cmds = [modprobe_driver(vm) for vm in ts.get_vm]
> -            for i, cmd in enumerate(modprobe_cmds):
> -                assert modprobe_driver_check(ts.get_vm[i], cmd), f'modprobe failed on VM{i}'
> +            for vm in ts.get_vm:
> +                vm.load_drm_driver()
> +                vm.discover_devices()
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>   
>       logger.info('[Test execution: %sVF-%sVM]', num_vfs, num_vms)
>       yield ts
