Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC6589B0D
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 11:45:12 +0000 (UTC)
Date: Mon, 10 Feb 2020 13:45:07 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200210114507.GI25209@platvala-desk.ger.corp.intel.com>
References: <20200204235831.1263837-1-mattst88@gmail.com>
 <20200210113539.GF25209@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210113539.GF25209@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tools: Delete aubdump
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matt Turner <mattst88@gmail.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 10, 2020 at 01:35:39PM +0200, Petri Latvala wrote:
> On Tue, Feb 04, 2020 at 03:58:31PM -0800, Matt Turner wrote:
> > Superseded by intel_dump_gpu in Mesa.
> > =

> > Signed-off-by: Matt Turner <mattst88@gmail.com>
> =

> Acked-by: Petri Latvala <petri.latvala@intel.com>

And merged, thanks!

> =

> =

> > ---
> >  configure.ac           |    2 -
> >  man/intel_aubdump.rst  |   55 --
> >  man/meson.build        |    1 -
> >  tools/.gitignore       |    1 -
> >  tools/Makefile.am      |   11 -
> >  tools/aubdump.c        | 1315 ----------------------------------------
> >  tools/intel_aubdump.in |  111 ----
> >  tools/meson.build      |   13 -
> >  8 files changed, 1509 deletions(-)
> >  delete mode 100644 man/intel_aubdump.rst
> >  delete mode 100644 tools/aubdump.c
> >  delete mode 100755 tools/intel_aubdump.in
> > =

> > diff --git a/configure.ac b/configure.ac
> > index f9e4942e..eeaf8d96 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -313,8 +313,6 @@ AC_CONFIG_FILES([
> >  		 overlay/Makefile
> >  		 ])
> >  =

> > -AC_CONFIG_FILES([tools/intel_aubdump], [chmod +x tools/intel_aubdump])
> > -
> >  AC_OUTPUT
> >  =

> >  # Print a summary of the compilation
> > diff --git a/man/intel_aubdump.rst b/man/intel_aubdump.rst
> > deleted file mode 100644
> > index 2b5d263e..00000000
> > --- a/man/intel_aubdump.rst
> > +++ /dev/null
> > @@ -1,55 +0,0 @@
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -intel_aubdump
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > ------------------------------------------------------
> > -Launch an application and capture rendering to an AUB
> > ------------------------------------------------------
> > -.. include:: defs.rst
> > -:Author: IGT Developers <igt-dev@lists.freedesktop.org>
> > -:Date: 2016-03-01
> > -:Version: |PACKAGE_STRING|
> > -:Copyright: 2015-2016 Intel Corporation
> > -:Manual section: |MANUAL_SECTION|
> > -:Manual group: |MANUAL_GROUP|
> > -
> > -SYNOPSIS
> > -=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -**intel_aubdump** [*OPTIONS*] -- *COMMAND* [*ARGUMENTS*]
> > -
> > -DESCRIPTION
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -Run COMMAND with ARGUMENTS and dump an AUB file that captures buffer c=
ontents
> > -and execution of the i915 GEM application.
> > -
> > -OPTIONS
> > -=3D=3D=3D=3D=3D=3D=3D
> > -
> > --v
> > -    Enable verbose mode.
> > -
> > ---help
> > -    Output a usage message and exit.
> > -
> > --o FILE, --output=3DFILE
> > -    Write the trace output to the file FILE. Default is COMMAND.aub.
> > -
> > ---device=3DID
> > -    Override the PCI ID of the drm device. This is useful for getting =
an aub
> > -    dump for a different generation of GPU. In this mode **intel_aubdu=
mp** will
> > -    intercept but not forward the execbuffer2 ioctl, as that would typ=
ically
> > -    cause a GPU hang.
> > -
> > -EXAMPLES
> > -=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -intel_aubdump -v --output=3Dstuff.aub -- glxgears -geometry 500x500
> > -    Launches glxgears with its -geometry option and enables aub dumpin=
g with
> > -    the -v and --output=3Dstuff.aub options.
> > -
> > -REPORTING BUGS
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -Report bugs to https://bugs.freedesktop.org.
> > diff --git a/man/meson.build b/man/meson.build
> > index 2187e8c5..00264a21 100644
> > --- a/man/meson.build
> > +++ b/man/meson.build
> > @@ -1,7 +1,6 @@
> >  build_man =3D get_option('man')
> >  =

> >  manpages =3D [
> > -	'intel_aubdump',
> >  	'intel_audio_dump',
> >  	'intel_bios_dumper',
> >  	'intel_error_decode',
> > diff --git a/tools/.gitignore b/tools/.gitignore
> > index 210daac5..86f28096 100644
> > --- a/tools/.gitignore
> > +++ b/tools/.gitignore
> > @@ -3,7 +3,6 @@ cnl_compute_wrpll
> >  dpcd_reg
> >  hsw_compute_wrpll
> >  igt_stats
> > -intel_aubdump
> >  intel_audio_dump
> >  intel_backlight
> >  intel_bios_dumper
> > diff --git a/tools/Makefile.am b/tools/Makefile.am
> > index f09e02b2..20227eae 100644
> > --- a/tools/Makefile.am
> > +++ b/tools/Makefile.am
> > @@ -24,15 +24,4 @@ AM_CFLAGS =3D $(DEBUG_CFLAGS) $(DRM_CFLAGS) $(PCIACC=
ESS_CFLAGS) $(CWARNFLAGS) \
> >  LDADD =3D $(top_builddir)/lib/libintel_tools.la
> >  AM_LDFLAGS =3D -Wl,--as-needed
> >  =

> > -# aubdumper
> > -
> > -module_LTLIBRARIES =3D intel_aubdump.la
> > -moduledir =3D $(libdir)
> > -intel_aubdump_la_LDFLAGS =3D -module -avoid-version -no-undefined
> > -intel_aubdump_la_SOURCES =3D aubdump.c
> > -intel_aubdump_la_LIBADD =3D $(top_builddir)/lib/libintel_tools.la -ldl
> > -
> >  intel_gpu_top_LDADD =3D $(top_builddir)/lib/libigt_perf.la
> > -
> > -bin_SCRIPTS =3D intel_aubdump
> > -CLEANFILES =3D $(bin_SCRIPTS)
> > diff --git a/tools/aubdump.c b/tools/aubdump.c
> > deleted file mode 100644
> > index 00e19712..00000000
> > --- a/tools/aubdump.c
> > +++ /dev/null
> > @@ -1,1315 +0,0 @@
> > -/*
> > - * Copyright =A9 2015 Intel Corporation
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including th=
e next
> > - * paragraph) shall be included in all copies or substantial portions =
of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING
> > - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER=
 DEALINGS
> > - * IN THE SOFTWARE.
> > - */
> > -
> > -#include <stdlib.h>
> > -#include <stdio.h>
> > -#include <string.h>
> > -#include <stdint.h>
> > -#include <stdbool.h>
> > -#include <signal.h>
> > -#include <stdarg.h>
> > -#include <fcntl.h>
> > -#include <sys/types.h>
> > -#include <sys/sysmacros.h>
> > -#include <sys/stat.h>
> > -#include <sys/ioctl.h>
> > -#include <unistd.h>
> > -#include <errno.h>
> > -#include <sys/mman.h>
> > -#include <dlfcn.h>
> > -#include <i915_drm.h>
> > -
> > -#include "intel_aub.h"
> > -#include "intel_chipset.h"
> > -
> > -#ifndef ARRAY_SIZE
> > -#define ARRAY_SIZE(x) (sizeof(x)/sizeof((x)[0]))
> > -#endif
> > -
> > -#ifndef ALIGN
> > -#define ALIGN(x, y) (((x) + (y)-1) & ~((y)-1))
> > -#endif
> > -
> > -#define min(a, b) ({			\
> > -	typeof(a) _a =3D (a);		\
> > -	typeof(b) _b =3D (b);		\
> > -	_a < _b ? _a : _b;		\
> > -})
> > -
> > -#define HWS_PGA_RCSUNIT		0x02080
> > -#define HWS_PGA_VCSUNIT0	0x12080
> > -#define HWS_PGA_BCSUNIT		0x22080
> > -
> > -#define GFX_MODE_RCSUNIT	0x0229c
> > -#define GFX_MODE_VCSUNIT0	0x1229c
> > -#define GFX_MODE_BCSUNIT	0x2229c
> > -
> > -#define EXECLIST_SUBMITPORT_RCSUNIT	0x02230
> > -#define EXECLIST_SUBMITPORT_VCSUNIT0	0x12230
> > -#define EXECLIST_SUBMITPORT_BCSUNIT	0x22230
> > -
> > -#define EXECLIST_STATUS_RCSUNIT		0x02234
> > -#define EXECLIST_STATUS_VCSUNIT0	0x12234
> > -#define EXECLIST_STATUS_BCSUNIT		0x22234
> > -
> > -#define EXECLIST_SQ_CONTENTS0_RCSUNIT	0x02510
> > -#define EXECLIST_SQ_CONTENTS0_VCSUNIT0	0x12510
> > -#define EXECLIST_SQ_CONTENTS0_BCSUNIT	0x22510
> > -
> > -#define EXECLIST_CONTROL_RCSUNIT	0x02550
> > -#define EXECLIST_CONTROL_VCSUNIT0	0x12550
> > -#define EXECLIST_CONTROL_BCSUNIT	0x22550
> > -
> > -#define MEMORY_MAP_SIZE (64 /* MiB */ * 1024 * 1024)
> > -
> > -#define PTE_SIZE 4
> > -#define GEN8_PTE_SIZE 8
> > -
> > -#define NUM_PT_ENTRIES (ALIGN(MEMORY_MAP_SIZE, 4096) / 4096)
> > -#define PT_SIZE ALIGN(NUM_PT_ENTRIES * GEN8_PTE_SIZE, 4096)
> > -
> > -#define RING_SIZE			(1 * 4096)
> > -#define PPHWSP_SIZE			(1 * 4096)
> > -#define GEN10_LR_CONTEXT_RENDER_SIZE	(19 * 4096)
> > -#define GEN8_LR_CONTEXT_OTHER_SIZE	(2 * 4096)
> > -
> > -#define STATIC_GGTT_MAP_START 0
> > -
> > -#define RENDER_RING_ADDR STATIC_GGTT_MAP_START
> > -#define RENDER_CONTEXT_ADDR (RENDER_RING_ADDR + RING_SIZE)
> > -
> > -#define BLITTER_RING_ADDR (RENDER_CONTEXT_ADDR + PPHWSP_SIZE + GEN10_L=
R_CONTEXT_RENDER_SIZE)
> > -#define BLITTER_CONTEXT_ADDR (BLITTER_RING_ADDR + RING_SIZE)
> > -
> > -#define VIDEO_RING_ADDR (BLITTER_CONTEXT_ADDR + PPHWSP_SIZE + GEN8_LR_=
CONTEXT_OTHER_SIZE)
> > -#define VIDEO_CONTEXT_ADDR (VIDEO_RING_ADDR + RING_SIZE)
> > -
> > -#define STATIC_GGTT_MAP_END (VIDEO_CONTEXT_ADDR + PPHWSP_SIZE + GEN8_L=
R_CONTEXT_OTHER_SIZE)
> > -#define STATIC_GGTT_MAP_SIZE (STATIC_GGTT_MAP_END - STATIC_GGTT_MAP_ST=
ART)
> > -
> > -#define CONTEXT_FLAGS (0x229)	/* Normal Priority | L3-LLC Coherency |
> > -	Legacy Context with no 64 bit VA support | Valid */
> > -
> > -#define RENDER_CONTEXT_DESCRIPTOR  ((uint64_t)1 << 32 | RENDER_CONTEXT=
_ADDR  | CONTEXT_FLAGS)
> > -#define BLITTER_CONTEXT_DESCRIPTOR ((uint64_t)2 << 32 | BLITTER_CONTEX=
T_ADDR | CONTEXT_FLAGS)
> > -#define VIDEO_CONTEXT_DESCRIPTOR   ((uint64_t)3 << 32 | VIDEO_CONTEXT_=
ADDR   | CONTEXT_FLAGS)
> > -
> > -static const uint32_t render_context_init[GEN10_LR_CONTEXT_RENDER_SIZE=
 /
> > -					  sizeof(uint32_t)] =3D {
> > -	0 /* MI_NOOP */,
> > -	0x1100101B /* MI_LOAD_REGISTER_IMM */,
> > -	0x2244 /* CONTEXT_CONTROL */,		0x90009 /* Inhibit Synchronous Context=
 Switch | Engine Context Restore Inhibit */,
> > -	0x2034 /* RING_HEAD */,			0,
> > -	0x2030 /* RING_TAIL */,			0,
> > -	0x2038 /* RING_BUFFER_START */,		RENDER_RING_ADDR,
> > -	0x203C /* RING_BUFFER_CONTROL */,	(RING_SIZE - 4096) | 1 /* Buffer Le=
ngth | Ring Buffer Enable */,
> > -	0x2168 /* BB_HEAD_U */,			0,
> > -	0x2140 /* BB_HEAD_L */,			0,
> > -	0x2110 /* BB_STATE */,			0,
> > -	0x211C /* SECOND_BB_HEAD_U */,		0,
> > -	0x2114 /* SECOND_BB_HEAD_L */,		0,
> > -	0x2118 /* SECOND_BB_STATE */,		0,
> > -	0x21C0 /* BB_PER_CTX_PTR */,		0,
> > -	0x21C4 /* RCS_INDIRECT_CTX */,		0,
> > -	0x21C8 /* RCS_INDIRECT_CTX_OFFSET */,	0,
> > -	/* MI_NOOP */
> > -	0, 0,
> > -
> > -	0 /* MI_NOOP */,
> > -	0x11001011 /* MI_LOAD_REGISTER_IMM */,
> > -	0x23A8 /* CTX_TIMESTAMP */,	0,
> > -	0x228C /* PDP3_UDW */,		0,
> > -	0x2288 /* PDP3_LDW */,		0,
> > -	0x2284 /* PDP2_UDW */,		0,
> > -	0x2280 /* PDP2_LDW */,		0,
> > -	0x227C /* PDP1_UDW */,		0,
> > -	0x2278 /* PDP1_LDW */,		0,
> > -	0x2274 /* PDP0_UDW */,		0,
> > -	0x2270 /* PDP0_LDW */,		0,
> > -	/* MI_NOOP */
> > -	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > -
> > -	0 /* MI_NOOP */,
> > -	0x11000001 /* MI_LOAD_REGISTER_IMM */,
> > -	0x20C8 /* R_PWR_CLK_STATE */, 0x7FFFFFFF,
> > -	0x05000001 /* MI_BATCH_BUFFER_END */
> > -};
> > -
> > -static const uint32_t blitter_context_init[GEN8_LR_CONTEXT_OTHER_SIZE /
> > -					   sizeof(uint32_t)] =3D {
> > -	0 /* MI_NOOP */,
> > -	0x11001015 /* MI_LOAD_REGISTER_IMM */,
> > -	0x22244 /* CONTEXT_CONTROL */,		0x90009 /* Inhibit Synchronous Contex=
t Switch | Engine Context Restore Inhibit */,
> > -	0x22034 /* RING_HEAD */,		0,
> > -	0x22030 /* RING_TAIL */,		0,
> > -	0x22038 /* RING_BUFFER_START */,	BLITTER_RING_ADDR,
> > -	0x2203C /* RING_BUFFER_CONTROL */,	(RING_SIZE - 4096) | 1 /* Buffer L=
ength | Ring Buffer Enable */,
> > -	0x22168 /* BB_HEAD_U */,		0,
> > -	0x22140 /* BB_HEAD_L */,		0,
> > -	0x22110 /* BB_STATE */,			0,
> > -	0x2211C /* SECOND_BB_HEAD_U */,		0,
> > -	0x22114 /* SECOND_BB_HEAD_L */,		0,
> > -	0x22118 /* SECOND_BB_STATE */,		0,
> > -	/* MI_NOOP */
> > -	0, 0, 0, 0, 0, 0, 0, 0,
> > -
> > -	0 /* MI_NOOP */,
> > -	0x11001011,
> > -	0x223A8 /* CTX_TIMESTAMP */,	0,
> > -	0x2228C /* PDP3_UDW */,		0,
> > -	0x22288 /* PDP3_LDW */,		0,
> > -	0x22284 /* PDP2_UDW */,		0,
> > -	0x22280 /* PDP2_LDW */,		0,
> > -	0x2227C /* PDP1_UDW */,		0,
> > -	0x22278 /* PDP1_LDW */,		0,
> > -	0x22274 /* PDP0_UDW */,		0,
> > -	0x22270 /* PDP0_LDW */,		0,
> > -	/* MI_NOOP */
> > -	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > -
> > -	0x05000001 /* MI_BATCH_BUFFER_END */
> > -};
> > -
> > -static const uint32_t video_context_init[GEN8_LR_CONTEXT_OTHER_SIZE /
> > -					 sizeof(uint32_t)] =3D {
> > -	0 /* MI_NOOP */,
> > -	0x11001015 /* MI_LOAD_REGISTER_IMM */,
> > -	0x1C244 /* CONTEXT_CONTROL */,		0x90009 /* Inhibit Synchronous Contex=
t Switch | Engine Context Restore Inhibit */,
> > -	0x1C034 /* RING_HEAD */,		0,
> > -	0x1C030 /* RING_TAIL */,		0,
> > -	0x1C038 /* RING_BUFFER_START */,	VIDEO_RING_ADDR,
> > -	0x1C03C /* RING_BUFFER_CONTROL */,	(RING_SIZE - 4096) | 1 /* Buffer L=
ength | Ring Buffer Enable */,
> > -	0x1C168 /* BB_HEAD_U */,		0,
> > -	0x1C140 /* BB_HEAD_L */,		0,
> > -	0x1C110 /* BB_STATE */,			0,
> > -	0x1C11C /* SECOND_BB_HEAD_U */,		0,
> > -	0x1C114 /* SECOND_BB_HEAD_L */,		0,
> > -	0x1C118 /* SECOND_BB_STATE */,		0,
> > -	/* MI_NOOP */
> > -	0, 0, 0, 0, 0, 0, 0, 0,
> > -
> > -	0 /* MI_NOOP */,
> > -	0x11001011,
> > -	0x1C3A8 /* CTX_TIMESTAMP */,	0,
> > -	0x1C28C /* PDP3_UDW */,		0,
> > -	0x1C288 /* PDP3_LDW */,		0,
> > -	0x1C284 /* PDP2_UDW */,		0,
> > -	0x1C280 /* PDP2_LDW */,		0,
> > -	0x1C27C /* PDP1_UDW */,		0,
> > -	0x1C278 /* PDP1_LDW */,		0,
> > -	0x1C274 /* PDP0_UDW */,		0,
> > -	0x1C270 /* PDP0_LDW */,		0,
> > -	/* MI_NOOP */
> > -	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > -
> > -	0x05000001 /* MI_BATCH_BUFFER_END */
> > -};
> > -
> > -static int close_init_helper(int fd);
> > -static int ioctl_init_helper(int fd, unsigned long request, ...);
> > -
> > -static int (*libc_close)(int fd) =3D close_init_helper;
> > -static int (*libc_ioctl)(int fd, unsigned long request, ...) =3D ioctl=
_init_helper;
> > -
> > -static int drm_fd =3D -1;
> > -static char *filename =3D NULL;
> > -static FILE *files[2] =3D { NULL, NULL };
> > -static int gen =3D 0;
> > -static int verbose =3D 0;
> > -static bool device_override;
> > -static uint32_t device;
> > -static int addr_bits =3D 0;
> > -
> > -#define MAX_BO_COUNT 64 * 1024
> > -
> > -struct bo {
> > -	uint32_t size;
> > -	uint64_t offset;
> > -	void *map;
> > -};
> > -
> > -static struct bo *bos;
> > -
> > -#define DRM_MAJOR 226
> > -
> > -#ifndef DRM_I915_GEM_USERPTR
> > -
> > -#define DRM_I915_GEM_USERPTR		0x33
> > -#define DRM_IOCTL_I915_GEM_USERPTR	DRM_IOWR (DRM_COMMAND_BASE + DRM_I9=
15_GEM_USERPTR, struct drm_i915_gem_userptr)
> > -
> > -struct drm_i915_gem_userptr {
> > -	__u64 user_ptr;
> > -	__u64 user_size;
> > -	__u32 flags;
> > -#define I915_USERPTR_READ_ONLY 0x1
> > -#define I915_USERPTR_UNSYNCHRONIZED 0x80000000
> > -	/**
> > -	 * Returned handle for the object.
> > -	 *
> > -	 * Object handles are nonzero.
> > -	 */
> > -	__u32 handle;
> > -};
> > -
> > -#endif
> > -
> > -/* We set bit 0 in the map pointer for userptr BOs so we know not to
> > - * munmap them on DRM_IOCTL_GEM_CLOSE.
> > - */
> > -#define USERPTR_FLAG 1
> > -#define IS_USERPTR(p) ((uintptr_t) (p) & USERPTR_FLAG)
> > -#define GET_PTR(p) ( (void *) ((uintptr_t) p & ~(uintptr_t) 1) )
> > -
> > -#ifndef I915_EXEC_BATCH_FIRST
> > -#define I915_EXEC_BATCH_FIRST (1 << 18)
> > -#endif
> > -
> > -static void __attribute__ ((format(__printf__, 2, 3)))
> > -fail_if(int cond, const char *format, ...)
> > -{
> > -	va_list args;
> > -
> > -	if (!cond)
> > -		return;
> > -
> > -	va_start(args, format);
> > -	vfprintf(stderr, format, args);
> > -	va_end(args);
> > -
> > -	raise(SIGTRAP);
> > -}
> > -
> > -static struct bo *
> > -get_bo(uint32_t handle)
> > -{
> > -	struct bo *bo;
> > -
> > -	fail_if(handle >=3D MAX_BO_COUNT, "bo handle too large\n");
> > -	bo =3D &bos[handle];
> > -
> > -	return bo;
> > -}
> > -
> > -static inline uint32_t
> > -align_u32(uint32_t v, uint32_t a)
> > -{
> > -	return (v + a - 1) & ~(a - 1);
> > -}
> > -
> > -static inline uint64_t
> > -align_u64(uint64_t v, uint64_t a)
> > -{
> > -	return (v + a - 1) & ~(a - 1);
> > -}
> > -
> > -static void
> > -dword_out(uint32_t data)
> > -{
> > -	for (int i =3D 0; i < ARRAY_SIZE (files); i++) {
> > -		if (files[i] =3D=3D NULL)
> > -			continue;
> > -
> > -		fail_if(fwrite(&data, 1, 4, files[i]) =3D=3D 0,
> > -			"Writing to output failed\n");
> > -	}
> > -}
> > -
> > -static void
> > -data_out(const void *data, size_t size)
> > -{
> > -	if (size =3D=3D 0)
> > -		return;
> > -
> > -	for (int i =3D 0; i < ARRAY_SIZE (files); i++) {
> > -		if (files[i] =3D=3D NULL)
> > -			continue;
> > -
> > -		fail_if(fwrite(data, 1, size, files[i]) =3D=3D 0,
> > -			"Writing to output failed\n");
> > -	}
> > -}
> > -
> > -static uint32_t
> > -gtt_size(void)
> > -{
> > -	return NUM_PT_ENTRIES * (addr_bits > 32 ? GEN8_PTE_SIZE : PTE_SIZE);
> > -}
> > -
> > -static void
> > -mem_trace_memory_write_header_out(uint64_t addr, uint32_t len,
> > -				  uint32_t addr_space)
> > -{
> > -	uint32_t dwords =3D ALIGN(len, sizeof(uint32_t)) / sizeof(uint32_t);
> > -
> > -	dword_out(CMD_MEM_TRACE_MEMORY_WRITE | (5 + dwords - 1));
> > -	dword_out(addr & 0xFFFFFFFF);	/* addr lo */
> > -	dword_out(addr >> 32);	/* addr hi */
> > -	dword_out(addr_space);	/* gtt */
> > -	dword_out(len);
> > -}
> > -
> > -static void
> > -register_write_out(uint32_t addr, uint32_t value)
> > -{
> > -	uint32_t dwords =3D 1;
> > -
> > -	dword_out(CMD_MEM_TRACE_REGISTER_WRITE | (5 + dwords - 1));
> > -	dword_out(addr);
> > -	dword_out(AUB_MEM_TRACE_REGISTER_SIZE_DWORD |
> > -		  AUB_MEM_TRACE_REGISTER_SPACE_MMIO);
> > -	dword_out(0xFFFFFFFF);	/* mask lo */
> > -	dword_out(0x00000000);	/* mask hi */
> > -	dword_out(value);
> > -}
> > -
> > -static void
> > -gen8_emit_ggtt_pte_for_range(uint64_t start, uint64_t end)
> > -{
> > -	uint64_t entry_addr;
> > -	uint64_t page_num;
> > -	uint64_t end_aligned =3D align_u64(end, 4096);
> > -
> > -	if (start >=3D end || end > (1ull << 32))
> > -		return;
> > -
> > -	entry_addr =3D start & ~(4096 - 1);
> > -	do {
> > -		uint64_t last_page_entry, num_entries;
> > -
> > -		page_num =3D entry_addr >> 21;
> > -		last_page_entry =3D min((page_num + 1) << 21, end_aligned);
> > -		num_entries =3D (last_page_entry - entry_addr) >> 12;
> > -		mem_trace_memory_write_header_out(
> > -			entry_addr >> 9, num_entries * GEN8_PTE_SIZE,
> > -			AUB_MEM_TRACE_MEMORY_ADDRESS_SPACE_GGTT_ENTRY);
> > -		while (num_entries-- > 0) {
> > -			dword_out((entry_addr & ~(4096 - 1)) |
> > -			          3 /* read/write | present */);
> > -			dword_out(entry_addr >> 32);
> > -			entry_addr +=3D 4096;
> > -		}
> > -	} while (entry_addr < end);
> > -}
> > -
> > -/**
> > - * Sets bits `start` through `end` - 1 in the bitmap array.
> > - */
> > -static void
> > -set_bitmap_range(uint32_t *bitmap, uint32_t start, uint32_t end)
> > -{
> > -	uint32_t pos =3D start;
> > -	while (pos < end) {
> > -		const uint32_t bit =3D 1 << (pos & 0x1f);
> > -		if (bit =3D=3D 1 && (end - pos) > 32) {
> > -			bitmap[pos >> 5] =3D 0xffffffff;
> > -			pos +=3D 32;
> > -		} else {
> > -			bitmap[pos >> 5] |=3D bit;
> > -			pos++;
> > -		}
> > -	}
> > -}
> > -
> > -/**
> > - * Finds the next `set` (or clear) bit in the bitmap array.
> > - *
> > - * The search starts at `*start` and only checks until `end` - 1.
> > - *
> > - * If found, returns true, and the found bit index in `*start`.
> > - */
> > -static bool
> > -find_bitmap_bit(uint32_t *bitmap, bool set, uint32_t *start, uint32_t =
end)
> > -{
> > -	uint32_t pos =3D *start;
> > -	const uint32_t neg_dw =3D set ? 0 : -1;
> > -	while (pos < end) {
> > -		const uint32_t dw =3D bitmap[pos >> 5];
> > -		const uint32_t bit =3D 1 << (pos & 0x1f);
> > -		if (!!(dw & bit) =3D=3D set) {
> > -			*start =3D pos;
> > -			return true;
> > -		} else if (bit =3D=3D 1 && dw =3D=3D neg_dw)
> > -			pos +=3D 32;
> > -		else
> > -			pos++;
> > -	}
> > -	return false;
> > -}
> > -
> > -/**
> > - * Finds a range of clear bits within the bitmap array.
> > - *
> > - * The search starts at `*start` and only checks until `*end` - 1.
> > - *
> > - * If found, returns true, and `*start` and `*end` are set for the
> > - * range of clear bits.
> > - */
> > -static bool
> > -find_bitmap_clear_bit_range(uint32_t *bitmap, uint32_t *start, uint32_=
t *end)
> > -{
> > -	if (find_bitmap_bit(bitmap, false, start, *end)) {
> > -		uint32_t found_end =3D *start;
> > -		if (find_bitmap_bit(bitmap, true, &found_end, *end))
> > -			*end =3D found_end;
> > -		return true;
> > -	}
> > -	return false;
> > -}
> > -
> > -static void
> > -gen8_map_ggtt_range(uint64_t start, uint64_t end)
> > -{
> > -	uint32_t pos1, pos2, end_pos;
> > -	static uint32_t *bitmap =3D NULL;
> > -	if (bitmap =3D=3D NULL) {
> > -		/* 4GiB (32-bits) of 4KiB pages (12-bits) in dwords (5-bits) */
> > -		bitmap =3D calloc(1 << (32 - 12 - 5), sizeof(*bitmap));
> > -		if (bitmap =3D=3D NULL)
> > -			return;
> > -	}
> > -
> > -	pos1 =3D start >> 12;
> > -	end_pos =3D (end + 4096 - 1) >> 12;
> > -	while (pos1 < end_pos) {
> > -		pos2 =3D end_pos;
> > -		if (!find_bitmap_clear_bit_range(bitmap, &pos1, &pos2))
> > -			break;
> > -
> > -		if (verbose)
> > -			printf("MAPPING 0x%08"PRIx64"-0x%08"PRIx64"\n",
> > -			       (uint64_t)pos1 << 12, (uint64_t)pos2 << 12);
> > -		gen8_emit_ggtt_pte_for_range((uint64_t)pos1 << 12,
> > -		                             (uint64_t)pos2 << 12);
> > -		set_bitmap_range(bitmap, (uint64_t)pos1, (uint64_t)pos2);
> > -		pos1 =3D pos2;
> > -	}
> > -}
> > -
> > -static void
> > -gen8_map_base_size(uint64_t base, uint64_t size)
> > -{
> > -	gen8_map_ggtt_range(base, base + size);
> > -}
> > -
> > -static void
> > -gen10_write_header(void)
> > -{
> > -	char app_name[8 * 4];
> > -	int app_name_len, dwords;
> > -
> > -	app_name_len =3D
> > -	    snprintf(app_name, sizeof(app_name), "PCI-ID=3D0x%X %s", device,
> > -		     program_invocation_short_name);
> > -	app_name_len =3D ALIGN(app_name_len, sizeof(uint32_t));
> > -
> > -	dwords =3D 5 + app_name_len / sizeof(uint32_t);
> > -	dword_out(CMD_MEM_TRACE_VERSION | (dwords - 1));
> > -	dword_out(AUB_MEM_TRACE_VERSION_FILE_VERSION);
> > -	dword_out(AUB_MEM_TRACE_VERSION_DEVICE_CNL |
> > -		  AUB_MEM_TRACE_VERSION_METHOD_PHY);
> > -	dword_out(0);		/* version */
> > -	dword_out(0);		/* version */
> > -	data_out(app_name, app_name_len);
> > -
> > -	/* RENDER_RING */
> > -	gen8_map_base_size(RENDER_RING_ADDR, RING_SIZE);
> > -	mem_trace_memory_write_header_out(RENDER_RING_ADDR, RING_SIZE,
> > -					  AUB_MEM_TRACE_MEMORY_ADDRESS_SPACE_LOCAL);
> > -	for (uint32_t i =3D 0; i < RING_SIZE; i +=3D sizeof(uint32_t))
> > -		dword_out(0);
> > -
> > -	/* RENDER_PPHWSP */
> > -	gen8_map_base_size(RENDER_CONTEXT_ADDR,
> > -	                   PPHWSP_SIZE + sizeof(render_context_init));
> > -	mem_trace_memory_write_header_out(RENDER_CONTEXT_ADDR,
> > -					  PPHWSP_SIZE +
> > -					  sizeof(render_context_init),
> > -					  AUB_MEM_TRACE_MEMORY_ADDRESS_SPACE_LOCAL);
> > -	for (uint32_t i =3D 0; i < PPHWSP_SIZE; i +=3D sizeof(uint32_t))
> > -		dword_out(0);
> > -
> > -	/* RENDER_CONTEXT */
> > -	data_out(render_context_init, sizeof(render_context_init));
> > -
> > -	/* BLITTER_RING */
> > -	gen8_map_base_size(BLITTER_RING_ADDR, RING_SIZE);
> > -	mem_trace_memory_write_header_out(BLITTER_RING_ADDR, RING_SIZE,
> > -					  AUB_MEM_TRACE_MEMORY_ADDRESS_SPACE_LOCAL);
> > -	for (uint32_t i =3D 0; i < RING_SIZE; i +=3D sizeof(uint32_t))
> > -		dword_out(0);
> > -
> > -	/* BLITTER_PPHWSP */
> > -	gen8_map_base_size(BLITTER_CONTEXT_ADDR,
> > -	                   PPHWSP_SIZE + sizeof(blitter_context_init));
> > -	mem_trace_memory_write_header_out(BLITTER_CONTEXT_ADDR,
> > -					  PPHWSP_SIZE +
> > -					  sizeof(blitter_context_init),
> > -					  AUB_MEM_TRACE_MEMORY_ADDRESS_SPACE_LOCAL);
> > -	for (uint32_t i =3D 0; i < PPHWSP_SIZE; i +=3D sizeof(uint32_t))
> > -		dword_out(0);
> > -
> > -	/* BLITTER_CONTEXT */
> > -	data_out(blitter_context_init, sizeof(blitter_context_init));
> > -
> > -	/* VIDEO_RING */
> > -	gen8_map_base_size(VIDEO_RING_ADDR, RING_SIZE);
> > -	mem_trace_memory_write_header_out(VIDEO_RING_ADDR, RING_SIZE,
> > -					  AUB_MEM_TRACE_MEMORY_ADDRESS_SPACE_LOCAL);
> > -	for (uint32_t i =3D 0; i < RING_SIZE; i +=3D sizeof(uint32_t))
> > -		dword_out(0);
> > -
> > -	/* VIDEO_PPHWSP */
> > -	gen8_map_base_size(VIDEO_CONTEXT_ADDR,
> > -	                   PPHWSP_SIZE + sizeof(video_context_init));
> > -	mem_trace_memory_write_header_out(VIDEO_CONTEXT_ADDR,
> > -					  PPHWSP_SIZE +
> > -					  sizeof(video_context_init),
> > -					  AUB_MEM_TRACE_MEMORY_ADDRESS_SPACE_LOCAL);
> > -	for (uint32_t i =3D 0; i < PPHWSP_SIZE; i +=3D sizeof(uint32_t))
> > -		dword_out(0);
> > -
> > -	/* VIDEO_CONTEXT */
> > -	data_out(video_context_init, sizeof(video_context_init));
> > -
> > -	register_write_out(HWS_PGA_RCSUNIT, RENDER_CONTEXT_ADDR);
> > -	register_write_out(HWS_PGA_VCSUNIT0, VIDEO_CONTEXT_ADDR);
> > -	register_write_out(HWS_PGA_BCSUNIT, BLITTER_CONTEXT_ADDR);
> > -
> > -	register_write_out(GFX_MODE_RCSUNIT, 0x80008000 /* execlist enable */=
);
> > -	register_write_out(GFX_MODE_VCSUNIT0, 0x80008000 /* execlist enable *=
/);
> > -	register_write_out(GFX_MODE_BCSUNIT, 0x80008000 /* execlist enable */=
);
> > -}
> > -
> > -static void write_header(void)
> > -{
> > -	char app_name[8 * 4];
> > -	char comment[16];
> > -	int comment_len, comment_dwords, dwords;
> > -	uint32_t entry =3D 0x200003;
> > -
> > -	comment_len =3D snprintf(comment, sizeof(comment), "PCI-ID=3D0x%x", d=
evice);
> > -	comment_dwords =3D ((comment_len + 3) / 4);
> > -
> > -	/* Start with a (required) version packet. */
> > -	dwords =3D 13 + comment_dwords;
> > -	dword_out(CMD_AUB_HEADER | (dwords - 2));
> > -	dword_out((4 << AUB_HEADER_MAJOR_SHIFT) |
> > -		  (0 << AUB_HEADER_MINOR_SHIFT));
> > -
> > -	/* Next comes a 32-byte application name. */
> > -	strncpy(app_name, program_invocation_short_name, sizeof(app_name));
> > -	app_name[sizeof(app_name) - 1] =3D 0;
> > -	data_out(app_name, sizeof(app_name));
> > -
> > -	dword_out(0); /* timestamp */
> > -	dword_out(0); /* timestamp */
> > -	dword_out(comment_len);
> > -	data_out(comment, comment_dwords * 4);
> > -
> > -	/* Set up the GTT. The max we can handle is 64M */
> > -	dword_out(CMD_AUB_TRACE_HEADER_BLOCK | ((addr_bits > 32 ? 6 : 5) - 2)=
);
> > -	dword_out(AUB_TRACE_MEMTYPE_GTT_ENTRY |
> > -		  AUB_TRACE_TYPE_NOTYPE | AUB_TRACE_OP_DATA_WRITE);
> > -	dword_out(0); /* subtype */
> > -	dword_out(0); /* offset */
> > -	dword_out(gtt_size()); /* size */
> > -	if (addr_bits > 32)
> > -		dword_out(0);
> > -	for (uint32_t i =3D 0; i < NUM_PT_ENTRIES; i++) {
> > -		dword_out(entry + 0x1000 * i);
> > -		if (addr_bits > 32)
> > -			dword_out(0);
> > -	}
> > -}
> > -
> > -/**
> > - * Break up large objects into multiple writes.  Otherwise a 128kb VBO
> > - * would overflow the 16 bits of size field in the packet header and
> > - * everything goes badly after that.
> > - */
> > -static void
> > -aub_write_trace_block(uint32_t type, void *virtual, uint32_t size, uin=
t64_t gtt_offset)
> > -{
> > -	uint32_t block_size;
> > -	uint32_t subtype =3D 0;
> > -	static const char null_block[8 * 4096];
> > -
> > -	for (uint32_t offset =3D 0; offset < size; offset +=3D block_size) {
> > -		block_size =3D size - offset;
> > -
> > -		if (block_size > 8 * 4096)
> > -			block_size =3D 8 * 4096;
> > -
> > -		if (gen >=3D 10) {
> > -			mem_trace_memory_write_header_out(gtt_offset + offset,
> > -							  block_size,
> > -							  AUB_MEM_TRACE_MEMORY_ADDRESS_SPACE_LOCAL);
> > -		} else {
> > -			dword_out(CMD_AUB_TRACE_HEADER_BLOCK |
> > -				  ((addr_bits > 32 ? 6 : 5) - 2));
> > -			dword_out(AUB_TRACE_MEMTYPE_GTT |
> > -				  type | AUB_TRACE_OP_DATA_WRITE);
> > -			dword_out(subtype);
> > -			dword_out(gtt_offset + offset);
> > -			dword_out(align_u32(block_size, 4));
> > -			if (addr_bits > 32)
> > -				dword_out((gtt_offset + offset) >> 32);
> > -		}
> > -
> > -		if (virtual)
> > -			data_out(((char *) GET_PTR(virtual)) + offset, block_size);
> > -		else
> > -			data_out(null_block, block_size);
> > -
> > -		/* Pad to a multiple of 4 bytes. */
> > -		data_out(null_block, -block_size & 3);
> > -	}
> > -}
> > -
> > -static void
> > -write_reloc(void *p, uint64_t v)
> > -{
> > -	if (addr_bits > 32) {
> > -		/* From the Broadwell PRM Vol. 2a,
> > -		 * MI_LOAD_REGISTER_MEM::MemoryAddress:
> > -		 *
> > -		 *	"This field specifies the address of the memory
> > -		 *	location where the register value specified in the
> > -		 *	DWord above will read from.  The address specifies
> > -		 *	the DWord location of the data. Range =3D
> > -		 *	GraphicsVirtualAddress[63:2] for a DWord register
> > -		 *	GraphicsAddress [63:48] are ignored by the HW and
> > -		 *	assumed to be in correct canonical form [63:48] =3D=3D
> > -		 *	[47]."
> > -		 *
> > -		 * In practice, this will always mean the top bits are zero
> > -		 * because of the GTT size limitation of the aubdump tool.
> > -		 */
> > -		const int shift =3D 63 - 47;
> > -		*(uint64_t *)p =3D (((int64_t)v) << shift) >> shift;
> > -	} else {
> > -		*(uint32_t *)p =3D v;
> > -	}
> > -}
> > -
> > -static void
> > -aub_dump_execlist(uint64_t batch_offset, int ring_flag)
> > -{
> > -	uint32_t ring_addr;
> > -	uint64_t descriptor;
> > -	uint32_t elsp_reg;
> > -	uint32_t elsq_reg;
> > -	uint32_t status_reg;
> > -	uint32_t control_reg;
> > -
> > -	switch (ring_flag) {
> > -	case I915_EXEC_DEFAULT:
> > -	case I915_EXEC_RENDER:
> > -		ring_addr =3D RENDER_RING_ADDR;
> > -		descriptor =3D RENDER_CONTEXT_DESCRIPTOR;
> > -		elsp_reg =3D EXECLIST_SUBMITPORT_RCSUNIT;
> > -		elsq_reg =3D EXECLIST_SQ_CONTENTS0_RCSUNIT;
> > -		status_reg =3D EXECLIST_STATUS_RCSUNIT;
> > -		control_reg =3D EXECLIST_CONTROL_RCSUNIT;
> > -		break;
> > -	case I915_EXEC_BSD:
> > -		ring_addr =3D VIDEO_RING_ADDR;
> > -		descriptor =3D VIDEO_CONTEXT_DESCRIPTOR;
> > -		elsp_reg =3D EXECLIST_SUBMITPORT_VCSUNIT0;
> > -		elsq_reg =3D EXECLIST_SQ_CONTENTS0_VCSUNIT0;
> > -		status_reg =3D EXECLIST_STATUS_VCSUNIT0;
> > -		control_reg =3D EXECLIST_CONTROL_VCSUNIT0;
> > -		break;
> > -	case I915_EXEC_BLT:
> > -		ring_addr =3D BLITTER_RING_ADDR;
> > -		descriptor =3D BLITTER_CONTEXT_DESCRIPTOR;
> > -		elsp_reg =3D EXECLIST_SUBMITPORT_BCSUNIT;
> > -		elsq_reg =3D EXECLIST_SQ_CONTENTS0_BCSUNIT;
> > -		status_reg =3D EXECLIST_STATUS_BCSUNIT;
> > -		control_reg =3D EXECLIST_CONTROL_BCSUNIT;
> > -		break;
> > -	}
> > -
> > -	mem_trace_memory_write_header_out(ring_addr, 16,
> > -					  AUB_MEM_TRACE_MEMORY_ADDRESS_SPACE_LOCAL);
> > -	dword_out(AUB_MI_BATCH_BUFFER_START | (3 - 2));
> > -	dword_out(batch_offset & 0xFFFFFFFF);
> > -	dword_out(batch_offset >> 32);
> > -	dword_out(0 /* MI_NOOP */);
> > -
> > -	mem_trace_memory_write_header_out(ring_addr + 8192 + 20, 4,
> > -					  AUB_MEM_TRACE_MEMORY_ADDRESS_SPACE_LOCAL);
> > -	dword_out(0); /* RING_BUFFER_HEAD */
> > -	mem_trace_memory_write_header_out(ring_addr + 8192 + 28, 4,
> > -					  AUB_MEM_TRACE_MEMORY_ADDRESS_SPACE_LOCAL);
> > -	dword_out(16); /* RING_BUFFER_TAIL */
> > -
> > -	if (gen >=3D 11) {
> > -		register_write_out(elsq_reg, descriptor & 0xFFFFFFFF);
> > -		register_write_out(elsq_reg + sizeof(uint32_t), descriptor >> 32);
> > -		register_write_out(control_reg, 1);
> > -	} else {
> > -		register_write_out(elsp_reg, 0);
> > -		register_write_out(elsp_reg, 0);
> > -		register_write_out(elsp_reg, descriptor >> 32);
> > -		register_write_out(elsp_reg, descriptor & 0xFFFFFFFF);
> > -	}
> > -
> > -	dword_out(CMD_MEM_TRACE_REGISTER_POLL | (5 + 1 - 1));
> > -	dword_out(status_reg);
> > -	dword_out(AUB_MEM_TRACE_REGISTER_SIZE_DWORD |
> > -		  AUB_MEM_TRACE_REGISTER_SPACE_MMIO);
> > -	if (gen >=3D 11) {
> > -		dword_out(0x00000001);	/* mask lo */
> > -		dword_out(0x00000000);	/* mask hi */
> > -		dword_out(0x00000001);
> > -	} else {
> > -		dword_out(0x00000010);	/* mask lo */
> > -		dword_out(0x00000000);	/* mask hi */
> > -		dword_out(0x00000000);
> > -	}
> > -}
> > -
> > -static void
> > -aub_dump_ringbuffer(uint64_t batch_offset, uint64_t offset, int ring_f=
lag)
> > -{
> > -	uint32_t ringbuffer[4096];
> > -	unsigned aub_mi_bbs_len;
> > -	int ring =3D AUB_TRACE_TYPE_RING_PRB0; /* The default ring */
> > -	int ring_count =3D 0;
> > -
> > -	if (ring_flag =3D=3D I915_EXEC_BSD)
> > -		ring =3D AUB_TRACE_TYPE_RING_PRB1;
> > -	else if (ring_flag =3D=3D I915_EXEC_BLT)
> > -		ring =3D AUB_TRACE_TYPE_RING_PRB2;
> > -
> > -	/* Make a ring buffer to execute our batchbuffer. */
> > -	memset(ringbuffer, 0, sizeof(ringbuffer));
> > -
> > -	aub_mi_bbs_len =3D addr_bits > 32 ? 3 : 2;
> > -	ringbuffer[ring_count] =3D AUB_MI_BATCH_BUFFER_START | (aub_mi_bbs_le=
n - 2);
> > -	write_reloc(&ringbuffer[ring_count + 1], batch_offset);
> > -	ring_count +=3D aub_mi_bbs_len;
> > -
> > -	/* Write out the ring.  This appears to trigger execution of
> > -	 * the ring in the simulator.
> > -	 */
> > -	dword_out(CMD_AUB_TRACE_HEADER_BLOCK |
> > -		  ((addr_bits > 32 ? 6 : 5) - 2));
> > -	dword_out(AUB_TRACE_MEMTYPE_GTT | ring | AUB_TRACE_OP_COMMAND_WRITE);
> > -	dword_out(0); /* general/surface subtype */
> > -	dword_out(offset);
> > -	dword_out(ring_count * 4);
> > -	if (addr_bits > 32)
> > -		dword_out(offset >> 32);
> > -
> > -	data_out(ringbuffer, ring_count * 4);
> > -}
> > -
> > -static void *
> > -relocate_bo(struct bo *bo, const struct drm_i915_gem_execbuffer2 *exec=
buffer2,
> > -	    const struct drm_i915_gem_exec_object2 *obj)
> > -{
> > -	const struct drm_i915_gem_exec_object2 *exec_objects =3D
> > -		(struct drm_i915_gem_exec_object2 *) (uintptr_t) execbuffer2->buffer=
s_ptr;
> > -	const struct drm_i915_gem_relocation_entry *relocs =3D
> > -		(const struct drm_i915_gem_relocation_entry *) (uintptr_t) obj->relo=
cs_ptr;
> > -	void *relocated;
> > -	int handle;
> > -
> > -	relocated =3D malloc(bo->size);
> > -	fail_if(relocated =3D=3D NULL, "intel_aubdump: out of memory\n");
> > -	memcpy(relocated, GET_PTR(bo->map), bo->size);
> > -	for (size_t i =3D 0; i < obj->relocation_count; i++) {
> > -		fail_if(relocs[i].offset >=3D bo->size, "intel_aubdump: reloc outsid=
e bo\n");
> > -
> > -		if (execbuffer2->flags & I915_EXEC_HANDLE_LUT)
> > -			handle =3D exec_objects[relocs[i].target_handle].handle;
> > -		else
> > -			handle =3D relocs[i].target_handle;
> > -
> > -		write_reloc(((char *)relocated) + relocs[i].offset,
> > -			    get_bo(handle)->offset + relocs[i].delta);
> > -	}
> > -
> > -	return relocated;
> > -}
> > -
> > -static int
> > -gem_ioctl(int fd, unsigned long request, void *argp)
> > -{
> > -	int ret;
> > -
> > -	do {
> > -		ret =3D libc_ioctl(fd, request, argp);
> > -	} while (ret =3D=3D -1 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN)=
);
> > -
> > -	return ret;
> > -}
> > -
> > -static void *
> > -gem_mmap(int fd, uint32_t handle, uint64_t offset, uint64_t size)
> > -{
> > -	struct drm_i915_gem_mmap mmap =3D {
> > -		.handle =3D handle,
> > -		.offset =3D offset,
> > -		.size =3D size
> > -	};
> > -
> > -	if (gem_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP, &mmap) =3D=3D -1)
> > -		return MAP_FAILED;
> > -
> > -	return (void *)(uintptr_t) mmap.addr_ptr;
> > -}
> > -
> > -static int
> > -gem_get_param(int fd, uint32_t param)
> > -{
> > -	int value;
> > -	drm_i915_getparam_t gp =3D {
> > -		.param =3D param,
> > -		.value =3D &value
> > -	};
> > -
> > -	if (gem_ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp) =3D=3D -1)
> > -		return 0;
> > -
> > -	return value;
> > -}
> > -
> > -static void
> > -dump_execbuffer2(int fd, struct drm_i915_gem_execbuffer2 *execbuffer2)
> > -{
> > -	struct drm_i915_gem_exec_object2 *exec_objects =3D
> > -		(struct drm_i915_gem_exec_object2 *) (uintptr_t) execbuffer2->buffer=
s_ptr;
> > -	uint32_t ring_flag =3D execbuffer2->flags & I915_EXEC_RING_MASK;
> > -	uint32_t offset;
> > -	struct drm_i915_gem_exec_object2 *obj;
> > -	struct bo *bo, *batch_bo;
> > -	int batch_index;
> > -	void *data;
> > -
> > -	/* We can't do this at open time as we're not yet authenticated. */
> > -	if (device =3D=3D 0) {
> > -		device =3D gem_get_param(fd, I915_PARAM_CHIPSET_ID);
> > -		fail_if(device =3D=3D 0 || gen =3D=3D -1, "failed to identify chipse=
t\n");
> > -	}
> > -	if (gen =3D=3D 0) {
> > -		gen =3D intel_gen(device);
> > -
> > -		/* If we don't know the device gen, then it probably is a
> > -		 * newer device. Set gen to some arbitrarily high number.
> > -		 */
> > -		if (gen =3D=3D 0)
> > -			gen =3D 9999;
> > -
> > -		addr_bits =3D gen >=3D 8 ? 48 : 32;
> > -
> > -		if (gen >=3D 10)
> > -			gen10_write_header();
> > -		else
> > -			write_header();
> > -
> > -		if (verbose)
> > -			printf("[intel_aubdump: running, "
> > -			       "output file %s, chipset id 0x%04x, gen %d]\n",
> > -			       filename, device, gen);
> > -	}
> > -
> > -	if (gen >=3D 10)
> > -		offset =3D STATIC_GGTT_MAP_END;
> > -	else
> > -		offset =3D gtt_size();
> > -
> > -	if (verbose)
> > -		printf("Dumping execbuffer2:\n");
> > -
> > -	for (uint32_t i =3D 0; i < execbuffer2->buffer_count; i++) {
> > -		obj =3D &exec_objects[i];
> > -		bo =3D get_bo(obj->handle);
> > -
> > -		/* If bo->size =3D=3D 0, this means they passed us an invalid
> > -		 * buffer.  The kernel will reject it and so should we.
> > -		 */
> > -		if (bo->size =3D=3D 0) {
> > -			if (verbose)
> > -				printf("BO #%d is invalid!\n", obj->handle);
> > -			return;
> > -		}
> > -
> > -		if (obj->flags & EXEC_OBJECT_PINNED) {
> > -			bo->offset =3D obj->offset;
> > -			if (verbose)
> > -				printf("BO #%d (%dB) pinned @ 0x%"PRIx64"\n",
> > -				       obj->handle, bo->size, bo->offset);
> > -		} else {
> > -			if (obj->alignment !=3D 0)
> > -				offset =3D align_u32(offset, obj->alignment);
> > -			bo->offset =3D offset;
> > -			if (verbose)
> > -				printf("BO #%d (%dB) @ 0x%"PRIx64"\n", obj->handle,
> > -				       bo->size, bo->offset);
> > -			offset =3D align_u32(offset + bo->size + 4095, 4096);
> > -		}
> > -
> > -		if (bo->map =3D=3D NULL && bo->size > 0)
> > -			bo->map =3D gem_mmap(fd, obj->handle, 0, bo->size);
> > -		fail_if(bo->map =3D=3D MAP_FAILED, "intel_aubdump: bo mmap failed\n"=
);
> > -
> > -		if (gen >=3D 10)
> > -			gen8_map_ggtt_range(bo->offset, bo->offset + bo->size);
> > -	}
> > -
> > -	batch_index =3D (execbuffer2->flags & I915_EXEC_BATCH_FIRST) ? 0 :
> > -			  execbuffer2->buffer_count - 1;
> > -	batch_bo =3D get_bo(exec_objects[batch_index].handle);
> > -	for (uint32_t i =3D 0; i < execbuffer2->buffer_count; i++) {
> > -		obj =3D &exec_objects[i];
> > -		bo =3D get_bo(obj->handle);
> > -
> > -		if (obj->relocation_count > 0)
> > -			data =3D relocate_bo(bo, execbuffer2, obj);
> > -		else
> > -			data =3D bo->map;
> > -
> > -		if (bo =3D=3D batch_bo) {
> > -			aub_write_trace_block(AUB_TRACE_TYPE_BATCH,
> > -					      data, bo->size, bo->offset);
> > -		} else {
> > -			aub_write_trace_block(AUB_TRACE_TYPE_NOTYPE,
> > -					      data, bo->size, bo->offset);
> > -		}
> > -		if (data !=3D bo->map)
> > -			free(data);
> > -	}
> > -
> > -	if (gen >=3D 10) {
> > -		aub_dump_execlist(batch_bo->offset +
> > -				  execbuffer2->batch_start_offset, ring_flag);
> > -	} else {
> > -		/* Dump ring buffer */
> > -		aub_dump_ringbuffer(batch_bo->offset +
> > -				    execbuffer2->batch_start_offset, offset,
> > -				    ring_flag);
> > -	}
> > -
> > -	for (int i =3D 0; i < ARRAY_SIZE(files); i++) {
> > -		if (files[i] !=3D NULL)
> > -			fflush(files[i]);
> > -	}
> > -
> > -	if (device_override &&
> > -	    (execbuffer2->flags & I915_EXEC_FENCE_ARRAY) !=3D 0) {
> > -		struct drm_i915_gem_exec_fence *fences =3D
> > -			(void*)(uintptr_t)execbuffer2->cliprects_ptr;
> > -		for (uint32_t i =3D 0; i < execbuffer2->num_cliprects; i++) {
> > -			if ((fences[i].flags & I915_EXEC_FENCE_SIGNAL) !=3D 0) {
> > -				struct drm_syncobj_array arg =3D {
> > -					.handles =3D (uintptr_t)&fences[i].handle,
> > -					.count_handles =3D 1,
> > -					.pad =3D 0,
> > -				};
> > -				libc_ioctl(fd, DRM_IOCTL_SYNCOBJ_SIGNAL, &arg);
> > -			}
> > -		}
> > -	}
> > -}
> > -
> > -static void
> > -add_new_bo(int handle, uint64_t size, void *map)
> > -{
> > -	struct bo *bo =3D &bos[handle];
> > -
> > -	fail_if(handle >=3D MAX_BO_COUNT, "intel_aubdump: bo handle out of ra=
nge\n");
> > -	fail_if(size =3D=3D 0, "intel_aubdump: bo size is invalid\n");
> > -
> > -	bo->size =3D size;
> > -	bo->map =3D map;
> > -}
> > -
> > -static void
> > -remove_bo(int handle)
> > -{
> > -	struct bo *bo =3D get_bo(handle);
> > -
> > -	if (bo->map && !IS_USERPTR(bo->map))
> > -		munmap(bo->map, bo->size);
> > -	bo->size =3D 0;
> > -	bo->map =3D NULL;
> > -}
> > -
> > -int
> > -close(int fd)
> > -{
> > -	if (fd =3D=3D drm_fd)
> > -		drm_fd =3D -1;
> > -
> > -	return libc_close(fd);
> > -}
> > -
> > -static FILE *
> > -launch_command(char *command)
> > -{
> > -	int i =3D 0, fds[2];
> > -	char **args =3D calloc(strlen(command), sizeof(char *));
> > -	char *iter =3D command;
> > -
> > -	args[i++] =3D iter =3D command;
> > -
> > -	while ((iter =3D strstr(iter, ",")) !=3D NULL) {
> > -		*iter =3D '\0';
> > -		iter +=3D 1;
> > -		args[i++] =3D iter;
> > -	}
> > -
> > -	if (pipe(fds) =3D=3D -1)
> > -		return NULL;
> > -
> > -	switch (fork()) {
> > -	case 0:
> > -		dup2(fds[0], 0);
> > -		fail_if(execvp(args[0], args) =3D=3D -1,
> > -			"intel_aubdump: failed to launch child command\n");
> > -		return NULL;
> > -
> > -	default:
> > -		free(args);
> > -		return fdopen(fds[1], "w");
> > -
> > -	case -1:
> > -		return NULL;
> > -	}
> > -}
> > -
> > -static void
> > -maybe_init(void)
> > -{
> > -	static bool initialized =3D false;
> > -	FILE *config;
> > -	char *key, *value;
> > -
> > -	if (initialized)
> > -		return;
> > -
> > -	initialized =3D true;
> > -
> > -	config =3D fdopen(3, "r");
> > -	while (fscanf(config, "%m[^=3D]=3D%m[^\n]\n", &key, &value) !=3D EOF)=
 {
> > -		if (!strcmp(key, "verbose")) {
> > -			verbose =3D 1;
> > -		} else if (!strcmp(key, "device")) {
> > -			fail_if(sscanf(value, "%i", &device) !=3D 1,
> > -				"intel_aubdump: failed to parse device id '%s'",
> > -				value);
> > -			device_override =3D true;
> > -		} else if (!strcmp(key, "file")) {
> > -			filename =3D strdup(value);
> > -			files[0] =3D fopen(filename, "w+");
> > -			fail_if(files[0] =3D=3D NULL,
> > -				"intel_aubdump: failed to open file '%s'\n",
> > -				filename);
> > -		} else if (!strcmp(key,  "command")) {
> > -			files[1] =3D launch_command(value);
> > -			fail_if(files[1] =3D=3D NULL,
> > -				"intel_aubdump: failed to launch command '%s'\n",
> > -				value);
> > -		} else {
> > -			fprintf(stderr, "intel_aubdump: unknown option '%s'\n", key);
> > -		}
> > -
> > -		free(key);
> > -		free(value);
> > -	}
> > -	fclose(config);
> > -
> > -	bos =3D calloc(MAX_BO_COUNT, sizeof(bos[0]));
> > -	fail_if(bos =3D=3D NULL, "intel_aubdump: out of memory\n");
> > -}
> > -
> > -#define LOCAL_IOCTL_I915_GEM_EXECBUFFER2_WR \
> > -    DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_EXECBUFFER2, struct drm_i=
915_gem_execbuffer2)
> > -
> > -int
> > -ioctl(int fd, unsigned long request, ...)
> > -{
> > -	va_list args;
> > -	void *argp;
> > -	int ret;
> > -	struct stat buf;
> > -
> > -	va_start(args, request);
> > -	argp =3D va_arg(args, void *);
> > -	va_end(args);
> > -
> > -	if (_IOC_TYPE(request) =3D=3D DRM_IOCTL_BASE &&
> > -	    drm_fd !=3D fd && fstat(fd, &buf) =3D=3D 0 &&
> > -	    (buf.st_mode & S_IFMT) =3D=3D S_IFCHR && major(buf.st_rdev) =3D=
=3D DRM_MAJOR) {
> > -		drm_fd =3D fd;
> > -		if (verbose)
> > -			printf("[intel_aubdump: intercept drm ioctl on fd %d]\n", fd);
> > -	}
> > -
> > -	if (fd =3D=3D drm_fd) {
> > -		maybe_init();
> > -
> > -		switch (request) {
> > -		case DRM_IOCTL_I915_GETPARAM: {
> > -			struct drm_i915_getparam *getparam =3D argp;
> > -
> > -			if (device_override && getparam->param =3D=3D I915_PARAM_CHIPSET_ID=
) {
> > -				*getparam->value =3D device;
> > -				return 0;
> > -			}
> > -
> > -			ret =3D libc_ioctl(fd, request, argp);
> > -
> > -			/* If the application looks up chipset_id
> > -			 * (they typically do), we'll piggy-back on
> > -			 * their ioctl and store the id for later
> > -			 * use. */
> > -			if (getparam->param =3D=3D I915_PARAM_CHIPSET_ID)
> > -				device =3D *getparam->value;
> > -
> > -			return ret;
> > -		}
> > -
> > -		case DRM_IOCTL_I915_GEM_EXECBUFFER: {
> > -			static bool once;
> > -			if (!once) {
> > -				fprintf(stderr, "intel_aubdump: "
> > -					"application uses DRM_IOCTL_I915_GEM_EXECBUFFER, not handled\n");
> > -				once =3D true;
> > -			}
> > -			return libc_ioctl(fd, request, argp);
> > -		}
> > -
> > -		case DRM_IOCTL_I915_GEM_EXECBUFFER2:
> > -		case LOCAL_IOCTL_I915_GEM_EXECBUFFER2_WR: {
> > -			dump_execbuffer2(fd, argp);
> > -			if (device_override)
> > -				return 0;
> > -
> > -			return libc_ioctl(fd, request, argp);
> > -		}
> > -
> > -		case DRM_IOCTL_I915_GEM_CREATE: {
> > -			struct drm_i915_gem_create *create =3D argp;
> > -
> > -			ret =3D libc_ioctl(fd, request, argp);
> > -			if (ret =3D=3D 0)
> > -				add_new_bo(create->handle, create->size, NULL);
> > -
> > -			return ret;
> > -		}
> > -
> > -		case DRM_IOCTL_I915_GEM_USERPTR: {
> > -			struct drm_i915_gem_userptr *userptr =3D argp;
> > -
> > -			ret =3D libc_ioctl(fd, request, argp);
> > -			if (ret =3D=3D 0)
> > -				add_new_bo(userptr->handle, userptr->user_size,
> > -					   (void *) (uintptr_t) (userptr->user_ptr | USERPTR_FLAG));
> > -			return ret;
> > -		}
> > -
> > -		case DRM_IOCTL_GEM_CLOSE: {
> > -			struct drm_gem_close *close =3D argp;
> > -
> > -			remove_bo(close->handle);
> > -
> > -			return libc_ioctl(fd, request, argp);
> > -		}
> > -
> > -		case DRM_IOCTL_GEM_OPEN: {
> > -			struct drm_gem_open *open =3D argp;
> > -
> > -			ret =3D libc_ioctl(fd, request, argp);
> > -			if (ret =3D=3D 0)
> > -				add_new_bo(open->handle, open->size, NULL);
> > -
> > -			return ret;
> > -		}
> > -
> > -		case DRM_IOCTL_PRIME_FD_TO_HANDLE: {
> > -			struct drm_prime_handle *prime =3D argp;
> > -
> > -			ret =3D libc_ioctl(fd, request, argp);
> > -			if (ret =3D=3D 0) {
> > -				off_t size;
> > -
> > -				size =3D lseek(prime->fd, 0, SEEK_END);
> > -				fail_if(size =3D=3D -1, "intel_aubdump: failed to get prime bo siz=
e\n");
> > -				add_new_bo(prime->handle, size, NULL);
> > -			}
> > -
> > -			return ret;
> > -		}
> > -
> > -		default:
> > -			return libc_ioctl(fd, request, argp);
> > -		}
> > -	} else {
> > -		return libc_ioctl(fd, request, argp);
> > -	}
> > -}
> > -
> > -static void
> > -init(void)
> > -{
> > -	libc_close =3D dlsym(RTLD_NEXT, "close");
> > -	libc_ioctl =3D dlsym(RTLD_NEXT, "ioctl");
> > -	fail_if(libc_close =3D=3D NULL || libc_ioctl =3D=3D NULL,
> > -		"intel_aubdump: failed to get libc ioctl or close\n");
> > -}
> > -
> > -static int
> > -close_init_helper(int fd)
> > -{
> > -	init();
> > -	return libc_close(fd);
> > -}
> > -
> > -static int
> > -ioctl_init_helper(int fd, unsigned long request, ...)
> > -{
> > -	va_list args;
> > -	void *argp;
> > -
> > -	va_start(args, request);
> > -	argp =3D va_arg(args, void *);
> > -	va_end(args);
> > -
> > -	init();
> > -	return libc_ioctl(fd, request, argp);
> > -}
> > -
> > -static void __attribute__ ((destructor))
> > -fini(void)
> > -{
> > -	free(filename);
> > -	for (int i =3D 0; i < ARRAY_SIZE(files); i++) {
> > -		if (files[i] !=3D NULL)
> > -			fclose(files[i]);
> > -	}
> > -	free(bos);
> > -}
> > diff --git a/tools/intel_aubdump.in b/tools/intel_aubdump.in
> > deleted file mode 100755
> > index 977fe951..00000000
> > --- a/tools/intel_aubdump.in
> > +++ /dev/null
> > @@ -1,111 +0,0 @@
> > -#!/bin/bash
> > -# -*- mode: sh -*-
> > -
> > -function show_help() {
> > -    cat <<EOF
> > -Usage: intel_aubdump [OPTION]... [--] COMMAND ARGUMENTS
> > -
> > -Run COMMAND with ARGUMENTS and dump an AUB file that captures buffer
> > -contents and execution of the GEM application.
> > -
> > -  -o, --output=3DFILE  Name of AUB file. Defaults to COMMAND.aub
> > -
> > -  -c, --command=3DCMD  Execute CMD and write the AUB file's content to=
 its
> > -                     standard input
> > -
> > -      --device=3DID    Override PCI ID of the reported device
> > -
> > -  -v                 Enable verbose output
> > -
> > -      --help         Display this help message and exit
> > -
> > -EOF
> > -
> > -    exit 0
> > -}
> > -
> > -args=3D""
> > -command=3D""
> > -file=3D""
> > -
> > -function add_arg() {
> > -    arg=3D$1
> > -    args=3D"$args$arg\n"
> > -}
> > -
> > -function build_command () {
> > -      command=3D""
> > -      for i in $1; do
> > -	  if [ -z $command ]; then
> > -	      command=3D$i
> > -	  else
> > -	      command=3D"$command,$i"
> > -	  fi;
> > -      done
> > -}
> > -
> > -while true; do
> > -      case "$1" in
> > -	  -o)
> > -	      file=3D$2
> > -	      add_arg "file=3D${file:-$(basename ${file}).aub}"
> > -	      shift 2
> > -	      ;;
> > -	  -v)
> > -	      add_arg "verbose=3D1"
> > -	      shift 1
> > -	      ;;
> > -	  -o*)
> > -	      file=3D${1##-o}
> > -	      add_arg "file=3D${file:-$(basename ${file}).aub}"
> > -	      shift
> > -	      ;;
> > -	  --output=3D*)
> > -	      file=3D${1##--output=3D}
> > -	      add_arg "file=3D${file:-$(basename ${file}).aub}"
> > -	      shift
> > -	      ;;
> > -	  -c)
> > -	      build_command "$2"
> > -	      add_arg "command=3D$command"
> > -	      shift 2
> > -	      ;;
> > -	  --command=3D*)
> > -	      build_command "${1##--command=3D}"
> > -	      add_arg "command=3D$command"
> > -	      shift
> > -	      ;;
> > -	  --device=3D*)
> > -	      add_arg "device=3D${1##--device=3D}"
> > -	      shift
> > -	      ;;
> > -	  --help)
> > -	      show_help
> > -	      ;;
> > -	  --)
> > -	      shift
> > -	      break
> > -	      ;;
> > -	  -*)
> > -	      echo "intel_aubdump: invalid option: $1"
> > -	      echo
> > -	      show_help
> > -	      ;;
> > -	  *)
> > -	      break
> > -	      ;;
> > -      esac
> > -done
> > -
> > -[ -z $1 ] && show_help
> > -
> > -[ -z $file ] && [ -z $command ] && add_arg "file=3Dintel.aub"
> > -
> > -prefix=3D@prefix@
> > -exec_prefix=3D@exec_prefix@
> > -libdir=3D@libdir@
> > -
> > -LD_PRELOAD=3D${libdir}/intel_aubdump.so${LD_PPRELOAD:+:${LD_PRELOAD}} \
> > -	  exec -- "$@" 3<<EOF
> > -`echo -e $args`
> > -EOF
> > diff --git a/tools/meson.build b/tools/meson.build
> > index 74822a33..cf3f37b2 100644
> > --- a/tools/meson.build
> > +++ b/tools/meson.build
> > @@ -90,12 +90,6 @@ install_subdir('registers', install_dir : datadir,
> >  		 'Makefile', 'Makefile.in', 'Makefile.am',
> >  	       ])
> >  =

> > -shared_library('intel_aubdump', 'aubdump.c',
> > -	       dependencies : [ lib_igt_chipset, dlsym ],
> > -	       name_prefix : '',
> > -	       install : true,
> > -	       soversion : '0')
> > -
> >  executable('intel_gpu_top', 'intel_gpu_top.c',
> >  	   install : true,
> >  	   install_rpath : bindir_rpathdir,
> > @@ -106,11 +100,4 @@ executable('amd_hdmi_compliance', 'amd_hdmi_compli=
ance.c',
> >  	   install_rpath : bindir_rpathdir,
> >  	   install : true)
> >  =

> > -conf_data =3D configuration_data()
> > -conf_data.set('prefix', prefix)
> > -conf_data.set('exec_prefix', '${prefix}')
> > -conf_data.set('libdir', join_paths('${prefix}', libdir))
> > -configure_file(input : 'intel_aubdump.in', output : 'intel_aubdump',
> > -               configuration : conf_data, install_dir : bindir)
> > -
> >  subdir('null_state_gen')
> > -- =

> > 2.24.1
> > =

> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
