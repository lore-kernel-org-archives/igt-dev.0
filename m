Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07ECCA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 13:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7D210E88F;
	Thu,  8 Oct 2026 13:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhocYaLA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB77210E853
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791467755; x=1823003755;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pFGtsj0OBxUziBDpdT3Gbhv956QYPpi15yu7CTE1+QI=;
 b=WhocYaLAKNcIICj+UmfjGxgTKY+T9irQ5GydREpTrObE6FrdjbYRh6Du
 eJroXTrczW2L98DDgGGdtrEQo2TXs22HwjojbCfz+NU9KmejcTjZqzMnF
 fx6FUt6LK6r0c5ILHBakUGFjk/QkVZIHZBnbKClPiJTv44YtCF0xw6h2A
 N4kUJVaMNz8VdYNnp8a4Mf/SOsZXy8PP2XZHvr4kj6/r/ZSyGsmTRTjCU
 jISiKYo2zaMU+STPKk6lJrgDvsFX5ZCOKMNCsobok4nPG+8GBRbG3w9MS
 1u597oCOht6GnZKuzhV+FFRQQRWgBXvrQydHngr7d/W0gBJ1LHARMD+UY w==;
X-CSE-ConnectionGUID: whfiwaJHREaNArv3nWFZrA==
X-CSE-MsgGUID: S7SIuDfYT7+h5kQXBHvoeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="362223"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="362223"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:55:55 -0700
X-CSE-ConnectionGUID: VN/NDruwTKWU9PpZe4AOwA==
X-CSE-MsgGUID: IlZWfIAkRnGteeGR06lYbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="73187"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:55:53 -0700
Message-ID: <2965da2b-6567-4574-9b86-a6a547f32fd8@linux.intel.com>
Date: Thu, 8 Oct 2026 15:55:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/7] tools/vmtb: Add pre-test environment cleanup
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260928072600.426902-1-adam.miszczak@linux.intel.com>
 <20260928072600.426902-6-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260928072600.426902-6-adam.miszczak@linux.intel.com>
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
> Introduce 'EnvironmentCleaner' to ensure a clean DUT state before each
> test by removing leftovers from crashed, failed, or timed-out runs.
> The cleaner handles:
> - terminating orphaned QEMU processes (SIGTERM, then SIGKILL if needed)
> - removing stale QEMU sockets (Guest Agent, QMP monitor)
> - optionally removing leftover qcow2 guest images (disabled by default)
> Wire EnvironmentCleaner().cleanup() into the VM setup fixtures in
> vmm_flows/conftest.py so cleanup runs before every test setup phase.
>
> Consolidate multi-step SR-IOV configuration teardown into a single
> reset_sriov_config() function that removes VFs and restores
> auto provisioning via debugfs.
> Call reset_sriov_config() at test setup when leftover VFs are
> detected, guarding against dirty state from crashed runs.
>
> Drop the explicit provisioning attributes clearing
> (clear_provisioning_attributes/reset_provisioning) and the unused
> cancel_work() teardown step — restore_auto_provisioning is sufficient.
> Remove implicit VF removal from create_vf() (handled by the setup check).
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/bench/drivers/driver_interface.py |  1 +
>   tools/vmtb/bench/drivers/xe.py               |  1 +
>   tools/vmtb/bench/helpers/cleanup.py          | 91 ++++++++++++++++++++
>   tools/vmtb/bench/machines/physical/device.py | 39 ++-------
>   tools/vmtb/vmm_flows/conftest.py             | 34 ++++++--
>   5 files changed, 126 insertions(+), 40 deletions(-)
>   create mode 100644 tools/vmtb/bench/helpers/cleanup.py
>
> diff --git a/tools/vmtb/bench/drivers/driver_interface.py b/tools/vmtb/bench/drivers/driver_interface.py
> index 9d1e5ab00..498afa9af 100644
> --- a/tools/vmtb/bench/drivers/driver_interface.py
> +++ b/tools/vmtb/bench/drivers/driver_interface.py
> @@ -146,6 +146,7 @@ class PfDriverInterface(DriverInterface, abc.ABC):
>       def restore_auto_provisioning(self) -> None:
>           raise NotImplementedError
>   
> +    # Deprecated - not used on xe
>       @abc.abstractmethod
>       def cancel_work(self) -> None:
>           raise NotImplementedError
> diff --git a/tools/vmtb/bench/drivers/xe.py b/tools/vmtb/bench/drivers/xe.py
> index 479c1dd87..45182aad5 100644
> --- a/tools/vmtb/bench/drivers/xe.py
> +++ b/tools/vmtb/bench/drivers/xe.py
> @@ -62,6 +62,7 @@ class XeDriver(PfDriverInterface):
>           path = self.debugfs_path / 'sriov' / 'restore_auto_provisioning'
>           self.write_debugfs(str(path), str(1))
>   
> +    # Deprecated - not used on xe
>       def cancel_work(self) -> None:
>           # Function to cancel all remaing work on GPU (for test cleanup).
>           # Forcing reset (debugfs/gtM/force_reset_sync) shouldn't be used to idle GPU.
> diff --git a/tools/vmtb/bench/helpers/cleanup.py b/tools/vmtb/bench/helpers/cleanup.py
> new file mode 100644
> index 000000000..f1d3e3f76
> --- /dev/null
> +++ b/tools/vmtb/bench/helpers/cleanup.py
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: MIT
> +# Copyright © 2026 Intel Corporation
> +
> +import logging
> +import subprocess
> +import time
> +from pathlib import Path
> +
> +logger = logging.getLogger('Cleanup')
> +
> +
> +class EnvironmentCleaner:
> +    """Pre-test environment cleanup utilities.
> +
> +    Ensures that leftovers from crashed, failed, or timed-out tests
> +    are removed before the next test setup phase begins.
> +    """
> +
> +    QEMU_PROCESS_NAME = 'qemu-system-x86_64'
> +    SOCKET_PATTERNS = ['qga*.sock', 'mon*.sock']
> +    QEMU_IMAGE_PATTERN = 'vm*_*_image.qcow2'
> +
> +    def __init__(self, work_dir: str = '.', remove_qemu_images: bool = False) -> None:
> +        self.work_dir = Path(work_dir)
> +        self.remove_qemu_images = remove_qemu_images
> +
> +    def cleanup(self) -> None:
> +        """Perform full pre-test environment cleanup.
> +        Handles:
> +        - Terminating orphaned QEMU processes
> +        - Removing stale QEMU sockets (Guest Agent, QMP monitor)
> +        - Removing leftover QEMU qcow2 images (optionally)
> +        """
> +        logger.debug("Pre-test environment cleanup")
> +        self.terminate_orphaned_qemu_processes()
> +        self.remove_stale_sockets()
> +        if self.remove_qemu_images:
> +            self.remove_leftover_qemu_images()
> +
> +    def terminate_orphaned_qemu_processes(self) -> None:
> +        """Find and terminate any leftover QEMU processes from previous test runs.
> +           Try SIGTERM first, then SIGKILL if necessary."""
> +        for signal in ('TERM', 'KILL'):
> +            pids = self._find_qemu_pids()
> +            if not pids:
> +                return
> +            for pid_str in pids:
> +                logger.debug("Terminating (SIG%s) orphaned QEMU process (PID: %s)", signal, pid_str)
> +                try:
> +                    subprocess.run(['kill', f'-{signal}', pid_str], check=False)
> +                except Exception as exc:
> +                    logger.warning("Failed to %s QEMU PID %s: %s", signal, pid_str, exc)
> +            time.sleep(1)  # Give the processes a moment to terminate
> +
> +    def _find_qemu_pids(self) -> list[str] | None:
> +        """Return list of QEMU PIDs, or None if none found or pgrep unavailable."""
> +        try:
> +            result = subprocess.run(
> +                ['pgrep', '-f', self.QEMU_PROCESS_NAME],
> +                capture_output=True, text=True, check=False)
> +        except FileNotFoundError:
> +            logger.warning("pgrep not available, skipping orphan QEMU check")
> +            return None
> +
> +        if result.returncode != 0:
> +            return None
> +
> +        return [pid for pid in result.stdout.strip().split('\n') if pid] or None
> +
> +    def remove_stale_sockets(self) -> None:
> +        """Remove leftover QEMU Guest Agent and QMP monitor sockets."""
> +        for pattern in self.SOCKET_PATTERNS:
> +            for sock_path in Path('/tmp').glob(pattern):
> +                try:
> +                    if not sock_path.is_socket():
> +                        continue
> +                    logger.debug("Removing stale VMTB/QEMU socket: %s", sock_path)
> +                    sock_path.unlink()
> +                except OSError as exc:
> +                    logger.warning("Failed to remove stale socket %s: %s", sock_path, exc)
> +
> +    def remove_leftover_qemu_images(self) -> None:
> +        """Remove leftover QEMU qcow2 images from previous test runs."""
> +        for image_path in self.work_dir.glob(self.QEMU_IMAGE_PATTERN):
> +            try:
> +                if not image_path.is_file():
> +                    continue
> +                logger.debug("Removing leftover VMTB/QEMU guest image: %s", image_path)
> +                image_path.unlink()
> +            except OSError as exc:
> +                logger.warning("Failed to remove leftover image %s: %s", image_path, exc)
> diff --git a/tools/vmtb/bench/machines/physical/device.py b/tools/vmtb/bench/machines/physical/device.py
> index b4eebc245..7cbbee277 100644
> --- a/tools/vmtb/bench/machines/physical/device.py
> +++ b/tools/vmtb/bench/machines/physical/device.py
> @@ -91,9 +91,6 @@ class Device(DeviceInterface):
>           Disable SRIOV drivers autoprobe to allow VFIO driver override for VFs.
>           """
>           logger.info("[%s] Enable %s VFs", self.pci_info.bdf, num)
> -        if self.get_current_vfs() != 0:
> -            self.remove_vfs()
> -
>           self.numvf = num
>   
>           # Disable driver autoprobe to avoid driver load on VF (override to vfio is required)
> @@ -233,36 +230,6 @@ class Device(DeviceInterface):
>               self.driver.set_contexts_quota(fn_num, gt_num, resources_config.vfContexts)
>               self.driver.set_doorbells_quota(fn_num, gt_num, resources_config.vfDoorbells)
>   
> -    def clear_provisioning_attributes(self, num_vfs: int) -> None:
> -        """Clear provisioning attributes for a requested number of VFs."""
> -        # Provisioning config are likely wiped out by (xe) debugfs/restore_auto_provisioning,
> -        # but explicit clear shouldn't harm.
> -        self.driver.set_bulk_sched_priority(SchedulingPriority.LOW)
> -        self.driver.set_bulk_exec_quantum_ms(0)
> -        self.driver.set_bulk_preempt_timeout_us(0)
> -
> -        for gt_num in range(self.get_num_gts()):
> -            self.driver.set_pf_policy_reset_engine(gt_num, 0)
> -            self.driver.set_doorbells_quota(0, gt_num, 0)
> -            # PF contexts cannot be set from sysfs
> -
> -            for vf_num in range(1, num_vfs + 1):
> -                self.driver.set_contexts_quota(vf_num, gt_num, 0)
> -                self.driver.set_doorbells_quota(vf_num, gt_num, 0)
> -                if not self.is_gt_media_type(gt_num):
> -                    self.driver.set_vram_quota(vf_num, 0)
> -                    self.driver.set_ggtt_quota(vf_num, gt_num, 0)
> -
> -    def reset_provisioning(self, num_vfs: int) -> None:
> -        """Clear provisioning config for a given number of VFs and restore auto provisioning mode."""
> -        logger.info("[%s] Reset %sxVF provisioning configuration", self.pci_info.bdf, num_vfs)
> -        self.clear_provisioning_attributes(num_vfs)
> -        self.driver.restore_auto_provisioning()
> -
> -    def cancel_work(self) -> None:
> -        """Drop and reset remaining GPU execution at exit."""
> -        self.driver.cancel_work()
> -
>       def get_scheduling_priority(self, fn_num: int) -> SchedulingPriority:
>           """Get scheduling priority for a given VF or PF."""
>           return self.driver.get_sched_priority(fn_num)
> @@ -274,3 +241,9 @@ class Device(DeviceInterface):
>       def set_pf_scheduling_priority(self, val: SchedulingPriority) -> None:
>           """Set scheduling priority for PF only. High prioritizes PF execution over VFs."""
>           self.driver.set_pf_sched_priority(val)
> +
> +    def reset_sriov_config(self) -> None:
> +        """Clear setup - remove enabled VFs and restore auto provisioning mode."""
> +        logger.info("[%s] Reset VFs configuration", self.pci_info.bdf)
> +        self.remove_vfs()
> +        self.driver.restore_auto_provisioning()
> diff --git a/tools/vmtb/vmm_flows/conftest.py b/tools/vmtb/vmm_flows/conftest.py
> index ba6487c84..df395794c 100644
> --- a/tools/vmtb/vmm_flows/conftest.py
> +++ b/tools/vmtb/vmm_flows/conftest.py
> @@ -16,6 +16,7 @@ from bench.configurators.vgpu_profile_config import (VfProvisioningMode,
>                                                        VfSchedulingMode,
>                                                        VgpuProfileConfigurator)
>   from bench.configurators.vmtb_config import VmtbConfigurator
> +from bench.helpers.cleanup import EnvironmentCleaner
>   from bench.helpers.log import HOST_DMESG_FILE
>   from bench.machines.host import Device, Host
>   from bench.machines.virtual.vm import VirtualMachine
> @@ -203,10 +204,7 @@ class VmmTestingSetup:
>           except Exception as exc:
>               logger.error("Error on test teardown (%s)", exc)
>           finally:
> -            num_vfs = self.get_dut().get_current_vfs()
> -            self.get_dut().remove_vfs()
> -            self.get_dut().reset_provisioning(num_vfs)
> -            self.get_dut().cancel_work()
> +            self.get_dut().reset_sriov_config()
>   
>               if self.testing_config.unload_host_drivers_on_teardown:
>                   self.host.unload_drivers()
> @@ -256,6 +254,9 @@ def fixture_setup_vms(get_vmtb_config, get_cmdline_config, get_host, request):
>       tc: VmmTestingConfig = request.param
>       logger.debug(repr(tc))
>   
> +    # Pre-test cleanup: remove leftovers from crashed/failed/timed-out tests
> +    EnvironmentCleaner().cleanup()
> +
>       host: Host = get_host
>       ts: VmmTestingSetup = VmmTestingSetup(get_vmtb_config, get_cmdline_config, host, tc)
>   
> @@ -263,6 +264,10 @@ def fixture_setup_vms(get_vmtb_config, get_cmdline_config, get_host, request):
>       num_vfs = ts.testing_config.num_vfs
>       num_vms = ts.get_num_vms()
>   
> +    if device.get_current_vfs() != 0:
> +        logger.debug("Test environment is not clean - remove VFs remains")
> +        device.reset_sriov_config()
> +
>       logger.info('[Test setup: %sVF-%sVM]', num_vfs, num_vms)
>   
>       if ts.testing_config.provisioning_mode is VfProvisioningMode.VGPU_PROFILE:
> @@ -283,9 +288,6 @@ def fixture_setup_vms(get_vmtb_config, get_cmdline_config, get_host, request):
>           if tc.wa_reduce_vf_lmem and device.has_lmem():
>               ts.vgpu_profile.resources.vfLmem = org_vgpu_profile_vfLmem
>   
> -    else:
> -        device.driver.restore_auto_provisioning()
> -
>       assert num_vfs <= ts.total_vfs, f'Requested number of VFs ({num_vfs}) exceeds total VFs ({ts.total_vfs})'
>       device.create_vf(num_vfs)
>   
> @@ -320,9 +322,18 @@ def fixture_setup_vms(get_vmtb_config, get_cmdline_config, get_host, request):
>   @pytest.fixture(scope='function')
>   def create_1host_1vm(get_vmtb_config, get_cmdline_config, get_host):
>       num_vfs, num_vms = 1, 1
> +
> +    # Pre-test cleanup: remove leftovers from crashed/failed/timed-out tests
> +    EnvironmentCleaner().cleanup()
> +
>       ts: VmmTestingSetup = VmmTestingSetup(get_vmtb_config, get_cmdline_config, get_host,
>                                             VmmTestingConfig(num_vfs, num_vms))
>   
> +    device: Device = ts.get_dut()
> +    if device.get_current_vfs() != 0:
> +        logger.debug("Test environment is not clean - remove VFs remains")
> +        device.reset_sriov_config()
> +
>       logger.info('[Test setup: %sVF-%sVM]', num_vfs, num_vms)
>       logger.debug(repr(ts.testing_config))
>   
> @@ -336,9 +347,18 @@ def create_1host_1vm(get_vmtb_config, get_cmdline_config, get_host):
>   @pytest.fixture(scope='function')
>   def create_1host_2vm(get_vmtb_config, get_cmdline_config, get_host):
>       num_vfs, num_vms = 2, 2
> +
> +    # Pre-test cleanup: remove leftovers from crashed/failed/timed-out tests
> +    EnvironmentCleaner().cleanup()
> +
>       ts: VmmTestingSetup = VmmTestingSetup(get_vmtb_config, get_cmdline_config, get_host,
>                                             VmmTestingConfig(num_vfs, num_vms))
>   
> +    device: Device = ts.get_dut()
> +    if device.get_current_vfs() != 0:
> +        logger.debug("Test environment is not clean - remove VFs remains")
> +        device.reset_sriov_config()
> +
>       logger.info('[Test setup: %sVF-%sVM]', num_vfs, num_vms)
>       logger.debug(repr(ts.testing_config))
>   
