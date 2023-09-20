Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26F310E0D6
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Sep 2023 16:22:51 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 20 Sep 2023 18:19:10 +0200
Message-ID: <20230920161913.54521-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] drmtest changes for running tests on
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
on three GPUs board, when first card is non-Intel one with no render
device:

sudo IGT_DEVICE=pci:vendor=Intel,device=discrete,card=all build/tests/xe_create --r multigpu-create-massive-size

(xe_create:12661) igt_core-DEBUG: Notice: using --device filters:
(xe_create:12661) igt_core-DEBUG: [pci:vendor=Intel,device=discrete,card=0]
(xe_create:12661) igt_core-DEBUG: [pci:vendor=Intel,device=discrete,card=1]
(xe_create:12661) igt_core-DEBUG: [pci:vendor=Intel,device=discrete,card=2]
IGT-Version: 1.28-g70fa04a25 (x86_64) (Linux: 6.5.0-rc7-xe-aeac46cfaebf+ x86_64)
(xe_create:12661) drmtest-DEBUG: card idx: 0 chipset: 128
(xe_create:12661) drmtest-DEBUG: Looking for devices to open using filter 0: pci:vendor=Intel,device=discrete,card=0
(xe_create:12661) drmtest-DEBUG: Filter matched /dev/dri/card1 | /dev/dri/renderD128
(xe_create:12661) drmtest-DEBUG: card idx: 0 found: /dev/dri/card1
Opened device: /dev/dri/card1
(xe_create:12661) drmtest-DEBUG: Test requirement passed: !(fd<0)
Starting subtest: multigpu-create-massive-size
(xe_create:12661) drmtest-DEBUG: Filter matched /dev/dri/card1 | /dev/dri/renderD128
(xe_create:12661) drmtest-DEBUG: Filter matched /dev/dri/card2 | /dev/dri/renderD129
(xe_create:12661) drmtest-DEBUG: Filter matched /dev/dri/card3 | /dev/dri/renderD130
(xe_create:12661) DEBUG: Test requirement passed: drm_multigpu_prepare_cards(DRIVER_XE) >= 2
running on 3 GPUs
(xe_create:12665) <g:1> drmtest-DEBUG: card idx: 1 chipset: 128
(xe_create:12665) <g:1> drmtest-DEBUG: Looking for devices to open using filter 1: pci:vendor=Intel,device=discrete,card=1
(xe_create:12665) <g:1> drmtest-DEBUG: Filter matched /dev/dri/card2 | /dev/dri/renderD129
(xe_create:12665) <g:1> drmtest-DEBUG: card idx: 1 found: /dev/dri/card2
<g:1> Opened device: /dev/dri/card2
(xe_create:12666) <g:2> drmtest-DEBUG: card idx: 2 chipset: 128
(xe_create:12666) <g:2> drmtest-DEBUG: Looking for devices to open using filter 2: pci:vendor=Intel,device=discrete,card=2
(xe_create:12666) <g:2> drmtest-DEBUG: Filter matched /dev/dri/card3 | /dev/dri/renderD130
(xe_create:12666) <g:2> drmtest-DEBUG: card idx: 2 found: /dev/dri/card3
<g:2> Opened device: /dev/dri/card3
Subtest multigpu-create-massive-size: SUCCESS (0.482s)
(xe_create:12661) igt_core-DEBUG: Exiting with status code 0

Kamil Konieczny (3):
  lib/drmtest: allow out of order device opening
  lib/drmtest: add multigpu helpers
  RFC: tests/intel/xe_create: extend massive subtest to multi-gpu

 lib/drmtest.c           | 119 +++++++++++++++++++++++++++++++++++++---
 lib/drmtest.h           |   4 ++
 tests/intel/xe_create.c |  23 ++++++++
 3 files changed, 138 insertions(+), 8 deletions(-)

-- 
2.42.0
