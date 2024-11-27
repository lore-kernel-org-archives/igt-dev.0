Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35034D609CD
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 10:22:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E2410EA7B;
	Wed, 27 Nov 2024 10:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7Ulk83d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2042810EA7B
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732702938; x=1764238938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LJ7W+SWppdBqsscaqD0hAcVsSrcksopu4angTh8o/mM=;
 b=U7Ulk83dRszY2QZhKKAnKCEl5Mv9R9+RrJZzbjvcJ8Fy+Lqfq4/HlzCx
 bYKGwICcTFhy9aBskLudGCJGlzvLzfXES+a4rvMtm3lK5ra93BtvyTS3f
 5mm1qKaTfK3LBqmFLQoa3jqKk03HX94BiqsDTLmyoVuZSk/KXvAW9LlG8
 yc02K3jefuwjf4Z21vdOJNXwltQhfu7oRGChVi66b3A9HSpPG7Gdax5lD
 GiAXjBltI/kw9UHNMKeknuBAE/hToUYPr/FW8285H283N9IJHbUBf2y8O
 KajIVRntgpN0MjenvuHkQ+N14OtMSm4PKL5HNJ68nwhr5FjdYTI9NJe42 w==;
X-CSE-ConnectionGUID: d0FDEwpIS42QaDq2z21oZg==
X-CSE-MsgGUID: sF7bsevATEqxsf1QE4OjxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43391131"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="43391131"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 02:22:18 -0800
X-CSE-ConnectionGUID: xirkGroXQKKc5qspv9Zcog==
X-CSE-MsgGUID: dMMV6y9cTT2Hot1Bf5yUTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="96974286"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 02:22:17 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, marcin.bernatowicz@linux.intel.com,
 michal.wajdeczko@intel.com, pawel.sikora@intel.com
Subject: [PATCH i-g-t v3 2/4] tools/vmtb: Basic SR-IOV tests
Date: Wed, 27 Nov 2024 11:22:00 +0100
Message-Id: <20241127102202.3903735-3-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20241127102202.3903735-1-adam.miszczak@linux.intel.com>
References: <20241127102202.3903735-1-adam.miszczak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

Provide basic SR-IOV test cases:
- enable VFs, pass it to VMs and boot guest OS
- submit basic workloads on a guest with virtualized GPU
- exercise VF driver probe and remove

Tests are created to run with a pytest framework.
Basic tests are located in vmm_flows/test_basic.py,
as test classes with subtests implemented as methods.
Test setup is arranged by fixtures located in vmm_flows/conftest.py.
Test are usually executed in multiple configuration variants
(e.g. various number of VFs enabled, different provisioning settings).

Initially only fundamental test scenarios are provided,
but generally, the tool targets also complex test cases, like:
- VF save/restore (VM migration)
- VF provisioning
- VF scheduling
- VM power states
- VF FLR
- VM crash
- GuC FW versioning

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/vmm_flows/__init__.py   |   0
 tools/vmtb/vmm_flows/conftest.py   | 307 +++++++++++++++++++++++++++++
 tools/vmtb/vmm_flows/test_basic.py | 160 +++++++++++++++
 3 files changed, 467 insertions(+)
 create mode 100644 tools/vmtb/vmm_flows/__init__.py
 create mode 100644 tools/vmtb/vmm_flows/conftest.py
 create mode 100644 tools/vmtb/vmm_flows/test_basic.py

diff --git a/tools/vmtb/vmm_flows/__init__.py b/tools/vmtb/vmm_flows/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/vmm_flows/conftest.py b/tools/vmtb/vmm_flows/conftest.py
new file mode 100644
index 000000000..474fcdb98
--- /dev/null
+++ b/tools/vmtb/vmm_flows/conftest.py
@@ -0,0 +1,307 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import json
+import logging
+import re
+import typing
+
+from dataclasses import dataclass
+from pathlib import Path
+
+import pytest
+
+from bench import exceptions
+from bench.helpers.helpers import (modprobe_driver, modprobe_driver_check)
+from bench.helpers.log import HOST_DMESG_FILE
+from bench.configurators.vgpu_profile_config import VgpuProfileConfigurator, VfSchedulingMode
+from bench.configurators.vgpu_profile import VgpuProfile
+from bench.configurators.vmtb_config import VmtbConfigurator
+from bench.machines.host import Host, Device
+from bench.machines.virtual.vm import VirtualMachine
+
+
+logger = logging.getLogger('Conftest')
+
+
+def pytest_addoption(parser):
+    parser.addoption('--vm-image',
+                     action='store',
+                     help='OS image to boot on VM')
+    parser.addoption('--card',
+                     action='store',
+                     help='Device card index for test execution')
+
+
+@dataclass
+class VmmTestingConfig:
+    """Structure represents test configuration used by a setup fixture.
+
+    Available settings:
+    - num_vfs: requested number of VFs to enable
+    - max_num_vms: maximal number of VMs (the value can be different than enabled number of VFs)
+    - scheduling_mode: requested vGPU scheduling profile (infinite maps to default 0's)
+    - auto_poweron_vm: assign VFs and power on VMs automatically in setup fixture
+    - auto_probe_vm_driver: probe guest DRM driver in setup fixture (VM must be powered on)
+    - unload_host_drivers_on_teardown: unload host DRM drivers in teardown fixture
+    - wa_reduce_vf_lmem: workaround to reduce VF LMEM (for save-restore/migration tests speed-up)
+    """
+    num_vfs: int = 1
+    max_num_vms: int = 2
+    scheduling_mode: VfSchedulingMode = VfSchedulingMode.INFINITE
+
+    auto_poweron_vm: bool = True
+    auto_probe_vm_driver: bool = True
+    unload_host_drivers_on_teardown: bool = False
+    # Temporary W/A: reduce size of LMEM assigned to VFs to speed up a VF state save-restore process
+    wa_reduce_vf_lmem: bool = False
+
+    def __str__(self) -> str:
+        return f'{self.num_vfs}VF'
+
+    def __repr__(self) -> str:
+        return (f'\nVmmTestingConfig:'
+                f'\nNum VFs = {self.num_vfs} / max num VMs = {self.max_num_vms}'
+                f'\nVF scheduling mode = {self.scheduling_mode}'
+                f'\nSetup flags:'
+                f'\n\tVM - auto power-on = {self.auto_poweron_vm}'
+                f'\n\tVM - auto DRM driver probe = {self.auto_probe_vm_driver}'
+                f'\n\tHost - unload drivers on teardown = {self.unload_host_drivers_on_teardown}'
+                f'\n\tW/A - reduce VF LMEM (improves migration time) = {self.wa_reduce_vf_lmem}')
+
+
+class VmmTestingSetup:
+    def __init__(self, vmtb_config: VmtbConfigurator, cmdline_config, host, testing_config):
+        self.testing_config: VmmTestingConfig = testing_config
+        self.host: Host = host
+
+        self.dut_index = vmtb_config.get_host_config().card_index if cmdline_config['card_index'] is None \
+                         else int(cmdline_config['card_index'])
+        self.guest_os_image = vmtb_config.get_guest_config().os_image_path if cmdline_config['vm_image'] is None \
+                         else cmdline_config['vm_image']
+
+        self.vgpu_profiles_dir = vmtb_config.vmtb_config_file.parent / vmtb_config.config.vgpu_profiles_path
+
+        self.host.dut_index = self.dut_index
+        self.host.drm_driver_name = vmtb_config.get_host_config().driver
+        self.host.igt_config = vmtb_config.get_host_config().igt_config
+
+        self.host.load_drivers()
+        self.host.discover_devices()
+
+        logger.info("\nDUT info:"
+                    "\n\tCard index: %s"
+                    "\n\tPCI BDF: %s "
+                    "\n\tDevice ID: %s (%s)"
+                    "\n\tHost DRM driver: %s",
+                    self.host.dut_index,
+                    self.get_dut().pci_info.bdf,
+                    self.get_dut().pci_info.devid, self.get_dut().gpu_model,
+                    self.get_dut().driver.get_name())
+
+        self.vgpu_profile: VgpuProfile = self.get_vgpu_profile()
+
+        # Start maximum requested number of VMs, but not more than VFs supported by the given vGPU profile
+        self.vms: typing.List[VirtualMachine] = [
+            VirtualMachine(vm_idx, self.guest_os_image,
+                           vmtb_config.get_guest_config().driver,
+                           vmtb_config.get_guest_config().igt_config)
+            for vm_idx in range(min(self.vgpu_profile.num_vfs, self.testing_config.max_num_vms))]
+
+    def get_vgpu_profile(self) -> VgpuProfile:
+        configurator = VgpuProfileConfigurator(self.vgpu_profiles_dir, self.get_dut().gpu_model)
+        try:
+            vgpu_profile = configurator.get_vgpu_profile(self.testing_config.num_vfs,
+                                                         self.testing_config.scheduling_mode)
+        except exceptions.VgpuProfileError as exc:
+            logger.error("Suitable vGPU profile not found: %s", exc)
+            raise exceptions.VgpuProfileError('Invalid test setup - vGPU profile not found!')
+
+        vgpu_profile.print_parameters()
+
+        return vgpu_profile
+
+    def get_dut(self) -> Device:
+        try:
+            return self.host.gpu_devices[self.dut_index]
+        except IndexError as exc:
+            logger.error("Invalid VMTB config - device card index = %s not available", self.dut_index)
+            raise exceptions.VmtbConfigError(f'Device card index = {self.dut_index} not available') from exc
+
+    @property
+    def get_vm(self):
+        return self.vms
+
+    def get_num_vms(self) -> int:
+        return len(self.vms)
+
+    def poweron_vms(self):
+        for vm in self.vms:
+            vm.poweron()
+
+    def poweroff_vms(self):
+        for vm in self.vms:
+            if vm.is_running():
+                try:
+                    vm.poweroff()
+                except Exception as exc:
+                    self.testing_config.unload_host_drivers_on_teardown = True
+                    logger.warning("Error on VM%s poweroff (%s)", vm.vmnum, exc)
+
+        if self.testing_config.unload_host_drivers_on_teardown:
+            raise exceptions.GuestError('VM poweroff issue - cleanup on test teardown')
+
+    def teardown(self):
+        try:
+            self.poweroff_vms()
+        except Exception as exc:
+            logger.error("Error on test teardown (%s)", exc)
+        finally:
+            num_vfs = self.get_dut().get_current_vfs()
+            self.get_dut().remove_vfs()
+            self.get_dut().reset_provisioning(num_vfs)
+            self.get_dut().cancel_work()
+
+            if self.testing_config.unload_host_drivers_on_teardown:
+                self.host.unload_drivers()
+
+
+@pytest.fixture(scope='session', name='get_vmtb_config')
+def fixture_get_vmtb_config(create_host_log, pytestconfig):
+    VMTB_CONFIG_FILE = 'vmtb_config.json'
+    # Pytest Config.rootpath points to the VMTB base directory
+    vmtb_config_file_path: Path = pytestconfig.rootpath / VMTB_CONFIG_FILE
+    return VmtbConfigurator(vmtb_config_file_path)
+
+
+@pytest.fixture(scope='session', name='create_host_log')
+def fixture_create_host_log():
+    if HOST_DMESG_FILE.exists():
+        HOST_DMESG_FILE.unlink()
+    HOST_DMESG_FILE.touch()
+
+
+@pytest.fixture(scope='session', name='get_cmdline_config')
+def fixture_get_cmdline_config(request):
+    cmdline_params = {}
+    cmdline_params['vm_image'] = request.config.getoption('--vm-image')
+    cmdline_params['card_index'] = request.config.getoption('--card')
+    return cmdline_params
+
+
+@pytest.fixture(scope='session', name='get_host')
+def fixture_get_host():
+    return Host()
+
+
+@pytest.fixture(scope='class', name='setup_vms')
+def fixture_setup_vms(get_vmtb_config, get_cmdline_config, get_host, request):
+    """Arrange VM environment for the VMM Flows test execution.
+    
+    VM setup steps follow the configuration provided as VmmTestingConfig parameter, including:
+    host drivers probe (DRM and VFIO), provision and enable VFs, boot VMs and load guest DRM driver.
+    Tear-down phase covers test environment cleanup:
+    shutdown VMs, reset provisioning, disable VMs and optional host drivers unload.
+
+    The fixture is designed for test parametrization, as the input to the following test class decorator:
+    @pytest.mark.parametrize('setup_vms', set_test_config(max_vms=N), ids=idfn_test_config, indirect=['setup_vms'])
+    where 'set_test_config' provides request parameter with a VmmTestingConfig (usually list of configs).
+    """
+    tc: VmmTestingConfig = request.param
+    logger.debug(repr(tc))
+
+    host: Host = get_host
+    ts: VmmTestingSetup = VmmTestingSetup(get_vmtb_config, get_cmdline_config, host, tc)
+
+    device: Device = ts.get_dut()
+    num_vfs = ts.vgpu_profile.num_vfs
+    num_vms = ts.get_num_vms()
+
+    logger.info('[Test setup: %sVF-%sVM]', num_vfs, num_vms)
+
+    # XXX: VF migration on discrete devices (with LMEM) is currently quite slow.
+    # As a temporary workaround, reduce size of LMEM assigned to VFs to speed up a state save/load process.
+    if tc.wa_reduce_vf_lmem and device.has_lmem():
+        logger.debug("W/A: reduce VFs LMEM quota to accelerate state save/restore")
+        org_vgpu_profile_vfLmem = ts.vgpu_profile.resources.vfLmem
+        # Assign max 512 MB to VF
+        ts.vgpu_profile.resources.vfLmem = min(ts.vgpu_profile.resources.vfLmem // 2, 536870912)
+
+    device.provision(ts.vgpu_profile)
+
+    assert device.create_vf(num_vfs) == num_vfs
+
+    if tc.auto_poweron_vm:
+        bdf_list = [device.get_vf_bdf(vf) for vf in range(1, num_vms + 1)]
+        for vm, bdf in zip(ts.get_vm, bdf_list):
+            vm.assign_vf(bdf)
+
+        ts.poweron_vms()
+
+        if tc.auto_probe_vm_driver:
+            modprobe_cmds = [modprobe_driver(vm) for vm in ts.get_vm]
+            for i, cmd in enumerate(modprobe_cmds):
+                assert modprobe_driver_check(ts.get_vm[i], cmd), f'modprobe failed on VM{i}'
+
+    logger.info('[Test execution: %sVF-%sVM]', num_vfs, num_vms)
+    yield ts
+
+    logger.info('[Test teardown: %sVF-%sVM]', num_vfs, num_vms)
+    # XXX: cleanup counterpart for VFs LMEM quota workaround - restore original value
+    if tc.wa_reduce_vf_lmem and device.has_lmem():
+        ts.vgpu_profile.resources.vfLmem = org_vgpu_profile_vfLmem
+
+    ts.teardown()
+
+
+def idfn_test_config(test_config: VmmTestingConfig):
+    """Provide test config ID in parametrized tests (e.g. test_something[V4].
+    Usage: @pytest.mark.parametrize([...], ids=idfn_test_config, [...])
+    """
+    return str(test_config)
+
+
+RESULTS_FILE = Path() / "results.json"
+results = {
+    "results_version": 10,
+    "name": "results",
+    "tests": {},
+}
+
+
+@pytest.hookimpl(hookwrapper=True)
+def pytest_report_teststatus(report):
+    yield
+    with open(HOST_DMESG_FILE, 'r+', encoding='utf-8') as dmesg_file:
+        dmesg = dmesg_file.read()
+        test_string = re.findall('[A-Za-z_.]*::.*', report.nodeid)[0]
+        results["name"] = f"vmtb_{test_string}"
+        test_name = f"vmtb@{test_string}"
+        if report.when == 'call':
+            out = report.capstdout
+            if report.passed:
+                result = "pass"
+                out = f"{test_name} passed"
+            elif report.failed:
+                result = "fail"
+            else:
+                result = "skip"
+            result = {"out": out, "result": result, "time": {"start": 0, "end": report.duration},
+                    "err": report.longreprtext, "dmesg": dmesg}
+            results["tests"][test_name] = result
+            dmesg_file.truncate(0)
+        elif report.when == 'setup' and report.failed:
+            result = {"out": report.capstdout, "result": "crash", "time": {"start": 0, "end": report.duration},
+                    "err": report.longreprtext, "dmesg": dmesg}
+            results["tests"][test_name] = result
+            dmesg_file.truncate(0)
+
+
+@pytest.hookimpl()
+def pytest_sessionfinish():
+    if RESULTS_FILE.exists():
+        RESULTS_FILE.unlink()
+    RESULTS_FILE.touch()
+    jsonString = json.dumps(results, indent=2)
+    with open(str(RESULTS_FILE), 'w',  encoding='utf-8') as f:
+        f.write(jsonString)
diff --git a/tools/vmtb/vmm_flows/test_basic.py b/tools/vmtb/vmm_flows/test_basic.py
new file mode 100644
index 000000000..b8155c610
--- /dev/null
+++ b/tools/vmtb/vmm_flows/test_basic.py
@@ -0,0 +1,160 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import logging
+import time
+from typing import List, Tuple
+
+import pytest
+
+from bench.configurators.vgpu_profile_config import VfSchedulingMode
+from bench.executors.gem_wsim import (ONE_CYCLE_DURATION_MS,
+                                      PREEMPT_10MS_WORKLOAD, GemWsim,
+                                      GemWsimResult,
+                                      gem_wsim_parallel_exec_and_check)
+from bench.executors.igt import IgtExecutor, IgtType
+from bench.helpers.helpers import (driver_check, igt_check, igt_run_check,
+                                   modprobe_driver_run_check)
+from vmm_flows.conftest import (VmmTestingConfig, VmmTestingSetup,
+                                idfn_test_config)
+
+logger = logging.getLogger(__name__)
+
+WL_ITERATIONS_10S = 1000
+WL_ITERATIONS_30S = 3000
+MS_IN_SEC = 1000
+DELAY_FOR_WORKLOAD_SEC = 2 # Waiting gem_wsim to be running [seconds]
+DELAY_FOR_RELOAD_SEC = 3 # Waiting before driver reloading [seconds]
+
+
+def set_test_config(test_variants: List[Tuple[int, VfSchedulingMode]],
+                    max_vms: int = 2, vf_driver_load: bool = True) -> List[VmmTestingConfig]:
+    """Helper function to provide a parametrized test with a list of test configuration variants."""
+    logger.debug("Init test variants: %s", test_variants)
+    test_configs: List[VmmTestingConfig] = []
+
+    for config in test_variants:
+        (num_vfs, scheduling_mode) = config
+        test_configs.append(VmmTestingConfig(num_vfs, max_vms, scheduling_mode, auto_probe_vm_driver=vf_driver_load))
+
+    return test_configs
+
+
+test_variants_1 = [(1, VfSchedulingMode.DEFAULT_PROFILE), (2, VfSchedulingMode.DEFAULT_PROFILE)]
+
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_1), ids=idfn_test_config, indirect=['setup_vms'])
+class TestVmSetup:
+    """Verify basic virtualization setup:
+    - probe PF and VFIO drivers (host)
+    - enable and provision VFs (automatic or manual with vGPU profile)
+    - power on VMs with assigned VFs
+    - probe VF driver (guest)
+    - shutdown VMs, reset provisioning and disable VFs
+    """
+    def test_vm_boot(self, setup_vms):
+        logger.info("Test VM boot: power on VM and probe VF driver")
+        ts: VmmTestingSetup = setup_vms
+
+        for vm in ts.vms:
+            logger.info("[%s] Verify VF DRM driver is loaded in a guest OS", vm)
+            assert driver_check(vm)
+
+
+test_variants_2 = [(1, VfSchedulingMode.DEFAULT_PROFILE), (2, VfSchedulingMode.DEFAULT_PROFILE),
+                   (4, VfSchedulingMode.DEFAULT_PROFILE)]
+
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_2), ids=idfn_test_config, indirect=['setup_vms'])
+class TestVmWorkload:
+    """Verify basic IGT workload execution a VM(s):
+    - exec_store: basic store submissions on single/multiple VMs
+    - gem_wsim: workload simulator running in parallel on multiple VMs
+    """
+    def test_store(self, setup_vms):
+        logger.info("Test VM execution: exec_store")
+        ts: VmmTestingSetup = setup_vms
+        igt_worklads: List[IgtExecutor] = []
+
+        for vm in ts.vms:
+            logger.info("[%s] Execute basic WL", vm)
+            igt_worklads.append(IgtExecutor(vm, IgtType.EXEC_STORE))
+
+        for igt in igt_worklads:
+            logger.info("[%s] Verify result of basic WL", igt.target)
+            assert igt_check(igt)
+
+        logger.info("[%s] Verify result of basic WL", ts.host)
+        igt_run_check(ts.host, IgtType.EXEC_STORE)
+
+    def test_wsim(self, setup_vms):
+        logger.info("Test VM execution: gem_wsim")
+        ts: VmmTestingSetup = setup_vms
+
+        if ts.get_num_vms() < 2:
+            pytest.skip("Test scenario not supported for 1xVM setup ")
+
+        # Single workload takes 10ms GPU time, multiplied by 1000 iterations
+        # gives the expected 10s duration and 100 workloads/sec
+        expected = GemWsimResult(ONE_CYCLE_DURATION_MS * WL_ITERATIONS_10S * len(ts.vms) / MS_IN_SEC,
+                                 MS_IN_SEC/ONE_CYCLE_DURATION_MS / len(ts.vms))
+
+        # Check preemptable workload
+        result = gem_wsim_parallel_exec_and_check(ts.vms, PREEMPT_10MS_WORKLOAD, WL_ITERATIONS_10S, expected)
+        logger.info("Execute wsim parallel on VMs - results: %s", result)
+
+
+test_variants_3 = [(2, VfSchedulingMode.DEFAULT_PROFILE), (4, VfSchedulingMode.DEFAULT_PROFILE)]
+
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants=test_variants_3, max_vms=4, vf_driver_load=False),
+                         ids = idfn_test_config, indirect=['setup_vms'])
+class TestVfDriverLoadRemove:
+    """Verify VF (guest) driver load or remove doesn't affect execution on the other VM:
+    - probe VF driver on the last VM while the first VM is running workload
+    - remove VF driver on the first VM while the last VM is running workload
+    - reload previosuly removed VF driver on the same VM
+    """
+    def test_load(self, setup_vms):
+        logger.info("Test VM driver load: VF driver probe while other VM executes workload")
+        ts: VmmTestingSetup = setup_vms
+
+        vm_first = ts.vms[0]
+        vm_last = ts.vms[-1]
+
+        logger.info("[%s] Load VF driver and run basic WL - first VM", vm_first)
+        assert modprobe_driver_run_check(vm_first)
+
+        expected_elapsed_sec = ONE_CYCLE_DURATION_MS * WL_ITERATIONS_30S / MS_IN_SEC
+        gem_wsim = GemWsim(vm_first, 1, WL_ITERATIONS_30S, PREEMPT_10MS_WORKLOAD)
+        time.sleep(DELAY_FOR_WORKLOAD_SEC)
+        assert gem_wsim.is_running()
+
+        logger.info("[%s] Load VF driver - last VM", vm_last)
+        assert modprobe_driver_run_check(vm_last)
+
+        result = gem_wsim.wait_results()
+        assert expected_elapsed_sec * 0.8 < result.elapsed_sec < expected_elapsed_sec * 1.2
+
+    def test_reload(self, setup_vms):
+        logger.info("Test VM driver reload: VF driver remove is followed by probe while other VM executes workload")
+        ts: VmmTestingSetup = setup_vms
+
+        vm_first = ts.vms[0]
+        vm_last = ts.vms[-1]
+
+        logger.info("[%s] Run basic WL - last VM", vm_last)
+        expected_elapsed_sec = ONE_CYCLE_DURATION_MS * WL_ITERATIONS_30S / MS_IN_SEC
+        gem_wsim = GemWsim(vm_last, 1, WL_ITERATIONS_30S, PREEMPT_10MS_WORKLOAD)
+        time.sleep(DELAY_FOR_WORKLOAD_SEC)
+        assert gem_wsim.is_running()
+
+        logger.info("[%s] Remove VF driver - first VM", vm_first)
+        rmmod_pid = vm_first.execute(f'modprobe -rf {vm_first.get_drm_driver_name()}')
+        assert vm_first.execute_wait(rmmod_pid).exit_code == 0
+
+        time.sleep(DELAY_FOR_RELOAD_SEC)
+
+        logger.info("[%s] Reload VF driver and run basic WL - first VM", vm_first)
+        assert modprobe_driver_run_check(vm_first)
+        assert igt_run_check(vm_first, IgtType.EXEC_STORE)
+
+        result = gem_wsim.wait_results()
+        assert expected_elapsed_sec * 0.8 < result.elapsed_sec < expected_elapsed_sec * 1.2
-- 
2.39.1

