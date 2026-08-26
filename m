Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D01C5DF97
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 10:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C551A10E990;
	Wed, 26 Aug 2026 10:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+jE0oOn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEC810E20E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 10:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787741133; x=1819277133;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oS3QU7xKSI4O1KLZ4rFF6eu1mZD2d62WT8+GUbPWJJM=;
 b=j+jE0oOngfENB/A9FBhG8eAA0QYeiLWdV9nNdytvxDBEY5GXofAjik3L
 UoyM8NMSgmBX0UohwZHUfZkXWN1HOZ17mZvgaEX0doto/+R8Z20YyVn09
 K2HdiZ/qY6wZ8gr44cbtegUhEu4UsU229Pcj1d22nX7FRW400MiZnDLmq
 e7qgYfkmLJiJG1vmwkskV5sOYDZjjlx0Mx5kxRly1tnIEYhpDGJSo2tgo
 q6rfC8W7G77P2EkN4iC3YugjVg2Umgt84LVv/AqkJ2f0ijAtpYLg2F+1V
 ObtMWyU6cAgjjWwPJnpdBSqqYCR9Xw2XaQ7z9rFiYatHNQNRQO+J8dlmc w==;
X-CSE-ConnectionGUID: UV2Dv+8GSsyt2zOPzY3c5A==
X-CSE-MsgGUID: whikXsipT7ixv5m8MlVaDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="111003165"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="111003165"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 03:45:32 -0700
X-CSE-ConnectionGUID: +kTdof+DSE2PsMuU7Eyf9A==
X-CSE-MsgGUID: 1JNDvQWVQS2G7SGekLaMpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="266967081"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 03:45:30 -0700
Date: Wed, 26 Aug 2026 12:45:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org, simona@ffwll.ch, jesse.zhang@amd.com,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 sebastian.brzezinka@intel.com
Subject: Re: [PATCH v5 1/2] tests/intel: Add gem_change_handle_race test suite
Message-ID: <20260826104510.niqbkwkf43lhteaq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 simona@ffwll.ch, jesse.zhang@amd.com, christian.koenig@amd.com,
 alexander.deucher@amd.com, sebastian.brzezinka@intel.com
References: <20260806021232.200317-1-vitaly.prosyak@amd.com>
 <20260806021232.200317-2-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260806021232.200317-2-vitaly.prosyak@amd.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Vitaly,
On 2026-08-05 at 22:12:10 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>=20

this is not a full review, for that I asked Sebastian.

> This test suite validates concurrent operation handling in GEM handle
> management through the proposed DRM_IOCTL_GEM_CHANGE_HANDLE ioctl.
>=20
> The test is GPU-agnostic and works with both Intel i915 and AMD amdgpu
> drivers, focusing on proper locking and handle lifecycle management during
> concurrent GEM operations.
>=20
> Test coverage (7 race condition subtests):
>  - race-change-vs-close: CHANGE_HANDLE races against GEM_CLOSE
>  - race-change-vs-change: Two CHANGE_HANDLE ops race on same handle
>  - race-change-vs-prime: CHANGE_HANDLE races against PRIME_HANDLE_TO_FD
>  - race-aggressive-change-vs-close: High-iteration close vs change
>  - race-exploit-single-thread: Sequential swap+close pattern
>  - race-exploit-random-handles: Random handle stress test
>  - race-close-before-lock: Close-before-lock scenario with CPU pinning

Please only add documentation to tests actually added in this
first patch, so all your changes compile patch after patch,
for example with:

git rebase origin -x ./compile.sh

Now there is an error:

[2269/2277] Generating docs/testplan/i915_tests.rst with a custom command
FAILED: docs/testplan/i915_tests.rst
=2E/scripts/igt_doc.py --config ./tests/intel/i915_test_config.json --rest =
docs/testplan/i915_tests.rst --check-testlist --igt-build-path ./build
ERROR: Unneeded documentation for igt@gem_change_handle_race@edge-new-handl=
e-zero
ERROR: Unneeded documentation for igt@gem_change_handle_race@functional-ren=
ame-verification
ERROR: Unneeded documentation for igt@gem_change_handle_race@invalid-handle=
-nonexistent
ERROR: Unneeded documentation for igt@gem_change_handle_race@invalid-new-ha=
ndle-exceeds-int-max
ERROR: Unneeded documentation for igt@gem_change_handle_race@noop-same-hand=
le


>=20
> The test uses i915/gem.h infrastructure while remaining vendor-agnostic
> via DRM core, following IGT convention of placing all gem_* tests in
> tests/intel/ directory.

There is also a problem with cross-compilation on arm64:

[869/1810] Compiling C object tests/gem_change_handle_race.p/intel_gem_chan=
ge_handle_race.c.o
FAILED: tests/gem_change_handle_race.p/intel_gem_change_handle_race.c.o
/usr/bin/aarch64-linux-gnu-gcc -Itests/gem_change_handle_race.p -Itests -I.=
=2E/tests -I../include -I../include/drm-uapi -I../include/drm-uapi-experime=
ntal -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I.=
=2E -I../lib/vendor -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib=
/aarch64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/=
uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm=
 -I/usr/include/aarch64-linux-gnu -I/usr/include/libdrm/nouveau -I/usr/incl=
ude/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -W=
all -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config=
=2Eh -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statemen=
t -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declaratio=
ns -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnes=
ted-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshad=
ow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-u=
ninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-addres=
s-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter=
 -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimpl=
icit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-=
cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpo=
inter-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3D=
trigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -=
D_LARGEFILE64_SOURCE=3D1 -pthread -MD -MQ tests/gem_change_handle_race.p/in=
tel_gem_change_handle_race.c.o -MF tests/gem_change_handle_race.p/intel_gem=
_change_handle_race.c.o.d -o tests/gem_change_handle_race.p/intel_gem_chang=
e_handle_race.c.o -c ../tests/intel/gem_change_handle_race.c
{standard input}: Assembler messages:
{standard input}:918: Error: unknown mnemonic `pause' -- `pause'
{standard input}:2722: Error: unknown mnemonic `pause' -- `pause'
ninja: build stopped: subcommand failed.

If you want to reproduce this, I once sent a script for this on
mailing list, please ping me and I will update and resend it.


>=20
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Add here:
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

Regards,
Kamil

> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
> v5 changes (addressing Kamil Konieczny's review feedback):
>  - Replaced all non-ASCII characters (UTF-8 box-drawing, arrows, emoji)
>    with plain ASCII equivalents throughout
>  - Removed Change-Id from commit message
>  - Moved version changelog to after --- (not in git log)
>=20
> v4 changes (addressing Kamil Konieczny's review feedback):
>  - Removed running_under_gdb() function entirely
>  - Fixed all double newlines throughout
>  - Removed #define _GNU_SOURCE (already defined by meson build system)
>  - Added header comment explaining tests/intel/ location
>  - Fixed check_kernel_traces() brace style
>  - Enhanced pin_to_cpu() with error handling and ARM compatibility
>  - Fixed variable declarations (C89 style)
>  - Removed unnecessary braces in if statements
>  - Fixed static variable initialization
>  - Added meson.build entry
>=20
> v3 changes (addressing Kamil Konieczny's review feedback):
>  - Removed reference to external documentation
>  - Sanitized test descriptions and comments
>  - Renamed 'race-darknavy-cve' to 'race-close-before-lock'
>  - Renamed internal functions and variables for clarity
>=20
> v2 changes (addressing Kamil Konieczny's review feedback):
>  - Added header comment explaining why test is in tests/intel/ directory
>  - ARM compatibility fixes (graceful CPU pinning failure handling)
>  - Made pin_to_cpu() handle failures gracefully with igt_debug()
>=20
> v1:
>  - Initial submission with 7 race condition subtests
>=20
>  tests/intel/gem_change_handle_race.c | 1798 ++++++++++++++++++++++++++
>  tests/meson.build                    |    1 +
>  2 files changed, 1799 insertions(+)
>  create mode 100644 tests/intel/gem_change_handle_race.c
>=20
> diff --git a/tests/intel/gem_change_handle_race.c b/tests/intel/gem_chang=
e_handle_race.c
> new file mode 100644
> index 000000000..f4b00c65e
> --- /dev/null
> +++ b/tests/intel/gem_change_handle_race.c
> @@ -0,0 +1,1798 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + * Copyright 2026 Intel Corporation
> + *
> + * GPU-agnostic race condition tests for GEM_CHANGE_HANDLE ioctl
> + *
> + * NOTE: This test is located in tests/intel/ directory because:
> + * 1. All gem_* tests are traditionally placed in tests/intel/ regardless
> + *    of GPU vendor, following IGT convention for GEM-related tests
> + * 2. The test uses i915/gem.h and i915/gem_create.h for GEM object crea=
tion
> + *    on Intel platforms, though it works vendor-agnostically via DRM co=
re
> + * 3. Some subtest designs (noop-same-handle, invalid-*, edge-*, functio=
nal-*)
> + *    were proposed by Simona Vetter (Intel), hence Intel copyright head=
er
> + *
> + * ARM compatibility: This test uses pthread_setaffinity_np() which requ=
ires
> + * _GNU_SOURCE and may behave differently on ARM due to different CPU to=
pology.
> + * The test gracefully handles CPU pinning failures and continues execut=
ion.
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <pthread.h>
> +#include <sched.h>
> +#include <semaphore.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <sys/stat.h>
> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "i915/gem.h"
> +#include "i915/gem_create.h"
> +
> +/* AMDGPU includes (if available) */
> +#if __has_include("igt_amd.h")
> +#include "lib/amdgpu/amd_memory.h"
> +#include "igt_amd.h"
> +#define HAS_AMDGPU 1
> +#else
> +#define HAS_AMDGPU 0
> +#endif
> +
> +/* Helper to check for concurrent access traces in kernel log */
> +static int check_kernel_traces(void)
> +{
> +	FILE *fp;
> +	char line[1024];
> +	int trace_count =3D 0;
> +
> +	/*
> +	 * concurrent access manifests in kernel logs as:
> +	 * - KASAN reports (if CONFIG_KASAN=3Dy)
> +	 * - Kernel oops/warnings in drm_gem_object_release_handle
> +	 * - Stack traces with drm_gem_object_handle_put_unlocked
> +	 *
> +	 * We grep for function names that appear in the concurrent access path.
> +	 */
> +	fp =3D popen("dmesg | grep -c -E '(KASAN.*(drm_gem|change_handle)|"
> +		   "drm_gem_object_release_handle|"
> +		   "drm_gem_object_handle_put_unlocked|"
> +		   "drm_gem_change_handle.*RIP)' 2>/dev/null", "r");
> +	if (fp =3D=3D NULL)
> +		return 0;
> +
> +	if (fgets(line, sizeof(line), fp) !=3D NULL)
> +		trace_count =3D atoi(line);
> +	pclose(fp);
> +
> +	return trace_count;
> +}
> +
> +static void pin_to_cpu(int cpu)
> +{
> +	cpu_set_t cpuset;
> +	int ret;
> +
> +	CPU_ZERO(&cpuset);
> +	CPU_SET(cpu, &cpuset);
> +	ret =3D pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpus=
et);
> +=09
> +	/*
> +	 * ARM compatibility: pthread_setaffinity_np() may fail on ARM systems
> +	 * due to different CPU topology or when running in containers/VMs.
> +	 * We don't fail the test - CPU pinning is a best-effort optimization
> +	 * to increase race condition probability, not a hard requirement.
> +	 */
> +	if (ret !=3D 0)
> +		igt_debug("Failed to pin to CPU %d (errno=3D%d), continuing anyway\n",
> +			  cpu, ret);
> +}
> +/* Define DRM_IOCTL_GEM_CHANGE_HANDLE if not available in kernel headers=
 */
> +#ifndef DRM_IOCTL_GEM_CHANGE_HANDLE
> +struct drm_gem_change_handle {
> +	__u32 handle;
> +	__u32 new_handle;
> +};
> +
> +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_cha=
nge_handle)
> +#endif
> +
> +/**
> + * TEST: gem change handle race
> + * Description: Multi-threaded race condition tests for GEM_CHANGE_HANDLE
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: GEM handles
> + * Functionality: gem change handle
> + * Feature: gem
> + * Run type: FULL
> + *
> + * SUBTEST: race-change-vs-close
> + * Description: Test CHANGE_HANDLE racing with GEM_CLOSE (concurrent acc=
ess issues detection)
> + *
> + * SUBTEST: race-change-vs-change
> + * Description: Test concurrent CHANGE_HANDLE operations (handle corrupt=
ion detection)
> + *
> + * SUBTEST: race-change-vs-prime
> + * Description: Test CHANGE_HANDLE racing with Prime ioctls (stale refer=
ence detection)
> + *
> + * SUBTEST: race-close-before-lock
> + * Description: GEM_CLOSE before CHANGE_HANDLE table_lock (concurrent ac=
cess)
> + *
> + * SUBTEST: race-aggressive-change-vs-close
> + * Description: Aggressive concurrent access race with CPU pinning and K=
ASAN detection
> + *
> + * SUBTEST: race-exploit-single-thread
> + * Description: Single BO swapped H to H+1 with periodic FD close for co=
ncurrent access
> + *
> + * SUBTEST: race-exploit-random-handles
> + * Description: Random handle probing to find free slots and trigger con=
current access
> + *
> + * SUBTEST: noop-same-handle
> + * Description: Edge case where handle equals new_handle should succeed =
as noop
> + *
> + * SUBTEST: invalid-new-handle-exceeds-int-max
> + * Description: new_handle exceeding INT_MAX should fail with EINVAL
> + *
> + * SUBTEST: invalid-handle-nonexistent
> + * Description: Non-existent handle should fail with ENOENT
> + *
> + * SUBTEST: edge-new-handle-zero
> + * Description: new_handle of zero exercises the unhandled zero-handle c=
ase
> + *
> + * SUBTEST: functional-rename-verification
> + * Description: After rename old handle returns EINVAL on close and new =
handle closes successfully
> + */
> +
> +IGT_TEST_DESCRIPTION("Multi-threaded race condition tests for GEM_CHANGE=
_HANDLE");
> +
> +#define BO_SIZE (16 * 1024)
> +#define RACE_DURATION_SEC 1
> +
> +/* Verbose logging - set to false to reduce output */
> +static bool verbose_logging;
> +
> +/* Driver type detection */
> +enum gpu_driver {
> +	DRIVER_TYPE_UNKNOWN =3D 0,
> +	DRIVER_TYPE_I915,
> +	DRIVER_TYPE_AMDGPU,
> +};
> +
> +/* GPU context structure */
> +struct gpu_ctx {
> +	int fd;
> +	enum gpu_driver driver;
> +#if HAS_AMDGPU
> +	amdgpu_device_handle amdgpu_device;
> +#endif
> +};
> +
> +/* Thread synchronization */
> +struct thread_data {
> +	struct gpu_ctx *ctx;
> +	uint32_t handle;
> +	uint32_t alt_handle;
> +	uint32_t *race_detected;
> +	int *unexpected_errno;  /* Track what errno caused the race */
> +	bool running;
> +	pthread_barrier_t *barrier;
> +};
> +
> +struct aggressive_data {
> +	struct gpu_ctx *ctx;
> +	volatile int go;
> +	uint32_t handle;
> +	uint32_t new_handle;
> +};
> +
> +struct single_thread_data {
> +	struct gpu_ctx *ctx;
> +	int *main_fd;
> +	pthread_mutex_t *fd_lock;
> +	volatile bool running;
> +	volatile bool hammer_ready;  /* Signal when BO created */
> +	volatile uint32_t swap_count;
> +	volatile uint32_t close_count;
> +	uint32_t *race_hits;
> +	pthread_barrier_t *barrier;
> +};
> +
> +struct random_handle_data {
> +	struct gpu_ctx *ctx;
> +	int *main_fd;
> +	pthread_mutex_t *fd_lock;
> +	volatile bool running;
> +	volatile bool hammer_ready;
> +	volatile uint32_t swap_count;
> +	volatile uint32_t close_count;
> +	volatile uint32_t attempt_count;  /* Track total attempts */
> +	uint32_t *race_hits;
> +	pthread_barrier_t *barrier;
> +};
> +
> +struct race_shared {
> +	int fd;
> +	uint32_t old_handle;
> +	uint32_t new_handle;
> +	struct drm_gem_change_handle ch;
> +	struct drm_gem_close cl;
> +	sem_t change_sem;
> +	sem_t close_sem;
> +	int change_success;
> +	int close_success;
> +};
> +
> +static enum gpu_driver detect_driver(int fd)
> +{
> +	/* Check AMDGPU first (primary target) */
> +	if (is_amdgpu_device(fd))
> +		return DRIVER_TYPE_AMDGPU;
> +	if (is_i915_device(fd))
> +		return DRIVER_TYPE_I915;
> +	return DRIVER_TYPE_UNKNOWN;
> +}
> +
> +static const char *gpu_name(enum gpu_driver driver)
> +{
> +	switch (driver) {
> +	case DRIVER_TYPE_I915: return "Intel i915";
> +	case DRIVER_TYPE_AMDGPU: return "AMD GPU";
> +	default: return "Unknown";
> +	}
> +}
> +
> +static uint32_t gem_create_bo(struct gpu_ctx *ctx, uint64_t size)
> +{
> +	uint32_t handle =3D 0;
> +
> +	switch (ctx->driver) {
> +	case DRIVER_TYPE_I915: {
> +		struct drm_i915_gem_create create =3D { .size =3D size };
> +
> +		do_ioctl(ctx->fd, DRM_IOCTL_I915_GEM_CREATE, &create);
> +		handle =3D create.handle;
> +		break;
> +	}
> +	case DRIVER_TYPE_AMDGPU:
> +#if HAS_AMDGPU
> +		handle =3D igt_amd_create_bo(ctx->fd, size);
> +#else
> +		igt_require_f(0, "AMDGPU support not compiled in\n");
> +#endif
> +		break;
> +	default:
> +		igt_assert_f(0, "Unsupported driver\n");
> +	}
> +
> +	igt_assert(handle !=3D 0);
> +	return handle;
> +}
> +
> +static int gem_close_bo(struct gpu_ctx *ctx, uint32_t handle)
> +{
> +	struct drm_gem_close close_args =3D { .handle =3D handle };
> +
> +	return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CLOSE, &close_args);
> +}
> +
> +static int gem_change_handle(struct gpu_ctx *ctx, uint32_t old_handle, u=
int32_t new_handle)
> +{
> +	struct drm_gem_change_handle args =3D {
> +		.handle =3D old_handle,
> +		.new_handle =3D new_handle,
> +	};
> +	return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CHANGE_HANDLE, &args);
> +}
> +
> +/*
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + * RACE CONDITION #1: CHANGE_HANDLE vs GEM_CLOSE
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + *
> + *
> + * Thread A (CHANGE_HANDLE)           Thread B (GEM_CLOSE)
> + * ------------------------           --------------------
> + * 1. Lookup handle 0x100
> + *    -> Find GEM object
> + *                                     2. Lookup handle 0x100
> + *                                        -> Find GEM object
> + *                                     3. Remove from handle table
> + *                                     4. Free GEM object
> + * 5. Change handle 0x100 -> 0x200
> + *    -> Operate on freed memory! !
> + *
> + * Test validates kernel properly locks to prevent concurrent access iss=
ues.
> + */
> +
> +static void *change_handle_thread(void *arg)
> +{
> +	struct thread_data *data =3D arg;
> +	uint32_t handle =3D data->handle;
> +	uint32_t new_handle =3D data->alt_handle;
> +	int ret;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (data->running) {
> +		ret =3D gem_change_handle(data->ctx, handle, new_handle);
> +		if (ret =3D=3D 0) {
> +			/* Successfully changed - try to change back */
> +			ret =3D gem_change_handle(data->ctx, new_handle, handle);
> +			if (ret !=3D 0 && errno !=3D ENOENT && errno !=3D EINVAL && errno !=
=3D EEXIST && errno !=3D ENOSPC) {
> +				/* Unexpected error - potential race */
> +				*data->unexpected_errno =3D errno;
> +				__sync_fetch_and_add(data->race_detected, 1);
> +			}
> +		} else if (errno !=3D ENOENT && errno !=3D EINVAL && errno !=3D EEXIST=
 && errno !=3D ENOSPC) {
> +			/*
> +			 * Expected errors:
> +			 * - ENOENT: handle was closed
> +			 * - EINVAL: invalid handle
> +			 * - EEXIST: target handle already exists (collision detected early)
> +			 * - ENOSPC: target handle occupied (collision detected during idr_al=
loc)
> +			 */
> +			*data->unexpected_errno =3D errno;
> +			__sync_fetch_and_add(data->race_detected, 1);
> +		}
> +		sched_yield();
> +	}
> +
> +	return NULL;
> +}
> +
> +static void *close_recreate_thread(void *arg)
> +{
> +	struct thread_data *data =3D arg;
> +	uint32_t handle;
> +	uint32_t old_handle;
> +	pthread_t tid =3D pthread_self();
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (data->running) {
> +		/* Close the handle */
> +		old_handle =3D data->handle;
> +		if (data->handle) {
> +			gem_close_bo(data->ctx, data->handle);
> +			if (verbose_logging) {
> +				igt_info("[CLOSE-TID:%lu] Closed handle %u\n",
> +					 (unsigned long)tid, old_handle);
> +			}
> +		}
> +
> +		/* Recreate BO with new handle */
> +		handle =3D gem_create_bo(data->ctx, BO_SIZE);
> +		data->handle =3D handle;
> +		if (verbose_logging) {
> +			igt_info("[CLOSE-TID:%lu] Created new BO with handle %u\n",
> +				 (unsigned long)tid, handle);
> +		}
> +
> +		sched_yield();
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * test_race_change_vs_close - Race CHANGE_HANDLE against GEM_CLOSE
> + *
> + *
> + * Spawns two threads:
> + * - Thread A: Continuously changes handle value
> + * - Thread B: Continuously closes and recreates handle
> + *
> + * Validates kernel prevents concurrent access issues through proper loc=
king.
> + */
> +static void test_race_change_vs_close(struct gpu_ctx *ctx)
> +{
> +	pthread_t thread_change, thread_close;
> +	pthread_barrier_t barrier;
> +	struct thread_data data =3D {0};
> +	uint32_t race_detected =3D 0;
> +	int unexpected_errno =3D 0;
> +	uint32_t handle;
> +
> +	igt_info("Testing RACE #1: CHANGE_HANDLE vs CLOSE on %s\n",
> +		 gpu_name(ctx->driver));
> +	igt_info("  Duration: %d seconds\n", RACE_DURATION_SEC);
> +	igt_info("  Goal: Detect concurrent access issues scenarios\n");
> +
> +	handle =3D gem_create_bo(ctx, BO_SIZE);
> +	igt_assert(handle !=3D 0);
> +
> +	data.ctx =3D ctx;
> +	data.handle =3D handle;
> +	data.alt_handle =3D handle + 0x1000;
> +	data.race_detected =3D &race_detected;
> +	data.unexpected_errno =3D &unexpected_errno;
> +	data.running =3D true;
> +
> +	pthread_barrier_init(&barrier, NULL, 2);
> +	data.barrier =3D &barrier;
> +
> +	/* Start both threads simultaneously */
> +	igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_thread=
, &data), 0);
> +	igt_assert_eq(pthread_create(&thread_close, NULL, close_recreate_thread=
, &data), 0);
> +
> +	/* Let them race */
> +	sleep(RACE_DURATION_SEC);
> +
> +	data.running =3D false;
> +	pthread_join(thread_change, NULL);
> +	pthread_join(thread_close, NULL);
> +
> +	pthread_barrier_destroy(&barrier);
> +
> +	/* Clean up final handle if exists */
> +	if (data.handle)
> +		gem_close_bo(ctx, data.handle);
> +
> +	igt_info("  Race test completed. Suspicious conditions: %u\n", race_det=
ected);
> +	if (race_detected > 0) {
> +		igt_info("  ***  RACE DETECTED: Unexpected errno =3D %d (%s)\n",
> +			 unexpected_errno, strerror(unexpected_errno));
> +		igt_info("  This indicates the kernel may not be properly handling con=
current\n");
> +		igt_info("  CHANGE_HANDLE operations. Kernel should serialize these wi=
th\n");
> +		igt_info("  proper locking to prevent corruption and concurrent access=
 issues.\n");
> +	}
> +	igt_assert_f(race_detected =3D=3D 0,
> +		     "Race condition detected! errno=3D%d (%s). "
> +		     "Kernel locking may be insufficient.\n",
> +		     unexpected_errno, strerror(unexpected_errno));
> +}
> +
> +/*
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + * RACE CONDITION #2: CHANGE_HANDLE vs CHANGE_HANDLE
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + *
> + *
> + * "I'd just spawn two threads, that constantly try to change the handle
> + *  between just 2 back and forth, to maximize the amount of conflicts"
> + *
> + * Thread A: change_handle(H, H+1)
> + * Thread B: change_handle(H+1, H)
> + * ... continuously swapping ...
> + *
> + * Tests handle table corruption, reference counting, lost handles.
> + */
> +
> +static void *change_handle_thread_a(void *arg)
> +{
> +	struct thread_data *data =3D arg;
> +	int ret;
> +	pthread_t tid =3D pthread_self();
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (data->running) {
> +		ret =3D gem_change_handle(data->ctx, data->handle, data->alt_handle);
> +		if (verbose_logging) {
> +			if (ret =3D=3D 0) {
> +				igt_info("[THREAD-A-TID:%lu] %u -> %u: SUCCESS\n",
> +					 (unsigned long)tid, data->handle, data->alt_handle);
> +			} else {
> +				igt_info("[THREAD-A-TID:%lu] %u -> %u: FAILED - %s (errno=3D%d)\n",
> +					 (unsigned long)tid, data->handle, data->alt_handle,
> +					 strerror(errno), errno);
> +			}
> +		}
> +
> +		if (ret !=3D 0 && errno !=3D ENOENT && errno !=3D EINVAL && errno !=3D=
 EEXIST && errno !=3D ENOSPC) {
> +			/* Unexpected error - potential race */
> +			igt_info("[THREAD-A-TID:%lu] *** UNEXPECTED ERROR: %s (errno=3D%d) **=
*\n",
> +				 (unsigned long)tid, strerror(errno), errno);
> +			*data->unexpected_errno =3D errno;
> +			__sync_fetch_and_add(data->race_detected, 1);
> +		}
> +		sched_yield();
> +	}
> +
> +	return NULL;
> +}
> +
> +static void *change_handle_thread_b(void *arg)
> +{
> +	struct thread_data *data =3D arg;
> +	int ret;
> +	pthread_t tid =3D pthread_self();
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (data->running) {
> +		ret =3D gem_change_handle(data->ctx, data->alt_handle, data->handle);
> +		if (verbose_logging) {
> +			if (ret =3D=3D 0) {
> +				igt_info("[THREAD-B-TID:%lu] %u -> %u: SUCCESS\n",
> +					 (unsigned long)tid, data->alt_handle, data->handle);
> +			} else {
> +				igt_info("[THREAD-B-TID:%lu] %u -> %u: FAILED - %s (errno=3D%d)\n",
> +					 (unsigned long)tid, data->alt_handle, data->handle,
> +					 strerror(errno), errno);
> +			}
> +		}
> +
> +		if (ret !=3D 0 && errno !=3D ENOENT && errno !=3D EINVAL && errno !=3D=
 EEXIST && errno !=3D ENOSPC) {
> +			/* Unexpected error */
> +			igt_info("[THREAD-B-TID:%lu] *** UNEXPECTED ERROR: %s (errno=3D%d) **=
*\n",
> +				 (unsigned long)tid, strerror(errno), errno);
> +			*data->unexpected_errno =3D errno;
> +			__sync_fetch_and_add(data->race_detected, 1);
> +		}
> +		sched_yield();
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * test_race_change_vs_change - Concurrent CHANGE_HANDLE operations
> + *
> + *
> + * Implements email thread test strategy:
> + * "spawn two threads that constantly try to change the handle between
> + *  just 2 back and forth, to maximize the amount of conflicts"
> + *
> + * Thread A: change(H, H+1)
> + * Thread B: change(H+1, H)
> + *
> + * Validates kernel prevents handle table corruption.
> + */
> +static void test_race_change_vs_change(struct gpu_ctx *ctx)
> +{
> +	pthread_t thread_a, thread_b;
> +	pthread_barrier_t barrier;
> +	struct thread_data data =3D {0};
> +	uint32_t race_detected =3D 0;
> +	int unexpected_errno =3D 0;
> +	uint32_t handle;
> +
> +	igt_info("Testing RACE #2: CHANGE_HANDLE vs CHANGE_HANDLE on %s\n",
> +		 gpu_name(ctx->driver));
> +	igt_info("  Duration: %d seconds\n", RACE_DURATION_SEC);
> +	igt_info("  Strategy: Two threads swapping handle H <-> H+1\n");
> +	igt_info("  Goal: Detect handle corruption and lost handles\n");
> +
> +	handle =3D gem_create_bo(ctx, BO_SIZE);
> +	igt_assert(handle !=3D 0);
> +
> +	data.ctx =3D ctx;
> +	data.handle =3D handle;
> +	data.alt_handle =3D handle + 1;
> +	data.race_detected =3D &race_detected;
> +	data.unexpected_errno =3D &unexpected_errno;
> +	data.running =3D true;
> +
> +	pthread_barrier_init(&barrier, NULL, 2);
> +	data.barrier =3D &barrier;
> +
> +	/* Start both threads simultaneously */
> +	igt_assert_eq(pthread_create(&thread_a, NULL, change_handle_thread_a, &=
data), 0);
> +	igt_assert_eq(pthread_create(&thread_b, NULL, change_handle_thread_b, &=
data), 0);
> +
> +	/* Let them race */
> +	sleep(RACE_DURATION_SEC);
> +
> +	data.running =3D false;
> +	pthread_join(thread_a, NULL);
> +	pthread_join(thread_b, NULL);
> +
> +	pthread_barrier_destroy(&barrier);
> +
> +	/* Try to close both possible handles */
> +	gem_close_bo(ctx, handle);
> +	gem_close_bo(ctx, handle + 1);
> +
> +	igt_info("  Race test completed. Suspicious conditions: %u\n", race_det=
ected);
> +	if (race_detected > 0) {
> +		igt_info("  ***  RACE DETECTED: Unexpected errno =3D %d (%s)\n",
> +			 unexpected_errno, strerror(unexpected_errno));
> +		igt_info("  This indicates the kernel may not be properly handling con=
current\n");
> +		igt_info("  CHANGE_HANDLE operations. Kernel should serialize these wi=
th\n");
> +		igt_info("  proper locking to prevent corruption and concurrent access=
 issues.\n");
> +	}
> +	igt_assert_f(race_detected =3D=3D 0,
> +		     "Race condition detected! errno=3D%d (%s). "
> +		     "Kernel locking may be insufficient.\n",
> +		     unexpected_errno, strerror(unexpected_errno));
> +}
> +
> +/*
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + * RACE CONDITION #3: CHANGE_HANDLE vs Prime Ioctls
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + *
> + *
> + * "maybe: 1. create bo 2. handle2fd, check that fd2handle gives us
> + *  the same handle back 3. change_handle 4. check that fd2handle
> + *  gives us the new handle back"
> + *
> + * Tests stale references, reference count corruption.
> + */
> +
> +/**
> + * change_handle_prime_thread - Continuously swap handle for prime test
> + *
> + * Like change_handle_thread_a/b but swaps back and forth between
> + * the two handle values to continuously exercise the race.
> + */
> +static void *change_handle_prime_thread(void *arg)
> +{
> +	struct thread_data *data =3D arg;
> +	uint32_t handle_a =3D data->handle;
> +	uint32_t handle_b =3D data->alt_handle;
> +	bool swap_direction =3D true;
> +	int ret;
> +	pthread_t tid =3D pthread_self();
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (data->running) {
> +		if (swap_direction) {
> +			/* Try to change from handle_a to handle_b */
> +			ret =3D gem_change_handle(data->ctx, handle_a, handle_b);
> +			if (verbose_logging) {
> +				if (ret =3D=3D 0) {
> +					igt_info("[PRIME-CHANGE-TID:%lu] %u -> %u: SUCCESS\n",
> +						 (unsigned long)tid, handle_a, handle_b);
> +				} else {
> +					igt_info("[PRIME-CHANGE-TID:%lu] %u -> %u: FAILED - %s (errno=3D%d)=
\n",
> +						 (unsigned long)tid, handle_a, handle_b, strerror(errno), errno);
> +				}
> +			}
> +		} else {
> +			/* Try to change from handle_b to handle_a */
> +			ret =3D gem_change_handle(data->ctx, handle_b, handle_a);
> +			if (verbose_logging) {
> +				if (ret =3D=3D 0) {
> +					igt_info("[PRIME-CHANGE-TID:%lu] %u -> %u: SUCCESS\n",
> +						 (unsigned long)tid, handle_b, handle_a);
> +				} else {
> +					igt_info("[PRIME-CHANGE-TID:%lu] %u -> %u: FAILED - %s (errno=3D%d)=
\n",
> +						 (unsigned long)tid, handle_b, handle_a, strerror(errno), errno);
> +				}
> +			}
> +		}
> +
> +		/* Flip direction for next iteration to keep swapping */
> +		if (ret =3D=3D 0)
> +			swap_direction =3D !swap_direction;
> +		/* All errors are acceptable during race - kernel will serialize */
> +
> +		sched_yield();
> +	}
> +
> +	return NULL;
> +}
> +
> +static void *prime_thread(void *arg)
> +{
> +	struct thread_data *data =3D arg;
> +	struct drm_prime_handle prime_args;
> +	uint32_t retrieved_handle;
> +	uint32_t handle_a =3D data->handle;
> +	uint32_t handle_b =3D data->alt_handle;
> +	int dmabuf_fd;
> +	int ret;
> +	pthread_t tid =3D pthread_self();
> +	uint32_t tried_handle;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (data->running) {
> +		/*
> +		 * Try handle_a first. If it fails (handle was changed),
> +		 * try handle_b. One of them should work.
> +		 */
> +		prime_args.handle =3D handle_a;
> +		prime_args.flags =3D DRM_CLOEXEC | DRM_RDWR;
> +		tried_handle =3D handle_a;
> +		ret =3D igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime_=
args);
> +		if (verbose_logging) {
> +			if (ret =3D=3D 0) {
> +				igt_info("[PRIME-TID:%lu] HANDLE_TO_FD(handle=3D%u): SUCCESS (fd=3D%=
d)\n",
> +					 (unsigned long)tid, tried_handle, prime_args.fd);
> +			} else {
> +				igt_info("[PRIME-TID:%lu] HANDLE_TO_FD(handle=3D%u): FAILED - %s (er=
rno=3D%d)\n",
> +					 (unsigned long)tid, tried_handle, strerror(errno), errno);
> +			}
> +		}
> +		if (ret !=3D 0) {
> +			/* handle_a failed, try handle_b */
> +			prime_args.handle =3D handle_b;
> +			tried_handle =3D handle_b;
> +			ret =3D igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime=
_args);
> +			if (verbose_logging) {
> +				if (ret =3D=3D 0) {
> +					igt_info("[PRIME-TID:%lu] HANDLE_TO_FD(handle=3D%u): SUCCESS (fd=3D=
%d)\n",
> +						 (unsigned long)tid, tried_handle, prime_args.fd);
> +				} else {
> +					igt_info("[PRIME-TID:%lu] HANDLE_TO_FD(handle=3D%u): FAILED - %s (e=
rrno=3D%d)\n",
> +						 (unsigned long)tid, tried_handle, strerror(errno), errno);
> +				}
> +			}
> +		}
> +
> +		if (ret =3D=3D 0) {
> +			dmabuf_fd =3D prime_args.fd;
> +
> +			/* Convert back to handle */
> +			prime_args.fd =3D dmabuf_fd;
> +			prime_args.flags =3D 0;
> +			ret =3D igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &prime=
_args);
> +			if (verbose_logging) {
> +				if (ret =3D=3D 0) {
> +					igt_info("[PRIME-TID:%lu] FD_TO_HANDLE(fd=3D%d): SUCCESS (handle=3D=
%u)\n",
> +						 (unsigned long)tid, dmabuf_fd, prime_args.handle);
> +				} else {
> +					igt_info("[PRIME-TID:%lu] FD_TO_HANDLE(fd=3D%d): FAILED - %s (errno=
=3D%d)\n",
> +						 (unsigned long)tid, dmabuf_fd, strerror(errno), errno);
> +				}
> +			}
> +			if (ret =3D=3D 0) {
> +				retrieved_handle =3D prime_args.handle;
> +
> +				/*
> +				 * Handle should be one of our two known handles.
> +				 * If it's neither, Prime reference table is corrupted.
> +				 */
> +				if (retrieved_handle !=3D handle_a &&
> +				    retrieved_handle !=3D handle_b) {
> +					/* Handle corruption detected */
> +					__sync_fetch_and_add(data->race_detected, 1);
> +				}
> +
> +				/* Close retrieved handle */
> +				gem_close_bo(data->ctx, retrieved_handle);
> +			}
> +			close(dmabuf_fd);
> +		}
> +		/* All errors acceptable during race */
> +
> +		usleep(100); /* Prime operations are slower */
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * test_race_change_vs_prime - Race CHANGE_HANDLE against Prime ioctls
> + *
> + *
> + * Implements email thread test:
> + * "create bo, handle2fd, check fd2handle returns same, change_handle,
> + *  check fd2handle returns new handle"
> + *
> + * Thread A: Continuously changes handle
> + * Thread B: Continuously does fd2handle and validates result
> + *
> + * Validates kernel updates Prime references correctly.
> + */
> +static void test_race_change_vs_prime(struct gpu_ctx *ctx)
> +{
> +	pthread_t thread_change, thread_prime;
> +	pthread_barrier_t barrier;
> +	struct thread_data data =3D {0};
> +	uint32_t race_detected =3D 0;
> +	int unexpected_errno =3D 0;
> +	uint32_t handle;
> +	struct drm_prime_handle prime_args;
> +	int dmabuf_fd, ret;
> +	uint32_t retrieved_handle;
> +
> +	igt_info("Testing RACE #3: CHANGE_HANDLE vs Prime on %s\n",
> +		 gpu_name(ctx->driver));
> +	igt_info("  Duration: %d seconds\n", RACE_DURATION_SEC);
> +	igt_info("  Goal: Detect stale references and refcount corruption\n");
> +
> +	handle =3D gem_create_bo(ctx, BO_SIZE);
> +	igt_assert(handle !=3D 0);
> +
> +	/* Initial prime export - verify it works */
> +	prime_args.handle =3D handle;
> +	prime_args.flags =3D DRM_CLOEXEC | DRM_RDWR;
> +	ret =3D igt_ioctl(ctx->fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime_args);
> +	igt_assert_eq(ret, 0);
> +	dmabuf_fd =3D prime_args.fd;
> +
> +	prime_args.fd =3D dmabuf_fd;
> +	prime_args.flags =3D 0;
> +	ret =3D igt_ioctl(ctx->fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &prime_args);
> +	igt_assert_eq(ret, 0);
> +	retrieved_handle =3D prime_args.handle;
> +	igt_assert_eq(retrieved_handle, handle);
> +
> +	gem_close_bo(ctx, retrieved_handle);
> +	close(dmabuf_fd);
> +
> +	/* Now test concurrent change + prime operations */
> +	data.ctx =3D ctx;
> +	data.handle =3D handle;
> +	data.alt_handle =3D handle + 1;
> +	data.race_detected =3D &race_detected;
> +	data.unexpected_errno =3D &unexpected_errno;
> +	data.running =3D true;
> +
> +	pthread_barrier_init(&barrier, NULL, 2);
> +	data.barrier =3D &barrier;
> +
> +	igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_prime_=
thread, &data), 0);
> +	igt_assert_eq(pthread_create(&thread_prime, NULL, prime_thread, &data),=
 0);
> +
> +	/* Let them race */
> +	sleep(RACE_DURATION_SEC);
> +
> +	data.running =3D false;
> +	pthread_join(thread_change, NULL);
> +	pthread_join(thread_prime, NULL);
> +
> +	pthread_barrier_destroy(&barrier);
> +
> +	/* Cleanup */
> +	gem_close_bo(ctx, handle);
> +	gem_close_bo(ctx, handle + 1);
> +
> +	igt_info("  Race test completed. Handle corruption: %u\n", race_detecte=
d);
> +	igt_assert_eq(race_detected, 0);
> +}
> +
> +/*
> + * Aggressive race test - follows proven concurrent access reproducer pa=
ttern.
> + * Thread A: CHANGE_HANDLE(h->nh), Thread B: CLOSE(h)
> + * CPU pinning for maximum race potential.
> + */
> +
> +static void *aggressive_change_thread(void *arg)
> +{
> +	struct aggressive_data *data =3D arg;
> +	pthread_t tid =3D pthread_self();
> +	int ret;
> +
> +	pin_to_cpu(0);
> +
> +	while (!data->go)
> +		__asm__ volatile("pause" ::: "memory");
> +
> +	ret =3D gem_change_handle(data->ctx, data->handle, data->new_handle);
> +
> +	if (verbose_logging) {
> +		if (ret =3D=3D 0) {
> +			igt_info("[AGG-CHANGE-TID:%lu] %u -> %u: SUCCESS\n",
> +				 (unsigned long)tid, data->handle, data->new_handle);
> +		} else {
> +			igt_info("[AGG-CHANGE-TID:%lu] %u -> %u: FAILED - %s (errno=3D%d)\n",
> +				 (unsigned long)tid, data->handle, data->new_handle,
> +				 strerror(errno), errno);
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static void *aggressive_close_thread(void *arg)
> +{
> +	struct aggressive_data *data =3D arg;
> +	pthread_t tid =3D pthread_self();
> +
> +	pin_to_cpu(1);
> +
> +	while (!data->go)
> +		__asm__ volatile("pause" ::: "memory");
> +
> +	gem_close_bo(data->ctx, data->handle);
> +
> +	if (verbose_logging) {
> +		igt_info("[AGG-CLOSE-TID:%lu] Closed handle %u\n",
> +			 (unsigned long)tid, data->handle);
> +	}
> +
> +	return NULL;
> +}
> +
> +static void test_race_aggressive(struct gpu_ctx *ctx)
> +{
> +	struct aggressive_data data =3D {};
> +	pthread_t thread_change, thread_close;
> +	int iterations =3D 5000;
> +	int race_wins =3D 0;
> +	int kasan_before, kasan_after;
> +	int i;
> +
> +	igt_info("Testing AGGRESSIVE RACE: CHANGE_HANDLE vs CLOSE on %s\n",
> +		 gpu_name(ctx->driver));
> +	igt_info("  Pattern: concurrent access reproducer from DRM mailing list=
\n");
> +	igt_info("  Iterations: %d\n", iterations);
> +	igt_info("  CPU pinning: Change->CPU0, Close->CPU1\n");
> +	igt_info("\n");
> +	igt_info("  Expected results:\n");
> +	igt_info("    Unpatched kernel: Race wins ~50-60%%, KASAN traces in dme=
sg\n");
> +	igt_info("    Patched kernel:   0 race wins (mutex serializes ops)\n");
> +	igt_info("\n");
> +	igt_info("  Note: KASAN traces appear in kernel log (dmesg), not test o=
utput\n");
> +	igt_info("        Kernel must have CONFIG_KASAN=3Dy to see detailed con=
current access reports\n");
> +	igt_info("\n");
> +
> +	data.ctx =3D ctx;
> +
> +	/* Clear/mark kernel log before test */
> +	kasan_before =3D check_kernel_traces();
> +
> +	for (i =3D 0; i < iterations; i++) {
> +		uint32_t h =3D gem_create_bo(ctx, BO_SIZE);
> +
> +		data.handle =3D h;
> +		data.new_handle =3D 0x4000 + (i & 0x3FFF);
> +		data.go =3D 0;
> +
> +		__sync_synchronize();
> +
> +		pthread_create(&thread_change, NULL, aggressive_change_thread, &data);
> +		pthread_create(&thread_close, NULL, aggressive_close_thread, &data);
> +
> +		__sync_synchronize();
> +		data.go =3D 1;
> +
> +		pthread_join(thread_change, NULL);
> +		pthread_join(thread_close, NULL);
> +
> +		/*
> +		 * concurrent access Detection Strategy:
> +		 *
> +		 * The concurrent access happens when CHANGE_HANDLE races with CLOSE.
> +		 * Handle state checking doesn't work because:
> +		 * - With mutex: CHANGE can win cleanly (not a race)
> +		 * - Without mutex: concurrent access happens but handles appear normal
> +		 *
> +		 * ONLY reliable detection: Monitor kernel log for concurrent access t=
races.
> +		 * concurrent access shows up in drm_gem_object_release_handle path.
> +		 */
> +
> +		/* Clean up handles (one or both may fail) */
> +		drmIoctl(ctx->fd, DRM_IOCTL_GEM_CLOSE,
> +			 &(struct drm_gem_close){ .handle =3D data.new_handle });
> +		drmIoctl(ctx->fd, DRM_IOCTL_GEM_CLOSE,
> +			 &(struct drm_gem_close){ .handle =3D h });
> +
> +		if ((i + 1) % 1000 =3D=3D 0) {
> +			/* Check for KASAN traces periodically */
> +			int kasan_now =3D check_kernel_traces();
> +			int kasan_new =3D kasan_now - kasan_before;
> +
> +			igt_info("  Progress: %d/%d, KASAN traces: %d\n",
> +				 i + 1, iterations, kasan_new);
> +
> +			if (kasan_new > 0 && race_wins =3D=3D 0)
> +				race_wins =3D kasan_new;
> +		}
> +	}
> +
> +	/* Final KASAN check */
> +	kasan_after =3D check_kernel_traces();
> +	race_wins =3D kasan_after - kasan_before;
> +
> +	igt_info("\nAggressive race test completed:\n");
> +	igt_info("  Iterations: %d\n", iterations);
> +	igt_info("  KASAN concurrent access traces detected: %d\n", race_wins);
> +
> +	if (race_wins > 0) {
> +		igt_info("\n*** RACE CONDITION DETECTED (concurrent access) ***\n");
> +		igt_info("  Kernel is UNPATCHED (missing handle_map_lock mutex)\n");
> +		igt_info("  KASAN detected %d concurrent access issues events\n", race=
_wins);
> +		igt_info("\n");
> +		igt_info("  View concurrent access traces:\n");
> +		igt_info("    dmesg | grep -A40 -E '(drm_gem_object_release_handle|drm=
_gem_object_handle_put_unlocked)'\n");
> +		igt_info("\n");
> +		igt_info("  The concurrent access happens when CHANGE_HANDLE tries to =
access\n");
> +		igt_info("  an object that was freed by concurrent CLOSE.\n");
> +		igt_info("\n");
> +		igt_info("  Fix: Apply V5 patch (add handle_map_lock mutex)\n");
> +
> +		/* Fail the test if concurrent access detected */
> +		igt_assert_eq(race_wins, 0);
> +	} else {
> +		igt_info("\n=3D=3D=3D NO concurrent access DETECTED =3D=3D=3D\n");
> +		igt_info("  Kernel appears PATCHED (handle_map_lock prevents race)\n");
> +		igt_info("  No KASAN traces found after %d iterations\n", iterations);
> +		igt_info("  This is the expected behavior with V5 patch applied\n");
> +		igt_info("\n");
> +		igt_info("  Note: concurrent access detection via kernel log monitorin=
g\n");
> +		igt_info("        Works with KASAN or kernel oops/warnings\n");
> +	}
> +}
> +
> +/*
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + * SINGLE-THREADED TEST - Focused race exploitation
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + */
> +
> +/*
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + * SINGLE-THREADED TEST - Fixed timing
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + */
> +
> +static void *single_thread_hammer(void *arg)
> +{
> +	struct single_thread_data *data =3D arg;
> +	uint32_t handle, alt_handle;
> +	int local_fd;
> +	int ret;
> +	bool is_base =3D true;
> +	unsigned long swaps =3D 0;
> +	struct gpu_ctx local_ctx;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	/* Create BO BEFORE closer starts */
> +	pthread_mutex_lock(data->fd_lock);
> +	local_fd =3D *data->main_fd;
> +	pthread_mutex_unlock(data->fd_lock);
> +
> +	local_ctx =3D *data->ctx;
> +	local_ctx.fd =3D local_fd;
> +
> +	handle =3D gem_create_bo(&local_ctx, 4096);
> +	if (handle =3D=3D 0) {
> +		igt_info("[HAMMER] Failed to create BO\n");
> +		data->hammer_ready =3D true;  /* Signal even on failure */
> +		return NULL;
> +	}
> +
> +	alt_handle =3D handle + 1;
> +	igt_info("[HAMMER] Created handle %u, will swap with %u\n", handle, alt=
_handle);
> +
> +	/* Signal that BO is ready - closer can start now */
> +	data->hammer_ready =3D true;
> +
> +	while (data->running) {
> +		/* Rapid swap - no FD checks, just swap */
> +		ret =3D gem_change_handle(&local_ctx,
> +					is_base ? handle : alt_handle,
> +					is_base ? alt_handle : handle);
> +		if (ret =3D=3D 0) {
> +			swaps++;
> +			__sync_fetch_and_add(&data->swap_count, 1);
> +			is_base =3D !is_base;
> +
> +			if (swaps % 10000 =3D=3D 0)
> +				igt_info("[HAMMER] %lu swaps\n", swaps);
> +		}
> +		/* No error handling - just keep hammering */
> +	}
> +
> +	igt_info("[HAMMER] Final: %lu swaps\n", swaps);
> +	return NULL;
> +}
> +
> +static void *single_thread_closer(void *arg)
> +{
> +	struct single_thread_data *data =3D arg;
> +	unsigned long closes =3D 0;
> +	int new_fd;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	/* Wait for hammer to create BO first */
> +	while (!data->hammer_ready)
> +		usleep(100);
> +
> +	igt_info("[CLOSER] Hammer ready, starting closes\n");
> +
> +	while (data->running) {
> +		/* Close FD to trigger idr_for_each() */
> +		pthread_mutex_lock(data->fd_lock);
> +		if (*data->main_fd >=3D 0) {
> +			close(*data->main_fd);
> +			*data->main_fd =3D -1;
> +			closes++;
> +			__sync_fetch_and_add(&data->close_count, 1);
> +		}
> +		pthread_mutex_unlock(data->fd_lock);
> +
> +		/* Small delay - this is the window for hitting the race */
> +		usleep(1000);
> +
> +		/* Reopen */
> +		new_fd =3D drm_open_driver_render(DRIVER_ANY);
> +		if (new_fd >=3D 0) {
> +			pthread_mutex_lock(data->fd_lock);
> +			*data->main_fd =3D new_fd;
> +			pthread_mutex_unlock(data->fd_lock);
> +		}
> +
> +		/* Check KASAN */
> +		if (closes % 100 =3D=3D 0) {
> +			int kasan_now =3D check_kernel_traces();
> +
> +			if (kasan_now > 0) {
> +				__sync_fetch_and_add(data->race_hits, 1);
> +				igt_info("[CLOSER] *** KASAN DETECTED: %d traces ***\n", kasan_now);
> +			}
> +		}
> +	}
> +
> +	igt_info("[CLOSER] %lu closes\n", closes);
> +	return NULL;
> +}
> +
> +static void *single_thread_monitor(void *arg)
> +{
> +	struct single_thread_data *data =3D arg;
> +	int kasan_last =3D 0;
> +	int kasan_now;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (data->running) {
> +		sleep(5);
> +
> +		kasan_now =3D check_kernel_traces();
> +		if (kasan_now > kasan_last) {
> +			igt_info("[MONITOR] +%d KASAN traces (total: %d)\n",
> +				 kasan_now - kasan_last, kasan_now);
> +			kasan_last =3D kasan_now;
> +		}
> +
> +		igt_info("[STATS] Swaps:%u Closes:%u KASAN:%u\n",
> +			 data->swap_count, data->close_count, *data->race_hits);
> +	}
> +
> +	return NULL;
> +}
> +
> +static void test_race_single_thread(struct gpu_ctx *ctx)
> +{
> +	pthread_t hammer, closer, monitor;
> +	pthread_barrier_t barrier;
> +	pthread_mutex_t fd_lock =3D PTHREAD_MUTEX_INITIALIZER;
> +	struct single_thread_data data =3D {0};
> +	uint32_t race_hits =3D 0;
> +	int main_fd;
> +	int kasan_before, kasan_after;
> +	int race_detected;
> +
> +	igt_info("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
> +	igt_info("  SINGLE-THREADED FOCUSED TEST (Fixed Timing)\n");
> +	igt_info("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
> +	igt_info("  Duration: 3 seconds\n");
> +	igt_info("  Threads: 1 hammer + 1 closer + 1 monitor\n");
> +	igt_info("  Strategy:\n");
> +	igt_info("    1. Hammer creates ONE BO\n");
> +	igt_info("    2. Hammer swaps H <-> H+1 rapidly in tight loop\n");
> +	igt_info("    3. Closer periodically close(fd) -> idr_for_each()\n");
> +	igt_info("  Race window: idr_alloc(new) ... idr_replace(old, NULL)\n");
> +	igt_info("    Between these two, BOTH handles point to same object\n");
> +	igt_info("    If idr_for_each() runs here -> double release -> concurre=
nt access\n");
> +	igt_info("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n\n");
> +
> +	kasan_before =3D check_kernel_traces();
> +	igt_info("KASAN traces before test: %d\n\n", kasan_before);
> +
> +	main_fd =3D drm_open_driver_render(DRIVER_ANY);
> +	igt_require(main_fd >=3D 0);
> +
> +	data.ctx =3D ctx;
> +	data.main_fd =3D &main_fd;
> +	data.fd_lock =3D &fd_lock;
> +	data.running =3D true;
> +	data.hammer_ready =3D false;
> +	data.race_hits =3D &race_hits;
> +
> +	pthread_barrier_init(&barrier, NULL, 3);
> +	data.barrier =3D &barrier;
> +
> +	igt_info("Starting threads...\n");
> +
> +	pthread_create(&hammer, NULL, single_thread_hammer, &data);
> +	pthread_create(&closer, NULL, single_thread_closer, &data);
> +	pthread_create(&monitor, NULL, single_thread_monitor, &data);
> +
> +	igt_info("Racing for 3 seconds...\n\n");
> +	sleep(3);
> +
> +	igt_info("\nStopping threads...\n");
> +	data.running =3D false;
> +
> +	pthread_join(hammer, NULL);
> +	pthread_join(closer, NULL);
> +	pthread_join(monitor, NULL);
> +
> +	pthread_barrier_destroy(&barrier);
> +	pthread_mutex_destroy(&fd_lock);
> +
> +	if (main_fd >=3D 0)
> +		close(main_fd);
> +
> +	kasan_after =3D check_kernel_traces();
> +	race_detected =3D kasan_after - kasan_before;
> +
> +	igt_info("\n=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
> +	igt_info("  SINGLE-THREADED TEST RESULTS\n");
> +	igt_info("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
> +	igt_info("  Total swaps: %u\n", data.swap_count);
> +	igt_info("  Total closes: %u\n", data.close_count);
> +	igt_info("  KASAN concurrent access traces: %d\n", race_detected);
> +	igt_info("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n\n");
> +
> +	if (race_detected > 0) {
> +		igt_info("*** SUCCESS: RACE CONDITION TRIGGERED! ***\n\n");
> +		igt_info("concurrent access detected with %d KASAN traces!\n\n", race_=
detected);
> +		igt_info("This confirms the vulnerability in the wrong operation order=
:\n\n");
> +		igt_info("  Race Timeline:\n");
> +		igt_info("  --------------\n");
> +		igt_info("  T1: Hammer thread calls change_handle(H, H+1)\n");
> +		igt_info("      -> enters drm_gem_change_handle_ioctl()\n");
> +		igt_info("      -> spin_lock(&table_lock)\n");
> +		igt_info("      -> idr_alloc(H+1, obj)\n");
> +		igt_info("         [RACE WINDOW OPENS - Both H and H+1 point to obj]\n=
\n");
> +		igt_info("  T2: Closer thread calls close(fd)\n");
> +		igt_info("      -> drm_gem_release()\n");
> +		igt_info("      -> idr_for_each(&object_idr, release_handle, ...)\n");
> +		igt_info("         Iteration 1: handle H -> release(obj)\n");
> +		igt_info("         Iteration 2: handle H+1 -> release(obj) AGAIN\n");
> +		igt_info("      -> DOUBLE RELEASE -> USE-AFTER-FREE!\n\n");
> +		igt_info("  T3: Hammer thread continues (if not crashed):\n");
> +		igt_info("      -> idr_replace(H, NULL)\n");
> +		igt_info("         [Too late - obj already freed]\n\n");
> +		igt_info("View KASAN traces:\n");
> +		igt_info("  sudo dmesg | grep -B10 -A40 'concurrent access issues'\n\n=
");
> +		igt_info("The fix (correct order):\n");
> +		igt_info("  1. idr_replace(H, NULL)  FIRST  <- Make H invisible\n");
> +		igt_info("  2. idr_alloc(H+1, obj)   SECOND <- Create new handle\n");
> +		igt_info("  Result: At no point do both handles exist simultaneously\n=
");
> +		igt_info("          idr_for_each() can never see both -> no double rel=
ease\n\n");
> +	} else {
> +		igt_info("=3D=3D=3D NO concurrent access DETECTED =3D=3D=3D\n\n");
> +		if (data.swap_count =3D=3D 0) {
> +			igt_info("ERROR: No successful handle swaps!\n");
> +			igt_info("The change_handle ioctl may not be working properly.\n\n");
> +		} else if (data.swap_count < 100) {
> +			igt_info("WARNING: Very few swaps (%u). May not have hit race window.=
\n\n",
> +				 data.swap_count);
> +		} else {
> +			igt_info("Completed %u swaps and %u closes without detecting concurre=
nt access.\n\n",
> +				 data.swap_count, data.close_count);
> +			igt_info("Possible reasons:\n");
> +			igt_info("  1. Correct patch is applied (NULL old BEFORE alloc new)\n=
");
> +			igt_info("  2. Race window is extremely small (nanoseconds)\n");
> +			igt_info("  3. Timing didn't align to hit the exact window\n");
> +			igt_info("  4. KASAN may not be sensitive enough to catch it\n");
> +			igt_info("  5. Test needs different timing parameters\n\n");
> +			igt_info("Note: Absence of concurrent access detection doesn't prove =
correctness.\n");
> +			igt_info("      Code analysis shows the race exists in principle.\n");
> +		}
> +	}
> +}
> +
> +/*
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + * RANDOM HANDLE TEST - Try random handle numbers to find free slots
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + */
> +
> +static void *random_handle_hammer(void *arg)
> +{
> +	struct random_handle_data *data =3D arg;
> +	uint32_t handle;
> +	int local_fd;
> +	int ret;
> +	unsigned long swaps =3D 0;
> +	unsigned long attempts =3D 0;
> +	struct gpu_ctx local_ctx;
> +	uint32_t random_handle;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	/* Create BO BEFORE closer starts */
> +	pthread_mutex_lock(data->fd_lock);
> +	local_fd =3D *data->main_fd;
> +	pthread_mutex_unlock(data->fd_lock);
> +
> +	local_ctx =3D *data->ctx;
> +	local_ctx.fd =3D local_fd;
> +
> +	handle =3D gem_create_bo(&local_ctx, 4096);
> +	if (handle =3D=3D 0) {
> +		igt_info("[HAMMER] Failed to create BO\n");
> +		data->hammer_ready =3D true;
> +		return NULL;
> +	}
> +
> +	igt_info("[HAMMER] Created base handle %u\n", handle);
> +	data->hammer_ready =3D true;
> +
> +	/* Seed random number generator with thread ID + time */
> +	srand(time(NULL) ^ pthread_self());
> +
> +	while (data->running) {
> +		/* Try random handle numbers in different ranges */
> +		int range =3D attempts % 4;
> +
> +		switch (range) {
> +		case 0:
> +			/* Small random offset (1-100) */
> +			random_handle =3D handle + (rand() % 100) + 1;
> +			break;
> +		case 1:
> +			/* Medium random offset (100-10000) */
> +			random_handle =3D handle + (rand() % 9900) + 100;
> +			break;
> +		case 2:
> +			/* Large random offset (1M-2M) */
> +			random_handle =3D handle + 1000000 + (rand() % 1000000);
> +			break;
> +		case 3:
> +			/* Completely random handle */
> +			random_handle =3D rand() % 0xFFFFFF;
> +			if (random_handle =3D=3D handle)
> +				random_handle++;
> +			break;
> +		}
> +
> +		attempts++;
> +		__sync_fetch_and_add(&data->attempt_count, 1);
> +
> +		/* Try to change to random handle */
> +		ret =3D gem_change_handle(&local_ctx, handle, random_handle);
> +		if (ret =3D=3D 0) {
> +			swaps++;
> +			__sync_fetch_and_add(&data->swap_count, 1);
> +
> +			/* Successfully swapped, now swap back */
> +			ret =3D gem_change_handle(&local_ctx, random_handle, handle);
> +			if (ret !=3D 0) {
> +				/* Failed to swap back, update current handle */
> +				handle =3D random_handle;
> +			}
> +
> +			if (swaps % 100 =3D=3D 0)
> +				igt_info("[HAMMER] %lu successful swaps (%.2f%% success rate)\n",
> +					 swaps, 100.0 * swaps / attempts);
> +		}
> +
> +		/* Every 10000 attempts, report stats */
> +		if (attempts % 10000 =3D=3D 0) {
> +			igt_info("[HAMMER] %lu attempts, %lu swaps (%.4f%% success)\n",
> +				 attempts, swaps, 100.0 * swaps / attempts);
> +		}
> +	}
> +
> +	igt_info("[HAMMER] Final: %lu swaps from %lu attempts (%.4f%%)\n",
> +		 swaps, attempts, 100.0 * swaps / attempts);
> +
> +	/* Cleanup current handle */
> +	gem_close_bo(&local_ctx, handle);
> +
> +	return NULL;
> +}
> +
> +static void *random_handle_closer(void *arg)
> +{
> +	struct random_handle_data *data =3D arg;
> +	unsigned long closes =3D 0;
> +	int new_fd;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	/* Wait for hammer to create BO first */
> +	while (!data->hammer_ready)
> +		usleep(100);
> +
> +	igt_info("[CLOSER] Hammer ready, starting closes\n");
> +
> +	while (data->running) {
> +		/* Close FD to trigger idr_for_each() */
> +		pthread_mutex_lock(data->fd_lock);
> +		if (*data->main_fd >=3D 0) {
> +			close(*data->main_fd);
> +			*data->main_fd =3D -1;
> +			closes++;
> +			__sync_fetch_and_add(&data->close_count, 1);
> +		}
> +		pthread_mutex_unlock(data->fd_lock);
> +
> +		/* Small delay - race window */
> +		usleep(1000);
> +
> +		/* Reopen */
> +		new_fd =3D drm_open_driver_render(DRIVER_ANY);
> +		if (new_fd >=3D 0) {
> +			pthread_mutex_lock(data->fd_lock);
> +			*data->main_fd =3D new_fd;
> +			pthread_mutex_unlock(data->fd_lock);
> +		}
> +
> +		/* Check KASAN */
> +		if (closes % 100 =3D=3D 0) {
> +			int kasan_now =3D check_kernel_traces();
> +
> +			if (kasan_now > 0) {
> +				__sync_fetch_and_add(data->race_hits, 1);
> +				igt_info("[CLOSER] *** KASAN DETECTED: %d traces ***\n", kasan_now);
> +			}
> +		}
> +	}
> +
> +	igt_info("[CLOSER] %lu closes\n", closes);
> +	return NULL;
> +}
> +
> +static void *random_handle_monitor(void *arg)
> +{
> +	struct random_handle_data *data =3D arg;
> +	int kasan_last =3D 0;
> +	int kasan_now;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (data->running) {
> +		sleep(5);
> +
> +		kasan_now =3D check_kernel_traces();
> +		if (kasan_now > kasan_last) {
> +			igt_info("[MONITOR] +%d KASAN traces (total: %d)\n",
> +				 kasan_now - kasan_last, kasan_now);
> +			kasan_last =3D kasan_now;
> +		}
> +
> +		igt_info("[STATS] Attempts:%u Swaps:%u Closes:%u KASAN:%u (%.4f%% succ=
ess)\n",
> +			 data->attempt_count, data->swap_count, data->close_count,
> +			 *data->race_hits,
> +			 data->attempt_count > 0 ? 100.0 * data->swap_count / data->attempt_c=
ount : 0);
> +	}
> +
> +	return NULL;
> +}
> +
> +static void test_race_random_handles(struct gpu_ctx *ctx)
> +{
> +	pthread_t hammer, closer, monitor;
> +	pthread_barrier_t barrier;
> +	pthread_mutex_t fd_lock =3D PTHREAD_MUTEX_INITIALIZER;
> +	struct random_handle_data data =3D {0};
> +	uint32_t race_hits =3D 0;
> +	int main_fd;
> +	int kasan_before, kasan_after;
> +	int race_detected;
> +
> +	igt_info("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
> +	igt_info("  RANDOM HANDLE TEST\n");
> +	igt_info("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
> +	igt_info("  Duration: 3 seconds\n");
> +	igt_info("  Threads: 1 hammer + 1 closer + 1 monitor\n");
> +	igt_info("  Strategy:\n");
> +	igt_info("    1. Hammer creates ONE BO\n");
> +	igt_info("    2. Hammer tries RANDOM new handle numbers\n");
> +	igt_info("    3. Ranges: small (1-100), medium (100-10K),\n");
> +	igt_info("       large (1M-2M), completely random\n");
> +	igt_info("    4. Swaps back to original handle on success\n");
> +	igt_info("    5. Closer periodically close(fd) -> idr_for_each()\n");
> +	igt_info("  Goal: Find free handle slots by random probing\n");
> +	igt_info("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n\n");
> +
> +	kasan_before =3D check_kernel_traces();
> +	igt_info("KASAN traces before test: %d\n\n", kasan_before);
> +
> +	main_fd =3D drm_open_driver_render(DRIVER_ANY);
> +	igt_require(main_fd >=3D 0);
> +
> +	data.ctx =3D ctx;
> +	data.main_fd =3D &main_fd;
> +	data.fd_lock =3D &fd_lock;
> +	data.running =3D true;
> +	data.hammer_ready =3D false;
> +	data.race_hits =3D &race_hits;
> +
> +	pthread_barrier_init(&barrier, NULL, 3);
> +	data.barrier =3D &barrier;
> +
> +	igt_info("Starting threads...\n");
> +
> +	pthread_create(&hammer, NULL, random_handle_hammer, &data);
> +	pthread_create(&closer, NULL, random_handle_closer, &data);
> +	pthread_create(&monitor, NULL, random_handle_monitor, &data);
> +
> +	igt_info("Racing for 3 seconds...\n\n");
> +	sleep(3);
> +
> +	igt_info("\nStopping threads...\n");
> +	data.running =3D false;
> +
> +	pthread_join(hammer, NULL);
> +	pthread_join(closer, NULL);
> +	pthread_join(monitor, NULL);
> +
> +	pthread_barrier_destroy(&barrier);
> +	pthread_mutex_destroy(&fd_lock);
> +
> +	if (main_fd >=3D 0)
> +		close(main_fd);
> +
> +	kasan_after =3D check_kernel_traces();
> +	race_detected =3D kasan_after - kasan_before;
> +
> +	igt_info("\n=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
> +	igt_info("  RANDOM HANDLE TEST RESULTS\n");
> +	igt_info("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
> +	igt_info("  Total attempts: %u\n", data.attempt_count);
> +	igt_info("  Successful swaps: %u\n", data.swap_count);
> +	if (data.attempt_count > 0) {
> +		igt_info("  Success rate: %.4f%%\n",
> +			 100.0 * data.swap_count / data.attempt_count);
> +	}
> +	igt_info("  Total closes: %u\n", data.close_count);
> +	igt_info("  KASAN concurrent access traces: %d\n", race_detected);
> +	igt_info("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n\n");
> +
> +	if (race_detected > 0) {
> +		igt_info("*** SUCCESS: RACE CONDITION TRIGGERED! ***\n\n");
> +		igt_info("concurrent access detected with %d KASAN traces!\n\n", race_=
detected);
> +		igt_info("This confirms the race with random handle probing.\n\n");
> +		igt_info("View KASAN traces:\n");
> +		igt_info("  sudo dmesg | grep -B10 -A40 'concurrent access issues'\n\n=
");
> +	} else {
> +		igt_info("=3D=3D=3D NO concurrent access DETECTED =3D=3D=3D\n\n");
> +		if (data.swap_count =3D=3D 0) {
> +			igt_info("ERROR: No successful handle swaps!\n");
> +			igt_info("Random probing also failed to find free handles.\n\n");
> +		} else if (data.swap_count < 100) {
> +			igt_info("WARNING: Very few swaps (%u). May not have hit race window.=
\n\n",
> +				 data.swap_count);
> +		} else {
> +			igt_info("Completed %u swaps and %u closes without detecting concurre=
nt access.\n\n",
> +				 data.swap_count, data.close_count);
> +			igt_info("Random handle probing success rate: %.4f%%\n\n",
> +				 100.0 * data.swap_count / data.attempt_count);
> +			if (data.swap_count > 1000)
> +				igt_info("Good swap rate - race window likely too small to hit.\n");
> +		}
> +	}
> +}
> +/*
> + * Close-before-lock test - Exact race from vulnerability report
> + *
> + * Tests concurrent GEM_CLOSE and CHANGE_HANDLE operations.
> + * The race exploits the window where GEM_CLOSE runs BEFORE change_handle
> + * takes table_lock for idr_alloc:
> + *
> + *   Thread A (change_handle)          Thread B (GEM_CLOSE on H)
> + *   -----------------------          -------------------------
> + *   obj =3D lookup(H)  refcount 1->2
> + *                                    handle_count 1->0 -> put(obj)
> + *                                      refcount 2->1
> + *                                    idr_remove(H)
> + *   idr_alloc(obj, N)
> + *   idr_replace(NULL, H): H empty,
> + *     returns NULL -- discarded!
> + *   idr_replace(obj, N)
> + *   out: put(obj)  refcount 1->0
> + *     -> obj FREED
> + *
> + * End state: object_idr[N] points at freed obj -> concurrent access
> + *
> + * Uses DRM_IOCTL_MODE_CREATE_DUMB (driver-agnostic, no libdrm needed).
> + * Semaphore sync + CPU pinning for maximum race window exploitation.
> + *
> + * Expected:
> + *   Unpatched kernel: "Race Success" + KASAN traces in dmesg
> + *   Patched kernel (Sima's fix): 0 race wins in 2000 iterations
> + */
> +
> +static void *race_change_worker(void *arg)
> +{
> +	struct race_shared *s =3D arg;
> +
> +	pin_to_cpu(1);
> +	sem_wait(&s->change_sem);
> +
> +	if (igt_ioctl(s->fd, DRM_IOCTL_GEM_CHANGE_HANDLE, &s->ch) =3D=3D 0)
> +		s->change_success =3D 1;
> +
> +	return NULL;
> +}
> +
> +static void *race_close_worker(void *arg)
> +{
> +	struct race_shared *s =3D arg;
> +
> +	pin_to_cpu(0);
> +	sem_wait(&s->close_sem);
> +
> +	if (igt_ioctl(s->fd, DRM_IOCTL_GEM_CLOSE, &s->cl) =3D=3D 0)
> +		s->close_success =3D 1;
> +
> +	return NULL;
> +}
> +
> +static void test_race_close_before_lock(struct gpu_ctx *ctx)
> +{
> +	struct race_shared shared;
> +	int iterations =3D 2000;
> +	int race_wins =3D 0;
> +	int kasan_before, kasan_after;
> +	int i;
> +
> +	igt_info("Testing Close-before-lock test on %s\n",
> +		 gpu_name(ctx->driver));
> +	igt_info("  Tests close-before-lock scenario)\n");
> +	igt_info("  Race: GEM_CLOSE wins before CHANGE_HANDLE takes table_lock\=
n");
> +	igt_info("  Method: Semaphore sync + CPU pinning \n");
> +	igt_info("  Iterations: %d\n", iterations);
> +	igt_info("  Detection: Both change AND close succeed simultaneously\n\n=
");
> +
> +	shared.fd =3D ctx->fd;
> +	kasan_before =3D check_kernel_traces();
> +
> +	for (i =3D 0; i < iterations; i++) {
> +		struct drm_mode_create_dumb create =3D {
> +			.width =3D 64,
> +			.height =3D 64,
> +			.bpp =3D 32,
> +		};
> +		pthread_t tid_change, tid_close;
> +		int ret;
> +
> +		ret =3D igt_ioctl(ctx->fd, DRM_IOCTL_MODE_CREATE_DUMB, &create);
> +		if (ret < 0) {
> +			/*
> +			 * MODE_CREATE_DUMB may not be supported on all
> +			 * drivers/configs. Fall back to gem_create_bo.
> +			 */
> +			create.handle =3D gem_create_bo(ctx, BO_SIZE);
> +		}
> +
> +		shared.old_handle =3D create.handle;
> +		shared.new_handle =3D 0x4000 + i;
> +		shared.ch.handle =3D shared.old_handle;
> +		shared.ch.new_handle =3D shared.new_handle;
> +		shared.cl.handle =3D shared.old_handle;
> +		shared.change_success =3D 0;
> +		shared.close_success =3D 0;
> +
> +		sem_init(&shared.change_sem, 0, 0);
> +		sem_init(&shared.close_sem, 0, 0);
> +
> +		igt_assert_eq(pthread_create(&tid_change, NULL,
> +					     race_change_worker, &shared), 0);
> +		igt_assert_eq(pthread_create(&tid_close, NULL,
> +					     race_close_worker, &shared), 0);
> +
> +		/* Brief delay to let threads reach sem_wait */
> +		usleep(100);
> +
> +		/* Fire both threads as close to simultaneously as possible */
> +		sem_post(&shared.change_sem);
> +		sem_post(&shared.close_sem);
> +
> +		pthread_join(tid_change, NULL);
> +		pthread_join(tid_close, NULL);
> +
> +		sem_destroy(&shared.change_sem);
> +		sem_destroy(&shared.close_sem);
> +
> +		if (shared.change_success && shared.close_success) {
> +			race_wins++;
> +			igt_info("  [%d] *** RACE WIN: both change and close "
> +				 "succeeded (handle %u -> %u) ***\n",
> +				 i, shared.old_handle, shared.new_handle);
> +			/*
> +			 * new_handle now points to a freed object.
> +			 * Do NOT touch it -- just record the event.
> +			 * The dangling handle will be cleaned up on fd close.
> +			 */
> +		} else if (shared.change_success) {
> +			/* Change won, close lost -- normal, clean up new handle */
> +			struct drm_gem_close cleanup =3D {
> +				.handle =3D shared.new_handle
> +			};
> +			igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CLOSE, &cleanup);
> +		}
> +		/* If close won and change lost: handle already freed, nothing to do */
> +
> +		if ((i + 1) % 500 =3D=3D 0)
> +			igt_info("  Progress: %d/%d (race wins: %d)\n",
> +				 i + 1, iterations, race_wins);
> +	}
> +
> +	kasan_after =3D check_kernel_traces();
> +
> +	igt_info("\n  Results:\n");
> +	igt_info("  Iterations: %d\n", iterations);
> +	igt_info("  Race wins (both succeeded): %d\n", race_wins);
> +	igt_info("  KASAN concurrent access traces: %d\n", kasan_after - kasan_=
before);
> +
> +	if (race_wins > 0) {
> +		igt_info("\n  *** concurrent access RACE DETECTED ***\n");
> +		igt_info("  %d iterations had both CHANGE_HANDLE and GEM_CLOSE\n"
> +			 "  succeed on the same handle. The new handle now\n"
> +			 "  points to a freed GEM object.\n\n", race_wins);
> +		igt_info("  View KASAN traces:\n");
> +		igt_info("    sudo dmesg | grep -B5 -A40 'concurrent access issues'\n\=
n");
> +	} else {
> +		igt_info("\n  =3D=3D=3D NO RACE DETECTED =3D=3D=3D\n");
> +		igt_info("  Kernel appears patched. No iteration had both\n");
> +		igt_info("  CHANGE_HANDLE and GEM_CLOSE succeed simultaneously.\n");
> +	}
> +
> +	/*
> +	 * Fail the test if races were detected -- this is a security bug.
> +	 * If KASAN found concurrent access traces, that's definitive proof.
> +	 */
> +	igt_assert_f(race_wins =3D=3D 0,
> +		     "concurrent access race detected: %d wins in %d iterations\n",
> +		     race_wins, iterations);
> +}
> +
> +int igt_main()
> +{
> +	struct gpu_ctx ctx =3D { .fd =3D -1 };
> +
> +	igt_fixture() {
> +		ctx.fd =3D drm_open_driver_render(DRIVER_ANY);
> +		igt_require(ctx.fd >=3D 0);
> +
> +		ctx.driver =3D detect_driver(ctx.fd);
> +		igt_require_f(ctx.driver !=3D DRIVER_TYPE_UNKNOWN,
> +			      "Unsupported GPU driver\n");
> +
> +		igt_info("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
> +		igt_info("  GPU-Agnostic Race Condition Tests\n");
> +		igt_info("  Running on: %s\n", gpu_name(ctx.driver));
> +		igt_info("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
> +
> +#if HAS_AMDGPU
> +		if (ctx.driver =3D=3D DRIVER_TYPE_AMDGPU) {
> +			uint32_t major, minor;
> +			int err =3D amdgpu_device_initialize(ctx.fd, &major, &minor,
> +							   &ctx.amdgpu_device);
> +			igt_require(err =3D=3D 0);
> +			igt_info("  AMDGPU version: %d.%d\n", major, minor);
> +		}
> +#endif
> +
> +		if (ctx.driver =3D=3D DRIVER_TYPE_I915) {
> +			igt_require_gem(ctx.fd);
> +			igt_info("  i915 GEM verified\n");
> +		}
> +
> +		igt_info("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n\n");
> +	}
> +
> +	igt_describe("Race Condition #1: CHANGE_HANDLE vs GEM_CLOSE (concurrent=
 access issues)");
> +	igt_subtest("race-change-vs-close")
> +		test_race_change_vs_close(&ctx);
> +
> +	igt_describe("Race Condition #2: Concurrent CHANGE_HANDLE (handle corru=
ption)");
> +	igt_subtest("race-change-vs-change")
> +		test_race_change_vs_change(&ctx);
> +
> +	igt_describe("Race Condition #3: CHANGE_HANDLE vs Prime (stale referenc=
es)");
> +	igt_subtest("race-change-vs-prime")
> +		test_race_change_vs_prime(&ctx);
> +	igt_describe("Aggressive concurrent access race: CHANGE_HANDLE vs CLOSE=
 with KASAN detection");
> +	igt_subtest("race-aggressive-change-vs-close")
> +		test_race_aggressive(&ctx);
> +	igt_describe("Single-thread: One BO swapped H<->H+1 with periodic FD cl=
ose");
> +	igt_subtest("race-exploit-single-thread")
> +		test_race_single_thread(&ctx);
> +	igt_describe("Random handle probing: Try random new_handle values to fi=
nd free slots");
> +	igt_subtest("race-exploit-random-handles")
> +		test_race_random_handles(&ctx);
> +	igt_describe(" GEM_CLOSE races CHANGE_HANDLE lookup ");
> +	igt_subtest("race-close-before-lock")
> +		test_race_close_before_lock(&ctx);
> +
> +	igt_fixture() {
> +#if HAS_AMDGPU
> +		if (ctx.driver =3D=3D DRIVER_TYPE_AMDGPU && ctx.amdgpu_device)
> +			amdgpu_device_deinitialize(ctx.amdgpu_device);
> +#endif
> +		drm_close_driver(ctx.fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index a62f447df..293e84e8a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -106,6 +106,7 @@ intel_i915_progs =3D [
>  	'gem_caching',
>  	'gem_create',
>  	'gem_ccs',
> +	'gem_change_handle_race',
>  	'gem_close',
>  	'gem_close_race',
>  	'gem_compute',
> --=20
> 2.54.0
>=20
