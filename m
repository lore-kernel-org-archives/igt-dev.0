Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA9AC7115C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 10:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8435D10E6E6;
	Wed, 25 Jun 2025 10:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fW9iCun8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD15910E6E6
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 10:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750848720; x=1782384720;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XwD5fEhkbSdr3xNCBoNXUKk8TR9TJ6EwJsc5aWhfe4o=;
 b=fW9iCun8eLIXpYNNwGEA8fbl6qWbwSr3VEadsx46VrfZnC+gDY8aDhlC
 47zVHHqELmKB8zW5s5M0Bnhkpdd+4Cn24BDMJOqwCjQp3c1IQDJzitR6U
 ZjobMZpxKB1QilaWqRGD9YUeO1qKa6HhbQYj3iaA7vyOMpjfPyyvmS6EK
 lqilE5t5rsFGRVp6LqdScasuiFbV74OuC8ceGJSRdzjdrDMJTwjCR+TlO
 Q8Mf0bLDys4YX0QQCC52VlH44XdZOM20hpoK150VT88Sm68yqcjRFb8ph
 cpPVPu4G2DxxDfOp/GJTievj9fjS+vfanPOJZRLu0PQNmL2HAKxRxeZAy Q==;
X-CSE-ConnectionGUID: hJqF9/cDQ0CNhO2c4uPX3g==
X-CSE-MsgGUID: +o80fg1ZTkil3UBU2Shh1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56913431"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="56913431"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 03:51:59 -0700
X-CSE-ConnectionGUID: Nryx/8mdRo+vGWpVJ2im9Q==
X-CSE-MsgGUID: yf9q2aTMRv+A07bLD3LrCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="156755901"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:51:55 -0700
Date: Wed, 25 Jun 2025 12:51:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Dorinda Bassey <dbassey@redhat.com>
Cc: igt-dev@lists.freedesktop.org, javierm@redhat.com, aesteve@redhat.com,
 ernunes@redhat.com
Subject: Re: [PATCH v6] tests/drm_virtgpu: Add functional coverage for core
 VirtIO-GPU ioctls
Message-ID: <20250625105151.tyjiyxkl456k4ish@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dorinda Bassey <dbassey@redhat.com>, igt-dev@lists.freedesktop.org,
 javierm@redhat.com, aesteve@redhat.com, ernunes@redhat.com
References: <20250624091735.2603888-1-dbassey@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624091735.2603888-1-dbassey@redhat.com>
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
On 2025-06-24 at 11:17:20 +0200, Dorinda Bassey wrote:
> This test suite adds coverage for multiple DRM ioctls specific
> to the VirtIO-GPU driver, verifying functionality such as
> resource creation, memory mapping, 3D transfers, context
> initialization, and parameter querying.
> Each test validates a key ioctl to ensure correct behavior from
> user space and backend implementations. Each subtest is
> self-contained and can be executed independently.

Thank you for you efforts, I merged it.

Regards,
Kamil

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
> Reviewed-by: Erico Nunes <ernunes@redhat.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/drm_virtgpu.c | 431 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build   |   1 +
>  2 files changed, 432 insertions(+)
>  create mode 100644 tests/drm_virtgpu.c

...cut...

