Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C920C531D0
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jul 2026 18:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E1610E4E1;
	Mon, 27 Jul 2026 18:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8tE8mpT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA1010E4E1
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jul 2026 18:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785176340; x=1816712340;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r0fZYSFhQX8rHwy8e0AfkzkC3fBUO7WHK37sh7HXJwU=;
 b=m8tE8mpT241lpvE/8GL1pa3oxcegKDCiyMwPbbS3sD9ObsyoBKA2beB1
 y2TyFPLb7gDWDWscF9xpDQ+bu+7d9d8LEu6+9404w40ADQhV+8S2ep9+K
 iBj6Lub8o7nCL7huUFQ8CZNJ4cTHyNDZ5tBMUbCY7PJl+njw9a0KAC9Tl
 qqiCozhHSs/3ylyMkqGuq3XQLhQbRectHyyBrnKiWbmxgEruEcCgRzaax
 YK0vRpqAfieDz9hea50YkpuqeT2XDBYz7xFve9eTZQ+2RNs1WIDlpEdcv
 ya8/LH8t2dif/24vjnHixmN2kelS4jjKM/yLyoZkIpzbdIO6ynS0r3K+4 Q==;
X-CSE-ConnectionGUID: 2kUmvJK1Rc2o8Naeu9qtcQ==
X-CSE-MsgGUID: IqEJOnbJROCY/VDY0ERxRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85514302"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="85514302"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 11:18:59 -0700
X-CSE-ConnectionGUID: 3/kM52PGQLCN7BAJoJnykg==
X-CSE-MsgGUID: PHpghnKfQl2bzsJeXxpc8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="260127939"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 11:18:58 -0700
Date: Mon, 27 Jul 2026 20:18:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Brajesh Gupta <Brajesh.Gupta@imgtec.com>
Cc: Robert Mazur <Robert.Mazur@imgtec.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "matt.coster@imgtec.com" <matt.coster@imgtec.com>,
 Luigi Santivetti <Luigi.Santivetti@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>
Subject: Re: [EXTERNAL] Re: [PATCH i-g-t v3 01/10] tests/imagination: Add
 framework for Imagination tests
Message-ID: <20260727181855.fgrs36cunrm55cjr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Brajesh Gupta <Brajesh.Gupta@imgtec.com>,
 Robert Mazur <Robert.Mazur@imgtec.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "matt.coster@imgtec.com" <matt.coster@imgtec.com>,
 Luigi Santivetti <Luigi.Santivetti@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
 <20260717-test-imagination-add-support-v3-1-ce69f9ad330c@imgtec.com>
 <20260722134422.gvdi4qi3zve3znbn@kamilkon-DESK.igk.intel.com>
 <3a08b2b97b01954f2e6afef9244c05680d33e98d.camel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3a08b2b97b01954f2e6afef9244c05680d33e98d.camel@imgtec.com>
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

Hi Brajesh,
On 2026-07-27 at 09:49:54 +0000, Brajesh Gupta wrote:
> On Wed, 2026-07-22 at 15:44 +0200, Kamil Konieczny wrote:
> Hi Kamil,
> > *** CAUTION: This email originates from a source not known to Imagination Technologies. Think before you click a link or open an attachment ***
> > 
> > Hi Robert,
> > On 2026-07-17 at 16:21:33 +0200, Robert Mazur wrote:
> > > From: Matt Coster <matt.coster@imgtec.com>
> > > 
> > > Add the initial IGT infrastructure for PowerVR (Imagination) GPUs and
> > > introduce the first GEM buffer object creation tests.
> > > 
> > > The tests verify valid BO creation and validate error handling for
> > > invalid ioctl parameters.
> > > 
> > > PowerVR DRM driver background:
> > > https://lore.kernel.org/dri-devel/cover.1700668843.git.donald.robson@imgtec.com/ 
> > > Driver documentation:
> > > https://docs.kernel.org/gpu/imagination/index.html 
> > > 
> > 
> > Can someone from your team run these tests on your hardware and
> > report here that they work? Also may he/she help with review
> > tests? I will do general part in this one patch and will glance
> > into others.
> 
> I ran IGT tests on two different platforms and all tests are passing. Attached
> result for test runs.
> 
> Thanks,
> Brajesh

Thank you, please send Tested-by: to each, or write
in one reply for which patches in series your t-by
applies.

Thanks!



Regards,
Kamil

> 
> > 
> > > Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> > > Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
> > > ---
> > >  docs/platforms.md             |  1 +
> > >  lib/drmtest.c                 | 11 +++++++
> > >  lib/drmtest.h                 |  3 ++
> > >  lib/igt_pvr.c                 | 75 +++++++++++++++++++++++++++++++++++++++++++
> > >  lib/igt_pvr.h                 | 16 +++++++++
> > >  lib/meson.build               |  1 +
> > >  meson.build                   |  8 +++++
> > >  tests/imagination/meson.build | 13 ++++++++
> > >  tests/imagination/pvr_gem.c   | 66 +++++++++++++++++++++++++++++++++++++
> > >  tests/meson.build             |  2 ++
> > >  10 files changed, 196 insertions(+)
> > > 
> > > diff --git a/docs/platforms.md b/docs/platforms.md
> > > index 214f53c1d..ea86a89c9 100644
> > > --- a/docs/platforms.md
> > > +++ b/docs/platforms.md
> > > @@ -25,6 +25,7 @@ Support exists for the following platforms:
> > >  - Panthor
> > >  - Virtual GPUs (e.g., virtio_gpu in QEMU/KVM/AVD or vmwgfx)
> > >  - Virtual display (vkms)
> > > +- Imagination (powervr)
> > >  
> > >  #### Intel
> > >  
> > > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > > index b0be06a75..1e789d2af 100644
> > > --- a/lib/drmtest.c
> > > +++ b/lib/drmtest.c
> > > @@ -143,6 +143,11 @@ bool is_msm_device(int fd)
> > >  	return __is_device(fd, "msm");
> > >  }
> > >  
> > > +bool is_pvr_device(int fd)
> > > +{
> > > +	return __is_device(fd, "powervr");
> > > +}
> > > +
> > >  bool is_nouveau_device(int fd)
> > >  {
> > >  	/* Currently all nouveau-specific codepaths require libdrm */
> > > @@ -227,6 +232,7 @@ static const struct module {
> > >  	{ DRIVER_MSM, "msm" },
> > >  	{ DRIVER_PANFROST, "panfrost" },
> > >  	{ DRIVER_PANTHOR, "panthor" },
> > > +	{ DRIVER_POWERVR, "powervr" },
> > >  	{ DRIVER_V3D, "v3d" },
> > >  	{ DRIVER_VC4, "vc4" },
> > >  	{ DRIVER_VGEM, "vgem" },
> > > @@ -988,6 +994,11 @@ void igt_require_amdgpu(int fd)
> > >  	igt_require(is_amdgpu_device(fd));
> > >  }
> > >  
> > > +void igt_require_imagination(int fd)
> > > +{
> > > +	igt_require(is_pvr_device(fd));
> > > +}
> > > +
> > >  void igt_require_intel(int fd)
> > >  {
> > >  	igt_require(is_intel_device(fd));
> > > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > > index 9d488b274..012de9dee 100644
> > > --- a/lib/drmtest.h
> > > +++ b/lib/drmtest.h
> > > @@ -59,6 +59,7 @@ int __get_drm_device_name(int fd, char *name, int name_size);
> > >  #define DRIVER_VIRTIO	(1 << 10)
> > >  #define DRIVER_PANTHOR	(1 << 11)
> > >  #define DRIVER_ASAHI	(1 << 12)
> > > +#define DRIVER_POWERVR	(1 << 13)
> > >  
> > >  /*
> > >   * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if you run
> > > @@ -137,6 +138,7 @@ int drm_prepare_filtered_multigpu(int chipset);
> > >  int drm_open_filtered_card(int idx);
> > >  
> > >  void igt_require_amdgpu(int fd);
> > > +void igt_require_imagination(int fd);
> > >  void igt_require_intel(int fd);
> > >  void igt_require_i915(int fd);
> > >  void igt_require_nouveau(int fd);
> > > @@ -150,6 +152,7 @@ bool is_i915_device(int fd);
> > >  bool is_mtk_device(int fd);
> > >  bool is_msm_device(int fd);
> > >  bool is_nouveau_device(int fd);
> > > +bool is_pvr_device(int fd);
> > >  bool is_vc4_device(int fd);
> > >  bool is_xe_device(int fd);
> > >  bool is_intel_device(int fd);
> > > diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> > > new file mode 100644
> > > index 000000000..048ccab31
> > > --- /dev/null
> > > +++ b/lib/igt_pvr.c
> > > @@ -0,0 +1,75 @@
> > > +// SPDX-License-Identifier: GPL-2.0 or MIT
> > > +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> > > +
> > > +#include <limits.h>
> > > +#include <stddef.h>
> > > +#include <stdint.h>
> > > +#include <sys/types.h>
> > > +
> > > +#include "igt_pvr.h"
> > > +
> > 
> > You do not need to have newlines in igt section but
> > it is up to you.
> > 
> > > +#include "drmtest.h"
> > 
> > Move before igt_pvr.h
> > 
> > > +#include "ioctl_wrappers.h"
> > > +
> > > +#include "pvr_drm.h"
> > > +
> > > +/**
> > > + * SECTION:igt_pvr
> > > + * @short_description: PowerVR support library
> > > + * @title: pvr
> > > + * @include: igt.h
> > > + *
> > > + * This library provides various auxiliary helper functions for writing PowerVR
> > > + * tests.
> > > + */
> > > +
> > > +/**
> > > + * igt_pvr_ioctl_create_bo:
> > > + * @fd: The file descriptor of the DRM device.
> > > + * @size: On entry, the requested size of the buffer object. On return, the
> > > + *        actual size of the buffer object.
> > > + *
> > > + * Function to create a buffer object.
> > > + *
> > > + * Returns: The handle of the created buffer object.
> > > + */
> > > +uint32_t igt_pvr_ioctl_create_bo(int fd, size_t *size)
> > > +{
> > > +	struct drm_pvr_ioctl_create_bo_args arg = {
> > > +		.size = *size,
> > > +	};
> > > +
> > > +	do_ioctl(fd, DRM_IOCTL_PVR_CREATE_BO, &arg);
> > > +
> > > +	igt_assert(arg.size >= *size && arg.size <= SIZE_MAX);
> > > +	*size = (size_t)arg.size;
> > > +
> > > +	return arg.handle;
> > > +}
> > > +
> > > +
> > > +/**
> > > + * igt_pvr_ioctl_get_bo_mmap_offset:
> > > + * @fd: The file descriptor of the DRM device.
> > > + * @handle: The handle of the buffer object.
> > > + *
> > > + * Function to get the mmap offset of a buffer object.
> > > + *
> > > + * Returns: The mmap offset of the buffer object.
> > > + */
> > > +off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle)
> > > +{
> > > +	struct drm_pvr_ioctl_get_bo_mmap_offset_args arg = {
> > > +		.handle = handle,
> > > +	};
> > > +
> > > +	do_ioctl(fd, DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET, &arg);
> > > +
> > > +	/*
> > > +	 * There is no OFF_MAX equivalent to SIZE_MAX; use the identical (by
> > > +	 * definition) PTRDIFF_MAX instead.
> > > +	 */
> > > +	igt_assert(arg.offset <= PTRDIFF_MAX);
> > > +
> > > +	return (off_t)arg.offset;
> > > +}
> > > diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
> > > new file mode 100644
> > > index 000000000..e8b2d9026
> > > --- /dev/null
> > > +++ b/lib/igt_pvr.h
> > > @@ -0,0 +1,16 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> > > +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> > > +
> > > +#ifndef IGT_PVR_H
> > > +#define IGT_PVR_H
> > > +
> > > +#include <stddef.h>
> > > +#include <stdint.h>
> > > +#include <sys/types.h>
> > > +
> > > +#include "pvr_drm.h"
> > > +
> > > +uint32_t igt_pvr_ioctl_create_bo(int fd, size_t *size);
> > > +off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle);
> > > +
> > > +#endif /* IGT_PVR_H */
> > > diff --git a/lib/meson.build b/lib/meson.build
> > > index c45a96530..05632eede 100644
> > > --- a/lib/meson.build
> > > +++ b/lib/meson.build
> > > @@ -110,6 +110,7 @@ lib_sources = [
> > >  	'igt_asahi.c',
> > >  	'igt_panfrost.c',
> > >  	'igt_panthor.c',
> > > +	'igt_pvr.c',
> > >  	'igt_v3d.c',
> > >  	'igt_vc4.c',
> > >  	'igt_vmwgfx.c',
> > > diff --git a/meson.build b/meson.build
> > > index e09122a09..b30438e31 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -289,6 +289,7 @@ asahidir = join_paths(libexecdir, 'asahi')
> > >  msmdir = join_paths(libexecdir, 'msm')
> > >  panfrostdir = join_paths(libexecdir, 'panfrost')
> > >  panthordir = join_paths(libexecdir, 'panthor')
> > > +pvrdir = join_paths(libexecdir, 'imagination')
> > >  unigrafdir = join_paths(libexecdir, 'unigraf')
> > >  v3ddir = join_paths(libexecdir, 'v3d')
> > >  vc4dir = join_paths(libexecdir, 'vc4')
> > > @@ -355,6 +356,12 @@ if get_option('use_rpath')
> > >  	endforeach
> > >  	panthor_rpathdir = join_paths(panthor_rpathdir, libdir)
> > >  
> > > +	pvrdir_rpathdir = '$ORIGIN'
> > > +	foreach p : pvrdir.split('/')
> > > +		pvrdir_rpathdir = join_paths(pvrdir_rpathdir, '..')
> > > +	endforeach
> > > +	pvrdir_rpathdir = join_paths(pvrdir_rpathdir, libdir)
> > > +
> > >  	v3d_rpathdir = '$ORIGIN'
> > >  	foreach p : v3ddir.split('/')
> > >  		v3d_rpathdir = join_paths(v3d_rpathdir, '..')
> > > @@ -392,6 +399,7 @@ else
> > >  	msm_rpathdir = ''
> > >  	panfrost_rpathdir = ''
> > >  	panthor_rpathdir = ''
> > > +	pvrdir_rpathdir = ''
> > >  	v3d_rpathdir = ''
> > >  	vc4_rpathdir = ''
> > >  	vkms_rpathdir = ''
> > > diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
> > > new file mode 100644
> > > index 000000000..65b90c39f
> > > --- /dev/null
> > > +++ b/tests/imagination/meson.build
> > > @@ -0,0 +1,13 @@
> > > +pvr_progs = [ 'pvr_gem',
> > > +	    ]
> > > +
> > > +pvr_deps = test_deps
> > > +
> > > +foreach prog : pvr_progs
> > > +	test_executables += executable(prog, prog + '.c',
> > > +				       dependencies : pvr_deps,
> > > +				       install_dir : pvrdir,
> > > +				       install_rpath : pvrdir_rpathdir,
> > > +				       install : true)
> > > +	test_list += join_paths('pvr', prog)
> > > +endforeach
> > > diff --git a/tests/imagination/pvr_gem.c b/tests/imagination/pvr_gem.c
> > > new file mode 100644
> > > index 000000000..273f4d56f
> > > --- /dev/null
> > > +++ b/tests/imagination/pvr_gem.c
> > > @@ -0,0 +1,66 @@
> > > +// SPDX-License-Identifier: GPL-2.0 or MIT
> > > +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> > > +
> > > +#include <linux/errno.h>
> > 
> > imho errno.h should be ok.
> > 
> > > +#include <stddef.h>
> > > +#include <stdint.h>
> > > +
> > > +#include "igt.h"
> > > +#include "igt_pvr.h"
> > > +
> > > +#include "pvr_drm.h"
> > > +
> > > +int igt_main()
> > > +{
> > > +	int fd;
> > > +
> > > +	igt_fixture()
> > > +	{
> > > +		fd = drm_open_driver(DRIVER_POWERVR);
> > > +	}
> > > +
> > > +	igt_describe("Test valid buffer object creation");
> > > +	igt_subtest("create-bo-4096")
> > > +	{
> > > +		size_t size = 4096;
> > > +		uint32_t handle = igt_pvr_ioctl_create_bo(fd, &size);
> > > +
> > > +		gem_close(fd, handle);
> > > +	}
> > > +
> > > +	igt_describe("Test buffer object creation with 0 size");
> > > +	igt_subtest("create-bo-0")
> > > +	{
> > > +		struct drm_pvr_ioctl_create_bo_args arg = {
> > > +			.size = 0,
> > > +		};
> > > +
> > > +		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_BO, &arg, EINVAL);
> > > +	}
> > > +
> > > +	igt_describe("Test buffer object creation with bad padding");
> > > +	igt_subtest("create-bo-bad-padding")
> > > +	{
> > > +		struct drm_pvr_ioctl_create_bo_args arg = {
> > > +			.size = 4096,
> > > +			._padding_c = 0xbad6bad6,
> > > +		};
> > > +
> > > +		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_BO, &arg, EINVAL);
> > > +	}
> > > +
> > > +	igt_describe("Test buffer object creation with unaligned size");
> > > +	igt_subtest("create-bo-unaligned-fail")
> > 
> > Why '-fail' in name? imho without it test name also looks ok.
> > It is only suggestion here, you can also keep it.
> > 
> > With above fixed this is
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > 
> > Regards,
> > Kamil
> > 
> > > +	{
> > > +		struct drm_pvr_ioctl_create_bo_args arg = {
> > > +			.size = 4000,
> > > +		};
> > > +
> > > +		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_BO, &arg, EINVAL);
> > > +	}
> > > +
> > > +	igt_fixture()
> > > +	{
> > > +		drm_close_driver(fd);
> > > +	}
> > > +}
> > > diff --git a/tests/meson.build b/tests/meson.build
> > > index 6d90627b9..63adc61b9 100644
> > > --- a/tests/meson.build
> > > +++ b/tests/meson.build
> > > @@ -561,3 +561,5 @@ if not meson.is_cross_build()
> > >  endif
> > >  
> > >  subdir('intel-ci')
> > > +
> > > +subdir('imagination')
> > > 
> > > -- 
> > > 2.43.0
> > > 
> 



