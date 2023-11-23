Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56BE10E6E8
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Nov 2023 08:48:44 +0000 (UTC)
Date: Thu, 23 Nov 2023 09:48:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231123084840.ka2zv2f2r372t5ov@kamilkon-desk.igk.intel.com>
References: <20231122144406.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122144406.6-1-francois.dugast@intel.com>
Subject: Re: [igt-dev] [PATCH v2 00/19] uAPI Alignment - Cleanup and future
 proof
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

Hi Francois,
On 2023-11-22 at 14:43:47 +0000, Francois Dugast wrote:
> This aligns on kernel series:
> https://patchwork.freedesktop.org/series/126535/#rev5
> 
> Francois Dugast (12):
>   drm-uapi/xe: Extend drm_xe_vm_bind_op
>   drm-uapi/xe: Reject bo creation of unaligned size
>   drm-uapi/xe: Align on a common way to return arrays (memory regions)
>   drm-uapi/xe: Align on a common way to return arrays (gt)
>   drm-uapi/xe: Align on a common way to return arrays (engines)
>   drm-uapi/xe: Split xe_sync types from flags
>   drm-uapi/xe: Kill tile_mask
>   drm-uapi/xe: Crystal Reference Clock updates
>   drm-uapi/xe: Remove bogus engine list from the wait_user_fence IOCTL
>   drm-uapi/xe: Add Tile ID information to the GT info query
>   drm-uapi/xe: Fix various struct padding for 64b alignment
>   drm-uapi/xe: Move xe_exec after xe_exec_queue
> 
> Rodrigo Vivi (7):
>   xe_ioctl: Converge bo_create to the most used version
>   xe_ioctl: Rename *xe_bo_create_flags to simply xe_bo_create
>   xe_query: Add missing include.

You didn't address my previous comments about dot at end,
I also do not see any r-b I already give.

Regards,
Kamil

>   xe_query: Kill visible_vram_if_possible
>   drm-uapi/xe: Separate bo_create placement from flags
>   xe: s/hw_engine/engine
>   drm-uapi/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
> 
>  benchmarks/gem_wsim.c              |  22 +--
>  include/drm-uapi/xe_drm.h          | 219 ++++++++++++++++-------------
>  lib/igt_draw.c                     |   7 +-
>  lib/igt_fb.c                       |   7 +-
>  lib/intel_batchbuffer.c            |  16 ++-
>  lib/intel_blt.c                    |   4 +-
>  lib/intel_bufops.c                 |   2 +-
>  lib/intel_compute.c                |   6 +-
>  lib/intel_ctx.c                    |   4 +-
>  lib/xe/xe_ioctl.c                  |  55 ++++----
>  lib/xe/xe_ioctl.h                  |   8 +-
>  lib/xe/xe_query.c                  | 121 +++++-----------
>  lib/xe/xe_query.h                  |  27 ++--
>  lib/xe/xe_spin.c                   |  15 +-
>  lib/xe/xe_util.c                   |  10 +-
>  tests/intel/api_intel_allocator.c  |   4 +-
>  tests/intel/kms_big_fb.c           |  22 +--
>  tests/intel/kms_ccs.c              |   5 +-
>  tests/intel/xe_ccs.c               |  12 +-
>  tests/intel/xe_copy_basic.c        |   8 +-
>  tests/intel/xe_create.c            |  15 +-
>  tests/intel/xe_dma_buf_sync.c      |  11 +-
>  tests/intel/xe_drm_fdinfo.c        |  25 ++--
>  tests/intel/xe_evict.c             |  54 +++----
>  tests/intel/xe_evict_ccs.c         |   7 +-
>  tests/intel/xe_exec_balancer.c     |  47 ++++---
>  tests/intel/xe_exec_basic.c        |  22 +--
>  tests/intel/xe_exec_compute_mode.c |  18 +--
>  tests/intel/xe_exec_fault_mode.c   |  22 +--
>  tests/intel/xe_exec_reset.c        |  79 ++++++-----
>  tests/intel/xe_exec_store.c        |  42 +++---
>  tests/intel/xe_exec_threads.c      |  53 +++----
>  tests/intel/xe_exercise_blt.c      |   4 +-
>  tests/intel/xe_guc_pc.c            |  13 +-
>  tests/intel/xe_huc_copy.c          |   5 +-
>  tests/intel/xe_intel_bb.c          |   5 +-
>  tests/intel/xe_mmap.c              |  65 +++++----
>  tests/intel/xe_noexec_ping_pong.c  |  11 +-
>  tests/intel/xe_perf_pmu.c          |  18 +--
>  tests/intel/xe_pm.c                |  39 ++---
>  tests/intel/xe_pm_residency.c      |   9 +-
>  tests/intel/xe_prime_self_import.c |  63 +++++++--
>  tests/intel/xe_query.c             |  81 +++++++----
>  tests/intel/xe_spin_batch.c        |  15 +-
>  tests/intel/xe_vm.c                | 141 ++++++++++---------
>  tests/intel/xe_waitfence.c         |  31 ++--
>  tests/kms_addfb_basic.c            |   2 +-
>  tests/kms_getfb.c                  |   2 +-
>  tests/kms_plane.c                  |   2 +-
>  49 files changed, 777 insertions(+), 698 deletions(-)
> 
> -- 
> 2.34.1
> 
