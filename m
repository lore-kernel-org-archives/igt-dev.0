Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48E68989C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Oct 2023 14:59:27 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 16:59:17 +0200
Message-ID: <20231003145920.51148-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 0/3] drmtest changes for running tests on
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
<g:3> Opened device: /dev/dri/card4
Subtest multigpu-create-massive-size: SUCCESS (0.209s)

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

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Arkadiusz Hiler <arek@hiler.eu>

Kamil Konieczny (3):
  lib/drmtest: allow out of order device opening
  tests/intel/xe_create: extend massive subtest to multi-gpu
  lib/drmtest: drop checks for opened device for filters

 lib/drmtest.c           | 42 ++++++++++++++++++++++++++++-------------
 tests/intel/xe_create.c | 25 ++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 13 deletions(-)

-- 
2.42.0
