Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0B910EA24
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 16:01:55 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 17:01:44 +0100
Message-ID: <20231103160148.94811-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/3] drmtest changes for filtering GPUs
 on multi-gpu
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

      Here is a proposed solution for multi-GPU testing with the help
of new drmtest and igt_device_scan functions. It will work with and
without filters, also when first card is non-Intel one with no render
device.

sudo build/tests/xe_create --r multigpu-create-massive-size

sudo IGT_DEVICE=pci:vendor=Intel,device=discrete,card=all build/tests/xe_create --r multigpu-create-massive-size

sudo IGT_DEVICE=pci:vendor=Intel,card=all build/tests/xe_create --r multigpu-create-massive-size

Notice there is missing <g:0> below as almost every test opens default card
at beginnig fixture.

IGT-Version: 1.28-gacaff6334 (x86_64) (Linux: 6.6.0-rc3-xe-public-37b2d042c23a+ x86_64)
Opened device: /dev/dri/card1
Starting subtest: multigpu-create-massive-size
<g:1> Opened device: /dev/dri/card2
<g:2> Opened device: /dev/dri/card3
<g:3> Opened device: /dev/dri/card4
Subtest multigpu-create-massive-size: SUCCESS (2.160s)

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

v2: moved filtering into igt_device_scan.c (Zbigniew)
  simplify filtering in drmtest, add new helper function
  chipset_to_vendor_str, removed clearing logged devices as it
  is not essential (Kamil)

Kamil Konieczny (3):
  lib/igt_device_scan: add multigpu filtering view
  lib/drmtest: add multi-GPU helpers for filtered devices
  tests/intel/xe_create: add multi-GPU basic test

 lib/drmtest.c           | 49 ++++++++++++++++++++++++++++++++
 lib/drmtest.h           |  3 ++
 lib/igt_device_scan.c   | 62 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_device_scan.h   |  3 ++
 tests/intel/xe_create.c | 26 +++++++++++++++++
 5 files changed, 143 insertions(+)

-- 
2.42.0
