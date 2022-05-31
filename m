Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB8F1128A2
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 10:58:08 +0000 (UTC)
Date: Tue, 31 May 2022 13:55:40 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <YpX0LAtTkN2MX8fZ@platvala-desk.ger.corp.intel.com>
References: <20220526161445.1819128-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526161445.1819128-1-robdclark@gmail.com>
Subject: Re: [igt-dev] [PATCH igt 0/2] A couple memory helper cleanups
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 26, 2022 at 09:14:43AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Some prep work for a shrinker test that I'm working on.  The second
> patch is a bit churny so I figured I'd go ahead and send these out now.

For the series:

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> 
> Rob Clark (2):
>   lib/igt_debugfs: Drop-caches support for msm
>   igt: Promote/rename OS helpers
> 
>  lib/i915/intel_memory_region.c        |  2 +-
>  lib/igt_aux.c                         |  2 +-
>  lib/igt_aux.h                         | 18 +----
>  lib/igt_debugfs.c                     | 16 ++++-
>  lib/{intel_os.c => igt_os.c}          | 97 ++++++++++++++-------------
>  lib/igt_os.h                          | 45 +++++++++++++
>  lib/meson.build                       |  2 +-
>  tests/dumb_buffer.c                   |  2 +-
>  tests/eviction_common.c               | 16 ++---
>  tests/i915/gem_busy.c                 |  2 +-
>  tests/i915/gem_concurrent_all.c       |  8 +--
>  tests/i915/gem_create.c               |  2 +-
>  tests/i915/gem_ctx_create.c           |  4 +-
>  tests/i915/gem_ctx_exec.c             |  2 +-
>  tests/i915/gem_evict_alignment.c      |  4 +-
>  tests/i915/gem_evict_everything.c     |  8 +--
>  tests/i915/gem_exec_alignment.c       |  8 +--
>  tests/i915/gem_exec_await.c           |  2 +-
>  tests/i915/gem_exec_big.c             |  6 +-
>  tests/i915/gem_exec_capture.c         |  8 +--
>  tests/i915/gem_exec_gttfill.c         |  2 +-
>  tests/i915/gem_exec_params.c          |  2 +-
>  tests/i915/gem_exec_reloc.c           |  2 +-
>  tests/i915/gem_linear_blits.c         |  2 +-
>  tests/i915/gem_lmem_swapping.c        |  6 +-
>  tests/i915/gem_mmap.c                 |  4 +-
>  tests/i915/gem_mmap_gtt.c             |  6 +-
>  tests/i915/gem_mmap_offset.c          |  2 +-
>  tests/i915/gem_ppgtt.c                |  4 +-
>  tests/i915/gem_pwrite.c               |  8 +--
>  tests/i915/gem_render_linear_blits.c  | 10 +--
>  tests/i915/gem_render_tiled_blits.c   | 10 +--
>  tests/i915/gem_shrink.c               |  6 +-
>  tests/i915/gem_softpin.c              |  4 +-
>  tests/i915/gem_tiled_blits.c          |  2 +-
>  tests/i915/gem_tiled_fence_blits.c    |  2 +-
>  tests/i915/gem_tiled_pread_pwrite.c   |  2 +-
>  tests/i915/gem_tiled_swapping.c       | 20 +++---
>  tests/i915/gem_userptr_blits.c        | 20 +++---
>  tests/i915/gen3_mixed_blits.c         |  2 +-
>  tests/i915/gen3_render_linear_blits.c |  2 +-
>  tests/i915/gen3_render_mixed_blits.c  |  2 +-
>  tests/i915/gen3_render_tiledx_blits.c |  2 +-
>  tests/i915/gen3_render_tiledy_blits.c |  2 +-
>  tests/i915/gen7_exec_parse.c          |  2 +-
>  tests/i915/gen9_exec_parse.c          |  6 +-
>  tests/i915/i915_suspend.c             |  6 +-
>  tests/i915/kms_big_fb.c               |  2 +-
>  tests/prime_mmap_coherency.c          | 10 +--
>  49 files changed, 226 insertions(+), 178 deletions(-)
>  rename lib/{intel_os.c => igt_os.c} (85%)
>  create mode 100644 lib/igt_os.h
> 
> -- 
> 2.35.3
> 
