Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BB710E0BA
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jan 2024 06:16:47 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/3] Sync i915_pciid.h
Date: Tue,  9 Jan 2024 11:39:40 +0530
Message-Id: <20240109060943.1236373-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Our original intent was to add ARL-S PCI IDs to IGT header. The ideal way
to do that would be to sync i915_pciids.h between kernel and IGT.
However, recently both files have diverged. See [2]

We tried adding just the ARL-S PCI ID to the IGT i915_pciids.h but
this will further diverge both the files. Please see the discussions
in [1].

To avoid this, we have decided to use i915_pciids_local.h to move out
any difference between the kernel and IGT header and then sync both
the headers.

I have not tested if the PVC and MTL changes causes any functional issue
but verified that the build works.

[1] https://patchwork.freedesktop.org/patch/572027/?series=50957&rev=15
[2] 17f9914c47c9 (lib: Add Pontevecchio platform)
    77dd5222d165 (v2: Add mtl to perf-metrics-codegen.py (Umesh))
	
Cc: Matt Roper <matthew.d.roper@intel.com> 
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Chaitanya Kumar Borah (3):
  lib/i915/perf: include i915_pciid_local.h
  lib: Add non-kernel macros to i915_pciids_local.h
  lib: sync i915_pciids.h with kernel

 lib/i915/perf.c         |  2 +-
 lib/i915_pciids.h       | 56 ++++++++++++++++++-----------------------
 lib/i915_pciids_local.h | 38 ++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 32 deletions(-)

-- 
2.25.1
