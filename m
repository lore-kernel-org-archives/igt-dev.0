Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABB4D609CC
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 10:22:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB3210E223;
	Wed, 27 Nov 2024 10:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTtyun1r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BC610E223
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 10:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732702930; x=1764238930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZcpvzHMXwW3I5BobjietkTZ3gOzuQrCMQwaa8KcXEoc=;
 b=DTtyun1ra30O3YYVuYfJLcHHykU3Vo26XB5TO2vqlUUeSn7Mh/fuC5Pj
 m9GfvT+IVfAVWcDbnnJECJEh7nZBZHWFrJIeW8OND122nyX8K2VGUgcyh
 3iKXkdVQL/wbMoGfmwCYvh4MVTKuvre8Z4OX+o8Il3+ne36MhcKv6rOOZ
 yMDpNIaD0O0UkBwdg5ogrbcVaghcW8Z+be+QQ012qWT/9682iuwb0rrss
 sE1J7zQ7xwltR/JTWXaT5cM1xuHreczkh7jN9N/8M/kaK/HI33EYp0Vo+
 93LmRKAtdrZmRlHuwfuyRCHJDoYXscvCJ/hujycIbE5qEzY1Hchvwjp1G w==;
X-CSE-ConnectionGUID: r/9uIaAGQa2BiXuQMG6nTQ==
X-CSE-MsgGUID: Yy0VU6E3Rz69Z8+6lVfJAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43391072"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="43391072"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 02:22:10 -0800
X-CSE-ConnectionGUID: skHKesMXTxSTSeaghbR63g==
X-CSE-MsgGUID: oJq3dm9eRImfSHM4F6Dibg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="96974268"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 02:22:09 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, marcin.bernatowicz@linux.intel.com,
 michal.wajdeczko@intel.com, pawel.sikora@intel.com
Subject: [PATCH i-g-t v3 0/4] vmtb: Introduce SR-IOV VM-level testing tool
Date: Wed, 27 Nov 2024 11:21:58 +0100
Message-Id: <20241127102202.3903735-1-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
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

Initially only basic test scenarios are provided:
- enable VFs, pass it to VMs and boot guest OS
- submit basic workloads on a guest with virtualized GPU
- exercise VF driver probe and remove

Proposed location for the new tool is the root IGT directory:
igt-gpu-tools/vmtb
but some other options can be also considered, for example:
tools/vmtb
tests/vmtb

v2:
- improve device detection function:
  instead of parsing lspci output with regex, iterate over
  sysfs driver directory to get bound devices' BDFs (Marcin)
- remove obsolete fixtures and other unused code (Marcin)

v3:
- integrate VMTB with IGT meson build/install system (Kamil)
- move the tool from IGT's root to tools/vmtb subdir (Kamil)
- split VMTB core implementation, tests, resources and meson config
  into separate patches (Kamil)
- update readme description for build, install and dependencies

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Paweł Sikora <pawel.sikora@intel.com>

Adam Miszczak (4):
  tools/vmtb: VM Test Bench core
  tools/vmtb: Basic SR-IOV tests
  tools/vmtb: Test resources - vGPU profiles
  tools/vmtb: Install VMTB with IGT build system

 meson.build                                   |   2 +
 meson_options.txt                             |   5 +
 tools/meson.build                             |   4 +
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
 tools/vmtb/vmm_flows/__init__.py              |   0
 tools/vmtb/vmm_flows/conftest.py              | 307 +++++++++
 .../resources/vgpu_profiles/Flex170.json      | 113 ++++
 tools/vmtb/vmm_flows/test_basic.py            | 160 +++++
 tools/vmtb/vmtb_config.json                   |  31 +
 44 files changed, 3741 insertions(+)
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
 create mode 100644 tools/vmtb/vmm_flows/__init__.py
 create mode 100644 tools/vmtb/vmm_flows/conftest.py
 create mode 100644 tools/vmtb/vmm_flows/resources/vgpu_profiles/Flex170.json
 create mode 100644 tools/vmtb/vmm_flows/test_basic.py
 create mode 100644 tools/vmtb/vmtb_config.json

-- 
2.39.1

