Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECF010E2E2
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Mar 2023 15:50:28 +0000 (UTC)
Date: Mon, 6 Mar 2023 16:50:20 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>
Message-ID: <20230306155020.ffofcgsepfw2rbnm@zkempczy-mobl2>
References: <20230303125521.75498-1-zbigniew.kempczynski@intel.com>
 <20230303125521.75498-3-zbigniew.kempczynski@intel.com>
 <20230306153002.w6a2kxnozjbsjdo3@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230306153002.w6a2kxnozjbsjdo3@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] igt: Remove duplicated macros
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

On Mon, Mar 06, 2023 at 04:30:02PM +0100, Kamil Konieczny wrote:
> Hi Zbigniew,
> 
> thank you for unifing these commands which will help in
> development. I have few nits, see below.
> 
> On 2023-03-03 at 13:55:21 +0100, Zbigniew Kempczyński wrote:
> > Introducing intel_gpu_commands.h requires removing all conflicting
> > macros definitions with altering the code (mostly command length).
> > 
> > For all commands used in IGT but not in the kernel (yet) add
> > intel_gpu_commands_staging.h which will keep all commands used
> > here only. Next import of command macros might finish verbatim
> > copy + removing from staging in one commit to compile cleanly.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Petri Latvala <adrinael@adrinael.net>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  benchmarks/gem_wsim.c                    |  6 +--
> >  include/intel_gpu_commands_staging.h     | 18 +++++++
> >  include/linux/bitops.h                   |  4 +-
> >  lib/gen4_render.h                        |  2 -
> >  lib/gen7_media.h                         |  2 -
> >  lib/gen7_render.h                        |  3 --
> >  lib/gen8_media.h                         |  2 -
> >  lib/huc_copy.c                           |  6 +--
> >  lib/huc_copy.h                           |  2 +-
> >  lib/i830_reg.h                           | 16 ------
> >  lib/i915/i915_blt.h                      |  4 +-
> >  lib/i915/i915_crc.c                      | 15 +++---
> >  lib/igt_draw.c                           |  4 +-
> >  lib/igt_dummyload.c                      |  2 +-
> >  lib/igt_store.c                          |  2 +-
> >  lib/intel_allocator.h                    |  8 +--
> >  lib/intel_aux_pgtable.c                  |  5 +-
> >  lib/intel_batchbuffer.c                  | 12 ++---
> >  lib/intel_bufops.c                       |  7 +++
> >  lib/intel_reg.h                          | 69 ++----------------------
> >  lib/ioctl_wrappers.h                     |  4 +-
> >  lib/rendercopy_gen9.c                    |  9 ++--
> >  tests/i915/api_intel_bb.c                |  2 +-
> >  tests/i915/gem_blits.c                   | 20 ++++---
> >  tests/i915/gem_busy.c                    |  8 +--
> >  tests/i915/gem_ccs.c                     |  2 +-
> >  tests/i915/gem_ctx_shared.c              |  4 +-
> >  tests/i915/gem_exec_async.c              |  2 +-
> >  tests/i915/gem_exec_balancer.c           | 23 +++-----
> >  tests/i915/gem_exec_capture.c            |  4 +-
> >  tests/i915/gem_exec_endless.c            | 13 +----
> >  tests/i915/gem_exec_fair.c               | 18 +++----
> >  tests/i915/gem_exec_fence.c              | 43 ++++++---------
> >  tests/i915/gem_exec_flush.c              |  6 +--
> >  tests/i915/gem_exec_gttfill.c            |  2 +-
> >  tests/i915/gem_exec_nop.c                |  4 +-
> >  tests/i915/gem_exec_parallel.c           |  2 +-
> >  tests/i915/gem_exec_params.c             |  4 +-
> >  tests/i915/gem_exec_reloc.c              | 29 ++++------
> >  tests/i915/gem_exec_schedule.c           | 43 ++++++---------
> >  tests/i915/gem_exec_store.c              |  6 +--
> >  tests/i915/gem_exec_suspend.c            |  2 +-
> >  tests/i915/gem_exec_whisper.c            |  2 +-
> >  tests/i915/gem_pipe_control_store_loop.c | 11 ++--
> >  tests/i915/gem_pxp.c                     |  7 +--
> >  tests/i915/gem_ringfill.c                |  2 +-
> >  tests/i915/gem_softpin.c                 | 16 +-----
> >  tests/i915/gem_sync.c                    | 16 +++---
> >  tests/i915/gem_userptr_blits.c           |  6 +--
> >  tests/i915/gem_vm_create.c               |  2 +-
> >  tests/i915/gem_watchdog.c                |  6 +--
> >  tests/i915/gem_workarounds.c             |  2 +-
> >  tests/i915/gen7_exec_parse.c             | 34 ++++++------
> >  tests/i915/gen9_exec_parse.c             | 47 +++++-----------
> >  tests/i915/i915_module_load.c            |  2 +-
> >  tests/i915/perf.c                        | 17 +-----
> >  tests/i915/perf_pmu.c                    | 18 +++----
> >  tests/i915/sysfs_timeslice_duration.c    | 17 ++----
> >  tests/prime_vgem.c                       |  2 +-
> >  tools/intel_audio_dump.c                 |  1 +
> >  tools/intel_reg.c                        |  2 +-
> >  61 files changed, 231 insertions(+), 418 deletions(-)
> >  create mode 100644 include/intel_gpu_commands_staging.h
> > 
> > diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> > index 2d60135817..7b5e62a3be 100644
> > --- a/benchmarks/gem_wsim.c
> > +++ b/benchmarks/gem_wsim.c
> > @@ -1426,7 +1426,7 @@ static unsigned int create_bb(struct w_step *w, int self)
> >  	cs = ptr = gem_mmap__wc(fd, w->bb_handle, 0, 4096, PROT_WRITE);
> >  
> >  	/* Store initial 64b timestamp: start */
> > -	*cs++ = MI_LOAD_REGISTER_IMM | MI_CS_MMIO_DST;
> > +	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_CS_MMIO_DST;
> >  	*cs++ = CS_GPR(START_TS) + 4;
> >  	*cs++ = 0;
> >  	*cs++ = MI_LOAD_REGISTER_REG | MI_CS_MMIO_DST | MI_CS_MMIO_SRC;
> > @@ -1441,7 +1441,7 @@ static unsigned int create_bb(struct w_step *w, int self)
> >  		*cs++ = MI_ARB_CHECK;
> >  
> >  	/* Store this 64b timestamp: now */
> > -	*cs++ = MI_LOAD_REGISTER_IMM | MI_CS_MMIO_DST;
> > +	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_CS_MMIO_DST;
> >  	*cs++ = CS_GPR(NOW_TS) + 4;
> >  	*cs++ = 0;
> >  	*cs++ = MI_LOAD_REGISTER_REG | MI_CS_MMIO_DST | MI_CS_MMIO_SRC;
> > @@ -1456,7 +1456,7 @@ static unsigned int create_bb(struct w_step *w, int self)
> >  	*cs++ = MI_MATH_STOREINV(MI_MATH_REG(NOW_TS), MI_MATH_REG_ACCU);
> >  
> >  	/* Save delta for indirect read by COND_BBE */
> > -	*cs++ = MI_STORE_REGISTER_MEM | (1 + use_64b) | MI_CS_MMIO_DST;
> > +	*cs++ = MI_STORE_REGISTER_MEM_CMD | (1 + use_64b) | MI_CS_MMIO_DST;
> >  	*cs++ = CS_GPR(NOW_TS);
> >  	w->reloc[r].target_handle = self;
> >  	w->reloc[r].offset = offset_in_page(cs);
> > diff --git a/include/intel_gpu_commands_staging.h b/include/intel_gpu_commands_staging.h
> > new file mode 100644
> > index 0000000000..74b4fb6553
> > --- /dev/null
> > +++ b/include/intel_gpu_commands_staging.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: MIT*/
> > +/*
> > + * Copyright © 2022 Intel Corporation
> > + */
> > +
> > +#ifndef _INTEL_GPU_COMMANDS_STAGING_H_
> > +#define _INTEL_GPU_COMMANDS_STAGING_H_
> > +
> > +#include "linux_scaffold.h"
> > +
> > +/* Length-free commands */
> > +#define MI_SEMAPHORE_WAIT_CMD		(0x1c << 23)
> > +#define MI_STORE_DWORD_IMM_CMD		(0x20 << 23)
> > +#define MI_STORE_REGISTER_MEM_CMD	(0x24 << 23)
> > +#define MI_FLUSH_DW_CMD			(0x26 << 23)
> > +#define MI_LOAD_REGISTER_MEM_CMD	(0x29 << 23)
> 
> May you sort them alphabetically ?
> 

I think better is to sort with command value, because then you're
checking the right place regarless name.

> > +
> > +#endif /* _INTEL_GPU_COMMANDS_STAGING_H_ */
> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > index 1bbe60c83c..7416dfa451 100644
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -3,6 +3,8 @@
> >  #ifndef _HAX_LINUX_BITOPS_H_
> >  #define _HAX_LINUX_BITOPS_H_
> >  
> > -#include <linux_scaffold.h>
> > +#include "linux_scaffold.h"
> > +
> > +#define REG_BIT(x) (1ul << (x))
> >  
> >  #endif /* _HAX_LINUX_BITOPS_H_ */
> > diff --git a/lib/gen4_render.h b/lib/gen4_render.h
> > index 7d8bc659a7..bbbddd346e 100644
> > --- a/lib/gen4_render.h
> > +++ b/lib/gen4_render.h
> > @@ -25,14 +25,12 @@
> >  #define GEN4_CS_URB_STATE			GEN4_3D(0, 0, 1)
> >  
> >  #define GEN4_STATE_BASE_ADDRESS			GEN4_3D(0, 1, 1)
> > -# define BASE_ADDRESS_MODIFY			(1 << 0)
> >  
> >  #define GEN4_STATE_SIP				GEN4_3D(0, 1, 2)
> >  
> >  #define GEN4_PIPELINE_SELECT			GEN4_3D(0, 1, 4)
> >  #define G4X_PIPELINE_SELECT			GEN4_3D(1, 1, 4)
> >  # define PIPELINE_SELECT_3D			0
> > -# define PIPELINE_SELECT_MEDIA			1
> >  
> >  #define GEN4_3DSTATE_PIPELINED_POINTERS		GEN4_3D(3, 0, 0)
> >  # define GEN4_GS_DISABLE			0
> > diff --git a/lib/gen7_media.h b/lib/gen7_media.h
> > index e81b5523a7..b5e49cae9e 100644
> > --- a/lib/gen7_media.h
> > +++ b/lib/gen7_media.h
> > @@ -14,11 +14,9 @@
> >  
> >  #define GEN7_PIPELINE_SELECT			GFXPIPE(1, 1, 4)
> >  # define PIPELINE_SELECT_3D			(0 << 0)
> > -# define PIPELINE_SELECT_MEDIA			(1 << 0)
> >  # define PIPELINE_SELECT_GPGPU			(2 << 0)
> >  
> >  #define GEN7_STATE_BASE_ADDRESS			GFXPIPE(0, 1, 1)
> > -# define BASE_ADDRESS_MODIFY			(1 << 0)
> >  
> >  #define GEN7_MEDIA_VFE_STATE			GFXPIPE(2, 0, 0)
> >  #define GEN7_MEDIA_CURBE_LOAD			GFXPIPE(2, 0, 1)
> > diff --git a/lib/gen7_render.h b/lib/gen7_render.h
> > index 5dfc04d4bc..d09ba6dad1 100644
> > --- a/lib/gen7_render.h
> > +++ b/lib/gen7_render.h
> > @@ -170,9 +170,6 @@
> >  /* DW1 */
> >  # define GEN7_PUSH_CONSTANT_BUFFER_OFFSET_SHIFT 16
> >  
> > -/* for GEN7_STATE_BASE_ADDRESS */
> > -#define BASE_ADDRESS_MODIFY		(1 << 0)
> > -
> >  /* for GEN7_PIPE_CONTROL */
> >  #define GEN7_PIPE_CONTROL_CS_STALL      (1 << 20)
> >  #define GEN7_PIPE_CONTROL_STALL_AT_SCOREBOARD   (1 << 1)
> > diff --git a/lib/gen8_media.h b/lib/gen8_media.h
> > index 1643794156..d2a049a1ec 100644
> > --- a/lib/gen8_media.h
> > +++ b/lib/gen8_media.h
> > @@ -14,10 +14,8 @@
> >  
> >  #define GEN8_PIPELINE_SELECT			GFXPIPE(1, 1, 4)
> >  # define PIPELINE_SELECT_3D			(0 << 0)
> > -# define PIPELINE_SELECT_MEDIA			(1 << 0)
> >  
> >  #define GEN8_STATE_BASE_ADDRESS			GFXPIPE(0, 1, 1)
> > -# define BASE_ADDRESS_MODIFY			(1 << 0)
> >  
> >  #define GEN8_MEDIA_VFE_STATE			GFXPIPE(2, 0, 0)
> >  #define GEN8_MEDIA_CURBE_LOAD			GFXPIPE(2, 0, 1)
> > diff --git a/lib/huc_copy.c b/lib/huc_copy.c
> > index 6ec68864b7..bf8254c612 100644
> > --- a/lib/huc_copy.c
> > +++ b/lib/huc_copy.c
> > @@ -80,14 +80,14 @@ gen9_huc_copyfunc(int fd, uint64_t ahnd,
> >  	buf[i++] = 0;
> >  	buf[i++] = 0x3;
> >  
> > -	buf[i++] = MFX_WAIT;
> > -	buf[i++] = MFX_WAIT;
> > +	buf[i++] = HUC_MFX_WAIT;
> > +	buf[i++] = HUC_MFX_WAIT;
> 
> imho this changes to huc_copy may be in separate patch
> before your main patchset. If you prefer it can stay.
> 

It's not a big problem, will separate this as this is not
related to gpu command extraction.

> >  
> >  	buf[i++] = HUC_PIPE_MODE_SELECT;
> >  	buf[i++] = 0;
> >  	buf[i++] = 0;
> >  
> > -	buf[i++] = MFX_WAIT;
> > +	buf[i++] = HUC_MFX_WAIT;
> >  
> >  	memset(reloc, 0, sizeof(reloc));
> >  
> > diff --git a/lib/huc_copy.h b/lib/huc_copy.h
> > index 69d1409335..1789e87359 100644
> > --- a/lib/huc_copy.h
> > +++ b/lib/huc_copy.h
> > @@ -31,7 +31,7 @@
> >  #include "intel_reg.h"
> >  
> >  #define PARALLEL_VIDEO_PIPE		(0x3<<29)
> > -#define MFX_WAIT			(PARALLEL_VIDEO_PIPE|(0x1<<27)|(0x1<<8))
> > +#define HUC_MFX_WAIT			(PARALLEL_VIDEO_PIPE|(0x1<<27)|(0x1<<8))
> >  
> >  #define HUC_IMEM_STATE			(PARALLEL_VIDEO_PIPE|(0x2<<27)|(0xb<<23)|(0x1<<16)|0x3)
> >  #define HUC_PIPE_MODE_SELECT		(PARALLEL_VIDEO_PIPE|(0x2<<27)|(0xb<<23)|0x1)
> > diff --git a/lib/i830_reg.h b/lib/i830_reg.h
> > index b8ad2ac00f..3c0b9b5bd0 100644
> > --- a/lib/i830_reg.h
> > +++ b/lib/i830_reg.h
> > @@ -30,12 +30,7 @@
> >  
> >  #define I830_SET_FIELD( var, mask, value ) (var &= ~(mask), var |= value)
> >  
> > -/* Flush */
> > -#define MI_FLUSH			(0x04<<23)
> > -#define MI_FLUSH_DW			(0x26<<23)
> > -
> >  #define MI_WRITE_DIRTY_STATE		(1<<4)
> > -#define MI_END_SCENE			(1<<3)
> >  #define MI_GLOBAL_SNAPSHOT_COUNT_RESET	(1<<3)
> >  #define MI_INHIBIT_RENDER_CACHE_FLUSH	(1<<2)
> >  #define MI_STATE_INSTRUCTION_CACHE_FLUSH (1<<1)
> > @@ -43,15 +38,11 @@
> >  /* broadwater flush bits */
> >  #define BRW_MI_GLOBAL_SNAPSHOT_RESET   (1 << 3)
> >  
> > -#define MI_BATCH_BUFFER_END	(0xA << 23)
> > -
> >  /* Noop */
> > -#define MI_NOOP				0x00
> >  #define MI_NOOP_WRITE_ID		(1<<22)
> >  #define MI_NOOP_ID_MASK			(1<<22 - 1)
> >  
> >  /* Wait for Events */
> > -#define MI_WAIT_FOR_EVENT			(0x03<<23)
> >  #define MI_WAIT_FOR_PIPEB_SVBLANK		(1<<18)
> >  #define MI_WAIT_FOR_PIPEA_SVBLANK		(1<<17)
> >  #define MI_WAIT_FOR_OVERLAY_FLIP		(1<<16)
> > @@ -61,12 +52,10 @@
> >  #define MI_WAIT_FOR_PIPEA_SCAN_LINE_WINDOW	(1<<1)
> >  
> >  /* Set the scan line for MI_WAIT_FOR_PIPE?_SCAN_LINE_WINDOW */
> > -#define MI_LOAD_SCAN_LINES_INCL			(0x12<<23)
> >  #define MI_LOAD_SCAN_LINES_DISPLAY_PIPEA	(0)
> >  #define MI_LOAD_SCAN_LINES_DISPLAY_PIPEB	(0x1<<20)
> >  
> >  /* BLT commands */
> > -#define COLOR_BLT_CMD		((2<<29)|(0x40<<22)|(0x3))
> >  #define COLOR_BLT_WRITE_ALPHA	(1<<21)
> >  #define COLOR_BLT_WRITE_RGB	(1<<20)
> >  
> > @@ -76,16 +65,11 @@
> >  
> >  #define XY_SETUP_CLIP_BLT_CMD		((2<<29)|(3<<22)|1)
> >  
> > -#define XY_SRC_COPY_BLT_CMD		((2<<29)|(0x53<<22))
> >  #define XY_SRC_COPY_BLT_WRITE_ALPHA	(1<<21)
> >  #define XY_SRC_COPY_BLT_WRITE_RGB	(1<<20)
> >  #define XY_SRC_COPY_BLT_SRC_TILED	(1<<15)
> >  #define XY_SRC_COPY_BLT_DST_TILED	(1<<11)
> >  
> > -#define SRC_COPY_BLT_CMD		((2<<29)|(0x43<<22)|0x4)
> > -#define SRC_COPY_BLT_WRITE_ALPHA	(1<<21)
> > -#define SRC_COPY_BLT_WRITE_RGB		(1<<20)
> > -
> >  #define XY_PAT_BLT_IMMEDIATE		((2<<29)|(0x72<<22))
> >  
> >  #define XY_MONO_PAT_BLT_CMD		((0x2<<29)|(0x52<<22)|0x7)
> > diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
> > index c535961e8a..63951db753 100644
> > --- a/lib/i915/i915_blt.h
> > +++ b/lib/i915/i915_blt.h
> > @@ -135,8 +135,8 @@ struct blt_block_copy_data_ext {
> >  };
> >  
> >  enum blt_access_type {
> > -	INDIRECT_ACCESS,
> > -	DIRECT_ACCESS,
> > +	BLT_INDIRECT_ACCESS,
> > +	BLT_DIRECT_ACCESS,
> >  };
> >  
> >  struct blt_ctrl_surf_copy_object {
> > diff --git a/lib/i915/i915_crc.c b/lib/i915/i915_crc.c
> > index 7d68f8e5c4..9564b7327d 100644
> > --- a/lib/i915/i915_crc.c
> > +++ b/lib/i915/i915_crc.c
> > @@ -9,7 +9,6 @@
> >  #include "gem_create.h"
> >  #include "gem_engine_topology.h"
> >  #include "gem_mman.h"
> > -#include "i830_reg.h"
> >  #include "i915_drm.h"
> >  #include "intel_reg.h"
> >  #include "intel_chipset.h"
> > @@ -36,13 +35,13 @@
> >  	} while (0)
> >  
> >  #define LOAD_REGISTER_IMM32(__reg, __imm1) do { \
> > -		*bb++ = MI_LOAD_REGISTER_IMM | MI_CS_MMIO_DST; \
> > +		*bb++ = MI_LOAD_REGISTER_IMM(1) | MI_CS_MMIO_DST; \
> >  		*bb++ = (__reg); \
> >  		*bb++ = (__imm1); \
> >  	} while (0)
> >  
> >  #define LOAD_REGISTER_IMM64(__reg, __imm1, __imm2) do { \
> > -		*bb++ = (MI_LOAD_REGISTER_IMM + 2) | MI_CS_MMIO_DST; \
> > +		*bb++ = MI_LOAD_REGISTER_IMM(2) | MI_CS_MMIO_DST; \
> >  		*bb++ = (__reg); \
> >  		*bb++ = (__imm1); \
> >  		*bb++ = (__reg) + 4; \
> > @@ -50,29 +49,29 @@
> >  	} while (0)
> >  
> >  #define LOAD_REGISTER_MEM(__reg, __offset) do { \
> > -		*bb++ = MI_LOAD_REGISTER_MEM | MI_CS_MMIO_DST | 2; \
> > +		*bb++ = MI_LOAD_REGISTER_MEM_CMD | MI_CS_MMIO_DST | 2; \
> >  		*bb++ = (__reg); \
> >  		*bb++ = (__offset); \
> >  		*bb++ = (__offset) >> 32; \
> >  	} while (0)
> >  
> >  #define LOAD_REGISTER_MEM_WPARID(__reg, __offset) do { \
> > -		*bb++ = MI_LOAD_REGISTER_MEM | MI_CS_MMIO_DST | MI_WPARID_ENABLE_GEN12 | 2; \
> > +		*bb++ = MI_LOAD_REGISTER_MEM_CMD | MI_CS_MMIO_DST | MI_WPARID_ENABLE_GEN12 | 2; \
> >  		*bb++ = (__reg); \
> >  		*bb++ = (__offset); \
> >  		*bb++ = (__offset) >> 32; \
> >  	} while (0)
> >  
> >  #define STORE_REGISTER_MEM(__reg, __offset) do { \
> > -		*bb++ = MI_STORE_REGISTER_MEM | MI_CS_MMIO_DST | 2; \
> > +		*bb++ = MI_STORE_REGISTER_MEM_GEN8 | MI_CS_MMIO_DST; \
> >  		*bb++ = (__reg); \
> >  		*bb++ = (__offset); \
> >  		*bb++ = (__offset) >> 32; \
> >  	} while (0)
> >  
> >  #define STORE_REGISTER_MEM_PREDICATED(__reg, __offset) do { \
> > -		*bb++ = MI_STORE_REGISTER_MEM | MI_CS_MMIO_DST | \
> > -			MI_STORE_PREDICATE_ENABLE_GEN12 | 2; \
> > +		*bb++ = MI_STORE_REGISTER_MEM_GEN8 | MI_CS_MMIO_DST | \
> > +			MI_STORE_PREDICATE_ENABLE_GEN12; \
> >  		*bb++ = (__reg); \
> >  		*bb++ = (__offset); \
> >  		*bb++ = (__offset) >> 32; \
> > diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> > index 58ce0539be..ac512fac5a 100644
> > --- a/lib/igt_draw.c
> > +++ b/lib/igt_draw.c
> > @@ -385,12 +385,12 @@ static void switch_blt_tiling(struct intel_bb *ibb, uint32_t tiling, bool on)
> >  	/* To change the tile register, insert an MI_FLUSH_DW followed by an
> >  	 * MI_LOAD_REGISTER_IMM
> >  	 */
> > -	intel_bb_out(ibb, MI_FLUSH_DW | 2);
> > +	intel_bb_out(ibb, MI_FLUSH_DW_CMD | 2);
> >  	intel_bb_out(ibb, 0x0);
> >  	intel_bb_out(ibb, 0x0);
> >  	intel_bb_out(ibb, 0x0);
> >  
> > -	intel_bb_out(ibb, MI_LOAD_REGISTER_IMM);
> > +	intel_bb_out(ibb, MI_LOAD_REGISTER_IMM(1));
> >  	intel_bb_out(ibb, 0x22200); /* BCS_SWCTRL */
> >  	intel_bb_out(ibb, bcs_swctrl);
> >  	intel_bb_out(ibb, MI_NOOP);
> > diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> > index 5f3c6b10c7..b3dc18ee7d 100644
> > --- a/lib/igt_dummyload.c
> > +++ b/lib/igt_dummyload.c
> > @@ -256,7 +256,7 @@ emit_recursive_batch(igt_spin_t *spin,
> >  		r->offset = sizeof(uint32_t) * 1;
> >  		r->delta = sizeof(uint32_t) * SPIN_POLL_START_IDX;
> >  
> > -		*cs++ = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +		*cs++ = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  
> >  		if (gen >= 8) {
> >  			*cs++ = r->presumed_offset + r->delta;
> > diff --git a/lib/igt_store.c b/lib/igt_store.c
> > index 98c6c4fbd1..538405e7f5 100644
> > --- a/lib/igt_store.c
> > +++ b/lib/igt_store.c
> > @@ -76,7 +76,7 @@ void igt_store_word(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
> >  		obj[BATCH].offset = bb_offset;
> >  		obj[BATCH].flags |= EXEC_OBJECT_PINNED;
> >  	}
> > -	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		uint64_t addr = target_gpu_addr + delta;
> >  		batch[++i] = lower_32_bits(addr);
> > diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
> > index 28e1165540..a6bf573e9d 100644
> > --- a/lib/intel_allocator.h
> > +++ b/lib/intel_allocator.h
> > @@ -12,6 +12,7 @@
> >  #include <stdint.h>
> >  #include <stdatomic.h>
> >  #include "i915/gem_submission.h"
> > +#include "intel_reg.h"
> >  
> >  /**
> >   * SECTION:intel_allocator
> > @@ -217,13 +218,6 @@ void intel_allocator_print(uint64_t allocator_handle);
> >  
> >  #define GEN8_GTT_ADDRESS_WIDTH 48
> >  
> > -static inline uint64_t sign_extend64(uint64_t x, int high)
> > -{
> > -	int shift = 63 - high;
> > -
> > -	return (int64_t)(x << shift) >> shift;
> > -}
> > -
> >  static inline uint64_t CANONICAL(uint64_t offset)
> >  {
> >  	return sign_extend64(offset, GEN8_GTT_ADDRESS_WIDTH - 1);
> > diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> > index 7556351a02..5205687080 100644
> > --- a/lib/intel_aux_pgtable.c
> > +++ b/lib/intel_aux_pgtable.c
> > @@ -9,7 +9,6 @@
> >  
> >  #include "i915/gem_mman.h"
> >  
> > -#define BITS_PER_LONG_LONG	(sizeof(long long) * 8)
> >  #define BITMASK(e, s)		((~0ULL << (s)) & \
> >  				 (~0ULL >> (BITS_PER_LONG_LONG - 1 - (e))))
> >  
> > @@ -644,11 +643,11 @@ gen12_emit_aux_pgtable_state(struct intel_bb *ibb, uint32_t state, bool render)
> >  	if (!state)
> >  		return;
> >  
> > -	intel_bb_out(ibb, MI_LOAD_REGISTER_MEM | MI_MMIO_REMAP_ENABLE_GEN12 | 2);
> > +	intel_bb_out(ibb, MI_LOAD_REGISTER_MEM_CMD | MI_MMIO_REMAP_ENABLE_GEN12 | 2);
> >  	intel_bb_out(ibb, table_base_reg);
> >  	intel_bb_emit_reloc(ibb, ibb->handle, 0, 0, state, ibb->batch_offset);
> >  
> > -	intel_bb_out(ibb, MI_LOAD_REGISTER_MEM | MI_MMIO_REMAP_ENABLE_GEN12 | 2);
> > +	intel_bb_out(ibb, MI_LOAD_REGISTER_MEM_CMD | MI_MMIO_REMAP_ENABLE_GEN12 | 2);
> >  	intel_bb_out(ibb, table_base_reg + 4);
> >  	intel_bb_emit_reloc(ibb, ibb->handle, 0, 0, state + 4, ibb->batch_offset);
> >  }
> > diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> > index 59c788e683..8695f1b7ac 100644
> > --- a/lib/intel_batchbuffer.c
> > +++ b/lib/intel_batchbuffer.c
> > @@ -378,7 +378,7 @@ void igt_blitter_src_copy(int fd,
> >  	if ((src_tiling | dst_tiling) >= I915_TILING_Y) {
> >  		unsigned int mask;
> >  
> > -		batch[i++] = MI_LOAD_REGISTER_IMM;
> > +		batch[i++] = MI_LOAD_REGISTER_IMM(1);
> >  		batch[i++] = BCS_SWCTRL;
> >  
> >  		mask = (BCS_SRC_Y | BCS_DST_Y) << 16;
> > @@ -407,12 +407,12 @@ void igt_blitter_src_copy(int fd,
> >  
> >  	if ((src_tiling | dst_tiling) >= I915_TILING_Y) {
> >  		igt_assert(gen >= 6);
> > -		batch[i++] = MI_FLUSH_DW | 2;
> > +		batch[i++] = MI_FLUSH_DW_CMD | 2;
> >  		batch[i++] = 0;
> >  		batch[i++] = 0;
> >  		batch[i++] = 0;
> >  
> > -		batch[i++] = MI_LOAD_REGISTER_IMM;
> > +		batch[i++] = MI_LOAD_REGISTER_IMM(1);
> >  		batch[i++] = BCS_SWCTRL;
> >  		batch[i++] = (BCS_SRC_Y | BCS_DST_Y) << 16;
> >  	}
> > @@ -2413,7 +2413,7 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
> >  	}
> >  
> >  	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
> > -		intel_bb_out(ibb, MI_LOAD_REGISTER_IMM);
> > +		intel_bb_out(ibb, MI_LOAD_REGISTER_IMM(1));
> >  		intel_bb_out(ibb, BCS_SWCTRL);
> >  
> >  		mask = (BCS_SRC_Y | BCS_DST_Y) << 16;
> > @@ -2450,12 +2450,12 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
> >  
> >  	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
> >  		igt_assert(ibb->gen >= 6);
> > -		intel_bb_out(ibb, MI_FLUSH_DW | 2);
> > +		intel_bb_out(ibb, MI_FLUSH_DW_CMD | 2);
> >  		intel_bb_out(ibb, 0);
> >  		intel_bb_out(ibb, 0);
> >  		intel_bb_out(ibb, 0);
> >  
> > -		intel_bb_out(ibb, MI_LOAD_REGISTER_IMM);
> > +		intel_bb_out(ibb, MI_LOAD_REGISTER_IMM(1));
> >  		intel_bb_out(ibb, BCS_SWCTRL);
> >  		intel_bb_out(ibb, (BCS_SRC_Y | BCS_DST_Y) << 16);
> >  	}
> > diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> > index 72c2189e05..cdc7a1698b 100644
> > --- a/lib/intel_bufops.c
> > +++ b/lib/intel_bufops.c
> > @@ -83,6 +83,13 @@
> >  #define DEBUGFN()
> >  #endif
> >  
> > +#undef TILE_NONE
> > +#undef TILE_X
> > +#undef TILE_Y
> > +#undef TILE_Yf
> > +#undef TILE_Ys
> > +#undef TILE_4
> > +
> 
> Why those undef's are here ?
> 

intel_gpu_commands.h conflicts with same definitions.

> >  #define TILE_DEF(x) (1 << (x))
> >  #define TILE_NONE   TILE_DEF(I915_TILING_NONE)
> >  #define TILE_X      TILE_DEF(I915_TILING_X)
> > diff --git a/lib/intel_reg.h b/lib/intel_reg.h
> > index 6f7559ad9f..3bf3676dc5 100644
> > --- a/lib/intel_reg.h
> > +++ b/lib/intel_reg.h
> > @@ -44,6 +44,9 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> >  #ifndef _I810_REG_H
> >  #define _I810_REG_H
> >  
> > +#include "intel_gpu_commands.h"
> > +#include "intel_gpu_commands_staging.h"
> > +
> >  /* I/O register offsets
> >   */
> >  #define CRX_MDA		0x3B4
> > @@ -2534,7 +2537,6 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> >  #define I855_CLOCK_166_250			(3 << 0)
> >  
> >  /* BLT commands */
> > -#define COLOR_BLT_CMD		((2<<29)|(0x40<<22)|(0x3))
> >  #define COLOR_BLT_WRITE_ALPHA	(1<<21)
> >  #define COLOR_BLT_WRITE_RGB	(1<<20)
> >  
> > @@ -2545,15 +2547,8 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> >  
> >  #define XY_SETUP_CLIP_BLT_CMD		((2<<29)|(3<<22)|1)
> >  
> > -#define XY_SRC_COPY_BLT_CMD		((2<<29)|(0x53<<22))
> >  #define XY_SRC_COPY_BLT_WRITE_ALPHA	(1<<21)
> >  #define XY_SRC_COPY_BLT_WRITE_RGB	(1<<20)
> > -#define XY_SRC_COPY_BLT_SRC_TILED	(1<<15)
> > -#define XY_SRC_COPY_BLT_DST_TILED	(1<<11)
> > -
> > -#define SRC_COPY_BLT_CMD		((2<<29)|(0x43<<22)|0x4)
> > -#define SRC_COPY_BLT_WRITE_ALPHA	(1<<21)
> > -#define SRC_COPY_BLT_WRITE_RGB		(1<<20)
> >  
> >  #define XY_PAT_BLT_IMMEDIATE		((2<<29)|(0x72<<22))
> >  
> > @@ -2591,15 +2586,10 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> >  #define   XY_FAST_COPY_COLOR_DEPTH_64			(4  << 24)
> >  #define   XY_FAST_COPY_COLOR_DEPTH_128			(5  << 24)
> >  
> > -#define MI_STORE_DWORD_IMM		((0x20<<23)|2)
> > -#define   MI_MEM_VIRTUAL	(1 << 22) /* 965+ only */
> > -
> > -#define MI_SET_CONTEXT			(0x18<<23)
> >  #define CTXT_NO_RESTORE			(1)
> >  #define CTXT_PALETTE_SAVE_DISABLE	(1<<3)
> >  #define CTXT_PALETTE_RESTORE_DISABLE	(1<<2)
> >  
> > -#define MI_SET_APPID                    (0x0E << 23)
> >  #define APPID_CTXREST_INHIBIT           (1 << 9)
> >  #define APPID_CTXSAVE_INHIBIT           (1 << 8)
> >  #define APPTYPE(n)                      ((n) << 7)
> > @@ -2616,36 +2606,26 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> >  #define MI_VERTEX_BUFFER_DISABLE	(1)
> >  
> >  /* Overlay Flip */
> > -#define MI_OVERLAY_FLIP			(0x11<<23)
> >  #define MI_OVERLAY_FLIP_CONTINUE	(0<<21)
> >  #define MI_OVERLAY_FLIP_ON		(1<<21)
> >  #define MI_OVERLAY_FLIP_OFF		(2<<21)
> >  
> >  /* Wait for Events */
> > -#define MI_WAIT_FOR_EVENT		(0x03<<23)
> >  #define MI_WAIT_FOR_PIPEB_SVBLANK	(1<<18)
> >  #define MI_WAIT_FOR_PIPEA_SVBLANK	(1<<17)
> > -#define MI_WAIT_FOR_OVERLAY_FLIP	(1<<16)
> >  #define MI_WAIT_FOR_PIPEB_VBLANK	(1<<7)
> >  #define MI_WAIT_FOR_PIPEA_VBLANK	(1<<3)
> >  #define MI_WAIT_FOR_PIPEB_SCAN_LINE_WINDOW	(1<<5)
> >  #define MI_WAIT_FOR_PIPEA_SCAN_LINE_WINDOW	(1<<1)
> >  
> > -#define MI_LOAD_SCAN_LINES_INCL		(0x12<<23)
> > -#define MI_LOAD_REGISTER_IMM		((0x22 << 23) | 1)
> > -#define MI_LOAD_REGISTER_REG		((0x2A << 23) | 1)
> > -#define MI_LOAD_REGISTER_MEM		(0x29 << 23)
> >  #define   MI_CS_MMIO_DST		(1 << 19)
> >  #define   MI_CS_MMIO_SRC		(1 << 18)
> >  #define   MI_MMIO_REMAP_ENABLE_GEN12	(1 << 17)
> >  #define   MI_WPARID_ENABLE_GEN12	(1 << 16)
> > -#define MI_STORE_REGISTER_MEM		(0x24 << 23)
> >  #define   MI_STORE_PREDICATE_ENABLE_GEN12 (1 << 21)
> >  
> >  /* Flush */
> > -#define MI_FLUSH			(0x04<<23)
> >  #define MI_WRITE_DIRTY_STATE		(1<<4)
> > -#define MI_END_SCENE			(1<<3)
> >  #define MI_GLOBAL_SNAPSHOT_COUNT_RESET	(1<<3)
> >  #define MI_INHIBIT_RENDER_CACHE_FLUSH	(1<<2)
> >  #define MI_STATE_INSTRUCTION_CACHE_FLUSH (1<<1)
> > @@ -2654,27 +2634,16 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> >  #define BRW_MI_GLOBAL_SNAPSHOT_RESET   (1 << 3)
> >  
> >  /* Noop */
> > -#define MI_NOOP				0x00
> >  #define MI_NOOP_WRITE_ID		(1<<22)
> >  #define MI_NOOP_ID_MASK			(1<<22 - 1)
> >  
> > -/* ARB Check */
> > -#define MI_ARB_CHECK                    (0x5 << 23)
> > -
> >  #define STATE3D_COLOR_FACTOR	((0x3<<29)|(0x1d<<24)|(0x01<<16))
> >  
> >  /* Atomics */
> > -#define MI_ATOMIC			((0x2f << 23) | 1)
> > -#define   MI_ATOMIC_INLINE_DATA         (1 << 18)
> >  #define   MI_ATOMIC_INC                 (0x5 << 8)
> >  #define   MI_ATOMIC_ADD                 (0x7 << 8)
> >  
> >  /* Batch */
> > -#define MI_BATCH_BUFFER		((0x30 << 23) | 1)
> > -#define MI_BATCH_BUFFER_START	(0x31 << 23)
> > -#define MI_BATCH_BUFFER_START_GEN8 ((0x31 << 13) | 1)
> > -#define   MI_BATCH_PREDICATE       (1 << 15) /* HSW+ on RCS only*/
> > -#define MI_BATCH_BUFFER_END	(0xA << 23)
> >  #define MI_COND_BATCH_BUFFER_END	(0x36 << 23)
> >  #define   MAD_GT_IDD                    (0 << 12)
> >  #define   MAD_GT_OR_EQ_IDD              (1 << 12)
> > @@ -2682,45 +2651,13 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> >  #define   MAD_LT_OR_EQ_IDD              (3 << 12)
> >  #define   MAD_EQ_IDD                    (4 << 12)
> >  #define   MAD_NEQ_IDD                   (5 << 12)
> > -#define MI_DO_COMPARE                   (1 << 21)
> > -
> > -#define MI_BATCH_NON_SECURE		(1)
> > -#define MI_BATCH_NON_SECURE_I965	(1 << 8)
> > -#define MI_BATCH_NON_SECURE_HSW		(1<<13) /* Additional bit for RCS */
> >  
> >  /* Math */
> > -#define MI_INSTR(opcode, flags)         (((opcode) << 23) | (flags))
> > -#define MI_MATH(x)                      MI_INSTR(0x1a, (x) - 1)
> > -#define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
> > -/* Opcodes for MI_MATH_INSTR */
> > -#define   MI_MATH_NOOP                  MI_MATH_INSTR(0x000, 0x0, 0x0)
> > -#define   MI_MATH_LOAD(op1, op2)        MI_MATH_INSTR(0x080, op1, op2)
> > -#define   MI_MATH_LOADINV(op1, op2)     MI_MATH_INSTR(0x480, op1, op2)
> > -#define   MI_MATH_LOAD0(op1)            MI_MATH_INSTR(0x081, op1)
> > -#define   MI_MATH_LOAD1(op1)            MI_MATH_INSTR(0x481, op1)
> > -#define   MI_MATH_ADD                   MI_MATH_INSTR(0x100, 0x0, 0x0)
> > -#define   MI_MATH_SUB                   MI_MATH_INSTR(0x101, 0x0, 0x0)
> > -#define   MI_MATH_AND                   MI_MATH_INSTR(0x102, 0x0, 0x0)
> > -#define   MI_MATH_OR                    MI_MATH_INSTR(0x103, 0x0, 0x0)
> > -#define   MI_MATH_XOR                   MI_MATH_INSTR(0x104, 0x0, 0x0)
> > -#define   MI_MATH_STORE(op1, op2)       MI_MATH_INSTR(0x180, op1, op2)
> > -#define   MI_MATH_STOREINV(op1, op2)    MI_MATH_INSTR(0x580, op1, op2)
> >  /* DG2+ */
> >  #define   MI_MATH_SHL                   MI_MATH_INSTR(0x105, 0x0, 0x0)
> >  #define   MI_MATH_SHR                   MI_MATH_INSTR(0x106, 0x0, 0x0)
> >  #define   MI_MATH_SAR                   MI_MATH_INSTR(0x107, 0x0, 0x0)
> >  
> > -/* Registers used as operands in MI_MATH_INSTR */
> > -#define   MI_MATH_REG(x)                (x)
> > -#define   MI_MATH_REG_SRCA              0x20
> > -#define   MI_MATH_REG_SRCB              0x21
> > -#define   MI_MATH_REG_ACCU              0x31
> > -#define   MI_MATH_REG_ZF                0x32
> > -#define   MI_MATH_REG_CF                0x33
> > -
> > -/* DG2+ */
> > -#define MI_SET_PREDICATE                MI_INSTR(0x1, 0)
> > -
> >  #define MAX_DISPLAY_PIPES	2
> >  
> >  typedef enum {
> > diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
> > index cf228c2651..e4d7c0d408 100644
> > --- a/lib/ioctl_wrappers.h
> > +++ b/lib/ioctl_wrappers.h
> > @@ -173,9 +173,9 @@ static inline uint64_t to_user_pointer(const void *ptr)
> >   *
> >   * Casts a 64bit value from an ioctl into a pointer.
> >   */
> > -static inline void *from_user_pointer(uint64_t u64)
> > +static inline void *from_user_pointer(uint64_t u64p)
> ------------------------------------------------- ^
> 

Scaffold defines u64, we need to replace this to not typedef name.

> >  {
> > -	return (void *)(uintptr_t)u64;
> > +	return (void *)(uintptr_t)u64p;
> --------------------------------- ^
> 
> imho we can safely drop this change now, maybe do it in separate
> code refactor as your patchset is already big.
> 
> >  }

Must be done in this step.

> >  
> >  /**
> > diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> > index d74f1c9996..650d095020 100644
> > --- a/lib/rendercopy_gen9.c
> > +++ b/lib/rendercopy_gen9.c
> > @@ -967,10 +967,7 @@ static void gen8_emit_primitive(struct intel_bb *ibb, uint32_t offset)
> >  	intel_bb_out(ibb, 0);	/* index buffer offset, ignored */
> >  }
> >  
> > -#define GFX_OP_PIPE_CONTROL    ((3 << 29) | (3 << 27) | (2 << 24))
> > -#define PIPE_CONTROL_CS_STALL	            (1 << 20)
> >  #define PIPE_CONTROL_RENDER_TARGET_FLUSH    (1 << 12)
> > -#define PIPE_CONTROL_FLUSH_ENABLE           (1 << 7)
> >  #define PIPE_CONTROL_DATA_CACHE_INVALIDATE  (1 << 5)
> >  #define PIPE_CONTROL_PROTECTEDPATH_DISABLE  (1 << 27)
> >  #define PIPE_CONTROL_PROTECTEDPATH_ENABLE   (1 << 22)
> > @@ -986,7 +983,7 @@ static void gen12_emit_pxp_state(struct intel_bb *ibb, bool enable,
> >  
> >  	if (enable) {
> >  		pipe_ctl_flags = PIPE_CONTROL_FLUSH_ENABLE;
> > -		intel_bb_out(ibb, GFX_OP_PIPE_CONTROL);
> > +		intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(2));
> >  		intel_bb_out(ibb, pipe_ctl_flags);
> >  
> >  		set_app_id =  MI_SET_APPID |
> > @@ -1005,7 +1002,7 @@ static void gen12_emit_pxp_state(struct intel_bb *ibb, bool enable,
> >  			   PIPE_CONTROL_RENDER_TARGET_FLUSH |
> >  			   PIPE_CONTROL_DATA_CACHE_INVALIDATE |
> >  			   PIPE_CONTROL_POST_SYNC_OP);
> > -	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL | 4);
> > +	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(6));
> >  	intel_bb_out(ibb, pipe_ctl_flags);
> >  	intel_bb_emit_reloc(ibb, ibb->handle, 0, I915_GEM_DOMAIN_COMMAND,
> >  			    (enable ? pxp_write_op_offset : (pxp_write_op_offset+8)),
> > @@ -1107,7 +1104,7 @@ void _gen9_render_op(struct intel_bb *ibb,
> >  
> >  	if (fast_clear) {
> >  		for (int i = 0; i < 4; i++) {
> > -			intel_bb_out(ibb, MI_STORE_DWORD_IMM);
> > +			intel_bb_out(ibb, MI_STORE_DWORD_IMM_GEN4);
> >  			intel_bb_emit_reloc(ibb, dst->handle,
> >  					    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
> >                                              dst->cc.offset + i*sizeof(float),
> > diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> > index 7ccc00aa25..46633b0385 100644
> > --- a/tests/i915/api_intel_bb.c
> > +++ b/tests/i915/api_intel_bb.c
> > @@ -1154,7 +1154,7 @@ static void delta_check(struct buf_ops *bops)
> >  	intel_bb_add_object(ibb, buf->handle, intel_buf_bo_size(buf),
> >  			    buf->addr.offset, 0, false);
> >  
> > -	intel_bb_out(ibb, MI_STORE_DWORD_IMM);
> > +	intel_bb_out(ibb, MI_STORE_DWORD_IMM_GEN4);
> >  	intel_bb_emit_reloc(ibb, buf->handle,
> >  			    I915_GEM_DOMAIN_RENDER,
> >  			    I915_GEM_DOMAIN_RENDER,
> > diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
> > index d9296cf2d1..9ea3925c38 100644
> > --- a/tests/i915/gem_blits.c
> > +++ b/tests/i915/gem_blits.c
> > @@ -27,8 +27,6 @@
> >  #include "igt.h"
> >  #include "igt_x86.h"
> >  
> > -#define MI_FLUSH_DW (0x26 << 23)
> > -
> >  #define BCS_SWCTRL 0x22200
> >  #define BCS_SRC_Y (1 << 0)
> >  #define BCS_DST_Y (1 << 1)
> > @@ -198,7 +196,7 @@ static void buffer_set_tiling(const struct device *device,
> >  	if ((tiling | buffer->tiling) >= I915_TILING_Y) {
> >  		unsigned int mask;
> >  
> > -		batch[i++] = MI_LOAD_REGISTER_IMM;
> > +		batch[i++] = MI_LOAD_REGISTER_IMM(1);
> >  		batch[i++] = BCS_SWCTRL;
> >  
> >  		mask = (BCS_SRC_Y | BCS_DST_Y) << 16;
> > @@ -248,12 +246,12 @@ static void buffer_set_tiling(const struct device *device,
> >  
> >  	if ((tiling | buffer->tiling) >= I915_TILING_Y) {
> >  		igt_assert(device->gen >= 6);
> > -		batch[i++] = MI_FLUSH_DW | 2;
> > +		batch[i++] = MI_FLUSH_DW_CMD | 2;
> >  		batch[i++] = 0;
> >  		batch[i++] = 0;
> >  		batch[i++] = 0;
> >  
> > -		batch[i++] = MI_LOAD_REGISTER_IMM;
> > +		batch[i++] = MI_LOAD_REGISTER_IMM(1);
> >  		batch[i++] = BCS_SWCTRL;
> >  		batch[i++] = (BCS_SRC_Y | BCS_DST_Y) << 16;
> >  	}
> > @@ -345,7 +343,7 @@ static bool blit_to_linear(const struct device *device,
> >  	if (buffer->tiling >= I915_TILING_Y) {
> >  		unsigned int mask;
> >  
> > -		batch[i++] = MI_LOAD_REGISTER_IMM;
> > +		batch[i++] = MI_LOAD_REGISTER_IMM(1);
> >  		batch[i++] = BCS_SWCTRL;
> >  
> >  		mask = (BCS_SRC_Y | BCS_DST_Y) << 16;
> > @@ -388,12 +386,12 @@ static bool blit_to_linear(const struct device *device,
> >  
> >  	if (buffer->tiling >= I915_TILING_Y) {
> >  		igt_assert(device->gen >= 6);
> > -		batch[i++] = MI_FLUSH_DW | 2;
> > +		batch[i++] = MI_FLUSH_DW_CMD | 2;
> >  		batch[i++] = 0;
> >  		batch[i++] = 0;
> >  		batch[i++] = 0;
> >  
> > -		batch[i++] = MI_LOAD_REGISTER_IMM;
> > +		batch[i++] = MI_LOAD_REGISTER_IMM(1);
> >  		batch[i++] = BCS_SWCTRL;
> >  		batch[i++] = (BCS_SRC_Y | BCS_DST_Y) << 16;
> >  	}
> > @@ -678,7 +676,7 @@ blit(const struct device *device,
> >  	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
> >  		unsigned int mask;
> >  
> > -		batch[i++] = MI_LOAD_REGISTER_IMM;
> > +		batch[i++] = MI_LOAD_REGISTER_IMM(1);
> >  		batch[i++] = BCS_SWCTRL;
> >  
> >  		mask = (BCS_SRC_Y | BCS_DST_Y) << 16;
> > @@ -729,12 +727,12 @@ blit(const struct device *device,
> >  
> >  	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
> >  		igt_assert(device->gen >= 6);
> > -		batch[i++] = MI_FLUSH_DW | 2;
> > +		batch[i++] = MI_FLUSH_DW_CMD | 2;
> >  		batch[i++] = 0;
> >  		batch[i++] = 0;
> >  		batch[i++] = 0;
> >  
> > -		batch[i++] = MI_LOAD_REGISTER_IMM;
> > +		batch[i++] = MI_LOAD_REGISTER_IMM(1);
> >  		batch[i++] = BCS_SWCTRL;
> >  		batch[i++] = (BCS_SRC_Y | BCS_DST_Y) << 16;
> >  	}
> > diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
> > index f11fa877d3..08a500a9ec 100644
> > --- a/tests/i915/gem_busy.c
> > +++ b/tests/i915/gem_busy.c
> > @@ -235,10 +235,10 @@ static void one(int fd, const intel_ctx_t *ctx,
> >  
> >  static void xchg_u32(void *array, unsigned i, unsigned j)
> >  {
> > -	uint32_t *u32 = array;
> > -	uint32_t tmp = u32[i];
> > -	u32[i] = u32[j];
> > -	u32[j] = tmp;
> > +	uint32_t *ui32 = array;
> > +	uint32_t tmp = ui32[i];
> > +	ui32[i] = ui32[j];
> > +	ui32[j] = tmp;
> 
> imho this is also change which can be done in code cleanup,
> not in your patchset.
> 

Same issue with typedef.

> >  }
> >  
> >  static void close_race(int fd, const intel_ctx_t *ctx)
> > diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> > index b7e8bda71b..44e35ee9b0 100644
> > --- a/tests/i915/gem_ccs.c
> > +++ b/tests/i915/gem_ccs.c
> > @@ -137,7 +137,7 @@ static void surf_copy(int i915,
> >  	surf.i915 = i915;
> >  	surf.print_bb = param.print_bb;
> >  	set_surf_object(&surf.src, mid->handle, mid->region, mid->size,
> > -			uc_mocs, INDIRECT_ACCESS);
> > +			uc_mocs, BLT_INDIRECT_ACCESS);
> >  	set_surf_object(&surf.dst, ccs, REGION_SMEM, ccssize,
> >  			uc_mocs, DIRECT_ACCESS);
> >  	bb_size = 4096;
> > diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> > index 18d8cc013d..3d73db581c 100644
> > --- a/tests/i915/gem_ctx_shared.c
> > +++ b/tests/i915/gem_ctx_shared.c
> > @@ -309,7 +309,7 @@ static void exec_shared_gtt(int i915, const intel_ctx_cfg_t *cfg,
> >  	batch = gem_create(i915, 4096);
> >  
> >  	i = 0;
> > -	cs[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	cs[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		cs[++i] = obj.offset;
> >  		cs[++i] = obj.offset >> 32;
> > @@ -564,7 +564,7 @@ static void store_dword(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
> >  	obj[2].relocation_count = !ahnd ? 1 : 0;
> >  
> >  	i = 0;
> > -	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		batch[++i] = reloc.presumed_offset + reloc.delta;
> >  		batch[++i] = 0;
> > diff --git a/tests/i915/gem_exec_async.c b/tests/i915/gem_exec_async.c
> > index d50fe45ec5..173bc4648a 100644
> > --- a/tests/i915/gem_exec_async.c
> > +++ b/tests/i915/gem_exec_async.c
> > @@ -73,7 +73,7 @@ static void store_dword(int fd, int id, const intel_ctx_t *ctx,
> >  	obj[1].relocation_count = !id ? 1 : 0;
> >  
> >  	i = 0;
> > -	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		batch[++i] = target_offset + offset;
> >  		batch[++i] = (target_offset + offset) >> 32;
> > diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> > index d7acdca190..1c655e583c 100644
> > --- a/tests/i915/gem_exec_balancer.c
> > +++ b/tests/i915/gem_exec_balancer.c
> > @@ -41,15 +41,6 @@
> >  
> >  IGT_TEST_DESCRIPTION("Exercise in-kernel load-balancing");
> >  
> > -#define MI_SEMAPHORE_WAIT		(0x1c << 23)
> > -#define   MI_SEMAPHORE_POLL             (1 << 15)
> > -#define   MI_SEMAPHORE_SAD_GT_SDD       (0 << 12)
> > -#define   MI_SEMAPHORE_SAD_GTE_SDD      (1 << 12)
> > -#define   MI_SEMAPHORE_SAD_LT_SDD       (2 << 12)
> > -#define   MI_SEMAPHORE_SAD_LTE_SDD      (3 << 12)
> > -#define   MI_SEMAPHORE_SAD_EQ_SDD       (4 << 12)
> > -#define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
> > -
> >  #define INSTANCE_COUNT (1 << I915_PMU_SAMPLE_INSTANCE_BITS)
> >  
> >  static size_t sizeof_load_balance(int count)
> > @@ -589,7 +580,7 @@ static uint32_t create_semaphore_to_spinner(int i915, igt_spin_t *spin)
> >  
> >  	/* Wait until the spinner is running */
> >  	addr = spin->obj[0].offset + 4 * SPIN_POLL_START_IDX;
> > -	*cs++ = MI_SEMAPHORE_WAIT |
> > +	*cs++ = MI_SEMAPHORE_WAIT_CMD |
> >  		MI_SEMAPHORE_POLL |
> >  		MI_SEMAPHORE_SAD_NEQ_SDD |
> >  		(4 - 2);
> > @@ -600,7 +591,7 @@ static uint32_t create_semaphore_to_spinner(int i915, igt_spin_t *spin)
> >  	/* Then cancel the spinner */
> >  	addr = spin->obj[IGT_SPIN_BATCH].offset +
> >  		offset_in_page(spin->condition);
> > -	*cs++ = MI_STORE_DWORD_IMM;
> > +	*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  	*cs++ = addr;
> >  	*cs++ = addr >> 32;
> >  	*cs++ = MI_BATCH_BUFFER_END;
> > @@ -1116,7 +1107,7 @@ static uint32_t sync_from(int i915, uint32_t addr, uint32_t target)
> >  	cs = map = gem_mmap__device_coherent(i915, handle, 0, 4096, PROT_WRITE);
> >  
> >  	/* cancel target spinner */
> > -	*cs++ = MI_STORE_DWORD_IMM;
> > +	*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  	*cs++ = target + 64;
> >  	*cs++ = 0;
> >  	*cs++ = 0;
> > @@ -1131,7 +1122,7 @@ static uint32_t sync_from(int i915, uint32_t addr, uint32_t target)
> >  	*cs++ = 0;
> >  
> >  	/* self-heal */
> > -	*cs++ = MI_STORE_DWORD_IMM;
> > +	*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  	*cs++ = addr + 64;
> >  	*cs++ = 0;
> >  	*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
> > @@ -1162,13 +1153,13 @@ static uint32_t sync_to(int i915, uint32_t addr, uint32_t target)
> >  	*cs++ = MI_NOOP;
> >  
> >  	/* cancel their spin as a compliment */
> > -	*cs++ = MI_STORE_DWORD_IMM;
> > +	*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  	*cs++ = target + 64;
> >  	*cs++ = 0;
> >  	*cs++ = 0;
> >  
> >  	/* self-heal */
> > -	*cs++ = MI_STORE_DWORD_IMM;
> > +	*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  	*cs++ = addr + 64;
> >  	*cs++ = 0;
> >  	*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
> > @@ -1906,7 +1897,7 @@ static uint32_t sema_create(int i915, uint64_t addr, uint32_t **x)
> >  	for (int n = 1; n <= 32; n++) {
> >  		uint32_t *cs = *x + n * 16;
> >  
> > -		*cs++ = MI_SEMAPHORE_WAIT |
> > +		*cs++ = MI_SEMAPHORE_WAIT_CMD |
> >  			MI_SEMAPHORE_POLL |
> >  			MI_SEMAPHORE_SAD_GTE_SDD |
> >  			(4 - 2);
> > diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> > index 2db58266fd..d0499a8312 100644
> > --- a/tests/i915/gem_exec_capture.c
> > +++ b/tests/i915/gem_exec_capture.c
> > @@ -308,7 +308,7 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
> >  			I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
> >  
> >  	i = 0;
> > -	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		batch[++i] = obj[SCRATCH].offset;
> >  		batch[++i] = obj[SCRATCH].offset >> 32;
> > @@ -498,7 +498,7 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
> >  			I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
> >  
> >  	i = 0;
> > -	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		batch[++i] = obj[0].offset;
> >  		batch[++i] = obj[0].offset >> 32;
> > diff --git a/tests/i915/gem_exec_endless.c b/tests/i915/gem_exec_endless.c
> > index 2c56cc2120..77719de83b 100644
> > --- a/tests/i915/gem_exec_endless.c
> > +++ b/tests/i915/gem_exec_endless.c
> > @@ -33,15 +33,6 @@
> >  
> >  #define MAX_ENGINES 64
> >  
> > -#define MI_SEMAPHORE_WAIT		(0x1c << 23)
> > -#define   MI_SEMAPHORE_POLL             (1 << 15)
> > -#define   MI_SEMAPHORE_SAD_GT_SDD       (0 << 12)
> > -#define   MI_SEMAPHORE_SAD_GTE_SDD      (1 << 12)
> > -#define   MI_SEMAPHORE_SAD_LT_SDD       (2 << 12)
> > -#define   MI_SEMAPHORE_SAD_LTE_SDD      (3 << 12)
> > -#define   MI_SEMAPHORE_SAD_EQ_SDD       (4 << 12)
> > -#define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
> > -
> >  static uint32_t batch_create(int i915)
> >  {
> >  	const uint32_t bbe = MI_BATCH_BUFFER_END;
> > @@ -133,7 +124,7 @@ static void __supervisor_run(struct supervisor *sv)
> >  
> >  	sv->semaphore = cs + 1000;
> >  
> > -	*cs++ = MI_SEMAPHORE_WAIT |
> > +	*cs++ = MI_SEMAPHORE_WAIT_CMD |
> >  		MI_SEMAPHORE_POLL |
> >  		MI_SEMAPHORE_SAD_EQ_SDD |
> >  		(4 - 2);
> > @@ -142,7 +133,7 @@ static void __supervisor_run(struct supervisor *sv)
> >  	*cs++ = 0;
> >  
> >  	sv->terminate = cs;
> > -	*cs++ = MI_STORE_DWORD_IMM;
> > +	*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  	*cs++ = offset_in_page(sv->semaphore);
> >  	*cs++ = 0;
> >  	*cs++ = 0;
> > diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
> > index 93a138ba47..8208ab404e 100644
> > --- a/tests/i915/gem_exec_fair.c
> > +++ b/tests/i915/gem_exec_fair.c
> > @@ -131,7 +131,7 @@ static void delay(int i915,
> >  
> >  	cs = map = gem_mmap__device_coherent(i915, handle, 0, 4096, PROT_WRITE);
> >  
> > -	*cs++ = MI_LOAD_REGISTER_IMM;
> > +	*cs++ = MI_LOAD_REGISTER_IMM(1);
> >  	*cs++ = CS_GPR(START_TS) + 4;
> >  	*cs++ = 0;
> >  	*cs++ = MI_LOAD_REGISTER_REG;
> > @@ -144,7 +144,7 @@ static void delay(int i915,
> >  
> >  	*cs++ = 0x5 << 23; /* MI_ARB_CHECK */
> >  
> > -	*cs++ = MI_LOAD_REGISTER_IMM;
> > +	*cs++ = MI_LOAD_REGISTER_IMM(1);
> >  	*cs++ = CS_GPR(NOW_TS) + 4;
> >  	*cs++ = 0;
> >  	*cs++ = MI_LOAD_REGISTER_REG;
> > @@ -166,7 +166,7 @@ static void delay(int i915,
> >  
> >  	/* Delay between SRM and COND_BBE to post the writes */
> >  	for (int n = 0; n < 8; n++) {
> > -		*cs++ = MI_STORE_DWORD_IMM;
> > +		*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  		if (use_64b) {
> >  			*cs++ = addr + 4064;
> >  			*cs++ = addr >> 32;
> > @@ -244,25 +244,25 @@ static void tslog(int i915,
> >  	*cs++ = addr >> 32;
> >  
> >  	/* Load the address + inc & mask variables */
> > -	*cs++ = MI_LOAD_REGISTER_IMM;
> > +	*cs++ = MI_LOAD_REGISTER_IMM(1);
> >  	*cs++ = CS_GPR(ADDR);
> >  	addr_lo = cs;
> >  	*cs++ = addr;
> > -	*cs++ = MI_LOAD_REGISTER_IMM;
> > +	*cs++ = MI_LOAD_REGISTER_IMM(1);
> >  	*cs++ = CS_GPR(ADDR) + 4;
> >  	*cs++ = addr >> 32;
> >  
> > -	*cs++ = MI_LOAD_REGISTER_IMM;
> > +	*cs++ = MI_LOAD_REGISTER_IMM(1);
> >  	*cs++ = CS_GPR(INC);
> >  	*cs++ = 4;
> > -	*cs++ = MI_LOAD_REGISTER_IMM;
> > +	*cs++ = MI_LOAD_REGISTER_IMM(1);
> >  	*cs++ = CS_GPR(INC) + 4;
> >  	*cs++ = 0;
> >  
> > -	*cs++ = MI_LOAD_REGISTER_IMM;
> > +	*cs++ = MI_LOAD_REGISTER_IMM(1);
> >  	*cs++ = CS_GPR(MASK);
> >  	*cs++ = 0xfffff7ff;
> > -	*cs++ = MI_LOAD_REGISTER_IMM;
> > +	*cs++ = MI_LOAD_REGISTER_IMM(1);
> >  	*cs++ = CS_GPR(MASK) + 4;
> >  	*cs++ = 0xffffffff;
> >  
> > diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> > index 6bf1cdb577..c2d874f84b 100644
> > --- a/tests/i915/gem_exec_fence.c
> > +++ b/tests/i915/gem_exec_fence.c
> > @@ -50,15 +50,6 @@ struct sync_merge_data {
> >  #define SYNC_IOC_MERGE _IOWR(SYNC_IOC_MAGIC, 3, struct sync_merge_data)
> >  #endif
> >  
> > -#define MI_SEMAPHORE_WAIT		(0x1c << 23)
> > -#define   MI_SEMAPHORE_POLL             (1 << 15)
> > -#define   MI_SEMAPHORE_SAD_GT_SDD       (0 << 12)
> > -#define   MI_SEMAPHORE_SAD_GTE_SDD      (1 << 12)
> > -#define   MI_SEMAPHORE_SAD_LT_SDD       (2 << 12)
> > -#define   MI_SEMAPHORE_SAD_LTE_SDD      (3 << 12)
> > -#define   MI_SEMAPHORE_SAD_EQ_SDD       (4 << 12)
> > -#define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
> > -
> >  static bool fence_busy(int fence)
> >  {
> >  	return poll(&(struct pollfd){fence, POLLIN}, 1, 0) == 0;
> > @@ -345,7 +336,7 @@ static uint32_t timeslicing_batches(int i915, uint32_t *offset)
> >  		for (int step = 0; step < 8; step++) {
> >  			if (pair) {
> >  				cs[i++] =
> > -					MI_SEMAPHORE_WAIT |
> > +					MI_SEMAPHORE_WAIT_CMD |
> >  					MI_SEMAPHORE_POLL |
> >  					MI_SEMAPHORE_SAD_EQ_SDD |
> >  					(4 - 2);
> > @@ -354,14 +345,14 @@ static uint32_t timeslicing_batches(int i915, uint32_t *offset)
> >  				cs[i++] = 0;
> >  			}
> >  
> > -			cs[i++] = MI_STORE_DWORD_IMM;
> > +			cs[i++] = MI_STORE_DWORD_IMM_GEN4;
> >  			cs[i++] = *offset;
> >  			cs[i++] = 0;
> >  			cs[i++] = x++;
> >  
> >  			if (!pair) {
> >  				cs[i++] =
> > -					MI_SEMAPHORE_WAIT |
> > +					MI_SEMAPHORE_WAIT_CMD |
> >  					MI_SEMAPHORE_POLL |
> >  					MI_SEMAPHORE_SAD_EQ_SDD |
> >  					(4 - 2);
> > @@ -452,7 +443,7 @@ static uint32_t submitN_batches(int i915, uint32_t offset, int count)
> >  
> >  		for (int step = 0; step < 8; step++) {
> >  			cs[i++] =
> > -				MI_SEMAPHORE_WAIT |
> > +				MI_SEMAPHORE_WAIT_CMD |
> >  				MI_SEMAPHORE_POLL |
> >  				MI_SEMAPHORE_SAD_EQ_SDD |
> >  				(4 - 2);
> > @@ -460,7 +451,7 @@ static uint32_t submitN_batches(int i915, uint32_t offset, int count)
> >  			cs[i++] = offset;
> >  			cs[i++] = 0;
> >  
> > -			cs[i++] = MI_STORE_DWORD_IMM;
> > +			cs[i++] = MI_STORE_DWORD_IMM_GEN4;
> >  			cs[i++] = offset;
> >  			cs[i++] = 0;
> >  			cs[i++] = x + 1;
> > @@ -606,7 +597,7 @@ static void test_parallel(int i915, const intel_ctx_t *ctx,
> >  		}
> >  
> >  		i = 0;
> > -		batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +		batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  		if (gen >= 8) {
> >  			batch[++i] = scratch_offset + reloc.delta;
> >  			batch[++i] = scratch_offset >> 32;
> > @@ -726,7 +717,7 @@ static void test_concurrent(int i915, const intel_ctx_t *ctx,
> >  	close(fence);
> >  
> >  	i = 0;
> > -	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		batch[++i] = target_offset + reloc.delta;
> >  		batch[++i] = target_offset >> 32;
> > @@ -2464,21 +2455,21 @@ build_wait_bb(int i915,
> >  	map = gem_mmap__device_coherent(i915, obj.handle, 0, 4096, PROT_WRITE);
> >  	bb = map;
> >  
> > -	*bb++ = MI_LOAD_REGISTER_IMM;
> > +	*bb++ = MI_LOAD_REGISTER_IMM(1);
> >  	*bb++ = mmio_base + HSW_CS_GPR(0);
> >  	*bb++ = wait_value & 0xffffffff;
> > -	*bb++ = MI_LOAD_REGISTER_IMM;
> > +	*bb++ = MI_LOAD_REGISTER_IMM(1);
> >  	*bb++ = mmio_base + HSW_CS_GPR(0) + 4;
> >  	*bb++ = wait_value >> 32;
> >  
> >  	*bb++ = MI_LOAD_REGISTER_REG;
> >  	*bb++ = mmio_base + RING_TIMESTAMP;
> >  	*bb++ = mmio_base + HSW_CS_GPR(1);
> > -	*bb++ = MI_LOAD_REGISTER_IMM;
> > +	*bb++ = MI_LOAD_REGISTER_IMM(1);
> >  	*bb++ = mmio_base + HSW_CS_GPR(1) + 4;
> >  	*bb++ = 0;
> >  
> > -	*bb++ = MI_LOAD_REGISTER_IMM;
> > +	*bb++ = MI_LOAD_REGISTER_IMM(1);
> >  	*bb++ = mmio_base + HSW_CS_GPR(2) + 4;
> >  	*bb++ = 0;
> >  	relocs->delta = offset_in_page(bb);
> > @@ -2563,23 +2554,23 @@ static void build_increment_engine_bb(struct inter_engine_batches *batch,
> >  {
> >  	uint32_t *bb = batch->increment_bb = calloc(1, 4096);
> >  
> > -	*bb++ = MI_LOAD_REGISTER_MEM | 2;
> > +	*bb++ = MI_LOAD_REGISTER_MEM_CMD | 2;
> >  	*bb++ = mmio_base + HSW_CS_GPR(0);
> >  	batch->read0_ptrs[0] = bb;
> >  	*bb++ = 0;
> >  	*bb++ = 0;
> > -	*bb++ = MI_LOAD_REGISTER_MEM | 2;
> > +	*bb++ = MI_LOAD_REGISTER_MEM_CMD | 2;
> >  	*bb++ = mmio_base + HSW_CS_GPR(0) + 4;
> >  	batch->read0_ptrs[1] = bb;
> >  	*bb++ = 0;
> >  	*bb++ = 0;
> >  
> > -	*bb++ = MI_LOAD_REGISTER_MEM | 2;
> > +	*bb++ = MI_LOAD_REGISTER_MEM_CMD | 2;
> >  	*bb++ = mmio_base + HSW_CS_GPR(1);
> >  	batch->read1_ptrs[0] = bb;
> >  	*bb++ = 0;
> >  	*bb++ = 0;
> > -	*bb++ = MI_LOAD_REGISTER_MEM | 2;
> > +	*bb++ = MI_LOAD_REGISTER_MEM_CMD | 2;
> >  	*bb++ = mmio_base + HSW_CS_GPR(1) + 4;
> >  	batch->read1_ptrs[1] = bb;
> >  	*bb++ = 0;
> > @@ -2591,12 +2582,12 @@ static void build_increment_engine_bb(struct inter_engine_batches *batch,
> >  	*bb++ = MI_MATH_ADD;
> >  	*bb++ = MI_MATH_STORE(MI_MATH_REG(0), MI_MATH_REG_ACCU);
> >  
> > -	*bb++ = MI_STORE_REGISTER_MEM | 2;
> > +	*bb++ = MI_STORE_REGISTER_MEM_GEN8;
> >  	*bb++ = mmio_base + HSW_CS_GPR(0);
> >  	batch->write_ptrs[0] = bb;
> >  	*bb++ = 0;
> >  	*bb++ = 0;
> > -	*bb++ = MI_STORE_REGISTER_MEM | 2;
> > +	*bb++ = MI_STORE_REGISTER_MEM_GEN8;
> >  	*bb++ = mmio_base + HSW_CS_GPR(0) + 4;
> >  	batch->write_ptrs[1] = bb;
> >  	*bb++ = 0;
> > diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
> > index 40c58db2bb..bb120e0d6c 100644
> > --- a/tests/i915/gem_exec_flush.c
> > +++ b/tests/i915/gem_exec_flush.c
> > @@ -208,7 +208,7 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
> >  			reloc0[i].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
> >  
> >  			offset = obj[0].offset + reloc0[i].delta;
> > -			*b++ = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +			*b++ = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  			if (gen >= 8) {
> >  				*b++ = offset;
> >  				*b++ = offset >> 32;
> > @@ -242,7 +242,7 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
> >  			reloc1[i].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
> >  
> >  			offset = obj[0].offset + reloc1[i].delta;
> > -			*b++ = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +			*b++ = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  			if (gen >= 8) {
> >  				*b++ = offset;
> >  				*b++ = offset >> 32;
> > @@ -496,7 +496,7 @@ static void batch(int fd, unsigned ring, int nchild, int timeout,
> >  				reloc.delta = i * sizeof(uint32_t);
> >  
> >  				offset = reloc.presumed_offset + reloc.delta;
> > -				*b++ = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +				*b++ = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  				if (gen >= 8) {
> >  					*b++ = offset;
> >  					*b++ = offset >> 32;
> > diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> > index 137277fe53..d6c8f21920 100644
> > --- a/tests/i915/gem_exec_gttfill.c
> > +++ b/tests/i915/gem_exec_gttfill.c
> > @@ -70,7 +70,7 @@ static void submit(int fd, uint64_t ahnd, unsigned int gen,
> >  	reloc[1].read_domains = I915_GEM_DOMAIN_INSTRUCTION;
> >  
> >  	n = 0;
> > -	batch[n] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	batch[n] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		batch[n] |= 1 << 21;
> >  		batch[n]++;
> > diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
> > index f35cc8401f..497f57f082 100644
> > --- a/tests/i915/gem_exec_nop.c
> > +++ b/tests/i915/gem_exec_nop.c
> > @@ -144,7 +144,7 @@ static void poll_ring(int fd, const intel_ctx_t *ctx,
> >  		r->delta = 4092;
> >  		r->read_domains = I915_GEM_DOMAIN_RENDER;
> >  
> > -		*b = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +		*b = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  		if (gen >= 8) {
> >  			*++b = r->delta;
> >  			*++b = 0;
> > @@ -272,7 +272,7 @@ static void poll_sequential(int fd, const intel_ctx_t *ctx,
> >  		r->read_domains = I915_GEM_DOMAIN_RENDER;
> >  		r->write_domain = I915_GEM_DOMAIN_RENDER;
> >  
> > -		*b = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +		*b = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  		if (gen >= 8) {
> >  			*++b = r->delta;
> >  			*++b = 0;
> > diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
> > index 429620884b..705b22cb9f 100644
> > --- a/tests/i915/gem_exec_parallel.c
> > +++ b/tests/i915/gem_exec_parallel.c
> > @@ -92,7 +92,7 @@ static void *thread(void *data)
> >  	}
> >  
> >  	i = 0;
> > -	batch[i] = MI_STORE_DWORD_IMM | (t->gen < 6 ? 1 << 22 : 0);
> > +	batch[i] = MI_STORE_DWORD_IMM_GEN4 | (t->gen < 6 ? 1 << 22 : 0);
> >  	if (t->gen >= 8) {
> >  		batch[++i] = 4*t->id;
> >  		batch[++i] = 0;
> > diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
> > index fd86afa16d..d0805d330f 100644
> > --- a/tests/i915/gem_exec_params.c
> > +++ b/tests/i915/gem_exec_params.c
> > @@ -120,7 +120,7 @@ static void test_batch_first(int fd)
> >  	map = gem_mmap__cpu(fd, obj[0].handle, 0, 4096, PROT_WRITE);
> >  	gem_set_domain(fd, obj[0].handle,
> >  			I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
> > -	map[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	map[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		map[++i] = obj[1].offset;
> >  		map[++i] = obj[1].offset >> 32;
> > @@ -152,7 +152,7 @@ static void test_batch_first(int fd)
> >  	map = gem_mmap__cpu(fd, obj[2].handle, 0, 4096, PROT_WRITE);
> >  	gem_set_domain(fd, obj[2].handle,
> >  			I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
> > -	map[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	map[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		map[++i] = obj[1].offset;
> >  		map[++i] = obj[1].offset >> 32;
> > diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> > index 7a354a32a1..3ce89ca649 100644
> > --- a/tests/i915/gem_exec_reloc.c
> > +++ b/tests/i915/gem_exec_reloc.c
> > @@ -79,7 +79,7 @@ static void write_dword(int fd,
> >  	obj[1].handle = gem_create(fd, 4096);
> >  
> >  	i = 0;
> > -	buf[i++] = MI_STORE_DWORD_IMM | (gen < 6 ? 1<<22 : 0);
> > +	buf[i++] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1<<22 : 0);
> >  	if (gen >= 8) {
> >  		buf[i++] = target_offset;
> >  		buf[i++] = target_offset >> 32;
> > @@ -314,7 +314,7 @@ static void active(int fd, const intel_ctx_t *ctx, unsigned engine)
> >  	for (pass = 0; pass < 1024; pass++) {
> >  		uint32_t batch[16];
> >  		int i = 0;
> > -		batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +		batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  		if (gen >= 8) {
> >  			batch[++i] = 0;
> >  			batch[++i] = 0;
> > @@ -526,17 +526,6 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
> >  	gem_close(fd, obj.handle);
> >  }
> >  
> > -static inline uint64_t sign_extend(uint64_t x, int index)
> > -{
> > -	int shift = 63 - index;
> > -	return (int64_t)(x << shift) >> shift;
> > -}
> > -
> > -static uint64_t gen8_canonical_address(uint64_t address)
> > -{
> > -	return sign_extend(address, 47);
> > -}
> > -
> >  static void basic_range(int fd, unsigned flags)
> >  {
> >  	struct drm_i915_gem_relocation_entry reloc[128];
> > @@ -563,7 +552,7 @@ static void basic_range(int fd, unsigned flags)
> >  	for (int i = 0; i <= count; i++) {
> >  		obj[n].handle = gem_create(fd, 4096);
> >  		obj[n].offset = (1ull << (i + 12)) - 4096;
> > -		obj[n].offset = gen8_canonical_address(obj[n].offset);
> > +		obj[n].offset = gen8_canonical_addr(obj[n].offset);
> >  		obj[n].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> >  		gem_write(fd, obj[n].handle, 0, &bbe, sizeof(bbe));
> >  		execbuf.buffers_ptr = to_user_pointer(&obj[n]);
> > @@ -583,7 +572,7 @@ static void basic_range(int fd, unsigned flags)
> >  	for (int i = 1; i < count; i++) {
> >  		obj[n].handle = gem_create(fd, 4096);
> >  		obj[n].offset = 1ull << (i + 12);
> > -		obj[n].offset = gen8_canonical_address(obj[n].offset);
> > +		obj[n].offset = gen8_canonical_addr(obj[n].offset);
> >  		obj[n].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> >  		gem_write(fd, obj[n].handle, 0, &bbe, sizeof(bbe));
> >  		execbuf.buffers_ptr = to_user_pointer(&obj[n]);
> > @@ -714,10 +703,10 @@ static int flags_to_index(const struct intel_execution_engine2 *e)
> >  
> >  static void xchg_u32(void *array, unsigned i, unsigned j)
> >  {
> > -	uint32_t *u32 = array;
> > -	uint32_t tmp = u32[i];
> > -	u32[i] = u32[j];
> > -	u32[j] = tmp;
> > +	uint32_t *ui32 = array;
> > +	uint32_t tmp = ui32[i];
> > +	ui32[i] = ui32[j];
> > +	ui32[j] = tmp;
> 
> Drop this change to separate code cleanup/refactor.
> 

Ditto.

> >  }
> >  
> >  static void concurrent_child(int i915, const intel_ctx_t *ctx,
> > @@ -790,7 +779,7 @@ static uint32_t create_concurrent_batch(int i915, unsigned int count)
> >  	uint32_t *map, *cs;
> >  	uint32_t cmd;
> >  
> > -	cmd = MI_STORE_DWORD_IMM;
> > +	cmd = MI_STORE_DWORD_IMM_GEN4;
> >  	if (gen < 6)
> >  		cmd |= 1 << 22;
> >  	if (gen < 4)
> > diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> > index 58b118c79e..ab1dd7749b 100644
> > --- a/tests/i915/gem_exec_schedule.c
> > +++ b/tests/i915/gem_exec_schedule.c
> > @@ -55,15 +55,6 @@
> >  #define MAX_CONTEXTS 1024
> >  #define MAX_ELSP_QLEN 16
> >  
> > -#define MI_SEMAPHORE_WAIT		(0x1c << 23)
> > -#define   MI_SEMAPHORE_POLL             (1 << 15)
> > -#define   MI_SEMAPHORE_SAD_GT_SDD       (0 << 12)
> > -#define   MI_SEMAPHORE_SAD_GTE_SDD      (1 << 12)
> > -#define   MI_SEMAPHORE_SAD_LT_SDD       (2 << 12)
> > -#define   MI_SEMAPHORE_SAD_LTE_SDD      (3 << 12)
> > -#define   MI_SEMAPHORE_SAD_EQ_SDD       (4 << 12)
> > -#define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
> > -
> >  IGT_TEST_DESCRIPTION("Check that we can control the order of execution");
> >  
> >  static unsigned int offset_in_page(void *addr)
> > @@ -148,7 +139,7 @@ static uint32_t __store_dword(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
> >  	obj[2].relocation_count = !ahnd ? 1 : 0;
> >  
> >  	i = 0;
> > -	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		batch[++i] = reloc.presumed_offset + reloc.delta;
> >  		batch[++i] = (reloc.presumed_offset + reloc.delta) >> 32;
> > @@ -521,7 +512,7 @@ static uint32_t timeslicing_batches(int i915, uint32_t *offset)
> >  		for (int step = 0; step < 8; step++) {
> >  			if (pair) {
> >  				cs[i++] =
> > -					MI_SEMAPHORE_WAIT |
> > +					MI_SEMAPHORE_WAIT_CMD |
> >  					MI_SEMAPHORE_POLL |
> >  					MI_SEMAPHORE_SAD_EQ_SDD |
> >  					(4 - 2);
> > @@ -530,14 +521,14 @@ static uint32_t timeslicing_batches(int i915, uint32_t *offset)
> >  				cs[i++] = 0;
> >  			}
> >  
> > -			cs[i++] = MI_STORE_DWORD_IMM;
> > +			cs[i++] = MI_STORE_DWORD_IMM_GEN4;
> >  			cs[i++] = *offset;
> >  			cs[i++] = 0;
> >  			cs[i++] = x++;
> >  
> >  			if (!pair) {
> >  				cs[i++] =
> > -					MI_SEMAPHORE_WAIT |
> > +					MI_SEMAPHORE_WAIT_CMD |
> >  					MI_SEMAPHORE_POLL |
> >  					MI_SEMAPHORE_SAD_EQ_SDD |
> >  					(4 - 2);
> > @@ -629,7 +620,7 @@ static uint32_t timesliceN_batches(int i915, uint32_t offset, int count)
> >  
> >  		for (int step = 0; step < 8; step++) {
> >  			cs[i++] =
> > -				MI_SEMAPHORE_WAIT |
> > +				MI_SEMAPHORE_WAIT_CMD |
> >  				MI_SEMAPHORE_POLL |
> >  				MI_SEMAPHORE_SAD_EQ_SDD |
> >  				(4 - 2);
> > @@ -637,7 +628,7 @@ static uint32_t timesliceN_batches(int i915, uint32_t offset, int count)
> >  			cs[i++] = offset;
> >  			cs[i++] = 0;
> >  
> > -			cs[i++] = MI_STORE_DWORD_IMM;
> > +			cs[i++] = MI_STORE_DWORD_IMM_GEN4;
> >  			cs[i++] = offset;
> >  			cs[i++] = 0;
> >  			cs[i++] = x + 1;
> > @@ -797,7 +788,7 @@ static void cancel_spinner(int i915,
> >  	map = gem_mmap__device_coherent(i915, obj.handle, 0, 4096, PROT_WRITE);
> >  	cs = map;
> >  
> > -	*cs++ = MI_STORE_DWORD_IMM;
> > +	*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  	*cs++ = spin->obj[IGT_SPIN_BATCH].offset +
> >  		offset_in_page(spin->condition);
> >  	*cs++ = spin->obj[IGT_SPIN_BATCH].offset >> 32;
> > @@ -1108,13 +1099,13 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
> >  		cs = map = gem_mmap__cpu(i915, handle, 0, 4096, PROT_WRITE);
> >  
> >  		/* Set semaphore initially to 1 for polling and signaling */
> > -		*cs++ = MI_STORE_DWORD_IMM;
> > +		*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  		*cs++ = SEMAPHORE_ADDR;
> >  		*cs++ = 0;
> >  		*cs++ = 1;
> >  
> >  		/* Wait until another batch writes to our semaphore */
> > -		*cs++ = MI_SEMAPHORE_WAIT |
> > +		*cs++ = MI_SEMAPHORE_WAIT_CMD |
> >  			MI_SEMAPHORE_POLL |
> >  			MI_SEMAPHORE_SAD_EQ_SDD |
> >  			(4 - 2);
> > @@ -1123,7 +1114,7 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
> >  		*cs++ = 0;
> >  
> >  		/* Then cancel the spinner */
> > -		*cs++ = MI_STORE_DWORD_IMM;
> > +		*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  		*cs++ = spin->obj[IGT_SPIN_BATCH].offset +
> >  			offset_in_page(spin->condition);
> >  		*cs++ = 0;
> > @@ -1161,7 +1152,7 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
> >  		/* Now the semaphore is spinning, cancel it */
> >  		cancel = gem_create(i915, 4096);
> >  		cs = map = gem_mmap__cpu(i915, cancel, 0, 4096, PROT_WRITE);
> > -		*cs++ = MI_STORE_DWORD_IMM;
> > +		*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  		*cs++ = SEMAPHORE_ADDR;
> >  		*cs++ = 0;
> >  		*cs++ = 0;
> > @@ -1203,7 +1194,7 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
> >  	const intel_ctx_t *ctx0, *ctx1;
> >  	uint64_t ahnd;
> >  
> > -	igt_require(gen >= 6); /* MI_STORE_DWORD_IMM convenience */
> > +	igt_require(gen >= 6); /* MI_STORE_DWORD_IMM_GEN4 convenience */
> >  
> >  	ctx0 = intel_ctx_create(i915, cfg);
> >  	ctx1 = intel_ctx_create(i915, cfg);
> > @@ -1233,7 +1224,7 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
> >  		cs = map = gem_mmap__cpu(i915, handle, 0, 4096, PROT_WRITE);
> >  
> >  		/* Cancel the following spinner */
> > -		*cs++ = MI_STORE_DWORD_IMM;
> > +		*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  		if (gen >= 8) {
> >  			*cs++ = spin->obj[IGT_SPIN_BATCH].offset +
> >  				offset_in_page(spin->condition);
> > @@ -1359,14 +1350,14 @@ noreorder(int i915, const intel_ctx_cfg_t *cfg,
> >  	addr = spin->obj[IGT_SPIN_BATCH].offset +
> >  		offset_in_page(spin->condition);
> >  	if (gen >= 8) {
> > -		*cs++ = MI_STORE_DWORD_IMM;
> > +		*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  		*cs++ = addr;
> >  		addr >>= 32;
> >  	} else if (gen >= 4) {
> > -		*cs++ = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +		*cs++ = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  		*cs++ = 0;
> >  	} else {
> > -		*cs++ = (MI_STORE_DWORD_IMM | 1 << 22) - 1;
> > +		*cs++ = (MI_STORE_DWORD_IMM_GEN4 | 1 << 22) - 1;
> >  	}
> >  	*cs++ = addr;
> >  	*cs++ = MI_BATCH_BUFFER_END;
> > @@ -2294,7 +2285,7 @@ static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
> >  			addr = reloc.presumed_offset + reloc.delta;
> >  
> >  			i = execbuf.batch_start_offset / sizeof(uint32_t);
> > -			batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +			batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  			if (gen >= 8) {
> >  				batch[++i] = addr;
> >  				batch[++i] = addr >> 32;
> > diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
> > index efb9907ebb..7d23bcd5b4 100644
> > --- a/tests/i915/gem_exec_store.c
> > +++ b/tests/i915/gem_exec_store.c
> > @@ -94,7 +94,7 @@ static void store_dword(int fd, const intel_ctx_t *ctx,
> >  	}
> >  
> >  	i = 0;
> > -	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		batch[++i] = obj[0].offset;
> >  		batch[++i] = obj[0].offset >> 32;
> > @@ -180,7 +180,7 @@ static void store_cachelines(int fd, const intel_ctx_t *ctx,
> >  		reloc[n].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
> >  		dst_offset = CANONICAL(reloc[n].presumed_offset + reloc[n].delta);
> >  
> > -		batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +		batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  		if (gen >= 8) {
> >  			batch[++i] = dst_offset;
> >  			batch[++i] = dst_offset >> 32;
> > @@ -283,7 +283,7 @@ static void store_all(int fd, const intel_ctx_t *ctx)
> >  
> >  	offset = sizeof(uint32_t);
> >  	i = 0;
> > -	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		batch[address = ++i] = 0;
> >  		batch[++i] = 0;
> > diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
> > index 3b59966a11..1dadf06df0 100644
> > --- a/tests/i915/gem_exec_suspend.c
> > +++ b/tests/i915/gem_exec_suspend.c
> > @@ -159,7 +159,7 @@ static void run_test(int fd, const intel_ctx_t *ctx,
> >  		}
> >  
> >  		b = 0;
> > -		buf[b] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +		buf[b] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  		if (gen >= 8) {
> >  			buf[++b] = offset;
> >  			buf[++b] = offset >> 32;
> > diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
> > index 616231aa96..29d96cdcaa 100644
> > --- a/tests/i915/gem_exec_whisper.c
> > +++ b/tests/i915/gem_exec_whisper.c
> > @@ -312,7 +312,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
> >  		}
> >  
> >  		i = 0;
> > -		batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +		batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  		if (gen >= 8) {
> >  			batch[++i] = store.offset + loc;
> >  			batch[++i] = (store.offset + loc) >> 32;
> > diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
> > index df3da9f5b2..59959a3742 100644
> > --- a/tests/i915/gem_pipe_control_store_loop.c
> > +++ b/tests/i915/gem_pipe_control_store_loop.c
> > @@ -48,7 +48,6 @@ IGT_TEST_DESCRIPTION("Test (TLB-)Coherency of pipe_control QW writes.");
> >  
> >  static struct buf_ops *bops;
> >  
> > -#define GFX_OP_PIPE_CONTROL	((0x3<<29)|(0x3<<27)|(0x2<<24)|2)
> >  #define   PIPE_CONTROL_WRITE_IMMEDIATE	(1<<14)
> >  #define   PIPE_CONTROL_WRITE_TIMESTAMP	(3<<14)
> >  #define   PIPE_CONTROL_DEPTH_STALL (1<<13)
> > @@ -96,7 +95,7 @@ store_pipe_control_loop(bool preuse_buffer, int timeout)
> >  		 * support code will do that for us. */
> >  		if (ibb->gen >= 8) {
> >  			intel_bb_add_intel_buf(ibb, target_buf, true);
> > -			intel_bb_out(ibb, GFX_OP_PIPE_CONTROL + 1);
> > +			intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(5));
> >  			intel_bb_out(ibb, PIPE_CONTROL_WRITE_IMMEDIATE);
> >  			intel_bb_emit_reloc_fenced(ibb, target_buf->handle,
> >  						   I915_GEM_DOMAIN_INSTRUCTION,
> > @@ -108,13 +107,13 @@ store_pipe_control_loop(bool preuse_buffer, int timeout)
> >  			/* work-around hw issue, see intel_emit_post_sync_nonzero_flush
> >  			 * in mesa sources. */
> >  			intel_bb_add_intel_buf(ibb, target_buf, true);
> > -			intel_bb_out(ibb, GFX_OP_PIPE_CONTROL);
> > +			intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(4));
> >  			intel_bb_out(ibb, PIPE_CONTROL_CS_STALL |
> >  				     PIPE_CONTROL_STALL_AT_SCOREBOARD);
> >  			intel_bb_out(ibb, 0); /* address */
> >  			intel_bb_out(ibb, 0); /* write data */
> >  
> > -			intel_bb_out(ibb, GFX_OP_PIPE_CONTROL);
> > +			intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(4));
> >  			intel_bb_out(ibb, PIPE_CONTROL_WRITE_IMMEDIATE);
> >  			intel_bb_emit_reloc(ibb, target_buf->handle,
> >  					    I915_GEM_DOMAIN_INSTRUCTION,
> > @@ -124,10 +123,10 @@ store_pipe_control_loop(bool preuse_buffer, int timeout)
> >  			intel_bb_out(ibb, val); /* write data */
> >  		} else if (ibb->gen >= 4) {
> >  			intel_bb_add_intel_buf(ibb, target_buf, true);
> > -			intel_bb_out(ibb, GFX_OP_PIPE_CONTROL |
> > +			intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(4) |
> >  				     PIPE_CONTROL_WC_FLUSH |
> >  				     PIPE_CONTROL_TC_FLUSH |
> > -				     PIPE_CONTROL_WRITE_IMMEDIATE | 2);
> > +				     PIPE_CONTROL_WRITE_IMMEDIATE);
> >  			intel_bb_emit_reloc(ibb, target_buf->handle,
> >  					    I915_GEM_DOMAIN_INSTRUCTION,
> >  					    I915_GEM_DOMAIN_INSTRUCTION,
> > diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> > index 0c4224483f..af657d0e1b 100644
> > --- a/tests/i915/gem_pxp.c
> > +++ b/tests/i915/gem_pxp.c
> > @@ -748,10 +748,7 @@ static void test_pxp_pwrcycle_teardown_keychange(int i915, struct powermgt_data
> >  	igt_assert_eq(matched_after_keychange, 0);
> >  }
> >  
> > -#define GFX_OP_PIPE_CONTROL    ((3 << 29) | (3 << 27) | (2 << 24))
> > -#define PIPE_CONTROL_CS_STALL	            (1 << 20)
> >  #define PIPE_CONTROL_RENDER_TARGET_FLUSH    (1 << 12)
> > -#define PIPE_CONTROL_FLUSH_ENABLE           (1 << 7)
> >  #define PIPE_CONTROL_DATA_CACHE_INVALIDATE  (1 << 5)
> >  #define PIPE_CONTROL_PROTECTEDPATH_DISABLE  (1 << 27)
> >  #define PIPE_CONTROL_PROTECTEDPATH_ENABLE   (1 << 22)
> > @@ -765,7 +762,7 @@ static void emit_pipectrl(struct intel_bb *ibb, struct intel_buf *fenceb, bool b
> >  	uint32_t pipe_ctl_flags = 0;
> >  	uint32_t ps_op_id;
> >  
> > -	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL);
> > +	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(4));
> >  	intel_bb_out(ibb, pipe_ctl_flags);
> >  
> >  	if (before)
> > @@ -776,7 +773,7 @@ static void emit_pipectrl(struct intel_bb *ibb, struct intel_buf *fenceb, bool b
> >  	pipe_ctl_flags = (PIPE_CONTROL_FLUSH_ENABLE |
> >  			  PIPE_CONTROL_CS_STALL |
> >  			  PIPE_CONTROL_POST_SYNC_OP);
> > -	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL | 4);
> > +	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(6));
> >  	intel_bb_out(ibb, pipe_ctl_flags);
> >  	intel_bb_emit_reloc(ibb, fenceb->handle, 0, I915_GEM_DOMAIN_COMMAND, (before?0:8),
> >  			    fenceb->addr.offset);
> > diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> > index 8ab00525ff..afcd7b73ed 100644
> > --- a/tests/i915/gem_ringfill.c
> > +++ b/tests/i915/gem_ringfill.c
> > @@ -158,7 +158,7 @@ static void setup_execbuf(int fd, const intel_ctx_t *ctx,
> >  		reloc[i].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
> >  
> >  		offset = obj[0].offset + reloc[i].delta;
> > -		*b++ = MI_STORE_DWORD_IMM;
> > +		*b++ = MI_STORE_DWORD_IMM_GEN4;
> >  		if (gen >= 8) {
> >  			*b++ = offset;
> >  			*b++ = offset >> 32;
> > diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> > index c29bfd43d9..7682f772a1 100644
> > --- a/tests/i915/gem_softpin.c
> > +++ b/tests/i915/gem_softpin.c
> > @@ -41,18 +41,6 @@ IGT_TEST_DESCRIPTION("Tests softpin feature with normal usage, invalid inputs"
> >  
> >  #define LIMIT_32b ((1ull << 32) - (1ull << 12))
> >  
> > -/* gen8_canonical_addr
> > - * Used to convert any address into canonical form, i.e. [63:48] == [47].
> > - * Based on kernel's sign_extend64 implementation.
> > - * @address - a virtual address
> > -*/
> > -#define GEN8_HIGH_ADDRESS_BIT 47
> > -static uint64_t gen8_canonical_addr(uint64_t address)
> > -{
> > -	__u8 shift = 63 - GEN8_HIGH_ADDRESS_BIT;
> > -	return (__s64)(address << shift) >> shift;
> > -}
> > -
> >  #define INTERRUPTIBLE 0x1
> >  
> >  static void test_invalid(int fd)
> > @@ -653,7 +641,7 @@ static void test_noreloc(int fd, enum sleep sleep, unsigned flags)
> >  	gem_set_domain(fd, object[i].handle,
> >  		       I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
> >  	for (i = 0; i < ARRAY_SIZE(object) - 1; i++) {
> > -		*b++ = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +		*b++ = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  		if (gen >= 8) {
> >  			*b++ = object[i].offset;
> >  			*b++ = object[i].offset >> 32;
> > @@ -922,7 +910,7 @@ static void submit(int fd, unsigned int gen,
> >  						   BATCH_ALIGNMENT);
> >  		address = obj.offset + BATCH_SIZE - eb->batch_start_offset - 8;
> >  		n = 0;
> > -		batch[n] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +		batch[n] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  		if (gen >= 8) {
> >  			batch[n] |= 1 << 21;
> >  			batch[n]++;
> > diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> > index 07cabf7abc..e7dc6637ab 100644
> > --- a/tests/i915/gem_sync.c
> > +++ b/tests/i915/gem_sync.c
> > @@ -588,7 +588,7 @@ store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> >  			reloc[i].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
> >  
> >  			offset = object[0].offset + reloc[i].delta;
> > -			*b++ = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +			*b++ = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  			if (gen >= 8) {
> >  				*b++ = offset;
> >  				*b++ = offset >> 32;
> > @@ -698,7 +698,7 @@ switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> >  				c->reloc[r].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
> >  
> >  				offset = c->object[0].offset + c->reloc[r].delta;
> > -				*b++ = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +				*b++ = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  				if (gen >= 8) {
> >  					*b++ = offset;
> >  					*b++ = offset >> 32;
> > @@ -772,10 +772,10 @@ switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> >  
> >  static void xchg(void *array, unsigned i, unsigned j)
> >  {
> > -	uint32_t *u32 = array;
> > -	uint32_t tmp = u32[i];
> > -	u32[i] = u32[j];
> > -	u32[j] = tmp;
> > +	uint32_t *ui32 = array;
> > +	uint32_t tmp = ui32[i];
> > +	ui32[i] = ui32[j];
> > +	ui32[j] = tmp;
> 
> imho move this to separate patchset.

Ditto.

> 
> Rest looks ok,
> 

Thanks for the review, according to your comments I'm going to extract
huc change, other things need to stay intact (typedefs).

--
Zbigniew


> Regards,
> Kamil
> 
> >  }
> >  
> >  struct waiter {
> > @@ -859,7 +859,7 @@ __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
> >  		reloc[i].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
> >  
> >  		offset = object[0].offset + reloc[i].delta;
> > -		*b++ = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +		*b++ = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  		if (gen >= 8) {
> >  			*b++ = offset;
> >  			*b++ = offset >> 32;
> > @@ -1080,7 +1080,7 @@ store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
> >  			reloc[i].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
> >  
> >  			offset = object[0].offset + reloc[i].delta;
> > -			*b++ = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +			*b++ = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  			if (gen >= 8) {
> >  				*b++ = offset;
> >  				*b++ = offset >> 32;
> > diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
> > index 483570d0ad..07a453229a 100644
> > --- a/tests/i915/gem_userptr_blits.c
> > +++ b/tests/i915/gem_userptr_blits.c
> > @@ -338,7 +338,7 @@ static void store_dword(int fd, uint32_t target,
> >  	obj[1].relocation_count = 1;
> >  
> >  	i = 0;
> > -	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		batch[++i] = offset;
> >  		batch[++i] = 0;
> > @@ -1318,7 +1318,7 @@ static void store_dword_rand(int i915, const intel_ctx_t *ctx,
> >  
> >  		offset = reloc[n].presumed_offset + reloc[n].delta;
> >  
> > -		batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +		batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  		if (gen >= 8) {
> >  			batch[++i] = offset;
> >  			batch[++i] = offset >> 32;
> > @@ -1379,7 +1379,7 @@ static void test_readonly(int i915)
> >  
> >  	/*
> >  	 * We have only a 31bit delta which we use for generating
> > -	 * the target address for MI_STORE_DWORD_IMM, so our maximum
> > +	 * the target address for MI_STORE_DWORD_IMM_GEN4, so our maximum
> >  	 * usable object size is only 2GiB. For now.
> >  	 */
> >  	igt_nsec_elapsed(memset(&tv, 0, sizeof(tv)));
> > diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
> > index 3005d347c3..f47d8c5569 100644
> > --- a/tests/i915/gem_vm_create.c
> > +++ b/tests/i915/gem_vm_create.c
> > @@ -268,7 +268,7 @@ write_to_address(int fd, uint32_t ctx, uint64_t addr, uint32_t value)
> >  	int i;
> >  
> >  	i = 0;
> > -	cs[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	cs[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		cs[++i] = addr;
> >  		cs[++i] = addr >> 32;
> > diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
> > index 01eb007694..27f3a2d7fd 100644
> > --- a/tests/i915/gem_watchdog.c
> > +++ b/tests/i915/gem_watchdog.c
> > @@ -332,7 +332,7 @@ static void delay(int i915,
> >  
> >  	cs = map = gem_mmap__device_coherent(i915, handle, 0, 4096, PROT_WRITE);
> >  
> > -	*cs++ = MI_LOAD_REGISTER_IMM;
> > +	*cs++ = MI_LOAD_REGISTER_IMM(1);
> >  	*cs++ = CS_GPR(START_TS) + 4;
> >  	*cs++ = 0;
> >  	*cs++ = MI_LOAD_REGISTER_REG;
> > @@ -345,7 +345,7 @@ static void delay(int i915,
> >  
> >  	*cs++ = 0x5 << 23; /* MI_ARB_CHECK */
> >  
> > -	*cs++ = MI_LOAD_REGISTER_IMM;
> > +	*cs++ = MI_LOAD_REGISTER_IMM(1);
> >  	*cs++ = CS_GPR(NOW_TS) + 4;
> >  	*cs++ = 0;
> >  	*cs++ = MI_LOAD_REGISTER_REG;
> > @@ -367,7 +367,7 @@ static void delay(int i915,
> >  
> >  	/* Delay between SRM and COND_BBE to post the writes */
> >  	for (int n = 0; n < 8; n++) {
> > -		*cs++ = MI_STORE_DWORD_IMM;
> > +		*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  		if (use_64b) {
> >  			*cs++ = addr + 4064;
> >  			*cs++ = addr >> 32;
> > diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
> > index 5fb2d73fdd..30c68d1ac9 100644
> > --- a/tests/i915/gem_workarounds.c
> > +++ b/tests/i915/gem_workarounds.c
> > @@ -121,7 +121,7 @@ static int workaround_fail_count(int i915, const intel_ctx_t *ctx)
> >  	out = base =
> >  		gem_mmap__cpu(i915, obj[1].handle, 0, batch_sz, PROT_WRITE);
> >  	for (int i = 0; i < num_wa_regs; i++) {
> > -		*out++ = MI_STORE_REGISTER_MEM | (1 + (gen >= 8));
> > +		*out++ = MI_STORE_REGISTER_MEM_CMD | (1 + (gen >= 8));
> >  		*out++ = wa_regs[i].addr;
> >  		reloc[i].target_handle = obj[0].handle;
> >  		reloc[i].offset = (out - base) * sizeof(*out);
> > diff --git a/tests/i915/gen7_exec_parse.c b/tests/i915/gen7_exec_parse.c
> > index 69b768ed29..e9751ea73f 100644
> > --- a/tests/i915/gen7_exec_parse.c
> > +++ b/tests/i915/gen7_exec_parse.c
> > @@ -48,10 +48,6 @@
> >  #define INSTR_CLIENT_SHIFT	29
> >  #define   INSTR_INVALID_CLIENT  0x7
> >  
> > -#define MI_ARB_ON_OFF (0x8 << 23)
> > -#define MI_DISPLAY_FLIP ((0x14 << 23) | 1)
> > -
> > -#define GFX_OP_PIPE_CONTROL	((0x3<<29)|(0x3<<27)|(0x2<<24)|2)
> >  #define   PIPE_CONTROL_QW_WRITE	(1<<14)
> >  #define   PIPE_CONTROL_LRI_POST_OP (1<<23)
> >  
> > @@ -298,7 +294,7 @@ static void
> >  test_lri(int fd, uint32_t handle, struct test_lri *test)
> >  {
> >  	uint32_t lri[] = {
> > -		MI_LOAD_REGISTER_IMM,
> > +		MI_LOAD_REGISTER_IMM(1),
> >  		test->reg,
> >  		test->test_val,
> >  		MI_BATCH_BUFFER_END,
> > @@ -372,13 +368,13 @@ static void test_allocations(int fd)
> >  static void hsw_load_register_reg(void)
> >  {
> >  	uint32_t init_gpr0[16] = {
> > -		MI_LOAD_REGISTER_IMM,
> > +		MI_LOAD_REGISTER_IMM(1),
> >  		HSW_CS_GPR0,
> >  		0xabcdabc0, /* leave [1:0] zero */
> >  		MI_BATCH_BUFFER_END,
> >  	};
> >  	uint32_t store_gpr0[16] = {
> > -		MI_STORE_REGISTER_MEM | (3 - 2),
> > +		MI_STORE_REGISTER_MEM_CMD | (3 - 2),
> >  		HSW_CS_GPR0,
> >  		0, /* reloc*/
> >  		MI_BATCH_BUFFER_END,
> > @@ -475,7 +471,7 @@ igt_main
> >  
> >  	igt_subtest("basic-allowed") {
> >  		uint32_t pc[] = {
> > -			GFX_OP_PIPE_CONTROL,
> > +			GFX_OP_PIPE_CONTROL(4),
> >  			PIPE_CONTROL_QW_WRITE,
> >  			0, /* To be patched */
> >  			0x12000000,
> > @@ -490,7 +486,7 @@ igt_main
> >  
> >  	igt_subtest("basic-offset") {
> >  		uint32_t pc[] = {
> > -			GFX_OP_PIPE_CONTROL,
> > +			GFX_OP_PIPE_CONTROL(4),
> >  			PIPE_CONTROL_QW_WRITE,
> >  			0, /* To be patched */
> >  			0x12000000,
> > @@ -597,7 +593,7 @@ igt_main
> >  
> >  	igt_subtest("bitmasks") {
> >  		uint32_t pc[] = {
> > -			GFX_OP_PIPE_CONTROL,
> > +			GFX_OP_PIPE_CONTROL(4),
> >  			(PIPE_CONTROL_QW_WRITE |
> >  			 PIPE_CONTROL_LRI_POST_OP),
> >  			0, /* To be patched */
> > @@ -631,13 +627,13 @@ igt_main
> >  
> >  	igt_subtest("cmd-crossing-page") {
> >  		uint32_t lri_ok[] = {
> > -			MI_LOAD_REGISTER_IMM,
> > +			MI_LOAD_REGISTER_IMM(1),
> >  			SO_WRITE_OFFSET_0, /* allowed register address */
> >  			0xdcbaabc0, /* [1:0] MBZ */
> >  			MI_BATCH_BUFFER_END,
> >  		};
> >  		uint32_t store_reg[] = {
> > -			MI_STORE_REGISTER_MEM | (3 - 2),
> > +			MI_STORE_REGISTER_MEM_CMD | (3 - 2),
> >  			SO_WRITE_OFFSET_0,
> >  			0, /* reloc */
> >  			MI_BATCH_BUFFER_END,
> > @@ -655,29 +651,29 @@ igt_main
> >  
> >  	igt_subtest("oacontrol-tracking") {
> >  		uint32_t lri_ok[] = {
> > -			MI_LOAD_REGISTER_IMM,
> > +			MI_LOAD_REGISTER_IMM(1),
> >  			OACONTROL,
> >  			0x31337000,
> > -			MI_LOAD_REGISTER_IMM,
> > +			MI_LOAD_REGISTER_IMM(1),
> >  			OACONTROL,
> >  			0x0,
> >  			MI_BATCH_BUFFER_END,
> >  			0
> >  		};
> >  		uint32_t lri_bad[] = {
> > -			MI_LOAD_REGISTER_IMM,
> > +			MI_LOAD_REGISTER_IMM(1),
> >  			OACONTROL,
> >  			0x31337000,
> >  			MI_BATCH_BUFFER_END,
> >  		};
> >  		uint32_t lri_extra_bad[] = {
> > -			MI_LOAD_REGISTER_IMM,
> > +			MI_LOAD_REGISTER_IMM(1),
> >  			OACONTROL,
> >  			0x31337000,
> > -			MI_LOAD_REGISTER_IMM,
> > +			MI_LOAD_REGISTER_IMM(1),
> >  			OACONTROL,
> >  			0x0,
> > -			MI_LOAD_REGISTER_IMM,
> > +			MI_LOAD_REGISTER_IMM(1),
> >  			OACONTROL,
> >  			0x31337000,
> >  			MI_BATCH_BUFFER_END,
> > @@ -701,7 +697,7 @@ igt_main
> >  
> >  	igt_subtest("chained-batch") {
> >  		uint32_t pc[] = {
> > -			GFX_OP_PIPE_CONTROL,
> > +			GFX_OP_PIPE_CONTROL(4),
> >  			PIPE_CONTROL_QW_WRITE,
> >  			0, /* To be patched */
> >  			0x12000000,
> > diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
> > index c8743a78a0..26b1517053 100644
> > --- a/tests/i915/gen9_exec_parse.c
> > +++ b/tests/i915/gen9_exec_parse.c
> > @@ -38,14 +38,6 @@
> >  #define INSTR_CLIENT_SHIFT	29
> >  #define   INSTR_INVALID_CLIENT  0x7
> >  
> > -#define MI_ARB_ON_OFF (0x8 << 23)
> > -#define MI_USER_INTERRUPT (0x02 << 23)
> > -#define MI_FLUSH_DW (0x26 << 23)
> > -#define MI_REPORT_HEAD (0x07 << 23)
> > -#define MI_SUSPEND_FLUSH (0x0b << 23)
> > -#define MI_LOAD_SCAN_LINES_EXCL (0x13 << 23)
> > -#define MI_UPDATE_GTT (0x23 << 23)
> > -
> >  #define BCS_SWCTRL     0x22200
> >  #define BCS_GPR_BASE   0x22600
> >  #define BCS_GPR(n)     (0x22600 + (n) * 8)
> > @@ -324,7 +316,7 @@ static const struct cmd allowed_cmds[] = {
> >  	CMD_N(MI_NOOP),
> >  	CMD_N(MI_USER_INTERRUPT),
> >  	CMD_N(MI_WAIT_FOR_EVENT),
> > -	CMD(MI_FLUSH_DW, 5),
> > +	CMD(MI_FLUSH_DW_CMD, 5),
> >  	CMD_N(MI_ARB_CHECK),
> >  	CMD_N(MI_REPORT_HEAD),
> >  	CMD_N(MI_FLUSH),
> > @@ -453,11 +445,11 @@ static void test_bb_start(const int i915, const uint32_t handle, int test)
> >  		MI_NOOP,
> >  		MI_NOOP,
> >  		MI_NOOP,
> > -		MI_STORE_DWORD_IMM,
> > +		MI_STORE_DWORD_IMM_GEN4,
> >  		0,
> >  		0,
> >  		1,
> > -		MI_STORE_DWORD_IMM,
> > +		MI_STORE_DWORD_IMM_GEN4,
> >  		4,
> >  		0,
> >  		2,
> > @@ -680,13 +672,13 @@ static void test_bb_chained(const int i915, const uint32_t handle)
> >  static void test_cmd_crossing_page(const int i915, const uint32_t handle)
> >  {
> >  	const uint32_t lri_ok[] = {
> > -		MI_LOAD_REGISTER_IMM,
> > +		MI_LOAD_REGISTER_IMM(1),
> >  		BCS_GPR(0),
> >  		0xbaadf00d,
> >  		MI_BATCH_BUFFER_END,
> >  	};
> >  	const uint32_t store_reg[] = {
> > -		MI_STORE_REGISTER_MEM | 2,
> > +		MI_STORE_REGISTER_MEM_CMD | 2,
> >  		BCS_GPR(0),
> >  		0, /* reloc */
> >  		0, /* reloc */
> > @@ -711,21 +703,21 @@ static void test_invalid_length(const int i915, const uint32_t handle)
> >  	const uint32_t noops[8192] = { 0, };
> >  
> >  	const uint32_t lri_ok[] = {
> > -		MI_LOAD_REGISTER_IMM,
> > +		MI_LOAD_REGISTER_IMM(1),
> >  		BCS_GPR(0),
> >  		ok_val,
> >  		MI_BATCH_BUFFER_END,
> >  	};
> >  
> >  	const uint32_t lri_bad[] = {
> > -		MI_LOAD_REGISTER_IMM,
> > +		MI_LOAD_REGISTER_IMM(1),
> >  		BCS_GPR(0),
> >  		bad_val,
> >  		MI_BATCH_BUFFER_END,
> >  	};
> >  
> >  	const uint32_t store_reg[] = {
> > -		MI_STORE_REGISTER_MEM | 2,
> > +		MI_STORE_REGISTER_MEM_CMD | 2,
> >  		BCS_GPR(0),
> >  		0, /* reloc */
> >  		0, /* reloc */
> > @@ -824,21 +816,21 @@ static void test_register(const int i915, const uint32_t handle,
> >  			  const struct reg *r)
> >  {
> >  	const uint32_t lri_zero[] = {
> > -		MI_LOAD_REGISTER_IMM,
> > +		MI_LOAD_REGISTER_IMM(1),
> >  		r->addr,
> >  		r->masked_write ? 0xffff0000 : 0,
> >  		MI_BATCH_BUFFER_END,
> >  	};
> >  
> >  	const uint32_t lri_mask[] = {
> > -		MI_LOAD_REGISTER_IMM,
> > +		MI_LOAD_REGISTER_IMM(1),
> >  		r->addr,
> >  		r->masked_write ? (r->mask << 16) | r->mask : r->mask,
> >  		MI_BATCH_BUFFER_END,
> >  	};
> >  
> >  	const uint32_t store_reg[] = {
> > -		MI_STORE_REGISTER_MEM | 2,
> > +		MI_STORE_REGISTER_MEM_CMD | 2,
> >  		r->addr,
> >  		0, /* reloc */
> >  		0, /* reloc */
> > @@ -877,7 +869,7 @@ static long int read_reg(const int i915, const uint32_t handle,
> >  			 const uint32_t addr)
> >  {
> >  	const uint32_t store_reg[] = {
> > -		MI_STORE_REGISTER_MEM | 2,
> > +		MI_STORE_REGISTER_MEM_CMD | 2,
> >  		addr,
> >  		0, /* reloc */
> >  		0, /* reloc */
> > @@ -911,7 +903,7 @@ static int write_reg(const int i915, const uint32_t handle,
> >  		     const uint32_t addr, const uint32_t val)
> >  {
> >  	const uint32_t lri[] = {
> > -		MI_LOAD_REGISTER_IMM,
> > +		MI_LOAD_REGISTER_IMM(1),
> >  		addr,
> >  		val,
> >  		MI_BATCH_BUFFER_END,
> > @@ -1088,17 +1080,6 @@ static inline uint32_t fill_and_copy_shadow(uint32_t *batch, uint32_t len,
> >  	return i * sizeof(uint32_t);
> >  }
> >  
> > -static inline uint64_t sign_extend(uint64_t x, int index)
> > -{
> > -	int shift = 63 - index;
> > -	return (int64_t)(x << shift) >> shift;
> > -}
> > -
> > -static uint64_t gen8_canonical_address(uint64_t address)
> > -{
> > -	return sign_extend(address, 47);
> > -}
> > -
> >  static void test_shadow_peek(int fd)
> >  {
> >  	uint64_t size = PAGE_SIZE;
> > @@ -1130,7 +1111,7 @@ static void test_shadow_peek(int fd)
> >  
> >  	exec[1].handle = gem_create(fd, size); /* batch */
> >  	exec[1].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> > -	exec[1].offset = gen8_canonical_address(exec[0].pad_to_size);
> > +	exec[1].offset = gen8_canonical_addr(exec[0].pad_to_size);
> >  
> >  	vaddr = gem_mmap__wc(fd, exec[1].handle, 0, size, PROT_WRITE);
> >  
> > diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> > index d3a86b1133..725687dab4 100644
> > --- a/tests/i915/i915_module_load.c
> > +++ b/tests/i915/i915_module_load.c
> > @@ -80,7 +80,7 @@ static void store_all(int i915)
> >  	int i;
> >  
> >  	i = 0;
> > -	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +	batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  	if (gen >= 8) {
> >  		batch[++i] = 0;
> >  		batch[++i] = 0;
> > diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> > index dd1f1ac399..6453354cfc 100644
> > --- a/tests/i915/perf.c
> > +++ b/tests/i915/perf.c
> > @@ -58,30 +58,17 @@ IGT_TEST_DESCRIPTION("Test the i915 perf metrics streaming interface");
> >  #define OAREPORT_REASON_GO             (1<<4)
> >  #define OAREPORT_REASON_CLK_RATIO      (1<<5)
> >  
> > -#define GFX_OP_PIPE_CONTROL     ((3 << 29) | (3 << 27) | (2 << 24))
> > -#define PIPE_CONTROL_CS_STALL	   (1 << 20)
> >  #define PIPE_CONTROL_GLOBAL_SNAPSHOT_COUNT_RESET	(1 << 19)
> > -#define PIPE_CONTROL_TLB_INVALIDATE     (1 << 18)
> >  #define PIPE_CONTROL_SYNC_GFDT	  (1 << 17)
> > -#define PIPE_CONTROL_MEDIA_STATE_CLEAR  (1 << 16)
> >  #define PIPE_CONTROL_NO_WRITE	   (0 << 14)
> >  #define PIPE_CONTROL_WRITE_IMMEDIATE    (1 << 14)
> >  #define PIPE_CONTROL_WRITE_DEPTH_COUNT  (2 << 14)
> > -#define PIPE_CONTROL_WRITE_TIMESTAMP    (3 << 14)
> > -#define PIPE_CONTROL_DEPTH_STALL	(1 << 13)
> >  #define PIPE_CONTROL_RENDER_TARGET_FLUSH (1 << 12)
> >  #define PIPE_CONTROL_INSTRUCTION_INVALIDATE (1 << 11)
> > -#define PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE   (1 << 10) /* GM45+ only */
> >  #define PIPE_CONTROL_ISP_DIS	    (1 << 9)
> >  #define PIPE_CONTROL_INTERRUPT_ENABLE   (1 << 8)
> > -#define PIPE_CONTROL_FLUSH_ENABLE       (1 << 7) /* Gen7+ only */
> >  /* GT */
> >  #define PIPE_CONTROL_DATA_CACHE_INVALIDATE      (1 << 5)
> > -#define PIPE_CONTROL_VF_CACHE_INVALIDATE	(1 << 4)
> > -#define PIPE_CONTROL_CONST_CACHE_INVALIDATE     (1 << 3)
> > -#define PIPE_CONTROL_STATE_CACHE_INVALIDATE     (1 << 2)
> > -#define PIPE_CONTROL_STALL_AT_SCOREBOARD	(1 << 1)
> > -#define PIPE_CONTROL_DEPTH_CACHE_FLUSH	  (1 << 0)
> >  #define PIPE_CONTROL_PPGTT_WRITE	(0 << 2)
> >  #define PIPE_CONTROL_GLOBAL_GTT_WRITE   (1 << 2)
> >  
> > @@ -3242,9 +3229,9 @@ emit_stall_timestamp_and_rpc(struct intel_bb *ibb,
> >  	intel_bb_add_intel_buf(ibb, dst, true);
> >  
> >  	if (intel_gen(devid) >= 8)
> > -		intel_bb_out(ibb, GFX_OP_PIPE_CONTROL | (6 - 2));
> > +		intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(6));
> >  	else
> > -		intel_bb_out(ibb, GFX_OP_PIPE_CONTROL | (5 - 2));
> > +		intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(5));
> >  
> >  	intel_bb_out(ibb, pipe_ctl_flags);
> >  	intel_bb_emit_reloc(ibb, dst->handle,
> > diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> > index c1779fc9d0..f387f8249a 100644
> > --- a/tests/i915/perf_pmu.c
> > +++ b/tests/i915/perf_pmu.c
> > @@ -681,12 +681,6 @@ no_sema(int gem_fd, const intel_ctx_t *ctx,
> >  	assert_within_epsilon(val[0][1], 0.0f, tolerance);
> >  }
> >  
> > -#define MI_INSTR(opcode, flags) (((opcode) << 23) | (flags))
> > -#define MI_SEMAPHORE_WAIT	MI_INSTR(0x1c, 2) /* GEN8+ */
> > -#define   MI_SEMAPHORE_POLL		(1<<15)
> > -#define   MI_SEMAPHORE_SAD_GTE_SDD	(1<<12)
> > -#define   MI_SEMAPHORE_SAD_EQ_SDD       (4 << 12)
> > -
> >  static void
> >  sema_wait(int gem_fd, const intel_ctx_t *ctx,
> >  	  const struct intel_execution_engine2 *e,
> > @@ -719,7 +713,7 @@ sema_wait(int gem_fd, const intel_ctx_t *ctx,
> >  
> >  	obj_ptr = gem_mmap__device_coherent(gem_fd, obj_handle, 0, 4096, PROT_WRITE);
> >  
> > -	batch[0] = MI_STORE_DWORD_IMM;
> > +	batch[0] = MI_STORE_DWORD_IMM_GEN4;
> >  	batch[1] = obj_offset + sizeof(*obj_ptr);
> >  	batch[2] = (obj_offset + sizeof(*obj_ptr)) >> 32;
> >  	batch[3] = 1;
> > @@ -807,7 +801,7 @@ create_sema(int gem_fd, uint64_t ahnd,
> >  {
> >  	uint32_t cs[] = {
> >  		/* Reset our semaphore wait */
> > -		MI_STORE_DWORD_IMM,
> > +		MI_STORE_DWORD_IMM_GEN4,
> >  		0,
> >  		0,
> >  		1,
> > @@ -1108,17 +1102,17 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
> >  	obj.handle = gem_create(gem_fd, 4096);
> >  
> >  	b = batch;
> > -	*b++ = MI_LOAD_REGISTER_IMM;
> > +	*b++ = MI_LOAD_REGISTER_IMM(1);
> >  	*b++ = FORCEWAKE_MT;
> >  	*b++ = 2 << 16 | 2;
> > -	*b++ = MI_LOAD_REGISTER_IMM;
> > +	*b++ = MI_LOAD_REGISTER_IMM(1);
> >  	*b++ = DERRMR;
> >  	*b++ = ~0u;
> >  	*b++ = MI_WAIT_FOR_EVENT;
> > -	*b++ = MI_LOAD_REGISTER_IMM;
> > +	*b++ = MI_LOAD_REGISTER_IMM(1);
> >  	*b++ = DERRMR;
> >  	*b++ = ~0u;
> > -	*b++ = MI_LOAD_REGISTER_IMM;
> > +	*b++ = MI_LOAD_REGISTER_IMM(1);
> >  	*b++ = FORCEWAKE_MT;
> >  	*b++ = 2 << 16;
> >  	*b++ = MI_BATCH_BUFFER_END;
> > diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
> > index 95dc377785..80d34285e2 100644
> > --- a/tests/i915/sysfs_timeslice_duration.c
> > +++ b/tests/i915/sysfs_timeslice_duration.c
> > @@ -46,15 +46,6 @@
> >  #define ATTR "timeslice_duration_ms"
> >  #define RESET_TIMEOUT 50 /* milliseconds, at least one jiffie for kworker */
> >  
> > -#define MI_SEMAPHORE_WAIT		(0x1c << 23)
> > -#define   MI_SEMAPHORE_POLL             (1 << 15)
> > -#define   MI_SEMAPHORE_SAD_GT_SDD       (0 << 12)
> > -#define   MI_SEMAPHORE_SAD_GTE_SDD      (1 << 12)
> > -#define   MI_SEMAPHORE_SAD_LT_SDD       (2 << 12)
> > -#define   MI_SEMAPHORE_SAD_LTE_SDD      (3 << 12)
> > -#define   MI_SEMAPHORE_SAD_EQ_SDD       (4 << 12)
> > -#define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
> > -
> >  static bool __enable_hangcheck(int dir, bool state)
> >  {
> >  	return igt_sysfs_set(dir, "enable_hangcheck", state ? "1" : "0");
> > @@ -214,7 +205,7 @@ static uint64_t __test_duration(int i915, int engine, unsigned int timeout)
> >  
> >  	cs = map;
> >  	for (i = 0; i < 10; i++) {
> > -		*cs++ = MI_SEMAPHORE_WAIT |
> > +		*cs++ = MI_SEMAPHORE_WAIT_CMD |
> >  			MI_SEMAPHORE_POLL |
> >  			MI_SEMAPHORE_SAD_NEQ_SDD |
> >  			(4 - 2 + (gen >= 12));
> > @@ -229,7 +220,7 @@ static uint64_t __test_duration(int i915, int engine, unsigned int timeout)
> >  		*cs++ = obj[1].offset + sizeof(uint32_t) * i;
> >  		*cs++ = 0;
> >  
> > -		*cs++ = MI_STORE_DWORD_IMM;
> > +		*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  		*cs++ = obj[0].offset +
> >  			4096 - sizeof(uint32_t) * i - sizeof(uint32_t);
> >  		*cs++ = 0;
> > @@ -240,12 +231,12 @@ static uint64_t __test_duration(int i915, int engine, unsigned int timeout)
> >  	cs += 16 - ((cs - map) & 15);
> >  	start = (cs - map) * sizeof(*cs);
> >  	for (i = 0; i < 10; i++) {
> > -		*cs++ = MI_STORE_DWORD_IMM;
> > +		*cs++ = MI_STORE_DWORD_IMM_GEN4;
> >  		*cs++ = obj[0].offset + sizeof(uint32_t) * i;
> >  		*cs++ = 0;
> >  		*cs++ = 1;
> >  
> > -		*cs++ = MI_SEMAPHORE_WAIT |
> > +		*cs++ = MI_SEMAPHORE_WAIT_CMD |
> >  			MI_SEMAPHORE_POLL |
> >  			MI_SEMAPHORE_SAD_NEQ_SDD |
> >  			(4 - 2 + (gen >= 12));
> > diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> > index 06be273c0b..7b473c03df 100644
> > --- a/tests/prime_vgem.c
> > +++ b/tests/prime_vgem.c
> > @@ -624,7 +624,7 @@ static void work(int i915, uint64_t ahnd, uint64_t scratch_offset, int dmabuf,
> >  		store[count].delta = sizeof(uint32_t) * count;
> >  		store[count].read_domains = I915_GEM_DOMAIN_INSTRUCTION;
> >  		store[count].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
> > -		batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > +		batch[i] = MI_STORE_DWORD_IMM_GEN4 | (gen < 6 ? 1 << 22 : 0);
> >  		if (gen >= 8) {
> >  			batch[++i] = scratch_offset + store[count].delta;
> >  			batch[++i] = (scratch_offset + store[count].delta) >> 32;
> > diff --git a/tools/intel_audio_dump.c b/tools/intel_audio_dump.c
> > index 6d11659ec9..287dbd4759 100644
> > --- a/tools/intel_audio_dump.c
> > +++ b/tools/intel_audio_dump.c
> > @@ -48,6 +48,7 @@ static int disp_reg_base = 0;	/* base address of display registers */
> >  #define BITSTO(n)		(n >= sizeof(long) * 8 ? ~0 : (1UL << (n)) - 1)
> >  #define BITMASK(high, low)	(BITSTO(high+1) & ~BITSTO(low))
> >  #define REG_BITS(reg, high, low)	(((reg) & (BITMASK(high, low))) >> (low))
> > +#undef REG_BIT
> >  #define REG_BIT(reg, n)		REG_BITS(reg, n, n)
> >  
> >  #define min_t(type, x, y) ({                    \
> > diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> > index b0d91473a8..6c37e14d12 100644
> > --- a/tools/intel_reg.c
> > +++ b/tools/intel_reg.c
> > @@ -322,7 +322,7 @@ static int register_srm(struct config *config, struct reg *reg,
> >  		batch[i++] = MI_NOOP;
> >  		batch[i++] = MI_NOOP;
> >  
> > -		batch[i++] = MI_LOAD_REGISTER_IMM;
> > +		batch[i++] = MI_LOAD_REGISTER_IMM(1);
> >  		batch[i++] = reg->addr;
> >  		batch[i++] = *val_in;
> >  		batch[i++] = MI_NOOP;
> > -- 
> > 2.34.1
> > 
