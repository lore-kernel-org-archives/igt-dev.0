Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC2AC25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 08:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E684E10E39F;
	Fri, 24 May 2024 08:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QasazrLq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672DA10E39F
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 08:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716537898; x=1748073898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iY3WZiz4yXam2ju9dXnR1vFBdYzwRFiO6sHufAkdd6c=;
 b=QasazrLqbpmx7QHGY9sWjEewLjx23C7RqcRjyYmxJ3dDAQF6WL7RPfGL
 RGGVmzCquEbnpSpmiv/genxgBU8Q92dCDdqJJ4sIcOTdVREylO/L8X70U
 e0Xvw5L9IcKiui8TMT0G0Upd86xMundTtE71nbFzACQERKWsiHHTca7e9
 /4w9rG9o0X6yLiRDszohrHPUs4nQjgz2chPTtUk3PgwG/4LQ8ISrwDbhI
 jzzTBop1liSGWkXpF/fdFOUIOiDS8NsL9WHFMFepeAS5auhK5COnIgERL
 4MT67IvWWy3UO0zz2DeVqDWWGvRcVn1ew+haTIqqfsVqX/lmJjgx1Jcmt w==;
X-CSE-ConnectionGUID: EiRi/JDdT8C7Z5T9O7Hf6g==
X-CSE-MsgGUID: +QXoxW4WQl2zS6LmC/MszQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12844405"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="12844405"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:04:57 -0700
X-CSE-ConnectionGUID: uhCCVtctQ6qjAA2Ljl0fIw==
X-CSE-MsgGUID: q3AwYqj9RWOsc6u+aMrm6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="57184501"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:04:51 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 mauro.chehab@linux.intel.com
Subject: [PATCH i-g-t] [RFC] Introduce SR-IOV VM-level testing tool
Date: Fri, 24 May 2024 09:50:29 +0200
Message-Id: <20240524075029.235944-1-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
(SR-IOV) supported by the xe/i915 driver.
It allows to enable and provision VFs (Virtual Functions)
and facilitates manipulation of VMs (Virtual Machines)
running virtual GPUs.
This includes starting and accessing the KVM/QEMU VMs,
running workloads or shell commands (Guest/Host),
handling power states, saving and restoring VF state etc.

Currently the following SR-IOV VM test scenarios are covered:
- basic VF/VM setup with IGT workload submission
- VF provisioning with various vGPU profiles
- VF save/restore (VM cold migration)
- VF scheduling
- VM power states
- VF FLR
- VM crash (guest kernel panic)
- GuC FW versioning

There's still refactoring ongoing for few tests,
but any feedback would be greatly appreciated.

v2:
- reformat copyright header to the dedicated UTF letter
- remove optional license file and references
- wrap lines in the readme file at column 80
- reduce patch size by including a core tool and basic test only

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/MANIFEST.in                        |   3 +
 tools/vmtb/README.md                          |  93 ++
 tools/vmtb/bench/__init__.py                  |  46 +
 tools/vmtb/bench/exceptions.py                |  38 +
 tools/vmtb/bench/executors/__init__.py        |   0
 .../bench/executors/executor_interface.py     |  24 +
 tools/vmtb/bench/executors/gem_wsim.py        |  71 ++
 tools/vmtb/bench/executors/igt.py             | 127 +++
 tools/vmtb/bench/executors/shell.py           |  31 +
 tools/vmtb/bench/helpers/__init__.py          |   0
 tools/vmtb/bench/helpers/helpers.py           | 248 ++++++
 tools/vmtb/bench/machines/__init__.py         |   0
 tools/vmtb/bench/machines/host.py             | 820 ++++++++++++++++++
 .../vmtb/bench/machines/machine_interface.py  |  70 ++
 tools/vmtb/bench/machines/pci.py              |  99 +++
 tools/vmtb/bench/machines/vgpu_profile.py     | 197 +++++
 tools/vmtb/bench/machines/virtual/__init__.py |   0
 .../machines/virtual/backends/__init__.py     |   0
 .../virtual/backends/backend_interface.py     |  42 +
 .../machines/virtual/backends/guestagent.py   | 101 +++
 .../machines/virtual/backends/qmp_monitor.py  | 163 ++++
 tools/vmtb/bench/machines/virtual/vm.py       | 595 +++++++++++++
 tools/vmtb/dev-requirements.txt               |  14 +
 tools/vmtb/pyproject.toml                     |  25 +
 tools/vmtb/requirements.txt                   |   2 +
 tools/vmtb/vmm_flows/__init__.py              |   0
 tools/vmtb/vmm_flows/conftest.py              | 296 +++++++
 .../resources/vgpu_profile/ADL_int.csv        |  14 +
 .../resources/vgpu_profile/ADL_vfs.csv        |  14 +
 .../resources/vgpu_profile/ATSM150_int.csv    |  14 +
 .../resources/vgpu_profile/ATSM150_vfs.csv    |  14 +
 .../resources/vgpu_profile/ATSM75_int.csv     |   9 +
 .../resources/vgpu_profile/ATSM75_vfs.csv     |   9 +
 .../resources/vgpu_profile/PVC2_int.csv       |   8 +
 .../resources/vgpu_profile/PVC2_vfs.csv       |   8 +
 tools/vmtb/vmm_flows/test_basic.py            | 175 ++++
 36 files changed, 3370 insertions(+)
 create mode 100644 tools/vmtb/MANIFEST.in
 create mode 100644 tools/vmtb/README.md
 create mode 100644 tools/vmtb/bench/__init__.py
 create mode 100644 tools/vmtb/bench/exceptions.py
 create mode 100644 tools/vmtb/bench/executors/__init__.py
 create mode 100644 tools/vmtb/bench/executors/executor_interface.py
 create mode 100644 tools/vmtb/bench/executors/gem_wsim.py
 create mode 100644 tools/vmtb/bench/executors/igt.py
 create mode 100644 tools/vmtb/bench/executors/shell.py
 create mode 100644 tools/vmtb/bench/helpers/__init__.py
 create mode 100644 tools/vmtb/bench/helpers/helpers.py
 create mode 100644 tools/vmtb/bench/machines/__init__.py
 create mode 100644 tools/vmtb/bench/machines/host.py
 create mode 100644 tools/vmtb/bench/machines/machine_interface.py
 create mode 100644 tools/vmtb/bench/machines/pci.py
 create mode 100644 tools/vmtb/bench/machines/vgpu_profile.py
 create mode 100644 tools/vmtb/bench/machines/virtual/__init__.py
 create mode 100644 tools/vmtb/bench/machines/virtual/backends/__init__.py
 create mode 100644 tools/vmtb/bench/machines/virtual/backends/backend_inte=
rface.py
 create mode 100644 tools/vmtb/bench/machines/virtual/backends/guestagent.py
 create mode 100644 tools/vmtb/bench/machines/virtual/backends/qmp_monitor.=
py
 create mode 100644 tools/vmtb/bench/machines/virtual/vm.py
 create mode 100644 tools/vmtb/dev-requirements.txt
 create mode 100644 tools/vmtb/pyproject.toml
 create mode 100644 tools/vmtb/requirements.txt
 create mode 100644 tools/vmtb/vmm_flows/__init__.py
 create mode 100644 tools/vmtb/vmm_flows/conftest.py
 create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/ADL_int.csv
 create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/ADL_vfs.csv
 create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM150_int=
.csv
 create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM150_vfs=
.csv
 create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM75_int.=
csv
 create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM75_vfs.=
csv
 create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/PVC2_int.csv
 create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/PVC2_vfs.csv
 create mode 100644 tools/vmtb/vmm_flows/test_basic.py

diff --git a/tools/vmtb/MANIFEST.in b/tools/vmtb/MANIFEST.in
new file mode 100644
index 000000000..a51ce38c2
--- /dev/null
+++ b/tools/vmtb/MANIFEST.in
@@ -0,0 +1,3 @@
+include tests/pytest.ini
+include vmm_flows/resources/guc/*
+include vmm_flows/resources/vgpu_profile/*
diff --git a/tools/vmtb/README.md b/tools/vmtb/README.md
new file mode 100644
index 000000000..bd23c9fae
--- /dev/null
+++ b/tools/vmtb/README.md
@@ -0,0 +1,93 @@
+VM Test Bench
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Description
+-----------
+VM Test Bench (VMTB) is a tool for testing virtualization (SR-IOV)
+supported by the xe/i915 driver.
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
+- xe/i915 PF driver with SR-IOV support
+- VFIO driver (VF save/restore requires vendor specific driver variant)
+- QEMU (VF save/restore requires QEMU 8.0+)
+- IGT binaries
+- Python 3.8+ with pytest installed
+- VM Test Bench tool deployed
+
+Guest OS is expected to contain:
+- xe/i915 VF driver
+- QEMU Guest-Agent service for operating on Guest OS
+- IGT binaries to execute worklads on VM
+
+Usual VMTB testing environment bases on Ubuntu 22.04 installed
+on Host and Guest, but execution on other distros should be also possible.
+
+Building
+--------
+The VMTB source distribution package can be built with:
+=20=20=20=20
+    make build
+
+or:
+
+    python -m build
+
+Both run the Python `build` frontend
+in an isolated virtual environment (`venv`).
+
+The output tarball is created in the `dist/` subdirectory,
+that should be copied and extracted on the host device under test.
+
+Running tests
+-------------
+Test implemented by VM Test Bench are called VMM Flows and located in
+`vmm_flows/` directory. Test files are prefixed with `test_` and encapsula=
te
+related validation scenarios. Each test file can contain multiple test cla=
sses
+(`TestXYZ`) or functions (`test_xyz`), that can be executed independently.
+
+Run the VMM Flows test in the following way (as root):
+
+    $ pytest-3 -v ./vmtb-1.0.0/vmm_flows/<test_file_name>.py::<test_class_=
or_function_name> --vm-image=3D/home/gta/<guest_os.img>
+
+For example, the simplest 1xVF/VM test scenario can be executed as:
+
+    # sudo pytest-3 -v ./vmtb-1.0.0/vmm_flows/test_basic.py::TestVmSetup::=
test_vm_boot[A1-1VM] --vm-image=3D/home/gta/guest_os.img
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
+Contains 'core' part of the tool, including Host and VirtualMachine
+abstractions, means to execute workloads (or other tasks),
+various helper functions etc.
+VMTB utilizes QMP (QEMU Machine Protocol) to communicate and operate with =
VMs
+and QGA (QEMU Guest Agent) to interact with the Guest OS.
+
+#### `vmm_flows/`
+Contains actual functional VM-level tests (`test_*.py`)
+as well as a setup and tear-down fixtures (`conftest.py`).
+New test files/scenarios shall be placed in this location.
+
+#### `tests/`
+Contains (near) unit tests for the tool/bench itself.
diff --git a/tools/vmtb/bench/__init__.py b/tools/vmtb/bench/__init__.py
new file mode 100644
index 000000000..08b8ed740
--- /dev/null
+++ b/tools/vmtb/bench/__init__.py
@@ -0,0 +1,46 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import logging
+import logging.config
+
+LOG_CONFIG =3D {
+    "version": 1,
+    "formatters": {
+        "detailed": {
+            "format": "%(asctime)s - %(name)s - %(levelname)s =E2=80=94 %(=
funcName)s:%(lineno)d =E2=80=94 %(message)s"
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
+logger =3D logging.getLogger(__name__)
+
+logger.info('############################################')
+logger.info('#        Welcome to VM Test Bench          #')
+logger.info('#      Completed logging configuring!      #')
+logger.info('#         Ready to run some tests          #')
+logger.info('############################################')
diff --git a/tools/vmtb/bench/exceptions.py b/tools/vmtb/bench/exceptions.py
new file mode 100644
index 000000000..9784869aa
--- /dev/null
+++ b/tools/vmtb/bench/exceptions.py
@@ -0,0 +1,38 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
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
diff --git a/tools/vmtb/bench/executors/__init__.py b/tools/vmtb/bench/exec=
utors/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/bench/executors/executor_interface.py b/tools/vmtb/=
bench/executors/executor_interface.py
new file mode 100644
index 000000000..d235d43f8
--- /dev/null
+++ b/tools/vmtb/bench/executors/executor_interface.py
@@ -0,0 +1,24 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import abc
+import signal
+
+from bench.machines.machine_interface import ProcessResult
+
+
+class ExecutorInterface(metaclass=3Dabc.ABCMeta):
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
diff --git a/tools/vmtb/bench/executors/gem_wsim.py b/tools/vmtb/bench/exec=
utors/gem_wsim.py
new file mode 100644
index 000000000..bd7252a4e
--- /dev/null
+++ b/tools/vmtb/bench/executors/gem_wsim.py
@@ -0,0 +1,71 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import logging
+import re
+import typing
+
+from bench import exceptions
+from bench.executors.shell import ShellExecutor
+from bench.machines.machine_interface import MachineInterface, DEFAULT_TIM=
EOUT
+
+logger =3D logging.getLogger(__name__)
+
+class GemWsimResult(typing.NamedTuple):
+    elapsed_sec: float
+    workloads_per_sec: float
+
+# Basic workloads
+ONE_CYCLE_DURATION_MS =3D 10
+PREEMPT_10MS_WORKLOAD =3D (f'1.DEFAULT.{int(ONE_CYCLE_DURATION_MS * 1000 /=
 2)}.0.0'
+                         f',2.DEFAULT.{int(ONE_CYCLE_DURATION_MS * 1000 / =
2)}.-1.1')
+NON_PREEMPT_10MS_WORKLOAD =3D f'X.1.0,X.2.0,{PREEMPT_10MS_WORKLOAD}'
+
+class GemWsim(ShellExecutor):
+    def __init__(self, machine: MachineInterface, num_clients: int =3D 1, =
num_repeats: int =3D 1,
+                 workload: str =3D PREEMPT_10MS_WORKLOAD, timeout: int =3D=
 DEFAULT_TIMEOUT) -> None:
+        super().__init__(
+            machine,
+            f'/usr/local/libexec/igt-gpu-tools/benchmarks/gem_wsim -w {wor=
kload} -c {num_clients} -r {num_repeats}',
+            timeout)
+        self.machine_id =3D str(machine)
+
+    def __str__(self) -> str:
+        return f'gem_wsim({self.machine_id}:{self.pid})'
+
+    def is_running(self) -> bool:
+        return not self.status().exited
+
+    def wait_results(self) -> GemWsimResult:
+        proc_result =3D self.wait()
+        if proc_result.exit_code =3D=3D 0:
+            logger.info('%s: %s', self, proc_result.stdout)
+            # Try parse output ex.: 19.449s elapsed (102.836 workloads/s)
+            pattern =3D r'(?P<elapsed>\d+(\.\d*)?|\.\d+)s elapsed \((?P<wp=
s>\d+(\.\d*)?|\.\d+) workloads/s\)'
+            match =3D re.search(pattern, proc_result.stdout, re.MULTILINE)
+            if match:
+                return GemWsimResult(float(match.group('elapsed')), float(=
match.group('wps')))
+        raise exceptions.GemWsimError(f'{self}: exit_code: {proc_result.ex=
it_code}'
+                                      f' stdout: {proc_result.stdout} stde=
rr: {proc_result.stderr}')
+
+
+def gem_wsim_parallel_exec_and_check(vms: typing.List[MachineInterface], w=
orkload: str, iterations: int,
+                                     expected: typing.Optional[GemWsimResu=
lt] =3D None) -> GemWsimResult:
+    # launch on each VM in parallel
+    wsim_procs =3D [GemWsim(vm, 1, iterations, workload) for vm in vms]
+    for i, wsim in enumerate(wsim_procs):
+        assert wsim.is_running(), f'GemWsim failed to start on VM{i}'
+
+    results =3D [wsim.wait_results() for wsim in wsim_procs]
+    if expected is not None:
+        assert results[0].elapsed_sec > expected.elapsed_sec * 0.9
+        assert results[0].workloads_per_sec > expected.workloads_per_sec *=
 0.9
+    for r in results[1:]:
+        # check wps ratio ~1.0 with 10% tolerance
+        assert 0.9 < r.workloads_per_sec / results[0].workloads_per_sec < =
1.1
+        # check elapsed ratio ~1.0 with 10% tolerance
+        assert 0.9 < r.elapsed_sec / results[0].elapsed_sec < 1.1
+    # return first result, all other are asserted to be ~same
+    return results[0]
diff --git a/tools/vmtb/bench/executors/igt.py b/tools/vmtb/bench/executors=
/igt.py
new file mode 100644
index 000000000..52f31e0f4
--- /dev/null
+++ b/tools/vmtb/bench/executors/igt.py
@@ -0,0 +1,127 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import json
+import logging
+import posixpath
+import signal
+import typing
+import enum
+
+from bench.executors.executor_interface import ExecutorInterface
+from bench.machines.machine_interface import MachineInterface, ProcessResu=
lt, DriverModule, DEFAULT_TIMEOUT
+from bench.executors.shell import ShellExecutor
+
+logger =3D logging.getLogger(__name__)
+
+
+class IgtConfiguration(typing.NamedTuple):
+    test_dir: str =3D '/usr/local/libexec/igt-gpu-tools/'
+    tool_dir: str =3D '/usr/local/bin/'
+    lib_dir: str =3D '/usr/local/lib/x86_64-linux-gnu'
+    result_dir: str =3D '/usr/local/results'
+    options: str =3D '--piglit-style-dmesg --dmesg-warn-level=3D4 --abort-=
on-monitored-error=3Dtaint --overwrite'
+
+
+class IgtType(enum.Enum):
+    EXEC_BASIC =3D 1
+    EXEC_STORE =3D 2
+    SPIN_BATCH =3D 3
+
+
+# Mappings of driver specific (i915/xe) IGT instances:
+# {IGT type: (i915 IGT name, xe IGT name)}
+igt_tests: typing.Dict[IgtType, typing.Tuple[str, str]] =3D {
+    IgtType.EXEC_BASIC: ('igt@gem_exec_basic@basic', 'igt@xe_exec_basic@on=
ce-basic'),
+    IgtType.EXEC_STORE: ('igt@gem_exec_store@dword', 'igt@xe_exec_store@ba=
sic-store'),
+    IgtType.SPIN_BATCH: ('igt@gem_spin_batch@legacy', 'igt@xe_spin_batch@s=
pin-basic')
+    }
+
+
+class IgtExecutor(ExecutorInterface):
+    def __init__(self, target: MachineInterface,
+                 test: typing.Union[str, IgtType],
+                 timeout: int =3D DEFAULT_TIMEOUT,
+                 igt_config: IgtConfiguration =3D IgtConfiguration()) -> N=
one:
+        self.igt_config =3D igt_config
+        # TODO ld_library_path not used now, need a way to pass this to gu=
est
+        #ld_library_path =3D f'LD_LIBRARY_PATH=3D{igt_config.lib_dir}'
+        runner =3D posixpath.join(igt_config.tool_dir, 'igt_runner')
+        testlist =3D '/tmp/igt_executor.testlist'
+        command =3D f'{runner} {igt_config.options} ' \
+                  f'--test-list {testlist} {igt_config.test_dir} {igt_conf=
ig.result_dir}'
+        self.results: typing.Dict[str, typing.Any] =3D {}
+        self.target: MachineInterface =3D target
+        self.igt: str =3D test if isinstance(test, str) else self.select_i=
gt_variant(target.get_drm_driver(), test)
+        self.target.write_file_content(testlist, self.igt)
+        self.timeout: int =3D timeout
+
+        logger.info("[%s] Execute IGT test: %s", target, self.igt)
+        self.pid: int =3D self.target.execute(command)
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
+        path =3D posixpath.join(self.igt_config.result_dir, 'results.json')
+        result =3D self.target.read_file_content(path)
+        self.results =3D json.loads(result)
+        return self.results
+
+    def did_pass(self) -> bool:
+        results =3D self.get_results_log()
+        totals =3D results.get('totals')
+        if not totals:
+            return False
+        aggregate =3D totals.get('root')
+        if not aggregate:
+            return False
+
+        pass_case =3D 0
+        fail_case =3D 0
+        for key in aggregate:
+            if key in ['pass', 'warn', 'dmesg-warn']:
+                pass_case =3D pass_case + aggregate[key]
+                continue
+            fail_case =3D fail_case + aggregate[key]
+
+        logger.debug('Full IGT test results:\n%s', json.dumps(results, ind=
ent=3D4))
+
+        if fail_case > 0:
+            logger.error('Test failed!')
+            return False
+
+        return True
+
+    def select_igt_variant(self, driver: DriverModule, igt_type: IgtType) =
-> str:
+        # Select IGT variant dedicated for a given drm driver: xe or i915
+        igt =3D igt_tests[igt_type]
+        return igt[1] if driver is DriverModule.XE else igt[0]
+
+
+def igt_list_subtests(target: MachineInterface, test_name: str,
+                      igt_config: IgtConfiguration =3D IgtConfiguration())=
 -> typing.List[str]:
+    command =3D f'{igt_config.test_dir}{test_name} --list-subtests'
+    proc_result =3D ShellExecutor(target, command).wait()
+    if proc_result.exit_code =3D=3D 0:
+        return proc_result.stdout.split("\n")
+    return []
diff --git a/tools/vmtb/bench/executors/shell.py b/tools/vmtb/bench/executo=
rs/shell.py
new file mode 100644
index 000000000..25fac6141
--- /dev/null
+++ b/tools/vmtb/bench/executors/shell.py
@@ -0,0 +1,31 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import signal
+
+from bench.executors.executor_interface import ExecutorInterface
+from bench.machines.machine_interface import MachineInterface, ProcessResu=
lt, DEFAULT_TIMEOUT
+
+
+class ShellExecutor(ExecutorInterface):
+    def __init__(self, target: MachineInterface, command: str, timeout: in=
t =3D DEFAULT_TIMEOUT) -> None:
+        self.target =3D target
+        self.timeout =3D timeout
+        self.pid =3D self.target.execute(command)
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
diff --git a/tools/vmtb/bench/helpers/__init__.py b/tools/vmtb/bench/helper=
s/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/bench/helpers/helpers.py b/tools/vmtb/bench/helpers=
/helpers.py
new file mode 100644
index 000000000..860026a80
--- /dev/null
+++ b/tools/vmtb/bench/helpers/helpers.py
@@ -0,0 +1,248 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import logging
+import posixpath
+import subprocess
+import typing
+import re
+import shutil
+from os import listdir
+from os.path import isfile, join
+
+from typing import List
+from bench import exceptions
+from bench.executors.igt import IgtExecutor
+from bench.executors.shell import ShellExecutor
+from bench.machines.machine_interface import MachineInterface
+from bench.machines.virtual.vm import VirtualMachine
+from bench.machines import pci
+from bench.machines.host import SriovHost, DriverModule
+
+logger =3D logging.getLogger(__name__)
+
+
+def driver_check(machine: MachineInterface, card: int =3D 0) -> bool:
+    drm_driver =3D machine.get_drm_driver()
+    if not machine.dir_exists(f'/sys/module/{drm_driver}/drivers/pci:{drm_=
driver}/'):
+        logger.error(f'{drm_driver} module not loaded on card %s', card)
+        return False
+
+    if drm_driver is DriverModule.I915:
+        # 'wedged' debugfs entry is not available for xe (yet?)
+        wedged_debugfs =3D posixpath.join('/sys/kernel/debug/dri/', str(ca=
rd), 'i915_wedged')
+        out =3D machine.read_file_content(wedged_debugfs)
+        logger.debug('Wedge value %s', out)
+        if int(out) =3D=3D 0:
+            return True
+
+        logger.error('i915 is wedged')
+        return False
+
+    return True
+
+
+def igt_check(igt_test: IgtExecutor) -> bool:
+    ''' Helper/wrapper for wait and check for igt test '''
+    igt_out =3D igt_test.wait()
+    if igt_out.exit_code =3D=3D 0 and igt_test.did_pass():
+        return True
+    logger.error('IGT failed with %s', igt_out)
+    return False
+
+
+def igt_run_check(machine: MachineInterface, test: str) -> bool:
+    ''' Helper/wrapper for quick run and check for igt test '''
+    igt_test =3D IgtExecutor(machine, test)
+    return igt_check(igt_test)
+
+
+def cmd_check(cmd: ShellExecutor) -> bool:
+    ''' Helper/wrapper for wait and check for shell command '''
+    cmd_out =3D cmd.wait()
+    if cmd_out.exit_code =3D=3D 0:
+        return True
+    logger.error('%s failed with %s', cmd, cmd_out)
+    return False
+
+
+def cmd_run_check(machine: MachineInterface, cmd: str) -> bool:
+    ''' Helper/wrapper for quick run and check for shell command '''
+    cmd_run =3D ShellExecutor(machine, cmd)
+    return cmd_check(cmd_run)
+
+
+def modprobe_driver(machine: MachineInterface, parameters: str =3D '', opt=
ions: str =3D '') -> ShellExecutor:
+    """Load driver (modprobe [driver_module]) and return ShellExecutor ins=
tance (do not check a result)."""
+    drm_driver =3D machine.get_drm_driver()
+    modprobe_cmd =3D ShellExecutor(machine, f'modprobe {drm_driver} {optio=
ns} {parameters}')
+    return modprobe_cmd
+
+
+def modprobe_driver_check(machine: MachineInterface, cmd: ShellExecutor) -=
> bool:
+    """Check result of a driver load (modprobe) based on a given ShellExec=
utor instance."""
+    modprobe_success =3D cmd_check(cmd)
+    if modprobe_success:
+        return driver_check(machine)
+
+    logger.error('Modprobe failed')
+    return False
+
+
+def modprobe_driver_run_check(machine: MachineInterface, parameters: str =
=3D '', options: str =3D '') -> bool:
+    """Load (modprobe) a driver and check a result (waits until operation =
ends)."""
+    modprobe_cmd =3D modprobe_driver(machine, parameters, options)
+    modprobe_success =3D modprobe_driver_check(machine, modprobe_cmd)
+    if modprobe_success:
+        return driver_check(machine)
+
+    logger.error('Modprobe failed')
+    return False
+
+
+def is_driver_loaded(machine: MachineInterface, driver_name: str) -> bool:
+    if machine.dir_exists(posixpath.join('/sys/bus/pci/drivers/', driver_n=
ame)):
+        return True
+
+    return False
+
+
+def load_host_drivers(host: SriovHost) -> None:
+    """Load (modprobe) required host drivers (DRM and VFIO)."""
+    drm_driver =3D host.get_drm_driver()
+    if not is_driver_loaded(host, drm_driver):
+        logger.info('%s driver is not loaded - probe module', drm_driver)
+        drv_probe_pid =3D modprobe_driver(host).pid
+        assert host.execute_wait(drv_probe_pid).exit_code =3D=3D 0
+
+    host.set_autoprobe(0)
+
+    vfio_driver =3D host.get_vfio_driver()
+    if not is_driver_loaded(host, vfio_driver):
+        logger.info('%s driver is not loaded - probe module', vfio_driver)
+        vfio_probe_pid =3D host.execute(f'modprobe {vfio_driver}')
+        assert host.execute_wait(vfio_probe_pid).exit_code =3D=3D 0
+
+
+def get_devices_bound_to_driver(driver_name: str) -> typing.List[str]:
+    ''' Helper to get all devices' BDFs bound to the given driver '''
+    out =3D subprocess.check_output(['ls', f'/sys/bus/pci/drivers/{driver_=
name}'], universal_newlines=3DTrue)
+    pattern =3D r'([0-9a-fA-F]{4}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}\.\d{1})'
+    matches =3D re.findall(pattern, out, re.MULTILINE)
+
+    return matches
+
+
+def device_unbind(device_bdf: str) -> None:
+    path =3D posixpath.join('/sys/bus/pci/devices/', f'{device_bdf}/driver=
/unbind')
+    logger.debug('About to write %s to %s', device_bdf, path)
+
+    try:
+        with open(path, 'w', encoding=3D'utf-8') as file:
+            file.write(device_bdf)
+    except Exception as exc:
+        logger.error('Unable to unbind, Error: %s', exc)
+
+
+def unload_host_drivers(host: SriovHost) -> None:
+    drm_driver =3D host.get_drm_driver()
+    vfio_driver =3D host.get_vfio_driver()
+    logger.debug("Cleanup: unload drivers\n")
+    rmmod_pid =3D host.execute(f'modprobe -rf {vfio_driver}')
+    assert host.execute_wait(rmmod_pid).exit_code =3D=3D 0
+
+    for device_bdf in get_devices_bound_to_driver(drm_driver):
+        logger.debug("Unbind %s from device %s", drm_driver, device_bdf)
+        device_unbind(device_bdf)
+
+    rmmod_pid =3D host.execute(f'modprobe -rf {drm_driver}')
+    assert host.execute_wait(rmmod_pid).exit_code =3D=3D 0
+    logger.debug("Host %s successfully removed", drm_driver)
+
+
+def cold_migrate_vm(vm_source: VirtualMachine, vm_destination: VirtualMach=
ine) -> bool:
+    ''' Helper for VM cold migration using snapshots '''
+    if not vm_source.is_running() or vm_destination.is_running():
+        logger.error('Invalid initial VM state for migration')
+        return False
+
+    try:
+        vm_source.pause()
+        vm_source.save_state()
+        vm_source.quit()
+
+        vm_destination.set_migration_source(vm_source.image)
+        vm_destination.poweron()
+        vm_destination.load_state()
+        vm_destination.resume()
+    except Exception as exc:
+        logger.error('Error during VM migration: %s', exc)
+        return False
+
+    return True
+
+
+def duplicate_vm_image(src_img: str) -> str:
+    ''' Helper to duplicate source VM qcow2 image for destination VM re-us=
e '''
+    dst_img: str =3D 'dst_' + posixpath.basename(src_img)
+    try:
+        shutil.copyfile(src_img, dst_img)
+    except Exception as exc:
+        raise exceptions.HostError(f'Error during VM image copy: {exc}') f=
rom exc
+
+    logger.debug("Duplicated source image (%s) for destination VM usage (%=
s)", src_img, dst_img)
+
+    return dst_img
+
+
+class GucVersion:
+    def __init__(self, major: int, minor: int, patch: int):
+        self.major =3D major
+        self.minor =3D minor
+        self.patch =3D patch
+
+    def __str__(self) -> str:
+        return f'{self.major}.{self.minor}.{self.patch}'
+
+    def __repr__(self) -> str:
+        return f'{self.major}.{self.minor}.{self.patch}'
+
+    def __eq__(self, other: object) -> bool:
+        if isinstance(other, GucVersion):
+            if other.major =3D=3D self.major and other.minor =3D=3D self.m=
inor and other.patch =3D=3D self.patch:
+                return True
+        return False
+
+
+def list_guc_binaries(host: SriovHost) -> List[GucVersion]:
+    ''' Helper that returns list of GuC binary versions found for device's=
 prefix given '''
+    if host.gpu_name in (pci.GpuDevice.ATSM150, pci.GpuDevice.ATSM75):
+        device_prefix =3D 'dg2_guc_'
+    elif host.gpu_name is pci.GpuDevice.PVC:
+        device_prefix =3D 'pvc_guc_'
+    elif host.gpu_name is pci.GpuDevice.ADLP:
+        device_prefix =3D 'adlp_guc_'
+    else:
+        raise exceptions.HostError(f'GPU Device unknown: {host.gpu_name}')
+
+    firmware_path =3D '/usr/lib/firmware/i915/'
+    firmware_dir_contents =3D [f for f in listdir(firmware_path) if isfile=
(join(firmware_path, f))]
+    guc_vers_numbers =3D []
+    guc_binaries_versions =3D []
+    version_format =3D r'\d+\.\d+\.\d+'
+
+    for entry in firmware_dir_contents:
+        if entry.startswith(device_prefix):
+            found_version =3D re.search(version_format, entry)
+            if found_version:
+                guc_vers_numbers.append(found_version.group())
+
+    guc_vers_numbers.sort(key=3Dlambda version: [int(i) for i in version.s=
plit('.')])
+
+    for ver in guc_vers_numbers:
+        version_ints =3D [int(i) for i in ver.split('.')]
+        guc_binaries_versions.append(GucVersion(version_ints[0], version_i=
nts[1], version_ints[2]))
+
+    return guc_binaries_versions
diff --git a/tools/vmtb/bench/machines/__init__.py b/tools/vmtb/bench/machi=
nes/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/bench/machines/host.py b/tools/vmtb/bench/machines/=
host.py
new file mode 100644
index 000000000..aa6ed87d1
--- /dev/null
+++ b/tools/vmtb/bench/machines/host.py
@@ -0,0 +1,820 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import errno
+import fcntl
+import functools
+import logging
+import os
+import posixpath
+import re
+import shlex
+import signal
+import subprocess
+import typing
+import enum
+
+from pathlib import Path
+
+from bench import exceptions
+from bench.machines.machine_interface import MachineInterface, ProcessResu=
lt, SuspendMode, DriverModule, DEFAULT_TIMEOUT
+from bench.machines import pci
+from bench.machines.vgpu_profile import VgpuProfile, VgpuProfileClass, Vgp=
uProfileCsvReader
+
+logger =3D logging.getLogger(__name__)
+
+HOST_DMESG_FILE =3D Path("/tmp/vm-test-bench-host_dmesg.log.tmp")
+VGPU_CSV_DIR =3D Path(Path.cwd(), "vmm_flows/resources/vgpu_profile")
+
+
+class HostDecorators():
+    ''' https://www.kernel.org/doc/Documentation/ABI/testing/dev-kmsg '''
+    @staticmethod
+    def read_messages(fd: int) -> typing.List[str]:
+        buf_size =3D 4096
+        kmsgs =3D []
+        while True:
+            try:
+                kmsg =3D os.read(fd, buf_size)
+                kmsgs.append(kmsg.decode())
+            except OSError as exc:
+                if exc.errno =3D=3D errno.EAGAIN:
+                    break
+
+                if exc.errno =3D=3D errno.EPIPE:
+                    pass
+                else:
+                    raise
+        return kmsgs
+
+    @staticmethod
+    def parse_messages(kmsgs: typing.List[str]) -> None:
+        for msg in kmsgs:
+            header, human =3D msg.split(';', 1)
+            # Unused for now: seq, time, other
+            fac, _, _, _ =3D header.split(',', 3)
+            level =3D int(fac) & 0x7
+            if level <=3D 4:
+                logger.error('Found message: %s with error level %s', huma=
n.strip(), level)
+                raise exceptions.HostError(f'Error in dmesg: {human.strip(=
)}')
+
+            logger.debug('Found message: %s with error level %s', human.st=
rip(), level)
+
+    @classmethod
+    def parse_kmsg(cls, func: typing.Callable) -> typing.Callable:
+        @functools.wraps(func)
+        def parse_wrapper(*args: typing.Any, **kwargs: typing.Optional[typ=
ing.Any]) -> typing.Any:
+            with open('/dev/kmsg', 'r', encoding=3D'utf-8') as f, \
+                 open(HOST_DMESG_FILE, 'a', encoding=3D'utf-8') as dmesg_f=
ile:
+
+                fd =3D f.fileno()
+                os.lseek(fd, os.SEEK_SET, os.SEEK_END)
+                flags =3D fcntl.fcntl(fd, fcntl.F_GETFL)
+                fcntl.fcntl(fd, fcntl.F_SETFL, flags | os.O_NONBLOCK)
+
+                # Execute actual function
+                result =3D func(*args, **kwargs)
+
+                kmsgs =3D cls.read_messages(fd)
+                dmesg_file.writelines(kmsgs)
+                cls.parse_messages(kmsgs)
+
+                return result
+        return parse_wrapper
+
+
+class Host(MachineInterface):
+    def __init__(self) -> None:
+        self.running_procs: typing.Dict[int, subprocess.Popen] =3D {}
+
+        self.host_bdf, self.host_pci_id =3D pci.get_pci_info()
+        self.gpu_name =3D pci.get_gpu_name(self.host_pci_id)
+        self.sysfs_prefix_path =3D posixpath.join('/sys/bus/pci/devices/',=
 self.host_bdf)
+        self.drm_driver, self.vfio_driver =3D self.select_driver_module()
+
+        if HOST_DMESG_FILE.exists():
+            HOST_DMESG_FILE.unlink()
+        HOST_DMESG_FILE.touch()
+
+        logger.debug('Found GPU Device: %s - PCI ID: %s - BDF: %s',
+                     self.gpu_name, self.host_pci_id, self.host_bdf)
+
+    def __str__(self) -> str:
+        return f'Host_{self.host_bdf}'
+
+    # MachineInterface implementation
+    @HostDecorators.parse_kmsg
+    def execute(self, command: str) -> int:
+        cmd_arr =3D shlex.split(command)
+        # We don't want to kill the process created here (like 'with' woul=
d do) so disable the following linter issue:
+        # R1732: consider-using-with (Consider using 'with' for resource-a=
llocating operations)
+        # pylint: disable=3DR1732
+        # TODO: but maybe 'subprocess.run' function would fit instead of P=
open constructor?
+        process =3D subprocess.Popen(cmd_arr,
+                                   stdout=3Dsubprocess.PIPE,
+                                   stderr=3Dsubprocess.PIPE,
+                                   universal_newlines=3DTrue)
+
+        self.running_procs[process.pid] =3D process
+        logger.debug('Running %s on host with pid %s', command, process.pi=
d)
+        return process.pid
+
+    @HostDecorators.parse_kmsg
+    def execute_status(self, pid: int) -> ProcessResult:
+        proc =3D self.running_procs.get(pid, None)
+        if not proc:
+            raise exceptions.HostError('No such process')
+
+        exit_code: typing.Optional[int] =3D proc.poll()
+        logger.debug('PID %s -> exit code %s', pid, exit_code)
+        if exit_code is None:
+            return ProcessResult(False, exit_code, '', '')
+
+        out, err =3D proc.communicate()
+        return ProcessResult(True, exit_code, out, err)
+
+    @HostDecorators.parse_kmsg
+    def execute_wait(self, pid: int, timeout: int =3D DEFAULT_TIMEOUT) -> =
ProcessResult:
+        proc =3D self.running_procs.get(pid, None)
+        if not proc:
+            raise exceptions.HostError(f'No process with pid {pid}')
+
+        out =3D ''
+        err =3D ''
+        try:
+            out, err =3D proc.communicate(timeout)
+        except subprocess.TimeoutExpired as exc:
+            logger.warning('Timeout (%ss) expired for pid %s', exc.timeout=
, pid)
+            raise
+
+        return ProcessResult(True, proc.poll(), out, err)
+
+    @HostDecorators.parse_kmsg
+    def execute_signal(self, pid: int, sig: signal.Signals) -> None:
+        proc =3D self.running_procs.get(pid, None)
+        if not proc:
+            raise exceptions.HostError(f'No process with pid {pid}')
+
+        proc.send_signal(sig)
+
+    def read_file_content(self, path: str) -> str:
+        with open(path, encoding=3D'utf-8') as f:
+            content =3D f.read()
+        return content
+
+    def write_file_content(self, path: str, content: str) -> int:
+        with open(path, 'w', encoding=3D'utf-8') as f:
+            return f.write(content)
+
+    def dir_exists(self, path: str) -> bool:
+        return os.path.exists(path)
+
+    def suspend(self, mode: SuspendMode =3D SuspendMode.ACPI_S3) -> None:
+        wakeup_delay =3D 10 # wakeup timer in seconds
+        logger.debug("Host suspend-resume via rtcwake (mode: %s, wakeup de=
lay: %ss)", mode, wakeup_delay)
+
+        suspend_pid =3D self.execute(f'rtcwake -s {wakeup_delay} -m {mode}=
')
+        suspend_result: ProcessResult =3D self.execute_wait(suspend_pid)
+        if suspend_result.exit_code !=3D 0:
+            raise exceptions.HostError(f'Suspend failed. Error: {suspend_r=
esult.stderr}')
+
+    def query_supported_drivers(self) -> typing.List[typing.Tuple[DriverMo=
dule, str]]:
+        # Check host for supported DRM drivers (i915 / xe) and VFIO
+        # Fallback to the regular vfio-pci, in case a vendor/driver specif=
ic variant is not available
+        available_drivers: typing.List[typing.Tuple[DriverModule, str]] =
=3D []
+
+        for drm_driver in DriverModule:
+            modinfo_pid =3D self.execute(f'modinfo -F filename {drm_driver=
}')
+            modinfo_result: ProcessResult =3D self.execute_wait(modinfo_pi=
d)
+            if modinfo_result.exit_code =3D=3D 0:
+                modinfo_pid =3D self.execute(f'modinfo -F filename {drm_dr=
iver}-vfio-pci')
+                modinfo_result =3D self.execute_wait(modinfo_pid)
+                vfio_driver =3D f'{drm_driver}-vfio-pci' if modinfo_result=
.exit_code =3D=3D 0 else 'vfio-pci'
+
+                available_drivers.append((drm_driver, vfio_driver))
+
+        logger.debug("Host - found DRM/VFIO driver module(s): %s", availab=
le_drivers)
+        return available_drivers
+
+    def select_driver_module(self) -> typing.Tuple[DriverModule, str]:
+        # Xe is preferred in case of both, i915 and xe drivers are support=
ed by the kernel
+        available_drivers =3D self.query_supported_drivers()
+        for drm, vfio in available_drivers:
+            if drm is DriverModule.XE:
+                return (DriverModule.XE, vfio)
+
+        return available_drivers[0]
+
+    def get_drm_driver(self) -> DriverModule:
+        return self.drm_driver
+
+    def get_vfio_driver(self) -> str:
+        return self.vfio_driver
+
+    def get_card_index(self) -> int:
+        drm_dir =3D posixpath.join(self.sysfs_prefix_path, "drm")
+
+        for filename in os.listdir(drm_dir):
+            if filename.startswith("card"):
+                index_match =3D re.search(r'card(?P<card_index>\d+)', file=
name)
+                if index_match:
+                    return int(index_match.group('card_index'))
+
+        raise exceptions.HostError('Could not determine card index')
+
+    def get_debugfs_path(self) -> str:
+        return posixpath.join('/sys/kernel/debug/dri/', str(self.get_card_=
index()))
+
+class SriovHost(Host):
+    def __init__(self) -> None:
+        super().__init__()
+        # Initialized by query_vgpu_profiles() from vGPU profiles CSV files
+        self.supported_vgpu_profiles: typing.List[VgpuProfile] =3D []
+        # vGPU profile currently applied
+        self.vgpu_profile_id: str =3D ''
+        # Device prefix for the vGPU ProfileID and CSV files name
+        self._vgpu_device_prefix: str =3D ''
+
+    @HostDecorators.parse_kmsg
+    def __write_sysfs(self, name: str, value: str) -> None:
+        path =3D posixpath.join(self.sysfs_prefix_path, name)
+        logger.debug('About to write %s to %s', value, path)
+        try:
+            with open(path, 'w', encoding=3D'utf-8') as file:
+                file.write(value)
+        except Exception as exc:
+            logger.error('Unable to write %s', path)
+            raise exceptions.HostError(f'Could not write to {path}. Error:=
 {exc}') from exc
+
+    @HostDecorators.parse_kmsg
+    def __read_sysfs(self, name: str) -> str:
+        path =3D posixpath.join(self.sysfs_prefix_path, name)
+        try:
+            with open(path, 'r', encoding=3D'utf-8') as file:
+                ret =3D file.read()
+        except Exception as exc:
+            logger.error('Unable to read %s', path)
+            raise exceptions.HostError(f'Could not read to {path}. Error: =
{exc}') from exc
+
+        logger.debug('Value in %s: %s', name, ret)
+        return ret
+
+    def get_iov_path(self) -> str:
+        # SRIOV provisioning base paths:
+        # i915: /sys/bus/pci/devices/[BDF]/drm/card[card_index]/prelim_iov/
+        # xe:   /sys/kernel/debug/dri/[card_index]/
+        if self.drm_driver is DriverModule.I915:
+            iov_path =3D posixpath.join(self.sysfs_prefix_path, f'drm/card=
{str(self.get_card_index())}', 'prelim_iov')
+        elif self.drm_driver is DriverModule.XE:
+            # posixpath.join(self.sysfs_prefix_path, 'sriov')
+            iov_path =3D self.get_debugfs_path()
+        else:
+            raise exceptions.HostError(f'Unsupported host DRM driver: {sel=
f.drm_driver}')
+        return iov_path
+
+    def set_autoprobe(self, val: int) -> None:
+        self.__write_sysfs('sriov_drivers_autoprobe', str(val))
+        ret =3D self.__read_sysfs('sriov_drivers_autoprobe')
+        if int(ret) !=3D val:
+            logger.error('Autoprobe value missmatch wanted: %s, got: %s', =
ret, val)
+            raise exceptions.HostError(f'Autoprobe value missmatch wanted:=
 {ret}, got: {val}')
+
+    def get_total_vfs(self) -> int:
+        return int(self.__read_sysfs('sriov_totalvfs'))
+
+    def get_current_vfs(self) -> int:
+        return int(self.__read_sysfs('sriov_numvfs'))
+
+    def get_num_gts(self) -> int:
+        gt_num =3D 0
+        if self.drm_driver is DriverModule.I915:
+            path =3D posixpath.join(f'{self.get_iov_path()}/pf/gt')
+        elif self.drm_driver is DriverModule.XE:
+            path =3D posixpath.join(f'{self.get_debugfs_path()}/gt')
+        if posixpath.lexists(path):
+            gt_num =3D 1
+        else:
+            while posixpath.lexists(posixpath.join(f'{path}{gt_num}')):
+                gt_num +=3D 1
+
+        return gt_num
+
+    def has_lmem(self) -> bool:
+        if self.drm_driver is DriverModule.I915:
+            path =3D posixpath.join(f'{self.sysfs_prefix_path}/drm/card{se=
lf.get_card_index()}/lmem_total_bytes')
+        elif self.drm_driver is DriverModule.XE:
+            path =3D self.helper_create_sysfs_path(0, 0, "", "lmem_quota")
+        else:
+            raise exceptions.HostError(f'Unsupported host DRM driver: {sel=
f.drm_driver}')
+
+        return posixpath.lexists(path)
+
+    def create_vf(self, num: int) -> int:
+        self.numvf =3D num
+        self.clear_vf()
+
+        self.__write_sysfs('sriov_numvfs', str(num))
+        ret =3D self.__read_sysfs('sriov_numvfs')
+        return int(ret)
+
+    def clear_vf(self) -> int:
+        self.__write_sysfs('sriov_numvfs', '0')
+        ret =3D self.__read_sysfs('sriov_numvfs')
+        if int(ret) !=3D 0:
+            raise exceptions.HostError('VFs not cleared after 0 write')
+        return int(ret)
+
+    # reset_provisioning - resets provisioning config for the requested nu=
mber of VFs.
+    # Function calls the sysfs control interface to clear VF provisioning =
settings
+    # and restores the auto provisioning mode.
+    # @num_vfs: number of VFs to clear the provisioning
+    def reset_provisioning(self, num_vfs: int) -> None:
+        for gt_num in range(self.get_num_gts()):
+            if self.drm_driver is DriverModule.I915:
+                if self.get_pf_sched_priority(gt_num) !=3D self.Scheduling=
Priority.LOW:
+                    self.set_pf_sched_priority(gt_num, self.SchedulingPrio=
rity.LOW)
+            self.set_pf_policy_sched_if_idle(gt_num, 0)
+            self.set_pf_policy_engine_reset(gt_num, 0)
+            self.set_exec_quantum_ms(0, gt_num, 0)
+            self.set_preempt_timeout_us(0, gt_num, 0)
+            if self.drm_driver is DriverModule.I915:
+                self.set_doorbells_quota(0, gt_num, 0)
+                # PF contexts cannot be set from sysfs
+
+        if not self.get_pf_auto_provisioning():
+            for vf_num in range(1, num_vfs + 1):
+                self.set_vf_control(vf_num, self.VfControl.clear)
+
+            self.set_pf_auto_provisioning(True)
+
+    # set_drop_caches - calls the debugfs interface the drm/i915 GEM drive=
r:
+    # /sys/kernel/debug/dri/[card_index]/i915_gem_drop_caches
+    # to drop or evict all classes of gem buffer objects (bitmask 7Fh).
+    def drop_all_caches(self) -> None:
+        if self.drm_driver is DriverModule.I915:
+            path =3D posixpath.join(f'{self.get_debugfs_path()}/i915_gem_d=
rop_caches')
+            drop_all_bitmask: int =3D 0x7F # Set all drop flags
+            self.write_file_content(path, str(drop_all_bitmask))
+
+    def bind(self, bdf: str) -> None:
+        self.__write_sysfs(posixpath.join('driver', 'bind'), bdf)
+
+    def unbind(self, bdf: str) -> None:
+        self.__write_sysfs(posixpath.join('driver', 'unbind'), bdf)
+
+    @HostDecorators.parse_kmsg
+    def get_vf_bdf(self, vf_num: int) -> str:
+        vf_path =3D os.readlink(posixpath.join('/sys/bus/pci/devices/', se=
lf.host_bdf, f'virtfn{vf_num - 1}'))
+        pass_bdf =3D os.path.basename(vf_path)
+        override_path =3D posixpath.join('/sys/bus/pci/devices/', pass_bdf=
, 'driver_override')
+        with open(override_path, 'w', encoding=3D'utf-8') as file:
+            file.write(self.vfio_driver)
+
+        with open('/sys/bus/pci/drivers_probe', 'w', encoding=3D'utf-8') a=
s file:
+            file.write(pass_bdf)
+
+        logger.debug('VF%s BDF to pass: %s', vf_num, pass_bdf)
+        return pass_bdf
+
+    def get_vfs_bdf(self, *args: int) -> typing.List[str]:
+        vf_list =3D list(set(args))
+        bdf_list =3D [self.get_vf_bdf(vf) for vf in vf_list]
+        return bdf_list
+
+    # helper_create_vgpu_cvs_path - create path to a vGPU profiles definit=
ons files
+    # @csv_dir: directory containing definitions CSV files
+    # Returns: tuple with _vfs.csv and _int.csv paths for a detected platf=
orm
+    def helper_create_vgpu_cvs_path(self, csv_dir: str) -> typing.Tuple[st=
r, str]:
+        if self.gpu_name =3D=3D pci.GpuDevice.ATSM150:
+            self._vgpu_device_prefix =3D 'ATSM150_'
+        elif self.gpu_name =3D=3D pci.GpuDevice.ATSM75:
+            self._vgpu_device_prefix =3D 'ATSM75_'
+        elif self.gpu_name =3D=3D pci.GpuDevice.PVC:
+            self._vgpu_device_prefix =3D 'PVC2_'
+        elif self.gpu_name =3D=3D pci.GpuDevice.ADLP:
+            self._vgpu_device_prefix =3D 'ADL_'
+        else:
+            raise exceptions.HostError(f'Unknown GPU device: {self.gpu_nam=
e}')
+
+        csv_vfs_file_path =3D posixpath.join(csv_dir, self._vgpu_device_pr=
efix + 'vfs.csv')
+        csv_int_file_path =3D posixpath.join(csv_dir, self._vgpu_device_pr=
efix + 'int.csv')
+
+        if not posixpath.lexists(csv_vfs_file_path) or not posixpath.lexis=
ts(csv_int_file_path):
+            raise exceptions.HostError(f'vGPU profiles CSV files not found=
 in {csv_dir}')
+
+        return (csv_vfs_file_path, csv_int_file_path)
+
+    # query_vgpu_profiles - gets all vGPU profiles supported on a device
+    # Returns: list of vGPU profiles definitions
+    def query_vgpu_profiles(self) -> typing.List[VgpuProfile]:
+        csv_reader =3D VgpuProfileCsvReader(*self.helper_create_vgpu_cvs_p=
ath(str(VGPU_CSV_DIR)))
+        self.supported_vgpu_profiles =3D csv_reader.vgpu_profiles
+        return self.supported_vgpu_profiles
+
+    # get_vgpu_profile_by_id - gets vGPU profile with a given Profile ID
+    # @profile_id: string defined as 'vGPUProfileInfo ProfileID' in CSVs
+    # Returns: list of vGPU profiles definitions
+    def get_vgpu_profile_by_vgpu_profile_id(self, vgpu_profile_id: str) ->=
 VgpuProfile:
+        if not self.supported_vgpu_profiles:
+            self.query_vgpu_profiles()
+
+        for profile in self.supported_vgpu_profiles:
+            if profile.profileId =3D=3D vgpu_profile_id:
+                return profile
+
+        raise exceptions.HostError(f'vGPU profile {vgpu_profile_id} not fo=
und!')
+
+    # get_vgpu_profile_by_id - gets vGPU profile with a given Profile ID
+    # @profile_id: string defined as 'vGPUProfileInfo ProfileID' in CSVs
+    #              without platform prefix
+    # Returns: list of vGPU profiles definitions
+    def get_vgpu_profile_by_id(self, profile_id: str) -> VgpuProfile:
+        if not self.supported_vgpu_profiles:
+            self.query_vgpu_profiles()
+
+        return self.get_vgpu_profile_by_vgpu_profile_id(self._vgpu_device_=
prefix + profile_id)
+
+    def get_vgpu_profile_by_class(self, requested_class: VgpuProfileClass,=
 requested_num_vfs: int) -> VgpuProfile:
+        """Find vGPU profile matching requested platform independent class=
 and number of VFs.
+=20=20=20=20=20=20=20=20
+        For VgpuProfileClass.AUTO - empty profile config is returned that =
lets DRM driver auto provisioning.
+        In case exact match cannot be found, try to fit similar profile wi=
th up to 2 more VFs, for example:
+        - if requested VDI profile with 3 VFs is not available, return clo=
se config XYZ_V4 with 4 VFs.
+        - if requested profile with neither 9 VFs, nor with 10 or 11 VFs i=
s available - throw 'not found' exeception.
+        """
+        logger.debug("Get vGPU profile - %s with %sxVF", requested_class, =
requested_num_vfs)
+
+        if requested_class is VgpuProfileClass.AUTO:
+            auto_profile: VgpuProfile =3D VgpuProfile()
+            auto_profile.profileId =3D f'ANY_A{requested_num_vfs}'
+            return auto_profile
+
+        if not self.supported_vgpu_profiles:
+            self.query_vgpu_profiles()
+
+        for profile in self.supported_vgpu_profiles:
+            current_class, current_num_vfs =3D profile.get_class_num_vfs()
+
+            if current_class is requested_class:
+                if current_num_vfs =3D=3D requested_num_vfs:
+                    return profile # Exact match
+
+                if requested_num_vfs < current_num_vfs <=3D requested_num_=
vfs+2:
+                    logger.debug('Unable to find accurate vGPU profile but=
 have similar: %s', profile.profileId)
+                    return profile # Approximate match
+
+        raise exceptions.VgpuProfileError(f'vGPU profile {requested_class}=
{requested_num_vfs} not found!')
+
+    # set_vgpu_profile - sets vGPU profile
+    # @profile: definition of vGPU profile to set
+    def set_vgpu_profile(self, profile: VgpuProfile) -> None:
+        logger.info('Set vGPU profile: %s', profile.profileId)
+        self.vgpu_profile_id =3D profile.profileId
+        num_vfs =3D profile.get_num_vfs()
+        num_gts =3D self.get_num_gts() # Number of tiles (GTs)
+        gt_nums =3D [0] if num_gts =3D=3D 1 else [0, 1] # Tile (GT) number=
s/indexes
+
+        for gt_num in gt_nums:
+            self.set_pf_policy_sched_if_idle(gt_num, int(profile.scheduleI=
fIdle))
+            self.set_pf_policy_engine_reset(gt_num, int(profile.resetAfter=
VfSwitch))
+
+            # XXX: PF contexts are currently assigned by the driver and ca=
nnot be reprovisioned from sysfs
+            # self.set_contexts_quota(0, gt_num, profile.pfContexts)
+            self.set_doorbells_quota(0, gt_num, profile.pfDoorbells)
+            self.set_exec_quantum_ms(0, gt_num, profile.pfExecutionQuanta)
+            self.set_preempt_timeout_us(0, gt_num, profile.pfPreemptionTim=
eout)
+
+        for vf_num in range(1, num_vfs + 1):
+            if num_gts > 1 and num_vfs > 1:
+                # Multi-tile device Mode 2|3 - odd VFs on GT0, even on GT1
+                gt_nums =3D [0] if vf_num % 2 else [1]
+
+            for gt_num in gt_nums:
+                self.set_lmem_quota(vf_num, gt_num, profile.vfLmem)
+                self.set_contexts_quota(vf_num, gt_num, profile.vfContexts)
+                self.set_doorbells_quota(vf_num, gt_num, profile.vfDoorbel=
ls)
+                self.set_ggtt_quota(vf_num, gt_num, profile.vfGgtt)
+                self.set_exec_quantum_ms(vf_num, gt_num, profile.vfExecuti=
onQuanta)
+                self.set_preempt_timeout_us(vf_num, gt_num, profile.vfPree=
mptionTimeout)
+
+    # helper_create_sysfs_path - create sysfs path to given parameter
+    # @vf_num: VF number (1-based) or 0 for PF
+    # @gt_num: GT instance number
+    # @subdir: subdirectory for attribute or empty string if not exists
+    # @attr: iov parameter name
+    # Returns: iov sysfs path to @attr
+    def helper_create_sysfs_path(self, vf_num: int, gt_num: int, subdir: s=
tr, attr: str) -> str:
+        if self.drm_driver is DriverModule.XE:
+            vf_gt_part =3D f'gt{gt_num}/pf' if vf_num =3D=3D 0 else f'gt{g=
t_num}/vf{vf_num}'
+        else:
+            gt_part =3D f'gt{gt_num}' if posixpath.lexists(
+                posixpath.join(self.get_iov_path(), f'pf/gt{gt_num}')) els=
e 'gt'
+            vf_gt_part =3D f'pf/{gt_part}' if vf_num =3D=3D 0 else f'vf{vf=
_num}/{gt_part}'
+
+        return posixpath.join(self.get_iov_path(), vf_gt_part, subdir, att=
r)
+
+    # helper_get_debugfs_available - reads [attribute]_available from debu=
gfs:
+    # /sys/kernel/debug/dri/[card_index]/@gt_num/iov/@attr_available
+    # @gt_num: GT instance number
+    # @attr: iov parameter name
+    # Returns: total and available size for @attr
+    def helper_get_debugfs_resources(self, gt_num: int, attr: str) -> typi=
ng.Tuple[int, int]:
+        path =3D posixpath.join(f'{self.get_debugfs_path()}/gt{gt_num}/iov=
/{attr}_available')
+        total =3D available =3D 0
+
+        out =3D self.read_file_content(path)
+        for line in out.splitlines():
+            param, value =3D line.split(':')
+            value =3D value.lstrip().split('\t')[0]
+
+            if param =3D=3D 'total':
+                total =3D int(value)
+            elif param =3D=3D 'avail':
+                available =3D int(value)
+
+        return (total, available)
+
+    # SRIOV sysfs: PF auto_provisioning
+    # Sysfs location:
+    # i915: [SRIOV sysfs base path]/pf/auto_provisioning
+    # xe:   [SRIOV sysfs base path]/auto_provisioning
+    # Allows to control VFs auto-provisioning feature.
+    # To re-enable, manual provisioning must be cleared first.
+    def get_pf_auto_provisioning(self) -> bool:
+        # attribute not exposed by Xe (yet?), currently always on
+        if self.drm_driver is DriverModule.XE:
+            return True
+
+        path =3D self.get_iov_path()
+        if self.drm_driver is DriverModule.I915:
+            path =3D posixpath.join(path, 'pf')
+
+        path =3D posixpath.join(path, 'auto_provisioning')
+        ret =3D self.__read_sysfs(path)
+        return bool(int(ret))
+
+    def set_pf_auto_provisioning(self, val: bool) -> None:
+        # not exposed by Xe (yet?)
+        if self.drm_driver is DriverModule.XE:
+            return
+
+        path =3D self.get_iov_path()
+        if self.drm_driver is DriverModule.I915:
+            path =3D posixpath.join(path, 'pf')
+
+        path =3D posixpath.join(path, 'auto_provisioning')
+        self.__write_sysfs(path, str(int(val)))
+
+    # SRIOV sysfs: PF available resources
+    # Sysfs location: prelim_iov/pf/gtM/available
+    # DEPRECATED functions - *_max_quota and *_free will be removed from i=
915 sysfs
+    # use debugfs counterparts if needed (get_debugfs_ggtt|lmem|contexts|d=
oorbells)
+    def get_pf_ggtt_max_quota(self, gt_num: int) -> int:
+        if self.drm_driver is DriverModule.XE:
+            raise exceptions.NotAvailableError('PF ggtt_max_quota not avai=
lable on xe')
+
+        path =3D self.helper_create_sysfs_path(0, gt_num, "available", "gg=
tt_max_quota")
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    def get_pf_lmem_max_quota(self, gt_num: int) -> int:
+        if self.drm_driver is DriverModule.XE:
+            raise exceptions.NotAvailableError('PF lmem_max_quota not avai=
lable on xe')
+
+        path =3D self.helper_create_sysfs_path(0, gt_num, "available", "lm=
em_max_quota")
+        ret =3D self.__read_sysfs(path) if self.has_lmem() else 0
+        return int(ret)
+
+    def get_pf_contexts_max_quota(self, gt_num: int) -> int:
+        if self.drm_driver is DriverModule.XE:
+            raise exceptions.NotAvailableError('PF contexts_max_quota not =
available on xe')
+
+        path =3D self.helper_create_sysfs_path(0, gt_num, "available", "co=
ntexts_max_quota")
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    def get_pf_doorbells_max_quota(self, gt_num: int) -> int:
+        if self.drm_driver is DriverModule.XE:
+            raise exceptions.NotAvailableError('PF doorbells_max_quota not=
 available on xe')
+
+        path =3D self.helper_create_sysfs_path(0, gt_num, "available", "do=
orbells_max_quota")
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    # SRIOV sysfs: PF spare resources
+    # Sysfs location:
+    # i915: [SRIOV sysfs base path]/pf/gtM/xxx_spare
+    # xe:   [SRIOV debugfs base path]/pf/gtM/xxx_quota
+    def set_pf_ggtt_spare(self, gt_num: int, val: int) -> None:
+        attr =3D "ggtt_quota" if self.drm_driver is DriverModule.XE else "=
ggtt_spare"
+        path =3D self.helper_create_sysfs_path(0, gt_num, "", attr)
+        self.__write_sysfs(path, str(val))
+
+    def set_pf_lmem_spare(self, gt_num: int, val: int) -> None:
+        attr =3D "lmem_quota" if self.drm_driver is DriverModule.XE else "=
lmem_spare"
+        path =3D self.helper_create_sysfs_path(0, gt_num, "", attr)
+        self.__write_sysfs(path, str(val))
+
+    def set_pf_contexts_spare(self, gt_num: int, val: int) -> None:
+        attr =3D "contexts_quota" if self.drm_driver is DriverModule.XE el=
se "contexts_spare"
+        path =3D self.helper_create_sysfs_path(0, gt_num, "", attr)
+        self.__write_sysfs(path, str(val))
+
+    def set_pf_doorbells_spare(self, gt_num: int, val: int) -> None:
+        attr =3D "doorbells_quota" if self.drm_driver is DriverModule.XE e=
lse "doorbells_spare"
+        path =3D self.helper_create_sysfs_path(0, gt_num, "", attr)
+        self.__write_sysfs(path, str(val))
+
+    def get_pf_ggtt_spare(self, gt_num: int) -> int:
+        attr =3D "ggtt_quota" if self.drm_driver is DriverModule.XE else "=
ggtt_spare"
+        path =3D self.helper_create_sysfs_path(0, gt_num, "", attr)
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    def get_pf_lmem_spare(self, gt_num: int) -> int:
+        attr =3D "lmem_quota" if self.drm_driver is DriverModule.XE else "=
lmem_spare"
+        path =3D self.helper_create_sysfs_path(0, gt_num, "", attr)
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    def get_pf_contexts_spare(self, gt_num: int) -> int:
+        attr =3D "contexts_quota" if self.drm_driver is DriverModule.XE el=
se "contexts_spare"
+        path =3D self.helper_create_sysfs_path(0, gt_num, "", attr)
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    def get_pf_doorbells_spare(self, gt_num: int) -> int:
+        attr =3D "doorbells_quota" if self.drm_driver is DriverModule.XE e=
lse "doorbells_spare"
+        path =3D self.helper_create_sysfs_path(0, gt_num, "", attr)
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    # SRIOV sysfs: PF policies
+    # Sysfs location: [SRIOV sysfs base path]/pf/gtM/policies
+    def set_pf_policy_engine_reset(self, gt_num: int, val: int) -> None:
+        # not exposed by Xe (yet?)
+        if self.drm_driver is DriverModule.XE:
+            return
+
+        path =3D self.helper_create_sysfs_path(0, gt_num, "policies", "eng=
ine_reset")
+        self.__write_sysfs(path, str(val))
+
+    # In order to set strict scheduling policy, PF scheduling priority nee=
ds to be default
+    def set_pf_policy_sched_if_idle(self, gt_num: int, val: int) -> None:
+        # not exposed by Xe (yet?)
+        if self.drm_driver is DriverModule.XE:
+            return
+
+        path =3D self.helper_create_sysfs_path(0, gt_num, "policies", "sch=
ed_if_idle")
+        self.__write_sysfs(path, str(val))
+
+    def get_pf_policy_engine_reset(self, gt_num: int) -> int:
+        # not exposed by Xe (yet?)
+        if self.drm_driver is DriverModule.XE:
+            return 0
+
+        path =3D self.helper_create_sysfs_path(0, gt_num, "policies", "eng=
ine_reset")
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    def get_pf_policy_sched_if_idle(self, gt_num: int) -> int:
+        # not exposed by Xe (yet?)
+        if self.drm_driver is DriverModule.XE:
+            return 0
+
+        path =3D self.helper_create_sysfs_path(0, gt_num, "policies", "sch=
ed_if_idle")
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    # SRIOV sysfs: VF id
+    def get_vf_id(self, vf_num: int) -> int:
+        if self.drm_driver is DriverModule.XE:
+            raise exceptions.NotAvailableError('VF id attribute not availa=
ble on xe')
+
+        path =3D posixpath.join(f'{self.get_iov_path()}/vf{vf_num}/id')
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    # SRIOV sysfs: controls state of the running VF (WO)
+    # Sysfs location: prelim_iov/vfN/control
+    # Allows PF admin to pause, resume or stop handling
+    # submission requests from given VF and clear provisioning.
+    # control: "pause|resume|stop|clear"
+    class VfControl(str, enum.Enum):
+        pause =3D 'pause'
+        resume =3D 'resume'
+        stop =3D 'stop'
+        clear =3D 'clear'
+
+    def set_vf_control(self, vf_num: int, val: VfControl) -> None:
+        path =3D posixpath.join(f'{self.get_iov_path()}/vf{vf_num}/control=
')
+        self.__write_sysfs(path, val)
+
+    # SRIOV sysfs: setters and getters for PF specific provisioning parame=
ters
+    # Sysfs location: [SRIOV sysfs base path]/pf/gtM/
+    # @gt_num: GT instance number
+    class SchedulingPriority(enum.Enum):
+        LOW =3D 0
+        NORMAL =3D 1
+        HIGH =3D 2
+
+    # In order to set scheduling priority, strict scheduling policy needs =
to be default
+    def set_pf_sched_priority(self, gt_num: int, val: SchedulingPriority) =
-> None:
+        path =3D self.helper_create_sysfs_path(0, gt_num, "", "sched_prior=
ity")
+        self.__write_sysfs(path, str(val.value))
+
+    def get_pf_sched_priority(self, gt_num: int) -> SchedulingPriority:
+        path =3D self.helper_create_sysfs_path(0, gt_num, "", "sched_prior=
ity")
+        ret =3D self.__read_sysfs(path)
+        return self.SchedulingPriority(int(ret))
+
+    # SRIOV sysfs: setters and getters for VFs and PF provisioning paramte=
rers
+    # Sysfs location: [SRIOV sysfs base path]/[pf|vfN]/gtM/
+    # @vf_num: VF number (1-based) or 0 for PF
+    # @gt_num: GT instance number
+    def set_ggtt_quota(self, vf_num: int, gt_num: int, val: int) -> None:
+        if vf_num =3D=3D 0 and self.drm_driver is DriverModule.I915:
+            raise exceptions.NotAvailableError('PF ggtt_quota not availabl=
e')
+
+        path =3D self.helper_create_sysfs_path(vf_num, gt_num, "", "ggtt_q=
uota")
+        self.__write_sysfs(path, str(val))
+
+    def set_lmem_quota(self, vf_num: int, gt_num: int, val: int) -> None:
+        if vf_num =3D=3D 0 and self.drm_driver is DriverModule.I915:
+            raise exceptions.NotAvailableError('PF lmem_quota not availabl=
e')
+
+        path =3D self.helper_create_sysfs_path(vf_num, gt_num, "", "lmem_q=
uota")
+        if self.has_lmem():
+            self.__write_sysfs(path, str(val))
+
+    def set_contexts_quota(self, vf_num: int, gt_num: int, val: int) -> No=
ne:
+        path =3D self.helper_create_sysfs_path(vf_num, gt_num, "", "contex=
ts_quota")
+        self.__write_sysfs(path, str(val))
+
+    def set_doorbells_quota(self, vf_num: int, gt_num: int, val: int) -> N=
one:
+        path =3D self.helper_create_sysfs_path(vf_num, gt_num, "", "doorbe=
lls_quota")
+        self.__write_sysfs(path, str(val))
+
+    def set_exec_quantum_ms(self, vf_num: int, gt_num: int, val: int) -> N=
one:
+        path =3D self.helper_create_sysfs_path(vf_num, gt_num, "", "exec_q=
uantum_ms")
+        self.__write_sysfs(path, str(val))
+
+    def set_preempt_timeout_us(self, vf_num: int, gt_num: int, val: int) -=
> None:
+        path =3D self.helper_create_sysfs_path(vf_num, gt_num, "", "preemp=
t_timeout_us")
+        self.__write_sysfs(path, str(val))
+
+    def get_ggtt_quota(self, vf_num: int, gt_num: int) -> int:
+        if vf_num =3D=3D 0 and self.drm_driver is DriverModule.I915:
+            raise exceptions.NotAvailableError('PF ggtt_quota not availabl=
e')
+
+        path =3D self.helper_create_sysfs_path(vf_num, gt_num, "", "ggtt_q=
uota")
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    def get_lmem_quota(self, vf_num: int, gt_num: int) -> int:
+        if vf_num =3D=3D 0 and self.drm_driver is DriverModule.I915:
+            raise exceptions.NotAvailableError('PF lmem_quota not availabl=
e')
+
+        path =3D self.helper_create_sysfs_path(vf_num, gt_num, "", "lmem_q=
uota")
+        ret =3D self.__read_sysfs(path) if self.has_lmem() else 0
+        return int(ret)
+
+    def get_contexts_quota(self, vf_num: int, gt_num: int) -> int:
+        path =3D self.helper_create_sysfs_path(vf_num, gt_num, "", "contex=
ts_quota")
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    def get_doorbells_quota(self, vf_num: int, gt_num: int) -> int:
+        path =3D self.helper_create_sysfs_path(vf_num, gt_num, "", "doorbe=
lls_quota")
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    def get_exec_quantum_ms(self, vf_num: int, gt_num: int) -> int:
+        path =3D self.helper_create_sysfs_path(vf_num, gt_num, "", "exec_q=
uantum_ms")
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    def get_preempt_timeout_us(self, vf_num: int, gt_num: int) -> int:
+        path =3D self.helper_create_sysfs_path(vf_num, gt_num, "", "preemp=
t_timeout_us")
+        ret =3D self.__read_sysfs(path)
+        return int(ret)
+
+    # SRIOV debugfs: read resource availability
+    # Debugfs location: /sys/kernel/debug/dri/0/gtM/iov/
+    # @gt_num: GT instance number
+    # Returns: total and available size for a resource
+    def get_debugfs_ggtt(self, gt_num: int) -> typing.Tuple[int, int]:
+        return self.helper_get_debugfs_resources(gt_num, "ggtt")
+
+    # Placeholders for debugfs nodes that are not yet published.
+    # Implement in a similar way to 'ggtt' when present.
+    def get_debugfs_lmem(self, gt_num: int) -> typing.Tuple[int, int]:
+        raise NotImplementedError(f'Debugfs lmem_available not present yet=
 (gt{gt_num})')
+
+    def get_debugfs_contexts(self, gt_num: int) -> typing.Tuple[int, int]:
+        raise NotImplementedError(f'Debugfs contexts_available not present=
 yet (gt{gt_num})')
+
+    def get_debugfs_doorbells(self, gt_num: int) -> typing.Tuple[int, int]:
+        raise NotImplementedError(f'Debugfs doorbells_available not presen=
t yet (gt{gt_num})')
diff --git a/tools/vmtb/bench/machines/machine_interface.py b/tools/vmtb/be=
nch/machines/machine_interface.py
new file mode 100644
index 000000000..04d00f882
--- /dev/null
+++ b/tools/vmtb/bench/machines/machine_interface.py
@@ -0,0 +1,70 @@
+
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import abc
+import enum
+import signal
+import typing
+
+# TODO: Consider moving CONSTANT definitions to a separate file constants.=
py
+# XXX: Timeout increased from 10 to 20 min to handle long VM migration tim=
e on devices with LMEM
+DEFAULT_TIMEOUT: int =3D 1200 # Default machine execution wait timeout in =
seconds
+
+
+class ProcessResult(typing.NamedTuple):
+    exited: bool =3D False
+    exit_code: typing.Optional[int] =3D None
+    stdout: str =3D ''
+    stderr: str =3D ''
+
+
+class SuspendMode(str, enum.Enum):
+    ACPI_S3 =3D 'mem'    # Suspend to RAM aka sleep
+    ACPI_S4 =3D 'disk'   # Suspend to disk aka hibernation
+
+
+class DriverModule(str, enum.Enum):
+    I915 =3D 'i915'
+    XE =3D 'xe'
+
+
+class MachineInterface(metaclass=3Dabc.ABCMeta):
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
+    def suspend(self, mode: SuspendMode) -> None:
+        raise NotImplementedError
+
+    @abc.abstractmethod
+    def get_drm_driver(self) -> DriverModule:
+        raise NotImplementedError
diff --git a/tools/vmtb/bench/machines/pci.py b/tools/vmtb/bench/machines/p=
ci.py
new file mode 100644
index 000000000..789951cbe
--- /dev/null
+++ b/tools/vmtb/bench/machines/pci.py
@@ -0,0 +1,99 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import logging
+import subprocess
+import typing
+import enum
+import re
+
+from bench import exceptions
+
+logger =3D logging.getLogger(__name__)
+
+
+class GpuDevice(str, enum.Enum):
+    ATSM150 =3D 'Arctic Sound M150 (ATS-M1)'
+    ATSM75 =3D 'Arctic Sound M75 (ATS-M3)'
+    PVC =3D 'Ponte Vecchio (PVC)'
+    ADLP =3D 'Alder Lake P (ADL-P)'
+    Unknown =3D 'Unknown'
+
+    def __str__(self) -> str:
+        return str.__str__(self)
+
+
+def get_pci_info() -> typing.Tuple[str, str]:
+    """Return PCI BDF and Device ID of Intel (8086) Display Controller (03=
xx)"""
+    out =3D subprocess.check_output(['lspci', '-nm'], universal_newlines=
=3DTrue)
+    pattern =3D r'(?P<bdf>.*\.0) .*03[08]0.*8086.* "(?P<devid>[0-9a-fA-F]{=
4})"( -r.*)?( "[0-9a-fA-F]{0,4}"){2}.*'
+    match =3D re.search(pattern, out, re.MULTILINE)
+
+    if match:
+        return (f'0000:{match.group("bdf")}', match.group("devid"))
+
+    logger.error('Intel GPU Device was not found')
+    logger.debug('PCI Devices present (lspci -nm):\n%s', out)
+    raise exceptions.HostError('Intel GPU Device was not found')
+
+
+def get_gpu_name(pci_id: str) -> GpuDevice:
+    """Return GPU device name associated with a given PCI Device ID"""
+    return pci_ids.get(pci_id.upper(), GpuDevice.Unknown)
+
+
+# PCI Device IDs: ATS-M150 (M1)
+_atsm150_pci_ids =3D {
+    '56C0': GpuDevice.ATSM150,
+    '56C2': GpuDevice.ATSM150
+}
+
+
+# PCI Device IDs: ATS-M75 (M3)
+_atsm75_pci_ids =3D {
+    '56C1': GpuDevice.ATSM75
+}
+
+
+# PCI Device IDs: PVC
+_pvc_pci_ids =3D {
+    '0BD0': GpuDevice.PVC,
+    '0BD1': GpuDevice.PVC,
+    '0BD2': GpuDevice.PVC,
+    '0BD5': GpuDevice.PVC,
+    '0BD6': GpuDevice.PVC,
+    '0BD7': GpuDevice.PVC,
+    '0BD8': GpuDevice.PVC,
+    '0BD9': GpuDevice.PVC,
+    '0BDA': GpuDevice.PVC,
+    '0BDB': GpuDevice.PVC
+}
+
+
+# PCI Device IDs: ADL-P
+_adlp_pci_ids =3D {
+    '46A0': GpuDevice.ADLP,
+    '46A1': GpuDevice.ADLP,
+    '46A2': GpuDevice.ADLP,
+    '46A3': GpuDevice.ADLP,
+    '46A6': GpuDevice.ADLP,
+    '46A8': GpuDevice.ADLP,
+    '46AA': GpuDevice.ADLP,
+    '462A': GpuDevice.ADLP,
+    '4626': GpuDevice.ADLP,
+    '4628': GpuDevice.ADLP,
+    '46B0': GpuDevice.ADLP,
+    '46B1': GpuDevice.ADLP,
+    '46B2': GpuDevice.ADLP,
+    '46B3': GpuDevice.ADLP,
+    '46C0': GpuDevice.ADLP,
+    '46C1': GpuDevice.ADLP,
+    '46C2': GpuDevice.ADLP,
+    '46C3': GpuDevice.ADLP
+}
+
+
+# All PCI Device IDs to GPU Device Names mapping
+pci_ids: typing.Dict[str, GpuDevice] =3D {**_atsm150_pci_ids, **_atsm75_pc=
i_ids, **_pvc_pci_ids, **_adlp_pci_ids}
diff --git a/tools/vmtb/bench/machines/vgpu_profile.py b/tools/vmtb/bench/m=
achines/vgpu_profile.py
new file mode 100644
index 000000000..b7f0cf395
--- /dev/null
+++ b/tools/vmtb/bench/machines/vgpu_profile.py
@@ -0,0 +1,197 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import csv
+import logging
+import posixpath
+import re
+
+from enum import Enum
+from typing import Optional, List, Dict, Tuple
+from bench import exceptions
+
+logger =3D logging.getLogger(__name__)
+
+
+class VgpuProfileClass(str, Enum):
+    """Represent usage classes of vGPU profiles.
+
+    The following types are supported:
+    - Class A: Auto provisioning (DRM allocates resources fairly)
+    - Class M: Multipurpose VF profiles that support a mix of compute and =
media
+               but not specifically fps-targeted 3D experiences
+    - Class C: Comput and media focused VFs w.o. any 3D support
+    - Class V: VDI (Virtual Desktop Infrastructure) or remote graphics del=
ivery VFs
+    - Class L: IDV (Intelligent Desktop Virtualization) or locally display=
ed VFs
+    - Class R: Remote Desktop Session Host
+    """
+    AUTO =3D 'A'
+    MULTIPURPOSE =3D 'M'
+    COMPUTE =3D 'C'
+    VDI =3D 'V'
+    IDV =3D 'L'
+    RDSH =3D 'R'
+
+
+class VgpuProfile:
+    def __init__(self) -> None:
+        # [Platform]_vfs.csv file:
+        self.profileId: str =3D ''
+        self.description: str =3D ''
+        self.schedulerMode: str =3D ''
+        self.pfExecutionQuanta: int =3D 0
+        self.pfPreemptionTimeout: int =3D 0
+        self.vfExecutionQuanta: int =3D 0
+        self.vfPreemptionTimeout: int =3D 0
+        self.scheduleIfIdle: bool =3D False
+
+        # [Platform]_int.csv file:
+        self.resetAfterVfSwitch: bool =3D False
+        self.provisioningMode: int =3D 0
+        self.pfLmem: int =3D 0
+        self.pfContexts: int =3D 0
+        self.pfDoorbells: int =3D 0
+        self.pfGgtt: int =3D 0
+        self.vfLmem: int =3D 0
+        self.vfContexts: int =3D 0
+        self.vfDoorbells: int =3D 0
+        self.vfGgtt: int =3D 0
+
+    def get_class_num_vfs(self) -> Tuple[VgpuProfileClass, int]:
+        """Return pair of vGPU profile class and number of VFs from profil=
eID string
+        e.g. ATSM150_V16 -> (VgpuProfileClass.VDI, 16).
+        """
+        pattern =3D r'(?P<profile_class>[M,C,V,L,R,A]{1})(?P<num_vfs>\d{1,=
2}$)'
+        match =3D re.search(pattern, self.profileId)
+
+        if match:
+            return (VgpuProfileClass(match.group('profile_class')), int(ma=
tch.group('num_vfs')))
+
+        raise exceptions.VgpuProfileError(f'Invalid syntax of a vGPU profi=
leId: {self.profileId}')
+
+    def get_class(self) -> VgpuProfileClass:
+        """Return vGPU profile class (Multipurpose/Compute/VDI etc.) from =
profileID string
+        e.g. ATSM150_M4 -> Multipurpose.
+        """
+        return self.get_class_num_vfs()[0]
+
+    def get_num_vfs(self) -> int:
+        """Return number of VFs supported for a given vGPU profile from pr=
ofileID string
+        e.g. ATSM150_M4 -> 4. In case of not initialized/unknown profileId=
 returns 0.
+        """
+        try:
+            return self.get_class_num_vfs()[1]
+        except exceptions.VgpuProfileError:
+            logger.warning("Unable to determine number of VFs for a vGPU p=
rofile - return 0")
+            return 0
+
+    def print_parameters(self) -> None:
+        logger.info(
+            "\nvGPU Profile ID: %s\n"
+            "Description =3D %s\n"
+            "Provisioning Mode =3D %s\n"
+            "Scheduler Mode =3D %s\n"
+            "Schedule If Idle =3D %s\n"
+            "Reset After Vf Switch =3D %s\n"
+            "PF:\n"
+            "\tExecution Quanta =3D %s ms\n"
+            "\tPreemption Timeout =3D %s us\n"
+            "\tLMEM =3D %s B\n"
+            "\tContexts =3D %s\n"
+            "\tDoorbells =3D %s\n"
+            "\tGGTT =3D %s B\n"
+            "VF:\n"
+            "\tExecution Quanta =3D %s ms\n"
+            "\tPreemption Timeout =3D %s us\n"
+            "\tLMEM =3D %s B\n"
+            "\tContexts =3D %s\n"
+            "\tDoorbells =3D %s\n"
+            "\tGGTT =3D %s B",
+            self.profileId, self.description, self.provisioningMode,
+            self.schedulerMode, self.scheduleIfIdle, self.resetAfterVfSwit=
ch,
+            self.pfExecutionQuanta, self.pfPreemptionTimeout,
+            self.pfLmem, self.pfContexts, self.pfDoorbells, self.pfGgtt,
+            self.vfExecutionQuanta, self.vfPreemptionTimeout,
+            self.vfLmem, self.vfContexts, self.vfDoorbells, self.vfGgtt
+        )
+
+
+class VgpuProfileCsvReader:
+    def __init__(self, vgpu_vfs_path: str, vgpu_int_path: str) -> None:
+        # vGPU profiles definitions are split into two CSV files
+        vfs_data =3D self.read_csv_file(vgpu_vfs_path)
+        int_data =3D self.read_csv_file(vgpu_int_path)
+
+        # List containing all profiles defined in CSV files
+        self._vgpu_profiles: List[VgpuProfile] =3D self.parse_csv_files(vf=
s_data, int_data)
+
+    @property
+    def vgpu_profiles(self) -> List[VgpuProfile]:
+        return self._vgpu_profiles
+
+    @vgpu_profiles.setter
+    def vgpu_profiles(self, value: List[VgpuProfile]) -> None:
+        self._vgpu_profiles =3D value
+
+    def read_csv_file(self, vgpu_csv_file: str) -> List[Dict[Optional[str]=
, Optional[str]]]:
+        vgpu_dict_list =3D []
+
+        if not posixpath.exists(vgpu_csv_file):
+            raise exceptions.VgpuProfileError(f'CSV file not found: {vgpu_=
csv_file}')
+
+        # CSV files encoding - unicode with BOM (byte order mark): utf-8-s=
ig
+        with open(vgpu_csv_file, mode=3D'r', encoding=3D'utf-8-sig') as cs=
v_file:
+            csv_reader =3D csv.DictReader(csv_file)
+
+            for row in csv_reader:
+                if 'vfs' in vgpu_csv_file:
+                    vgpu_dict_list.append(row)
+                elif 'int' in vgpu_csv_file:
+                    vgpu_dict_list.append(row)
+                else:
+                    raise exceptions.VgpuProfileError(f'Invalid CSV file: =
{vgpu_csv_file}')
+
+        return vgpu_dict_list
+
+    def parse_csv_files(self, vfs_list: List[Dict], int_list: List[Dict]) =
-> List[VgpuProfile]:
+        all_profiles: List[VgpuProfile] =3D []
+        if len(vfs_list) !=3D len(int_list):
+            raise exceptions.VgpuProfileError(f'CSV files: different numbe=
r of lines')
+
+        for vfs_row, int_row in zip(vfs_list, int_list):
+            profile: VgpuProfile =3D VgpuProfile()
+
+            profile.profileId =3D vfs_row['vGPUProfileInfo ProfileID']
+            tmp_int_profileId =3D int_row['vGPUProfileInfo ProfileID']
+            if profile.profileId !=3D tmp_int_profileId:
+                raise exceptions.VgpuProfileError(
+                    f'CSV files: ProfileIDs not matching - {profile.profil=
eId} vs {tmp_int_profileId}')
+
+            # [Platform]_vfs.csv file attributes:
+            profile.description =3D vfs_row['vGPUProfileInfo Description']
+            profile.schedulerMode =3D vfs_row['vGPUScheduler vGPUScheduler=
Mode']
+            profile.pfExecutionQuanta =3D int(vfs_row['vGPUScheduler PFExe=
cutionQuanta(msec)'])
+            profile.pfPreemptionTimeout =3D int(vfs_row['vGPUScheduler PFP=
reemptionTimeout(usec)'])
+            profile.vfExecutionQuanta =3D int(vfs_row['vGPUScheduler VFExe=
cutionQuanta(msec)'])
+            profile.vfPreemptionTimeout =3D int(vfs_row['vGPUScheduler VFP=
reemptionTimeout(usec)'])
+            profile.scheduleIfIdle =3D bool(vfs_row['vGPUScheduler Schedul=
eIfIdle'] =3D=3D 'T')
+
+            # [Platform]_int.csv file attributes:
+            profile.resetAfterVfSwitch =3D bool(int_row['vGPUScheduler Res=
etAfterVfSwitch'] =3D=3D 'T')
+            profile.provisioningMode =3D int(int_row['General TileProvisio=
ningMode'])
+            pf_lmem: str =3D int_row['PFResources Lmem(B/tile)']
+            profile.pfLmem =3D int(pf_lmem) if pf_lmem.isnumeric() else 0
+            profile.pfContexts =3D int(int_row['PFResources Contexts(perTi=
le)'])
+            profile.pfDoorbells =3D int(int_row['PFResources Doorbells(per=
Tile)'])
+            profile.pfGgtt =3D int(int_row['PFResources GGTTSize(B/tile)'])
+            vf_lmem: str =3D int_row['VFResources Lmem(B/tile)']
+            profile.vfLmem =3D int(vf_lmem) if vf_lmem.isnumeric() else 0
+            profile.vfContexts =3D int(int_row['VFResources Contexts(perTi=
le)'])
+            profile.vfDoorbells =3D int(int_row['VFResources Doorbells(per=
Tile)'])
+            profile.vfGgtt =3D int(int_row['VFResources GGTTSize(B/tile)'])
+
+            all_profiles.append(profile)
+
+        return all_profiles
diff --git a/tools/vmtb/bench/machines/virtual/__init__.py b/tools/vmtb/ben=
ch/machines/virtual/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/bench/machines/virtual/backends/__init__.py b/tools=
/vmtb/bench/machines/virtual/backends/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/bench/machines/virtual/backends/backend_interface.p=
y b/tools/vmtb/bench/machines/virtual/backends/backend_interface.py
new file mode 100644
index 000000000..f52c72d74
--- /dev/null
+++ b/tools/vmtb/bench/machines/virtual/backends/backend_interface.py
@@ -0,0 +1,42 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import abc
+import typing
+
+
+class BackendInterface(metaclass=3Dabc.ABCMeta):
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
+    def execute(self, command: str, args: typing.List[str]) -> typing.Opti=
onal[typing.Dict]:
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
diff --git a/tools/vmtb/bench/machines/virtual/backends/guestagent.py b/too=
ls/vmtb/bench/machines/virtual/backends/guestagent.py
new file mode 100644
index 000000000..aed73e08a
--- /dev/null
+++ b/tools/vmtb/bench/machines/virtual/backends/guestagent.py
@@ -0,0 +1,101 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import json
+import logging
+import socket
+import typing
+
+from bench import exceptions
+from bench.machines.virtual.backends.backend_interface import BackendInter=
face
+
+logger =3D logging.getLogger(__name__)
+
+
+class GuestAgentBackend(BackendInterface):
+    def __init__(self, socket_path: str, socket_timeout: int) -> None:
+        self.sockpath =3D socket_path
+        self.timeout =3D socket_timeout
+        self.sock: socket.socket =3D socket.socket(socket.AF_UNIX, socket.=
SOCK_STREAM)
+        self.sock.connect(self.sockpath)
+        self.sockf: typing.TextIO =3D self.sock.makefile(mode=3D'rw', erro=
rs=3D'strict')
+
+    def __send(self, command: str, arguments: typing.Optional[typing.Dict]=
 =3D None) -> typing.Dict:
+        if arguments is None:
+            arguments =3D {}
+
+        data =3D {'execute': command, 'arguments': arguments}
+        json.dump(data, self.sockf)
+        self.sockf.flush()
+        try:
+            out: typing.Optional[str] =3D self.sockf.readline()
+        except socket.timeout as soc_to_exc:
+            logger.error('Socket readline timeout on command %s', command)
+            self.sock.close()
+            self.sockf.close()
+            raise exceptions.GuestAgentError(f'Socket timed out on {comman=
d}') from soc_to_exc
+        if out is None:
+            logger.error('Command %s, args %s returned with no output')
+            raise exceptions.GuestAgentError(f'Command {command} did not r=
etunrned output')
+            # Only logging errors for now
+        ret: typing.Dict =3D json.loads(out)
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
+    def execute(self, command: str, args: typing.Optional[typing.List[str]=
] =3D None) -> typing.Dict:
+        if args is None:
+            args =3D []
+        arguments =3D {'path': command, 'arg': args, 'capture-output': Tru=
e}
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
+        data =3D {'execute': 'guest-suspend-ram'}
+        json.dump(data, self.sockf)
+        self.sockf.flush()
+
+    def reboot(self) -> None:
+        self.ping()
+        # guest-shutdown does not return anything, thats why no __send
+        data =3D {'execute': 'guest-shutdown', 'arguments': {'mode': 'rebo=
ot'}}
+        json.dump(data, self.sockf)
+        self.sockf.flush()
+
+    def poweroff(self) -> None:
+        self.ping()
+        # guest-shutdown does not return anything, thats why no __send
+        data =3D {'execute': 'guest-shutdown', 'arguments': {'mode': 'powe=
rdown'}}
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
+        return self.__send('guest-file-write', {'handle': handle, 'buf-b64=
': content})
+
+    def guest_file_read(self, handle: int) -> typing.Dict:
+        return self.__send('guest-file-read', {'handle': handle})
diff --git a/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py b/to=
ols/vmtb/bench/machines/virtual/backends/qmp_monitor.py
new file mode 100644
index 000000000..179d0f6ae
--- /dev/null
+++ b/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
@@ -0,0 +1,163 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import json
+import logging
+import queue
+import socket
+import threading
+import time
+import typing
+
+logger =3D logging.getLogger(__name__)
+
+
+class QmpMonitor():
+    def __init__(self, socket_path: str, socket_timeout: int) -> None:
+        self.sockpath =3D socket_path
+        self.timeout =3D socket_timeout
+        self.sock: socket.socket =3D socket.socket(socket.AF_UNIX, socket.=
SOCK_STREAM)
+        self.sock.connect(self.sockpath)
+        self.sockf: typing.TextIO =3D self.sock.makefile(mode=3D'rw', erro=
rs=3D'strict')
+        self.qmp_queue: queue.Queue =3D queue.Queue()
+        self.monitor_thread: threading.Thread =3D threading.Thread(target=
=3Dself.__queue_qmp_output,
+                                                                 args=3D(s=
elf.sockf, self.qmp_queue),
+                                                                 daemon=3D=
True)
+        self.monitor_thread.start()
+        # It is required to enable capabilities befor using QMP
+        self.__enable_qmp_capabilities()
+
+    def __enable_qmp_capabilities(self) -> None:
+        json.dump({'execute': 'qmp_capabilities'}, self.sockf)
+        self.sockf.flush()
+
+    def __queue_qmp_output(self, out: typing.TextIO, q: queue.Queue) -> No=
ne:
+        for line in iter(out.readline, ''):
+            logger.debug('[QMP RSP] <- %s', line)
+            qmp_msg =3D json.loads(line)
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
+        ret: typing.Dict =3D {}
+        while 'status' not in ret:
+            qmp_msg =3D self.qmp_queue.get()
+            if 'return' in qmp_msg:
+                ret =3D qmp_msg.get('return')
+
+        status: str =3D ret['status']
+        logger.debug('Machine status: %s', status)
+        return status
+
+    def query_jobs(self, requested_type: str) -> typing.Tuple[str, str]:
+        json.dump({'execute': 'query-jobs'}, self.sockf)
+        self.sockf.flush()
+
+        job_type: str =3D ''
+        job_status: str =3D ''
+        job_error: str =3D ''
+        ret: typing.Dict =3D {}
+
+        qmp_msg =3D self.qmp_queue.get()
+        # logger.debug('[QMP RSP Queue] -> %s', qmp_msg)
+        if 'return' in qmp_msg:
+            ret =3D qmp_msg.get('return')
+            for param in ret:
+                job_type =3D param.get('type')
+                job_status =3D param.get('status')
+                job_error =3D param.get('error')
+
+                if job_type =3D=3D requested_type:
+                    break
+
+        return (job_status, job_error)
+
+    def get_qmp_event(self) -> str:
+        qmp_msg =3D self.qmp_queue.get()
+        # logger.debug('[QMP RSP Queue] -> %s', qmp_msg)
+        event: str =3D qmp_msg.get('event', '')
+        return event
+
+    def get_qmp_event_job(self) -> str:
+        qmp_msg =3D self.qmp_queue.get()
+        # logger.debug('[QMP RSP Queue] -> %s', qmp_msg)
+
+        status: str =3D ''
+        if qmp_msg.get('event') =3D=3D 'JOB_STATUS_CHANGE':
+            status =3D qmp_msg.get('data', {}).get('status', '')
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
+        node_name: str =3D ''
+        snapshot_tag: str =3D ''
+        ret: typing.Dict =3D {}
+
+        qmp_msg =3D self.qmp_queue.get()
+        # logger.debug('[QMP RSP Queue] -> %s', qmp_msg)
+        if 'return' in qmp_msg:
+            ret =3D qmp_msg.get('return')
+            for block in ret:
+                if block.get('drv') =3D=3D 'qcow2':
+                    node_name =3D block.get('node-name')
+                    # Get the most recent state snapshot from the snapshot=
s list:
+                    snapshots =3D block.get('image').get('snapshots')
+                    if snapshots:
+                        snapshot_tag =3D snapshots[-1].get('name')
+                    break
+
+        return (node_name, snapshot_tag)
+
+    def save_snapshot(self) -> None:
+        job_id: str =3D f'savevm_{time.time()}'
+        snapshot_tag =3D f'vm_state_{time.time()}'
+        node_name, _ =3D self.__query_snapshot()
+        logger.debug('[QMP snapshot-save] snapshot_tag: %s, block device n=
ode: %s', snapshot_tag, node_name)
+
+        # Note: command 'snapshot-save' is supported since QEMU 6.0
+        json.dump({'execute': 'snapshot-save',
+            'arguments': {'job-id': job_id, 'tag': snapshot_tag, 'vmstate'=
: node_name, 'devices': [node_name]}},
+            self.sockf)
+        self.sockf.flush()
+
+    def load_snapshot(self) -> None:
+        job_id: str =3D f'loadvm_{time.time()}'
+        node_name, snapshot_tag =3D self.__query_snapshot()
+        logger.debug('[QMP snapshot-load] snapshot_tag: %s, block device n=
ode: %s', snapshot_tag, node_name)
+
+        # Note: command 'snapshot-load' is supported since QEMU 6.0
+        json.dump({'execute': 'snapshot-load',
+            'arguments': {'job-id': job_id, 'tag': snapshot_tag, 'vmstate'=
: node_name, 'devices': [node_name]}},
+            self.sockf)
+        self.sockf.flush()
diff --git a/tools/vmtb/bench/machines/virtual/vm.py b/tools/vmtb/bench/mac=
hines/virtual/vm.py
new file mode 100644
index 000000000..a25229db4
--- /dev/null
+++ b/tools/vmtb/bench/machines/virtual/vm.py
@@ -0,0 +1,595 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import base64
+import logging
+import os
+import posixpath
+import shlex
+import signal
+import subprocess
+import threading
+import time
+import typing
+
+from types import FrameType
+from bench import exceptions
+from bench.machines.machine_interface import MachineInterface, ProcessResu=
lt, SuspendMode, DriverModule, DEFAULT_TIMEOUT
+from bench.machines.virtual.backends.guestagent import GuestAgentBackend
+from bench.machines.virtual.backends.qmp_monitor import QmpMonitor
+
+logger =3D logging.getLogger(__name__)
+
+
+class VirtualMachine(MachineInterface):
+    class Decorators():
+        @staticmethod
+        def alarm_handler(sig: signal.Signals, tb: FrameType) -> typing.An=
y:
+            raise exceptions.AlarmTimeoutError(f'Alarm timeout occured')
+
+        @classmethod
+        def timeout_signal(cls, func: typing.Callable) -> typing.Callable:
+            def timeout_wrapper(*args: typing.Any, **kwargs: typing.Option=
al[typing.Any]) -> typing.Any:
+                timeout: int =3D DEFAULT_TIMEOUT
+                if len(args) > 2:
+                    timeout =3D args[2] # Argument position in execute_wai=
t(self, pid, timeout)
+                elif kwargs.get('timeout') is not None:
+                    if isinstance(kwargs['timeout'], int):
+                        timeout =3D kwargs['timeout']
+
+                # mypy: silence the following problem in signal.signal() c=
all:
+                # error: Argument 2 to "signal" has incompatible type "Cal=
lable[[Signals, FrameType], Any]";
+                # expected "Union[Callable[[int, Optional[FrameType]], Any=
], int, Handlers, None]"  [arg-type]
+                signal.signal(signal.SIGALRM, cls.alarm_handler) # type: i=
gnore[arg-type]
+                signal.alarm(timeout)
+                try:
+                    proc_ret =3D func(*args, **kwargs)
+                except exceptions.AlarmTimeoutError:
+                    logger.warning('Timeout (%ss) on %s', timeout, func.__=
name__)
+                    raise
+                finally:
+                    signal.alarm(0)  # Cancel alarm
+
+                return proc_ret
+
+            return timeout_wrapper
+
+    def __init__(self, backing_image: str, vm_number: int) -> None:
+        # TODO: make properties private and publish accessors (@property)
+        self.vf_bdf: typing.Optional[str] =3D None
+        self.process: typing.Optional[subprocess.Popen] =3D None
+        self.vmnum: int =3D vm_number
+        self.card_num: int =3D 0
+        self.sysfs_prefix_path =3D posixpath.join('/sys/class/drm/', f'car=
d{str(self.card_num)}')
+        self.questagent_sockpath =3D posixpath.join('/tmp', f'qga{self.vmn=
um}.sock')
+        self.qmp_sockpath =3D posixpath.join('/tmp', f'mon{self.vmnum}.soc=
k')
+        self.drm_driver: typing.Optional[DriverModule] =3D None
+
+        if not posixpath.exists(backing_image):
+            logger.error('No image for VM%s', self.vmnum)
+            raise exceptions.GuestError(f'No image for VM{self.vmnum}')
+        self.image: str =3D self.__create_qemu_image(backing_image)
+        self.migrate_source_image: typing.Optional[str] =3D None
+        self.migrate_destination_vm: bool =3D False
+
+        # Resources provisioned to the VF/VM:
+        self._lmem_size: typing.Optional[int] =3D None
+        self._ggtt_size: typing.Optional[int] =3D None
+        self._contexts: typing.Optional[int] =3D None
+        self._doorbells: typing.Optional[int] =3D None
+
+        # GT number and tile is relevant mainly for multi-tile devices
+        # List of all GTs used by a given VF:
+        # - for single-tile: only root [0]
+        # - for multi-tile Mode 2/3: either root [0] or remote [1]
+        # - for multi-tile Mode 1: spans on both tiles [0, 1]
+        self._gt_nums: typing.List[int] =3D []
+        self._tile_mask: typing.Optional[int] =3D None
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
+        # self.__close_qemu_output()
+        # Lets wait and make sure that qemu shutdown
+        try:
+            self.process.communicate(timeout=3D30)
+        except subprocess.TimeoutExpired:
+            print('QEMU did not terminate, killing it')
+            self.process.kill()
+
+    def __create_qemu_image(self, backing_file: str) -> str:
+        output_image =3D f'./vm{self.vmnum}_{time.time()}_image.qcow2'
+        try:
+            subprocess.check_output(['qemu-img', 'create',
+                                     '-F', 'raw',
+                                     '-f', 'qcow2',
+                                     '-b', f'{backing_file}', f'{output_im=
age}'],
+                                    universal_newlines=3DTrue)
+        except subprocess.CalledProcessError as exc:
+            logger.error('Creating qcow2 image file for VM%s failed with %=
s', self.vmnum, exc)
+            raise exceptions.GuestError('Error creating qcow2 image') from=
 exc
+
+        return output_image
+
+    # def __open_qemu_output(self) -> None:
+    #     self.qemu_stdout =3D open(f'./qemu_vm{self.vmnum}_stdout.log', '=
w')
+    #     self.qemu_stderr =3D open(f'./qemu_vm{self.vmnum}_stderr.log', '=
w')
+
+    def __log_qemu_output(self, out: typing.TextIO) -> None:
+        stdoutlog =3D logging.getLogger(f'VM{self.vmnum}_kmsg')
+        for line in iter(out.readline, ''):
+            stdoutlog.info(line.strip())
+
+    # def __close_qemu_output(self) -> None:
+    #     self.qemu_stderr.close()
+    #     self.qemu_stdout.close()
+
+    def __sockets_exists(self) -> bool:
+        return os.path.exists(self.questagent_sockpath) and os.path.exists=
(self.qmp_sockpath)
+
+    def __get_popen_command(self) -> typing.List[str]:
+        # self.__open_qemu_output()
+        command =3D ['qemu-system-x86_64',
+                   '-vnc', f':{self.vmnum}',
+                   '-serial', 'stdio',
+                   '-m', '4096',
+                   '-drive', f'file=3D{self.image if not self.migrate_dest=
ination_vm else self.migrate_source_image}',
+                   '-chardev', f'socket,path=3D{self.questagent_sockpath},=
server=3Don,wait=3Doff,id=3Dqga{self.vmnum}',
+                   '-device', 'virtio-serial',
+                   '-device', f'virtserialport,chardev=3Dqga{self.vmnum},n=
ame=3Dorg.qemu.guest_agent.0',
+                   '-chardev', f'socket,id=3Dmon{self.vmnum},path=3D/tmp/m=
on{self.vmnum}.sock,server=3Don,wait=3Doff',
+                   '-mon', f'chardev=3Dmon{self.vmnum},mode=3Dcontrol']
+
+        if self.vf_bdf:
+            command.extend(['-enable-kvm', '-cpu', 'host'])
+            command.extend(['-device', f'vfio-pci,host=3D{self.vf_bdf},'
+                            # vfio-pci x-enable-migration=3Dtrue param is =
currently needed for migration
+                            # TODO: review later if still required when qe=
mu/vfio-pci evolves
+                            'x-enable-migration=3Dtrue'])
+
+        if self.migrate_destination_vm:
+            # If VM is migration destination - run in stopped/prelaunch st=
ate (explicit resume required)
+            command.extend(['-S'])
+
+        logger.debug('QEMU command: %s', ' '.join(command))
+        return command
+
+    def __get_key(self, base: typing.Dict, path: typing.List[str]) -> typi=
ng.Any:
+        cur =3D base
+        for key in path:
+            if cur is None or key not in cur:
+                raise ValueError(f'The key {path} does not exist, aborting=
!')
+            cur =3D cur[key]
+        return cur
+
+    @property
+    def get_vm_num(self) -> int:
+        return self.vmnum
+
+    def assign_vf(self, vf_bdf: str) -> None:
+        self.vf_bdf =3D vf_bdf
+
+    def set_migration_source(self, src_image: str) -> None:
+        self.migrate_source_image =3D src_image
+        self.migrate_destination_vm =3D True
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
+        self._gt_nums =3D self.get_gt_num_from_sysfs()
+        if not self._gt_nums:
+            logger.warning("VM sysfs: missing GT index")
+            self._gt_nums =3D [0]
+
+        return self._gt_nums
+
+    def get_gt_num_from_sysfs(self) -> typing.List[int]:
+        # Get GT number of VF passed to a VM, based on an exisitng a sysfs=
 path
+        vm_gt_num =3D []
+        if self.dir_exists(posixpath.join(self.sysfs_prefix_path, 'gt/gt0'=
)):
+            vm_gt_num.append(0)
+        if self.dir_exists(posixpath.join(self.sysfs_prefix_path, 'gt/gt1'=
)):
+            vm_gt_num.append(1)
+
+        return vm_gt_num
+
+    def query_available_drivers(self) -> typing.List[DriverModule]:
+        # Check guest for supported DRM drivers (i915 / xe)
+        available_drivers: typing.List[DriverModule] =3D []
+
+        for drm_driver in DriverModule:
+            modinfo_pid =3D self.execute(f'modinfo -F filename {drm_driver=
}')
+            modinfo_result: ProcessResult =3D self.execute_wait(modinfo_pi=
d)
+            if modinfo_result.exit_code =3D=3D 0:
+                available_drivers.append(drm_driver)
+
+        logger.debug("VirtualMachine - found DRM driver module(s): %s", av=
ailable_drivers)
+        return available_drivers
+
+    def select_driver_module(self) -> DriverModule:
+        available_drivers =3D self.query_available_drivers()
+        # Xe is preferred in case of both, i915 and xe drivers are support=
ed by the kernel
+        return DriverModule.XE if DriverModule.XE in available_drivers els=
e available_drivers[0]
+
+    def get_drm_driver(self) -> DriverModule:
+        if self.drm_driver is None:
+            self.drm_driver =3D self.select_driver_module()
+
+        return self.drm_driver
+
+    @Decorators.timeout_signal
+    def poweron(self) -> None:
+        logger.debug('Powering on VM%s', self.vmnum)
+        if self.is_running():
+            logger.warning('VM%s already running', self.vmnum)
+            return
+
+        command =3D self.__get_popen_command()
+        # We don't want to kill the process created here (like 'with' woul=
d do) so disable the following linter issue:
+        # R1732: consider-using-with (Consider using 'with' for resource-a=
llocating operations)
+        # pylint: disable=3DR1732
+        # TODO: but maybe 'subprocess.run' function would fit instead of P=
open constructor?
+        self.process =3D subprocess.Popen(
+            args=3Dcommand,
+            stdout=3Dsubprocess.PIPE,
+            stderr=3Dsubprocess.PIPE,
+            # 'stdout': self.qemu_stdout,
+            # 'stderr': self.qemu_stderr,
+            universal_newlines=3DTrue)
+
+        qemu_stdout_log_thread =3D threading.Thread(
+            target=3Dself.__log_qemu_output, args=3D(
+                self.process.stdout,), daemon=3DTrue)
+        qemu_stdout_log_thread.start()
+
+        qemu_stderr_log_thread =3D threading.Thread(
+            target=3Dself.__log_qemu_output, args=3D(
+                self.process.stderr,), daemon=3DTrue)
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
+            self.ga =3D GuestAgentBackend(self.questagent_sockpath, 300)
+            self.qm =3D QmpMonitor(self.qmp_sockpath, 300)
+            vm_status =3D self.qm.query_status()
+
+            if not self.migrate_destination_vm and vm_status !=3D 'running=
':
+                self.process.terminate()
+                logger.error('VM%s status not "running", instead: %s', sel=
f.vmnum, vm_status)
+                raise exceptions.GuestError(f'VM{self.vmnum} status {vm_st=
atus}')
+        except Exception as exc:
+            logger.error('Error while booting VM%s: %s', self.vmnum, exc)
+            self.process.terminate()
+            raise exceptions.GuestError(f'VM{self.vmnum} crashed with {exc=
}') from exc
+
+    def is_running(self) -> bool:
+        if self.process is None:
+            return False
+
+        return_code =3D self.process.poll()
+        if return_code is None:
+            return True
+
+        # self.__close_qemu_output()
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
+            event: str =3D self.qm.get_qmp_event()
+            while event !=3D 'SHUTDOWN':
+                event =3D self.qm.get_qmp_event()
+        except exceptions.AlarmTimeoutError:
+            logger.warning('VM%s hanged on poweroff. Initiating forced ter=
mination', self.vmnum)
+            self.process.terminate()
+        finally:
+            # Wait and make sure that qemu shutdown
+            self.process.communicate()
+            # self.__close_qemu_output()
+
+            if self.__sockets_exists():
+                # Remove leftovers and notify about unclear qemu shutdown
+                os.remove(self.questagent_sockpath)
+                os.remove(self.qmp_sockpath)
+                raise exceptions.GuestError(f'VM{self.vmnum} was not grace=
fully powered off - sockets exist')
+
+    def reboot(self) -> None:
+        logger.debug('Rebooting VM%s', self.vmnum)
+        self.qm.system_reset()
+        event: str =3D self.qm.get_qmp_event()
+        while event !=3D 'RESET':
+            event =3D self.qm.get_qmp_event()
+
+    def pause(self) -> None:
+        logger.debug('Pausing VM%s', self.vmnum)
+        self.qm.stop()
+        vm_status =3D self.qm.query_status()
+        if vm_status !=3D 'paused':
+            if self.process:
+                self.process.terminate()
+            logger.error('VM%s status not "paused", instead: %s', self.vmn=
um, vm_status)
+            raise exceptions.GuestError(f'VM{self.vmnum} status {vm_status=
}')
+
+    def resume(self) -> None:
+        logger.debug('Resuming VM%s', self.vmnum)
+        self.qm.cont()
+        vm_status =3D self.qm.query_status()
+        if vm_status !=3D 'running':
+            if self.process:
+                self.process.terminate()
+            logger.error('VM%s status not "running", instead: %s', self.vm=
num, vm_status)
+            raise exceptions.GuestError(f'VM{self.vmnum} status {vm_status=
}')
+
+    def quit(self) -> None:
+        logger.debug('Quitting VM%s', self.vmnum)
+        self.qm.quit()
+        event: str =3D self.qm.get_qmp_event()
+        while event !=3D 'SHUTDOWN':
+            event =3D self.qm.get_qmp_event()
+
+    def _enable_suspend(self) -> None:
+        if self.link_exists('/etc/systemd/system/suspend.target'):
+            logger.debug('Enable (unmask) systemd suspend/sleep')
+            self.execute('systemctl unmask suspend.target sleep.target')
+
+    def suspend(self, mode: SuspendMode =3D SuspendMode.ACPI_S3) -> None:
+        logger.debug('Suspending VM%s (mode: %s)', self.vmnum, mode)
+        self._enable_suspend()
+        if mode =3D=3D SuspendMode.ACPI_S3:
+            self.ga.suspend_ram()
+        elif mode =3D=3D SuspendMode.ACPI_S4:
+            # self.ga.suspend_disk()
+            raise exceptions.GuestError('Guest S4 support not implemented')
+        else:
+            raise exceptions.GuestError('Unknown suspend mode')
+
+        event: str =3D self.qm.get_qmp_event()
+        while event !=3D 'SUSPEND':
+            event =3D self.qm.get_qmp_event()
+
+        vm_status =3D self.qm.query_status()
+        if vm_status !=3D 'suspended':
+            if self.process:
+                self.process.terminate()
+            logger.error('VM%s status not "suspended", instead: %s', self.=
vmnum, vm_status)
+            raise exceptions.GuestError(f'VM{self.vmnum} status {vm_status=
}')
+
+    def wakeup(self) -> None:
+        logger.debug('Waking up VM%s', self.vmnum)
+        self.qm.system_wakeup()
+
+        event: str =3D self.qm.get_qmp_event()
+        while event !=3D 'WAKEUP':
+            event =3D self.qm.get_qmp_event()
+
+        vm_status =3D self.qm.query_status()
+        if vm_status !=3D 'running':
+            if self.process:
+                self.process.terminate()
+            logger.error('VM%s status not "running", instead: %s', self.vm=
num, vm_status)
+            raise exceptions.GuestError(f'VM{self.vmnum} status {vm_status=
}')
+
+    # {"execute": "guest-exec", "arguments":{"path": "/some/path", "arg": =
[], "capture-output": true}}
+    # {"error": {"class": "GenericError", "desc": "Guest... "}}
+    def execute(self, command: str) -> int:
+        arr_cmd =3D shlex.split(command)
+        execout: typing.Dict =3D self.ga.execute(arr_cmd[0], arr_cmd[1:])
+        ret =3D execout.get('return')
+        if ret:
+            pid: int =3D ret.get('pid')
+            logger.debug('Running %s on VM%s with pid %s', command, self.v=
mnum, pid)
+            return pid
+
+        logger.error('Command %s did not return pid', command)
+        raise exceptions.GuestError(f'No pid returned: {execout}')
+
+    # {'error': {'class': 'GenericError', 'desc': "Invalid parameter 'pid'=
"}}
+    def execute_status(self, pid: int) -> ProcessResult:
+        out =3D self.ga.execute_status(pid)
+        status =3D out.get('return')
+        if not status:
+            raise exceptions.GuestError(f'Not output from guest agent: {ou=
t}')
+
+        b64stdout =3D status.get('out-data', '')
+        stdout =3D base64.b64decode(b64stdout).decode('utf-8')
+
+        b64stderr =3D status.get('err-data', '')
+        stderr =3D base64.b64decode(b64stderr).decode('utf-8')
+
+        return ProcessResult(status.get('exited'), status.get('exitcode', =
None), stdout, stderr)
+
+    @Decorators.timeout_signal
+    def execute_wait(self, pid: int, timeout: int =3D DEFAULT_TIMEOUT) -> =
ProcessResult:
+        exec_status =3D ProcessResult(False, -1, '', '')
+        while not exec_status.exited:
+            exec_status =3D self.execute_status(pid)
+            time.sleep(1)
+
+        return exec_status
+
+    def execute_signal(self, pid: int, sig: signal.Signals) -> None:
+        signum =3D int(sig)
+        killpid =3D self.execute(f'kill -{signum} {pid}')
+        self.execute_wait(killpid)
+
+    def read_file_content(self, path: str) -> str:
+        out =3D self.ga.guest_file_open(path, 'r')
+        handle =3D out.get('return')
+        if not handle:
+            raise exceptions.GuestError('Could not open file on guest')
+
+        try:
+            eof: bool =3D False
+            file_content: typing.List[str] =3D []
+            while not eof:
+                ret =3D self.ga.guest_file_read(handle)
+                eof =3D self.__get_key(ret, ['return', 'eof'])
+                b64buf: str =3D self.__get_key(ret, ['return', 'buf-b64'])
+                file_content.append(base64.b64decode(b64buf).decode('utf-8=
'))
+        finally:
+            self.ga.guest_file_close(handle)
+
+        return ''.join(file_content)
+
+    def write_file_content(self, path: str, content: str) -> int:
+        out: typing.Dict =3D self.ga.guest_file_open(path, 'w')
+        handle =3D out.get('return')
+        if not handle:
+            raise exceptions.GuestError('Could not open file on guest')
+
+        b64buf: bytes =3D base64.b64encode(content.encode())
+
+        try:
+            ret =3D self.ga.guest_file_write(handle, b64buf.decode('utf-8'=
))
+            count: int =3D self.__get_key(ret, ['return', 'count'])
+        finally:
+            self.ga.guest_file_close(handle)
+
+        return count
+
+    def dir_exists(self, path: str) -> bool:
+        pid =3D self.execute(f'/bin/sh -c "[ -d {path} ]"')
+        status =3D self.execute_wait(pid)
+        if status.exit_code:
+            return False
+        return True
+
+    def link_exists(self, path: str) -> bool:
+        pid =3D self.execute(f'/bin/sh -c "[ -h {path} ]"')
+        status =3D self.execute_wait(pid)
+        if status.exit_code:
+            return False
+        return True
+
+    @Decorators.timeout_signal
+    def save_state(self) -> None:
+        logger.debug('Saving VM%s state (snapshot)', self.vmnum)
+        self.qm.save_snapshot()
+
+        job_status: str =3D self.qm.get_qmp_event_job()
+        while job_status !=3D 'concluded':
+            job_status =3D self.qm.get_qmp_event_job()
+
+        job_status, job_error =3D self.qm.query_jobs('snapshot-save')
+        if job_status =3D=3D 'concluded' and job_error is not None:
+            raise exceptions.GuestError(f'VM{self.vmnum} state save error:=
 {job_error}')
+
+        logger.debug('VM%s state save finished successfully', self.vmnum)
+
+    @Decorators.timeout_signal
+    def load_state(self) -> None:
+        logger.debug('Loading VM state (snapshot)')
+        self.qm.load_snapshot()
+
+        job_status: str =3D self.qm.get_qmp_event_job()
+        while job_status !=3D 'concluded':
+            job_status =3D self.qm.get_qmp_event_job()
+
+        job_status, job_error =3D self.qm.query_jobs('snapshot-load')
+        if job_status =3D=3D 'concluded' and job_error is not None:
+            raise exceptions.GuestError(f'VM{self.vmnum} state load error:=
 {job_error}')
+
+        logger.debug('VM state load finished successfully')
+
+    # helper_convert_units_to_bytes - convert size with units to bytes
+    # @size_str: multiple-byte unit size with suffix (K/M/G)
+    # Returns: size in bytes
+    # TODO: function perhaps could be moved to some new utils module
+    # improve - consider regex to handle various formats eg. both M and MB
+    def helper_convert_units_to_bytes(self, size_str: str) -> int:
+        size_str =3D size_str.upper()
+        size_int =3D 0
+
+        if size_str.endswith('B'):
+            size_int =3D int(size_str[0:-1])
+        elif size_str.endswith('K'):
+            size_int =3D int(size_str[0:-1]) * 1024
+        elif size_str.endswith('M'):
+            size_int =3D int(size_str[0:-1]) * 1024**2
+        elif size_str.endswith('G'):
+            size_int =3D int(size_str[0:-1]) * 1024**3
+
+        return size_int
+
+    # helper_get_debugfs_selfconfig - read resources allocated to VF from =
debugfs:
+    # /sys/kernel/debug/dri/@card/gt@gt_num/iov/self_config
+    # @card: card number
+    # @gt_num: GT instance number
+    def helper_get_debugfs_selfconfig(self, card: int =3D 0, gt_num: int =
=3D 0) -> None:
+        path =3D posixpath.join(f'/sys/kernel/debug/dri/{card}/gt{gt_num}/=
iov/self_config')
+        out =3D self.read_file_content(path)
+
+        for line in out.splitlines():
+            param, value =3D line.split(':')
+
+            if param =3D=3D 'GGTT size':
+                self._ggtt_size =3D self.helper_convert_units_to_bytes(val=
ue)
+            elif param =3D=3D 'LMEM size':
+                self._lmem_size =3D self.helper_convert_units_to_bytes(val=
ue)
+            elif param =3D=3D 'contexts':
+                self._contexts =3D int(value)
+            elif param =3D=3D 'doorbells':
+                self._doorbells =3D int(value)
+            elif param =3D=3D 'tile mask':
+                self._tile_mask =3D int(value, base=3D16)
diff --git a/tools/vmtb/dev-requirements.txt b/tools/vmtb/dev-requirements.=
txt
new file mode 100644
index 000000000..d41e3fd83
--- /dev/null
+++ b/tools/vmtb/dev-requirements.txt
@@ -0,0 +1,14 @@
+# Testing
+pytest
+
+# Code checking
+mypy
+pylint
+
+# Code formatting
+autopep8
+isort
+
+# Building
+build
+packaging
diff --git a/tools/vmtb/pyproject.toml b/tools/vmtb/pyproject.toml
new file mode 100644
index 000000000..acdbf8752
--- /dev/null
+++ b/tools/vmtb/pyproject.toml
@@ -0,0 +1,25 @@
+[build-system]
+requires =3D ["setuptools >=3D 61.0"]
+build-backend =3D "setuptools.build_meta"
+
+[project]
+name =3D "vmtb"
+version =3D "1.0.0"
+description =3D "SR-IOV VM-level test tool"
+readme =3D "README.md"
+requires-python =3D ">=3D3.8"
+
+authors =3D [
+  {name =3D "Intel Corporation"}
+]
+classifiers =3D [
+    "Programming Language :: Python :: 3",
+    "License :: OSI Approved :: MIT License",
+]
+dependencies =3D [
+    "pytest",
+]
+
+[tool.setuptools.packages.find]
+where =3D ["."]
+include =3D ["*"]
diff --git a/tools/vmtb/requirements.txt b/tools/vmtb/requirements.txt
new file mode 100644
index 000000000..5d80ceeab
--- /dev/null
+++ b/tools/vmtb/requirements.txt
@@ -0,0 +1,2 @@
+# Used for running tests
+pytest
diff --git a/tools/vmtb/vmm_flows/__init__.py b/tools/vmtb/vmm_flows/__init=
__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/vmtb/vmm_flows/conftest.py b/tools/vmtb/vmm_flows/confte=
st.py
new file mode 100644
index 000000000..5d4bec4f3
--- /dev/null
+++ b/tools/vmtb/vmm_flows/conftest.py
@@ -0,0 +1,296 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import json
+import re
+import logging
+import typing
+from pathlib import Path
+import pytest
+
+from bench import exceptions
+from bench.machines.machine_interface import DriverModule
+from bench.machines.host import SriovHost, HOST_DMESG_FILE
+from bench.machines.virtual.vm import VirtualMachine
+from bench.machines.vgpu_profile import VgpuProfile, VgpuProfileClass
+from bench.helpers.helpers import (load_host_drivers, unload_host_drivers,
+                                   modprobe_driver, modprobe_driver_check,=
 driver_check)
+
+
+logger =3D logging.getLogger(__name__)
+
+
+def pytest_addoption(parser):
+    parser.addoption('--vm-image',
+                     action=3D'store',
+                     help=3D'OS image to boot on VM',
+                     required=3DTrue)
+    parser.addoption('--vm-modparams',
+                     action=3D'store',
+                     default=3D'',
+                     help=3D'DRM driver parameters to use for VM')
+
+
+class VmmTestingConfig(typing.NamedTuple):
+    """Structure represents test configuration used by a setup fixture.
+
+    Available settings:
+    - vgpu_profile: profile to apply, empty represents auto provisioning
+    - num_vms: number of VMs to create (the value can be different than en=
abled number of VFs)
+    - auto_poweron_vm: assign VFs and power on VMs automatically in setup =
fixture
+    - auto_probe_vm_driver: probe guest DRM driver in setup fixture (VM mu=
st be powered on)
+    - unload_host_drivers_on_teardown: unload host DRM drivers in teardown=
 fixture
+    - wa_reduce_vf_lmem: workaround to reduce VF LMEM (for save-restore/mi=
gration tests speed-up)
+    """
+    vgpu_profile: VgpuProfile
+    num_vms: int
+    auto_poweron_vm: bool =3D True
+    auto_probe_vm_driver: bool =3D True
+    unload_host_drivers_on_teardown: bool =3D False
+    # Temporary W/A: reduce size of LMEM assigned to VFs to speed up a VF =
state save-restore process
+    wa_reduce_vf_lmem: bool =3D False
+
+    def __str__(self) -> str:
+        if self.vgpu_profile.profileId:
+            config_id =3D self.vgpu_profile.profileId[-2:] if self.vgpu_pr=
ofile.profileId[-3] =3D=3D '_' \
+                                                         else self.vgpu_pr=
ofile.profileId[-3:]
+        else:
+            config_id =3D 'Auto'
+
+        return f'{config_id}-{self.num_vms}VM'
+
+    def __repr__(self) -> str:
+        return (f'\nVmmTestingConfig:'
+                f'\nvGPU ProfileID =3D {self.vgpu_profile.profileId} [{sel=
f.num_vms}VM]'
+                f'\nSetup flags:'
+                f'\n\tVM - auto power-on =3D {self.auto_poweron_vm}'
+                f'\n\tVM - auto DRM driver probe =3D {self.auto_probe_vm_d=
river}'
+                f'\n\tHost - unload drivers on teardown =3D {self.unload_h=
ost_drivers_on_teardown}'
+                f'\n\tW/A - reduce VF LMEM (improves migration time) =3D {=
self.wa_reduce_vf_lmem}')
+
+
+class VmmTestingSetup:
+    def __init__(self, os_image, vm_modparams, host, testing_config):
+        self.vm_modparams =3D vm_modparams
+        self.host: SriovHost =3D host
+        self.testing_config: VmmTestingConfig =3D testing_config
+
+        self.vms: typing.List[VirtualMachine] =3D [
+            VirtualMachine(os_image, i) for i in range(self.testing_config=
.num_vms)]
+
+    @property
+    def get_host(self):
+        return self.host
+
+    @property
+    def get_vm(self):
+        return self.vms
+
+    @property
+    def get_vm_modprobe_params(self):
+        return self.vm_modparams
+
+    @property
+    def get_vgpu_profile(self):
+        return self.testing_config.vgpu_profile
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
+                    self.testing_config.unload_host_drivers_on_teardown =
=3D True
+                    logger.warning("Error on VM%s poweroff (%s)", vm.vmnum=
, exc)
+
+        if self.testing_config.unload_host_drivers_on_teardown:
+            raise exceptions.GuestError(f'VM poweroff issue - cleanup on t=
est teardown')
+
+    def teardown(self):
+        try:
+            self.poweroff_vms()
+        except Exception as exc:
+            logger.error("Error on test teardown (%s)", exc)
+            # TODO: perhaps even better: pytest.fail(f'Error on test teard=
own ({exc})')
+        finally:
+            num_vfs =3D self.get_host.get_current_vfs()
+            self.get_host.clear_vf()
+            self.get_host.reset_provisioning(num_vfs)
+
+            if self.get_host.drm_driver is DriverModule.I915:
+                # Drop caches to ensure the available LMEM size is stable
+                self.get_host.drop_all_caches()
+
+            if self.testing_config.unload_host_drivers_on_teardown:
+                unload_host_drivers(self.get_host)
+
+
+@pytest.fixture(scope=3D'session', name=3D'get_os_image')
+def fixture_get_os_image(request):
+    return request.config.getoption('--vm-image')
+
+
+@pytest.fixture(scope=3D'session', name=3D'get_vm_modparams')
+def fixture_get_vm_modparams(request):
+    return request.config.getoption('--vm-modparams')
+
+
+@pytest.fixture(scope=3D'session', name=3D'get_host')
+def fixture_get_host():
+    return SriovHost()
+
+
+@pytest.fixture(scope=3D'class', name=3D'setup_vms')
+def fixture_setup_vms(get_os_image, get_vm_modparams, get_host, request):
+    """Arrange VM environment for the VMM Flows test execution.
+=20=20=20=20
+    VM setup steps follow the configuration provided as VmmTestingConfig p=
arameter, including:
+    host drivers probe (DRM and VFIO), provision and enable VFs, boot VMs =
and load guest DRM driver.
+    Tear-down phase covers test environment cleanup:
+    shutdown VMs, reset provisioning, disable VMs and optional host driver=
s unload.
+
+    The fixture is designed for test parametrization, as the input to the =
following test class decorator:
+    @pytest.mark.parametrize('setup_vms', set_test_config(max_vms=3DN), id=
s=3Didfn_test_config, indirect=3D['setup_vms'])
+    where 'set_test_config' provides request parameter with a VmmTestingCo=
nfig (usually list of configs).
+    """
+    tc: VmmTestingConfig =3D request.param
+
+    host: SriovHost =3D get_host
+    vgpu_profile: VgpuProfile =3D tc.vgpu_profile
+    num_vfs =3D vgpu_profile.get_num_vfs()
+
+    ts: VmmTestingSetup =3D VmmTestingSetup(get_os_image, get_vm_modparams=
, host, tc)
+
+    logger.info('[Test setup: %s]', tc)
+    logger.debug(repr(tc))
+
+    load_host_drivers(host)
+    assert driver_check(host)
+
+    # XXX: VF migration on discrete devices (with LMEM) is currently very =
slow and time-outs in CI execution (20min).
+    # As a temporary workaround, reduce size of LMEM assigned to VFs to sp=
eed up a state save/load process.
+    if tc.wa_reduce_vf_lmem and host.has_lmem():
+        logger.debug("W/A: reduce VFs LMEM quota to accelerate state save/=
restore")
+        org_vgpu_profile_vfLmem =3D vgpu_profile.vfLmem
+        vgpu_profile.vfLmem =3D min(vgpu_profile.vfLmem // 2, 536870912) #=
 Assign max 512 MB to VF
+
+    if vgpu_profile.get_class() is VgpuProfileClass.AUTO:
+        assert host.get_pf_auto_provisioning(), 'VFs auto-provisioning dis=
abled!'
+    else:
+        host.set_vgpu_profile(vgpu_profile)
+
+    assert host.create_vf(num_vfs) =3D=3D num_vfs
+
+    if tc.auto_poweron_vm:
+        bdf_list =3D [host.get_vf_bdf(vf) for vf in range(1, ts.get_num_vm=
s() + 1)]
+        for vm, bdf in zip(ts.get_vm, bdf_list):
+            vm.assign_vf(bdf)
+
+        ts.poweron_vms()
+
+        if tc.auto_probe_vm_driver:
+            modprobe_cmds =3D [modprobe_driver(vm, ts.get_vm_modprobe_para=
ms) for vm in ts.get_vm]
+            for i, cmd in enumerate(modprobe_cmds):
+                assert modprobe_driver_check(ts.get_vm[i], cmd), f'modprob=
e failed on VM{i}'
+
+    logger.info('[Test execution: %s]', tc)
+    yield ts
+
+    logger.info('[Test teardown: %s]', tc)
+    # XXX: cleanup counterpart for VFs LMEM quota workaround - restore ori=
ginal value
+    if tc.wa_reduce_vf_lmem and host.has_lmem():
+        vgpu_profile.vfLmem =3D org_vgpu_profile_vfLmem
+
+    ts.teardown()
+
+
+@pytest.fixture(scope=3D'function')
+def create_1host_1vm(get_os_image, get_vm_modparams, get_host):
+    ts: VmmTestingSetup =3D VmmTestingSetup(get_os_image, get_vm_modparams=
, get_host, VmmTestingConfig(VgpuProfile(), 1))
+
+    logger.info('[Test setup: %s]', ts.testing_config)
+    logger.debug(repr(ts.testing_config))
+    load_host_drivers(get_host)
+
+    logger.info('[Test execution: %s]', ts.testing_config)
+    yield ts
+
+    logger.info('[Test teardown: %s]', ts.testing_config)
+    ts.teardown()
+
+
+@pytest.fixture(scope=3D'function')
+def create_1host_2vm(get_os_image, get_vm_modparams, get_host):
+    ts: VmmTestingSetup =3D VmmTestingSetup(get_os_image, get_vm_modparams=
, get_host, VmmTestingConfig(VgpuProfile(), 2))
+
+    logger.info('[Test setup: %s]', ts.testing_config)
+    logger.debug(repr(ts.testing_config))
+    load_host_drivers(get_host)
+
+    logger.info('[Test execution: %s]', ts.testing_config)
+    yield ts
+
+    logger.info('[Test teardown: %s]', ts.testing_config)
+    ts.teardown()
+
+
+def idfn_test_config(test_config: VmmTestingConfig):
+    """Provide test config ID in parametrized tests (e.g. test_something[V=
4-2VM].
+    Usage: @pytest.mark.parametrize([...], ids=3Didfn_test_config, [...])
+    """
+    return str(test_config)
+
+
+RESULTS_FILE =3D Path() / "results.json"
+results =3D {
+    "results_version": 10,
+    "name": "results",
+    "tests": {},
+}
+
+
+@pytest.hookimpl(hookwrapper=3DTrue)
+def pytest_report_teststatus(report):
+    yield
+    with open(HOST_DMESG_FILE, 'r+', encoding=3D'utf-8') as dmesg_file:
+        dmesg =3D dmesg_file.read()
+        test_string =3D re.findall('[A-Za-z_.]*::.*', report.nodeid)[0]
+        results["name"] =3D f"vmtb_{test_string}"
+        test_name =3D f"vmtb@{test_string}"
+        if report.when =3D=3D 'call':
+            out =3D report.capstdout
+            if report.passed:
+                result =3D "pass"
+                out =3D f"{test_name} passed"
+            elif report.failed:
+                result =3D "fail"
+            else:
+                result =3D "skip"
+            result =3D {"out": out, "result": result, "time": {"start": 0,=
 "end": report.duration},
+                    "err": report.longreprtext, "dmesg": dmesg}
+            results["tests"][test_name] =3D result
+            dmesg_file.truncate(0)
+        elif report.when =3D=3D 'setup' and report.failed:
+            result =3D {"out": report.capstdout, "result": "crash", "time"=
: {"start": 0, "end": report.duration},
+                    "err": report.longreprtext, "dmesg": dmesg}
+            results["tests"][test_name] =3D result
+            dmesg_file.truncate(0)
+
+
+@pytest.hookimpl()
+def pytest_sessionfinish():
+    if RESULTS_FILE.exists():
+        RESULTS_FILE.unlink()
+    RESULTS_FILE.touch()
+    jsonString =3D json.dumps(results, indent=3D2)
+    with open(str(RESULTS_FILE), 'w',  encoding=3D'utf-8') as f:
+        f.write(jsonString)
diff --git a/tools/vmtb/vmm_flows/resources/vgpu_profile/ADL_int.csv b/tool=
s/vmtb/vmm_flows/resources/vgpu_profile/ADL_int.csv
new file mode 100755
index 000000000..1c38520f4
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/vgpu_profile/ADL_int.csv
@@ -0,0 +1,14 @@
+vGPUProfileInfo ProfileID,vGPUScheduler ResetAfterVfSwitch,General TilePro=
visioningMode,PFResources Lmem(B/tile),PFResources Contexts(perTile),PFReso=
urces Doorbells(perTile),PFResources GGTTSize(B/tile),VFResources Lmem(B/ti=
le),VFResources Contexts(perTile),VFResources Doorbells(perTile),VFResource=
s GGTTSize(B/tile),AdverseEvents GuCSamplingPeriod(msec),AdverseEvents GuCT=
hresholdCATError,AdverseEvents G2PFNotificationCountCATError,AdverseEvents =
PFNotificationFreqCATError(msec),AdverseEvents GuCThresholdPageFault,Advers=
eEvents G2PFNotificationCountPageFault,AdverseEvents PFNotificationFreqPage=
Fault(msec),AdverseEvents GuCThresholdH2GStorm,AdverseEvents G2PFNotificati=
onCountH2GStorm,AdverseEvents PFNotificationFreqH2GStorm(msec),AdverseEvent=
s GuCThresholdDbStorm,AdverseEvents G2PFNotificationCountDbStorm,AdverseEve=
nts PFNotificationFreqDbStorm(msec),AdverseEvents GuCThresholdGTIrqStorm,Ad=
verseEvents G2PFNotificationCountGTIrqStorm,AdverseEvents PFNotificationFre=
qGTIrqStorm(msec),AdverseEvents GuCThresholdEngineReset,AdverseEvents G2PFN=
otificationCountEngineReset,AdverseEvents PFNotificationFreqEngineReset(mse=
c)
+ADL_V1,F,3,n/a,1024,32,67108864,n/a,1024,224,4110417920,2,0,3,10000,0,3,10=
000,0,3,100,0,3,100,0,3,100,0,3,100
+ADL_V2,F,3,n/a,1024,32,67108864,n/a,1024,112,2055208960,2,0,3,10000,0,3,10=
000,0,3,100,0,3,100,0,3,100,0,3,100
+ADL_V4,F,3,n/a,1024,32,67108864,n/a,1024,56,1027604480,2,0,3,10000,0,3,100=
00,0,3,100,0,3,100,0,3,100,0,3,100
+ADL_V7,F,3,n/a,1024,32,67108864,n/a,1024,32,587202560,2,0,3,10000,0,3,1000=
0,0,3,100,0,3,100,0,3,100,0,3,100
+ADL_L1,F,3,n/a,1024,32,67108864,n/a,1024,224,4177526784,2,0,3,10000,0,3,10=
000,0,3,100,0,3,100,0,3,100,0,3,100
+ADL_L2,F,3,n/a,1024,32,67108864,n/a,1024,112,2088763392,2,0,3,10000,0,3,10=
000,0,3,100,0,3,100,0,3,100,0,3,100
+ADL_L4,F,3,n/a,1024,32,67108864,n/a,1024,56,1044381696,2,0,3,10000,0,3,100=
00,0,3,100,0,3,100,0,3,100,0,3,100
+ADL_L7,F,3,n/a,1024,32,67108864,n/a,1024,32,587202560,2,0,3,10000,0,3,1000=
0,0,3,100,0,3,100,0,3,100,0,3,100
+ADL_M1,F,3,n/a,1024,32,67108864,n/a,1024,224,4177526784,2,0,3,10000,0,3,10=
000,0,3,100,0,3,100,0,3,100,0,3,100
+ADL_M2,F,3,n/a,1024,32,67108864,n/a,1024,112,2088763392,2,0,3,10000,0,3,10=
000,0,3,100,0,3,100,0,3,100,0,3,100
+ADL_M4,F,3,n/a,1024,32,67108864,n/a,1024,56,1044381696,2,0,3,10000,0,3,100=
00,0,3,100,0,3,100,0,3,100,0,3,100
+ADL_M7,F,3,n/a,1024,32,67108864,n/a,1024,32,587202560,2,0,3,10000,0,3,1000=
0,0,3,100,0,3,100,0,3,100,0,3,100
+ADL_D7,F,3,n/a,1024,32,67108864,n/a,1024,32,587202560,2,0,3,10000,0,3,1000=
0,0,3,100,0,3,100,0,3,100,0,3,100
diff --git a/tools/vmtb/vmm_flows/resources/vgpu_profile/ADL_vfs.csv b/tool=
s/vmtb/vmm_flows/resources/vgpu_profile/ADL_vfs.csv
new file mode 100755
index 000000000..f02888d5a
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/vgpu_profile/ADL_vfs.csv
@@ -0,0 +1,14 @@
+vGPUProfileInfo ProfileID,vGPUProfileInfo Description,vGPUScheduler vGPUSc=
hedulerMode,vGPUScheduler PFExecutionQuanta(msec),vGPUScheduler PFPreemptio=
nTimeout(usec),vGPUScheduler VFExecutionQuanta(msec),vGPUScheduler VFPreemp=
tionTimeout(usec),vGPUScheduler ScheduleIfIdle
+ADL_V1,VDI | 1VF per pGPU | #VFs=3D1 | 30fps upto [1x4K 2xQHD 4xHD] @ H.26=
4,TS-GPUTile,1,2000,32,64000,F,
+ADL_V2,VDI | NVF per pGPU | #VFs=3D2 | 30fps upto [1xQHD 2xHD] @ H.264,TS-=
GPUTile,1,2000,16,32000,F,
+ADL_V4,VDI | NVF per pGPU | #VFs=3D4 | 30fps upto [1xHD] @ H.264,TS-GPUTil=
e,1,2000,8,16000,F,
+ADL_V7,VDI | NVF per pGPU | #VFs=3D7 | 30fps upto [1xHD] @ H.264,TS-GPUTil=
e,1,2000,4,8000,F,
+ADL_L1,IDV Local Display | 1VF per pGPU | #VFs=3D1 | Local Display FPS 30 =
| VM 30fps upto ,TS-GPUTile,3,6000,30,60000,F,
+ADL_L2,IDV Local Display | NVF per pGPU | #VFs=3D2 | Local Display FPS 30 =
| VM 30fps upto ,TS-GPUTile,5,10000,14,28000,F,
+ADL_L4,IDV Local Display | NVF per pGPU | #VFs=3D4 | Local Display FPS 30 =
| VM 30fps upto,TS-GPUTile,13,26000,5,10000,F,
+ADL_L7,IDV Local Display | NVF per pGPU | #VFs=3D7 | Local Display FPS 30 =
| VM 30fps upto ,TS-GPUTile,19,38000,2,4000,F,
+ADL_M1,MULTI | 1VF per pGPU | #VFs=3D1 | Best Effort Virtual Display,TS-GP=
UTile,1,2000,64,128000,F,
+ADL_M2,MULTI | NVF per pGPU | #VFs=3D2 | Best Effort Virtual Display,TS-GP=
UTile,1,2000,32,64000,F,
+ADL_M4,MULTI | NVF per pGPU | #VFs=3D4 | Best Effort Virtual Display,TS-GP=
UTile,1,2000,16,32000,F,
+ADL_M7,MULTI | NVF per pGPU | #VFs=3D7 | Best Effort Virtual Display,TS-GP=
UTile,1,2000,8,16000,F,
+ADL_D7,Legacy Default  | NVF per pGPU | #VFs=3D7 | Local Display | VM 30fp=
s,TS-GPUTile,25,0,25,0,F
diff --git a/tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM150_int.csv b/=
tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM150_int.csv
new file mode 100755
index 000000000..0a54fb147
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM150_int.csv
@@ -0,0 +1,14 @@
+=EF=BB=BFvGPUProfileInfo ProfileID,vGPUScheduler ResetAfterVfSwitch,Genera=
l TileProvisioningMode,PFResources Lmem(B/tile),PFResources Contexts(perTil=
e),PFResources Doorbells(perTile),PFResources GGTTSize(B/tile),VFResources =
Lmem(B/tile),VFResources Contexts(perTile),VFResources Doorbells(perTile),V=
FResources GGTTSize(B/tile),AdverseEvents GuCSamplingPeriod(msec),AdverseEv=
ents GuCThresholdCATError,AdverseEvents G2PFNotificationCountCATError,Adver=
seEvents PFNotificationFreqCATError(msec),AdverseEvents GuCThresholdPageFau=
lt,AdverseEvents G2PFNotificationCountPageFault,AdverseEvents PFNotificatio=
nFreqPageFault(msec),AdverseEvents GuCThresholdH2GStorm,AdverseEvents G2PFN=
otificationCountH2GStorm,AdverseEvents PFNotificationFreqH2GStorm(msec),Adv=
erseEvents GuCThresholdDbStorm,AdverseEvents G2PFNotificationCountDbStorm,A=
dverseEvents PFNotificationFreqDbStorm(msec),AdverseEvents GuCThresholdGTIr=
qStorm,AdverseEvents G2PFNotificationCountGTIrqStorm,AdverseEvents PFNotifi=
cationFreqGTIrqStorm(msec),AdverseEvents GuCThresholdEngineReset,AdverseEve=
nts G2PFNotificationCountEngineReset,AdverseEvents PFNotificationFreqEngine=
Reset(msec)
+ATSM150_R1,F,1,1073741824,1024,16,268435456,13528727552,1024,240,402653184=
0,0,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM150_V1,F,1,1073741824,1024,16,268435456,13528727552,1024,240,402653184=
0,0,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM150_V2,F,3,1073741824,1024,16,268435456,6763315200,1024,120,2013265920=
,0,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM150_V4,F,3,1073741824,1024,16,268435456,3380609024,1024,60,1006632960,=
0,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM150_V5,F,3,1073741824,1024,16,268435456,2705326080,1024,48,805306368,0=
,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM150_V8,F,3,1073741824,1024,16,268435456,1690304512,1024,30,503316480,0=
,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM150_V16,F,3,1073741824,1024,16,268435456,845152256,1024,15,251658240,0=
,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM150_M1,F,1,1073741824,1024,16,268435456,13528727552,1024,240,402653184=
0,0,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM150_M2,F,3,1073741824,1024,16,268435456,6763315200,1024,120,2013265920=
,0,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM150_M4,F,3,1073741824,1024,16,268435456,3380609024,1024,60,1006632960,=
0,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM150_M5,F,3,1073741824,1024,16,268435456,2705326080,1024,48,805306368,0=
,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM150_M8,F,3,1073741824,1024,16,268435456,1690304512,1024,30,503316480,0=
,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM150_M16,F,3,1073741824,1024,16,268435456,845152256,1024,15,251658240,0=
,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
diff --git a/tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM150_vfs.csv b/=
tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM150_vfs.csv
new file mode 100755
index 000000000..a8dd8c6c7
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM150_vfs.csv
@@ -0,0 +1,14 @@
+=EF=BB=BFvGPUProfileInfo ProfileID,vGPUProfileInfo Description,vGPUSchedul=
er vGPUSchedulerMode,vGPUScheduler PFExecutionQuanta(msec),vGPUScheduler PF=
PreemptionTimeout(usec),vGPUScheduler VFExecutionQuanta(msec),vGPUScheduler=
 VFPreemptionTimeout(usec),vGPUScheduler ScheduleIfIdle
+ATSM150_R1,RDSH| 1VF per pGPU | #VFs=3D1 | 60 fps upto [1x5K 2x4K 4xQHD 8x=
HD] at H.264,TS-GPUTile,1,2000,32,64000,F
+ATSM150_V1,VDI | 1VF per pGPU | #VFs=3D1 | 60 fps upto [1x5K 2x4K 4xQHD 8x=
HD] at H.264,TS-GPUTile,1,2000,32,64000,F
+ATSM150_V2,VDI | NVF per pGPU | #VFs=3D2 | 30 fps upto [1x5K 2x4K 4xQHD 8x=
HD] at H.264,TS-GPUTile,1,2000,16,32000,F
+ATSM150_V4,VDI | NVF per pGPU | #VFs=3D4 | 30 fps upto [1x4K 2xQHD 4xHD] a=
t H.264,TS-GPUTile,1,2000,8,16000,F
+ATSM150_V5,VDI | NVF per pGPU | #VFs=3D5 | 30 fps upto [2xQHD 4xHD] at H.2=
64,TS-GPUTile,1,2000,6,12000,F
+ATSM150_V8,VDI | NVF per pGPU | #VFs=3D8 | 30 fps upto [1xQHD 2xHD] at H.2=
65,TS-GPUTile,1,2000,4,8000,F
+ATSM150_V16,VDI | NVF per pGPU | #VFs=3D16 | 30 fps upto [1xHD] at H.264,T=
S-GPUTile,1,2000,2,4000,F
+ATSM150_M1,MULTI | 1VF per pGPU | #VFs=3D1 | Best Effort Virtual Display,T=
S-GPUTile,10,20000,64,128000,F
+ATSM150_M2,MULTI | NVF per pGPU | #VFs=3D2 | Best Effort Virtual Display,T=
S-GPUTile,10,20000,32,64000,F
+ATSM150_M4,MULTI | NVF per pGPU | #VFs=3D4 | Best Effort Virtual Display,T=
S-GPUTile,10,20000,16,32000,F
+ATSM150_M5,MULTI | NVF per pGPU | #VFs=3D5 | Best Effort Virtual Display,T=
S-GPUTile,10,20000,12,24000,F
+ATSM150_M8,MULTI | NVF per pGPU | #VFs=3D8 | Best Effort Virtual Display,T=
S-GPUTile,10,20000,8,16000,F
+ATSM150_M16,MULTI | NVF per pGPU | #VFs=3D16 | Best Effort Virtual Display=
,TS-GPUTile,10,20000,4,8000,F
diff --git a/tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM75_int.csv b/t=
ools/vmtb/vmm_flows/resources/vgpu_profile/ATSM75_int.csv
new file mode 100755
index 000000000..7ee8dc4ab
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM75_int.csv
@@ -0,0 +1,9 @@
+=EF=BB=BFvGPUProfileInfo ProfileID,vGPUScheduler ResetAfterVfSwitch,Genera=
l TileProvisioningMode,PFResources Lmem(B/tile),PFResources Contexts(perTil=
e),PFResources Doorbells(perTile),PFResources GGTTSize(B/tile),VFResources =
Lmem(B/tile),VFResources Contexts(perTile),VFResources Doorbells(perTile),V=
FResources GGTTSize(B/tile),AdverseEvents GuCSamplingPeriod(msec),AdverseEv=
ents GuCThresholdCATError,AdverseEvents G2PFNotificationCountCATError,Adver=
seEvents PFNotificationFreqCATError(msec),AdverseEvents GuCThresholdPageFau=
lt,AdverseEvents G2PFNotificationCountPageFault,AdverseEvents PFNotificatio=
nFreqPageFault(msec),AdverseEvents GuCThresholdH2GStorm,AdverseEvents G2PFN=
otificationCountH2GStorm,AdverseEvents PFNotificationFreqH2GStorm(msec),Adv=
erseEvents GuCThresholdDbStorm,AdverseEvents G2PFNotificationCountDbStorm,A=
dverseEvents PFNotificationFreqDbStorm(msec),AdverseEvents GuCThresholdGTIr=
qStorm,AdverseEvents G2PFNotificationCountGTIrqStorm,AdverseEvents PFNotifi=
cationFreqGTIrqStorm(msec),AdverseEvents GuCThresholdEngineReset,AdverseEve=
nts G2PFNotificationCountEngineReset,AdverseEvents PFNotificationFreqEngine=
Reset(msec)
+ATSM75_R1,F,1,1073741824,1024,16,268435456,4401922048,1024,240,4026531840,=
0,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM75_V1,F,1,1073741824,1024,16,268435456,4401922048,1024,240,4026531840,=
0,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM75_V3,F,3,1073741824,1024,16,268435456,1465909248,1024,80,1342177280,0=
,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM75_V6,F,3,1073741824,1024,16,268435456,731906048,1024,40,671088640,0,0=
,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM75_M1,F,1,1073741824,1024,16,268435456,4401922048,1024,240,4026531840,=
0,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM75_M3,F,3,1073741824,1024,16,268435456,1465909248,1024,80,1342177280,0=
,0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM75_M6,F,3,1073741824,1024,16,268435456,731906048,1024,40,671088640,0,0=
,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
+ATSM75_M12,F,3,1073741824,1024,16,268435456,364904448,1024,20,335544320,0,=
0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100
diff --git a/tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM75_vfs.csv b/t=
ools/vmtb/vmm_flows/resources/vgpu_profile/ATSM75_vfs.csv
new file mode 100755
index 000000000..58ff41175
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM75_vfs.csv
@@ -0,0 +1,9 @@
+=EF=BB=BFvGPUProfileInfo ProfileID,vGPUProfileInfo Description,vGPUSchedul=
er vGPUSchedulerMode,vGPUScheduler PFExecutionQuanta(msec),vGPUScheduler PF=
PreemptionTimeout(usec),vGPUScheduler VFExecutionQuanta(msec),vGPUScheduler=
 VFPreemptionTimeout(usec),vGPUScheduler ScheduleIfIdle
+ATSM75_R1,RDSH | 1VF per pGPU | #VFs=3D1 | 30fps upto [1x5K 2x4K 4xQHD 8xH=
D] @ H.264,TS-GPUTile,1,2000,32,64000,F
+ATSM75_V1,VDI | 1VF per pGPU | #VFs=3D1 | 30fps upto [1x5K 2x4K 4xQHD 8xHD=
] @ H.264,TS-GPUTile,1,2000,32,64000,F
+ATSM75_V3,VDI | NVF per pGPU | #VFs=3D3 | 30fps upto [1x4K 2xQHD 4xHD] @ H=
.264,TS-GPUTile,1,2000,11,22000,F
+ATSM75_V6,VDI | NVF per pGPU | #VFs=3D6 | 30fps upto [1xQHD2xHD] @ H.264,T=
S-GPUTile,1,2000,5,16000,F
+ATSM75_M1,MULTI | 1VF per pGPU | #VFs=3D1 | Best Effort Virtual Display,TS=
-GPUTile,10,20000,64,128000,F
+ATSM75_M3,MULTI | NVF per pGPU | #VFs=3D3 | Best Effort Virtual Display,TS=
-GPUTile,10,20000,22,44000,F
+ATSM75_M6,MULTI | NVF per pGPU | #VFs=3D6 | Best Effort Virtual Display,TS=
-GPUTile,10,20000,16,32000,F
+ATSM75_M12,MULTI | NVF per pGPU | #VFs=3D12 | Best Effort Virtual Display,=
TS-GPUTile,10,20000,8,16000,F
diff --git a/tools/vmtb/vmm_flows/resources/vgpu_profile/PVC2_int.csv b/too=
ls/vmtb/vmm_flows/resources/vgpu_profile/PVC2_int.csv
new file mode 100755
index 000000000..74557116c
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/vgpu_profile/PVC2_int.csv
@@ -0,0 +1,8 @@
+=EF=BB=BFvGPUProfileInfo ProfileID,vGPUScheduler ResetAfterVfSwitch,Genera=
l TileProvisioningMode,PFResources Lmem(B/tile),PFResources Contexts(perTil=
e),PFResources Doorbells(perTile),PFResources GGTTSize(B/tile),VFResources =
Lmem(B/tile),VFResources Contexts(perTile),VFResources Doorbells(perTile),V=
FResources GGTTSize(B/tile),AdverseEvents GuCSamplingPeriod(msec),AdverseEv=
ents GuCThresholdCATError,AdverseEvents G2PFNotificationCountCATError,Adver=
seEvents PFNotificationFreqCATError(msec),AdverseEvents GuCThresholdPageFau=
lt,AdverseEvents G2PFNotificationCountPageFault,AdverseEvents PFNotificatio=
nFreqPageFault(msec),AdverseEvents GuCThresholdH2GStorm,AdverseEvents G2PFN=
otificationCountH2GStorm,AdverseEvents PFNotificationFreqH2GStorm(msec),Adv=
erseEvents GuCThresholdDbStorm,AdverseEvents G2PFNotificationCountDbStorm,A=
dverseEvents PFNotificationFreqDbStorm(msec),AdverseEvents GuCThresholdGTIr=
qStorm,AdverseEvents G2PFNotificationCountGTIrqStorm,AdverseEvents PFNotifi=
cationFreqGTIrqStorm(msec),AdverseEvents GuCThresholdEngineReset,AdverseEve=
nts G2PFNotificationCountEngineReset,AdverseEvents PFNotificationFreqEngine=
Reset(msec)=0D
+PVC2_C1,F,1,4294967296,1024,16,41943040,64424509440,1024,240,4177526784,2,=
0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100=0D
+PVC2_C2,F,2,4294967296,1024,16,41943040,32212254720,1024,240,2126512128,2,=
0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100=0D
+PVC2_C4,F,3,4294967296,1024,16,41943040,16106127360,1024,120,1063256064,2,=
0,3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100=0D
+PVC2_C8,F,3,4294967296,1024,16,41943040,8053063680,1024,60,531628032,2,0,3=
,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100=0D
+PVC2_C16,F,3,4294967296,1024,16,41943040,4026531840,1024,30,265814016,2,0,=
3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100=0D
+PVC2_C32,F,3,4294967296,1024,16,41943040,2013265920,1024,15,132907008,2,0,=
3,10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100=0D
+PVC2_C62,F,3,4294967296,1024,16,41943040,1039104990,1024,7,68597165,2,0,3,=
10000,0,3,10000,0,3,100,0,3,100,0,3,100,0,3,100=0D
diff --git a/tools/vmtb/vmm_flows/resources/vgpu_profile/PVC2_vfs.csv b/too=
ls/vmtb/vmm_flows/resources/vgpu_profile/PVC2_vfs.csv
new file mode 100755
index 000000000..7384f4c5b
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/vgpu_profile/PVC2_vfs.csv
@@ -0,0 +1,8 @@
+=EF=BB=BFvGPUProfileInfo ProfileID,vGPUProfileInfo Description,vGPUSchedul=
er vGPUSchedulerMode,vGPUScheduler PFExecutionQuanta(msec),vGPUScheduler PF=
PreemptionTimeout(usec),vGPUScheduler VFExecutionQuanta(msec),vGPUScheduler=
 VFPreemptionTimeout(usec),vGPUScheduler ScheduleIfIdle=0D
+PVC2_C1,COMPUTE| 1VF per pGPU | #VFs=3D1,TS-GPUTile,64,128000,64,128000,F=
=0D
+PVC2_C2,COMPUTE| 1VF per Tile | #VFs=3D2,TS-GPUTile,64,128000,64,128000,F=
=0D
+PVC2_C4,COMPUTE| 2VFs per Tile | #VFs=3D4,TS-GPUTile,64,128000,64,128000,F=
=0D
+PVC2_C8,COMPUTE| 4VFs per Tile | #VFs=3D8,TS-GPUTile,64,128000,64,128000,F=
=0D
+PVC2_C16,COMPUTE| 8VFs per Tile | #VFs=3D16,TS-GPUTile,8,16000,32,64000,T=
=0D
+PVC2_C32,COMPUTE| 16VFs per Tile | #VFs=3D32,TS-GPUTile,4,8000,16,32000,T=
=0D
+PVC2_C62,COMPUTE| 31VFs per Tile | #VFs=3D62,TS-GPUTile,2,4000,8,16000,T=0D
diff --git a/tools/vmtb/vmm_flows/test_basic.py b/tools/vmtb/vmm_flows/test=
_basic.py
new file mode 100644
index 000000000..d62ddc08e
--- /dev/null
+++ b/tools/vmtb/vmm_flows/test_basic.py
@@ -0,0 +1,175 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+
+## Copyright =C2=A9 2024 Intel Corporation ##
+
+import logging
+import time
+from typing import List, Tuple
+
+import pytest
+
+from bench import exceptions
+from bench.executors.igt import IgtExecutor, IgtType
+from bench.executors.gem_wsim import (GemWsim, GemWsimResult, gem_wsim_par=
allel_exec_and_check,
+                                      PREEMPT_10MS_WORKLOAD, ONE_CYCLE_DUR=
ATION_MS)
+from bench.helpers.helpers import (driver_check, igt_check, igt_run_check,=
 modprobe_driver_run_check)
+from bench.machines.host import SriovHost
+from bench.machines.vgpu_profile import VgpuProfileClass
+from bench.machines.pci import GpuDevice
+from vmm_flows.conftest import VmmTestingSetup, VmmTestingConfig, idfn_tes=
t_config
+
+logger =3D logging.getLogger(__name__)
+
+WL_ITERATIONS_10S =3D 1000
+WL_ITERATIONS_30S =3D 3000
+MS_IN_SEC =3D 1000
+DELAY_FOR_WORKLOAD_SEC =3D 2 # Waiting gem_wsim to be running [seconds]
+DELAY_FOR_RELOAD_SEC =3D 3 # Waiting before driver reloading [seconds]
+
+
+def set_test_config(test_variants: List[Tuple[VgpuProfileClass, int]],
+                    max_vms: int =3D 2, vf_driver_load: bool =3D True) -> =
List[VmmTestingConfig]:
+    """Helper function to provide a parametrized test with a list of test =
configuration variants."""
+    logger.debug("Init test variants: %s", test_variants)
+    host =3D SriovHost()
+    test_configs: List[VmmTestingConfig] =3D []
+
+    for profile_config in test_variants:
+        try:
+            vgpu_profile =3D host.get_vgpu_profile_by_class(*profile_confi=
g)
+            test_configs.append(VmmTestingConfig(vgpu_profile,
+                                                  min(vgpu_profile.get_num=
_vfs(), max_vms),
+                                                  auto_probe_vm_driver=3Dv=
f_driver_load))
+        except exceptions.VgpuProfileError as exc:
+            logger.warning("Test variant not supported: %s", exc)
+
+    return test_configs
+
+
+test_variants_1 =3D [(VgpuProfileClass.AUTO, 1), (VgpuProfileClass.AUTO, 2=
)]
+
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_1), id=
s=3Didfn_test_config, indirect=3D['setup_vms'])
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
+        ts: VmmTestingSetup =3D setup_vms
+
+        for vm in ts.vms:
+            logger.info("[%s] Verify VF DRM driver is loaded in a guest OS=
", vm)
+            assert driver_check(vm)
+
+
+if SriovHost().gpu_name is GpuDevice.PVC:
+    test_variants_2 =3D [(VgpuProfileClass.AUTO, 2),
+                       (VgpuProfileClass.COMPUTE, 1), (VgpuProfileClass.CO=
MPUTE, 2)]
+else:
+    test_variants_2 =3D [(VgpuProfileClass.AUTO, 2),
+                       (VgpuProfileClass.MULTIPURPOSE, 1), (VgpuProfileCla=
ss.MULTIPURPOSE, 2),
+                       (VgpuProfileClass.VDI, 4)]
+
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants_2), id=
s=3Didfn_test_config, indirect=3D['setup_vms'])
+class TestVmWorkload:
+    """Verify basic IGT workload execution a VM(s):
+    - exec_store: basic store submissions on single/multiple VMs
+    - gem_wsim: workload simulator running in parallel on multiple VMs
+    """
+    def test_store(self, setup_vms):
+        logger.info("Test VM execution: exec_store")
+        ts: VmmTestingSetup =3D setup_vms
+        igt_worklads: List[IgtExecutor] =3D []
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
+        ts: VmmTestingSetup =3D setup_vms
+
+        if ts.get_num_vms() < 2:
+            pytest.skip("Test scenario not supported for 1xVM setup ")
+
+        # Single workload takes 10ms GPU time, multiplied by 1000 iteratio=
ns
+        # gives the expected 10s duration and 100 workloads/sec
+        expected =3D GemWsimResult(ONE_CYCLE_DURATION_MS * WL_ITERATIONS_1=
0S * len(ts.vms) / MS_IN_SEC,
+                                MS_IN_SEC/ONE_CYCLE_DURATION_MS / len(ts.v=
ms))
+
+        # Check preemptable workload
+        result =3D gem_wsim_parallel_exec_and_check(ts.vms, PREEMPT_10MS_W=
ORKLOAD, WL_ITERATIONS_10S, expected)
+        logger.info("Execute wsim parallel on VMs - results: %s", result)
+
+
+if SriovHost().gpu_name is GpuDevice.PVC:
+    test_variants_3 =3D [(VgpuProfileClass.AUTO, 2), (VgpuProfileClass.COM=
PUTE, 2), (VgpuProfileClass.COMPUTE, 4)]
+else:
+    test_variants_3 =3D [(VgpuProfileClass.AUTO, 2), (VgpuProfileClass.VDI=
, 2), (VgpuProfileClass.MULTIPURPOSE, 4)]
+
+@pytest.mark.parametrize('setup_vms', set_test_config(test_variants=3Dtest=
_variants_3, max_vms=3D4, vf_driver_load=3DFalse),
+                         ids =3D idfn_test_config, indirect=3D['setup_vms'=
])
+class TestVfDriverLoadRemove:
+    """Verify VF (guest) driver load or remove doesn't affect execution on=
 the other VM:
+    - probe VF driver on the last VM while the first VM is running workload
+    - remove VF driver on the first VM while the last VM is running worklo=
ad
+    - reload previosuly removed VF driver on the same VM
+    """
+    def test_load(self, setup_vms):
+        logger.info("Test VM driver load: VF driver probe while other VM e=
xecutes workload")
+        ts: VmmTestingSetup =3D setup_vms
+
+        vm_first =3D ts.vms[0]
+        vm_last =3D ts.vms[-1]
+
+        logger.info("[%s] Load VF driver and run basic WL - first VM", vm_=
first)
+        assert modprobe_driver_run_check(vm_first, ts.get_vm_modprobe_para=
ms)
+
+        expected_elapsed_sec =3D ONE_CYCLE_DURATION_MS * WL_ITERATIONS_30S=
 / MS_IN_SEC
+        gem_wsim =3D GemWsim(vm_first, 1, WL_ITERATIONS_30S, PREEMPT_10MS_=
WORKLOAD)
+        time.sleep(DELAY_FOR_WORKLOAD_SEC)
+        assert gem_wsim.is_running()
+
+        logger.info("[%s] Load VF driver - last VM", vm_last)
+        assert modprobe_driver_run_check(vm_last, ts.get_vm_modprobe_param=
s)
+
+        result =3D gem_wsim.wait_results()
+        assert expected_elapsed_sec * 0.8 < result.elapsed_sec < expected_=
elapsed_sec * 1.2
+
+    def test_reload(self, setup_vms):
+        logger.info("Test VM driver reload: VF driver remove is followed b=
y probe while other VM executes workload")
+        ts: VmmTestingSetup =3D setup_vms
+
+        vm_first =3D ts.vms[0]
+        vm_last =3D ts.vms[-1]
+
+        logger.info("[%s] Run basic WL - last VM", vm_last)
+        expected_elapsed_sec =3D ONE_CYCLE_DURATION_MS * WL_ITERATIONS_30S=
 / MS_IN_SEC
+        gem_wsim =3D GemWsim(vm_last, 1, WL_ITERATIONS_30S, PREEMPT_10MS_W=
ORKLOAD)
+        time.sleep(DELAY_FOR_WORKLOAD_SEC)
+        assert gem_wsim.is_running()
+
+        logger.info("[%s] Remove VF driver - first VM", vm_first)
+        rmmod_pid =3D vm_first.execute(f'modprobe -rf {vm_first.get_drm_dr=
iver()}')
+        assert vm_first.execute_wait(rmmod_pid).exit_code =3D=3D 0
+
+        time.sleep(DELAY_FOR_RELOAD_SEC)
+
+        logger.info("[%s] Reload VF driver and run basic WL - first VM", v=
m_first)
+        assert modprobe_driver_run_check(vm_first, ts.get_vm_modprobe_para=
ms)
+        assert igt_run_check(vm_first, IgtType.EXEC_STORE)
+
+        result =3D gem_wsim.wait_results()
+        assert expected_elapsed_sec * 0.8 < result.elapsed_sec < expected_=
elapsed_sec * 1.2
--=20
2.39.1

