Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6052B10E1E8
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 08:40:27 +0000 (UTC)
Date: Wed, 18 Jan 2023 09:40:23 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230118084023.asp6b2dxgqqwrpfb@zkempczy-mobl2>
References: <cover.1673951674.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673951674.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 0/6] Introduce blt_cmd_info struct
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 11:39:22AM +0100, Karolina Stolarek wrote:
> This patch series introduces a new way of checking if a specific
> tiling format and/or blitter copy command is supported on
> the current platform. Instead of using functions with hardcoded
> devices, now we store information about available features in
> blt_cmd_info struct, each of the instances connected to the
> intel_device_info definitions.
> 
> Two patches that follow the introduction of blt_cmd_info and 
> intel_device_info modification are a prep work for the fast
> copy test -- extracting needed functions and updating
> fill_data() to support TileYF (available only for Pre-gen12).
> 
> In addition to this, the patchset adds two fast copy tests: basic
> fast-copy where two blit copies are done in separate batches, and
> fast-copy-emit which uses emit_blt_fast_copy() and manually
> crafts two copies in one batch.

Please send this series with HAX containing your subtests you've
added and igt@meta_test@fail-result to igt ml. I want to see 
how your test behaves on all platforms. Don't send to trybot, 
we will get result faster.

--
Zbigniew

> 
> v5:
>   - Rebase, fix conflict in gem_ccs.c
> 
> v4:
>   - Move the inclusion of igt_core.h to intel_blt_info.c
>     (Kamil/Petri)
>   - Rename __MAX_TILING and __MAX_CMD so they are blitter-specific 
>     (Kamil)
>   - Use BIT() macro from intel_chipset.h (Zbigniew)
>   - Check for empty blt_tiling_info in tiling_info(), and warn
>     about it
>   - Change blt_cmd_info declarations in intel_blt_info. Add a
>     separate file for their definitions (intel_tiling_info.c).
>     Update lib/mason.build to reflect that change (Zbigniew)
>   - Remove definitions for ATS-M, as we can reuse dg2's (Zbigniew)
>   - Add EXEC_OBJECT_WRITE flag for dest in fast-copy-emit subtest
>     (Zbigniew)
> 
> v3:
>   - Rewrite blt_tiling_type to be contiguous (Zbigniew, Kamil) 
>   - Add BLT_BIT macro to create bit flags during .supported_tiling
>     field initialization (Zbigniew)
>   - Undo accidental line deletion in intel_chipset.c (Kamil)
>   - Add __TILING_MAX to blt_tiling_type (Zbigniew)
>   - Use asprintf when creating strings of subtest and PNG files
>     names (Zbigniew)
>   - Delete a duplicate WRITE_PNG call in fast_copy test (Zbigniew)
>   - Update documentation
>   - Update year in copyright headers
> 
> 
> 
> Karolina Stolarek (6):
>   i915/lib: Add new library for blitter and tiling formats
>   lib: Update platform definitions with blitter information
>   lib/i915_blt: Check for Tile-YF in fast_copy
>   lib/i915_blt: Add common functions for blt_copy_object
>   tests/gem_exercise_blt: Add fast-copy test
>   tests/gem_exercise_blt: Add fast-copy-emit test
> 
>  .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
>  lib/i915/i915_blt.c                           | 195 +++++++--
>  lib/i915/i915_blt.h                           |  48 ++-
>  lib/i915/intel_blt_info.c                     | 156 +++++++
>  lib/i915/intel_blt_info.h                     |  93 +++++
>  lib/i915/intel_tiling_info.c                  |  87 ++++
>  lib/intel_chipset.h                           |   4 +
>  lib/intel_device_info.c                       |  47 +++
>  lib/meson.build                               |  14 +-
>  tests/i915/gem_ccs.c                          | 209 +++-------
>  tests/i915/gem_exercise_blt.c                 | 387 ++++++++++++++++++
>  tests/i915/gem_lmem_swapping.c                |  81 +---
>  tests/meson.build                             |   1 +
>  13 files changed, 1058 insertions(+), 265 deletions(-)
>  create mode 100644 lib/i915/intel_blt_info.c
>  create mode 100644 lib/i915/intel_blt_info.h
>  create mode 100644 lib/i915/intel_tiling_info.c
>  create mode 100644 tests/i915/gem_exercise_blt.c
> 
> -- 
> 2.25.1
> 
