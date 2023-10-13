Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB76410E18A
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 18:57:40 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Oct 2023 20:57:27 +0200
Message-ID: <20231013185732.98000-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] introduce gem_multigpu and other
 multi-GPU helpers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add some multi-gpu function helpers and macros. One thing
that allows it to use  __drm_open_driver_another(2, ...)
is that in macros, before calling multi_fork() it opens all
devices in-order, one after another. The drawback is somewhat
time consuming work before test begins and it also do not
print in logs <g:gpu-number> for opening devices.

Sample runs when first device is non-Intel, first one
without filters:

sudo build/tests/xe_create --r multigpu-create-massive-size

Opened device: /dev/dri/card1
Starting subtest: multigpu-create-massive-size
Opened device: /dev/dri/card2
Opened device: /dev/dri/card3
Subtest multigpu-create-massive-size: SUCCESS (4.302s)

Second one with filters:

sudo IGT_DEVICE=pci:vendor=Intel,device=discrete,card=all build/tests/xe_create --r multigpu-create-massive-size

Opened device: /dev/dri/card1
Starting subtest: multigpu-create-massive-size
Opened device: /dev/dri/card2
Opened device: /dev/dri/card3
Subtest multigpu-create-massive-size: SUCCESS (3.824s)

Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Dominik Karol Piątkowski (4):
  lib/igt_device_scan: Introduce filtering out non-PCI devices
  lib/i915/gem_multigpu: Introduce library for multi-GPU scenarios
  lib/drmtest: Introduced drm_open_driver_another
  lib/i915/gem_multigpu: Introduced gem_multigpu_count_class and
    igt_multi_fork_foreach_gpu

Kamil Konieczny (1):
  RFC: tests/intel/xe_create: example for useing macro for multi-gpu
    testing

 lib/drmtest.c           | 19 +++++++++++++++++++
 lib/drmtest.h           |  1 +
 lib/i915/gem_multigpu.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/i915/gem_multigpu.h | 27 +++++++++++++++++++++++++++
 lib/igt_device_scan.c   | 21 +++++++++++++++++++++
 lib/igt_device_scan.h   |  2 ++
 lib/meson.build         |  1 +
 tests/intel/xe_create.c | 20 ++++++++++++++++++++
 8 files changed, 130 insertions(+)
 create mode 100644 lib/i915/gem_multigpu.c
 create mode 100644 lib/i915/gem_multigpu.h

-- 
2.42.0
