Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA1910E520
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Nov 2022 08:53:10 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Nov 2022 14:22:50 +0530
Message-Id: <20221123085255.2820768-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/5] Cold Reset IGT Test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Adding Cold Reset IGT support

v3:
- Address the review comment from Aravind.

Anshuman Gupta (5):
  lib/igt_pci: helpers to get PCI capabilities offset
  lib/igt_pci: Add PCIe slot cap
  lib/igt_pm: Refactor get firmware_node fd
  test/device_reset: Refactor initiate_device_reset
  tests/device_reset: Add cold reset IGT test

 lib/igt_pci.c        |  44 ++++++++++++
 lib/igt_pci.h        |  35 +++++++++
 lib/igt_pm.c         |  76 +++++++++++++++++---
 lib/igt_pm.h         |   1 +
 lib/meson.build      |   1 +
 tests/device_reset.c | 167 +++++++++++++++++++++++++++++++++++++++----
 6 files changed, 300 insertions(+), 24 deletions(-)
 create mode 100644 lib/igt_pci.c
 create mode 100644 lib/igt_pci.h

-- 
2.25.1
