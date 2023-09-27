Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04C310E194
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 14:34:53 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 27 Sep 2023 16:34:42 +0200
Message-ID: <20230927143444.76363-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] drmtest changes for running tests on
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
and also introduce helper for multi-gpu scenarios. There is still a problem
left when opening first device because it is useally already opened at
first fixture but I will leave that for later. With that it works
on four GPUs board, when first card is non-Intel one with no render
device:

sudo IGT_DEVICE=pci:vendor=Intel,device=discrete,card=all build/tests/xe_create --r multigpu-create-massive-size

Opened device: /dev/dri/card1
Starting subtest: multigpu-create-massive-size
<g:1> Opened device: /dev/dri/card2
<g:2> Opened device: /dev/dri/card3
<g:3> Opened device: /dev/dri/card4
Subtest multigpu-create-massive-size: SUCCESS (0.209s)

v3: fixes in test (Zbigniew)
  fixes in drmlib functions (Zbigniew, Kamil)
v4: corrected test description (Kamil)

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  lib/drmtest: allow out of order device opening
  tests/intel/xe_create: extend massive subtest to multi-gpu

 lib/drmtest.c           | 26 ++++++++++++++++++++------
 tests/intel/xe_create.c | 25 +++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 6 deletions(-)

-- 
2.42.0
