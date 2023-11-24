Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCDD10E7BC
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 08:53:06 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Nov 2023 09:52:51 +0100
Message-Id: <20231124085259.1777-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/8] Initial SR-IOV validation
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

 lib/drmtest.c          |  17 ++-
 lib/drmtest.h          |   1 +
 lib/igt_sriov_device.c | 340 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_sriov_device.h |  74 +++++++++
 lib/meson.build        |   1 +
 tests/meson.build      |   1 +
 tests/sriov_basic.c    | 262 +++++++++++++++++++++++++++++++
 7 files changed, 692 insertions(+), 4 deletions(-)
 create mode 100644 lib/igt_sriov_device.c
 create mode 100644 lib/igt_sriov_device.h
 create mode 100644 tests/sriov_basic.c

-- 
2.40.0
