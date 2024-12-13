Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86608E7717F
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 14:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE0F10F048;
	Fri, 13 Dec 2024 14:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQ23JWzF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D699610F048
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 14:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734101431; x=1765637431;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yHCbuK+8pBNXkd71kV3/jePQ3Cke+aeLmjh7/9Wfu9k=;
 b=cQ23JWzFR7LWqtkbf4q+ZcUBM1Q7ymMmqn3hAv3DGvuU669ZR2w0EI5k
 zdCruZTP0nX+vd5teKjnUsmB5JDUZeYxYyEpFmtyGUcTUJ0zZnQ7rU1qT
 XG4+SXA02sehdMVtn69MTkWYqBaUwmeTTp7VAzftbA17diM3OvdyDwHkQ
 e6HgSX5xY2ozkvpqgKCdmRVO77+pgUaSbJ3QcoqGpEpWDixrWb0kCi15t
 dQ2oXLcNKGjx21f0ygTKRtmMAi09Qbdsk1Mp4sIwvomuZg4Mq4GmxqXZj
 6XbZr0CtxWtqOxoCp2LclRPuMR3r9flD4DzcKkAxPqvFtj+a/JW+h+XKi w==;
X-CSE-ConnectionGUID: D3lWLBdCSQq2GSQRJnKfEQ==
X-CSE-MsgGUID: 6Z909B4sRruRt6X0MRsnmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34456847"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="34456847"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 06:50:30 -0800
X-CSE-ConnectionGUID: LqHSMV3zTwKVbYt3oSx31g==
X-CSE-MsgGUID: gm6T9HrbSZazbbAvr60vTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101126580"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 06:50:29 -0800
Date: Fri, 13 Dec 2024 15:50:26 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Cc: "Auld, Matthew" <matthew.auld@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel/xe_vm_create: Check negative cases for
 vm_create ioctl
Message-ID: <20241213145026.yg3jyzfmuj7lhg2p@zkempczy-mobl2>
References: <20241213075724.641859-1-pravalika.gurram@intel.com>
 <b04d46fe-b2db-4fd1-96b2-1ab5a8c991ed@intel.com>
 <BL1PR11MB55256BCD8A5A3FF36BFB732584382@BL1PR11MB5525.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR11MB55256BCD8A5A3FF36BFB732584382@BL1PR11MB5525.namprd11.prod.outlook.com>
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

On Fri, Dec 13, 2024 at 12:15:32PM +0000, Gurram, Pravalika wrote:
> 
> 
> > -----Original Message-----
> > From: Auld, Matthew <matthew.auld@intel.com>
> > Sent: Friday, December 13, 2024 4:02 PM
> > To: Gurram, Pravalika <pravalika.gurram@intel.com>; igt-
> > dev@lists.freedesktop.org
> > Subject: Re: [PATCH] tests/intel/xe_vm_create: Check negative cases for
> > vm_create ioctl
> > 
> > On 13/12/2024 07:57, Pravalika Gurram wrote:
> > > Negative test to check vm_create ioctl returns expected error when
> > > invalid flags, extensions, reserved  param is used.
> > 
> > Would be good to also do the same for the vm_destroy ioctl. It has pad and
> > reserved also which should be zero, plus would be good to also try to destroy an
> > invalid vm id.
> > 
> 
> Thanks for reply I will also add for vm_destroy ioctl waiting for input 
> is it okay to add new lib? or not

Looks xe_vm.c file is right place for vm create/destroy test cases.
What do you mean add new lib? This is test case not a library.

--
Zbigniew

> 
> > >
> > > Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> > > ---
> > >   tests/intel/xe_vm_create.c | 104
> > +++++++++++++++++++++++++++++++++++++
> > >   tests/meson.build          |   1 +
> > >   2 files changed, 105 insertions(+)
> > >   create mode 100644 tests/intel/xe_vm_create.c
> > >
> > > diff --git a/tests/intel/xe_vm_create.c b/tests/intel/xe_vm_create.c
> > > new file mode 100644 index 000000000..2430e6739
> > > --- /dev/null
> > > +++ b/tests/intel/xe_vm_create.c
> > > @@ -0,0 +1,104 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2024 Intel Corporation  */
> > > +
> > > +#include "igt.h"
> > > +#include "xe_drm.h"
> > > +
> > > +/**
> > > + * TEST: Negative test for vm create ioctl
> > > + * Category: Core
> > > + * Mega feature: General Core features
> > > + * Sub-category: Synchronization
> > > + * Functionality: vm create
> > > + * Test category: negative test
> > > + */
> > > +
> > > +/**
> > > + * SUBTEST: invalid-flag-%s
> > > + * Description:  function %arg[1] used in vm create IOCTL to make it
> > > +fail
> > > + * Functionality: fault
> > > + *
> > > + * arg[1]:
> > > + * @xe_vm_create_fault:  xe_vm_create_fault
> > > + * @xe_vm_create_scrach_fault: xe_vm_create_scrach_fault
> > > + * @xe_vm_create_scrach_fault_lr:    xe_vm_create_scrach_fault_lr
> > > + */
> > > +
> > > +static void invalid_flag(int fd, __u32 flags) {
> > > +	struct drm_xe_vm_create create = {
> > > +		.flags = flags,
> > > +	};
> > > +
> > > +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
> > > +
> > > +}
> > > +
> > > +/**
> > > + * SUBTEST: invalid-extensions
> > > + * Description: Check query with invalid extensions returns expected
> > > +error code
> > > + *
> > > + * SUBTEST: invalid-reserved
> > > + * Description: Check query with invalid reserved value returns
> > > +expected error code  */
> > > +
> > > +static void inavlid_extensions(int fd) {
> > > +	struct drm_xe_vm_create create = {
> > > +		.extensions = -1,
> > > +	};
> > > +
> > > +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
> > > +
> > > +}
> > > +
> > > +static void inavlid_reserved(int fd)
> > > +{
> > > +	struct drm_xe_vm_create create = {
> > > +		.reserved[0] = 0xffff,
> > > +	};
> > > +
> > > +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
> > > +
> > > +}
> > > +
> > > +igt_main
> > > +{
> > > +	int fd;
> > > +
> > > +	const struct section {
> > > +		const char *name;
> > > +		__u32 flags;
> > > +	} vm_create_flags_fail_functions[] = {
> > > +		{ "xe_vm_create_fault",
> > DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
> > > +		{ "xe_vm_create_scrach_fault",
> > > +			DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
> > > +			DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
> > > +		{ "xe_vm_create_scrach_fault_lr",
> > > +			~(DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > > +			DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
> > > +			DRM_XE_VM_CREATE_FLAG_FAULT_MODE) },
> > > +		{ }
> > > +	};
> > > +
> > > +	igt_fixture
> > > +		fd = drm_open_driver(DRIVER_XE);
> > > +
> > > +	for (const struct section *s = vm_create_flags_fail_functions; s->name;
> > s++) {
> > > +		igt_subtest_f("invalid-flag-%s", s->name)
> > > +			invalid_flag(fd, s->flags);
> > > +	}
> > > +
> > > +	igt_subtest("invalid-extensions")
> > > +			inavlid_extensions(fd);
> > > +
> > > +	igt_subtest("invalid-reserved")
> > > +			inavlid_reserved(fd);
> > > +
> > > +	igt_fixture {
> > > +		drm_close_driver(fd);
> > > +	}
> > > +
> > > +}
> > > diff --git a/tests/meson.build b/tests/meson.build index
> > > 2724c7a9a..fb9fc75d8 100644
> > > --- a/tests/meson.build
> > > +++ b/tests/meson.build
> > > @@ -321,6 +321,7 @@ intel_xe_progs = [
> > >   	'xe_sysfs_scheduler',
> > >           'xe_sysfs_timeslice_duration',
> > >           'xe_tlb',
> > > +        'xe_vm_create',
> > >   ]
> > >
> > >   intel_xe_eudebug_progs = [
> 
