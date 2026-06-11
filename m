Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F1CCD98C7
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 16:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEE310E803;
	Thu, 11 Jun 2026 16:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5yix79q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF47010F03F
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 16:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781196823; x=1812732823;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6gwAhBKBouYpgG7bmvAm6BI0Z5Rsiyu74yiKcXordhY=;
 b=F5yix79qbXAyEWwuYr/7VOPNuK8E8+DGT1G38fA/8S8h8x1I5fRivON7
 New5bKva2YemEm2k4X1UyqMFUPpvo84HsUSGej8p5B0mxULV5yTIzgn5v
 0I4sveIRFL4J7IBC6Uldkp6GFrYZYZjb4Nd5ZSEaoZrJgcwDOHL3oJ6DZ
 Uq1Rr7RC+vCeVtbPNctztbIhdijP36lyDubGOv2H/IlO5alsmQSMfh9Gn
 VvT1AW/vI7LmsuKtEv5sfLLBut4oJ+KAwK0IOyiN+G4WEN2p6EbjpMar6
 G3WchACtXlAQ0Sw9eUNWMHRHr/jY/tcT3ukxFGLUxfVgrU7KaKmaytXgG Q==;
X-CSE-ConnectionGUID: abUBjFhFQFiFIjdbpSS0Tg==
X-CSE-MsgGUID: 79QEiV0nQ42mfwXpeNQ8aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93505492"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="93505492"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:53:43 -0700
X-CSE-ConnectionGUID: lJCmaAEXQSKNxAf8iFbo1w==
X-CSE-MsgGUID: 5sRDCkzBQHq1dAkc3rlMpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="270564495"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:53:40 -0700
Date: Thu, 11 Jun 2026 18:53:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: igt-dev@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: Re: [PATCH 1/2] tests/intel: Add gem_change_handle_race test suite
Message-ID: <20260611165338.bt52xfpxddm6sebl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 igt-dev@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
References: <20260609193023.18720-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260609193023.18720-1-vitaly.prosyak@amd.com>
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
On 2026-06-09 at 15:30:18 -0400, Vitaly Prosyak wrote:
> Add comprehensive race condition testing for DRM_IOCTL_GEM_CHANGE_HANDLE
> to detect use-after-free vulnerabilities in GEM handle management.
>=20
> This test suite targets a specific race condition between
> drm_gem_change_handle_ioctl and DRM_IOCTL_GEM_CLOSE that was reported
> by DarkNavy (Jun 4, 2026). The race occurs when GEM_CLOSE removes a
> handle concurrently with CHANGE_HANDLE operating on it, leading to
> either a use-after-free or a null pointer dereference.
>=20
> The kernel fix uses an atomic idr_replace pattern (Simona Vetter) with
> an IS_ERR_OR_NULL check (Vitaly Prosyak) to handle both race outcomes:
> - NULL: GEM_CLOSE replaced handle with NULL (idr_replace phase)
> - ERR_PTR(-ENOENT): GEM_CLOSE fully removed handle (idr_remove phase)
>=20
> Subtests:
> - race-change-vs-close: CHANGE_HANDLE races against GEM_CLOSE
> - race-change-vs-change: Two CHANGE_HANDLE ops race on same handle
> - race-change-vs-prime: CHANGE_HANDLE races against PRIME_HANDLE_TO_FD
> - race-aggressive-change-vs-close: High-iteration close vs change
> - race-exploit-single-thread: Sequential swap+close exploit pattern
> - race-exploit-random-handles: Random handle stress test
> - race-darknavy-cve: DarkNavy CVE reproducer with semaphore sync and
>   CPU pinning for reliable race window triggering
>=20
> Test environment: 7.1.0-rc6+ with KASAN, all 7 subtests pass with 0
> KASAN traces after both kernel patches applied.
>=20
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/intel/gem_change_handle_race.c | 1788 ++++++++++++++++++++++++++

Why in intel/ subfolder? If this applies both to AMDGPU and
Intel, it could be in tests/

>  tests/meson.build                    |    1 +
>  2 files changed, 1789 insertions(+)
>  create mode 100644 tests/intel/gem_change_handle_race.c
>=20
> diff --git a/tests/intel/gem_change_handle_race.c b/tests/intel/gem_chang=
e_handle_race.c
> new file mode 100644
> index 000000000..f3408baed
> --- /dev/null
> +++ b/tests/intel/gem_change_handle_race.c
> @@ -0,0 +1,1788 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + * Copyright 2026 Intel Corporation

Why Intel here? Did you get some help from Intel
while writing this patch?

> + *
> + * GPU-agnostic race condition tests for GEM_CHANGE_HANDLE ioctl
> + * Tests the 3 race conditions documented in RACE_CONDITIONS_EXPLAINED.md

Where is that .md file? Did you mean kernel doc?

This do not compile on arm64 container with following errors:

[827/1740] Compiling C object tests/gem_change_handle_race.p/intel_gem_chan=
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
{standard input}:850: Error: unknown mnemonic `pause' -- `pause'
{standard input}:2785: Error: unknown mnemonic `pause' -- `pause'
[836/1740] Compiling C object lib/libi915_perf.so.1.5.p/meson-generated_.._=
i915_perf_metrics_acmgt3.c.o
ninja: build stopped: subcommand failed.

Regards,
Kamil

> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <pthread.h>
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
[cut]
