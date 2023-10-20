Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CABE10E5A9
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 13:00:32 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 15:00:08 +0200
Message-ID: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 0/8] drmtest changes for running tests on
 multi-gpu
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

Allow to open other cards out of order with __drm_open_driver_another()
Here is a proposed solution for non-matched first device and additional
one when no filters are used but it may be re-worked later. It should
now work with three or more GPUs on board, also when first card is
non-Intel one with no render device:

sudo IGT_DEVICE=pci:vendor=Intel,device=discrete,card=all build/tests/xe_create --r multigpu-create-massive-size

IGT-Version: 1.28-g24b5fbcb5 (x86_64) (Linux: 6.6.0-rc3-xe-public-37b2d042c23a+ x86_64)
Opened device: /dev/dri/card1
Starting subtest: multigpu-create-massive-size
<g:0> Opened device: /dev/dri/card1
<g:1> Opened device: /dev/dri/card2
<g:2> Opened device: /dev/dri/card3
Subtest multigpu-create-massive-size: SUCCESS (0.202s)

With new helper and without filters:

sudo build/tests/xe_create --r multigpu-create-massive-size

IGT-Version: 1.28-g24b5fbcb5 (x86_64) (Linux: 6.6.0-rc3-xe-public-37b2d042c23a+ x86_64)
Opened device: /dev/dri/card1
Starting subtest: multigpu-create-massive-size
<g:0> Opened device: /dev/dri/card1
<g:1> Opened device: /dev/dri/card2
<g:2> Opened device: /dev/dri/card3
Subtest multigpu-create-massive-size: SUCCESS (0.268s)

v2: dropped additional patch 2/3 ("lib/drmtest: add multigpu helpers")
  changed 3/3 RFC patch as additional subtest
v3: fixes in test (Zbigniew)
  fixes in drmlib functions (Zbigniew, Kamil)
v4: corrected test description (Kamil)
v5: restore boundary index for already opened device (Kamil)
v6: fixes in libdrm: start searching for driver from requested index,
    limit checks for already opened drivers to currently
    opened count (Kamil)
v7: drop checks for already opened device with filters,
  change a place for igt_debug message, improve debugs (Kamil)
v8: add drm helper for the case when no filters are used,
  use this helper in xe_create multi-gpu subtest (Kamil)
v9: add helper for dropping logged opended cards, now it shows
  as <g:0> Opened device: /dev/dri/cardN (Kamil)

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Arkadiusz Hiler <arek@hiler.eu>

Kamil Konieczny (8):
  lib/drmtest: allow out of order device opening
  tests/intel/xe_create: extend massive subtest to multi-gpu
  lib/drmtest: drop checks for opened device for filters
  lib/drmtest: save skip offset for first opened device
  lib/drmtest: create helper for countig number of GPUs
  tests/intel/xe_create: use drm helper for GPUs count
  lib/drmtest: create helper for dropping opened paths
  tests/intel/xe_create: print first opened card

 lib/drmtest.c           | 151 +++++++++++++++++++++++++++++++++++-----
 lib/drmtest.h           |   3 +
 tests/intel/xe_create.c |  26 +++++++
 3 files changed, 163 insertions(+), 17 deletions(-)

-- 
2.42.0
