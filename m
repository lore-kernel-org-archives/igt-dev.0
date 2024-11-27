Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34123D609CC
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 10:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D810510EA74;
	Wed, 27 Nov 2024 10:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P35ofBmm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D66810EA72
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 10:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732702935; x=1764238935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ek54Jav1qL1xkRbsp0bv2X08cOKvsloS4WedZfGsYJI=;
 b=P35ofBmm0iYQhHUFqjkcETXyD0wvzBhTWn4KHwW4Xw+AtPxIQFY3M8HG
 QoysOCDGGH/uTeTzsQTCsDaXu+1o9cKMTFoIRYcN5IcbbYZ8QkalajppG
 5092AcYKS+ghhxd3IkqtXvLqoOLAHvOpIsIhGQj/h5903+tbhYF6NkR1w
 pAdrkTup3/wGtWktCgKuC2IsDKa/A25ftmn1qTs+ZiyjT6ObT9ehj5Hn4
 8RMGtWy11wcmj5Mh2cuHpNVwLhGGdPy+/UnYrKFpoi8iCd2h7U6/m3n8H
 vzPn8CuwMWF0ac7COvYMQC3xrldxtUP/K7fQf9UulBOEe7x0wskdCp2TF w==;
X-CSE-ConnectionGUID: +jf2EmwfQGird8toxIsnFA==
X-CSE-MsgGUID: ELPTCPysSrieL1wzT8xdDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43391102"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="43391102"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 02:22:15 -0800
X-CSE-ConnectionGUID: VeMNKEpNQ7OHhE2zG4JFfQ==
X-CSE-MsgGUID: 7wVfRr+UQnmCyCT0Qox6UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="96974277"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 02:22:13 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, marcin.bernatowicz@linux.intel.com,
 michal.wajdeczko@intel.com, pawel.sikora@intel.com
Subject: [PATCH i-g-t v3 1/4] tools/vmtb: VM Test Bench core
Date: Wed, 27 Nov 2024 11:21:59 +0100
Message-Id: <20241127102202.3903735-2-adam.miszczak@linux.intel.com>
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

VM Test Bench (VMTB) is a tool for testing virtualization
(SR-IOV) supported by the xe driver.
It allows to enable and provision VFs (Virtual Functions)
and facilitates manipulation of VMs (Virtual Machines)
running virtual GPUs.
This includes starting and accessing the KVM/QEMU VMs,
running workloads or shell commands (Guest/Host),
handling power states, saving and restoring VF state etc.

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/MANIFEST.in                        |   3 +
 tools/vmtb/README.md                          | 106 +++
 tools/vmtb/bench/__init__.py                  |  43 ++
 tools/vmtb/bench/configurators/__init__.py    |   0
 tools/vmtb/bench/configurators/pci.py         |  48 ++
 .../vmtb/bench/configurators/vgpu_profile.py  | 264 ++++++++
 .../configurators/vgpu_profile_config.py      | 148 +++++
 tools/vmtb/bench/configurators/vmtb_config.py | 110 ++++
 tools/vmtb/bench/drivers/__init__.py          |   0
 tools/vmtb/bench/drivers/driver_interface.py  | 198 ++++++
 tools/vmtb/bench/drivers/xe.py                | 307 +++++++++
 tools/vmtb/bench/exceptions.py                |  40 ++
 tools/vmtb/bench/executors/__init__.py        |   0
 .../bench/executors/executor_interface.py     |  22 +
 tools/vmtb/bench/executors/gem_wsim.py        |  70 ++
 tools/vmtb/bench/executors/igt.py             | 117 ++++
 tools/vmtb/bench/executors/shell.py           |  30 +
 tools/vmtb/bench/helpers/__init__.py          |   0
 tools/vmtb/bench/helpers/helpers.py           |  77 +++
 tools/vmtb/bench/helpers/log.py               |  75 +++
 tools/vmtb/bench/machines/__init__.py         |   0
 tools/vmtb/bench/machines/device_interface.py |  23 +
 tools/vmtb/bench/machines/host.py             | 196 ++++++
 .../vmtb/bench/machines/machine_interface.py  |  65 ++
 .../vmtb/bench/machines/physical/__init__.py  |   0
 tools/vmtb/bench/machines/physical/device.py  | 240 +++++++
 tools/vmtb/bench/machines/virtual/__init__.py |   0
 .../machines/virtual/backends/__init__.py     |   0
 .../virtual/backends/backend_interface.py     |  40 ++
 .../machines/virtual/backends/guestagent.py   |  99 +++
 .../machines/virtual/backends/qmp_monitor.py  | 161 +++++
 tools/vmtb/bench/machines/virtual/vm.py       | 604 ++++++++++++++++++
 tools/vmtb/dev-requirements.txt               |   6 +
 tools/vmtb/pyproject.toml                     |  25 +
 tools/vmtb/pytest.ini                         |   0
 tools/vmtb/requirements.txt                   |   2 +
 tools/vmtb/vmtb_config.json                   |  31 +
 37 files changed, 3150 insertions(+)
 create mode 100644 tools/vmtb/MANIFEST.in
 create mode 100644 tools/vmtb/README.md
 create mode 100644 tools/vmtb/bench/__init__.py
 create mode 100644 tools/vmtb/bench/configurators/__init__.py
 create mode 100644 tools/vmtb/bench/configurators/pci.py
 create mode 100644 tools/vmtb/bench/configurators/vgpu_profile.py
 create mode 100644 tools/vmtb/bench/configurators/vgpu_profile_config.py
 create mode 100644 tools/vmtb/bench/configurators/vmtb_config.py
 create mode 100644 tools/vmtb/bench/drivers/__init__.py
 create mode 100644 tools/vmtb/bench/drivers/driver_interface.py
 create mode 100644 tools/vmtb/bench/drivers/xe.py
 create mode 100644 tools/vmtb/bench/exceptions.py
 create mode 100644 tools/vmtb/bench/executors/__init__.py
 create mode 100644 tools/vmtb/bench/executors/executor_interface.py
 create mode 100644 tools/vmtb/bench/executors/gem_wsim.py
 create mode 100644 tools/vmtb/bench/executors/igt.py
 create mode 100644 tools/vmtb/bench/executors/shell.py
 create mode 100644 tools/vmtb/bench/helpers/__init__.py
 create mode 100644 tools/vmtb/bench/helpers/helpers.py
 create mode 100644 tools/vmtb/bench/helpers/log.py
 create mode 100644 tools/vmtb/bench/machines/__init__.py
 create mode 100644 tools/vmtb/bench/machines/device_interface.py
 create mode 100644 tools/vmtb/bench/machines/host.py
 create mode 100644 tools/vmtb/bench/machines/machine_interface.py
 create mode 100644 tools/vmtb/bench/machines/physical/__init__.py
 create mode 100644 tools/vmtb/bench/machines/physical/device.py
 create mode 100644 tools/vmtb/bench/machines/virtual/__init__.py
 create mode 100644 tools/vmtb/bench/machines/virtual/backends/__init__.py
 create mode 100644 tools/vmtb/bench/machines/virtual/backends/backend_interface.py
 create mode 100644 tools/vmtb/bench/machines/virtual/backends/guestagent.py
 create mode 100644 tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
 create mode 100644 tools/vmtb/bench/machines/virtual/vm.py
 create mode 100644 tools/vmtb/dev-requirements.txt
 create mode 100644 tools/vmtb/pyproject.toml
 create mode 100644 tools/vmtb/pytest.ini
 create mode 100644 tools/vmtb/requirements.txt
 create mode 100644 tools/vmtb/vmtb_config.json

diff --git a/tools/vmtb/MANIFEST.in b/tools/vmtb/MANIFEST.in
new file mode 100644
index 000000000..7674c199d
--- /dev/null
+++ b/tools/vmtb/MANIFEST.in
@@ -0,0 +1,3 @@
+include pytest.ini
+include vmtb_config.json
+include vmm_flows/resources/vgpu_profiles/*
diff --git a/tools/vmtb/README.md b/tools/vmtb/README.md
new file mode 100644
index 000000000..42419deae
--- /dev/null
+++ b/tools/vmtb/README.md
@@ -0,0 +1,106 @@
+VM Test Bench
+=============
+
+Description
+-----------
+VM Test Bench (VMTB) is a tool for testing virtualization (SR-IOV)
+supported by the xe driver.
+It allows to enable and provision VFs (Virtual Functions) and facilitates
+manipulation of VMs (Virtual Machines) running virtual GPUs.
+This includes starting and accessing the KVM/QEMU VMs,
+running workloads or shell commands (Guest/Host),
+handling power states, saving and restoring VF state etc.
+
+Requirements
+------------
+VMTB is implemented in Python using pytest testing framework.
+
+Host OS is expected to provide:
+- xe PF driver with SR-IOV support
+- VFIO driver (VF save/restore requires vendor specific driver variant)
+- QEMU (VF save/restore requires QEMU 8.1+)
+- Python 3.11+ with pytest installed
+- VM Test Bench tool deployed
+- IGT binaries
+
+Guest OS is expected to contain:
+- xe VF driver
+- QEMU Guest-Agent service for operating on Guest OS
+- IGT binaries to execute workloads on VM
+
+Usual VMTB testing environment bases on Ubuntu 24.04 installed
+on Host and Guest, but execution on other distros should be also possible.
+
+Building
+--------
+Install all VMTB's development and build dependencies using pip:
+    
+    $ python3 -m pip install -r dev-requirements.txt
+
+The VMTB source distribution package can be built with:
+
+    $ python3 -m build --sdist
+
+that runs Python's `build` frontend
+in an isolated virtual environment (`venv`).
+
+The output tarball is created in the `dist/` subdirectory,
+that should be copied and extracted on a host device under test, for example:
+
+    $ scp dist/vmtb-1.0.0.tar.gz vmuser@dut:/home/vmuser
+    vmuser@dut:~$ tar -xzvf vmtb-1.0.0.tar.gz
+
+Alternatively, VMTB sources can be installed by the IGT build system
+with a `vmtb` option enabled:
+
+    # meson build -Dvmtb=enabled && ninja -C build install
+
+that deploys VMTB in a default libexec directory, like:
+    
+    /usr/local/libexec/igt-gpu-tools/vmtb/
+
+Running tests
+-------------
+Test implemented by VM Test Bench are called VMM Flows and located in
+`vmm_flows/` directory. Test files are prefixed with `test_` and encapsulate
+related validation scenarios. Each test file can contain multiple test classes
+(`TestXYZ`) or functions (`test_xyz`), that can be executed independently.
+
+Ensure a pytest framework is available on a DUT host, install if needed with:
+
+    $ python3 -m pip install pytest
+
+Run the VMM Flows test in the following way (as root):
+
+    # pytest-3 -v ./vmtb/vmm_flows/<test_file_name>.py::<test_class_or_function_name> --vm-image=/path/to/<guest_os.img>
+
+For example, the simplest 1xVF/VM test scenario is executed as:
+
+    # pytest-3 -v ./vmtb/vmm_flows/test_basic.py::TestVmSetup::test_vm_boot[1VF] --vm-image=/home/vmuser/guest_os.img
+
+(in case `pytest-3` command cannot be found, check with just `pytest`)
+
+Name of test class/function can be omitted to execute all tests in file.
+File name can also be omitted, then all tests in
+`vmm_flows` directory will be executed.
+
+Test log (including VM dmesg) is available in `logfile.log` output file.
+Test results are presented as a standard pytest output on a terminal.
+VM (Guest OS) can be accessed manually over VNC on [host_IP]:5900
+(where port is incremented for the consecutive VMs).
+
+Structure
+---------
+VMTB is divided into the following components:
+
+#### `bench/`
+Contains 'core' part of the tool, including Host, Device, Driver and
+Virtual Machine abstractions, means to execute workloads (or other tasks),
+various helper and configuration functions etc.
+VMTB utilizes QMP (QEMU Machine Protocol) to communicate and operate with VMs
+and QGA (QEMU Guest Agent) to interact with the Guest OS.
+
+#### `vmm_flows/`
+Contains actual functional VM-level tests (`test_*.py`)
+as well as a setup and tear-down fixtures (`conftest.py`).
+New test files/scenarios shall be placed in this location.
diff --git a/tools/vmtb/bench/__init__.py b/tools/vmtb/bench/__init__.py
new file mode 100644
index 000000000..ed5d7527d
--- /dev/null
+++ b/tools/vmtb/bench/__init__.py
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import logging
+import logging.config
+
+LOG_CONFIG = {
+    "version": 1,
+    "formatters": {
+        "detailed": {
+            "format": "%(asctime)s [%(levelname)s]: %(name)s (%(funcName)s:%(lineno)d) - %(message)s"
+        },
+        "simple": {"format": "%(levelname)s - %(message)s"},
+    },
+    "handlers": {
+        "console": {
+            "class": "logging.StreamHandler",
+            "formatter": "detailed",
+            "level": "WARNING",
+            "stream": "ext://sys.stdout",
+        },
+        "file": {
+            "backupCount": 5,
+            "class": "logging.handlers.RotatingFileHandler",
+            "filename": "logfile.log",
+            "formatter": "detailed",
+            "maxBytes": 5242880,
+        },
+    },
+    "root": {
+        "handlers": ["console", "file"],
+        "level": "DEBUG"
+    }
+}
+
+logging.config.dictConfig(LOG_CONFIG)
+
+logger = logging.getLogger('VmtbInit')
+
+logger.info('###########################################')
+logger.info('#              VM Test Bench              #')
+logger.info('#    SR-IOV VM-level validation suite     #')
+logger.info('###########################################')
diff --git a/tools/vmtb/bench/configurators/__init__.py b/tools/vmtb/bench/configurators/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/bench/configurators/pci.py b/tools/vmtb/bench/configurators/pci.py
new file mode 100644
index 000000000..8e8afb138
--- /dev/null
+++ b/tools/vmtb/bench/configurators/pci.py
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import enum
+import typing
+
+
+class GpuModel(str, enum.Enum):
+    ATSM150 = 'Arctic Sound M150 (ATS-M1)'
+    ATSM75 = 'Arctic Sound M75 (ATS-M3)'
+    Unknown = 'Unknown'
+
+    def __str__(self) -> str:
+        return str.__str__(self)
+
+
+def get_gpu_model(pci_id: str) -> GpuModel:
+    """Return GPU model associated with a given PCI Device ID."""
+    return pci_ids.get(pci_id.upper(), GpuModel.Unknown)
+
+
+def get_vgpu_profiles_file(gpu_model: GpuModel) -> str:
+    """Return vGPU profile definition JSON file for a given GPU model."""
+    if gpu_model == GpuModel.ATSM150:
+        vgpu_device_file = 'Flex170.json'
+    elif gpu_model == GpuModel.ATSM75:
+        vgpu_device_file = 'Flex140.json'
+    else: # GpuModel.Unknown
+        vgpu_device_file = 'N/A'
+
+    return vgpu_device_file
+
+
+# PCI Device IDs: ATS-M150 (M1)
+_atsm150_pci_ids = {
+    '56C0': GpuModel.ATSM150,
+    '56C2': GpuModel.ATSM150
+}
+
+
+# PCI Device IDs: ATS-M75 (M3)
+_atsm75_pci_ids = {
+    '56C1': GpuModel.ATSM75
+}
+
+
+# All PCI Device IDs to GPU Device Names mapping
+pci_ids: typing.Dict[str, GpuModel] = {**_atsm150_pci_ids, **_atsm75_pci_ids}
diff --git a/tools/vmtb/bench/configurators/vgpu_profile.py b/tools/vmtb/bench/configurators/vgpu_profile.py
new file mode 100644
index 000000000..c4fa7ef39
--- /dev/null
+++ b/tools/vmtb/bench/configurators/vgpu_profile.py
@@ -0,0 +1,264 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import json
+import logging
+from dataclasses import dataclass, field
+from pathlib import Path
+from typing import Any, Dict, List
+
+from bench import exceptions
+
+logger = logging.getLogger('VgpuProfile')
+
+
+@dataclass
+class VgpuResourcesConfig:
+    pfLmem: int = 0
+    pfContexts: int = 0
+    pfDoorbells: int = 0
+    pfGgtt: int = 0
+    vfLmem: int = 0
+    vfContexts: int = 0
+    vfDoorbells: int = 0
+    vfGgtt: int = 0
+
+
+@dataclass
+class VgpuSchedulerConfig:
+    scheduleIfIdle: bool = False
+    pfExecutionQuanta: int = 0
+    pfPreemptionTimeout: int = 0
+    vfExecutionQuanta: int = 0
+    vfPreemptionTimeout: int = 0
+
+
+@dataclass
+class VgpuSecurityConfig:
+    reset_after_vf_switch: bool = False
+    guc_sampling_period: int = 0
+    guc_threshold_cat_error: int = 0
+    guc_threshold_page_fault: int = 0
+    guc_threshold_h2g_storm: int = 0
+    guc_threshold_db_storm: int = 0
+    guc_treshold_gt_irq_storm: int = 0
+    guc_threshold_engine_reset: int = 0
+
+
+@dataclass
+class VgpuProfile:
+    num_vfs: int = 0
+    scheduler: VgpuSchedulerConfig = field(default_factory=VgpuSchedulerConfig)
+    resources: VgpuResourcesConfig = field(default_factory=VgpuResourcesConfig)
+    security: VgpuSecurityConfig = field(default_factory=VgpuSecurityConfig)
+
+    def print_parameters(self) -> None:
+        logger.info(
+            "\nvGPU Profile:\n"
+            "   Num VFs = %s\n"
+            "\nResources:\n"
+            "   PF:\n"
+            "\tLMEM = %s B\n"
+            "\tContexts = %s\n"
+            "\tDoorbells = %s\n"
+            "\tGGTT = %s B\n"
+            "   VF:\n"
+            "\tLMEM = %s B\n"
+            "\tContexts = %s\n"
+            "\tDoorbells = %s\n"
+            "\tGGTT = %s B\n"
+            "\nScheduling:\n"
+            "   Schedule If Idle = %s\n"
+            "   PF:\n"
+            "\tExecution Quanta = %s ms\n"
+            "\tPreemption Timeout = %s us\n"
+            "   VF:\n"
+            "\tExecution Quanta = %s ms\n"
+            "\tPreemption Timeout = %s us\n"
+            "\nSecurity:\n"
+            "   Reset After Vf Switch = %s\n",
+            self.num_vfs,
+            self.resources.pfLmem, self.resources.pfContexts, self.resources.pfDoorbells, self.resources.pfGgtt,
+            self.resources.vfLmem, self.resources.vfContexts, self.resources.vfDoorbells, self.resources.vfGgtt,
+            self.scheduler.scheduleIfIdle,
+            self.scheduler.pfExecutionQuanta, self.scheduler.pfPreemptionTimeout,
+            self.scheduler.vfExecutionQuanta, self.scheduler.vfPreemptionTimeout,
+            self.security.reset_after_vf_switch
+        )
+
+
+# Structures for mapping vGPU profiles definition from JSON files
+@dataclass
+class VgpuProfilePfResourcesDefinition:
+    profile_name: str
+    local_memory_ecc_off: int
+    local_memory_ecc_on: int
+    contexts: int
+    doorbells: int
+    ggtt_size: int
+
+
+@dataclass
+class VgpuProfileVfResourcesDefinition:
+    profile_name: str
+    vf_count: int
+    local_memory_ecc_off: int
+    local_memory_ecc_on: int
+    contexts: int
+    doorbells: int
+    ggtt_size: int
+
+
+@dataclass
+class VgpuProfileSchedulerDefinition:
+    profile_name: str = 'N/A'
+    schedule_if_idle: bool = False
+    pf_execution_quanta: int = 0
+    pf_preemption_timeout: int = 0
+    vf_execution_quanta: str = ''   # To calculate based on number of VFs
+    vf_preemption_timeout: str = '' # To calculate based on number of VFs
+
+
+@dataclass
+class VgpuProfileSecurityDefinition(VgpuSecurityConfig):
+    profile_name: str = 'N/A'
+
+
+@dataclass
+class VgpuProfilesDefinitions:
+    pf_resource_default: str
+    pf_resources: List[VgpuProfilePfResourcesDefinition]
+    vf_resource_default: str
+    vf_resources: List[VgpuProfileVfResourcesDefinition]
+    scheduler_config_default: str
+    scheduler_configs: List[VgpuProfileSchedulerDefinition]
+    security_config_default: str
+    security_configs: List[VgpuProfileSecurityDefinition]
+
+
+class VgpuProfilesJsonReader:
+    def __init__(self, vgpu_json_path: Path) -> None:
+        vgpu_profile_data = self.read_json_file(vgpu_json_path)
+        self.vgpu_profiles: VgpuProfilesDefinitions = self.parse_json_file(vgpu_profile_data)
+
+    def read_json_file(self, vgpu_json_file: Path) -> Any:
+        if not Path(vgpu_json_file).exists():
+            logger.error("vGPU profile JSON file not found: %s", vgpu_json_file)
+            raise exceptions.VgpuProfileError(f'vGPU profile JSON file not found: {vgpu_json_file}')
+
+        with open(vgpu_json_file, mode='r', encoding='utf-8') as json_file:
+            try:
+                vgpu_json = json.load(json_file)
+            except json.JSONDecodeError as exc:
+                logger.error("Invalid vGPU profile JSON format: %s", exc)
+                raise exceptions.VgpuProfileError('Invalid vGPU profile defintion JSON format')
+
+        return vgpu_json
+
+    def __parse_pf_resource_profiles(self, pf_profiles: Dict) -> List[VgpuProfilePfResourcesDefinition]:
+        pf_resources: List[VgpuProfilePfResourcesDefinition] = []
+
+        for pf_profile_name in pf_profiles.keys():
+            lmem_ecc_off = pf_profiles[pf_profile_name]['LocalMemoryEccOff']
+            lmem_ecc_on = pf_profiles[pf_profile_name]['LocalMemoryEccOn']
+            contexts = pf_profiles[pf_profile_name]['Contexts']
+            doorbells = pf_profiles[pf_profile_name]['Doorbells']
+            ggtt_size = pf_profiles[pf_profile_name]['GGTTSize']
+
+            current_pf_resource = VgpuProfilePfResourcesDefinition(pf_profile_name,
+                                                                   lmem_ecc_off,
+                                                                   lmem_ecc_on,
+                                                                   contexts,
+                                                                   doorbells,
+                                                                   ggtt_size)
+
+            pf_resources.append(current_pf_resource)
+
+        return pf_resources
+
+    def __parse_vf_resource_profiles(self, vf_profiles: Dict) -> List[VgpuProfileVfResourcesDefinition]:
+        vf_resources: List[VgpuProfileVfResourcesDefinition] = []
+
+        for vf_profile_name in vf_profiles.keys():
+            vf_count = vf_profiles[vf_profile_name]['VFCount']
+            lmem_ecc_off = vf_profiles[vf_profile_name]['LocalMemoryEccOff']
+            lmem_ecc_on = vf_profiles[vf_profile_name]['LocalMemoryEccOn']
+            contexts = vf_profiles[vf_profile_name]['Contexts']
+            doorbells = vf_profiles[vf_profile_name]['Doorbells']
+            ggtt_size = vf_profiles[vf_profile_name]['GGTTSize']
+
+            current_vf_resource = VgpuProfileVfResourcesDefinition(vf_profile_name,
+                                                                   vf_count,
+                                                                   lmem_ecc_off,
+                                                                   lmem_ecc_on,
+                                                                   contexts,
+                                                                   doorbells,
+                                                                   ggtt_size)
+
+            vf_resources.append(current_vf_resource)
+
+        return vf_resources
+
+    def __parse_scheduler_profiles(self, scheduler_profiles: Dict) -> List[VgpuProfileSchedulerDefinition]:
+        scheduler_configs: List[VgpuProfileSchedulerDefinition] = []
+
+        for scheduler_profile_name in scheduler_profiles.keys():
+            schedule_if_idle = scheduler_profiles[scheduler_profile_name]['GPUTimeSlicing']['ScheduleIfIdle']
+            pf_eq = scheduler_profiles[scheduler_profile_name]['GPUTimeSlicing']['PFExecutionQuantum']
+            pf_pt = scheduler_profiles[scheduler_profile_name]['GPUTimeSlicing']['PFPreemptionTimeout']
+            vf_eq = scheduler_profiles[scheduler_profile_name]['GPUTimeSlicing']['VFAttributes']['VFExecutionQuantum']
+            vf_pt = scheduler_profiles[scheduler_profile_name]['GPUTimeSlicing']['VFAttributes']['VFPreemptionTimeout']
+
+            current_scheduler = VgpuProfileSchedulerDefinition(scheduler_profile_name,
+                                                               schedule_if_idle,
+                                                               pf_eq, pf_pt,
+                                                               vf_eq, vf_pt)
+
+            scheduler_configs.append(current_scheduler)
+
+        return scheduler_configs
+
+    def __parse_security_profiles(self, security_profiles: Dict) -> List[VgpuProfileSecurityDefinition]:
+        security_configs: List[VgpuProfileSecurityDefinition] = []
+
+        for security_profile_name in security_profiles.keys():
+            reset_after_vf_switch = security_profiles[security_profile_name]['ResetAfterVfSwitch']
+            guc_sampling_period = security_profiles[security_profile_name]['GuCSamplingPeriod']
+            guc_threshold_cat_error = security_profiles[security_profile_name]['GuCThresholdCATError']
+            guc_threshold_page_fault = security_profiles[security_profile_name]['GuCThresholdPageFault']
+            guc_threshold_h2g_storm = security_profiles[security_profile_name]['GuCThresholdH2GStorm']
+            guc_threshold_db_storm = security_profiles[security_profile_name]['GuCThresholdDbStorm']
+            guc_treshold_gt_irq_storm = security_profiles[security_profile_name]['GuCThresholdGTIrqStorm']
+            guc_threshold_engine_reset = security_profiles[security_profile_name]['GuCThresholdEngineReset']
+
+            # VgpuSecurityConfig (base class) params go first, therefore profile name
+            # is the last param on the VgpuProfileSecurityDefinition initialization list in this case
+            current_security_config = VgpuProfileSecurityDefinition(reset_after_vf_switch,
+                                                                    guc_sampling_period,
+                                                                    guc_threshold_cat_error,
+                                                                    guc_threshold_page_fault,
+                                                                    guc_threshold_h2g_storm,
+                                                                    guc_threshold_db_storm,
+                                                                    guc_treshold_gt_irq_storm,
+                                                                    guc_threshold_engine_reset,
+                                                                    security_profile_name)
+
+            security_configs.append(current_security_config)
+
+        return security_configs
+
+    def parse_json_file(self, vgpu_json: Dict) -> VgpuProfilesDefinitions:
+        pf_resource_default =  vgpu_json['PFResources']['Default']
+        pf_resources = self.__parse_pf_resource_profiles(vgpu_json['PFResources']['Profile'])
+
+        vf_resource_default =  vgpu_json['vGPUResources']['Default']
+        vf_resources = self.__parse_vf_resource_profiles(vgpu_json['vGPUResources']['Profile'])
+
+        scheduler_default =  vgpu_json['vGPUScheduler']['Default']
+        scheduler_configs = self.__parse_scheduler_profiles(vgpu_json['vGPUScheduler']['Profile'])
+
+        security_default =  vgpu_json['vGPUSecurity']['Default']
+        security_configs = self.__parse_security_profiles(vgpu_json['vGPUSecurity']['Profile'])
+
+        return VgpuProfilesDefinitions(pf_resource_default, pf_resources, vf_resource_default, vf_resources,
+                                       scheduler_default, scheduler_configs, security_default, security_configs)
diff --git a/tools/vmtb/bench/configurators/vgpu_profile_config.py b/tools/vmtb/bench/configurators/vgpu_profile_config.py
new file mode 100644
index 000000000..6a4ef0334
--- /dev/null
+++ b/tools/vmtb/bench/configurators/vgpu_profile_config.py
@@ -0,0 +1,148 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import logging
+from enum import Enum
+from pathlib import Path
+
+from bench import exceptions
+from bench.configurators.pci import GpuModel, get_vgpu_profiles_file
+from bench.configurators.vgpu_profile import (VgpuProfile,
+                                              VgpuProfilesDefinitions,
+                                              VgpuProfilesJsonReader,
+                                              VgpuResourcesConfig,
+                                              VgpuSchedulerConfig,
+                                              VgpuSecurityConfig)
+
+logger = logging.getLogger('DeviceConfigurator')
+
+
+class VfSchedulingMode(str, Enum):
+    INFINITE = 'Infinite' # Infinite EQ/PT - HW default
+    DEFAULT_PROFILE = 'Default_Profile' # Default vGPU scheduler profile
+    FLEXIBLE_30FPS = 'Flexible_30fps_GPUTimeSlicing'
+    FIXED_30FPS = 'Fixed_30fps_GPUTimeSlicing'
+    FLEXIBLE_BURSTABLE_QOS = 'Flexible_BurstableQoS_GPUTimeSlicing'
+
+    def __str__(self) -> str:
+        return str.__str__(self)
+
+
+class VgpuProfileConfigurator:
+    def __init__(self, vgpu_profiles_dir: Path, gpu_model: GpuModel = GpuModel.Unknown) -> None:
+        self.gpu_model: GpuModel = gpu_model
+        self.vgpu_profiles_dir: Path = vgpu_profiles_dir
+        self.supported_vgpu_profiles: VgpuProfilesDefinitions = self.query_vgpu_profiles()
+
+    def __helper_create_vgpu_json_path(self, vgpu_resource_dir: Path) -> Path:
+        vgpu_device_file = get_vgpu_profiles_file(self.gpu_model)
+        vgpu_json_file_path = vgpu_resource_dir / vgpu_device_file
+
+        if not vgpu_json_file_path.exists():
+            logger.error("vGPU profiles JSON file not found in %s", vgpu_resource_dir)
+            raise exceptions.VgpuProfileError(f'vGPU profiles JSON file not found in {vgpu_resource_dir}')
+
+        return vgpu_json_file_path
+
+    def query_vgpu_profiles(self) -> VgpuProfilesDefinitions:
+        """Get all vGPU profiles supported for a given GPU device."""
+        json_reader = VgpuProfilesJsonReader(self.__helper_create_vgpu_json_path(self.vgpu_profiles_dir))
+        return json_reader.vgpu_profiles
+
+    def select_vgpu_resources_profile(self, requested_num_vfs: int) -> VgpuResourcesConfig:
+        """Find vGPU profile matching requested number of VFs.
+        In case exact match cannot be found, try to fit similar profile with up to 2 more VFs, for example:
+        - if requested profile with 3 VFs is not available, return close config with 4 VFs.
+        - if requested profile with neither 9 VFs, nor with 10 or 11 VFs is available - throw 'not found' exeception.
+        """
+        vgpu_resources_config = VgpuResourcesConfig()
+
+        for pf_resource in self.supported_vgpu_profiles.pf_resources:
+            if pf_resource.profile_name == self.supported_vgpu_profiles.pf_resource_default:
+                vgpu_resources_config.pfLmem = pf_resource.local_memory_ecc_on
+                vgpu_resources_config.pfContexts = pf_resource.contexts
+                vgpu_resources_config.pfDoorbells = pf_resource.doorbells
+                vgpu_resources_config.pfGgtt = pf_resource.ggtt_size
+
+        is_vf_resource_found = False
+        for vf_resource in self.supported_vgpu_profiles.vf_resources:
+            current_num_vfs = vf_resource.vf_count
+
+            if current_num_vfs == requested_num_vfs:
+                is_vf_resource_found = True # Exact match
+            elif requested_num_vfs < current_num_vfs <= requested_num_vfs + 2:
+                logger.debug("Unable to find accurate vGPU profile but have similar: %s", vf_resource.profile_name)
+                is_vf_resource_found = True # Approximate match
+
+            if is_vf_resource_found:
+                vgpu_resources_config.vfLmem = vf_resource.local_memory_ecc_on
+                vgpu_resources_config.vfContexts = vf_resource.contexts
+                vgpu_resources_config.vfDoorbells = vf_resource.doorbells
+                vgpu_resources_config.vfGgtt = vf_resource.ggtt_size
+                break
+
+        if not is_vf_resource_found:
+            logger.error("vGPU VF resources profile %sxVF not found!", requested_num_vfs)
+            raise exceptions.VgpuProfileError(f'vGPU VF resources profile {requested_num_vfs}xVF not found!')
+
+        return vgpu_resources_config
+
+    def select_vgpu_scheduler_profile(self, requested_num_vfs: int,
+                                      requested_scheduler: VfSchedulingMode) -> VgpuSchedulerConfig:
+        # Function eval is needed to calculate VF EQ/PT for num_vfs
+        # Disable eval warning
+        # pylint: disable=W0123
+        vgpu_scheduler_config = VgpuSchedulerConfig()
+
+        if requested_scheduler is VfSchedulingMode.INFINITE:
+            return vgpu_scheduler_config
+
+        for scheduler in self.supported_vgpu_profiles.scheduler_configs:
+            if scheduler.profile_name == requested_scheduler:
+                vgpu_scheduler_config.scheduleIfIdle = scheduler.schedule_if_idle
+                vgpu_scheduler_config.pfExecutionQuanta = scheduler.pf_execution_quanta
+                vgpu_scheduler_config.pfPreemptionTimeout = scheduler.pf_preemption_timeout
+
+                lambda_vf_eq = eval(scheduler.vf_execution_quanta)
+                lambda_vf_eq_result = lambda_vf_eq(requested_num_vfs)
+
+                lambda_vf_pt = eval(scheduler.vf_preemption_timeout)
+                lambda_vf_pt_result = lambda_vf_pt(requested_num_vfs)
+
+                vgpu_scheduler_config.vfExecutionQuanta = lambda_vf_eq_result
+                vgpu_scheduler_config.vfPreemptionTimeout = lambda_vf_pt_result
+
+        return vgpu_scheduler_config
+
+    def select_vgpu_security_profile(self) -> VgpuSecurityConfig:
+        # Currently supports only default security profile
+        vgpu_security_config = VgpuSecurityConfig()
+
+        for security_profile in self.supported_vgpu_profiles.security_configs:
+            if security_profile.profile_name == self.supported_vgpu_profiles.security_config_default:
+                vgpu_security_config.reset_after_vf_switch = security_profile.reset_after_vf_switch
+                vgpu_security_config.guc_sampling_period = security_profile.guc_sampling_period
+                vgpu_security_config.guc_threshold_cat_error = security_profile.guc_threshold_cat_error
+                vgpu_security_config.guc_threshold_page_fault = security_profile.guc_threshold_page_fault
+                vgpu_security_config.guc_threshold_h2g_storm = security_profile.guc_threshold_h2g_storm
+                vgpu_security_config.guc_threshold_db_storm = security_profile.guc_threshold_db_storm
+                vgpu_security_config.guc_treshold_gt_irq_storm = security_profile.guc_treshold_gt_irq_storm
+                vgpu_security_config.guc_threshold_engine_reset = security_profile.guc_threshold_engine_reset
+
+        return vgpu_security_config
+
+    def get_vgpu_profile(self, requested_num_vfs: int, requested_scheduler: VfSchedulingMode) -> VgpuProfile:
+        """Get vGPU profile for requested number of VFs, scheduler and security modes."""      
+        logger.info("Requested vGPU profile: %s VFs / scheduling: %s", requested_num_vfs, requested_scheduler)
+
+        vgpu_profile: VgpuProfile = VgpuProfile()
+        vgpu_profile.num_vfs = requested_num_vfs
+        vgpu_profile.resources = self.select_vgpu_resources_profile(requested_num_vfs)
+
+        if requested_scheduler is VfSchedulingMode.DEFAULT_PROFILE:
+            requested_scheduler = VfSchedulingMode(self.supported_vgpu_profiles.scheduler_config_default)
+
+        vgpu_profile.scheduler = self.select_vgpu_scheduler_profile(requested_num_vfs, requested_scheduler)
+        vgpu_profile.security = self.select_vgpu_security_profile()
+
+        return vgpu_profile
diff --git a/tools/vmtb/bench/configurators/vmtb_config.py b/tools/vmtb/bench/configurators/vmtb_config.py
new file mode 100644
index 000000000..49dde4589
--- /dev/null
+++ b/tools/vmtb/bench/configurators/vmtb_config.py
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import json
+import logging
+from dataclasses import dataclass
+from pathlib import Path
+from typing import Any, Dict
+
+from bench import exceptions
+
+logger = logging.getLogger('VmtbConfigurator')
+
+
+@dataclass
+class VmtbIgtConfig:
+    test_dir: str
+    tool_dir: str
+    lib_dir: str
+    result_dir: str
+    options: str
+
+
+@dataclass
+class VmtbHostConfig:
+    card_index: int
+    driver: str
+    igt_config: VmtbIgtConfig
+
+
+@dataclass
+class VmtbGuestConfig:
+    os_image_path: str
+    driver: str
+    igt_config: VmtbIgtConfig
+
+
+@dataclass
+class VmtbConfig:
+    host_config: VmtbHostConfig
+    guest_config: VmtbGuestConfig
+    vgpu_profiles_path: str
+    guc_ver_path: str
+    ci_host_dmesg_file: str
+
+
+class VmtbConfigurator:
+    def __init__(self, vmtb_config_file_path: Path) -> None:
+        self.vmtb_config_file: Path = vmtb_config_file_path
+        self.config: VmtbConfig = self.query_vmtb_config()
+
+    def query_vmtb_config(self) -> VmtbConfig:
+        json_reader = VmtbConfigJsonReader(self.vmtb_config_file)
+        return json_reader.vmtb_config
+
+    def get_host_config(self) -> VmtbHostConfig:
+        return self.config.host_config
+
+    def get_guest_config(self) -> VmtbGuestConfig:
+        return self.config.guest_config
+
+
+class VmtbConfigJsonReader:
+    def __init__(self, config_json_path: Path) -> None:
+        vgpu_profile_data = self.read_json_file(config_json_path)
+        self.vmtb_config: VmtbConfig = self.parse_json_file(vgpu_profile_data)
+
+    def read_json_file(self, config_json_file: Path) -> Any:
+        if not config_json_file.exists():
+            logger.error("VMTB config JSON file not found: %s", config_json_file)
+            raise exceptions.VmtbConfigError(f'VMTB config JSON file not found: {config_json_file}')
+
+        with open(config_json_file, mode='r', encoding='utf-8') as json_file:
+            try:
+                vgpu_json = json.load(json_file)
+            except json.JSONDecodeError as exc:
+                logger.error("Invalid VMTB config JSON format: %s", exc)
+                raise exceptions.VmtbConfigError(f'Invalid VMTB config JSON format: {exc}')
+
+        return vgpu_json
+
+    def get_igt_config(self, igt_config_json: Dict) -> VmtbIgtConfig:
+        igt_config = VmtbIgtConfig(
+            test_dir=igt_config_json['igt']['test_dir'],
+            tool_dir=igt_config_json['igt']['tool_dir'],
+            lib_dir=igt_config_json['igt']['lib_dir'],
+            result_dir=igt_config_json['igt']['result_dir'],
+            options=igt_config_json['igt']['options'])
+
+        return igt_config
+
+    def parse_json_file(self, config_json: Dict) -> VmtbConfig:
+        vmtb_host_config = VmtbHostConfig(
+            card_index=config_json['host']['card_index'],
+            driver=config_json['host']['driver'],
+            igt_config=self.get_igt_config(config_json['host']))
+
+        vmtb_guest_config = VmtbGuestConfig(
+            os_image_path=config_json['guest']['os_image'],
+            driver=config_json['guest']['driver'],
+            igt_config=self.get_igt_config(config_json['guest']))
+
+        vmtb_config = VmtbConfig(
+            host_config=vmtb_host_config,
+            guest_config=vmtb_guest_config,
+            vgpu_profiles_path=config_json['resources']['vgpu_profiles_path'],
+            guc_ver_path=config_json['resources']['guc_ver_path'],
+            ci_host_dmesg_file=config_json['ci']['host_dmesg_file'])
+
+        return vmtb_config
diff --git a/tools/vmtb/bench/drivers/__init__.py b/tools/vmtb/bench/drivers/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/bench/drivers/driver_interface.py b/tools/vmtb/bench/drivers/driver_interface.py
new file mode 100644
index 000000000..af2f96837
--- /dev/null
+++ b/tools/vmtb/bench/drivers/driver_interface.py
@@ -0,0 +1,198 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import abc
+import enum
+import typing
+
+
+class SchedulingPriority(enum.Enum):
+    LOW = 0
+    NORMAL = 1
+    HIGH = 2
+
+
+class VfControl(str, enum.Enum):
+    pause = 'pause'
+    resume = 'resume'
+    stop = 'stop'
+    clear = 'clear'
+
+    def __str__(self) -> str:
+        return str.__str__(self)
+
+
+class DriverInterface(abc.ABC):
+
+    @staticmethod
+    @abc.abstractmethod
+    def get_name() -> str:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def bind(self, bdf: str) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def unbind(self, bdf: str) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_totalvfs(self) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_numvfs(self) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_numvfs(self, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_drivers_autoprobe(self) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_drivers_autoprobe(self, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_num_gts(self) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def has_lmem(self) -> bool:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_auto_provisioning(self) -> bool:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_auto_provisioning(self, val: bool) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def cancel_work(self) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_pf_ggtt_spare(self, gt_num: int) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_pf_ggtt_spare(self, gt_num: int, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_pf_lmem_spare(self, gt_num: int) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_pf_lmem_spare(self, gt_num: int, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_pf_contexts_spare(self, gt_num: int) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_pf_contexts_spare(self, gt_num: int, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_pf_doorbells_spare(self, gt_num: int) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_pf_doorbells_spare(self, gt_num: int, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_pf_sched_priority(self, gt_num: int) -> SchedulingPriority:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_pf_sched_priority(self, gt_num: int, val: SchedulingPriority) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_pf_policy_reset_engine(self, gt_num: int) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_pf_policy_reset_engine(self, gt_num: int, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_pf_policy_sample_period_ms(self, gt_num: int) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_pf_policy_sample_period_ms(self, gt_num: int, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_pf_policy_sched_if_idle(self, gt_num: int) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_pf_policy_sched_if_idle(self, gt_num: int, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_ggtt_quota(self, vf_num: int, gt_num: int) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_ggtt_quota(self, vf_num: int, gt_num: int, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_lmem_quota(self, vf_num: int, gt_num: int) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_lmem_quota(self, vf_num: int, gt_num: int, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_contexts_quota(self, vf_num: int, gt_num: int) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_contexts_quota(self, vf_num: int, gt_num: int, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_doorbells_quota(self, vf_num: int, gt_num: int) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_doorbells_quota(self, vf_num: int, gt_num: int, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_exec_quantum_ms(self, vf_num: int, gt_num: int) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_exec_quantum_ms(self, vf_num: int, gt_num: int, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_preempt_timeout_us(self, vf_num: int, gt_num: int) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_preempt_timeout_us(self, vf_num: int, gt_num: int, val: int) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def set_vf_control(self, vf_num: int, val: VfControl) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_ggtt_available(self, gt_num: int) -> typing.Tuple[int, int]:
+        raise NotImplementedError
diff --git a/tools/vmtb/bench/drivers/xe.py b/tools/vmtb/bench/drivers/xe.py
new file mode 100644
index 000000000..009cec5be
--- /dev/null
+++ b/tools/vmtb/bench/drivers/xe.py
@@ -0,0 +1,307 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import logging
+import typing
+from pathlib import Path
+
+from bench import exceptions
+from bench.drivers.driver_interface import (DriverInterface,
+                                            SchedulingPriority, VfControl)
+from bench.helpers.log import LogDecorators
+
+logger = logging.getLogger('XeDriver')
+
+
+class XeDriver(DriverInterface):
+    def __init__(self, card_index: int) -> None:
+        self.sysfs_card_path = Path(f'/sys/class/drm/card{card_index}')
+        self.debugfs_path = Path(f'/sys/kernel/debug/dri/{card_index}')
+
+    @staticmethod
+    def get_name() -> str:
+        return 'xe'
+
+    @LogDecorators.parse_kmsg
+    def __write_fs(self, base_path: Path, name: str, value: str) -> None:
+        path = base_path / name
+        try:
+            path.write_text(value)
+            logger.debug("Write: %s -> %s", value, path)
+        except Exception as exc:
+            logger.error("Unable to write %s -> %s", value, path)
+            raise exceptions.HostError(f'Could not write to {path}. Error: {exc}') from exc
+
+    @LogDecorators.parse_kmsg
+    def __read_fs(self,  base_path: Path, name: str) -> str:
+        path = base_path / name
+        try:
+            ret = path.read_text()
+        except Exception as exc:
+            logger.error("Unable to read %s", path)
+            raise exceptions.HostError(f'Could not read from {path}. Error: {exc}') from exc
+
+        logger.debug("Read: %s -> %s", path, ret.strip())
+        return ret
+
+    def __write_sysfs(self, name: str, value: str) -> None:
+        self.__write_fs(self.sysfs_card_path / 'device', name, value)
+
+    def __read_sysfs(self, name: str) -> str:
+        return str(self.__read_fs(self.sysfs_card_path / 'device', name))
+
+    def __write_debugfs(self, name: str, value: str) -> None:
+        self.__write_fs(self.debugfs_path, name, value)
+
+    def __read_debugfs(self, name: str) -> str:
+        return str(self.__read_fs(self.debugfs_path, name))
+
+    def bind(self, bdf: str) -> None:
+        self.__write_sysfs('driver/bind', bdf)
+
+    def unbind(self, bdf: str) -> None:
+        self.__write_sysfs('driver/unbind', bdf)
+
+    def get_totalvfs(self) -> int:
+        return int(self.__read_sysfs('sriov_totalvfs'))
+
+    def get_numvfs(self) -> int:
+        return int(self.__read_sysfs('sriov_numvfs'))
+
+    def set_numvfs(self, val: int) -> None:
+        self.__write_sysfs('sriov_numvfs', str(val))
+
+    def get_drivers_autoprobe(self) -> int:
+        return int(self.__read_sysfs('sriov_drivers_autoprobe'))
+
+    def set_drivers_autoprobe(self, val: int) -> None:
+        self.__write_sysfs('sriov_drivers_autoprobe', str(val))
+
+    def get_num_gts(self) -> int:
+        gt_num = 0
+        # Fixme: tile0 only at the moment, add support for multiple tiles if needed
+        path = self.sysfs_card_path / 'device' / 'tile0' / 'gt'
+
+        if path.exists():
+            gt_num = 1
+        else:
+            while Path(f'{path}{gt_num}').exists():
+                gt_num += 1
+
+        return gt_num
+
+    def has_lmem(self) -> bool:
+        # XXX: is this a best way to check if LMEM is present?
+        path = self.debugfs_path / 'gt0' / 'pf' / 'lmem_spare'
+        return path.exists()
+
+    def get_auto_provisioning(self) -> bool:
+        raise exceptions.NotAvailableError('auto_provisioning attribute not available')
+
+    def set_auto_provisioning(self, val: bool) -> None:
+        raise exceptions.NotAvailableError('auto_provisioning attribute not available')
+
+    def cancel_work(self) -> None:
+        # Function to cancel all remaing work on GPU (for test cleanup).
+        # Forcing reset (debugfs/gtM/force_reset_sync) shouldn't be used to idle GPU.
+        pass
+
+    # Create debugfs path to given parameter (without a base part):
+    # gt@gt_num/[pf|vf@vf_num]/@attr
+    # @vf_num: VF number (1-based) or 0 for PF
+    # @gt_num: GT instance number
+    # @subdir: subdirectory for attribute or empty string if not exists
+    # @attr: iov parameter name
+    # Returns: iov debugfs path to @attr
+    def __helper_create_debugfs_path(self, vf_num: int, gt_num: int, subdir: str, attr: str) -> str:
+        vf_gt_part = f'gt{gt_num}/pf' if vf_num == 0 else f'gt{gt_num}/vf{vf_num}'
+        return f'{vf_gt_part}/{subdir}/{attr}'
+
+    # PF spare resources
+    # Debugfs location: [SRIOV debugfs base path]/gtM/pf/xxx_spare
+    def get_pf_ggtt_spare(self, gt_num: int) -> int:
+        path = self.__helper_create_debugfs_path(0, gt_num, '', 'ggtt_spare')
+        return int(self.__read_debugfs(path))
+
+    def set_pf_ggtt_spare(self, gt_num: int, val: int) -> None:
+        path = self.__helper_create_debugfs_path(0, gt_num, '',  'ggtt_spare')
+        self.__write_debugfs(path, str(val))
+
+    def get_pf_lmem_spare(self, gt_num: int) -> int:
+        path = self.__helper_create_debugfs_path(0, gt_num, '', 'lmem_spare')
+        return int(self.__read_debugfs(path))
+
+    def set_pf_lmem_spare(self, gt_num: int, val: int) -> None:
+        path = self.__helper_create_debugfs_path(0, gt_num, '', 'lmem_spare')
+        self.__write_debugfs(path, str(val))
+
+    def get_pf_contexts_spare(self, gt_num: int) -> int:
+        path = self.__helper_create_debugfs_path(0, gt_num, '', 'contexts_spare')
+        return int(self.__read_debugfs(path))
+
+    def set_pf_contexts_spare(self, gt_num: int, val: int) -> None:
+        path = self.__helper_create_debugfs_path(0, gt_num, '', 'contexts_spare')
+        self.__write_debugfs(path, str(val))
+
+    def get_pf_doorbells_spare(self, gt_num: int) -> int:
+        path = self.__helper_create_debugfs_path(0, gt_num, '', 'doorbells_spare')
+        return int(self.__read_debugfs(path))
+
+    def set_pf_doorbells_spare(self, gt_num: int, val: int) -> None:
+        path = self.__helper_create_debugfs_path(0, gt_num, '', 'doorbells_spare')
+        self.__write_debugfs(path, str(val))
+
+    # PF specific provisioning parameters
+    # Debugfs location: [SRIOV debugfs base path]/gtM/pf
+    def get_pf_sched_priority(self, gt_num: int) -> SchedulingPriority:
+        logger.warning("PF sched_priority param not available")
+        return SchedulingPriority.LOW
+
+    def set_pf_sched_priority(self, gt_num: int, val: SchedulingPriority) -> None:
+        logger.warning("PF sched_priority param not available")
+
+    def get_pf_policy_reset_engine(self, gt_num: int) -> int:
+        path = self.__helper_create_debugfs_path(0, gt_num, '', 'reset_engine')
+        return int(self.__read_debugfs(path))
+
+    def set_pf_policy_reset_engine(self, gt_num: int, val: int) -> None:
+        path = self.__helper_create_debugfs_path(0, gt_num, '', 'reset_engine')
+        self.__write_debugfs(path, str(val))
+
+    def get_pf_policy_sample_period_ms(self, gt_num: int) -> int:
+        path = self.__helper_create_debugfs_path(0, gt_num, '', 'sample_period_ms')
+        return int(self.__read_debugfs(path))
+
+    def set_pf_policy_sample_period_ms(self, gt_num: int, val: int) -> None:
+        path = self.__helper_create_debugfs_path(0, gt_num, '', 'sample_period_ms')
+        self.__write_debugfs(path, str(val))
+
+    def get_pf_policy_sched_if_idle(self, gt_num: int) -> int:
+        path = self.__helper_create_debugfs_path(0, gt_num, '', 'sched_if_idle')
+        return int(self.__read_debugfs(path))
+
+    def set_pf_policy_sched_if_idle(self, gt_num: int, val: int) -> None:
+        # In order to set strict scheduling policy, PF scheduling priority needs to be default
+        path = self.__helper_create_debugfs_path(0, gt_num, '', 'sched_if_idle')
+        self.__write_debugfs(path, str(val))
+
+    # VF and PF provisioning parameters
+    # Debugfs location: [SRIOV debugfs base path]/gtM/[pf|vfN]
+    # @vf_num: VF number (1-based) or 0 for PF
+    def get_ggtt_quota(self, vf_num: int, gt_num: int) -> int:
+        if vf_num == 0:
+            logger.warning("PF ggtt_quota not available")
+            return 0
+
+        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'ggtt_quota')
+        return int(self.__read_debugfs(path))
+
+    def set_ggtt_quota(self, vf_num: int, gt_num: int, val: int) -> None:
+        if vf_num == 0:
+            logger.warning("PF ggtt_quota not available")
+            return
+
+        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'ggtt_quota')
+        self.__write_debugfs(path, str(val))
+
+    def get_lmem_quota(self, vf_num: int, gt_num: int) -> int:
+        if vf_num == 0:
+            logger.warning("PF lmem_quota not available")
+            return 0
+
+        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'lmem_quota')
+        return int(self.__read_debugfs(path)) if self.has_lmem() else 0
+
+    def set_lmem_quota(self, vf_num: int, gt_num: int, val: int) -> None:
+        if vf_num == 0:
+            logger.warning("PF lmem_quota not available")
+            return
+
+        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'lmem_quota')
+        if self.has_lmem():
+            self.__write_debugfs(path, str(val))
+
+    def get_contexts_quota(self, vf_num: int, gt_num: int) -> int:
+        if vf_num == 0:
+            logger.warning("PF contexts_quota not available")
+            return 0
+
+        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'contexts_quota')
+        return int(self.__read_debugfs(path))
+
+    def set_contexts_quota(self, vf_num: int, gt_num: int, val: int) -> None:
+        if vf_num == 0:
+            logger.warning("PF contexts_quota not available")
+            return
+
+        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'contexts_quota')
+        self.__write_debugfs(path, str(val))
+
+    def get_doorbells_quota(self, vf_num: int, gt_num: int) -> int:
+        if vf_num == 0:
+            logger.warning("PF doorbells_quota not available")
+            return 0
+
+        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'doorbells_quota')
+        return int(self.__read_debugfs(path))
+
+    def set_doorbells_quota(self, vf_num: int, gt_num: int, val: int) -> None:
+        if vf_num == 0:
+            logger.warning("PF doorbells_quota not available")
+            return
+
+        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'doorbells_quota')
+        self.__write_debugfs(path, str(val))
+
+    def get_exec_quantum_ms(self, vf_num: int, gt_num: int) -> int:
+        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'exec_quantum_ms')
+        return int(self.__read_debugfs(path))
+
+    def set_exec_quantum_ms(self, vf_num: int, gt_num: int, val: int) -> None:
+        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'exec_quantum_ms')
+        self.__write_debugfs(path, str(val))
+
+    def get_preempt_timeout_us(self, vf_num: int, gt_num: int) -> int:
+        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'preempt_timeout_us')
+        return int(self.__read_debugfs(path))
+
+    def set_preempt_timeout_us(self, vf_num: int, gt_num: int, val: int) -> None:
+        path = self.__helper_create_debugfs_path(vf_num, gt_num, '', 'preempt_timeout_us')
+        self.__write_debugfs(path, str(val))
+
+    # Control state of the running VF (WO)
+    # Debugfs location: [SRIOV debugfs base path]/gtM/vfN/control
+    # Allows PF admin to pause, resume or stop handling
+    # submission requests from given VF and clear provisioning.
+    # control: "pause|resume|stop|clear"
+    # For debug purposes only.
+    def set_vf_control(self, vf_num: int, val: VfControl) -> None:
+        path = self.__helper_create_debugfs_path(vf_num, 0, '', 'control')
+        self.__write_debugfs(path, val)
+
+    # Read [attribute]_available value from debugfs:
+    # /sys/kernel/debug/dri/[card_index]/gt@gt_num/pf/@attr_available
+    # @gt_num: GT instance number
+    # @attr: iov parameter name
+    # Returns: total and available size for @attr
+    def __helper_get_debugfs_available(self, gt_num: int, attr: str) -> typing.Tuple[int, int]:
+        path = self.debugfs_path / f'gt{gt_num}' / 'pf' / f'{attr}_available'
+        total = available = 0
+
+        out = path.read_text()
+        for line in out.splitlines():
+            param, value = line.split(':')
+            value = value.lstrip().split('\t')[0]
+
+            if param == 'total':
+                total = int(value)
+            elif param == 'avail':
+                available = int(value)
+
+        return (total, available)
+
+    # Resources total availability
+    # Debugfs location: [SRIOV debugfs base path]/gtM/pf/
+    def get_ggtt_available(self, gt_num: int) -> typing.Tuple[int, int]:
+        """Get total and available GGTT size."""
+        return self.__helper_get_debugfs_available(gt_num, 'ggtt')
diff --git a/tools/vmtb/bench/exceptions.py b/tools/vmtb/bench/exceptions.py
new file mode 100644
index 000000000..95ca2aa9b
--- /dev/null
+++ b/tools/vmtb/bench/exceptions.py
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+class BenchError(Exception):
+    pass
+
+
+# Host errors:
+class HostError(BenchError):
+    pass
+
+
+# Guest errors:
+class GuestError(BenchError):
+    pass
+
+
+class GuestAgentError(GuestError):
+    pass
+
+
+class AlarmTimeoutError(GuestError):
+    pass
+
+
+# Generic errors:
+class GemWsimError(BenchError):
+    pass
+
+
+class VgpuProfileError(BenchError):
+    pass
+
+
+class NotAvailableError(BenchError):
+    pass
+
+
+class VmtbConfigError(BenchError):
+    pass
diff --git a/tools/vmtb/bench/executors/__init__.py b/tools/vmtb/bench/executors/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/bench/executors/executor_interface.py b/tools/vmtb/bench/executors/executor_interface.py
new file mode 100644
index 000000000..e1598fd29
--- /dev/null
+++ b/tools/vmtb/bench/executors/executor_interface.py
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import abc
+import signal
+
+from bench.machines.machine_interface import ProcessResult
+
+
+class ExecutorInterface(metaclass=abc.ABCMeta):
+
+    @abc.abstractmethod
+    def status(self) -> ProcessResult:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def wait(self) -> ProcessResult:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def sendsig(self, sig: signal.Signals) -> None:
+        raise NotImplementedError
diff --git a/tools/vmtb/bench/executors/gem_wsim.py b/tools/vmtb/bench/executors/gem_wsim.py
new file mode 100644
index 000000000..46fa2291c
--- /dev/null
+++ b/tools/vmtb/bench/executors/gem_wsim.py
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import logging
+import re
+import typing
+
+from bench import exceptions
+from bench.executors.shell import ShellExecutor
+from bench.machines.machine_interface import DEFAULT_TIMEOUT, MachineInterface
+
+logger = logging.getLogger('GemWsim')
+
+
+class GemWsimResult(typing.NamedTuple):
+    elapsed_sec: float
+    workloads_per_sec: float
+
+# Basic workloads
+ONE_CYCLE_DURATION_MS = 10
+PREEMPT_10MS_WORKLOAD = (f'1.DEFAULT.{int(ONE_CYCLE_DURATION_MS * 1000 / 2)}.0.0'
+                         f',2.DEFAULT.{int(ONE_CYCLE_DURATION_MS * 1000 / 2)}.-1.1')
+NON_PREEMPT_10MS_WORKLOAD = f'X.1.0,X.2.0,{PREEMPT_10MS_WORKLOAD}'
+
+class GemWsim(ShellExecutor):
+    def __init__(self, machine: MachineInterface, num_clients: int = 1, num_repeats: int = 1,
+                 workload: str = PREEMPT_10MS_WORKLOAD, timeout: int = DEFAULT_TIMEOUT) -> None:
+        super().__init__(
+            machine,
+            f'/usr/local/libexec/igt-gpu-tools/benchmarks/gem_wsim -w {workload} -c {num_clients} -r {num_repeats}',
+            timeout)
+        self.machine_id = str(machine)
+
+    def __str__(self) -> str:
+        return f'gem_wsim({self.machine_id}:{self.pid})'
+
+    def is_running(self) -> bool:
+        return not self.status().exited
+
+    def wait_results(self) -> GemWsimResult:
+        proc_result = self.wait()
+        if proc_result.exit_code == 0:
+            logger.info('%s: %s', self, proc_result.stdout)
+            # Try parse output ex.: 19.449s elapsed (102.836 workloads/s)
+            pattern = r'(?P<elapsed>\d+(\.\d*)?|\.\d+)s elapsed \((?P<wps>\d+(\.\d*)?|\.\d+) workloads/s\)'
+            match = re.search(pattern, proc_result.stdout, re.MULTILINE)
+            if match:
+                return GemWsimResult(float(match.group('elapsed')), float(match.group('wps')))
+        raise exceptions.GemWsimError(f'{self}: exit_code: {proc_result.exit_code}'
+                                      f' stdout: {proc_result.stdout} stderr: {proc_result.stderr}')
+
+
+def gem_wsim_parallel_exec_and_check(vms: typing.List[MachineInterface], workload: str, iterations: int,
+                                     expected: typing.Optional[GemWsimResult] = None) -> GemWsimResult:
+    # launch on each VM in parallel
+    wsim_procs = [GemWsim(vm, 1, iterations, workload) for vm in vms]
+    for i, wsim in enumerate(wsim_procs):
+        assert wsim.is_running(), f'GemWsim failed to start on VM{i}'
+
+    results = [wsim.wait_results() for wsim in wsim_procs]
+    if expected is not None:
+        assert results[0].elapsed_sec > expected.elapsed_sec * 0.9
+        assert results[0].workloads_per_sec > expected.workloads_per_sec * 0.9
+    for r in results[1:]:
+        # check wps ratio ~1.0 with 10% tolerance
+        assert 0.9 < r.workloads_per_sec / results[0].workloads_per_sec < 1.1
+        # check elapsed ratio ~1.0 with 10% tolerance
+        assert 0.9 < r.elapsed_sec / results[0].elapsed_sec < 1.1
+    # return first result, all other are asserted to be ~same
+    return results[0]
diff --git a/tools/vmtb/bench/executors/igt.py b/tools/vmtb/bench/executors/igt.py
new file mode 100644
index 000000000..4296464c2
--- /dev/null
+++ b/tools/vmtb/bench/executors/igt.py
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import enum
+import json
+import logging
+import posixpath
+import signal
+import typing
+
+from bench.executors.executor_interface import ExecutorInterface
+from bench.executors.shell import ShellExecutor
+from bench.machines.machine_interface import (DEFAULT_TIMEOUT,
+                                              MachineInterface, ProcessResult)
+
+logger = logging.getLogger('IgtExecutor')
+
+
+class IgtType(enum.Enum):
+    EXEC_BASIC = 1
+    EXEC_STORE = 2
+    SPIN_BATCH = 3
+
+
+# Mappings of driver specific (i915/xe) IGT instances:
+# {IGT type: (i915 IGT name, xe IGT name)}
+igt_tests: typing.Dict[IgtType, typing.Tuple[str, str]] = {
+    IgtType.EXEC_BASIC: ('igt@gem_exec_basic@basic', 'igt@xe_exec_basic@once-basic'),
+    IgtType.EXEC_STORE: ('igt@gem_exec_store@dword', 'igt@xe_exec_store@basic-store'),
+    IgtType.SPIN_BATCH: ('igt@gem_spin_batch@legacy', 'igt@xe_spin_batch@spin-basic')
+    }
+
+
+class IgtExecutor(ExecutorInterface):
+    def __init__(self, target: MachineInterface,
+                 test: typing.Union[str, IgtType],
+                 timeout: int = DEFAULT_TIMEOUT) -> None:
+        self.igt_config = target.get_igt_config()
+
+        # TODO ld_library_path not used now, need a way to pass this to guest
+        #ld_library_path = f'LD_LIBRARY_PATH={igt_config.lib_dir}'
+        runner = posixpath.join(self.igt_config.tool_dir, 'igt_runner')
+        testlist = '/tmp/igt_executor.testlist'
+        command = f'{runner} {self.igt_config.options} ' \
+                  f'--test-list {testlist} {self.igt_config.test_dir} {self.igt_config.result_dir}'
+        self.results: typing.Dict[str, typing.Any] = {}
+        self.target: MachineInterface = target
+        self.igt: str = test if isinstance(test, str) else self.select_igt_variant(target.get_drm_driver_name(), test)
+        self.target.write_file_content(testlist, self.igt)
+        self.timeout: int = timeout
+
+        logger.info("[%s] Execute IGT test: %s", target, self.igt)
+        self.pid: int = self.target.execute(command)
+
+    # Executor interface implementation
+    def status(self) -> ProcessResult:
+        return self.target.execute_status(self.pid)
+
+    def wait(self) -> ProcessResult:
+        return self.target.execute_wait(self.pid, self.timeout)
+
+    def sendsig(self, sig: signal.Signals) -> None:
+        self.target.execute_signal(self.pid, sig)
+
+    def terminate(self) -> None:
+        self.sendsig(signal.SIGTERM)
+
+    def kill(self) -> None:
+        self.sendsig(signal.SIGKILL)
+
+    # IGT specific methods
+    def get_results_log(self) -> typing.Dict:
+        # Results are cached
+        if self.results:
+            return self.results
+        path = posixpath.join(self.igt_config.result_dir, 'results.json')
+        result = self.target.read_file_content(path)
+        self.results = json.loads(result)
+        return self.results
+
+    def did_pass(self) -> bool:
+        results = self.get_results_log()
+        totals = results.get('totals')
+        if not totals:
+            return False
+        aggregate = totals.get('root')
+        if not aggregate:
+            return False
+
+        pass_case = 0
+        fail_case = 0
+        for key in aggregate:
+            if key in ['pass', 'warn', 'dmesg-warn']:
+                pass_case = pass_case + aggregate[key]
+                continue
+            fail_case = fail_case + aggregate[key]
+
+        logger.debug('Full IGT test results:\n%s', json.dumps(results, indent=4))
+
+        if fail_case > 0:
+            logger.error('Test failed!')
+            return False
+
+        return True
+
+    def select_igt_variant(self, driver: str, igt_type: IgtType) -> str:
+        # Select IGT variant dedicated for a given drm driver: xe or i915
+        igt = igt_tests[igt_type]
+        return igt[1] if driver == 'xe' else igt[0]
+
+
+def igt_list_subtests(target: MachineInterface, test_name: str) -> typing.List[str]:
+    command = f'{target.get_igt_config().test_dir}{test_name} --list-subtests'
+    proc_result = ShellExecutor(target, command).wait()
+    if proc_result.exit_code == 0:
+        return proc_result.stdout.split("\n")
+    return []
diff --git a/tools/vmtb/bench/executors/shell.py b/tools/vmtb/bench/executors/shell.py
new file mode 100644
index 000000000..c05a82a86
--- /dev/null
+++ b/tools/vmtb/bench/executors/shell.py
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import signal
+
+from bench.executors.executor_interface import ExecutorInterface
+from bench.machines.machine_interface import (DEFAULT_TIMEOUT,
+                                              MachineInterface, ProcessResult)
+
+
+class ShellExecutor(ExecutorInterface):
+    def __init__(self, target: MachineInterface, command: str, timeout: int = DEFAULT_TIMEOUT) -> None:
+        self.target = target
+        self.timeout = timeout
+        self.pid = self.target.execute(command)
+
+    def status(self) -> ProcessResult:
+        return self.target.execute_status(self.pid)
+
+    def wait(self) -> ProcessResult:
+        return self.target.execute_wait(self.pid, self.timeout)
+
+    def sendsig(self, sig: signal.Signals) -> None:
+        self.target.execute_signal(self.pid, sig)
+
+    def terminate(self) -> None:
+        self.sendsig(signal.SIGTERM)
+
+    def kill(self) -> None:
+        self.sendsig(signal.SIGKILL)
diff --git a/tools/vmtb/bench/helpers/__init__.py b/tools/vmtb/bench/helpers/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/bench/helpers/helpers.py b/tools/vmtb/bench/helpers/helpers.py
new file mode 100644
index 000000000..8c81fd486
--- /dev/null
+++ b/tools/vmtb/bench/helpers/helpers.py
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import logging
+
+from bench.executors.igt import IgtExecutor
+from bench.executors.shell import ShellExecutor
+from bench.machines.machine_interface import MachineInterface
+
+logger = logging.getLogger('Helpers')
+
+
+def driver_check(machine: MachineInterface, card: int = 0) -> bool:
+    drm_driver = machine.get_drm_driver_name()
+    if not machine.dir_exists(f'/sys/module/{drm_driver}/drivers/pci:{drm_driver}/'):
+        logger.error(f'{drm_driver} module not loaded on card %s', card)
+        return False
+
+    return True
+
+
+def igt_check(igt_test: IgtExecutor) -> bool:
+    ''' Helper/wrapper for wait and check for igt test '''
+    igt_out = igt_test.wait()
+    if igt_out.exit_code == 0 and igt_test.did_pass():
+        return True
+    logger.error('IGT failed with %s', igt_out)
+    return False
+
+
+def igt_run_check(machine: MachineInterface, test: str) -> bool:
+    ''' Helper/wrapper for quick run and check for igt test '''
+    igt_test = IgtExecutor(machine, test)
+    return igt_check(igt_test)
+
+
+def cmd_check(cmd: ShellExecutor) -> bool:
+    ''' Helper/wrapper for wait and check for shell command '''
+    cmd_out = cmd.wait()
+    if cmd_out.exit_code == 0:
+        return True
+    logger.error('%s failed with %s', cmd, cmd_out)
+    return False
+
+
+def cmd_run_check(machine: MachineInterface, cmd: str) -> bool:
+    ''' Helper/wrapper for quick run and check for shell command '''
+    cmd_run = ShellExecutor(machine, cmd)
+    return cmd_check(cmd_run)
+
+
+def modprobe_driver(machine: MachineInterface, parameters: str = '', options: str = '') -> ShellExecutor:
+    """Load driver (modprobe [driver_module]) and return ShellExecutor instance (do not check a result)."""
+    drm_driver = machine.get_drm_driver_name()
+    modprobe_cmd = ShellExecutor(machine, f'modprobe {drm_driver} {options} {parameters}')
+    return modprobe_cmd
+
+
+def modprobe_driver_check(machine: MachineInterface, cmd: ShellExecutor) -> bool:
+    """Check result of a driver load (modprobe) based on a given ShellExecutor instance."""
+    modprobe_success = cmd_check(cmd)
+    if modprobe_success:
+        return driver_check(machine)
+
+    logger.error('Modprobe failed')
+    return False
+
+
+def modprobe_driver_run_check(machine: MachineInterface, parameters: str = '', options: str = '') -> bool:
+    """Load (modprobe) a driver and check a result (waits until operation ends)."""
+    modprobe_cmd = modprobe_driver(machine, parameters, options)
+    modprobe_success = modprobe_driver_check(machine, modprobe_cmd)
+    if modprobe_success:
+        return driver_check(machine)
+
+    logger.error('Modprobe failed')
+    return False
diff --git a/tools/vmtb/bench/helpers/log.py b/tools/vmtb/bench/helpers/log.py
new file mode 100644
index 000000000..665bb6cf9
--- /dev/null
+++ b/tools/vmtb/bench/helpers/log.py
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import errno
+import fcntl
+import functools
+import logging
+import os
+import typing
+from pathlib import Path
+
+from bench import exceptions
+
+logger = logging.getLogger('Host-kmsg')
+
+HOST_DMESG_FILE = Path("/tmp/vm-test-bench-host_dmesg.log.tmp")
+
+
+class LogDecorators():
+    """Read and parse kernel log buffer.
+    https://www.kernel.org/doc/Documentation/ABI/testing/dev-kmsg
+    """
+    @staticmethod
+    def read_messages(fd: int) -> typing.List[str]:
+        buf_size = 4096
+        kmsgs = []
+        while True:
+            try:
+                kmsg = os.read(fd, buf_size)
+                kmsgs.append(kmsg.decode())
+            except OSError as exc:
+                if exc.errno == errno.EAGAIN:
+                    break
+
+                if exc.errno == errno.EPIPE:
+                    pass
+                else:
+                    raise
+        return kmsgs
+
+    @staticmethod
+    def parse_messages(kmsgs: typing.List[str]) -> None:
+        for msg in kmsgs:
+            header, human = msg.split(';', 1)
+            # Get priority/facility field (seq, time, other unused for now)
+            prio_fac, _, _, _ = header.split(',', 3)
+            level = int(prio_fac) & 0x7 # Syslog priority
+
+            if level <= 2: # KERN_CRIT/ALERT/EMERG
+                logger.error("[Error: %s]: %s", level, human.strip())
+                raise exceptions.HostError(f'Error in dmesg: {human.strip()}')
+
+            logger.debug("%s", human.strip())
+
+    @classmethod
+    def parse_kmsg(cls, func: typing.Callable) -> typing.Callable:
+        @functools.wraps(func)
+        def parse_wrapper(*args: typing.Any, **kwargs: typing.Optional[typing.Any]) -> typing.Any:
+            with open('/dev/kmsg', 'r', encoding='utf-8') as f, \
+                 open(HOST_DMESG_FILE, 'a', encoding='utf-8') as dmesg_file:
+
+                fd = f.fileno()
+                os.lseek(fd, os.SEEK_SET, os.SEEK_END)
+                flags = fcntl.fcntl(fd, fcntl.F_GETFL)
+                fcntl.fcntl(fd, fcntl.F_SETFL, flags | os.O_NONBLOCK)
+
+                # Execute actual function
+                result = func(*args, **kwargs)
+
+                kmsgs = cls.read_messages(fd)
+                dmesg_file.writelines(kmsgs)
+                cls.parse_messages(kmsgs)
+
+                return result
+        return parse_wrapper
diff --git a/tools/vmtb/bench/machines/__init__.py b/tools/vmtb/bench/machines/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/bench/machines/device_interface.py b/tools/vmtb/bench/machines/device_interface.py
new file mode 100644
index 000000000..e8d4068e8
--- /dev/null
+++ b/tools/vmtb/bench/machines/device_interface.py
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import abc
+
+
+class DeviceInterface(abc.ABC):
+
+    @abc.abstractmethod
+    def create_vf(self, num: int) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def remove_vfs(self) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def bind_driver(self) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def unbind_driver(self) -> None:
+        raise NotImplementedError
diff --git a/tools/vmtb/bench/machines/host.py b/tools/vmtb/bench/machines/host.py
new file mode 100644
index 000000000..666f35c26
--- /dev/null
+++ b/tools/vmtb/bench/machines/host.py
@@ -0,0 +1,196 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import logging
+import re
+import shlex
+import signal
+import subprocess
+import typing
+from pathlib import Path
+
+from bench import exceptions
+from bench.configurators.vmtb_config import VmtbIgtConfig
+from bench.helpers.log import LogDecorators
+from bench.machines.machine_interface import (DEFAULT_TIMEOUT,
+                                              MachineInterface, ProcessResult,
+                                              SuspendMode)
+from bench.machines.physical.device import Device
+
+logger = logging.getLogger('Host')
+
+
+class Host(MachineInterface):
+    def __init__(self) -> None:
+        self.running_procs: typing.Dict[int, subprocess.Popen] = {}
+        self.gpu_devices: typing.List[Device] = []
+        self.dut_index: int = 0
+        # Initialize in conftest/VmmTestingSetup:
+        self.drm_driver_name: str
+        self.igt_config: VmtbIgtConfig
+
+    def __str__(self) -> str:
+        return f'Host-{self.gpu_devices[self.dut_index].pci_info.bdf}'
+
+    @LogDecorators.parse_kmsg
+    def execute(self, command: str) -> int:
+        cmd_arr = shlex.split(command)
+        # We don't want to kill the process created here (like 'with' would do) so disable the following linter issue:
+        # R1732: consider-using-with (Consider using 'with' for resource-allocating operations)
+        # pylint: disable=R1732
+        # TODO: but maybe 'subprocess.run' function would fit instead of Popen constructor?
+        process = subprocess.Popen(cmd_arr,
+                                   stdout=subprocess.PIPE,
+                                   stderr=subprocess.PIPE,
+                                   universal_newlines=True)
+
+        self.running_procs[process.pid] = process
+        logger.debug("Run command: %s (PID: %s)", command, process.pid)
+        return process.pid
+
+    @LogDecorators.parse_kmsg
+    def execute_status(self, pid: int) -> ProcessResult:
+        proc = self.running_procs.get(pid, None)
+        if not proc:
+            logger.error("No process with PID: %s", pid)
+            raise exceptions.HostError(f'No process with PID: {pid}')
+
+        exit_code: typing.Optional[int] = proc.poll()
+        logger.debug("PID %s -> exit code %s", pid, exit_code)
+        if exit_code is None:
+            return ProcessResult(False, exit_code, '', '')
+
+        out, err = proc.communicate()
+        return ProcessResult(True, exit_code, out, err)
+
+    @LogDecorators.parse_kmsg
+    def execute_wait(self, pid: int, timeout: int = DEFAULT_TIMEOUT) -> ProcessResult:
+        proc = self.running_procs.get(pid, None)
+        if not proc:
+            logger.error("No process with PID: %s", pid)
+            raise exceptions.HostError(f'No process with PID: {pid}')
+
+        out = ''
+        err = ''
+        try:
+            out, err = proc.communicate(timeout)
+        except subprocess.TimeoutExpired as exc:
+            logger.warning("Timeout (%ss) expired for PID: %s", exc.timeout, pid)
+            raise
+
+        return ProcessResult(True, proc.poll(), out, err)
+
+    @LogDecorators.parse_kmsg
+    def execute_signal(self, pid: int, sig: signal.Signals) -> None:
+        proc = self.running_procs.get(pid, None)
+        if not proc:
+            logger.error("No process with PID: %s", pid)
+            raise exceptions.HostError(f'No process with PID: {pid}')
+
+        proc.send_signal(sig)
+
+    def read_file_content(self, path: str) -> str:
+        with open(path, encoding='utf-8') as f:
+            content = f.read()
+        return content
+
+    def write_file_content(self, path: str, content: str) -> int:
+        with open(path, 'w', encoding='utf-8') as f:
+            return f.write(content)
+
+    def dir_exists(self, path: str) -> bool:
+        return Path(path).is_dir()
+
+    def get_drm_driver_name(self) -> str:
+        # Used as a part of MachineInterface for helpers
+        return self.drm_driver_name
+
+    def get_igt_config(self) -> VmtbIgtConfig:
+        # Used as a part of MachineInterface to initialize IgtExecutor
+        return self.igt_config
+
+    def is_driver_loaded(self, driver_name: str) -> bool:
+        driver_path = Path('/sys/bus/pci/drivers/') / driver_name
+        return driver_path.exists()
+
+    def is_driver_available(self, driver_name: str) -> bool:
+        modinfo_pid = self.execute(f'modinfo -F filename {driver_name}')
+        modinfo_result: ProcessResult = self.execute_wait(modinfo_pid)
+        return modinfo_result.exit_code == 0
+
+    def load_drivers(self) -> None:
+        """Load (modprobe) required host drivers (DRM and VFIO)."""
+        drivers_to_probe = [self.drm_driver_name, f'{self.drm_driver_name}-vfio-pci']
+        # If vendor specific VFIO (ex. xe-vfio-pci) is not present, probe a regular vfio-pci
+        if not self.is_driver_available(drivers_to_probe[1]):
+            logger.warning("VFIO driver: '%s' is not available - use 'vfio-pci'", drivers_to_probe[1])
+            drivers_to_probe[1] = 'vfio-pci'
+
+        for driver in drivers_to_probe:
+            if not self.is_driver_loaded(driver):
+                logger.info("%s driver is not loaded - probe module", driver)
+                drv_probe_pid = self.execute(f'modprobe {driver}')
+                if self.execute_wait(drv_probe_pid).exit_code != 0:
+                    logger.error("%s driver probe failed!", driver)
+                    raise exceptions.HostError(f'{driver} driver probe failed!')
+
+    def unload_drivers(self) -> None:
+        """Unload (remove) host drivers (DRM and VFIO)."""
+        logger.debug("Cleanup - unload drivers\n")
+        vfio_driver = f'{self.drm_driver_name}-vfio-pci'
+        if not self.is_driver_loaded(vfio_driver):
+            vfio_driver = 'vfio-pci'
+
+        rmmod_pid = self.execute(f'modprobe -rf {vfio_driver}')
+        if self.execute_wait(rmmod_pid).exit_code != 0:
+            logger.error("VFIO driver remove failed!")
+            raise exceptions.HostError('VFIO driver remove failed!')
+
+        for device in self.gpu_devices:
+            logger.debug("Unbind %s from device %s", self.drm_driver_name, device.pci_info.bdf)
+            device.unbind_driver()
+
+        rmmod_pid = self.execute(f'modprobe -rf {self.drm_driver_name}')
+        if self.execute_wait(rmmod_pid).exit_code != 0:
+            logger.error("DRM driver remove failed!")
+            raise exceptions.HostError('DRM driver remove failed!')
+
+        logger.debug("%s/%s successfully removed", self.drm_driver_name, vfio_driver)
+
+    def discover_devices(self) -> None:
+        """Detect all PCI GPU devices on the host and initialize Device list."""
+        if not self.is_driver_loaded(self.drm_driver_name):
+            logger.error("Unable to discover devices - %s driver is not loaded!", self.drm_driver_name)
+            raise exceptions.HostError(f'Unable to discover devices - {self.drm_driver_name} driver is not loaded!')
+
+        detected_devices: typing.List[Device] = []
+        drv_path = Path('/sys/bus/pci/drivers/') / self.drm_driver_name
+
+        # Look for a directory name with a PCI BDF (e.g. 0000:1a:00.0)
+        for dev_bdf_dir in drv_path.glob('*:*:*.[0-7]'):
+            bdf = dev_bdf_dir.name
+            device = Device(bdf, self.drm_driver_name)
+            detected_devices.append(device)
+
+        # Output list of detected devices sorted by an ascending card index (device minor number)
+        self.gpu_devices = sorted(detected_devices, key=lambda dev: dev.pci_info.minor_number)
+
+        if not self.gpu_devices:
+            logger.error("GPU PCI device (bound to %s driver) not detected!", self.drm_driver_name)
+            raise exceptions.HostError(f'GPU PCI device (bound to {self.drm_driver_name} driver) not detected!')
+
+        logger.debug("Detected GPU PCI device(s):")
+        for dev in self.gpu_devices:
+            logger.debug("[%s] PCI BDF: %s / DevID: %s (%s)",
+                          dev.pci_info.minor_number, dev.pci_info.bdf, dev.pci_info.devid, dev.gpu_model)
+
+    def suspend(self, mode: SuspendMode = SuspendMode.ACPI_S3) -> None:
+        """Perform host suspend cycle (ACPI S3) via rtcwake tool."""
+        wakeup_delay = 10 # wakeup timer in seconds
+        logger.debug("Suspend-resume via rtcwake (mode: %s, wakeup delay: %ss)", mode, wakeup_delay)
+
+        suspend_pid = self.execute(f'rtcwake -s {wakeup_delay} -m {mode}')
+        suspend_result: ProcessResult = self.execute_wait(suspend_pid)
+        if suspend_result.exit_code != 0:
+            logger.error("Suspend failed - error: %s", suspend_result.stderr)
+            raise exceptions.HostError(f'Suspend failed - error: {suspend_result.stderr}')
diff --git a/tools/vmtb/bench/machines/machine_interface.py b/tools/vmtb/bench/machines/machine_interface.py
new file mode 100644
index 000000000..8daa2cda3
--- /dev/null
+++ b/tools/vmtb/bench/machines/machine_interface.py
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import abc
+import enum
+import signal
+import typing
+
+from bench.configurators.vmtb_config import VmtbIgtConfig
+
+DEFAULT_TIMEOUT: int = 1200 # Default machine execution wait timeout in seconds
+
+
+class ProcessResult(typing.NamedTuple):
+    exited: bool = False
+    exit_code: typing.Optional[int] = None
+    stdout: str = ''
+    stderr: str = ''
+
+
+class SuspendMode(str, enum.Enum):
+    ACPI_S3 = 'mem'    # Suspend to RAM aka sleep
+    ACPI_S4 = 'disk'   # Suspend to disk aka hibernation
+
+    def __str__(self) -> str:
+        return str.__str__(self)
+
+
+class MachineInterface(metaclass=abc.ABCMeta):
+
+    @abc.abstractmethod
+    def execute(self, command: str) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def execute_status(self, pid: int) -> ProcessResult:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def execute_wait(self, pid: int, timeout: int) -> ProcessResult:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def execute_signal(self, pid: int, sig: signal.Signals) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def read_file_content(self, path: str) -> str:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def write_file_content(self, path: str, content: str) -> int:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def dir_exists(self, path: str) -> bool:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_drm_driver_name(self) -> str:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_igt_config(self) -> VmtbIgtConfig:
+        raise NotImplementedError
diff --git a/tools/vmtb/bench/machines/physical/__init__.py b/tools/vmtb/bench/machines/physical/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/bench/machines/physical/device.py b/tools/vmtb/bench/machines/physical/device.py
new file mode 100644
index 000000000..8a0368ae0
--- /dev/null
+++ b/tools/vmtb/bench/machines/physical/device.py
@@ -0,0 +1,240 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import importlib
+import logging
+import re
+from pathlib import Path
+from typing import Any, List
+
+from bench import exceptions
+from bench.configurators import pci
+from bench.configurators.vgpu_profile import (VgpuProfile, VgpuResourcesConfig,
+                                              VgpuSchedulerConfig)
+from bench.drivers.driver_interface import DriverInterface, SchedulingPriority
+from bench.helpers.log import LogDecorators
+from bench.machines.device_interface import DeviceInterface
+
+logger = logging.getLogger('Device')
+
+
+class Device(DeviceInterface):
+    class PciInfo:
+        def __init__(self, bdf: str) -> None:
+            self.bdf: str = bdf
+            self.devid: str = self.get_device_id(self.bdf)
+            self.minor_number: int = self.get_device_minor_number(self.bdf)
+
+        def get_device_minor_number(self, bdf: str) -> int:
+            drm_dir = Path('/sys/bus/pci/devices/') / bdf / 'drm'
+
+            for file_path in drm_dir.iterdir():
+                if file_path.match('card*'):
+                    index_match = re.search(r'card(?P<card_index>\d+)', file_path.name)
+                    if index_match:
+                        return int(index_match.group('card_index'))
+
+            logger.error("Could not determine card index for device %s", bdf)
+            raise exceptions.HostError(f'Could not determine card index for device {bdf}')
+
+        def get_device_id(self, bdf: str) -> str:
+            device_file = Path('/sys/bus/pci/devices/') / bdf / 'device'
+            devid = device_file.read_text()
+
+            return devid.strip()[2:] # Strip whitespaces and 0x
+
+    def __init__(self, bdf: str, driver: str) -> None:
+        self.pci_info = self.PciInfo(bdf)
+        self.gpu_model: str = pci.get_gpu_model(self.pci_info.devid)
+        self.driver: DriverInterface = self.instantiate_driver(driver, self.pci_info.minor_number)
+
+    def instantiate_driver(self, driver_name: str, card_index: int) -> Any:
+        module_name = f'bench.drivers.{driver_name}'
+        class_name = f'{driver_name.capitalize()}Driver'
+
+        try:
+            driver_module = importlib.import_module(module_name)
+            driver_class = getattr(driver_module, class_name)
+        except (ImportError, AttributeError) as exc:
+            logging.error("Driver module/class is not available: %s", exc)
+            raise exceptions.VmtbConfigError(f'Requested driver module {driver_name} is not available!')
+
+        return driver_class(card_index)
+
+    def set_drivers_autoprobe(self, val: bool) -> None:
+        self.driver.set_drivers_autoprobe(int(val))
+        ret = self.driver.get_drivers_autoprobe()
+        if ret != int(val):
+            logger.error("Autoprobe value mismatch - requested: %s, got: %s", val, ret)
+            raise exceptions.HostError(f'Autoprobe value mismatch - requested: {val}, got: {ret}')
+
+    def get_total_vfs(self) -> int:
+        return self.driver.get_totalvfs()
+
+    def get_current_vfs(self) -> int:
+        return self.driver.get_numvfs()
+
+    def get_num_gts(self) -> int:
+        return self.driver.get_num_gts()
+
+    def has_lmem(self) -> bool:
+        return self.driver.has_lmem()
+
+    def create_vf(self, num: int) -> int:
+        """Enable a requested number of VFs.
+        Disable SRIOV drivers autoprobe to allow VFIO driver override for VFs.
+        """
+        logger.info("[%s] Enable %s VFs", self.pci_info.bdf, num)
+        if self.get_current_vfs() != 0:
+            self.remove_vfs()
+
+        self.numvf = num
+
+        # Disable driver autoprobe to avoid driver load on VF (override to vfio is required)
+        logger.debug("[%s] Disable drivers autoprobe", self.pci_info.bdf)
+        self.set_drivers_autoprobe(False)
+
+        self.driver.set_numvfs(num)
+        ret = self.driver.get_numvfs()
+        assert ret == num
+
+        return ret
+
+    def remove_vfs(self) -> int:
+        """Disable all existing VFs.
+        Re-enable SRIOV drivers autoprobe.
+        """
+        logger.info("[%s] Disable VFs", self.pci_info.bdf)
+        self.driver.set_numvfs(0)
+        ret = self.driver.get_numvfs()
+        if ret != 0:
+            raise exceptions.HostError('VFs not disabled after 0 write')
+
+        logger.debug("[%s] Enable drivers autoprobe", self.pci_info.bdf)
+        self.set_drivers_autoprobe(True)
+
+        return ret
+
+    def bind_driver(self) -> None:
+        self.driver.bind(self.pci_info.bdf)
+
+    def unbind_driver(self) -> None:
+        self.driver.unbind(self.pci_info.bdf)
+
+    def override_vf_driver(self, vf_num: int) -> str:
+        """Set VFIO as VF driver."""
+        pci_devices_path = Path('/sys/bus/pci/devices/')
+        vfio_driver = f'{self.driver.get_name()}-vfio-pci'
+        if not Path(f'/sys/bus/pci/drivers/{vfio_driver}').exists():
+            vfio_driver = 'vfio-pci'
+
+        # virtfnN is a symlink - get the last part of the absolute path, ie. VF BDF like 00:12:00.1
+        # TODO: replace by Path.readlink() when Python 3.9 supported
+        pass_vf_bdf = (pci_devices_path / self.pci_info.bdf / f'virtfn{vf_num - 1}').resolve().name
+        override_path = pci_devices_path / pass_vf_bdf / 'driver_override'
+        override_path.write_text(vfio_driver, encoding='utf-8')
+        logger.debug("VF%s VFIO driver: %s", vf_num, override_path.read_text())
+
+        return pass_vf_bdf
+
+    @LogDecorators.parse_kmsg
+    def get_vf_bdf(self, vf_num: int) -> str:
+        """Provide BDF of VF prepared for pass to VM - with VFIO driver override and probe."""
+        pass_vf_bdf = self.override_vf_driver(vf_num)
+
+        drivers_probe = Path('/sys/bus/pci/drivers_probe')
+        drivers_probe.write_text(pass_vf_bdf, encoding='utf-8')
+
+        logger.info("[%s] VF%s ready for pass to VM", pass_vf_bdf, vf_num)
+        return pass_vf_bdf
+
+    def get_vfs_bdf(self, *args: int) -> List[str]:
+        vf_list = list(set(args))
+        bdf_list = [self.get_vf_bdf(vf) for vf in vf_list]
+        return bdf_list
+
+    def provision(self, profile: VgpuProfile) -> None:
+        logger.info("[%s] Provision VFs - set vGPU profile for %s VFs", self.pci_info.bdf, profile.num_vfs)
+
+        num_vfs = profile.num_vfs
+        num_gts = self.get_num_gts() # Number of tiles (GTs)
+        gt_nums = [0] if num_gts == 1 else [0, 1] # Tile (GT) numbers/indexes
+
+        for gt_num in gt_nums:
+            self.driver.set_pf_policy_sched_if_idle(gt_num, int(profile.scheduler.scheduleIfIdle))
+            self.driver.set_pf_policy_reset_engine(gt_num, int(profile.security.reset_after_vf_switch))
+            self.driver.set_exec_quantum_ms(0, gt_num, profile.scheduler.pfExecutionQuanta)
+            self.driver.set_preempt_timeout_us(0, gt_num, profile.scheduler.pfPreemptionTimeout)
+            self.driver.set_doorbells_quota(0, gt_num, profile.resources.pfDoorbells)
+            # PF contexts are currently assigned by the driver and cannot be reprovisioned from sysfs
+
+        for vf_num in range(1, num_vfs + 1):
+            if num_gts > 1 and num_vfs > 1:
+                # Multi-tile device Mode 2|3 - odd VFs on GT0, even on GT1
+                gt_nums = [0] if vf_num % 2 else [1]
+
+            for gt_num in gt_nums:
+                self.driver.set_lmem_quota(vf_num, gt_num, profile.resources.vfLmem)
+                self.driver.set_ggtt_quota(vf_num, gt_num, profile.resources.vfGgtt)
+                self.driver.set_contexts_quota(vf_num, gt_num, profile.resources.vfContexts)
+                self.driver.set_doorbells_quota(vf_num, gt_num, profile.resources.vfDoorbells)
+                self.driver.set_exec_quantum_ms(vf_num, gt_num, profile.scheduler.vfExecutionQuanta)
+                self.driver.set_preempt_timeout_us(vf_num, gt_num, profile.scheduler.vfPreemptionTimeout)
+
+    # fn_num = 0 for PF, 1..n for VF
+    def set_scheduling(self, fn_num: int, gt_num: int, scheduling_config: VgpuSchedulerConfig) -> None:
+        logger.info("[%s] Provision scheduling config for PCI Function %s", self.pci_info.bdf, fn_num)
+        if fn_num == 0:
+            self.driver.set_pf_policy_sched_if_idle(gt_num, int(scheduling_config.scheduleIfIdle))
+            self.driver.set_exec_quantum_ms(0, gt_num, scheduling_config.pfExecutionQuanta)
+            self.driver.set_preempt_timeout_us(0, gt_num, scheduling_config.pfPreemptionTimeout)
+        else:
+            self.driver.set_exec_quantum_ms(fn_num, gt_num, scheduling_config.vfExecutionQuanta)
+            self.driver.set_preempt_timeout_us(fn_num, gt_num, scheduling_config.vfPreemptionTimeout)
+
+    def set_resources(self, fn_num: int, gt_num: int, resources_config: VgpuResourcesConfig) -> None:
+        logger.info("[%s] Provision resources config for PCI Function %s", self.pci_info.bdf, fn_num)
+        if fn_num == 0:
+            self.driver.set_pf_ggtt_spare(gt_num, resources_config.pfGgtt)
+            self.driver.set_pf_lmem_spare(gt_num, resources_config.pfLmem)
+            self.driver.set_pf_contexts_spare(gt_num, resources_config.pfContexts)
+            self.driver.set_pf_doorbells_spare(gt_num, resources_config.pfDoorbells)
+        else:
+            self.driver.set_ggtt_quota(fn_num, gt_num, resources_config.vfGgtt)
+            self.driver.set_lmem_quota(fn_num, gt_num, resources_config.vfLmem)
+            self.driver.set_contexts_quota(fn_num, gt_num, resources_config.vfContexts)
+            self.driver.set_doorbells_quota(fn_num, gt_num, resources_config.vfDoorbells)
+
+    def reset_provisioning(self, num_vfs: int) -> None:
+        """Clear provisioning config for a requested number of VFs.
+        Function calls the sysfs control interface to clear VF provisioning settings
+        and restores the auto provisioning mode.
+        """
+        logger.info("[%s] Reset %s VFs provisioning configuraton", self.pci_info.bdf, num_vfs)
+        for gt_num in range(self.get_num_gts()):
+            if self.get_scheduling_priority(gt_num) != SchedulingPriority.LOW:
+                self.set_scheduling_priority(gt_num, SchedulingPriority.LOW)
+            self.driver.set_pf_policy_sched_if_idle(gt_num, 0)
+            self.driver.set_pf_policy_reset_engine(gt_num, 0)
+            self.driver.set_exec_quantum_ms(0, gt_num, 0)
+            self.driver.set_preempt_timeout_us(0, gt_num, 0)
+            self.driver.set_doorbells_quota(0, gt_num, 0)
+            # PF contexts cannot be set from sysfs
+
+            for vf_num in range(1, num_vfs + 1):
+                self.driver.set_contexts_quota(vf_num, gt_num, 0)
+                self.driver.set_doorbells_quota(vf_num, gt_num, 0)
+                self.driver.set_ggtt_quota(vf_num, gt_num, 0)
+                self.driver.set_lmem_quota(vf_num, gt_num, 0)
+
+    def cancel_work(self) -> None:
+        """Drop and reset remaining GPU execution at exit."""
+        self.driver.cancel_work()
+
+    def get_scheduling_priority(self, gt_num: int) -> SchedulingPriority:
+        return self.driver.get_pf_sched_priority(gt_num)
+
+    def set_scheduling_priority(self, gt_num: int, val: SchedulingPriority) -> None:
+        # In order to set scheduling priority, strict scheduling policy needs to be default
+        # self.drm_driver.set_pf_policy_sched_if_idle(gt_num, 0)
+        self.driver.set_pf_sched_priority(gt_num, val)
diff --git a/tools/vmtb/bench/machines/virtual/__init__.py b/tools/vmtb/bench/machines/virtual/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/bench/machines/virtual/backends/__init__.py b/tools/vmtb/bench/machines/virtual/backends/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/bench/machines/virtual/backends/backend_interface.py b/tools/vmtb/bench/machines/virtual/backends/backend_interface.py
new file mode 100644
index 000000000..dfa29cc01
--- /dev/null
+++ b/tools/vmtb/bench/machines/virtual/backends/backend_interface.py
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import abc
+import typing
+
+
+class BackendInterface(metaclass=abc.ABCMeta):
+
+    @abc.abstractmethod
+    def sync(self, idnum: int) -> typing.Optional[typing.Dict]:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def ping(self) -> typing.Optional[typing.Dict]:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def execute(self, command: str, args: typing.List[str]) -> typing.Optional[typing.Dict]:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def execute_status(self, pid: int) -> typing.Optional[typing.Dict]:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def suspend_disk(self) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def suspend_ram(self) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def reboot(self) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def poweroff(self) -> None:
+        raise NotImplementedError
diff --git a/tools/vmtb/bench/machines/virtual/backends/guestagent.py b/tools/vmtb/bench/machines/virtual/backends/guestagent.py
new file mode 100644
index 000000000..6ac366b99
--- /dev/null
+++ b/tools/vmtb/bench/machines/virtual/backends/guestagent.py
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import json
+import logging
+import socket
+import typing
+
+from bench import exceptions
+from bench.machines.virtual.backends.backend_interface import BackendInterface
+
+logger = logging.getLogger('GuestAgent')
+
+
+class GuestAgentBackend(BackendInterface):
+    def __init__(self, socket_path: str, socket_timeout: int) -> None:
+        self.sockpath = socket_path
+        self.timeout = socket_timeout
+        self.sock: socket.socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
+        self.sock.connect(self.sockpath)
+        self.sockf: typing.TextIO = self.sock.makefile(mode='rw', errors='strict')
+
+    def __send(self, command: str, arguments: typing.Optional[typing.Dict] = None) -> typing.Dict:
+        if arguments is None:
+            arguments = {}
+
+        data = {'execute': command, 'arguments': arguments}
+        json.dump(data, self.sockf)
+        self.sockf.flush()
+        try:
+            out: typing.Optional[str] = self.sockf.readline()
+        except socket.timeout as soc_to_exc:
+            logger.error('Socket readline timeout on command %s', command)
+            self.sock.close()
+            self.sockf.close()
+            raise exceptions.GuestAgentError(f'Socket timed out on {command}') from soc_to_exc
+        if out is None:
+            logger.error('Command %s, args %s returned with no output')
+            raise exceptions.GuestAgentError(f'Command {command} did not retunrned output')
+            # Only logging errors for now
+        ret: typing.Dict = json.loads(out)
+        if 'error' in ret.keys():
+            logger.error('Command: %s got error %s', command, ret)
+
+        return ret
+
+    def sync(self, idnum: int) -> typing.Dict:
+        return self.__send('guest-sync', {'id': idnum})
+
+    def ping(self) -> typing.Optional[typing.Dict]:
+        return self.__send('guest-ping')
+
+    def execute(self, command: str, args: typing.Optional[typing.List[str]] = None) -> typing.Dict:
+        if args is None:
+            args = []
+        arguments = {'path': command, 'arg': args, 'capture-output': True}
+        return self.__send('guest-exec', arguments)
+
+    def execute_status(self, pid: int) -> typing.Dict:
+        return self.__send('guest-exec-status', {'pid': pid})
+
+    # TODO add qmp-query mechanism for all powerstate changes
+    def suspend_disk(self) -> None:
+        # self.__send('guest-suspend-disk')
+        raise NotImplementedError
+
+    def suspend_ram(self) -> None:
+        self.ping()
+        # guest-suspend-ram does not return anything, thats why no __send
+        data = {'execute': 'guest-suspend-ram'}
+        json.dump(data, self.sockf)
+        self.sockf.flush()
+
+    def reboot(self) -> None:
+        self.ping()
+        # guest-shutdown does not return anything, thats why no __send
+        data = {'execute': 'guest-shutdown', 'arguments': {'mode': 'reboot'}}
+        json.dump(data, self.sockf)
+        self.sockf.flush()
+
+    def poweroff(self) -> None:
+        self.ping()
+        # guest-shutdown does not return anything, thats why no __send
+        data = {'execute': 'guest-shutdown', 'arguments': {'mode': 'powerdown'}}
+        json.dump(data, self.sockf)
+        self.sockf.flush()
+        # self.sockf.readline()
+
+    def guest_file_open(self, path: str, mode: str) -> typing.Dict:
+        return self.__send('guest-file-open', {'path': path, 'mode': mode})
+
+    def guest_file_close(self, handle: int) -> typing.Dict:
+        return self.__send('guest-file-close', {'handle': handle})
+
+    def guest_file_write(self, handle: int, content: str) -> typing.Dict:
+        return self.__send('guest-file-write', {'handle': handle, 'buf-b64': content})
+
+    def guest_file_read(self, handle: int) -> typing.Dict:
+        return self.__send('guest-file-read', {'handle': handle})
diff --git a/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py b/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
new file mode 100644
index 000000000..7d2645abe
--- /dev/null
+++ b/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
@@ -0,0 +1,161 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import json
+import logging
+import queue
+import socket
+import threading
+import time
+import typing
+
+logger = logging.getLogger('QmpMonitor')
+
+
+class QmpMonitor():
+    def __init__(self, socket_path: str, socket_timeout: int) -> None:
+        self.sockpath = socket_path
+        self.timeout = socket_timeout
+        self.sock: socket.socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
+        self.sock.connect(self.sockpath)
+        self.sockf: typing.TextIO = self.sock.makefile(mode='rw', errors='strict')
+        self.qmp_queue: queue.Queue = queue.Queue()
+        self.monitor_thread: threading.Thread = threading.Thread(target=self.__queue_qmp_output,
+                                                                 args=(self.sockf, self.qmp_queue),
+                                                                 daemon=True)
+        self.monitor_thread.start()
+        # It is required to enable capabilities befor using QMP
+        self.__enable_qmp_capabilities()
+
+    def __enable_qmp_capabilities(self) -> None:
+        json.dump({'execute': 'qmp_capabilities'}, self.sockf)
+        self.sockf.flush()
+
+    def __queue_qmp_output(self, out: typing.TextIO, q: queue.Queue) -> None:
+        for line in iter(out.readline, ''):
+            logger.debug('[QMP RSP] <- %s', line)
+            qmp_msg = json.loads(line)
+            q.put(qmp_msg)
+
+    @property
+    def monitor_queue(self) -> queue.Queue:
+        return self.qmp_queue
+
+    def query_status(self) -> str:
+        json.dump({'execute': 'query-status'}, self.sockf)
+        self.sockf.flush()
+
+        ret: typing.Dict = {}
+        while 'status' not in ret:
+            qmp_msg = self.qmp_queue.get()
+            if 'return' in qmp_msg:
+                ret = qmp_msg.get('return')
+
+        status: str = ret['status']
+        logger.debug('Machine status: %s', status)
+        return status
+
+    def query_jobs(self, requested_type: str) -> typing.Tuple[str, str]:
+        json.dump({'execute': 'query-jobs'}, self.sockf)
+        self.sockf.flush()
+
+        job_type: str = ''
+        job_status: str = ''
+        job_error: str = ''
+        ret: typing.Dict = {}
+
+        qmp_msg = self.qmp_queue.get()
+        # logger.debug('[QMP RSP Queue] -> %s', qmp_msg)
+        if 'return' in qmp_msg:
+            ret = qmp_msg.get('return')
+            for param in ret:
+                job_type = param.get('type')
+                job_status = param.get('status')
+                job_error = param.get('error')
+
+                if job_type == requested_type:
+                    break
+
+        return (job_status, job_error)
+
+    def get_qmp_event(self) -> str:
+        qmp_msg = self.qmp_queue.get()
+        # logger.debug('[QMP RSP Queue] -> %s', qmp_msg)
+        event: str = qmp_msg.get('event', '')
+        return event
+
+    def get_qmp_event_job(self) -> str:
+        qmp_msg = self.qmp_queue.get()
+        # logger.debug('[QMP RSP Queue] -> %s', qmp_msg)
+
+        status: str = ''
+        if qmp_msg.get('event') == 'JOB_STATUS_CHANGE':
+            status = qmp_msg.get('data', {}).get('status', '')
+
+        return status
+
+    def system_reset(self) -> None:
+        json.dump({'execute': 'system_reset'}, self.sockf)
+        self.sockf.flush()
+
+    def system_wakeup(self) -> None:
+        json.dump({'execute': 'system_wakeup'}, self.sockf)
+        self.sockf.flush()
+
+    def stop(self) -> None:
+        json.dump({'execute': 'stop'}, self.sockf)
+        self.sockf.flush()
+
+    def cont(self) -> None:
+        json.dump({'execute': 'cont'}, self.sockf)
+        self.sockf.flush()
+
+    def quit(self) -> None:
+        json.dump({'execute': 'quit'}, self.sockf)
+        self.sockf.flush()
+
+    def __query_snapshot(self) -> typing.Tuple[str, str]:
+        json.dump({'execute': 'query-named-block-nodes'}, self.sockf)
+        self.sockf.flush()
+
+        node_name: str = ''
+        snapshot_tag: str = ''
+        ret: typing.Dict = {}
+
+        qmp_msg = self.qmp_queue.get()
+        # logger.debug('[QMP RSP Queue] -> %s', qmp_msg)
+        if 'return' in qmp_msg:
+            ret = qmp_msg.get('return')
+            for block in ret:
+                if block.get('drv') == 'qcow2':
+                    node_name = block.get('node-name')
+                    # Get the most recent state snapshot from the snapshots list:
+                    snapshots = block.get('image').get('snapshots')
+                    if snapshots:
+                        snapshot_tag = snapshots[-1].get('name')
+                    break
+
+        return (node_name, snapshot_tag)
+
+    def save_snapshot(self) -> None:
+        job_id: str = f'savevm_{time.time()}'
+        snapshot_tag = f'vm_state_{time.time()}'
+        node_name, _ = self.__query_snapshot()
+        logger.debug('[QMP snapshot-save] snapshot_tag: %s, block device node: %s', snapshot_tag, node_name)
+
+        # Note: command 'snapshot-save' is supported since QEMU 6.0
+        json.dump({'execute': 'snapshot-save',
+            'arguments': {'job-id': job_id, 'tag': snapshot_tag, 'vmstate': node_name, 'devices': [node_name]}},
+            self.sockf)
+        self.sockf.flush()
+
+    def load_snapshot(self) -> None:
+        job_id: str = f'loadvm_{time.time()}'
+        node_name, snapshot_tag = self.__query_snapshot()
+        logger.debug('[QMP snapshot-load] snapshot_tag: %s, block device node: %s', snapshot_tag, node_name)
+
+        # Note: command 'snapshot-load' is supported since QEMU 6.0
+        json.dump({'execute': 'snapshot-load',
+            'arguments': {'job-id': job_id, 'tag': snapshot_tag, 'vmstate': node_name, 'devices': [node_name]}},
+            self.sockf)
+        self.sockf.flush()
diff --git a/tools/vmtb/bench/machines/virtual/vm.py b/tools/vmtb/bench/machines/virtual/vm.py
new file mode 100644
index 000000000..ca1f1346f
--- /dev/null
+++ b/tools/vmtb/bench/machines/virtual/vm.py
@@ -0,0 +1,604 @@
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+
+import base64
+import json
+import logging
+import os
+import posixpath
+import shlex
+import signal
+import subprocess
+import threading
+import time
+import typing
+from types import FrameType
+
+from bench import exceptions
+from bench.configurators.vmtb_config import VmtbIgtConfig
+from bench.machines.machine_interface import (DEFAULT_TIMEOUT,
+                                              MachineInterface, ProcessResult,
+                                              SuspendMode)
+from bench.machines.virtual.backends.guestagent import GuestAgentBackend
+from bench.machines.virtual.backends.qmp_monitor import QmpMonitor
+
+logger = logging.getLogger('VirtualMachine')
+
+
+class VirtualMachine(MachineInterface):
+    class Decorators():
+        @staticmethod
+        def alarm_handler(sig: signal.Signals, tb: FrameType) -> typing.Any:
+            raise exceptions.AlarmTimeoutError(f'Alarm timeout occured')
+
+        @classmethod
+        def timeout_signal(cls, func: typing.Callable) -> typing.Callable:
+            def timeout_wrapper(*args: typing.Any, **kwargs: typing.Optional[typing.Any]) -> typing.Any:
+                timeout: int = DEFAULT_TIMEOUT
+                if len(args) > 2:
+                    timeout = args[2] # Argument position in execute_wait(self, pid, timeout)
+                elif kwargs.get('timeout') is not None:
+                    if isinstance(kwargs['timeout'], int):
+                        timeout = kwargs['timeout']
+
+                # mypy: silence the following problem in signal.signal() call:
+                # error: Argument 2 to "signal" has incompatible type "Callable[[Signals, FrameType], Any]";
+                # expected "Union[Callable[[int, Optional[FrameType]], Any], int, Handlers, None]"  [arg-type]
+                signal.signal(signal.SIGALRM, cls.alarm_handler) # type: ignore[arg-type]
+                signal.alarm(timeout)
+                try:
+                    proc_ret = func(*args, **kwargs)
+                except exceptions.AlarmTimeoutError:
+                    logger.warning('Timeout (%ss) on %s', timeout, func.__name__)
+                    raise
+                finally:
+                    signal.alarm(0)  # Cancel alarm
+
+                return proc_ret
+
+            return timeout_wrapper
+
+    def __init__(self, vm_number: int, backing_image: str, driver: str, igt_config: VmtbIgtConfig) -> None:
+        self.vf_bdf: typing.Optional[str] = None
+        self.process: typing.Optional[subprocess.Popen] = None
+        self.vmnum: int = vm_number
+        self.card_num: int = 0
+        self.sysfs_prefix_path = posixpath.join('/sys/class/drm/', f'card{str(self.card_num)}')
+        self.questagent_sockpath = posixpath.join('/tmp', f'qga{self.vmnum}.sock')
+        self.qmp_sockpath = posixpath.join('/tmp', f'mon{self.vmnum}.sock')
+        self.drm_driver_name: str = driver
+        self.igt_config: VmtbIgtConfig = igt_config
+
+        if not posixpath.exists(backing_image):
+            logger.error('No image for VM%s', self.vmnum)
+            raise exceptions.GuestError(f'No image for VM{self.vmnum}')
+        self.image: str = self.__create_qemu_image(backing_image)
+        self.migrate_source_image: typing.Optional[str] = None
+        self.migrate_destination_vm: bool = False
+
+        # Resources provisioned to the VF/VM:
+        self._lmem_size: typing.Optional[int] = None
+        self._ggtt_size: typing.Optional[int] = None
+        self._contexts: typing.Optional[int] = None
+        self._doorbells: typing.Optional[int] = None
+
+        # GT number and tile is relevant mainly for multi-tile devices
+        # List of all GTs used by a given VF:
+        # - for single-tile: only root [0]
+        # - for multi-tile Mode 2/3: either root [0] or remote [1]
+        # - for multi-tile Mode 1: spans on both tiles [0, 1]
+        self._gt_nums: typing.List[int] = []
+        self._tile_mask: typing.Optional[int] = None
+
+    def __str__(self) -> str:
+        return f'VM{self.vmnum}_{self.vf_bdf}'
+
+    def __del__(self) -> None:
+        if not self.is_running():
+            return
+
+        # printing and not logging because loggers have some issues
+        # in late deinitialization
+        print(f'VM{self.vmnum} was not powered off')
+        if not self.process:
+            return
+        self.process.terminate()
+        # Lets wait and make sure that qemu shutdown
+        try:
+            self.process.communicate(timeout=30)
+        except subprocess.TimeoutExpired:
+            print('QEMU did not terminate, killing it')
+            self.process.kill()
+
+    def __get_backing_file_format(self, backing_file: str) -> typing.Any:
+        """Get the format of the backing image file using qemu-img info."""
+        command = ['qemu-img', 'info', '--output=json', backing_file]
+        try:
+            result = subprocess.run(command, capture_output=True, check=True)
+            return json.loads(result.stdout)['format']
+        except subprocess.CalledProcessError as exc:
+            logger.error("Error executing qemu-img info: %s", exc.stderr)
+            raise exceptions.GuestError(f'Error executing qemu-img info') from exc
+        except json.JSONDecodeError as exc:
+            logger.error("Invalid JSON output from qemu-img info: %s", exc)
+            raise exceptions.GuestError('Invalid JSON output from qemu-img info') from exc
+
+    def __create_qemu_image(self, backing_file: str) -> str:
+        """Create a new qcow2 image with the specified backing file."""
+        output_image = f'./vm{self.vmnum}_{time.time()}_image.qcow2'
+        backing_format = self.__get_backing_file_format(backing_file)
+
+        command = ['qemu-img', 'create',
+                   '-f', 'qcow2', '-b', f'{backing_file}', '-F', f'{backing_format}', f'{output_image}']
+        try:
+            subprocess.run(command, check=True)
+            logger.debug("[VM%s] Created image %s (backing file: %s, format: %s)",
+                         self.vmnum, output_image, backing_file, backing_format)
+        except subprocess.CalledProcessError as exc:
+            logger.error('[VM%s] Error creating qcow2 image: %s', self.vmnum, exc)
+            raise exceptions.GuestError('Error creating qcow2 image') from exc
+
+        return output_image
+
+    def __log_qemu_output(self, out: typing.TextIO) -> None:
+        stdoutlog = logging.getLogger(f'VM{self.vmnum}-kmsg')
+        for line in iter(out.readline, ''):
+            stdoutlog.debug(line.strip())
+
+    def __sockets_exists(self) -> bool:
+        return os.path.exists(self.questagent_sockpath) and os.path.exists(self.qmp_sockpath)
+
+    def __get_popen_command(self) -> typing.List[str]:
+        command = ['qemu-system-x86_64',
+                   '-vnc', f':{self.vmnum}',
+                   '-serial', 'stdio',
+                   '-m', '4096',
+                   '-drive', f'file={self.image if not self.migrate_destination_vm else self.migrate_source_image}',
+                   '-chardev', f'socket,path={self.questagent_sockpath},server=on,wait=off,id=qga{self.vmnum}',
+                   '-device', 'virtio-serial',
+                   '-device', f'virtserialport,chardev=qga{self.vmnum},name=org.qemu.guest_agent.0',
+                   '-chardev', f'socket,id=mon{self.vmnum},path=/tmp/mon{self.vmnum}.sock,server=on,wait=off',
+                   '-mon', f'chardev=mon{self.vmnum},mode=control']
+
+        if self.vf_bdf:
+            command.extend(['-enable-kvm', '-cpu', 'host'])
+            command.extend(['-device', f'vfio-pci,host={self.vf_bdf},enable-migration=on'])
+
+        if self.migrate_destination_vm:
+            # If VM is migration destination - run in stopped/prelaunch state (explicit resume required)
+            command.extend(['-S'])
+
+        logger.debug('QEMU command: %s', ' '.join(command))
+        return command
+
+    def __get_key(self, base: typing.Dict, path: typing.List[str]) -> typing.Any:
+        cur = base
+        for key in path:
+            if cur is None or key not in cur:
+                raise ValueError(f'The key {path} does not exist, aborting!')
+            cur = cur[key]
+        return cur
+
+    @property
+    def get_vm_num(self) -> int:
+        return self.vmnum
+
+    def assign_vf(self, vf_bdf: str) -> None:
+        self.vf_bdf = vf_bdf
+
+    def set_migration_source(self, src_image: str) -> None:
+        self.migrate_source_image = src_image
+        self.migrate_destination_vm = True
+
+    @property
+    def lmem_size(self) -> typing.Optional[int]:
+        if self._lmem_size is None:
+            self.helper_get_debugfs_selfconfig()
+
+        return self._lmem_size
+
+    @property
+    def ggtt_size(self) -> typing.Optional[int]:
+        if self._ggtt_size is None:
+            self.helper_get_debugfs_selfconfig()
+
+        return self._ggtt_size
+
+    @property
+    def contexts(self) -> typing.Optional[int]:
+        if self._contexts is None:
+            self.helper_get_debugfs_selfconfig()
+
+        return self._contexts
+
+    @property
+    def doorbells(self) -> typing.Optional[int]:
+        if self._doorbells is None:
+            self.helper_get_debugfs_selfconfig()
+
+        return self._doorbells
+
+    @property
+    def tile_mask(self) -> typing.Optional[int]:
+        if self._tile_mask is None:
+            self.helper_get_debugfs_selfconfig()
+
+        return self._tile_mask
+
+    @property
+    def gt_nums(self) -> typing.List[int]:
+        self._gt_nums = self.get_gt_num_from_sysfs()
+        if not self._gt_nums:
+            logger.warning("VM sysfs: missing GT index")
+            self._gt_nums = [0]
+
+        return self._gt_nums
+
+    def get_gt_num_from_sysfs(self) -> typing.List[int]:
+        # Get GT number of VF passed to a VM, based on an exisitng a sysfs path
+        vm_gt_num = []
+        if self.dir_exists(posixpath.join(self.sysfs_prefix_path, 'gt/gt0')):
+            vm_gt_num.append(0)
+        if self.dir_exists(posixpath.join(self.sysfs_prefix_path, 'gt/gt1')):
+            vm_gt_num.append(1)
+
+        return vm_gt_num
+
+    def get_drm_driver_name(self) -> str:
+        return self.drm_driver_name
+
+    def get_igt_config(self) -> VmtbIgtConfig:
+        return self.igt_config
+
+    @Decorators.timeout_signal
+    def poweron(self) -> None:
+        logger.debug('Powering on VM%s', self.vmnum)
+        if self.is_running():
+            logger.warning('VM%s already running', self.vmnum)
+            return
+
+        command = self.__get_popen_command()
+        # We don't want to kill the process created here (like 'with' would do) so disable the following linter issue:
+        # R1732: consider-using-with (Consider using 'with' for resource-allocating operations)
+        # pylint: disable=R1732
+        self.process = subprocess.Popen(
+            args=command,
+            stdout=subprocess.PIPE,
+            stderr=subprocess.PIPE,
+            universal_newlines=True)
+
+        qemu_stdout_log_thread = threading.Thread(
+            target=self.__log_qemu_output, args=(
+                self.process.stdout,), daemon=True)
+        qemu_stdout_log_thread.start()
+
+        qemu_stderr_log_thread = threading.Thread(
+            target=self.__log_qemu_output, args=(
+                self.process.stderr,), daemon=True)
+        qemu_stderr_log_thread.start()
+
+        if not self.is_running():
+            logger.error('VM%s did not boot', self.vmnum)
+            raise exceptions.GuestError(f'VM{self.vmnum} did not start')
+
+        try:
+            while not self.__sockets_exists():
+                logger.info('waiting for socket')
+                time.sleep(1)
+            # Passing five minutes timout for every command
+            self.ga = GuestAgentBackend(self.questagent_sockpath, 300)
+            self.qm = QmpMonitor(self.qmp_sockpath, 300)
+            vm_status = self.qm.query_status()
+
+            if not self.migrate_destination_vm and vm_status != 'running':
+                self.process.terminate()
+                logger.error('VM%s status not "running", instead: %s', self.vmnum, vm_status)
+                raise exceptions.GuestError(f'VM{self.vmnum} status {vm_status}')
+        except Exception as exc:
+            logger.error('Error while booting VM%s: %s', self.vmnum, exc)
+            self.process.terminate()
+            raise exceptions.GuestError(f'VM{self.vmnum} crashed with {exc}') from exc
+
+    def is_running(self) -> bool:
+        if self.process is None:
+            return False
+
+        return_code = self.process.poll()
+        if return_code is None:
+            return True
+
+        return False
+
+    @Decorators.timeout_signal
+    def poweroff(self) -> None:
+        logger.debug('Powering off VM%s', self.vmnum)
+        assert self.process
+        if not self.is_running():
+            logger.warning('VM%s not running', self.vmnum)
+            return
+
+        try:
+            self.ga.poweroff()
+            # Wait for shutdown event
+            event: str = self.qm.get_qmp_event()
+            while event != 'SHUTDOWN':
+                event = self.qm.get_qmp_event()
+        except exceptions.AlarmTimeoutError:
+            logger.warning('VM%s hanged on poweroff. Initiating forced termination', self.vmnum)
+            self.process.terminate()
+        finally:
+            # Wait and make sure that qemu shutdown
+            self.process.communicate()
+
+            if self.__sockets_exists():
+                # Remove leftovers and notify about unclear qemu shutdown
+                os.remove(self.questagent_sockpath)
+                os.remove(self.qmp_sockpath)
+                raise exceptions.GuestError(f'VM{self.vmnum} was not gracefully powered off - sockets exist')
+
+    def reboot(self) -> None:
+        """Reboot VM via the Guest-Agent guest-shutdown(reboot) command."""
+        logger.debug('Rebooting VM%s', self.vmnum)
+        self.ga.reboot()
+
+        # Wait for 2x RESET event (guest-reset)
+        reset_event_count = 2
+        while reset_event_count > 0:
+            if self.qm.get_qmp_event() == 'RESET':
+                reset_event_count -= 1
+
+    def reset(self) -> None:
+        """Reset VM via the QMP system_reset command."""
+        logger.debug('Resetting VM%s', self.vmnum)
+        self.qm.system_reset()
+
+        # Wait for 2x RESET event (host-qmp-system-reset, guest-reset)
+        reset_event_count = 2
+        while reset_event_count > 0:
+            if self.qm.get_qmp_event() == 'RESET':
+                reset_event_count -= 1
+
+    def pause(self) -> None:
+        logger.debug('Pausing VM%s', self.vmnum)
+        self.qm.stop()
+        vm_status = self.qm.query_status()
+        if vm_status != 'paused':
+            if self.process:
+                self.process.terminate()
+            logger.error('VM%s status not "paused", instead: %s', self.vmnum, vm_status)
+            raise exceptions.GuestError(f'VM{self.vmnum} status {vm_status}')
+
+    def resume(self) -> None:
+        logger.debug('Resuming VM%s', self.vmnum)
+        self.qm.cont()
+        vm_status = self.qm.query_status()
+        if vm_status != 'running':
+            if self.process:
+                self.process.terminate()
+            logger.error('VM%s status not "running", instead: %s', self.vmnum, vm_status)
+            raise exceptions.GuestError(f'VM{self.vmnum} status {vm_status}')
+
+    def quit(self) -> None:
+        logger.debug('Quitting VM%s', self.vmnum)
+        self.qm.quit()
+        event: str = self.qm.get_qmp_event()
+        while event != 'SHUTDOWN':
+            event = self.qm.get_qmp_event()
+
+    def _enable_suspend(self) -> None:
+        if self.link_exists('/etc/systemd/system/suspend.target'):
+            logger.debug('Enable (unmask) systemd suspend/sleep')
+            self.execute('systemctl unmask suspend.target sleep.target')
+
+    def suspend(self, mode: SuspendMode = SuspendMode.ACPI_S3) -> None:
+        logger.debug('Suspending VM%s (mode: %s)', self.vmnum, mode)
+        self._enable_suspend()
+        if mode == SuspendMode.ACPI_S3:
+            self.ga.suspend_ram()
+        elif mode == SuspendMode.ACPI_S4:
+            # self.ga.suspend_disk()
+            raise exceptions.GuestError('Guest S4 support not implemented')
+        else:
+            raise exceptions.GuestError('Unknown suspend mode')
+
+        event: str = self.qm.get_qmp_event()
+        while event != 'SUSPEND':
+            event = self.qm.get_qmp_event()
+
+        vm_status = self.qm.query_status()
+        if vm_status != 'suspended':
+            if self.process:
+                self.process.terminate()
+            logger.error('VM%s status not "suspended", instead: %s', self.vmnum, vm_status)
+            raise exceptions.GuestError(f'VM{self.vmnum} status {vm_status}')
+
+    def wakeup(self) -> None:
+        logger.debug('Waking up VM%s', self.vmnum)
+        self.qm.system_wakeup()
+
+        event: str = self.qm.get_qmp_event()
+        while event != 'WAKEUP':
+            event = self.qm.get_qmp_event()
+
+        vm_status = self.qm.query_status()
+        if vm_status != 'running':
+            if self.process:
+                self.process.terminate()
+            logger.error('VM%s status not "running", instead: %s', self.vmnum, vm_status)
+            raise exceptions.GuestError(f'VM{self.vmnum} status {vm_status}')
+
+    # {"execute": "guest-exec", "arguments":{"path": "/some/path", "arg": [], "capture-output": true}}
+    # {"error": {"class": "GenericError", "desc": "Guest... "}}
+    def execute(self, command: str) -> int:
+        arr_cmd = shlex.split(command)
+        execout: typing.Dict = self.ga.execute(arr_cmd[0], arr_cmd[1:])
+        ret = execout.get('return')
+        if ret:
+            pid: int = ret.get('pid')
+            logger.debug('Running %s on VM%s with pid %s', command, self.vmnum, pid)
+            return pid
+
+        logger.error('Command %s did not return pid', command)
+        raise exceptions.GuestError(f'No pid returned: {execout}')
+
+    # {'error': {'class': 'GenericError', 'desc': "Invalid parameter 'pid'"}}
+    def execute_status(self, pid: int) -> ProcessResult:
+        out = self.ga.execute_status(pid)
+        status = out.get('return')
+        if not status:
+            raise exceptions.GuestError(f'Not output from guest agent: {out}')
+
+        b64stdout = status.get('out-data', '')
+        stdout = base64.b64decode(b64stdout).decode('utf-8')
+
+        b64stderr = status.get('err-data', '')
+        stderr = base64.b64decode(b64stderr).decode('utf-8')
+
+        return ProcessResult(status.get('exited'), status.get('exitcode', None), stdout, stderr)
+
+    @Decorators.timeout_signal
+    def execute_wait(self, pid: int, timeout: int = DEFAULT_TIMEOUT) -> ProcessResult:
+        exec_status = ProcessResult(False, -1, '', '')
+        while not exec_status.exited:
+            exec_status = self.execute_status(pid)
+            time.sleep(1)
+
+        return exec_status
+
+    def execute_signal(self, pid: int, sig: signal.Signals) -> None:
+        signum = int(sig)
+        killpid = self.execute(f'kill -{signum} {pid}')
+        self.execute_wait(killpid)
+
+    def read_file_content(self, path: str) -> str:
+        out = self.ga.guest_file_open(path, 'r')
+        handle = out.get('return')
+        if not handle:
+            raise exceptions.GuestError('Could not open file on guest')
+
+        try:
+            eof: bool = False
+            file_content: typing.List[str] = []
+            while not eof:
+                ret = self.ga.guest_file_read(handle)
+                eof = self.__get_key(ret, ['return', 'eof'])
+                b64buf: str = self.__get_key(ret, ['return', 'buf-b64'])
+                file_content.append(base64.b64decode(b64buf).decode('utf-8'))
+        finally:
+            self.ga.guest_file_close(handle)
+
+        return ''.join(file_content)
+
+    def write_file_content(self, path: str, content: str) -> int:
+        out: typing.Dict = self.ga.guest_file_open(path, 'w')
+        handle = out.get('return')
+        if not handle:
+            raise exceptions.GuestError('Could not open file on guest')
+
+        b64buf: bytes = base64.b64encode(content.encode())
+
+        try:
+            ret = self.ga.guest_file_write(handle, b64buf.decode('utf-8'))
+            count: int = self.__get_key(ret, ['return', 'count'])
+        finally:
+            self.ga.guest_file_close(handle)
+
+        return count
+
+    def dir_exists(self, path: str) -> bool:
+        pid = self.execute(f'/bin/sh -c "[ -d {path} ]"')
+        status = self.execute_wait(pid)
+        if status.exit_code:
+            return False
+        return True
+
+    def link_exists(self, path: str) -> bool:
+        pid = self.execute(f'/bin/sh -c "[ -h {path} ]"')
+        status = self.execute_wait(pid)
+        if status.exit_code:
+            return False
+        return True
+
+    @Decorators.timeout_signal
+    def ping(self, timeout: int = DEFAULT_TIMEOUT) -> bool:
+        """Ping guest and return true if responding, false otherwise."""
+        logger.debug('Ping VM%s', self.vmnum)
+        try:
+            self.ga.ping()
+        except exceptions.AlarmTimeoutError:
+            logger.warning('VM%s not responded to ping', self.vmnum)
+            return False
+
+        return True
+
+    @Decorators.timeout_signal
+    def save_state(self) -> None:
+        logger.debug('Saving VM%s state (snapshot)', self.vmnum)
+        self.qm.save_snapshot()
+
+        job_status: str = self.qm.get_qmp_event_job()
+        while job_status != 'concluded':
+            job_status = self.qm.get_qmp_event_job()
+
+        job_status, job_error = self.qm.query_jobs('snapshot-save')
+        if job_status == 'concluded' and job_error is not None:
+            raise exceptions.GuestError(f'VM{self.vmnum} state save error: {job_error}')
+
+        logger.debug('VM%s state save finished successfully', self.vmnum)
+
+    @Decorators.timeout_signal
+    def load_state(self) -> None:
+        logger.debug('Loading VM state (snapshot)')
+        self.qm.load_snapshot()
+
+        job_status: str = self.qm.get_qmp_event_job()
+        while job_status != 'concluded':
+            job_status = self.qm.get_qmp_event_job()
+
+        job_status, job_error = self.qm.query_jobs('snapshot-load')
+        if job_status == 'concluded' and job_error is not None:
+            raise exceptions.GuestError(f'VM{self.vmnum} state load error: {job_error}')
+
+        logger.debug('VM state load finished successfully')
+
+    # helper_convert_units_to_bytes - convert size with units to bytes
+    # @size_str: multiple-byte unit size with suffix (K/M/G)
+    # Returns: size in bytes
+    # TODO: function perhaps could be moved to some new utils module
+    # improve - consider regex to handle various formats eg. both M and MB
+    def helper_convert_units_to_bytes(self, size_str: str) -> int:
+        size_str = size_str.upper()
+        size_int = 0
+
+        if size_str.endswith('B'):
+            size_int = int(size_str[0:-1])
+        elif size_str.endswith('K'):
+            size_int = int(size_str[0:-1]) * 1024
+        elif size_str.endswith('M'):
+            size_int = int(size_str[0:-1]) * 1024**2
+        elif size_str.endswith('G'):
+            size_int = int(size_str[0:-1]) * 1024**3
+
+        return size_int
+
+    # helper_get_debugfs_selfconfig - read resources allocated to VF from debugfs:
+    # /sys/kernel/debug/dri/@card/gt@gt_num/iov/self_config
+    # @card: card number
+    # @gt_num: GT instance number
+    def helper_get_debugfs_selfconfig(self, card: int = 0, gt_num: int = 0) -> None:
+        path = posixpath.join(f'/sys/kernel/debug/dri/{card}/gt{gt_num}/iov/self_config')
+        out = self.read_file_content(path)
+
+        for line in out.splitlines():
+            param, value = line.split(':')
+
+            if param == 'GGTT size':
+                self._ggtt_size = self.helper_convert_units_to_bytes(value)
+            elif param == 'LMEM size':
+                self._lmem_size = self.helper_convert_units_to_bytes(value)
+            elif param == 'contexts':
+                self._contexts = int(value)
+            elif param == 'doorbells':
+                self._doorbells = int(value)
+            elif param == 'tile mask':
+                self._tile_mask = int(value, base=16)
diff --git a/tools/vmtb/dev-requirements.txt b/tools/vmtb/dev-requirements.txt
new file mode 100644
index 000000000..46466e02f
--- /dev/null
+++ b/tools/vmtb/dev-requirements.txt
@@ -0,0 +1,6 @@
+# Testing
+pytest
+
+# Building
+build
+virtualenv
diff --git a/tools/vmtb/pyproject.toml b/tools/vmtb/pyproject.toml
new file mode 100644
index 000000000..7b8a63da2
--- /dev/null
+++ b/tools/vmtb/pyproject.toml
@@ -0,0 +1,25 @@
+[build-system]
+requires = ["setuptools >= 70.0"]
+build-backend = "setuptools.build_meta"
+
+[project]
+name = "vmtb"
+version = "1.0.0"
+description = "SR-IOV VM-level test tool"
+readme = "README.md"
+requires-python = ">=3.11"
+
+authors = [
+  {name = "Intel Corporation"}
+]
+classifiers = [
+    "Programming Language :: Python :: 3",
+    "License :: OSI Approved :: MIT License",
+]
+dependencies = [
+    "pytest",
+]
+
+[tool.setuptools.packages.find]
+where = ["."]
+include = ["*"]
diff --git a/tools/vmtb/pytest.ini b/tools/vmtb/pytest.ini
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/requirements.txt b/tools/vmtb/requirements.txt
new file mode 100644
index 000000000..5d80ceeab
--- /dev/null
+++ b/tools/vmtb/requirements.txt
@@ -0,0 +1,2 @@
+# Used for running tests
+pytest
diff --git a/tools/vmtb/vmtb_config.json b/tools/vmtb/vmtb_config.json
new file mode 100644
index 000000000..640a64123
--- /dev/null
+++ b/tools/vmtb/vmtb_config.json
@@ -0,0 +1,31 @@
+{
+    "host": {
+        "card_index": 0,
+        "driver": "xe",
+        "igt": {
+            "test_dir": "/usr/local/libexec/igt-gpu-tools/",
+            "tool_dir": "/usr/local/bin/",
+            "lib_dir": "/usr/local/lib/x86_64-linux-gnu",
+            "result_dir": "/usr/local/results",
+            "options": "--piglit-style-dmesg --dmesg-warn-level=4 --abort-on-monitored-error=taint --overwrite"
+        }
+    },
+    "guest": {
+        "os_image": "guest_os.img",
+        "driver": "xe",
+        "igt": {
+            "test_dir": "/usr/local/libexec/igt-gpu-tools/",
+            "tool_dir": "/usr/local/bin/",
+            "lib_dir": "/usr/local/lib/x86_64-linux-gnu",
+            "result_dir": "/usr/local/results",
+            "options": "--piglit-style-dmesg --dmesg-warn-level=4 --abort-on-monitored-error=taint --overwrite"
+        }
+    },
+    "resources": {
+        "vgpu_profiles_path": "vmm_flows/resources/vgpu_profiles",
+        "guc_ver_path": "vmm_flows/resources/guc"
+    },
+    "ci": {
+        "host_dmesg_file": "/tmp/vm-test-bench-host_dmesg.log.tmp"
+    }
+}
-- 
2.39.1

