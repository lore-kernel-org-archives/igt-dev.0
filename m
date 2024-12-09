Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D167FE77180
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 14:24:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F06B10E4B7;
	Mon,  9 Dec 2024 14:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vl7oVbBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FCA10E4B7
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 14:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733754268; x=1765290268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jx08pFFP295dMrzhpVuQWfD14oz1zWkulSzzDFc6EwE=;
 b=Vl7oVbBMiUvn9pArDDMiggPEhRk/Rm5wUn0lZZEIMKhxCwuJ81eHiXwe
 4ZRIfFKZWJDp730VNTjq7qAwanPN+ZzlYlhgOU2l0FbTXfJ+7jEP0xnEn
 8DDcjSWOGTIDU8c8XdOE0mvx7d+4yUtvTdB8+8s4X3Xtb7m1itzurqdh6
 2OprySc4WL6/buONrfpcgwzLg5PpAvPjjlhrD0dcLD82rhSEixStPnzYQ
 1n0jDKL9PHViZ0O1MZeFOktFILaODTM0/Yf243uoXX+9hOJDbqkNK+URT
 Wum869316mIYZWfC+VkaPRsRe7HRCfNvObL3PlCOGdjp1BH9rV2IzqvJx g==;
X-CSE-ConnectionGUID: f3miVC5vQ+ylD6qLMQ06gA==
X-CSE-MsgGUID: OUL4zXv+Se2k8QX6rFi57A==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33968967"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="33968967"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:24:27 -0800
X-CSE-ConnectionGUID: oqz4lpcYS9SG4g1rE/xsdQ==
X-CSE-MsgGUID: U2e3CHGDQD2o++w72Rc/Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="94776037"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:24:25 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, marcin.bernatowicz@linux.intel.com,
 michal.wajdeczko@intel.com, pawel.sikora@intel.com
Subject: [PATCH i-g-t v4 0/4] vmtb: Introduce SR-IOV VM-level testing tool
Date: Mon,  9 Dec 2024 15:24:19 +0100
Message-Id: <20241209142423.2718734-1-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v4:
- fix checkpatch issues: typos, whitespaces (Kamil)

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

