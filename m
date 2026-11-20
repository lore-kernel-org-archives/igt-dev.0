Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96B2606A6E9
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 19:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AjsQDvvR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF09112ACF;
	Fri, 20 Nov 2026 19:28:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC044112AAC
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 19:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795202872; x=1826738872;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8aXqbLDBNYZ3h5RKtH1Y/5ZcvxQEJuBJbweJ/D3tvQg=;
 b=AjsQDvvRMCNqVuyaiAi7iiLbd/fW4rSERv3L/vABlAw+zPRtbDQ4XTtd
 rFZBsCNMgLsYgakS9cTz7M15odT+hl7CC1OA9HCgMGgISG7kMOVdferF4
 zT4IeY+wV6zJuQTj9aWzw4/1/SCMmEYikw2qS811CU5b0wT41nDUlKNI5
 6qKcir0Ae+hXMfqmp6T5AeCmeWnHbspD8pxXB6oxcHYN8h14eVSQNn+0V
 chQLkiKF7N3IXmUwSWp3LEbZtfbfYJR6+lxftOrCSAeRry9nti08Wv6Um
 0giNhorkN5uqgpv+6UzTM1az+u0LuPaKkKfbIyfshW2oJFq83GlVKUGW2 g==;
X-CSE-ConnectionGUID: zZIZyUr8SGefMvuvOJc+xA==
X-CSE-MsgGUID: nnsjTOeDQEOrWu5HtVMPcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3988645"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3988645"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 11:27:52 -0800
X-CSE-ConnectionGUID: Fjx7PS4bQQuhKOIZraSfMA==
X-CSE-MsgGUID: 49cauzowRm26U9D9iD617g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11122782"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 11:27:49 -0800
Date: Fri, 20 Nov 2026 20:27:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Francis, David" <David.Francis@amd.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Prosyak,
 Vitaly" <Vitaly.Prosyak@amd.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, 
 Simona Vetter <simona@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v4] tests/intel: Add edge case and race condition tests
 for GEM_CHANGE_HANDLE
Message-ID: <bigey4diakr4ljuzegyc6tsnho42cuzpt5jnfflqeihv5nw7hv@iqzf3ljkfrrq>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 "Francis, David" <David.Francis@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Prosyak,
 Vitaly" <Vitaly.Prosyak@amd.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, 
 Simona Vetter <simona@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
References: <20261110153230.583745-1-David.Francis@amd.com>
 <6a89a83a-8290-4c59-855a-f798f8350570@igalia.com>
 <CHAPR12MB9992477A972F6389F886D55EAEEF7A2@CHAPR12MB999247.namprd12.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CHAPR12MB9992477A972F6389F886D55EAEEF7A2@CHAPR12MB999247.namprd12.prod.outlook.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Francis,,
On 2026-11-18 at 19:25:38 +0000, Francis, David wrote:
> It's been about a week since this was reviewed.
>=20
> Tvrtko has also reviewed the kernel change.
>=20
> Is there anything left to do before this is merged? With the current vers=
ion, tests are skipped if the ioctl is still disabled in the kernel.

Please check compilation on arm64 container and restore some
includes, as now it fails:

864/1845] Compiling C object tests/gem_change_handle.p/intel_gem_change_han=
dle.c.o
FAILED: tests/gem_change_handle.p/intel_gem_change_handle.c.o
/usr/bin/aarch64-linux-gnu-gcc -Itests/gem_change_handle.p -Itests -I../tes=
ts -I../include -I../include/drm-uapi -I../include/drm-uapi-experimental -I=
=2E./include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I.. -I.=
=2E/lib/vendor -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/aarc=
h64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freet=
ype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/aarch64-l=
inux-gnu -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -fdiagnostic=
s-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=
=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad=
-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallth=
rough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -W=
missing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definiti=
on -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuniniti=
alized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-=
initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-com=
pare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Dad=
dress -Werror=3Darray-bounds -Werror=3Ddangling-pointer -Werror=3Dimplicit =
-Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast =
-Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer=
-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigr=
aphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LAR=
GEFILE64_SOURCE=3D1 -pthread -MD -MQ tests/gem_change_handle.p/intel_gem_ch=
ange_handle.c.o -MF tests/gem_change_handle.p/intel_gem_change_handle.c.o.d=
 -o tests/gem_change_handle.p/intel_gem_change_handle.c.o -c ../tests/intel=
/gem_change_handle.c
In file included from /usr/include/xf86drm.h:40,
                 from ../lib/drmtest.h:37,
                 from ../lib/igt.h:27,
                 from ../tests/intel/gem_change_handle.c:24:
=2E./tests/intel/gem_change_handle.c: In function 'export_import_thread':
=2E./tests/intel/gem_change_handle.c:491:44: error: 'O_CLOEXEC' undeclared =
(first use in this function); did you mean 'MFD_CLOEXEC'?
  491 |                         prime_args.flags =3D DRM_CLOEXEC | DRM_RDWR;
      |                                            ^~~~~~~~~~~
=2E./tests/intel/gem_change_handle.c:491:44: note: each undeclared identifi=
er is reported only once for each function it appears in
=2E./tests/intel/gem_change_handle.c:491:58: error: 'O_RDWR' undeclared (fi=
rst use in this function)
  491 |                         prime_args.flags =3D DRM_CLOEXEC | DRM_RDWR;
      |                                                          ^~~~~~~~
ninja: build stopped: subcommand failed.


Regards,
Kamil

>=20
> David Francis
>=20
> ________________________________________
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Sent: Thursday, November 12, 2026 8:43 AM
> To: Francis, David; igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly; Kamil Konieczny; Sebastian Brzezinka; Koenig, Christ=
ian; Simona Vetter; Deucher, Alexander
> Subject: Re: [PATCH v4] tests/intel: Add edge case and race condition tes=
ts for GEM_CHANGE_HANDLE
>=20
>=20
> On 10/11/2026 15:32, David Francis wrote:
> > From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >
> > Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
> > functionality, edge cases, and race conditions of this ioctl against
> > itself, gem close, gem create, and prime import and export.
> >
> > GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. Thi=
s IGT
> > coverage is a prerequisite for validating the eventual kernel-side ioctl
> > implementation and makes fixing its security bugs safer.
> >
> > v2: Small cleanups, including cutting some includes and no assert in th=
reads
> > v3: Skip if ioctl disabled
> > v4: hop around randomly on race tests
>=20
> Nice, v4 is much easier to follow. Thank you for iterating patiently!
>=20
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> Regards,
>=20
> Tvrtko
>=20
> >
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> > Cc: Christian Konig <christian.koenig@amd.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> > Signed-off-by: David Francis <David.Francis@amd.com>
> > ---
> >   include/drm-uapi/drm.h          |  23 +
> >   tests/intel/gem_change_handle.c | 728 ++++++++++++++++++++++++++++++++
> >   tests/meson.build               |   1 +
> >   3 files changed, 752 insertions(+)
> >   create mode 100644 tests/intel/gem_change_handle.c
> >
> > diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
> > index baa620e3f..cf131da24 100644
> > --- a/include/drm-uapi/drm.h
> > +++ b/include/drm-uapi/drm.h
> > @@ -619,6 +619,21 @@ struct drm_gem_open {
> >       __u64 size;
> >   };
> >
> > +/**
> > + * struct drm_gem_change_handle - Argument for &DRM_IOCTL_GEM_CHANGE_H=
ANDLE ioctl.
> > + * @handle: The handle of a gem object.
> > + * @new_handle: An available gem handle.
> > + *
> > + * This ioctl changes the handle of a GEM object to the specified one.
> > + * The new handle must be unused. On success the old handle is closed
> > + * and all further IOCTL should refer to the new handle only.
> > + * Calls to DRM_IOCTL_PRIME_FD_TO_HANDLE will return the new handle.
> > + */
> > +struct drm_gem_change_handle {
> > +     __u32 handle;
> > +     __u32 new_handle;
> > +};
> > +
> >   /**
> >    * DRM_CAP_DUMB_BUFFER
> >    *
> > @@ -1296,6 +1311,14 @@ extern "C" {
> >    */
> >   #define DRM_IOCTL_MODE_CLOSEFB              DRM_IOWR(0xD0, struct drm=
_mode_closefb)
> >
> > +/**
> > + * DRM_IOCTL_GEM_CHANGE_HANDLE - Move an object to a different handle
> > + *
> > + * Some applications (notably CRIU) need objects to have specific gem =
handles.
> > + * This ioctl changes the object at one gem handle to use a new gem ha=
ndle.
> > + */
> > +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_c=
hange_handle)
> > +
> >   /*
> >    * Device specific ioctls should only be in their respective headers
> >    * The device specific ioctl range is from 0x40 to 0x9f.
> > diff --git a/tests/intel/gem_change_handle.c b/tests/intel/gem_change_h=
andle.c
> > new file mode 100644
> > index 000000000..1aef48d0a
> > --- /dev/null
> > +++ b/tests/intel/gem_change_handle.c
> > @@ -0,0 +1,728 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright 2026 Advanced Micro Devices, Inc.
> > + * Copyright 2026 Intel Corporation
> > + *
> > + * GPU-agnostic race condition tests for GEM_CHANGE_HANDLE ioctl
> > + *
> > + * NOTE: This test is located in tests/intel/ directory because:
> > + * 1. All gem_* tests are traditionally placed in tests/intel/ regardl=
ess
> > + *    of GPU vendor, following IGT convention for GEM-related tests
> > + * 2. The test uses i915/gem.h and i915/gem_create.h for GEM object cr=
eation
> > + *    on Intel platforms, though it works vendor-agnostically via DRM =
core
> > + * 3. Some subtest designs (noop-same-handle, invalid-*, edge-*, funct=
ional-*)
> > + *    were proposed by Simona Vetter (Intel), hence Intel copyright he=
ader
> > + *
> > + */
> > +
> > +#include <errno.h>
> > +#include <limits.h>
> > +#include <pthread.h>
> > +#include <sched.h>
> > +#include <string.h>
> > +
> > +#include "igt.h"
> > +#include "igt_device.h"
> > +#include "i915/gem.h"
> > +#include "i915/gem_create.h"
> > +
> > +#include "lib/amdgpu/amd_memory.h"
> > +#include "igt_amd.h"
> > +
> > +#define BO_SIZE (16 * 1024)
> > +#define RACE_DURATION_SEC 1
> > +
> > +//#define VERBOSE_LOGGING 0
> > +
> > +/**
> > + * TEST: gem change handle
> > + * Description: tests for drm ioctl GEM_CHANGE_HANDLE
> > + * Category: Core
> > + * Mega feature: General Core features
> > + * Sub-category: GEM handles
> > + * Functionality: gem change handle
> > + * Feature: gem
> > + * Run type: FULL
> > + *
> > + * SUBTEST: sanity
> > + * Description: Changing a handle to a new value works as intended
> > + *
> > + * SUBTEST: change_prime
> > + * Description: Changing a handle affects the result of prime import
> > + *
> > + * SUBTEST: new_handle_zero
> > + * Description: Changing a handle to 0 should fail
> > + *
> > + * SUBTEST: new_handle_exceeds_int_max
> > + * Description: Changing a handle to > INT_MAX should fail
> > + *
> > + * SUBTEST: new_handle_equals_old_handle
> > + * Description: Changing a handle to itself should fail
> > + *
> > + * SUBTEST: new_handle_taken
> > + * Description: Changing a handle to a value already in use should fail
> > + *
> > + * SUBTEST: invalid_handle
> > + * Description: Changing a non-existent handle should fail
> > + *
> > + * SUBTEST: race_change_change
> > + * Description: Test for race conditions between two GEM_CHANGE_HANDLE
> > + *
> > + * SUBTEST: race_change_create_close
> > + * Description: Test for race conditions between GEM_CHANGE_HANDLE, GE=
M_CREATE, and GEM_CLOSE
> > + *
> > + * SUBTEST: race_change_export_import
> > + * Description: Test for race conditions between GEM_CHANGE_HANDLE, pr=
ime export, and prime import
> > + */
> > +
> > +IGT_TEST_DESCRIPTION("Edge case and race condition tests for GEM_CHANG=
E_HANDLE");
> > +
> > +/* Structs */
> > +
> > +/* Driver type detection */
> > +enum gpu_driver {
> > +     DRIVER_TYPE_UNKNOWN =3D 0,
> > +     DRIVER_TYPE_I915,
> > +     DRIVER_TYPE_AMDGPU,
> > +};
> > +
> > +/* GPU context structure */
> > +struct gpu_ctx {
> > +     int fd;
> > +     enum gpu_driver driver;
> > +};
> > +
> > +/* Helpers */
> > +
> > +static uint32_t gpu_create_bo(struct gpu_ctx *ctx, uint64_t size)
> > +{
> > +     uint32_t handle =3D 0;
> > +
> > +     switch (ctx->driver) {
> > +     case DRIVER_TYPE_I915: {
> > +             handle =3D gem_create(ctx->fd, size);
> > +             break;
> > +     }
> > +     case DRIVER_TYPE_AMDGPU:
> > +             handle =3D igt_amd_create_bo(ctx->fd, size);
> > +             break;
> > +     default:
> > +             igt_assert_f(0, "Unsupported driver\n");
> > +     }
> > +
> > +     igt_assert(handle !=3D 0);
> > +     return handle;
> > +}
> > +
> > +static int gem_close_bo(struct gpu_ctx *ctx, uint32_t handle)
> > +{
> > +     struct drm_gem_close close_args =3D { .handle =3D handle };
> > +
> > +     return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CLOSE, &close_args);
> > +}
> > +
> > +static int gem_change_handle(struct gpu_ctx *ctx, uint32_t old_handle,=
 uint32_t new_handle)
> > +{
> > +     struct drm_gem_change_handle args =3D {
> > +             .handle =3D old_handle,
> > +             .new_handle =3D new_handle,
> > +     };
> > +     return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CHANGE_HANDLE, &args);
> > +}
> > +
> > +static enum gpu_driver detect_driver(int fd)
> > +{
> > +     /* Check AMDGPU first (primary target) */
> > +     if (is_amdgpu_device(fd))
> > +             return DRIVER_TYPE_AMDGPU;
> > +     if (is_i915_device(fd))
> > +             return DRIVER_TYPE_I915;
> > +     return DRIVER_TYPE_UNKNOWN;
> > +}
> > +
> > +static bool is_ioctl_disabled(struct gpu_ctx *ctx)
> > +{
> > +     uint32_t handle, new_h;
> > +     int ret;
> > +     bool result;
> > +
> > +     handle =3D gpu_create_bo(ctx, 4096);
> > +     new_h =3D handle + 1000;
> > +
> > +     ret =3D gem_change_handle(ctx, handle, new_h);
> > +     result =3D (ret !=3D 0 && errno =3D=3D EINVAL);
> > +
> > +     gem_close_bo(ctx, handle);
> > +     gem_close_bo(ctx, new_h);
> > +
> > +     return result;
> > +}
> > +
> > +#ifdef VERBOSE_LOGGING
> > +#define verbose_log(...) igt_info(__VA_ARGS__)
> > +#else
> > +#define verbose_log(...)
> > +#endif
> > +
> > +/* Sanity and Functionality tests */
> > +
> > +/**
> > + * test_sanity - verify rename actually works
> > + *
> > + * After a successful rename:
> > + * - GEM_CLOSE(old_handle) must FAIL (handle no longer exists)
> > + * - GEM_CLOSE(new_handle) must SUCCEED (object is there)
> > + */
> > +static void test_sanity(struct gpu_ctx *ctx)
> > +{
> > +     uint32_t handle, new_h;
> > +     int ret;
> > +
> > +     handle =3D gpu_create_bo(ctx, 4096);
> > +     new_h =3D handle + 1000;
> > +
> > +     /* Perform the rename */
> > +     ret =3D gem_change_handle(ctx, handle, new_h);
> > +     igt_assert_f(ret =3D=3D 0,
> > +                  "gem_change_handle(%u -> %u) failed: %s\n",
> > +                  handle, new_h, strerror(errno));
> > +
> > +     /* Old handle must be invalid now */
> > +     ret =3D gem_close_bo(ctx, handle);
> > +     igt_assert_f(ret < 0 && errno =3D=3D EINVAL,
> > +                  "GEM_CLOSE(old_handle=3D%u) should fail with EINVAL,=
 "
> > +                  "got ret=3D%d errno=3D%d (%s)\n",
> > +                  handle, ret, errno, strerror(errno));
> > +
> > +     /* New handle must be valid */
> > +     ret =3D gem_close_bo(ctx, new_h);
> > +     igt_assert_f(ret =3D=3D 0,
> > +                  "GEM_CLOSE(new_handle=3D%u) should succeed, "
> > +                  "got ret=3D%d errno=3D%d (%s)\n",
> > +                  new_h, ret, errno, strerror(errno));
> > +}
> > +
> > +/**
> > + * test_change_export - changing a handle affects prime import
> > + *
> > + * Importing a prime object that has had its handle changed since it w=
as
> > + * exported should get the new handle
> > + */
> > +static void test_change_export(struct gpu_ctx *ctx)
> > +{
> > +     int ret, handle1, handle2, dmabuf_fd, imported_handle;
> > +
> > +     /* Create a handle and export it */
> > +     handle1 =3D gpu_create_bo(ctx, 4096);
> > +     handle2 =3D handle1 + 1;
> > +     dmabuf_fd =3D prime_handle_to_fd(ctx->fd, handle1);
> > +
> > +     /* When you import, you get the same handle back */
> > +     imported_handle =3D prime_fd_to_handle(ctx->fd, dmabuf_fd);
> > +     igt_assert_eq(imported_handle, handle1);
> > +
> > +     /* Change the handle (should succeed) */
> > +     ret =3D gem_change_handle(ctx, handle1, handle2);
> > +     igt_assert_eq(ret, 0);
> > +
> > +     /* Import, should get the new handle */
> > +     imported_handle =3D prime_fd_to_handle(ctx->fd, dmabuf_fd);
> > +     igt_assert_eq(imported_handle, handle2);
> > +
> > +     /* Confirm gem object is at the new handle */
> > +     igt_assert_eq(gem_close_bo(ctx, handle2), 0);
> > +
> > +     ret =3D gem_close_bo(ctx, handle1);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EINVAL);
> > +
> > +     close(dmabuf_fd);
> > +}
> > +
> > +/* Edge case and fail case tests */
> > +
> > +/**
> > + * test_new_handle_zero - new_handle =3D 0 should fail
> > + *
> > + * 0 is not a valid gem handle.
> > + */
> > +static void test_new_handle_zero(struct gpu_ctx *ctx)
> > +{
> > +     uint32_t handle;
> > +     int ret;
> > +
> > +     handle =3D gpu_create_bo(ctx, 4096);
> > +
> > +     /* new_handle =3D 0 must fail with -EINVAL */
> > +     ret =3D gem_change_handle(ctx, handle, 0);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EINVAL);
> > +
> > +     /* Original handle should still be valid */
> > +     igt_assert_eq(gem_close_bo(ctx, handle), 0);
> > +}
> > +
> > +/**
> > + * test_new_handle_exceeds_int_max - new_handle > INT_MAX should fail
> > + *
> > + * The kernel enforces an idr_alloc() limitation: new_handle must be <=
=3D INT_MAX.
> > + */
> > +static void test_new_handle_exceeds_int_max(struct gpu_ctx *ctx)
> > +{
> > +     uint32_t handle;
> > +     int ret;
> > +
> > +     handle =3D gpu_create_bo(ctx, 4096);
> > +
> > +     /* new_handle > INT_MAX must fail with -EINVAL */
> > +     ret =3D gem_change_handle(ctx, handle, (uint32_t)INT_MAX + 1);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EINVAL);
> > +
> > +     /* Also test 0xFFFFFFFF */
> > +     ret =3D gem_change_handle(ctx, handle, 0xFFFFFFFF);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EINVAL);
> > +
> > +     /* Original handle should still be valid */
> > +     igt_assert_eq(gem_close_bo(ctx, handle), 0);
> > +}
> > +
> > +/**
> > + * test_new_handle_equals_old_handle - new_handle =3D old_handle shoul=
d fail
> > + *
> > + * The ioctl treats old_handle =3D new_handle as invalid input.
> > + */
> > +static void test_new_handle_equals_old_handle(struct gpu_ctx *ctx)
> > +{
> > +     uint32_t handle;
> > +     int ret;
> > +
> > +     handle =3D gpu_create_bo(ctx, 4096);
> > +
> > +     /* new_handle =3D old_handle must fail with -EINVAL */
> > +     ret =3D gem_change_handle(ctx, handle, handle);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EINVAL);
> > +
> > +     /* same thing if handle doesn't exist */
> > +     ret =3D gem_change_handle(ctx, handle + 1, handle + 1);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EINVAL);
> > +
> > +     /* Original handle should still be valid */
> > +     igt_assert_eq(gem_close_bo(ctx, handle), 0);
> > +}
> > +
> > +/**
> > + * test_new_handle_taken - new_handle being the handle of another gem =
object must fail
> > + *
> > + * Not allowed to change a handle to a handle that's already taken
> > + */
> > +static void test_new_handle_taken(struct gpu_ctx *ctx)
> > +{
> > +     uint32_t handle, handle_2;
> > +     int ret;
> > +
> > +     handle =3D gpu_create_bo(ctx, 4096);
> > +     handle_2 =3D gpu_create_bo(ctx, 4096);
> > +
> > +     /* new_handle is taken must fail with -EBUSY */
> > +     ret =3D gem_change_handle(ctx, handle, handle_2);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EBUSY);
> > +
> > +     /* And the other way */
> > +     ret =3D gem_change_handle(ctx, handle_2, handle);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EBUSY);
> > +
> > +     /* Original handles should still be valid */
> > +     igt_assert_eq(gem_close_bo(ctx, handle), 0);
> > +     igt_assert_eq(gem_close_bo(ctx, handle_2), 0);
> > +}
> > +
> > +/**
> > + * test_invalid_handle - non-existent handle should fail
> > + *
> > + * Using a handle that doesn't exist should return -ENOENT.
> > + */
> > +static void test_invalid_handle(struct gpu_ctx *ctx)
> > +{
> > +     int ret;
> > +
> > +     /* Use a handle that was never allocated */
> > +     ret =3D gem_change_handle(ctx, 0xDEAD, 0xBEEF);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, ENOENT);
> > +
> > +     /* Handle 0 is also invalid */
> > +     ret =3D gem_change_handle(ctx, 0, 100);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, ENOENT);
> > +}
> > +
> > +/* Race condition test structs and helpers */
> > +
> > +struct change_handle_thread_data {
> > +     struct gpu_ctx *ctx;
> > +     uint32_t handles[4];
> > +     bool running;
> > +     int unexpected_errno;
> > +     pthread_barrier_t barrier;
> > +};
> > +
> > +static void set_up_context(struct change_handle_thread_data *data, str=
uct gpu_ctx *ctx)
> > +{
> > +     data->handles[0] =3D gpu_create_bo(ctx, BO_SIZE);
> > +     igt_assert(data->handles[0] !=3D 0);
> > +     data->handles[1] =3D gpu_create_bo(ctx, BO_SIZE);
> > +     igt_assert(data->handles[1] !=3D 0);
> > +
> > +     data->ctx =3D ctx;
> > +     data->handles[2] =3D max(data->handles[0], data->handles[1]) + 0x=
10;
> > +     data->handles[3] =3D max(data->handles[0], data->handles[1]) + 0x=
20;
> > +     data->unexpected_errno =3D 0;
> > +     __atomic_store_n(&data->running, true, __ATOMIC_RELEASE);
> > +
> > +     pthread_barrier_init(&data->barrier, NULL, 2);
> > +}
> > +
> > +/* Race condition test threads */
> > +
> > +static void *change_handle_thread(void *arg)
> > +{
> > +     struct change_handle_thread_data *data =3D arg;
> > +     uint32_t *h =3D data->handles;
> > +     int ret, old, new;
> > +
> > +     pthread_barrier_wait(&data->barrier);
> > +
> > +     while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> > +             old =3D h[rand() % 4];
> > +             new =3D h[rand() % 4];
> > +             ret =3D gem_change_handle(data->ctx, old, new);
> > +             /*
> > +              * Expected errors:
> > +              * - ENOENT: old handle invalid
> > +              * - EBUSY: target handle occupied (collision detected du=
ring idr_alloc)
> > +              * - EINVAL: old and new handle are the same
> > +              */
> > +             if (ret !=3D 0 && errno !=3D ENOENT && errno !=3D EBUSY &=
& old !=3D new)
> > +                     data->unexpected_errno =3D errno;
> > +
> > +             sched_yield();
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +static void *close_recreate_thread(void *arg)
> > +{
> > +     struct change_handle_thread_data *data =3D arg;
> > +     uint32_t *h =3D data->handles;
> > +     int handle, ret, i =3D 0;
> > +
> > +     pthread_barrier_wait(&data->barrier);
> > +
> > +     while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> > +             /* Close a handle; keep trying until success */
> > +             while (true) {
> > +                     ret =3D gem_close_bo(data->ctx, h[i]);
> > +                     if (ret =3D=3D 0) {
> > +                             verbose_log("[CLOSE-TID:%lu] Closed handl=
e %u\n",
> > +                                         (unsigned long)pthread_self()=
, h[i]);
> > +                             break;
> > +                     }
> > +
> > +                     i  =3D (i + 1) % 4;
> > +
> > +                     if (!__atomic_load_n(&data->running, __ATOMIC_ACQ=
UIRE))
> > +                             return NULL;
> > +             }
> > +
> > +             /* Open a handle */
> > +             handle =3D gpu_create_bo(data->ctx, BO_SIZE);
> > +             verbose_log("[CLOSE-TID:%lu] Created new BO with handle %=
u\n",
> > +                         (unsigned long)tid, handle);
> > +
> > +             /* If the opened handle isn't one of the four ones being
> > +              * shuffled, change_handle it in. Keep trying until succe=
ss.
> > +              */
> > +             if (handle !=3D h[0] && handle !=3D h[1] && handle !=3D h=
[2] && handle !=3D h[3]) {
> > +                     while (true) {
> > +                             ret =3D gem_change_handle(data->ctx, hand=
le, h[i]);
> > +                             if (ret =3D=3D 0) {
> > +                                     verbose_log("[CLOSE-TID:%lu] Chan=
ge handle %u to %u\n",
> > +                                                 (unsigned long)pthrea=
d_self(), handle, h[i]);
> > +                                     break;
> > +                             }
> > +
> > +                             if (ret !=3D 0 && errno !=3D ENOENT && er=
rno !=3D EBUSY)
> > +                                     data->unexpected_errno =3D errno;
> > +
> > +                             i  =3D (i + 1) % 4;
> > +
> > +                             if (!__atomic_load_n(&data->running, __AT=
OMIC_ACQUIRE))
> > +                                     return NULL;
> > +                     }
> > +             }
> > +
> > +             sched_yield();
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +static void *export_import_thread(void *arg)
> > +{
> > +     struct change_handle_thread_data *data =3D arg;
> > +     struct drm_prime_handle prime_args;
> > +     uint32_t *h =3D data->handles;
> > +     int handle, i, ret, dmabuf_fd;
> > +
> > +     pthread_barrier_wait(&data->barrier);
> > +
> > +     while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> > +             /* Export a handle; keep trying until success */
> > +             i =3D 0;
> > +             while (true) {
> > +                     prime_args.handle =3D h[i];
> > +                     prime_args.flags =3D DRM_CLOEXEC | DRM_RDWR;
> > +                     ret =3D igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_=
HANDLE_TO_FD, &prime_args);
> > +                     if (ret =3D=3D 0) {
> > +                             verbose_log("[PRIME-TID:%lu] Exported han=
dle %u\n",
> > +                                         (unsigned long)pthread_self, =
h[i]);
> > +                             break;
> > +                     }
> > +
> > +                     i +=3D 1;
> > +                     if (i > 3)
> > +                             i =3D 0;
> > +
> > +                     if (!__atomic_load_n(&data->running, __ATOMIC_ACQ=
UIRE))
> > +                             return NULL;
> > +             }
> > +
> > +             dmabuf_fd =3D prime_args.fd;
> > +
> > +             /* Import the handle; it should be one of the four handle=
s in the shuffle */
> > +             prime_args.fd =3D dmabuf_fd;
> > +             prime_args.flags =3D 0;
> > +             ret =3D igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_FD_TO_HA=
NDLE, &prime_args);
> > +             if (ret !=3D 0)
> > +                     data->unexpected_errno =3D errno;
> > +
> > +             handle =3D prime_args.handle;
> > +             verbose_log("[PRIME-TID:%lu] Imported; got handle %u\n",
> > +                         (unsigned long)tid, handle);
> > +             if(handle !=3D h[0] && handle !=3D h[1] && handle !=3D h[=
2] && handle !=3D h[3])
> > +                     data->unexpected_errno =3D ERANGE;
> > +
> > +             close(dmabuf_fd);
> > +
> > +             sched_yield();
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +/* Race condition tests */
> > +
> > +/**
> > + * test_race_change_change - Test for race conditions of change_handle=
 against itself
> > + *
> > + * Start two threads, each of which constantly attempt changes between=
 four different handles
> > + * Try to catch race conditions such as changing same handle to two di=
fferent handles,
> > + * Changing two handles to the same handle, changing a handle to a han=
dle itself being changed,
> > + * etc.
> > + */
> > +static void test_race_change_change(struct gpu_ctx *ctx)
> > +{
> > +     pthread_t thread_change_1, thread_change_2;
> > +     struct change_handle_thread_data data =3D {0};
> > +     int num_handles, ret;
> > +
> > +     set_up_context(&data, ctx);
> > +
> > +     /* Start both threads simultaneously */
> > +     igt_assert_eq(pthread_create(&thread_change_1, NULL, change_handl=
e_thread, &data), 0);
> > +     igt_assert_eq(pthread_create(&thread_change_2, NULL, change_handl=
e_thread, &data), 0);
> > +
> > +     /* Let them race */
> > +     sleep(RACE_DURATION_SEC);
> > +
> > +     __atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> > +     pthread_join(thread_change_1, NULL);
> > +     pthread_join(thread_change_2, NULL);
> > +
> > +     pthread_barrier_destroy(&data.barrier);
> > +
> > +     igt_assert_eq(data.unexpected_errno, 0);
> > +
> > +     /* Exactly two gem objects should still exist */
> > +     num_handles =3D 0;
> > +     for (int i =3D 0; i < 4; i++) {
> > +             ret =3D gem_close_bo(ctx, data.handles[i]);
> > +
> > +             if (ret =3D=3D 0) {
> > +                     num_handles +=3D 1;
> > +             } else {
> > +                     igt_assert_eq(errno, EINVAL);
> > +             }
> > +     }
> > +     igt_assert_eq(num_handles, 2);
> > +}
> > +
> > +/**
> > + * test_race_change_create_close - Test for race conditions of change_=
handle against gem create / close
> > + *
> > + * Start two threads, one of which attempts to change between four han=
dles while the other alternates
> > + * closing a gem handle and creating new ones. Test for race condition=
s such as change a handle that's
> > + * being closed or change a handle to a value that's being created.
> > + */
> > +static void test_race_change_create_close(struct gpu_ctx *ctx)
> > +{
> > +     pthread_t thread_change, thread_create_close;
> > +     struct change_handle_thread_data data =3D {0};
> > +     int num_handles, ret;
> > +
> > +     set_up_context(&data, ctx);
> > +
> > +     /* Start both threads simultaneously */
> > +     igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_=
thread, &data), 0);
> > +     igt_assert_eq(pthread_create(&thread_create_close, NULL, close_re=
create_thread, &data), 0);
> > +
> > +     /* Let them race */
> > +     sleep(RACE_DURATION_SEC);
> > +
> > +     __atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> > +     pthread_join(thread_change, NULL);
> > +     pthread_join(thread_create_close, NULL);
> > +
> > +     pthread_barrier_destroy(&data.barrier);
> > +
> > +     igt_assert_eq(data.unexpected_errno, 0);
> > +
> > +     /* Depending on where create / close ended up, there can be 1 or =
2 handles open */
> > +     num_handles =3D 0;
> > +     for (int i =3D 0; i < 4; i++) {
> > +             ret =3D gem_close_bo(ctx, data.handles[i]);
> > +
> > +             if (ret =3D=3D 0) {
> > +                     num_handles +=3D 1;
> > +             } else {
> > +                     igt_assert_eq(errno, EINVAL);
> > +             }
> > +     }
> > +     igt_assert(num_handles >=3D 1 && num_handles <=3D 2);
> > +}
> > +
> > +/**
> > + * test_race_change_export_import - Test for race conditions of change=
_handle against prime export / import
> > + *
> > + * Start two threads, one of which attempts to change between four han=
dles while the other exports
> > + * handles, then imports them again. Check for race conditions such as=
 changing a handle while exporting
> > + * it or important a handle while changing it.
> > + */
> > +static void test_race_change_export_import(struct gpu_ctx *ctx)
> > +{
> > +     pthread_t thread_change, thread_export_import;
> > +     struct change_handle_thread_data data =3D {0};
> > +     int num_handles, ret;
> > +
> > +     set_up_context(&data, ctx);
> > +
> > +     /* Start both threads simultaneously */
> > +     igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_=
thread, &data), 0);
> > +     igt_assert_eq(pthread_create(&thread_export_import, NULL, export_=
import_thread, &data), 0);
> > +
> > +     /* Let them race */
> > +     sleep(RACE_DURATION_SEC);
> > +
> > +     __atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> > +     pthread_join(thread_change, NULL);
> > +     pthread_join(thread_export_import, NULL);
> > +
> > +     pthread_barrier_destroy(&data.barrier);
> > +
> > +     igt_assert_eq(data.unexpected_errno, 0);
> > +
> > +     /* Exporting a handle doesn't close it, so should still be exactl=
y 2 */
> > +     num_handles =3D 0;
> > +     for (int i =3D 0; i < 4; i++) {
> > +             ret =3D gem_close_bo(ctx, data.handles[i]);
> > +
> > +             if (ret =3D=3D 0) {
> > +                     num_handles +=3D 1;
> > +             } else {
> > +                     igt_assert_eq(errno, EINVAL);
> > +             }
> > +     }
> > +     igt_assert_eq(num_handles, 2);
> > +}
> > +
> > +int igt_main()
> > +{
> > +     struct gpu_ctx ctx =3D { .fd =3D -1 };
> > +
> > +     igt_fixture() {
> > +             ctx.fd =3D drm_open_driver_render(DRIVER_ANY);
> > +             igt_require(ctx.fd >=3D 0);
> > +
> > +             ctx.driver =3D detect_driver(ctx.fd);
> > +             igt_require_f(ctx.driver !=3D DRIVER_TYPE_UNKNOWN,
> > +                           "Unsupported GPU driver\n");
> > +
> > +             if (ctx.driver =3D=3D DRIVER_TYPE_I915)
> > +                     igt_require_gem(ctx.fd);
> > +
> > +             igt_require_f(!is_ioctl_disabled(&ctx),
> > +                           "GEM_CHANGE_HANDLE ioctl appears to be disa=
bled.\n");
> > +     }
> > +
> > +     igt_describe("Sanity Test: Change handle actually changes handle"=
);
> > +     igt_subtest("sanity")
> > +             test_sanity(&ctx);
> > +
> > +     igt_describe("Functionality Test: Change handle affects result of=
 prime import");
> > +     igt_subtest("change_prime")
> > +             test_change_export(&ctx);
> > +
> > +     igt_describe("Edge Case: New handle =3D 0 should fail");
> > +     igt_subtest("new_handle_zero")
> > +             test_new_handle_zero(&ctx);
> > +
> > +     igt_describe("Edge Case: New handle > INT_MAX should fail");
> > +     igt_subtest("new_handle_exceeds_int_max")
> > +             test_new_handle_exceeds_int_max(&ctx);
> > +
> > +     igt_describe("Edge Case: Changing a handle to itself should fail"=
);
> > +     igt_subtest("new_handle_equals_old_handle")
> > +             test_new_handle_equals_old_handle(&ctx);
> > +
> > +     igt_describe("Edge Case: Change a handle to a value which is take=
n should fail");
> > +     igt_subtest("new_handle_taken")
> > +             test_new_handle_taken(&ctx);
> > +
> > +     igt_describe("Edge Case: Changing a non-existent handle should fa=
il");
> > +     igt_subtest("invalid_handle")
> > +             test_invalid_handle(&ctx);
> > +
> > +     igt_describe("Race: Changing handle vs. Changing handle");
> > +     igt_subtest("race_change_change")
> > +             test_race_change_change(&ctx);
> > +
> > +     igt_describe("Race: Changing handle vs. Create / Close");
> > +     igt_subtest("race_change_create_close")
> > +             test_race_change_create_close(&ctx);
> > +
> > +     igt_describe("Race: Changing handle vs. Export / Import");
> > +     igt_subtest("race_change_export_import")
> > +             test_race_change_export_import(&ctx);
> > +
> > +     igt_fixture() {
> > +             drm_close_driver(ctx.fd);
> > +     }
> > +
> > +}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 519a9e727..567878df6 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -105,6 +105,7 @@ intel_i915_progs =3D [
> >       'gem_blits',
> >       'gem_busy',
> >       'gem_caching',
> > +     'gem_change_handle',
> >       'gem_create',
> >       'gem_ccs',
> >       'gem_close',
>=20
