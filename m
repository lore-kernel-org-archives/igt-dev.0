Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF69BC25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 08:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227B910E066;
	Thu, 23 May 2024 08:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0jZvkNl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD2810E066
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 08:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716453047; x=1747989047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BHj09m5FkLlIg9R+vWWg2VRVtelfnHD3+khUhvobags=;
 b=Q0jZvkNlWGYVANwHWNPwh+hg4ZHul5XcgJiheEjn+vha3OfIUSvUU2EP
 uaNM3xCyEZ7y2lJnYF04PKTY2yMhq2IMAUu+0KBBZ7L8ytNYn+ZPJA/rc
 k+fjRp4zpLYdqb6iSlkkaDJnvaPPUtND9i5sNbOsLcJOWFaVL0fkVmH2G
 uRDIqKf3TB9GPVBNH4X5Jzsk7Ew6VqNGGLIC1PKQNGWsahn7pWv8ey8SO
 MSOqsVX+fsbzzxfxCsBh9wYHvbCb9QPpEf4koCfKE7OXBvWzuWR5vi8hi
 D6da1nJx6IAkoVLrO5DJfaVIuu6YppLs0wuufDd61b/jMLyYc5fOu91C4 g==;
X-CSE-ConnectionGUID: 4dOriZfWSxa6ZIAXOEMRzA==
X-CSE-MsgGUID: npqUsOnlR7KEYtaV2skEew==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="24161792"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="24161792"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 01:30:46 -0700
X-CSE-ConnectionGUID: rqhywctzRniIxncFQdKVoA==
X-CSE-MsgGUID: Y9HEYJBgT+WtjR2l770zUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="33595370"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 01:30:44 -0700
Date: Thu, 23 May 2024 10:30:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 mauro.chehab@linux.intel.com
Subject: Re: [PATCH i-g-t] [RFC] Introduce SR-IOV VM-level testing tool
Message-ID: <20240523083024.engefw4uxfigvogb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 mauro.chehab@linux.intel.com
References: <20240523075156.181339-1-adam.miszczak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240523075156.181339-1-adam.miszczak@linux.intel.com>
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

Hi Adam,
On 2024-05-23 at 09:51:56 +0200, Adam Miszczak wrote:
> VM Test Bench (VMTB) is a tool for testing virtualization (SR-IOV) supported by xe/i915 driver.
> It allows to enable and provision VFs (Virtual Functions) and facilitates manipulation of VMs (Virtual Machines) running virtual GPUs.
> This includes starting and accessing the KVM/QEMU VMs, running workloads or shell commands (Guest/Host), handling power states, saving and restoring VF state etc.

Please fold lines at 65 column.

> 
> Currently the following SR-IOV VM test scenarios are covered:
> - basic VF/VM setup with IGT workload submission
> - VF provisioning with various vGPU profiles
> - VF save/restore (VM cold migration)
> - VF scheduling
> - VM power states
> - VF FLR
> - VM crash (guest kernel panic)
> - GuC FW versioning
> 
> There's still refactoring ongoing for few tests, but any feedback would be greatly appreciated.

Same here, fold at 65 column.

> 
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>  tools/vmtb/LICENSE.txt                        |  20 +
>  tools/vmtb/MANIFEST.in                        |   3 +
>  tools/vmtb/README.md                          |  80 ++
>  tools/vmtb/bench/__init__.py                  |  46 +
>  tools/vmtb/bench/exceptions.py                |  38 +
>  tools/vmtb/bench/executors/__init__.py        |   0
>  .../bench/executors/executor_interface.py     |  24 +
>  tools/vmtb/bench/executors/gem_wsim.py        |  71 ++
>  tools/vmtb/bench/executors/igt.py             | 127 +++
>  tools/vmtb/bench/executors/shell.py           |  31 +
>  tools/vmtb/bench/helpers/__init__.py          |   0
>  tools/vmtb/bench/helpers/helpers.py           | 248 +++++
>  tools/vmtb/bench/machines/__init__.py         |   0
>  tools/vmtb/bench/machines/host.py             | 820 +++++++++++++++
>  .../vmtb/bench/machines/machine_interface.py  |  70 ++
>  tools/vmtb/bench/machines/pci.py              |  99 ++
>  tools/vmtb/bench/machines/vgpu_profile.py     | 197 ++++
>  tools/vmtb/bench/machines/virtual/__init__.py |   0
>  .../machines/virtual/backends/__init__.py     |   0
>  .../virtual/backends/backend_interface.py     |  42 +
>  .../machines/virtual/backends/guestagent.py   | 101 ++
>  .../machines/virtual/backends/qmp_monitor.py  | 163 +++
>  tools/vmtb/bench/machines/virtual/vm.py       | 595 +++++++++++
>  tools/vmtb/dev-requirements.txt               |  14 +
>  tools/vmtb/pyproject.toml                     |  26 +
>  tools/vmtb/requirements.txt                   |   2 +
>  tools/vmtb/tests/__init__.py                  |   1 +
>  tools/vmtb/tests/conftest.py                  |  65 ++
>  tools/vmtb/tests/pytest.ini                   |   6 +
>  tools/vmtb/tests/test_executors.py            | 109 ++
>  tools/vmtb/tests/test_igt_executors.py        |  24 +
>  tools/vmtb/tests/test_timer.py                |  23 +
>  tools/vmtb/tests/test_vm.py                   |  89 ++
>  tools/vmtb/vmm_flows/__init__.py              |   0
>  tools/vmtb/vmm_flows/conftest.py              | 296 ++++++
>  .../vmm_flows/resources/guc/guc_versions.txt  |   4 +
>  .../resources/vgpu_profile/ADL_int.csv        |  14 +
>  .../resources/vgpu_profile/ADL_vfs.csv        |  14 +
>  .../resources/vgpu_profile/ATSM150_int.csv    |  14 +
>  .../resources/vgpu_profile/ATSM150_vfs.csv    |  14 +
>  .../resources/vgpu_profile/ATSM75_int.csv     |   9 +
>  .../resources/vgpu_profile/ATSM75_vfs.csv     |   9 +
>  .../resources/vgpu_profile/PVC2_int.csv       |   8 +
>  .../resources/vgpu_profile/PVC2_vfs.csv       |   8 +
>  tools/vmtb/vmm_flows/test_basic.py            | 175 ++++

Could you start with only basic one? So first patch
will be a little smaller.

>  tools/vmtb/vmm_flows/test_flr_vm.py           | 162 +++
>  tools/vmtb/vmm_flows/test_guc_versioning.py   | 157 +++
>  tools/vmtb/vmm_flows/test_migration.py        | 955 ++++++++++++++++++
>  tools/vmtb/vmm_flows/test_provisioning.py     | 555 ++++++++++
>  tools/vmtb/vmm_flows/test_scheduling.py       | 123 +++
>  tools/vmtb/vmm_flows/test_vm_panic.py         |  84 ++
>  .../vmtb/vmm_flows/test_vm_states_control.py  | 140 +++
>  52 files changed, 5875 insertions(+)
>  create mode 100644 tools/vmtb/LICENSE.txt
>  create mode 100644 tools/vmtb/MANIFEST.in
>  create mode 100644 tools/vmtb/README.md
>  create mode 100644 tools/vmtb/bench/__init__.py
>  create mode 100644 tools/vmtb/bench/exceptions.py
>  create mode 100644 tools/vmtb/bench/executors/__init__.py
>  create mode 100644 tools/vmtb/bench/executors/executor_interface.py
>  create mode 100644 tools/vmtb/bench/executors/gem_wsim.py
>  create mode 100644 tools/vmtb/bench/executors/igt.py
>  create mode 100644 tools/vmtb/bench/executors/shell.py
>  create mode 100644 tools/vmtb/bench/helpers/__init__.py
>  create mode 100644 tools/vmtb/bench/helpers/helpers.py
>  create mode 100644 tools/vmtb/bench/machines/__init__.py
>  create mode 100644 tools/vmtb/bench/machines/host.py
>  create mode 100644 tools/vmtb/bench/machines/machine_interface.py
>  create mode 100644 tools/vmtb/bench/machines/pci.py
>  create mode 100644 tools/vmtb/bench/machines/vgpu_profile.py
>  create mode 100644 tools/vmtb/bench/machines/virtual/__init__.py
>  create mode 100644 tools/vmtb/bench/machines/virtual/backends/__init__.py
>  create mode 100644 tools/vmtb/bench/machines/virtual/backends/backend_interface.py
>  create mode 100644 tools/vmtb/bench/machines/virtual/backends/guestagent.py
>  create mode 100644 tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
>  create mode 100644 tools/vmtb/bench/machines/virtual/vm.py
>  create mode 100644 tools/vmtb/dev-requirements.txt
>  create mode 100644 tools/vmtb/pyproject.toml
>  create mode 100644 tools/vmtb/requirements.txt
>  create mode 100644 tools/vmtb/tests/__init__.py
>  create mode 100644 tools/vmtb/tests/conftest.py
>  create mode 100644 tools/vmtb/tests/pytest.ini
>  create mode 100644 tools/vmtb/tests/test_executors.py
>  create mode 100644 tools/vmtb/tests/test_igt_executors.py
>  create mode 100644 tools/vmtb/tests/test_timer.py
>  create mode 100644 tools/vmtb/tests/test_vm.py
>  create mode 100644 tools/vmtb/vmm_flows/__init__.py
>  create mode 100644 tools/vmtb/vmm_flows/conftest.py
>  create mode 100644 tools/vmtb/vmm_flows/resources/guc/guc_versions.txt
>  create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/ADL_int.csv
>  create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/ADL_vfs.csv
>  create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM150_int.csv
>  create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM150_vfs.csv
>  create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM75_int.csv
>  create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/ATSM75_vfs.csv
>  create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/PVC2_int.csv
>  create mode 100755 tools/vmtb/vmm_flows/resources/vgpu_profile/PVC2_vfs.csv
>  create mode 100644 tools/vmtb/vmm_flows/test_basic.py
>  create mode 100644 tools/vmtb/vmm_flows/test_flr_vm.py
>  create mode 100644 tools/vmtb/vmm_flows/test_guc_versioning.py
>  create mode 100644 tools/vmtb/vmm_flows/test_migration.py
>  create mode 100644 tools/vmtb/vmm_flows/test_provisioning.py
>  create mode 100644 tools/vmtb/vmm_flows/test_scheduling.py
>  create mode 100644 tools/vmtb/vmm_flows/test_vm_panic.py
>  create mode 100644 tools/vmtb/vmm_flows/test_vm_states_control.py
> 
> diff --git a/tools/vmtb/LICENSE.txt b/tools/vmtb/LICENSE.txt
> new file mode 100644
> index 000000000..a1c498458
> --- /dev/null
> +++ b/tools/vmtb/LICENSE.txt

Do we need this file? We have licence written in almost all
other files so imho we do not need this.

> @@ -0,0 +1,20 @@
> +Copyright © 2024 Intel Corporation

If you insist, we can have here SPDX MIT + Intel (c) 2024
but I do not see any point in having a file with licence only.

> +
> +Permission is hereby granted, free of charge, to any person obtaining a
> +copy of this software and associated documentation files (the "Software"),
> +to deal in the Software without restriction, including without limitation
> +the rights to use, copy, modify, merge, publish, distribute, sublicense,
> +and/or sell copies of the Software, and to permit persons to whom the
> +Software is furnished to do so, subject to the following conditions:
> +
> +The above copyright notice and this permission notice (including the next
> +paragraph) shall be included in all copies or substantial portions of the
> +Software.
> +
> +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> +THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> +FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> +IN THE SOFTWARE.
> diff --git a/tools/vmtb/MANIFEST.in b/tools/vmtb/MANIFEST.in
> new file mode 100644
> index 000000000..a51ce38c2
> --- /dev/null
> +++ b/tools/vmtb/MANIFEST.in
> @@ -0,0 +1,3 @@
> +include tests/pytest.ini
> +include vmm_flows/resources/guc/*
> +include vmm_flows/resources/vgpu_profile/*
> diff --git a/tools/vmtb/README.md b/tools/vmtb/README.md
> new file mode 100644
> index 000000000..9a353c673
> --- /dev/null
> +++ b/tools/vmtb/README.md
> @@ -0,0 +1,80 @@
> +VM Test Bench
> +=============
> +
> +Description
> +-----------
> +VM Test Bench (VMTB) is a tool for testing virtualization (SR-IOV) supported by xe/i915 driver.
> +It allows to enable and provision VFs (Virtual Functions) and facilitates manipulation of VMs (Virtual Machines) running virtual GPUs.
> +This includes starting and accessing the KVM/QEMU VMs, running workloads or shell commands (Guest/Host), handling power states, saving and restoring VF state etc.

Please fold all description lines at column 80 (here and in all
other description files).
Exception is for example commands, if they are longer let it be.

> +
> +Requirements
> +------------
> +VMTB is implemented in Python using pytest testing framework.
> +
> +Host OS is expected to provide:
> +- xe/i915 PF driver with SR-IOV support
> +- VFIO driver (VF save/restore requires vendor specific driver variant)
> +- QEMU (VF save/restore requires QEMU 8.0+)
> +- IGT binaries
> +- Python 3.8+ with pytest installed
> +- VM Test Bench tool deployed
> +
> +Guest OS is expected to contain:
> +- xe/i915 VF driver
> +- QEMU Guest-Agent service for operating on Guest OS
> +- IGT binaries to execute worklads on VM
> +
> +Usual VMTB testing environment bases on Ubuntu 22.04 installed on Host and Guest, but execution on other distros should be also possible.
> +
> +Building
> +--------
> +
> +The VMTB source distribution package can be built with:
> +    
> +    make build
> +
> +or:
> +
> +    python -m build
> +
> +Both run the Python `build` frontend in an isolated virtual environment (`venv`).
> +
> +The output tarball is created in the `dist/` subdirectory, that should be copied and extracted on the host device under test.
> +
> +Running tests
> +-------------
> +Test implemented by VM Test Bench are called VMM Flows and located in `vmm_flows/` directory.
> +Test files are prefixed with `test_` and encapsulate related validation scenarios.
> +Each test file can contain multiple test classes (`TestXYZ`) or functions (`test_xyz`), that can be executed independently.
> +
> +Run the VMM Flows test in the following way (as root):
> +
> +    $ pytest-3 -v ./vmtb-1.0.0/vmm_flows/<test_file_name>.py::<test_class_or_function_name> --vm-image=/home/gta/<guest_os.img>
> +
> +For example, the simplest 1xVF/VM test scenario can be executed as:
> +
> +    # sudo pytest-3 -v ./vmtb-1.0.0/vmm_flows/test_basic.py::TestVmSetup::test_vm_boot[A1-1VM] --vm-image=/home/gta/guest_os.img
> +
> +(in case `pytest-3` command cannot be found, check with just `pytest`)
> +
> +Name of test class/function can be omitted to execute all tests in file.
> +File name can also be omitted, then all tests in `vmm_flows` directory will be executed.
> +
> +Test log (including VM dmesg) is available in `logfile.log` output file.
> +Test results are presented as a standard pytest output on a terminal.
> +VM (Guest OS) can be accessed manually over VNC on [host_IP]:5900 (where port is incremented for the consecutive VMs).
> +
> +Structure
> +---------
> +VMTB is divided into the following components:
> +
> +#### `bench/`
> +Contains 'core' part of the tool, including Host and VirtualMachine abstractions, means to execute workloads (or other tasks), various helper functions etc.
> +VMTB utilizes QMP (QEMU Machine Protocol) to communicate and operate with VMs and QGA (QEMU Guest Agent) to interact with the Guest OS.
> +
> +#### `vmm_flows/`
> +Contains actual functional VM-level tests (`test_*.py`) as well as a setup and tear-down fixtures (`conftest.py`).
> +New test files/scenarios shall be placed in this location.
> +
> +#### `tests/`
> +Contains (near) unit tests for the tool/bench itself.
> diff --git a/tools/vmtb/bench/__init__.py b/tools/vmtb/bench/__init__.py
> new file mode 100644
> index 000000000..ba55a7a02
> --- /dev/null
> +++ b/tools/vmtb/bench/__init__.py
> @@ -0,0 +1,46 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: MIT
> +
> +## Copyright (C) 2024 Intel Corporation ##
-----------------^
Why not '(c)' or even use dedicated UTF letter?

Copyright © 2024 Intel Corporation

I will cut my reponse here, will look at rest later.

Regards,
Kamil

[...]

