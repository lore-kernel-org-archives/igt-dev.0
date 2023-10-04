Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E980510E399
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 16:49:53 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Oct 2023 18:49:36 +0200
Message-ID: <20231004164946.138398-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 0/6] drmtest changes for running tests on
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
There is still a problem left when there is non-matched first device and
no filters are used, it will not work with legacy opening but I will
leave that for later. With filters it now works on four GPUs board, when
first card is non-Intel one with no render device:

sudo IGT_DEVICE=pci:vendor=Intel,device=discrete,card=all build/tests/xe_create --r multigpu-create-massive-size

Opened device: /dev/dri/card1
Starting subtest: multigpu-create-massive-size
<g:1> Opened device: /dev/dri/card2
<g:2> Opened device: /dev/dri/card3
Subtest multigpu-create-massive-size: SUCCESS (0.341s)

With new helper and without filters:

sudo build/tests/xe_create --r multigpu-create-massive-size

Opened device: /dev/dri/card1
Starting subtest: multigpu-create-massive-size
<g:1> Opened device: /dev/dri/card2
<g:2> Opened device: /dev/dri/card3
Subtest multigpu-create-massive-size: SUCCESS (1.686s)

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

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Arkadiusz Hiler <arek@hiler.eu>

Kamil Konieczny (6):
  lib/drmtest: allow out of order device opening
  tests/intel/xe_create: extend massive subtest to multi-gpu
  lib/drmtest: drop checks for opened device for filters
  lib/drmtest: save skip offset for first opened device
  lib/drmtest: add helper for countig number of GPUs
  tests/intel/xe_create: use drm helper for GPUs count

 lib/drmtest.c           | 129 +++++++++++++++++++++++++++++++++++-----
 lib/drmtest.h           |   2 +
 tests/intel/xe_create.c |  25 ++++++++
 3 files changed, 142 insertions(+), 14 deletions(-)

-- 
2.42.0
