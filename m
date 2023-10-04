Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 20:10:10 -0700
Message-Id: <20231004031023.3444455-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 00/13] Adapt copy commands for Xe2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

A few copy commands changed for Xe2, mainly adding or moving the bits
used for MOCS. This adapts the places we are manually adding the
commands in the batch buffer, the gpu_cmds and the intel_blt libraries.

Missing here is the conversion of lib/intel_batchbuffer.c. I had
understood that intel_batchbuffer would end up using the new intel_blt.
So, it may just be that we have some patches being cooked for that. Or
I understood it wrong. Anyway, it doesn't seem good that we have
basically 3 ways to do the same thing.

Also it seems that this is the first time we are updating intel_blt for
a platform with a breaking change. I used 2 different approaches in how
to adapt the struct: one for xy-block-copy/xy-fast-copy and another for
ctrl-surf-copy. The reason is that for the former there was just a minor
change and the latter basically rewrites all the dwords. Going forward I
think we should keep applying small deltas to at most 1 or 2 breaking
changes, otherwise it makes it harder to read.

v2: Provide fixes according to the feedback in v1

Lucas De Marchi (13):
  lib/rendercopy: Use common mocs function
  lib/gpu_cmds: Remove prefix from gen7_fill_binding_table()
  lib/gpu_cmds: Reorder if/else ladder according to IP version
  lib/gpu_cmds: Fork a gen9_fill_surface_state()
  lib/gpu_cmds: Reduce scope of xehp_fill_surface_state()
  lib: Fork gen9_media.h
  lib/intel_mocs: Stop encoding mocs
  lib/intel_mocs: Add Xe2 mocs indexes
  lib/igt_draw: Add Xe2 mocs to XY_FAST_COLOR_BLT
  lib/intel_mocs: Remove unused lefotver defines
  lib/intel_blt: Support Xe2 in xy-block-copy command
  lib/intel_blt: Support xe2 in xy-fast-copy command
  lib/intel_blt: Support xe2 in ctrl-surf-copy command

 docs/reference/igt-gpu-tools/meson.build |   1 +
 lib/gen8_media.h                         |  14 -
 lib/gen9_media.h                         | 144 +++++++++
 lib/gen9_render.h                        |   3 +-
 lib/gpu_cmds.c                           | 100 +++++--
 lib/gpu_cmds.h                           |   7 +-
 lib/igt_draw.c                           |   8 +-
 lib/igt_fb.c                             |   2 +-
 lib/intel_blt.c                          | 357 +++++++++++++++++------
 lib/intel_blt.h                          |  10 +-
 lib/intel_compute.c                      |   1 +
 lib/intel_mocs.c                         |  23 +-
 lib/intel_mocs.h                         |   4 +-
 lib/intel_reg.h                          |   4 +-
 lib/media_fill.c                         |   1 +
 lib/rendercopy_gen9.c                    |  41 +--
 lib/xehp_media.h                         |   3 +-
 tests/intel/gem_ccs.c                    |   8 +-
 tests/intel/gem_lmem_swapping.c          |   4 +-
 tests/intel/xe_ccs.c                     |   6 +-
 20 files changed, 538 insertions(+), 203 deletions(-)
 create mode 100644 lib/gen9_media.h

-- 
2.40.1
