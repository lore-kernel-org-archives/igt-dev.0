Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8B510E878
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 12:10:51 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Nov 2023 13:10:35 +0100
Message-ID: <20231102121044.58786-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 0/4] drmtest changes for filtering GPUs
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
of new drmtest functions. It will work with and without filters,
also when first card is non-Intel one with no render device.

sudo build/tests/xe_create --r multigpu-create-massive-size

sudo IGT_DEVICE=pci:vendor=Intel,device=discrete,card=all build/tests/xe_create --r multigpu-create-massive-size

IGT-Version: 1.28-g24b5fbcb5 (x86_64) (Linux: 6.6.0-rc3-xe-public-37b2d042c23a+ x86_64)
Opened device: /dev/dri/card1
Starting subtest: multigpu-create-massive-size
<g:0> Opened device: /dev/dri/card1
<g:1> Opened device: /dev/dri/card2
<g:2> Opened device: /dev/dri/card3
Subtest multigpu-create-massive-size: SUCCESS (0.202s)

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>


Kamil Konieczny (4):
  lib/drmtest: add multi-GPU helpers for filtered devices
  tests/intel/xe_create: add multi-GPU basic test
  lib/drmtest: create helper for dropping logged opened paths
  tests/intel/xe_create: print first opened card

 lib/drmtest.c           | 126 +++++++++++++++++++++++++++++++++++++++-
 lib/drmtest.h           |   5 ++
 tests/intel/xe_create.c |  27 +++++++++
 3 files changed, 155 insertions(+), 3 deletions(-)

-- 
2.42.0
