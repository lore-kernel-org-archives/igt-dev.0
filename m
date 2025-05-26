Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBC7C5AD49
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 15:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7830810E3DE;
	Mon, 26 May 2025 15:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkzMQZ3L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E6F10E3DE
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 15:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748274814; x=1779810814;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nUU1albjlqHkgS30K/6iZlmhVOTX+tEfPztuKQ9WnGI=;
 b=OkzMQZ3L19SxvUQHzTfRLjDDOEaEleXp90PkXmdcg0UDFmX2cTFyGiwT
 kNYyVGzvphzOAIWh3EtFZDHemW7dV2NUoLMeYwxvjpOEhrmHOunnQt7bz
 8U+UVxHnS5aFUl/3mzu5ivlO3kB6hkND3sOF2Usb30n5nY8mwly0Br5bl
 EL6l/jhZsaKme7oCncDRZmnruIFvftzpkSpW+uVoRGDM7oF/jTBN+pIoF
 HSztw9vHq3Ssp2WfhHGPkxlU7+ZJfIluF8EmSQGMWCXpEDE5Fn17Gw28Y
 16289yIV70gVy8fYgzllmLN/cgG5A9Voq9SObdgErJe1yGIQAUOIb2RU+ Q==;
X-CSE-ConnectionGUID: yRD4PGuBTNOlbIuwTRA2Eg==
X-CSE-MsgGUID: Npv+QD0lT/uRiMnSCI0aGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50307186"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="50307186"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 08:53:34 -0700
X-CSE-ConnectionGUID: 3mlDGaDnTiqSa4Typ3qy+Q==
X-CSE-MsgGUID: rnib0bDNTFmWoq5GOQiSng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="147657231"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 08:53:33 -0700
Date: Mon, 26 May 2025 17:53:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Dorinda Bassey <dbassey@redhat.com>
Cc: igt-dev@lists.freedesktop.org, javierm@redhat.com, aesteve@redhat.com
Subject: Re: [PATCH] drm_virtgpu: Add functional coverage for core VirtIO-GPU
 ioctls
Message-ID: <20250526155330.t6zb4kzx3aj3hjgs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dorinda Bassey <dbassey@redhat.com>, igt-dev@lists.freedesktop.org,
 javierm@redhat.com, aesteve@redhat.com
References: <20250514102815.1413678-1-dbassey@redhat.com>
 <20250522161904.u4pnwbvxhwncfbyk@kamilkon-DESK.igk.intel.com>
 <CACzuRyzPz7ACirKUpGuEibFqWF3kXV1D-Ur97KeFLdJC-Mu8GA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACzuRyzPz7ACirKUpGuEibFqWF3kXV1D-Ur97KeFLdJC-Mu8GA@mail.gmail.com>
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
On 2025-05-26 at 16:06:07 +0200, Dorinda Bassey wrote:
> Hi Kamil,
> 
> Thank you very much for the reviews!
> 
> please use 'tests/' as a prefix in subject, also change test name,
> > so instead of
> > [PATCH] drm_virtgpu: Add functional coverage for core VirtIO-GPU ioctls
> >
> > better:
> > [PATCH] tests/virtgpu: Add functional coverage for core VirtIO-GPU ioctls
> >
> Ack, but I would rather prefer to use tests/drm_virtgpu instead considering
> that I'm testing DRM ioctls for the virtio-GPU driver and this matches
> other test patterns

Up to you, it could be also tests/drm_virtgpu:
and a test file drm_virtgpu.c

> 
> I would name them without 'drm-virtgpu-' prefix. Up to you.
> >
> I think the drm-virtgpu prefix looks better, I also figured it fits with
> the igt naming convention, like the drm_mm follows this format.
> 
> Could someone from your team help with review?
> 
> Sure @Albert Esteve <aesteve@redhat.com> @Javier Martinez Canillas
> <javierm@redhat.com> could you help?
> 
> Please rename it into virtgpu.c:
> >
> 
> > s/drm_virtgpu.c/virtgpu.c/
> 
> As per the first reply, I believe drm_virtgpu is better

ok

Regards,
Kamil

> 
> 
> > Please move igt headers after system ones.
> 
> Ack
> 
> Remove space from " Testing", so
> 
> Yes, thanks for the catch!
> 
> At least try to open all cardN until you find virtio, there is
> > sometimes simpleDRM driver loaded and then cards could start from 1,
> > /dev/dri/card1
> >
> > What about checking with getversion? For idea see core_getversion test.
> 
>  Right! This makes sense - Thank you for the reference.
> 
> Please do not make initialization with asserts here, I would suggest
> > to move this into a function, for example:
> > int create_resource(int fd, ... other params...)
> >
> > and then calling this before each test. For example:
> >
> > bool create_res(struct drm_virtgpu_resource_create *res)
> > {
> >         if(res->array_size == 1) /* already created */
> >                 return true;
> >
> >         ... rest of creation ...
> > }
> >
> >         igt_subtest("virtgpu-map") {
> >                 ...vars here...
> >
> >                 igt_assert(create_res(&args));
> >
> >
> > Or you could just create it in this fixture without asserts,
> > place asserts in a function check_res() and call it in each
> > subtests which needs them. For example:
> >
> >         igt_subtest("virtgpu-map") {
> >                 ...vars here...
> >
> >                 check_res(&args);
> >
> > This also looks like a good candidate for a separate subtest?
> >
> Yes, Initially I thought about making it a seperate subtest but considering
> that many subtests needed it, I put it in the igt_fixture().
> I will put it in a separate function and create a
> `drm-virtgpu-resource-create` subtest to run it independently, this will
> also enable it to be used by other subtests.
> 
> 
> > Please use C-style comments:
> >                 /* Request mmap offset */
> >
> > Same applies for following code.
> 
> Noted with thanks!
> 
> BR,
> Dorinda Bassey.
> 
> 
> On Thu, May 22, 2025 at 6:20 PM Kamil Konieczny <
> kamil.konieczny@linux.intel.com> wrote:
> 
> > Hi Dorinda,
> > On 2025-05-14 at 12:28:00 +0200, Dorinda Bassey wrote:
> >
> > please use 'tests/' as a prefix in subject, also change test name,
> > so instead of
> > [PATCH] drm_virtgpu: Add functional coverage for core VirtIO-GPU ioctls
> >
> > better:
> > [PATCH] tests/virtgpu: Add functional coverage for core VirtIO-GPU ioctls
> >
> > > This test suite adds coverage for multiple DRM ioctls specific
> > > to the VirtIO-GPU driver, verifying functionality such as
> > > resource creation, memory mapping, 3D transfers, context
> > > initialization, and parameter querying.
> > > Each test validates a key ioctl to ensure correct behavior from
> > > user space and backend implementations. Each subtest is
> > > self-contained and can be executed independently.
> > >
> > > Included subtests:
> > >   - drm-virtgpu-map
> > >   - drm-virtgpu-execbuffer
> > >   - drm-virtgpu-resource-info
> > >   - drm-virtgpu-3d-transfer-to-host
> > >   - drm-virtgpu-3d-transfer-from-host
> > >   - drm-virtgpu-3d-wait
> > >   - drm-virtgpu-resource-create-blob
> > >   - drm-virtgpu-get-caps
> > >   - drm-virtgpu-context-init
> > >   - drm-virtgpu-getparam
> >
> > I would name them without 'drm-virtgpu-' prefix. Up to you.
> >
> > >
> > > How to Test with QEMU virtio-vga-gl or rustvmm vhost-device-gpu
> > >
> > > 1. Launch a QEMU guest with virtio-vga-gl
> > > ./build/qemu-system-x86_64 \
> > >   -enable-kvm \
> > >   -cpu host \
> > >   -m 4096 \
> > >   -machine q35 \
> > >   -display gtk,gl=on \
> > >   -vga none \
> > >   -device virtio-vga-gl \
> > >   -drive file=image.qcow2,format=qcow2 \
> > >   -netdev user,id=n0,hostfwd=tcp::2222-:22 \
> > >   -device virtio-net-pci,netdev=n0
> > >
> > > ssh into the guest and run the tests.
> > >
> > > 2. Start the vhost-device-gpu backend and Launch a QEMU
> > > guest with vhost-user-gpu-pci or vhost-user-vga, see guide on:
> > > https://crates.io/crates/vhost-device-gpu
> >
> > Could someone from your team help with review?
> >
> > >
> > > Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
> > > ---
> > >  tests/drm_virtgpu.c | 388 ++++++++++++++++++++++++++++++++++++++++++++
> >

[...cut...]

> > > diff --git a/tests/meson.build b/tests/meson.build
> > > index 20ddddb89..ac85cac30 100644
> > > --- a/tests/meson.build
> > > +++ b/tests/meson.build
> > > @@ -13,6 +13,7 @@ test_progs = [
> > >       'drm_buddy',
> > >       'drm_mm',
> > >       'drm_read',
> > > +     'drm_virtgpu',
> > >       'fbdev',
> > >       'kms_3d',
> > >       'kms_addfb_basic',
> > > --
> > > 2.48.1
> > >
> >
> >
