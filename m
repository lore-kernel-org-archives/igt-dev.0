Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A417CD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 18:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B928010E766;
	Wed,  3 Apr 2024 18:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elPF45rG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A78310E766
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 18:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712168589; x=1743704589;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=75pQ4sBBmrkyW63dRli2DUrSqspdhZRGCOaSN39ndHQ=;
 b=elPF45rG6lOcs0i0VOG8m3JRz8MUXuX5Do3vsI3j5qod3sHILtZZbJFF
 4O4PuAvGr/e6IicxkgyspJOKgD+tu4iDu2KjPPSFyUwr6O5DOiJb6R+2g
 tT9fdZH4x/OhGOhmnKy4z31nmPx887MGwK0YOA20tUkHKjoAAcbR1Ar3r
 brgDGA6hS9A+H/HM9QIKoLHltrupnmYkyHM8E8w8C4k3CC6Mo9Tr+c8mb
 tEV36sTxoEewVKZ59Y9lWPKVYbsHkAa1WL5kFg/H4/106Pyfn4tq33OAW
 91486YzaVVJ60AsVuIKmo8Jh9W+umyYnQTkYeNNNifK94aMqMj9G2s/I5 g==;
X-CSE-ConnectionGUID: JlxIe9VKT3GrJ3hS4FUGMQ==
X-CSE-MsgGUID: Y5HSxAKkRx+CJ0gYQuxcSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11239386"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11239386"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 11:23:09 -0700
X-CSE-ConnectionGUID: gRmeca9ZR0OWry0psxfxvQ==
X-CSE-MsgGUID: ghJporUKQjus35kFDd//iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18564378"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 11:23:07 -0700
Date: Wed, 3 Apr 2024 20:23:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_busted: Introduce a new test for Xe
 device busted state
Message-ID: <20240403182304.kwm52y3nzgvvqg3u@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20240315010843.194335-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315010843.194335-1-rodrigo.vivi@intel.com>
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

Hi Rodrigo,
On 2024-03-14 at 21:08:41 -0400, Rodrigo Vivi wrote:
> Let's inject a gt_reset failure that will put Xe device in the
> new busted state, then we confirm the IOCTL is blocked and we
----- ^^^^^^
Why is not 'wedged'? What is a difference?

Regards,
Kamil

> reload the driver to get back to a clean state for other test
> execution, since busted state in Xe is a final state that can only
> be cleared with a device rebind/reprobe.
> 
> The fault injection of this test is entirely based on xe_uevent
> provided by Himal.
> 
> v2: Use rebind instead of module reload (Lucas)
>     And other improvements also pointed out by Lucas.
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc:  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tests/intel/xe_busted.c | 107 ++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build       |   1 +
>  2 files changed, 108 insertions(+)
>  create mode 100644 tests/intel/xe_busted.c
> 
> diff --git a/tests/intel/xe_busted.c b/tests/intel/xe_busted.c
> new file mode 100644
> index 000000000..88278213d
> --- /dev/null
> +++ b/tests/intel/xe_busted.c
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: cause fake gt reset failure which put Xe device in busted state
> + * Category: Software building block
> + * Sub-category: driver
> + * Functionality: busted
> + * Test category: functionality test
> + */
> +
> +#include <limits.h>
> +#include <dirent.h>
> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +
> +#include "xe/xe_ioctl.h"
> +
> +static void force_busted(int fd)
> +{
> +	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
> +	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
> +
> +	xe_force_gt_reset(fd, 0);
> +	sleep(1);
> +}
> +
> +static int rebind_xe(int fd)
> +{
> +	char pci_slot[NAME_MAX];
> +	int sysfs;
> +
> +	igt_device_get_pci_slot_name(fd, pci_slot);
> +
> +	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
> +	igt_assert(sysfs);
> +
> +        igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
> +
> +	/*
> +	 * We need to close the client for a proper release, before
> +	 * binding back again.
> +	 */
> +	close(fd);
> +
> +        igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
> +	close(sysfs);
> +
> +	/* Renew the client connection */
> +	fd = drm_open_driver(DRIVER_XE);
> +	igt_assert(fd);
> +
> +	return fd;
> +}
> +
> +static int simple_ioctl(int fd)
> +{
> +	int ret;
> +
> +	struct drm_xe_vm_create create = {
> +		.extensions = 0,
> +		.flags = 0,
> +	};
> +
> +	ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> +
> +	if (ret == 0)
> +		xe_vm_destroy(fd, create.vm_id);
> +
> +	return ret;
> +}
> +
> +/**
> + * SUBTEST: basic-busted
> + * Description: Force Xe device busted after injecting a failure in GT reset
> + */
> +igt_main
> +{
> +	int fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probability",
> +					       O_RDWR));
> +	}
> +
> +	igt_subtest("basic-busted") {
> +		igt_assert_eq(simple_ioctl(fd), 0);
> +		force_busted(fd);
> +		igt_assert_neq(simple_ioctl(fd), 0);
> +		fd = rebind_xe(fd);
> +		igt_assert_eq(simple_ioctl(fd), 0);
> +	}
> +
> +	igt_fixture {
> +		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
> +			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
> +			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
> +		}
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index a856510fc..87a531051 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -274,6 +274,7 @@ intel_kms_progs = [
>  ]
>  
>  intel_xe_progs = [
> +	'xe_busted',
>  	'xe_ccs',
>  	'xe_create',
>  	'xe_compute',
> -- 
> 2.44.0
> 
