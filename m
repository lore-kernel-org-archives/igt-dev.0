Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559076FBAD
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 17:31:07 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 31 Jan 2020 23:01:00 +0530
Message-Id: <20200131173109.12527-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/9] Handling mmap_gtt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When platform doesn't support mappable aperture, we use device coherent
mapping instead of mmap_gtt.

And in such scenarios we are skipping the tiling based tests and fence
related tests along with GTT mmap specific tests.

Ramalingam C (9):
  tests/prime_vgem: Skip fence and gtt specific tests
  tests/intel_dp_compliance: Skip tests as tiling is not supported
  tests/prime_mmap_coherency: use device coherent mapping instead of
    mmap_gtt
  tests/prime_mmap: use device coherent mapping instead of mmap_gtt
  tests/kms_psr: Skip tests on mmap_gtt, if no mappable aperture
  tests/kms_available_modes_crc: Skip test if mappable aperture not
    supported
  tests/i915_pm_rpm: use device coherent mapping instead of mmap_gtt
  tests/i915_suspend: skip fence related tests, if no mmap_gtt
  tests/gem_tiling_max_stride: Skip if set tiling is not supported

 tests/i915/gem_tiling_max_stride.c |  1 +
 tests/i915/i915_pm_rpm.c           | 24 +++++++++++++++---------
 tests/i915/i915_suspend.c          | 16 ++++++++++++----
 tests/kms_available_modes_crc.c    |  1 +
 tests/kms_psr.c                    |  1 +
 tests/prime_mmap.c                 |  4 ++--
 tests/prime_mmap_coherency.c       |  2 +-
 tests/prime_vgem.c                 | 12 +++++++++---
 tools/intel_dp_compliance.c        |  2 ++
 9 files changed, 44 insertions(+), 19 deletions(-)

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
