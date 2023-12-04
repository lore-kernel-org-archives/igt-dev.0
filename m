Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3ABD10E394
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 17:11:04 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  4 Dec 2023 18:10:25 +0100
Message-Id: <20231204171033.2167-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 0/8] Initial SR-IOV validation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Series introduces a basic SR-IOV test that validates VFs enabling in
different scenarios together with VF DRM driver binding. Implemented
library helpers rely on generic PCI device attributes defined in ABI.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Daniel Mrzyglod (1):
  lib/igt_sriov_device: add helper for checking if VF DRM driver is
    probed

Katarzyna Dec (4):
  lib/igt_sriov_device: add core SR-IOV helpers
  lib/igt_sriov_device: add helper for opening VF device
  tests/sriov_basic: add basic tests for enabling SR-IOV VFs
  tests/sriov_basic: validate driver binding to VFs

Lukasz Laguna (3):
  lib/igt_sriov_device: add helpers for operations in different VFs
    scenarios
  lib/igt_sriov_device: add helpers for VF DRM driver bind and unbind
  tests/sriov_basic: add more tests for VF driver binding

 lib/drmtest.c          |  22 ++-
 lib/drmtest.h          |   1 +
 lib/igt_sriov_device.c | 341 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_sriov_device.h |  72 +++++++++
 lib/meson.build        |   1 +
 tests/meson.build      |   1 +
 tests/sriov_basic.c    | 262 +++++++++++++++++++++++++++++++
 7 files changed, 696 insertions(+), 4 deletions(-)
 create mode 100644 lib/igt_sriov_device.c
 create mode 100644 lib/igt_sriov_device.h
 create mode 100644 tests/sriov_basic.c

-- 
2.40.0
