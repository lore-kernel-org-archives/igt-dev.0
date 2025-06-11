Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18988C71137
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 17:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F4D10E6DA;
	Wed, 11 Jun 2025 17:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnNc4lsr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2FA10E6DA
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 17:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749661515; x=1781197515;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qWaVAYS8J0VADbr8sbwF8XVmZV5LIj+1L6/eZVI0htE=;
 b=UnNc4lsryRERsOPqYYMTL/Lc933OrfN5dEVNSf5xtbu0qHMMYfEMDDta
 YBaABNP2eWAM/DitlDH5Qknn0lTk5/4GhIFBvoHoUUL8IDu2ZJlwK5IKC
 LqI8U8qUXJ5TcNtORu7S9KjS0IT44dgIox/W51SGykiBEy/ir17BfwQ7v
 f4fR2/N7m2e2WpnElfcDieBLKCorJ68JuTYkgeGg6O+PmfMMgOnEACCMd
 +I5gFWFqPNxpzuVAJGD47CBL8YDT6BdJynrudIU6pp1s4+TNjCci+Srce
 PTxkbMnTivC3HcaGHxwR4OzWC0a6ofoZupE07jOQfUSOumpXJ1t2xJVqY A==;
X-CSE-ConnectionGUID: gxEyyAq9SVOC6i1R9T5ybQ==
X-CSE-MsgGUID: MOPuiJXyTyW9rmqKe7FuTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69375753"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="69375753"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 10:04:24 -0700
X-CSE-ConnectionGUID: uH9NmHDnTTe0zIZx1x77oA==
X-CSE-MsgGUID: 84ni3m/UTx+FMqj5/kci+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="184458875"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 10:04:22 -0700
Date: Wed, 11 Jun 2025 19:04:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Erico Nunes <ernunes@redhat.com>
Cc: Dorinda Bassey <dbassey@redhat.com>, igt-dev@lists.freedesktop.org,
 javierm@redhat.com, aesteve@redhat.com
Subject: Re: [PATCH v4] tests/drm_virtgpu: Add functional coverage for core
 VirtIO-GPU ioctls
Message-ID: <20250611170405.hyn3jomelj5bmla5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Erico Nunes <ernunes@redhat.com>,
 Dorinda Bassey <dbassey@redhat.com>, igt-dev@lists.freedesktop.org,
 javierm@redhat.com, aesteve@redhat.com
References: <20250610163135.1122267-1-dbassey@redhat.com>
 <a1ede824-3651-429a-a269-0e933066b12a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a1ede824-3651-429a-a269-0e933066b12a@redhat.com>
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

Hi Erico,
On 2025-06-11 at 18:10:52 +0200, Erico Nunes wrote:
> Hello,
> 
> On 6/10/25 6:30 PM, Dorinda Bassey wrote:
> > This test suite adds coverage for multiple DRM ioctls specific
> > to the VirtIO-GPU driver, verifying functionality such as
> > resource creation, memory mapping, 3D transfers, context
> > initialization, and parameter querying.
> > Each test validates a key ioctl to ensure correct behavior from
> > user space and backend implementations. Each subtest is
> > self-contained and can be executed independently.
> > 
> > Included subtests:
> >   - drm-virtgpu-map
> >   - drm-virtgpu-execbuffer
> >   - drm-virtgpu-resource-info
> >   - drm-virtgpu-3d-transfer-to-host
> >   - drm-virtgpu-3d-transfer-from-host
> >   - drm-virtgpu-3d-wait
> >   - drm-virtgpu-resource-create-blob
> >   - drm-virtgpu-get-caps
> >   - drm-virtgpu-context-init
> >   - drm-virtgpu-getparam
> > 
> > How to Test with QEMU virtio-vga-gl or rustvmm vhost-device-gpu
> > 
> > 1. Launch a QEMU guest with virtio-vga-gl
> > ./build/qemu-system-x86_64 \
> >   -enable-kvm \
> >   -cpu host \
> >   -m 4096 \
> >   -machine q35 \
> >   -display gtk,gl=on \
> >   -vga none \
> >   -device virtio-vga-gl \
> >   -drive file=image.qcow2,format=qcow2 \
> >   -netdev user,id=n0,hostfwd=tcp::2222-:22 \
> >   -device virtio-net-pci,netdev=n0
> > 
> > ssh into the guest and run the tests.
> > 
> > 2. Start the vhost-device-gpu backend and Launch a QEMU
> > guest with vhost-user-gpu-pci or vhost-user-vga, see guide on:
> > https://crates.io/crates/vhost-device-gpu
> 
> Overall this looks quite good to me. Thanks for doing this initial batch
> of tests for virtio-gpu. I think it is a good start to build upon and
> start enabling some more DRM tests in CIs especially since this can
> astract hardware details.
> 
> I have a couple of comments below, to consider if you will do another
> respin:
> 
> 
> > 
> >  tests/drm_virtgpu.c | 425 ++++++++++++++++++++++++++++++++++++++++++++
> >  tests/meson.build   |   1 +
> >  2 files changed, 426 insertions(+)
> >  create mode 100644 tests/drm_virtgpu.c
> 
> Would it make sense for this to live in its own subdirectory? Since it
> is testing "device-specific" commands (for virtio-gpu being the device).
> I see that some of the other drivers have their own directory, and
> currently this one is bundled together with some fairly generic DRM or
> KMS API tests in meson.build.
> But I'm not sure if there is a policy for this so I'd leave it to the
> igt maintainers.
> 

Lets start with something simple, new folder could be created when
there will be more virtgpu tests.

> > +#define VIRTGPU_DEVICE "/dev/dri/card0"
> 
> VIRTGPU_DEVICE is unused since an earlier revision, so it can be removed.
> 

Thank you for spotting this.

Regards,
Kamil

> > +static const struct {
> > +	const char *name;
> > +	uint64_t id;
> > +} params[] = {
> > +	{"3D_FEATURES", VIRTGPU_PARAM_3D_FEATURES},
> > +	{"CAPSET_QUERY_FIX", VIRTGPU_PARAM_CAPSET_QUERY_FIX},
> > +	{"RESOURCE_BLOB", VIRTGPU_PARAM_RESOURCE_BLOB},
> > +	{"HOST_VISIBLE", VIRTGPU_PARAM_HOST_VISIBLE},
> > +	{"CROSS_DEVICE", VIRTGPU_PARAM_CROSS_DEVICE},
> > +	{"CONTEXT_INIT", VIRTGPU_PARAM_CONTEXT_INIT},
> > +	{"SUPPORTED_CAPSET_IDs", VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs},
> > +	{"EXPLICIT_DEBUG_NAME", VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME},
> > +};
> 
> Might make sense to move this params array to the "drm-virtgpu-getparam"
> subtest since it is only used there.
> 
> Considering these you can add my:
> Reviewed-by: Erico Nunes <ernunes@redhat.com>
> 
> Thanks
> 
> Erico
> 
