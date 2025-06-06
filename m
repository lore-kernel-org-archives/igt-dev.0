Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A25C5AD49
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 15:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9FB10E3B7;
	Fri,  6 Jun 2025 15:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hl5Yi6Pp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B72810E3B7
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 15:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749225391; x=1780761391;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rFYmsHtq9FFCAFc36hdxUes8Ddre0dnWxztTujSWw2Y=;
 b=hl5Yi6PpCPUakf4OrfHnITP/ZQ81W167Hel1Cx0dCPMRTJz25/9ixQKa
 89fDksiWltPvFolj7xdZFfqz4objt7mmidR8sLpj3K1qRYzvgJtYfAaVs
 sFq9MR4wKXEwTBglpiY7DvYVJxObRhrTsb9kAFrpR+w3KUO0QwPVhC8cI
 h/PWfeT4YQQ4RufEoWKp18sIG2tALf4zbKM/NUpp+poHV69NreEo0km1Z
 6CssVHQSpdt+R7Bo/hlki3l2LV0BjDpCBY3Hbb5LED24Dir4eaY99KlaO
 /fIMRM2pWuzPHciUAPpCQ5FkY3C4U7SOETy9Dxkg+bKAChTFLT7V4hia8 g==;
X-CSE-ConnectionGUID: 2BMTPz1lRTqcfnYgaj4C9w==
X-CSE-MsgGUID: GA0tS3DzSFaRM67g5IOJIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68820650"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="68820650"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:55:27 -0700
X-CSE-ConnectionGUID: g3BWw21KSzOy73LKztYENA==
X-CSE-MsgGUID: Pm8HzE2URwGVmj5NDtTAOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="176810393"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 08:55:24 -0700
Date: Fri, 6 Jun 2025 17:55:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Dorinda Bassey <dbassey@redhat.com>
Cc: igt-dev@lists.freedesktop.org, javierm@redhat.com, aesteve@redhat.com,
 ernunes@redhat.com
Subject: Re: [PATCH v3] tests/drm_virtgpu: Add functional coverage for core
 VirtIO-GPU ioctls
Message-ID: <20250606155522.2mnzanrvr73yfc6n@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dorinda Bassey <dbassey@redhat.com>, igt-dev@lists.freedesktop.org,
 javierm@redhat.com, aesteve@redhat.com, ernunes@redhat.com
References: <20250530090451.1438981-1-dbassey@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530090451.1438981-1-dbassey@redhat.com>
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

Hi Dorinda,
On 2025-05-30 at 11:02:20 +0200, Dorinda Bassey wrote:
> This test suite adds coverage for multiple DRM ioctls specific
> to the VirtIO-GPU driver, verifying functionality such as
> resource creation, memory mapping, 3D transfers, context
> initialization, and parameter querying.
> Each test validates a key ioctl to ensure correct behavior from
> user space and backend implementations. Each subtest is
> self-contained and can be executed independently.
> 
> Included subtests:
>   - drm-virtgpu-map
>   - drm-virtgpu-execbuffer
>   - drm-virtgpu-resource-info
>   - drm-virtgpu-3d-transfer-to-host
>   - drm-virtgpu-3d-transfer-from-host
>   - drm-virtgpu-3d-wait
>   - drm-virtgpu-resource-create-blob
>   - drm-virtgpu-get-caps
>   - drm-virtgpu-context-init
>   - drm-virtgpu-getparam
> 
> How to Test with QEMU virtio-vga-gl or rustvmm vhost-device-gpu
> 
> 1. Launch a QEMU guest with virtio-vga-gl
> ./build/qemu-system-x86_64 \
>   -enable-kvm \
>   -cpu host \
>   -m 4096 \
>   -machine q35 \
>   -display gtk,gl=on \
>   -vga none \
>   -device virtio-vga-gl \
>   -drive file=image.qcow2,format=qcow2 \
>   -netdev user,id=n0,hostfwd=tcp::2222-:22 \
>   -device virtio-net-pci,netdev=n0
> 
> ssh into the guest and run the tests.
> 
> 2. Start the vhost-device-gpu backend and Launch a QEMU
> guest with vhost-user-gpu-pci or vhost-user-vga, see guide on:
> https://crates.io/crates/vhost-device-gpu
> 
> Signed-off-by: Dorinda Bassey <dbassey@redhat.com>

Please use checkpatch.pl script from Linux kernel, for usefull
options see CONTRIBUTING.md
You could ignore MAINTAINER or CamelCase but please fix others.

With that fixed
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

I will wait with merge for a review from someone in your Cc list.

One more nit below.

> ---
> v3:
> Fix resource format and clarify capset IDs
> 
>  tests/drm_virtgpu.c | 420 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build   |   1 +
>  2 files changed, 421 insertions(+)
>  create mode 100644 tests/drm_virtgpu.c
> 
> diff --git a/tests/drm_virtgpu.c b/tests/drm_virtgpu.c
> new file mode 100644
> index 000000000..4d7c9e8f5
> --- /dev/null
> +++ b/tests/drm_virtgpu.c
> @@ -0,0 +1,420 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Red Hat Inc.
> + *
> + * Authors: Dorinda Bassey <dbassey@redhat.com>
> + */
> +
> +/**
> + * TEST: drm virtgpu ioctls
> + * Description: Testing of the virtIO-GPU driver DRM ioctls
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category:  virtIO-GPU DRM ioctls
> + * Functionality: drm_ioctls
> + * Feature: Virtualization graphics support
> + * Test category: functionality test
> + */
> +
> +#include <fcntl.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +
> +#include "drm.h"
> +#include "virtgpu_drm.h"
> +#include "igt.h"
> +
> +/**
> + * SUBTEST: drm-virtgpu-map
> + *
> + * SUBTEST: drm-virtgpu-execbuffer
> + *
> + * SUBTEST: drm-virtgpu-resource-info
> + *
> + * SUBTEST: drm-virtgpu-3d-transfer-to-host
> + *
> + * SUBTEST: drm-virtgpu-3d-transfer-from-host
> + *
> + * SUBTEST: drm-virtgpu-3d-wait
> + *
> + * SUBTEST: drm-virtgpu-resource-create
> + *
> + * SUBTEST: drm-virtgpu-resource-create-blob
> + *
> + * SUBTEST: drm-virtgpu-get-caps
> +
> + * SUBTEST: drm-virtgpu-context-init
> + *
> + * SUBTEST: drm-virtgpu-getparam
> + */
> +
> +IGT_TEST_DESCRIPTION("Testing of the virtIO-GPU driver DRM ioctls");
> +
> +#define VIRTGPU_DEVICE "/dev/dri/card0"
> +
> +#define CAPS_BUFFER_SIZE 4096
> +#define MAX_CARDS 16
> +
> +int drm_fd;
> +struct drm_virtgpu_resource_create args;
> +bool resource_created;
> +
> +static int open_virtgpu_device(void)
> +{
> +	drmVersionPtr version;
> +
> +	for (int i = 0; i < MAX_CARDS; i++) {
> +		char path[64];
> +
> +		snprintf(path, sizeof(path), "/dev/dri/card%d", i);
> +		drm_fd = open(path, O_RDWR | O_CLOEXEC);
> +		if (drm_fd < 0)
> +			continue;
> +
> +		version = drmGetVersion(drm_fd);
> +		if (version && strcmp(version->name, "virtio_gpu") == 0) {
> +			drmFreeVersion(version);

You could print path here (with igt_info or igt_debug).

> +			return drm_fd;
> +		}
> +
> +		drmFreeVersion(version);
> +		close(drm_fd);
> +	}

Same here, you could print number of opened devices (with drm_fd >=0)

Regards,
Kamil

> +	return -1;
> +}
> +
> +static const struct {
> +	const char *name;
> +	uint64_t id;
> +} params[] = {
> +	{"3D_FEATURES", VIRTGPU_PARAM_3D_FEATURES},
> +	{"CAPSET_QUERY_FIX", VIRTGPU_PARAM_CAPSET_QUERY_FIX},
> +	{"RESOURCE_BLOB", VIRTGPU_PARAM_RESOURCE_BLOB},
> +	{"HOST_VISIBLE", VIRTGPU_PARAM_HOST_VISIBLE},
> +	{"CROSS_DEVICE", VIRTGPU_PARAM_CROSS_DEVICE},
> +	{"CONTEXT_INIT", VIRTGPU_PARAM_CONTEXT_INIT},
> +	{"SUPPORTED_CAPSET_IDs", VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs},
> +	{"EXPLICIT_DEBUG_NAME", VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME},
> +};
> +

...cut...

> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 20ddddb89..ac85cac30 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -13,6 +13,7 @@ test_progs = [
>  	'drm_buddy',
>  	'drm_mm',
>  	'drm_read',
> +	'drm_virtgpu',
>  	'fbdev',
>  	'kms_3d',
>  	'kms_addfb_basic',
> -- 
> 2.48.1
> 
