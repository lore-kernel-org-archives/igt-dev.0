Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2677DC54FB3
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 14:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C222A10E30A;
	Mon, 26 May 2025 14:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="djOEYMfT";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4CB10E30A
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748268382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MR4TOhyLqQ3zpDo0sxq+4igMeAhxJnHi0puUIncFq94=;
 b=djOEYMfTkGTHfReIwcKoinvLEysJqgAfJtVa0GaG2flpZ9Cdi7qDCghQCgjbetb7KspOwc
 S5o1pkFMNK6VMctDHSo4O3D4fODGbR7CaQi4ZmXHQZa0d7gJBiWPfnRrlS6KgXTkrK40s1
 +1CV3SHXdXyBFHDpnz411xnDfRFwe9Y=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-00IkB3ENPQ-PLpakbvkFTw-1; Mon, 26 May 2025 10:06:20 -0400
X-MC-Unique: 00IkB3ENPQ-PLpakbvkFTw-1
X-Mimecast-MFC-AGG-ID: 00IkB3ENPQ-PLpakbvkFTw_1748268380
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-86465e3f1c6so280109739f.1
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 07:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748268380; x=1748873180;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MR4TOhyLqQ3zpDo0sxq+4igMeAhxJnHi0puUIncFq94=;
 b=v8afsFCdLv9TQqkGWJhm6kUoU2+ljrIAp4fMki7eqvk82BOY0EovQUmC943tYRr5Hy
 +07YNZ6OfYbwE0ztDMhCRSmj2ySQdRzSxriw51m+6Ed4AF1L6g44spiuN09olvYWOi7C
 6TcWEfIYamyL6KVbZ9+ytMuKRViBGGY1jd3VGavDztrEvKJ+mBHNJ6ogw8Yjof7+A8JH
 bsuQ+ZXYpLkCLjiNJMJxd4EvFYn31Kx+w7VbjZVJP1E1PiQyzveXECmVwk70YrdYs1OX
 roI//+k5SJheRD0jXeE0w3icKpw9orJa5KPwVkcnqLqVq/6OL15zmibAmGlx40n+TLs3
 O0kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVrbQtQuWmwYRUMJQqwnVbr/YP8TiBZK9B9Xm9sL0Bg0zAQ9zwHdoL3nGYeBqrax+KxPATa5Hv@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3KCOn4ikiNqMkyPI1U5DtVoySXaQ3ddwrW0klyl7RhgpkixvM
 X/4tPdqIvzKft5DtQdaObgKbkpB9ve/tePrUd6Yle6eKX4OHUQqi3olfQHWmw3htJrqkv7SJ2Fa
 8gja0nTiVZX4T9UK9xMRKLTGkrP8i93I71wKlmri80qglB/RIea8a/mbdm4NO+KufLy8NqFrCxW
 WuPQEzTaig3h7CwCD/bkqTwn0DRaEF0cvw2emNn/PrEQ==
X-Gm-Gg: ASbGnct4Ycy4gWOYIr1YOZbMUvDZHx8ncEyS+nAg7livCX1H0MgaP2T4rQvvc1Fzhgh
 YYcXDFRFcLQ4iR4xcl00b3ygvKXve819MRZ1COZQM/9n6uf6vrrPypieUxqo+SEjOpGjerqM=
X-Received: by 2002:a92:d744:0:b0:3dc:79e5:ea30 with SMTP id
 e9e14a558f8ab-3dc92c1dbadmr89642935ab.9.1748268379748; 
 Mon, 26 May 2025 07:06:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoZ2K5or/PM4WhHy0H7jkpA6bRzH0RlprPjcuXzThIQKomuHmTDfNOpSAGrxV+S57QixL56DB/+niraxG5mDc=
X-Received: by 2002:a92:d744:0:b0:3dc:79e5:ea30 with SMTP id
 e9e14a558f8ab-3dc92c1dbadmr89642655ab.9.1748268379165; Mon, 26 May 2025
 07:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250514102815.1413678-1-dbassey@redhat.com>
 <20250522161904.u4pnwbvxhwncfbyk@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250522161904.u4pnwbvxhwncfbyk@kamilkon-DESK.igk.intel.com>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Mon, 26 May 2025 16:06:07 +0200
X-Gm-Features: AX0GCFuqjp9P9GX_IpQYPricHcKFJmkG0nsyz-lmISvvVQprbE2HXVDKAEqgu7Y
Message-ID: <CACzuRyzPz7ACirKUpGuEibFqWF3kXV1D-Ur97KeFLdJC-Mu8GA@mail.gmail.com>
Subject: Re: [PATCH] drm_virtgpu: Add functional coverage for core VirtIO-GPU
 ioctls
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dorinda Bassey <dbassey@redhat.com>, 
 igt-dev@lists.freedesktop.org, javierm@redhat.com, aesteve@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Sucgs8tSLB7cVSpSbhCwchEzRkZwAnYxxXv74uk4cPM_1748268380
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b6665606360a735a"
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

--000000000000b6665606360a735a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

Thank you very much for the reviews!

please use 'tests/' as a prefix in subject, also change test name,
> so instead of
> [PATCH] drm_virtgpu: Add functional coverage for core VirtIO-GPU ioctls
>
> better:
> [PATCH] tests/virtgpu: Add functional coverage for core VirtIO-GPU ioctls
>
Ack, but I would rather prefer to use tests/drm_virtgpu instead considering
that I'm testing DRM ioctls for the virtio-GPU driver and this matches
other test patterns

I would name them without 'drm-virtgpu-' prefix. Up to you.
>
I think the drm-virtgpu prefix looks better, I also figured it fits with
the igt naming convention, like the drm_mm follows this format.

Could someone from your team help with review?

Sure @Albert Esteve <aesteve@redhat.com> @Javier Martinez Canillas
<javierm@redhat.com> could you help?

Please rename it into virtgpu.c:
>

> s/drm_virtgpu.c/virtgpu.c/

As per the first reply, I believe drm_virtgpu is better


> Please move igt headers after system ones.

Ack

Remove space from " Testing", so

Yes, thanks for the catch!

At least try to open all cardN until you find virtio, there is
> sometimes simpleDRM driver loaded and then cards could start from 1,
> /dev/dri/card1
>
> What about checking with getversion? For idea see core_getversion test.

 Right! This makes sense - Thank you for the reference.

Please do not make initialization with asserts here, I would suggest
> to move this into a function, for example:
> int create_resource(int fd, ... other params...)
>
> and then calling this before each test. For example:
>
> bool create_res(struct drm_virtgpu_resource_create *res)
> {
>         if(res->array_size =3D=3D 1) /* already created */
>                 return true;
>
>         ... rest of creation ...
> }
>
>         igt_subtest("virtgpu-map") {
>                 ...vars here...
>
>                 igt_assert(create_res(&args));
>
>
> Or you could just create it in this fixture without asserts,
> place asserts in a function check_res() and call it in each
> subtests which needs them. For example:
>
>         igt_subtest("virtgpu-map") {
>                 ...vars here...
>
>                 check_res(&args);
>
> This also looks like a good candidate for a separate subtest?
>
Yes, Initially I thought about making it a seperate subtest but considering
that many subtests needed it, I put it in the igt_fixture().
I will put it in a separate function and create a
`drm-virtgpu-resource-create` subtest to run it independently, this will
also enable it to be used by other subtests.


> Please use C-style comments:
>                 /* Request mmap offset */
>
> Same applies for following code.

Noted with thanks!

BR,
Dorinda Bassey.


On Thu, May 22, 2025 at 6:20=E2=80=AFPM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Dorinda,
> On 2025-05-14 at 12:28:00 +0200, Dorinda Bassey wrote:
>
> please use 'tests/' as a prefix in subject, also change test name,
> so instead of
> [PATCH] drm_virtgpu: Add functional coverage for core VirtIO-GPU ioctls
>
> better:
> [PATCH] tests/virtgpu: Add functional coverage for core VirtIO-GPU ioctls
>
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
>
> I would name them without 'drm-virtgpu-' prefix. Up to you.
>
> >
> > How to Test with QEMU virtio-vga-gl or rustvmm vhost-device-gpu
> >
> > 1. Launch a QEMU guest with virtio-vga-gl
> > ./build/qemu-system-x86_64 \
> >   -enable-kvm \
> >   -cpu host \
> >   -m 4096 \
> >   -machine q35 \
> >   -display gtk,gl=3Don \
> >   -vga none \
> >   -device virtio-vga-gl \
> >   -drive file=3Dimage.qcow2,format=3Dqcow2 \
> >   -netdev user,id=3Dn0,hostfwd=3Dtcp::2222-:22 \
> >   -device virtio-net-pci,netdev=3Dn0
> >
> > ssh into the guest and run the tests.
> >
> > 2. Start the vhost-device-gpu backend and Launch a QEMU
> > guest with vhost-user-gpu-pci or vhost-user-vga, see guide on:
> > https://crates.io/crates/vhost-device-gpu
>
> Could someone from your team help with review?
>
> >
> > Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
> > ---
> >  tests/drm_virtgpu.c | 388 ++++++++++++++++++++++++++++++++++++++++++++
>
> Please rename it into virtgpu.c:
>
> s/drm_virtgpu.c/virtgpu.c/
>
> >  tests/meson.build   |   1 +
> >  2 files changed, 389 insertions(+)
> >  create mode 100644 tests/drm_virtgpu.c
> >
> > diff --git a/tests/drm_virtgpu.c b/tests/drm_virtgpu.c
> > new file mode 100644
> > index 000000000..8de7880db
> > --- /dev/null
> > +++ b/tests/drm_virtgpu.c
> > @@ -0,0 +1,388 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =C2=A9 2025 Red Hat Inc.
> > + *
> > + * Authors: Dorinda Bassey <dbassey@redhat.com>
> > + */
> > +
> > +/**
> > + * TEST: drm virtgpu ioctls
> > + * Description: Testing of the virtIO-GPU driver DRM ioctls
> > + * Category: Core
> > + * Mega feature: General Core features
> > + * Sub-category:  virtIO-GPU DRM ioctls
> > + * Functionality: drm_ioctls
> > + * Feature: Virtualization graphics support
> > + * Test category: functionality test
> > + */
> > +
> > +#include "igt.h"
> > +
> > +#include "drm.h"
> > +#include "virtgpu_drm.h"
>
> Please move igt headers after system ones.
>
> > +
> > +#include <fcntl.h>
> > +#include <errno.h>
> > +#include <string.h>
> > +#include <sys/ioctl.h>
> > +
> > +/**
> > + * SUBTEST: drm-virtgpu-map
> > + *
> > + * SUBTEST: drm-virtgpu-execbuffer
> > + *
> > + * SUBTEST: drm-virtgpu-resource-info
> > + *
> > + * SUBTEST: drm-virtgpu-3d-transfer-to-host
> > + *
> > + * SUBTEST: drm-virtgpu-3d-transfer-from-host
> > + *
> > + * SUBTEST: drm-virtgpu-3d-wait
> > + *
> > + * SUBTEST: drm-virtgpu-resource-create-blob
> > + *
> > + * SUBTEST: drm-virtgpu-get-caps
> > +
> > + * SUBTEST: drm-virtgpu-context-init
> > + *
> > + * SUBTEST: drm-virtgpu-getparam
> > + */
> > +
> > +IGT_TEST_DESCRIPTION(" Testing of the virtIO-GPU driver DRM ioctls");
>
> Remove space from " Testing", so
> IGT_TEST_DESCRIPTION("Testing of the virtIO-GPU driver DRM ioctls");
>
> > +
> > +#define VIRTGPU_DEVICE "/dev/dri/card0"
>
> At least try to open all cardN until you find virtio, there is
> sometimes simpleDRM driver loaded and then cards could start from 1,
> /dev/dri/card1
>
> What about checking with getversion? For idea see core_getversion test.
>
> > +
> > +#define CAPS_BUFFER_SIZE 4096
> > +
> > +static const struct {
> > +     const char *name;
> > +     uint64_t id;
> > +} params[] =3D {
> > +     {"3D_FEATURES", VIRTGPU_PARAM_3D_FEATURES},
> > +     {"CAPSET_QUERY_FIX", VIRTGPU_PARAM_CAPSET_QUERY_FIX},
> > +     {"RESOURCE_BLOB", VIRTGPU_PARAM_RESOURCE_BLOB},
> > +     {"HOST_VISIBLE", VIRTGPU_PARAM_HOST_VISIBLE},
> > +     {"CROSS_DEVICE", VIRTGPU_PARAM_CROSS_DEVICE},
> > +     {"CONTEXT_INIT", VIRTGPU_PARAM_CONTEXT_INIT},
> > +     {"SUPPORTED_CAPSET_IDs", VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs},
> > +     {"EXPLICIT_DEBUG_NAME", VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME},
> > +};
> > +
> > +static void test_capset(int drm_fd, uint32_t capset_id)
> > +{
> > +     uint8_t *caps_buf;
> > +     struct drm_virtgpu_get_caps caps;
> > +     int ret;
> > +     int i;
> > +
> > +     caps_buf =3D malloc(CAPS_BUFFER_SIZE);
> > +     igt_require(caps_buf);
> > +     memset(caps_buf, 0, CAPS_BUFFER_SIZE);
> > +
> > +     memset(&caps, 0, sizeof(caps));
> > +     caps.cap_set_id =3D capset_id;
> > +     caps.size =3D CAPS_BUFFER_SIZE;
> > +     caps.addr =3D (uintptr_t) caps_buf;
> > +
> > +     ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_GET_CAPS, &caps);
> > +     if (ret =3D=3D 0) {
> > +             igt_info("Capset ID %u: SUCCESS\n", capset_id);
> > +             igt_info("  Reported size: %u\n", caps.size);
> > +             igt_info("  First 16 bytes: ");
> > +             for (i =3D 0; i < 16; i++)
> > +                     igt_info("%02x ", caps_buf[i]);
> > +             igt_info("\n");
> > +     } else {
> > +             igt_info("Capset ID %u: FAILED - %s\n", capset_id,
> > +                      strerror(errno));
> > +     }
> > +
> > +     free(caps_buf);
> > +}
> > +
> > +igt_main {
> > +     int drm_fd;
> > +     void *caps_buf =3D NULL;
> > +
> > +     struct drm_virtgpu_resource_create args;
> > +     bool resource_created =3D false;
> > +
> > +     igt_fixture {
> > +             int ret;
> > +
> > +             drm_fd =3D open(VIRTGPU_DEVICE, O_RDWR | O_CLOEXEC);
> > +             igt_require(drm_fd >=3D 0);
> > +
> > +             caps_buf =3D malloc(CAPS_BUFFER_SIZE);
> > +             igt_require(caps_buf);
> > +             memset(caps_buf, 0, CAPS_BUFFER_SIZE);
> > +
> > +             // Create resource
> > +             memset(&args, 0, sizeof(args));
> > +             args.target =3D 2;
> > +             args.format =3D 87;
> > +             args.bind =3D (1 << 0);
> > +             args.width =3D 64;
> > +             args.height =3D 64;
> > +             args.depth =3D 1;
> > +             args.array_size =3D 1;
> > +
> > +             ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_RESOURCE_CREATE,
> &args);
> > +             igt_assert_f(ret =3D=3D 0, "RESOURCE_CREATE failed: %s\n"=
,
> > +                          strerror(errno));
> > +             igt_assert_neq(args.res_handle, 0);
> > +
> > +             resource_created =3D true;
> > +             igt_info("Created resource: res_handle=3D%u, bo_handle=3D=
%u\n",
> > +                      args.res_handle, args.bo_handle);
>
> Please do not make initialization with asserts here, I would suggest
> to move this into a function, for example:
> int create_resource(int fd, ... other params...)
>
> and then calling this before each test. For example:
>
> bool create_res(struct drm_virtgpu_resource_create *res)
> {
>         if(res->array_size =3D=3D 1) /* already created */
>                 return true;
>
>         ... rest of creation ...
> }
>
>         igt_subtest("virtgpu-map") {
>                 ...vars here...
>
>                 igt_assert(create_res(&args));
>
>
> Or you could just create it in this fixture without asserts,
> place asserts in a function check_res() and call it in each
> subtests which needs them. For example:
>
>         igt_subtest("virtgpu-map") {
>                 ...vars here...
>
>                 check_res(&args);
>
> This also looks like a good candidate for a separate subtest?
>
> > +     }
> > +
> > +     igt_describe
> > +         ("Maps a buffer object and tests read/write access via mmap."=
);
> > +     igt_subtest("drm-virtgpu-map") {
> > +             struct drm_virtgpu_map map =3D { };
> > +             void *map_ptr;
> > +             int ret;
> > +
> > +             memset(&map, 0, sizeof(map));
> > +             map.handle =3D args.bo_handle;
> > +
> > +             // Request mmap offset
>
> Please use C-style comments:
>                 /* Request mmap offset */
>
> Same applies for following code.
>
> Regards,
> Kamil
>
> > +             ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_MAP, &map);
> > +             igt_assert_f(ret =3D=3D 0, "MAP ioctl failed: %s\n",
> > +                          strerror(errno));
> > +             igt_assert(map.offset !=3D 0);
> > +
> > +             // Try mmap
> > +             map_ptr =3D
> > +                 mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED,
> drm_fd,
> > +                      map.offset);
> > +             igt_assert(map_ptr !=3D MAP_FAILED);
> > +
> > +             igt_info("Successfully mmap'ed BO: offset=3D0x%lx\n",
> > +                      (unsigned long)map.offset);
> > +
> > +             // Simple test: write and read
> > +             memset(map_ptr, 0xaa, 4096);
> > +             igt_assert(((uint8_t *) map_ptr)[0] =3D=3D 0xaa);
> > +
> > +             munmap(map_ptr, 4096);
> > +     }
> > +
> > +     igt_describe("Submits a dummy execbuffer to the GPU.");
> > +     igt_subtest("drm-virtgpu-execbuffer") {
> > +             struct drm_virtgpu_execbuffer execbuf =3D { };
> > +             uint32_t handles[1];
> > +             int ret;
> > +
> > +             handles[0] =3D args.bo_handle;
> > +
> > +             // Submit dummy execbuffer
> > +             execbuf.flags =3D 0;
> > +             execbuf.size =3D 0;       // No command
> > +             execbuf.command =3D 0;    // No command buffer
> > +             execbuf.bo_handles =3D (uintptr_t) handles;
> > +             execbuf.num_bo_handles =3D 1;
> > +             execbuf.fence_fd =3D -1;  // No fence
> > +             execbuf.ring_idx =3D 0;   // Default ring
> > +
> > +             ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_EXECBUFFER,
> &execbuf);
> > +             igt_assert_f(ret =3D=3D 0, "EXECBUFFER ioctl failed: %s\n=
",
> > +                          strerror(errno));
> > +
> > +             igt_info("EXECBUFFER submitted successfully.\n");
> > +     }
> > +
> > +     igt_describe
> > +         ("Validates that the GPU resource info ioctl returns expected
> metadata.");
> > +     igt_subtest("drm-virtgpu-resource-info") {
> > +             struct drm_virtgpu_resource_info info;
> > +             int ret;
> > +
> > +             igt_require_f(resource_created,
> > +                           "Resource must be created before this test"=
);
> > +
> > +             memset(&info, 0, sizeof(info));
> > +             info.bo_handle =3D args.bo_handle;
> > +
> > +             ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_RESOURCE_INFO,
> &info);
> > +             igt_assert_f(ret =3D=3D 0, "RESOURCE_INFO failed: %s\n",
> > +                          strerror(errno));
> > +             igt_assert_eq(info.res_handle, args.res_handle);
> > +             igt_assert(info.size > 0);
> > +
> > +             igt_info("Queried resource info:\n");
> > +             igt_info("  size:      %u bytes\n", info.size);
> > +             igt_info("  res_handle %u\n", info.res_handle);
> > +             igt_info("  blob_mem:  %u\n", info.blob_mem);
> > +     }
> > +
> > +     igt_describe
> > +         ("Transfers buffer contents from guest memory to the host.");
> > +     igt_subtest("drm-virtgpu-3d-transfer-to-host") {
> > +             int ret;
> > +             struct drm_virtgpu_3d_transfer_to_host xfer =3D {
> > +                     .bo_handle =3D args.bo_handle,
> > +                     .box =3D {
> > +                     .x =3D 0,
> > +                     .y =3D 0,
> > +                     .z =3D 0,
> > +                     .w =3D args.width,
> > +                     .h =3D args.height,
> > +                     .d =3D 1,
> > +                     },
> > +                     .level =3D 0,
> > +                     .offset =3D 0,
> > +                     .stride =3D 0,
> > +                     .layer_stride =3D 0,
> > +             };
> > +
> > +             igt_require_f(resource_created,
> > +         "Resource must be created before this test");
> > +
> > +             ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_TRANSFER_TO_HOST,
> &xfer);
> > +             igt_assert_f(ret =3D=3D 0, "TRANSFER_TO_HOST failed: %s\n=
",
> > +                          strerror(errno));
> > +             igt_info("TRANSFER_TO_HOST completed\n");
> > +     }
> > +
> > +     igt_describe("Transfers buffer contents from the host to guest
> memory.");
> > +     igt_subtest("drm-virtgpu-3d-transfer-from-host")
> > +     {
> > +             int ret;
> > +             struct drm_virtgpu_3d_transfer_from_host xfer_in =3D {
> > +                     .bo_handle =3D args.bo_handle,
> > +                     .box =3D {
> > +                     .x =3D 0,
> > +                     .y =3D 0,
> > +                     .z =3D 0,
> > +                     .w =3D args.width,
> > +                     .h =3D args.height,
> > +                     .d =3D 1,
> > +                     },
> > +                     .level =3D 0,
> > +                     .offset =3D 0,
> > +                     .stride =3D 0,
> > +                     .layer_stride =3D 0,
> > +             };
> > +
> > +     igt_require_f(resource_created,
> > +         "Resource must be created before this test");
> > +
> > +     ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_TRANSFER_FROM_HOST,
> &xfer_in);
> > +     igt_assert_f(ret =3D=3D 0, "TRANSFER_FROM_HOST failed: %s\n",
> strerror(errno));
> > +     igt_info("TRANSFER_FROM_HOST completed\n");
> > +     }
> > +
> > +     igt_describe
> > +         ("Waits for a GPU operation to complete on a specific
> resource.");
> > +     igt_subtest("drm-virtgpu-3d-wait") {
> > +             struct drm_virtgpu_3d_wait wait =3D {.handle =3D
> args.bo_handle };
> > +
> > +             int ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_WAIT, &wait);
> > +
> > +             if (ret =3D=3D 0)
> > +                     igt_info("WAIT succeeded.\n");
> > +             else
> > +                     igt_info("WAIT failed as expected (%s).\n",
> > +                              strerror(errno));
> > +     }
> > +
> > +     igt_describe
> > +         ("Creates a GPU resource using the blob interface with memory
> flags.");
> > +     igt_subtest("drm-virtgpu-resource-create-blob") {
> > +             struct drm_virtgpu_resource_create_blob blob =3D {
> > +                     .blob_mem =3D VIRTGPU_BLOB_MEM_GUEST,
> > +                     .blob_flags =3D
> > +                         VIRTGPU_BLOB_FLAG_USE_MAPPABLE |
> > +                         VIRTGPU_BLOB_FLAG_USE_SHAREABLE,
> > +                     .size =3D 4096,
> > +                     .blob_id =3D 0,
> > +                     .cmd_size =3D 0,
> > +                     .cmd =3D (uintptr_t) NULL,
> > +             };
> > +
> > +             int ret =3D
> > +                 ioctl(drm_fd, DRM_IOCTL_VIRTGPU_RESOURCE_CREATE_BLOB,
> > +                       &blob);
> > +             igt_assert_f(ret =3D=3D 0, "Blob creation ioctl failed: %=
s\n",
> > +                          strerror(errno));
> > +             igt_assert_eq(ret, 0);
> > +             igt_assert_neq(blob.res_handle, 0);
> > +     }
> > +
> > +     igt_describe
> > +         ("Queries different GPU capsets and prints the response
> payload.");
> > +     igt_subtest("drm-virtgpu-get-caps") {
> > +             // Test multiple capsets
> > +             test_capset(drm_fd, 1); // VirGL
> > +             test_capset(drm_fd, 2); // GFXSTREAM
> > +             test_capset(drm_fd, 9999);      // Invalid (expect failur=
e)
> > +     }
> > +
> > +     igt_describe
> > +         ("Initializes a GPU context with parameters like capset ID an=
d
> debug name.");
> > +     igt_subtest("drm-virtgpu-context-init") {
> > +             struct drm_virtgpu_context_set_param ctx_params[2];
> > +             struct drm_virtgpu_context_init ctx_init;
> > +             int ret;
> > +
> > +             memset(ctx_params, 0, sizeof(ctx_params));
> > +
> > +             ctx_params[0].param =3D VIRTGPU_CONTEXT_PARAM_CAPSET_ID;
> > +             ctx_params[0].value =3D 1;
> > +
> > +             ctx_params[1].param =3D VIRTGPU_CONTEXT_PARAM_DEBUG_NAME;
> > +             ctx_params[1].value =3D (uintptr_t) "IGT-Test-Context";
> > +
> > +             memset(&ctx_init, 0, sizeof(ctx_init));
> > +             ctx_init.num_params =3D 2;
> > +             ctx_init.ctx_set_params =3D (uintptr_t)&ctx_params[0];
> > +
> > +             ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_CONTEXT_INIT,
> &ctx_init);
> > +             if (ret =3D=3D -1 && errno =3D=3D EEXIST) {
> > +                     igt_info
> > +                         ("CONTEXT_INIT with params failed as expected
> (already initialized)\n");
> > +             } else {
> > +                     igt_assert_f(ret =3D=3D 0,
> > +                                  "CONTEXT_INIT with params ioctl
> failed: %s\n",
> > +                                  strerror(errno));
> > +                     igt_info("CONTEXT_INIT with parameters
> succeeded\n");
> > +             }
> > +     }
> > +
> > +     igt_describe
> > +         ("Verifies which VirtIO-GPU features are supported by queryin=
g
> driver parameters.");
> > +     igt_subtest("drm-virtgpu-getparam") {
> > +             bool found_supported =3D false;
> > +             uint64_t actual_value =3D 0;
> > +
> > +             for (size_t i =3D 0; i < ARRAY_SIZE(params); i++) {
> > +                     struct drm_virtgpu_getparam gp =3D {
> > +                             .param =3D params[i].id,
> > +                             .value =3D (uintptr_t)&actual_value,
> > +                     };
> > +
> > +                     int ret =3D
> > +                         ioctl(drm_fd, DRM_IOCTL_VIRTGPU_GETPARAM, &gp=
);
> > +                     if (ret =3D=3D 0) {
> > +                             found_supported =3D true;
> > +                             igt_info("GETPARAM %s (ID=3D%lu): value =
=3D
> %llu\n",
> > +                                      params[i].name, params[i].id,
> > +                                      gp.value);
> > +                     } else {
> > +                             igt_info("GETPARAM %s (ID=3D%lu): failed =
-
> %s\n",
> > +                                      params[i].name, params[i].id,
> > +                                      strerror(errno));
> > +                     }
> > +             }
> > +
> > +             igt_assert_f(found_supported,
> > +                          "No GETPARAM query returned a value.");
> > +     }
> > +
> > +     igt_fixture {
> > +             free(caps_buf);
> > +             close(drm_fd);
> > +     }
> > +}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 20ddddb89..ac85cac30 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -13,6 +13,7 @@ test_progs =3D [
> >       'drm_buddy',
> >       'drm_mm',
> >       'drm_read',
> > +     'drm_virtgpu',
> >       'fbdev',
> >       'kms_3d',
> >       'kms_addfb_basic',
> > --
> > 2.48.1
> >
>
>

--000000000000b6665606360a735a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Kamil,</div><div><br></div><div>Thank you very muc=
h for the reviews!</div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">please use &#39;tests/&#39; as a prefix in subject, also chan=
ge test name,<br>
so instead of<br>
[PATCH] drm_virtgpu: Add functional coverage for core VirtIO-GPU ioctls<br>
<br>
better:<br>
[PATCH] tests/virtgpu: Add functional coverage for core VirtIO-GPU ioctls<s=
pan class=3D"gmail-im"><br></span></blockquote><div>Ack, but I would rather=
 prefer to use tests/drm_virtgpu instead considering that I&#39;m testing D=
RM ioctls for the virtio-GPU driver and this matches other test patterns</d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I would name them without &#39;drm-virtgpu-&#39; prefix. Up to you.<span cl=
ass=3D"gmail-im"><br></span></blockquote><div>I think the drm-virtgpu prefi=
x looks better, I also figured it fits with the igt naming convention, like=
 the drm_mm follows this format.</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Could someone from your team help with review?</blockquote><div>Sure=C2=A0<=
a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=3D"mailto:aesteve@r=
edhat.com" tabindex=3D"-1">@Albert Esteve</a>=C2=A0<a class=3D"gmail_plusre=
ply" id=3D"plusReplyChip-1" href=3D"mailto:javierm@redhat.com" tabindex=3D"=
-1">@Javier Martinez Canillas</a> could you help? <br></div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Please rename it into vir=
tgpu.c: <br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
s/drm_virtgpu.c/virtgpu.c/</blockquote><div>As per the first reply, I belie=
ve drm_virtgpu is better</div><div>=C2=A0<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><span class=3D"gmail-im"></span> Please move igt =
headers after system ones.</blockquote><div>Ack</div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
Remove space from &quot; Testing&quot;, so</blockquote><div>Yes, thanks for=
 the catch!</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">At least try to open all cardN until you find virtio, there is<br>
sometimes simpleDRM driver loaded and then cards could start from 1,<br>
/dev/dri/card1<br>
<br>
What about checking with getversion? For idea see core_getversion test.</bl=
ockquote><div>=C2=A0Right! This makes sense - Thank you for the reference.<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Pleas=
e do not make initialization with asserts here, I would suggest<br>
to move this into a function, for example:<br>
int create_resource(int fd, ... other params...)<br>
<br>
and then calling this before each test. For example:<br>
<br>
bool create_res(struct drm_virtgpu_resource_create *res)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(res-&gt;array_size =3D=3D 1) /* already crea=
ted */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ... rest of creation ...<br>
}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_subtest(&quot;virtgpu-map&quot;) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...vars here...<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_assert(create_r=
es(&amp;args));<br>
<br>
<br>
Or you could just create it in this fixture without asserts,<br>
place asserts in a function check_res() and call it in each<br>
subtests which needs them. For example:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_subtest(&quot;virtgpu-map&quot;) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...vars here...<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 check_res(&amp;args=
);<br>
<br>
This also looks like a good candidate for a separate subtest?<span class=3D=
"gmail-im"><br></span></blockquote><div>Yes, Initially I thought about maki=
ng it a seperate subtest but considering that many subtests needed it, I pu=
t it in the igt_fixture().</div><div>I will put it in a separate function a=
nd create a `drm-virtgpu-resource-create` subtest to run it independently, =
this will also enable it to be used by other subtests.</div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-im">=
<br></span>
Please use C-style comments:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Request mmap off=
set */<br>
<br>
Same applies for following code.</blockquote><div>Noted with thanks!</div><=
div><br></div><div>BR,</div><div>Dorinda Bassey. <br></div><div>=C2=A0</div=
></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, May 22, 2025 at 6:20=E2=80=AFPM Kamil Koniec=
zny &lt;<a href=3D"mailto:kamil.konieczny@linux.intel.com">kamil.konieczny@=
linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi Dorinda,<br>
On 2025-05-14 at 12:28:00 +0200, Dorinda Bassey wrote:<br>
<br>
please use &#39;tests/&#39; as a prefix in subject, also change test name,<=
br>
so instead of<br>
[PATCH] drm_virtgpu: Add functional coverage for core VirtIO-GPU ioctls<br>
<br>
better:<br>
[PATCH] tests/virtgpu: Add functional coverage for core VirtIO-GPU ioctls<b=
r>
<br>
&gt; This test suite adds coverage for multiple DRM ioctls specific<br>
&gt; to the VirtIO-GPU driver, verifying functionality such as<br>
&gt; resource creation, memory mapping, 3D transfers, context<br>
&gt; initialization, and parameter querying.<br>
&gt; Each test validates a key ioctl to ensure correct behavior from<br>
&gt; user space and backend implementations. Each subtest is<br>
&gt; self-contained and can be executed independently.<br>
&gt; <br>
&gt; Included subtests:<br>
&gt;=C2=A0 =C2=A0- drm-virtgpu-map<br>
&gt;=C2=A0 =C2=A0- drm-virtgpu-execbuffer<br>
&gt;=C2=A0 =C2=A0- drm-virtgpu-resource-info<br>
&gt;=C2=A0 =C2=A0- drm-virtgpu-3d-transfer-to-host<br>
&gt;=C2=A0 =C2=A0- drm-virtgpu-3d-transfer-from-host<br>
&gt;=C2=A0 =C2=A0- drm-virtgpu-3d-wait<br>
&gt;=C2=A0 =C2=A0- drm-virtgpu-resource-create-blob<br>
&gt;=C2=A0 =C2=A0- drm-virtgpu-get-caps<br>
&gt;=C2=A0 =C2=A0- drm-virtgpu-context-init<br>
&gt;=C2=A0 =C2=A0- drm-virtgpu-getparam<br>
<br>
I would name them without &#39;drm-virtgpu-&#39; prefix. Up to you.<br>
<br>
&gt; <br>
&gt; How to Test with QEMU virtio-vga-gl or rustvmm vhost-device-gpu<br>
&gt; <br>
&gt; 1. Launch a QEMU guest with virtio-vga-gl<br>
&gt; ./build/qemu-system-x86_64 \<br>
&gt;=C2=A0 =C2=A0-enable-kvm \<br>
&gt;=C2=A0 =C2=A0-cpu host \<br>
&gt;=C2=A0 =C2=A0-m 4096 \<br>
&gt;=C2=A0 =C2=A0-machine q35 \<br>
&gt;=C2=A0 =C2=A0-display gtk,gl=3Don \<br>
&gt;=C2=A0 =C2=A0-vga none \<br>
&gt;=C2=A0 =C2=A0-device virtio-vga-gl \<br>
&gt;=C2=A0 =C2=A0-drive file=3Dimage.qcow2,format=3Dqcow2 \<br>
&gt;=C2=A0 =C2=A0-netdev user,id=3Dn0,hostfwd=3Dtcp::2222-:22 \<br>
&gt;=C2=A0 =C2=A0-device virtio-net-pci,netdev=3Dn0<br>
&gt; <br>
&gt; ssh into the guest and run the tests.<br>
&gt; <br>
&gt; 2. Start the vhost-device-gpu backend and Launch a QEMU<br>
&gt; guest with vhost-user-gpu-pci or vhost-user-vga, see guide on:<br>
&gt; <a href=3D"https://crates.io/crates/vhost-device-gpu" rel=3D"noreferre=
r" target=3D"_blank">https://crates.io/crates/vhost-device-gpu</a><br>
<br>
Could someone from your team help with review?<br>
<br>
&gt; <br>
&gt; Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dbassey@redhat.com=
" target=3D"_blank">dbassey@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/drm_virtgpu.c | 388 ++++++++++++++++++++++++++++++++++++++=
++++++<br>
<br>
Please rename it into virtgpu.c:<br>
<br>
s/drm_virtgpu.c/virtgpu.c/<br>
<br>
&gt;=C2=A0 tests/meson.build=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 389 insertions(+)<br>
&gt;=C2=A0 create mode 100644 tests/drm_virtgpu.c<br>
&gt; <br>
&gt; diff --git a/tests/drm_virtgpu.c b/tests/drm_virtgpu.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000..8de7880db<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/drm_virtgpu.c<br>
&gt; @@ -0,0 +1,388 @@<br>
&gt; +// SPDX-License-Identifier: MIT<br>
&gt; +/*<br>
&gt; + * Copyright =C2=A9 2025 Red Hat Inc.<br>
&gt; + *<br>
&gt; + * Authors: Dorinda Bassey &lt;<a href=3D"mailto:dbassey@redhat.com" =
target=3D"_blank">dbassey@redhat.com</a>&gt;<br>
&gt; + */<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * TEST: drm virtgpu ioctls<br>
&gt; + * Description: Testing of the virtIO-GPU driver DRM ioctls<br>
&gt; + * Category: Core<br>
&gt; + * Mega feature: General Core features<br>
&gt; + * Sub-category:=C2=A0 virtIO-GPU DRM ioctls<br>
&gt; + * Functionality: drm_ioctls<br>
&gt; + * Feature: Virtualization graphics support<br>
&gt; + * Test category: functionality test<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;igt.h&quot;<br>
&gt; +<br>
&gt; +#include &quot;drm.h&quot;<br>
&gt; +#include &quot;virtgpu_drm.h&quot;<br>
<br>
Please move igt headers after system ones.<br>
<br>
&gt; +<br>
&gt; +#include &lt;fcntl.h&gt;<br>
&gt; +#include &lt;errno.h&gt;<br>
&gt; +#include &lt;string.h&gt;<br>
&gt; +#include &lt;sys/ioctl.h&gt;<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * SUBTEST: drm-virtgpu-map<br>
&gt; + *<br>
&gt; + * SUBTEST: drm-virtgpu-execbuffer<br>
&gt; + *<br>
&gt; + * SUBTEST: drm-virtgpu-resource-info<br>
&gt; + *<br>
&gt; + * SUBTEST: drm-virtgpu-3d-transfer-to-host<br>
&gt; + *<br>
&gt; + * SUBTEST: drm-virtgpu-3d-transfer-from-host<br>
&gt; + *<br>
&gt; + * SUBTEST: drm-virtgpu-3d-wait<br>
&gt; + *<br>
&gt; + * SUBTEST: drm-virtgpu-resource-create-blob<br>
&gt; + *<br>
&gt; + * SUBTEST: drm-virtgpu-get-caps<br>
&gt; +<br>
&gt; + * SUBTEST: drm-virtgpu-context-init<br>
&gt; + *<br>
&gt; + * SUBTEST: drm-virtgpu-getparam<br>
&gt; + */<br>
&gt; +<br>
&gt; +IGT_TEST_DESCRIPTION(&quot; Testing of the virtIO-GPU driver DRM ioct=
ls&quot;);<br>
<br>
Remove space from &quot; Testing&quot;, so<br>
IGT_TEST_DESCRIPTION(&quot;Testing of the virtIO-GPU driver DRM ioctls&quot=
;);<br>
<br>
&gt; +<br>
&gt; +#define VIRTGPU_DEVICE &quot;/dev/dri/card0&quot;<br>
<br>
At least try to open all cardN until you find virtio, there is<br>
sometimes simpleDRM driver loaded and then cards could start from 1,<br>
/dev/dri/card1<br>
<br>
What about checking with getversion? For idea see core_getversion test.<br>
<br>
&gt; +<br>
&gt; +#define CAPS_BUFFER_SIZE 4096<br>
&gt; +<br>
&gt; +static const struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uint64_t id;<br>
&gt; +} params[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&quot;3D_FEATURES&quot;, VIRTGPU_PARAM_3D_FEATUR=
ES},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&quot;CAPSET_QUERY_FIX&quot;, VIRTGPU_PARAM_CAPS=
ET_QUERY_FIX},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&quot;RESOURCE_BLOB&quot;, VIRTGPU_PARAM_RESOURC=
E_BLOB},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&quot;HOST_VISIBLE&quot;, VIRTGPU_PARAM_HOST_VIS=
IBLE},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&quot;CROSS_DEVICE&quot;, VIRTGPU_PARAM_CROSS_DE=
VICE},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&quot;CONTEXT_INIT&quot;, VIRTGPU_PARAM_CONTEXT_=
INIT},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&quot;SUPPORTED_CAPSET_IDs&quot;, VIRTGPU_PARAM_=
SUPPORTED_CAPSET_IDs},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&quot;EXPLICIT_DEBUG_NAME&quot;, VIRTGPU_PARAM_E=
XPLICIT_DEBUG_NAME},<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void test_capset(int drm_fd, uint32_t capset_id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uint8_t *caps_buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_get_caps caps;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0caps_buf =3D malloc(CAPS_BUFFER_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_require(caps_buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0memset(caps_buf, 0, CAPS_BUFFER_SIZE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0memset(&amp;caps, 0, sizeof(caps));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0caps.cap_set_id =3D capset_id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0caps.size =3D CAPS_BUFFER_SIZE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0caps.addr =3D (uintptr_t) caps_buf;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_GET_CAPS,=
 &amp;caps);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;Capset=
 ID %u: SUCCESS\n&quot;, capset_id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;=C2=A0=
 Reported size: %u\n&quot;, caps.size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;=C2=A0=
 First 16 bytes: &quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; =
16; i++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0igt_info(&quot;%02x &quot;, caps_buf[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;\n&quo=
t;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;Capset=
 ID %u: FAILED - %s\n&quot;, capset_id,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0free(caps_buf);<br>
&gt; +}<br>
&gt; +<br>
&gt; +igt_main {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int drm_fd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void *caps_buf =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_resource_create args;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool resource_created =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_fixture {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_fd =3D open(VIRTG=
PU_DEVICE, O_RDWR | O_CLOEXEC);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_require(drm_fd &g=
t;=3D 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0caps_buf =3D malloc(C=
APS_BUFFER_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_require(caps_buf)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(caps_buf, 0, C=
APS_BUFFER_SIZE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Create resource<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;args, 0, =
sizeof(args));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.target =3D 2;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.format =3D 87;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.bind =3D (1 &lt;=
&lt; 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.width =3D 64;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.height =3D 64;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.depth =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.array_size =3D 1=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(drm_fd,=
 DRM_IOCTL_VIRTGPU_RESOURCE_CREATE, &amp;args);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_f(ret =3D=
=3D 0, &quot;RESOURCE_CREATE failed: %s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_neq(args.r=
es_handle, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resource_created =3D =
true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;Create=
d resource: res_handle=3D%u, bo_handle=3D%u\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 args.res_handle, args.bo_handle);<br>
<br>
Please do not make initialization with asserts here, I would suggest<br>
to move this into a function, for example:<br>
int create_resource(int fd, ... other params...)<br>
<br>
and then calling this before each test. For example:<br>
<br>
bool create_res(struct drm_virtgpu_resource_create *res)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(res-&gt;array_size =3D=3D 1) /* already crea=
ted */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ... rest of creation ...<br>
}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_subtest(&quot;virtgpu-map&quot;) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...vars here...<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_assert(create_r=
es(&amp;args));<br>
<br>
<br>
Or you could just create it in this fixture without asserts,<br>
place asserts in a function check_res() and call it in each<br>
subtests which needs them. For example:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_subtest(&quot;virtgpu-map&quot;) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...vars here...<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 check_res(&amp;args=
);<br>
<br>
This also looks like a good candidate for a separate subtest?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_describe<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;Maps a buffer object and tes=
ts read/write access via mmap.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_subtest(&quot;drm-virtgpu-map&quot;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_ma=
p map =3D { };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *map_ptr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;map, 0, s=
izeof(map));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0map.handle =3D args.b=
o_handle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Request mmap offse=
t<br>
<br>
Please use C-style comments:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Request mmap off=
set */<br>
<br>
Same applies for following code.<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(drm_fd,=
 DRM_IOCTL_VIRTGPU_MAP, &amp;map);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_f(ret =3D=
=3D 0, &quot;MAP ioctl failed: %s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(map.offset=
 !=3D 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Try mmap<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0map_ptr =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmap(NU=
LL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, drm_fd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 map.offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(map_ptr !=
=3D MAP_FAILED);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;Succes=
sfully mmap&#39;ed BO: offset=3D0x%lx\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (unsigned long)map.offset);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Simple test: write=
 and read<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(map_ptr, 0xaa,=
 4096);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(((uint8_t =
*) map_ptr)[0] =3D=3D 0xaa);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0munmap(map_ptr, 4096)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_describe(&quot;Submits a dummy execbuffer to =
the GPU.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_subtest(&quot;drm-virtgpu-execbuffer&quot;) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_ex=
ecbuffer execbuf =3D { };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t handles[1];<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handles[0] =3D args.b=
o_handle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Submit dummy execb=
uffer<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execbuf.flags =3D 0;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execbuf.size =3D 0;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0// No command<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execbuf.command =3D 0=
;=C2=A0 =C2=A0 // No command buffer<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execbuf.bo_handles =
=3D (uintptr_t) handles;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execbuf.num_bo_handle=
s =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execbuf.fence_fd =3D =
-1;=C2=A0 // No fence<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execbuf.ring_idx =3D =
0;=C2=A0 =C2=A0// Default ring<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(drm_fd,=
 DRM_IOCTL_VIRTGPU_EXECBUFFER, &amp;execbuf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_f(ret =3D=
=3D 0, &quot;EXECBUFFER ioctl failed: %s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 strerror(errno));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;EXECBU=
FFER submitted successfully.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_describe<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;Validates that the GPU resou=
rce info ioctl returns expected metadata.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_subtest(&quot;drm-virtgpu-resource-info&quot;=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_re=
source_info info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_require_f(resourc=
e_created,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Resource must be created before this test=
&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;info, 0, =
sizeof(info));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info.bo_handle =3D ar=
gs.bo_handle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(drm_fd,=
 DRM_IOCTL_VIRTGPU_RESOURCE_INFO, &amp;info);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_f(ret =3D=
=3D 0, &quot;RESOURCE_INFO failed: %s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_eq(info.re=
s_handle, args.res_handle);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(info.size =
&gt; 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;Querie=
d resource info:\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;=C2=A0=
 size:=C2=A0 =C2=A0 =C2=A0 %u bytes\n&quot;, info.size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;=C2=A0=
 res_handle %u\n&quot;, info.res_handle);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;=C2=A0=
 blob_mem:=C2=A0 %u\n&quot;, info.blob_mem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_describe<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;Transfers buffer contents fr=
om guest memory to the host.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_subtest(&quot;drm-virtgpu-3d-transfer-to-host=
&quot;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_3d=
_transfer_to_host xfer =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.bo_handle =3D args.bo_handle,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.box =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.x =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.y =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.z =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.w =3D args.width,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.h =3D args.height,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.d =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.level =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.offset =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.stride =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.layer_stride =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_require_f(resourc=
e_created,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Resource must be created befo=
re this test&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(drm_fd,=
 DRM_IOCTL_VIRTGPU_TRANSFER_TO_HOST, &amp;xfer);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_f(ret =3D=
=3D 0, &quot;TRANSFER_TO_HOST failed: %s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;TRANSF=
ER_TO_HOST completed\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_describe(&quot;Transfers buffer contents from=
 the host to guest memory.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_subtest(&quot;drm-virtgpu-3d-transfer-from-ho=
st&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_3d=
_transfer_from_host xfer_in =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.bo_handle =3D args.bo_handle,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.box =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.x =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.y =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.z =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.w =3D args.width,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.h =3D args.height,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.d =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.level =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.offset =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.stride =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.layer_stride =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_require_f(resource_created,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Resource must be created befo=
re this test&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_TRANSFER_=
FROM_HOST, &amp;xfer_in);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_assert_f(ret =3D=3D 0, &quot;TRANSFER_FROM_HO=
ST failed: %s\n&quot;, strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_info(&quot;TRANSFER_FROM_HOST completed\n&quo=
t;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_describe<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;Waits for a GPU operation to=
 complete on a specific resource.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_subtest(&quot;drm-virtgpu-3d-wait&quot;) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_3d=
_wait wait =3D {.handle =3D args.bo_handle };<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D ioctl(drm=
_fd, DRM_IOCTL_VIRTGPU_WAIT, &amp;wait);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0igt_info(&quot;WAIT succeeded.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0igt_info(&quot;WAIT failed as expected (%s).\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_describe<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;Creates a GPU resource using=
 the blob interface with memory flags.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_subtest(&quot;drm-virtgpu-resource-create-blo=
b&quot;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_re=
source_create_blob blob =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.blob_mem =3D VIRTGPU_BLOB_MEM_GUEST,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.blob_flags =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0VIRTGPU_BLOB_FLAG_USE_MAPPABLE |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0VIRTGPU_BLOB_FLAG_USE_SHAREABLE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.size =3D 4096,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.blob_id =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.cmd_size =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.cmd =3D (uintptr_t) NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ioctl(d=
rm_fd, DRM_IOCTL_VIRTGPU_RESOURCE_CREATE_BLOB,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&amp;blob);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_f(ret =3D=
=3D 0, &quot;Blob creation ioctl failed: %s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_eq(ret, 0)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_neq(blob.r=
es_handle, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_describe<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;Queries different GPU capset=
s and prints the response payload.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_subtest(&quot;drm-virtgpu-get-caps&quot;) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Test multiple caps=
ets<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_capset(drm_fd, 1=
); // VirGL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_capset(drm_fd, 2=
); // GFXSTREAM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_capset(drm_fd, 9=
999);=C2=A0 =C2=A0 =C2=A0 // Invalid (expect failure)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_describe<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;Initializes a GPU context wi=
th parameters like capset ID and debug name.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_subtest(&quot;drm-virtgpu-context-init&quot;)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_co=
ntext_set_param ctx_params[2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_co=
ntext_init ctx_init;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(ctx_params, 0,=
 sizeof(ctx_params));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx_params[0].param =
=3D VIRTGPU_CONTEXT_PARAM_CAPSET_ID;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx_params[0].value =
=3D 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx_params[1].param =
=3D VIRTGPU_CONTEXT_PARAM_DEBUG_NAME;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx_params[1].value =
=3D (uintptr_t) &quot;IGT-Test-Context&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;ctx_init,=
 0, sizeof(ctx_init));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx_init.num_params =
=3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx_init.ctx_set_para=
ms =3D (uintptr_t)&amp;ctx_params[0];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(drm_fd,=
 DRM_IOCTL_VIRTGPU_CONTEXT_INIT, &amp;ctx_init);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1 &am=
p;&amp; errno =3D=3D EEXIST) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0igt_info<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(&quot;CONTEXT_INIT with params failed as expected (al=
ready initialized)\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0igt_assert_f(ret =3D=3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CONTEXT_INIT with p=
arams ioctl failed: %s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0igt_info(&quot;CONTEXT_INIT with parameters succeeded\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_describe<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;Verifies which VirtIO-GPU fe=
atures are supported by querying driver parameters.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_subtest(&quot;drm-virtgpu-getparam&quot;) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool found_supported =
=3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t actual_value=
 =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (size_t i =3D 0; =
i &lt; ARRAY_SIZE(params); i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0struct drm_virtgpu_getparam gp =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.param =3D params[i].id,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.value =3D (uintptr_t)&amp;actual_value,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0int ret =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ioctl(drm_fd, DRM_IOCTL_VIRTGPU_GETPARAM, &amp;gp);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found_supported =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;GETPARAM %s (ID=3D%lu): v=
alue =3D %llu\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params[i].n=
ame, params[i].id,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gp.value);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;GETPARAM %s (ID=3D%lu): f=
ailed - %s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params[i].n=
ame, params[i].id,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(er=
rno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_f(found_su=
pported,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;No GETPARAM query returned a value.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_fixture {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(caps_buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(drm_fd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; diff --git a/tests/meson.build b/tests/meson.build<br>
&gt; index 20ddddb89..ac85cac30 100644<br>
&gt; --- a/tests/meson.build<br>
&gt; +++ b/tests/meson.build<br>
&gt; @@ -13,6 +13,7 @@ test_progs =3D [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;drm_buddy&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;drm_mm&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;drm_read&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;drm_virtgpu&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;fbdev&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;kms_3d&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;kms_addfb_basic&#39;,<br>
&gt; -- <br>
&gt; 2.48.1<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000b6665606360a735a--

