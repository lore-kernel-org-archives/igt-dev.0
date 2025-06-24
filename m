Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC30C77B7F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 09:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546B010E559;
	Tue, 24 Jun 2025 09:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VMcysjlb";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C655610E548
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750756643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a5SEi3NdYQm9N/GVqUHl/eqp0YAsoSUwYKiZe5a58ZQ=;
 b=VMcysjlbcBuiiaF58y5yGAKafjFGwhdzDh5I//w7rHA6WaoByzykNRQZtigEJvwNW17ckl
 O4kAEb6MbWQ4eK+kp7C+4fLRy3z0aMs2RbjFYUR2dYNjlhb7lLPjhFOWkQU7bwxyFRv/vA
 52HLAvjBDXxjETX7HDvsshpVzte/L9M=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-ZdfVzEv8MBiLhabsHw1E7g-1; Tue, 24 Jun 2025 05:17:19 -0400
X-MC-Unique: ZdfVzEv8MBiLhabsHw1E7g-1
X-Mimecast-MFC-AGG-ID: ZdfVzEv8MBiLhabsHw1E7g_1750756638
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3df290232d8so7352785ab.0
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 02:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750756638; x=1751361438;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a5SEi3NdYQm9N/GVqUHl/eqp0YAsoSUwYKiZe5a58ZQ=;
 b=HxSy81tyJJsEyAe8O6BhBkSP6OcI93RH1DKssNTya89Bm5Q9fJ7gT/vwjejvqlN0Bk
 rx/3wgEtcik6IzOOQFpNoSBF3G9zZ+jIvnGRrMu1QWysYqRfl5i8HjP7uUbWrlIxpcQL
 7tsyEd11/u7wROiWsHKDBySOa3BbvkxupZAZzgS6xM7URP4R4enYv5SoL53UFYiDF5ET
 7WpLQJKrYQX7CJ480GtsMrEflFp/uvx3wk+Fku+VeXREm0AtVaBUveI16b6/LlNNAb3c
 9S/jMHsaNbuX6ChyC0GZX5U+dTM913rMMLkKe8Lz77JTa8l5VUdYUHrSLChU0IeTaamV
 iY9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyyCG66JUnr0scP5cG0ydOrCrSEH86sJeRiTKFEmLEuRRFpurozLHLqRo6FISwpu2ZQp0/JEG/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT0spgfRWODSlHyzAW2ug3Zq1DrFHrdugHQSojSvsy3BZFOl/0
 gA6nxZ2TJOnliqVTScFjZsyOKCcqljlQvuWQiy9qTdOGsC/stAXCgAosq/YoaXrbRy6nbgSBc5C
 PxLFbSu300Z8Awigw8Tg9mSO0UP/xg/Tc5Mv1GlMdDNhKHtscStB/1F/EAoRZlzvrVnmMQoZaOG
 4EoXIRn7HXg4RBjL2odxiBmcLUmbEOvAmlTlkivUjWHg==
X-Gm-Gg: ASbGncsm1CjsLsCAAfy0OFMp1xBohH1+iauZ5Ui+JyTcuX9yEQAm1zVh1tProZHMRZA
 8Dh4hUC3I0WkpR5MjINKfw2fj6Rin4yB5Yvy4oiQebMPa6Eg7BJMD4bArZfXs1l5e3GT5VvdH9w
 D8xPq9Lg==
X-Received: by 2002:a05:6e02:3499:b0:3de:119f:5261 with SMTP id
 e9e14a558f8ab-3de38c1c019mr232968005ab.3.1750756638394; 
 Tue, 24 Jun 2025 02:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdPkngxCp6222tFX35E4fqr2dBInUWwj7oawvhbumLUF2EC1ZZ/K5LW0cVr9suhGw529E/YQiRVZvOFJ328cQ=
X-Received: by 2002:a05:6e02:3499:b0:3de:119f:5261 with SMTP id
 e9e14a558f8ab-3de38c1c019mr232967795ab.3.1750756637901; Tue, 24 Jun 2025
 02:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250616164256.2120394-1-dbassey@redhat.com>
 <20250623102838.bximmqwbcgxqxrdz@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250623102838.bximmqwbcgxqxrdz@kamilkon-DESK.igk.intel.com>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Tue, 24 Jun 2025 11:17:05 +0200
X-Gm-Features: AX0GCFuc6ofvChEOylraqmEz8ye0cDYy6WqF8QRBMSo4BrwSzdUh4YjJ_WZFFaA
Message-ID: <CACzuRywk_t912yofqiHJTrV2nT6eXgDFd6n+g3g0MhEJPUmGOw@mail.gmail.com>
Subject: Re: [PATCH v5] tests/drm_virtgpu: Add functional coverage for core
 VirtIO-GPU ioctls
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dorinda Bassey <dbassey@redhat.com>, 
 igt-dev@lists.freedesktop.org, javierm@redhat.com, aesteve@redhat.com, 
 ernunes@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DEdcBU2M-xXf_0OPX05wiYSPciToVCsIisPrjGcdI40_1750756638
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007d997906384dcb13"
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

--0000000000007d997906384dcb13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

Thanks for the review, I have addressed the nitpicks except this one:

Add newline after closing bracket.

 A newline after the closing bracket introduces a blank line before the
next closing bracket and "Blank lines aren't necessary before a close brace
'}"

BR,
Dorinda.


On Mon, Jun 23, 2025 at 12:28=E2=80=AFPM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Dorinda,
> On 2025-06-16 at 18:37:05 +0200, Dorinda Bassey wrote:
> > This test suite adds coverage for multiple DRM ioctls specific
> > to the VirtIO-GPU driver, verifying functionality such as
> > resource creation, memory mapping, 3D transfers, context
> > initialization, and parameter querying.
> > Each test validates a key ioctl to ensure correct behavior from
> > user space and backend implementations. Each subtest is
> > self-contained and can be executed independently.
>
> I have few nits, see below.
>
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
> >
> > Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
> > Reviewed-by: Erico Nunes <ernunes@redhat.com>
> > ---
> > v5 changes:
> > Modify test_capset() to return int error codes instead of void
> > Update drm-virtgpu-get-caps subtest to assert on test_capset()
> > Add runtime configurability for GFXSTREAM_VULKAN capset test:
> >   expect failure by default unless TEST_GFXSTREAM_CAPSET=3D1 is set,
> >   enabling testing across different backends(gfxstream).
> > Fix calloc() usage
> > Improve igt_info() messages for ioctls
> > Fix spacing and style issues
> > Remove unused defines
> >
> >  tests/drm_virtgpu.c | 427 ++++++++++++++++++++++++++++++++++++++++++++
> >  tests/meson.build   |   1 +
> >  2 files changed, 428 insertions(+)
> >  create mode 100644 tests/drm_virtgpu.c
> >
> > diff --git a/tests/drm_virtgpu.c b/tests/drm_virtgpu.c
> > new file mode 100644
> > index 000000000..8f766913d
> > --- /dev/null
> > +++ b/tests/drm_virtgpu.c
> > @@ -0,0 +1,427 @@
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
> > +#include <fcntl.h>
> > +#include <errno.h>
>
> fcntl.h should be after errno.h:
>
> #include <errno.h>
> #include <fcntl.h>
>
> > +#include <string.h>
> > +#include <sys/ioctl.h>
> > +
> > +#include "drm.h"
> > +#include "virtgpu_drm.h"
> > +#include "igt.h"
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
> > + * SUBTEST: drm-virtgpu-resource-create
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
> > +IGT_TEST_DESCRIPTION("Testing of the virtIO-GPU driver DRM ioctls");
> > +
> > +#define CAPS_BUFFER_SIZE 4096
> > +#define MAX_CARDS 16
> > +
> > +int drm_fd;
> > +struct drm_virtgpu_resource_create args;
> > +bool resource_created;
> > +bool test_gfxstream;
>
> Make all that global vars static, for example:
> static int drm_fd;
>
> > +
> > +static void setup(void)
> > +{
> > +     const char *env =3D getenv("TEST_GFXSTREAM_CAPSET");
> > +
> > +     if (env && strcmp(env, "1") =3D=3D 0)
> > +             test_gfxstream =3D true;
> > +}
> > +
> > +static int open_virtgpu_device(void)
> > +{
> > +     drmVersionPtr version;
> > +     int opened_devices =3D 0;
> > +
> > +     for (int i =3D 0; i < MAX_CARDS; i++) {
> > +             char path[64];
> > +
> > +             snprintf(path, sizeof(path), "/dev/dri/card%d", i);
> > +             drm_fd =3D open(path, O_RDWR | O_CLOEXEC);
> > +             if (drm_fd < 0)
> > +                     continue;
> > +
> > +             opened_devices++;
> > +
> > +             version =3D drmGetVersion(drm_fd);
> > +             if (version && strcmp(version->name, "virtio_gpu") =3D=3D=
 0) {
> > +                     drmFreeVersion(version);
> > +                     igt_info("Found virtio_gpu device: %s\n", path);
> > +                     return drm_fd;
> > +             }
> > +
> > +             drmFreeVersion(version);
> > +             close(drm_fd);
> > +     }
>
> Add newline after closing bracket.
>
> > +     igt_info("No virtio_gpu device found, total DRM devices opened:
> %d\n", opened_devices);
>
> Add newline before final 'return'.
>
> > +     return -1;
> > +}
> > +
> > +static int test_capset(int fd, uint32_t capset_id)
> > +{
> > +     uint8_t *caps_buf;
> > +     struct drm_virtgpu_get_caps caps;
> > +     int ret;
> > +     int i;
> > +
> > +     caps_buf =3D calloc(1, CAPS_BUFFER_SIZE);
> > +     igt_require(caps_buf);
> > +
> > +     memset(&caps, 0, sizeof(caps));
> > +     caps.cap_set_id =3D capset_id;
> > +     caps.size =3D CAPS_BUFFER_SIZE;
> > +     caps.addr =3D (uintptr_t)caps_buf;
> > +
> > +     ret =3D ioctl(fd, DRM_IOCTL_VIRTGPU_GET_CAPS, &caps);
> > +     if (ret =3D=3D 0) {
> > +             igt_info("Capset ID %u: SUCCESS\n", capset_id);
> > +             igt_info("  Reported size: %u\n", caps.size);
> > +             igt_info("  First 16 bytes: ");
> > +             for (i =3D 0; i < 16; i++)
> > +                     igt_info("%02x ", caps_buf[i]);
> > +             igt_info("\n");
> > +             free(caps_buf);
> > +             return 0;
> > +     }
>
> Add newline.
>
> > +     igt_info("Capset ID %u: FAILED - %m\n", capset_id);
> > +     free(caps_buf);
>
> Add newline.
>
> Regards,
> Kamil
>
> > +     return -errno;
> > +}
> > +
> > +static void create_resource_if_needed(void)
> > +{
> > +     int ret;
> > +
> > +     if (resource_created)
> > +             return;
> > +
> > +     memset(&args, 0, sizeof(args));
> > +     args.target =3D 2;
> > +     args.format =3D 67;
> > +     args.bind =3D (1 << 0);
> > +     args.width =3D 64;
> > +     args.height =3D 64;
> > +     args.depth =3D 1;
> > +     args.array_size =3D 1;
> > +
> > +     ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_RESOURCE_CREATE, &args);
> > +     igt_assert_f(ret =3D=3D 0, "RESOURCE_CREATE failed: %s\n",
> strerror(errno));
> > +     igt_assert_neq(args.res_handle, 0);
> > +
> > +     resource_created =3D true;
> > +     igt_info("Created resource: res_handle=3D%u, bo_handle=3D%u\n",
> > +              args.res_handle, args.bo_handle);
> > +}
> > +
> > +igt_main {
> > +     void *caps_buf =3D NULL;
> > +
> > +     igt_fixture {
> > +             drm_fd =3D open_virtgpu_device();
> > +             igt_require(drm_fd >=3D 0);
> > +
> > +             caps_buf =3D calloc(1, CAPS_BUFFER_SIZE);
> > +             igt_require(caps_buf);
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
> > +             create_resource_if_needed();
> > +             memset(&map, 0, sizeof(map));
> > +             map.handle =3D args.bo_handle;
> > +
> > +             /* Request mmap offset */
> > +             ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_MAP, &map);
> > +             igt_assert_f(!ret, "MAP ioctl failed: %m\n");
> > +             igt_assert(map.offset);
> > +
> > +             /* Try mmap */
> > +             map_ptr =3D
> > +                 mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED,
> drm_fd,
> > +                      map.offset);
> > +             igt_assert(map_ptr !=3D MAP_FAILED);
> > +
> > +             igt_info("Successfully mmap'ed BO: offset=3D0x%" PRIx64 "=
\n",
> > +                      (unsigned long)map.offset);
> > +
> > +             /* Simple test: write and read */
> > +             memset(map_ptr, 0xaa, 4096);
> > +             igt_assert(((uint8_t *)map_ptr)[0] =3D=3D 0xaa);
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
> > +             create_resource_if_needed();
> > +             handles[0] =3D args.bo_handle;
> > +
> > +             /* Submit dummy execbuffer */
> > +             execbuf.flags =3D 0;
> > +             execbuf.size =3D 0;       /* No command */
> > +             execbuf.command =3D 0;    /* No command buffer */
> > +             execbuf.bo_handles =3D (uintptr_t)handles;
> > +             execbuf.num_bo_handles =3D 1;
> > +             execbuf.fence_fd =3D -1;  /* No fence */
> > +             execbuf.ring_idx =3D 0;   /* Default ring */
> > +
> > +             ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_EXECBUFFER,
> &execbuf);
> > +             igt_assert_f(!ret, "EXECBUFFER ioctl failed: %m\n");
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
> > +             create_resource_if_needed();
> > +             memset(&info, 0, sizeof(info));
> > +             info.bo_handle =3D args.bo_handle;
> > +
> > +             ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_RESOURCE_INFO,
> &info);
> > +             igt_assert_f(!ret, "RESOURCE_INFO failed: %m\n");
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
> > +             struct drm_virtgpu_3d_transfer_to_host xfer;
> > +
> > +             create_resource_if_needed();
> > +
> > +             memset(&xfer, 0, sizeof(xfer));
> > +             xfer.bo_handle =3D args.bo_handle;
> > +             xfer.box.x =3D 0;
> > +             xfer.box.y =3D 0;
> > +             xfer.box.z =3D 0;
> > +             xfer.box.w =3D args.width;
> > +             xfer.box.h =3D args.height;
> > +             xfer.box.d =3D 1;
> > +             xfer.level =3D 0;
> > +             xfer.offset =3D 0;
> > +             xfer.stride =3D 0;
> > +             xfer.layer_stride =3D 0;
> > +
> > +             ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_TRANSFER_TO_HOST,
> &xfer);
> > +             igt_assert_f(!ret, "TRANSFER_TO_HOST failed: %m\n");
> > +             igt_info("TRANSFER_TO_HOST completed\n");
> > +     }
> > +
> > +     igt_describe("Transfers buffer contents from the host to guest
> memory.");
> > +     igt_subtest("drm-virtgpu-3d-transfer-from-host")
> > +     {
> > +             int ret;
> > +             struct drm_virtgpu_3d_transfer_from_host xfer_in;
> > +
> > +             create_resource_if_needed();
> > +             memset(&xfer_in, 0, sizeof(xfer_in));
> > +             xfer_in.bo_handle =3D args.bo_handle;
> > +             xfer_in.box.x =3D 0;
> > +             xfer_in.box.y =3D 0;
> > +             xfer_in.box.z =3D 0;
> > +             xfer_in.box.w =3D args.width;
> > +             xfer_in.box.h =3D args.height;
> > +             xfer_in.box.d =3D 1;
> > +             xfer_in.level =3D 0;
> > +             xfer_in.offset =3D 0;
> > +             xfer_in.stride =3D 0;
> > +             xfer_in.layer_stride =3D 0;
> > +
> > +             ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_TRANSFER_FROM_HOS=
T,
> &xfer_in);
> > +             igt_assert_f(!ret, "TRANSFER_FROM_HOST failed: %m\n");
> > +             igt_info("TRANSFER_FROM_HOST completed\n");
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
> > +                     igt_info("DRM_IOCTL_VIRTGPU_WAIT succeeded: GPU
> operations on resource handle %u have completed.\n",
> > +                              wait.handle);
> > +             else
> > +                     igt_info("DRM_IOCTL_VIRTGPU_WAIT failed on
> resource handle %u as expected: %m\n",
> > +                              wait.handle);
> > +     }
> > +
> > +     igt_describe
> > +             ("Creates a standard 2D GPU resource using RESOURCE_CREAT=
E
> ioctl.");
> > +     igt_subtest("drm-virtgpu-resource-create") {
> > +             create_resource_if_needed();
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
> > +                     .cmd =3D (uintptr_t)NULL,
> > +             };
> > +
> > +             int ret =3D
> > +                 ioctl(drm_fd, DRM_IOCTL_VIRTGPU_RESOURCE_CREATE_BLOB,
> > +                       &blob);
> > +             igt_assert_f(!ret, "Blob creation ioctl failed: %m\n");
> > +             igt_assert_neq(blob.res_handle, 0);
> > +     }
> > +
> > +     igt_describe
> > +         ("Queries different GPU capsets and prints the response
> payload.");
> > +     igt_subtest("drm-virtgpu-get-caps") {
> > +             setup();
> > +             /* Test multiple capsets */
> > +             igt_assert_eq(test_capset(drm_fd, 1), 0); /* VirGL */
> > +             igt_assert_eq(test_capset(drm_fd, 2), 0); /* VirGL2 */
> > +             if (test_gfxstream)
> > +                     igt_assert_eq(test_capset(drm_fd, 3), 0); /*
> GFXSTREAM_VULKAN */
> > +             else
> > +                     /* Expect failure if not gfxstream backend */
> > +                     igt_assert(test_capset(drm_fd, 3) !=3D 0);
> > +
> > +             igt_assert(test_capset(drm_fd, 9999) !=3D 0); /* Invalid
> (expect failure) */
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
> > +             ctx_params[1].value =3D (uintptr_t)"IGT-Test-Context";
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
> > +                     igt_assert_f(!ret, "CONTEXT_INIT with params ioct=
l
> failed: %m\n");
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
> > +             static const struct {
> > +                     const char *name;
> > +                     uint64_t id;
> > +             } params[] =3D {
> > +                     {"3D_FEATURES", VIRTGPU_PARAM_3D_FEATURES},
> > +                     {"CAPSET_QUERY_FIX",
> VIRTGPU_PARAM_CAPSET_QUERY_FIX},
> > +                     {"RESOURCE_BLOB", VIRTGPU_PARAM_RESOURCE_BLOB},
> > +                     {"HOST_VISIBLE", VIRTGPU_PARAM_HOST_VISIBLE},
> > +                     {"CROSS_DEVICE", VIRTGPU_PARAM_CROSS_DEVICE},
> > +                     {"CONTEXT_INIT", VIRTGPU_PARAM_CONTEXT_INIT},
> > +                     {"SUPPORTED_CAPSET_IDs",
> VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs},
> > +                     {"EXPLICIT_DEBUG_NAME",
> VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME},
> > +             };
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
> %m\n",
> > +                                      params[i].name, params[i].id);
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

--0000000000007d997906384dcb13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Kamil,</div><div><br></div><div>Thanks for the rev=
iew, I have addressed the nitpicks except this one:</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
Add newline after closing bracket.</blockquote><div>=C2=A0A newline after t=
he closing bracket introduces a blank line before the next closing bracket =
and &quot;Blank lines aren&#39;t necessary before a close brace &#39;}&quot=
;</div><div><br></div><div>BR,</div><div>Dorinda.</div><div><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, Jun 23, 2025 at 12:28=E2=80=AFPM Kamil Konieczny &lt;<a href=3D"mailto:k=
amil.konieczny@linux.intel.com" target=3D"_blank">kamil.konieczny@linux.int=
el.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi Dorinda,<br>
On 2025-06-16 at 18:37:05 +0200, Dorinda Bassey wrote:<br>
&gt; This test suite adds coverage for multiple DRM ioctls specific<br>
&gt; to the VirtIO-GPU driver, verifying functionality such as<br>
&gt; resource creation, memory mapping, 3D transfers, context<br>
&gt; initialization, and parameter querying.<br>
&gt; Each test validates a key ioctl to ensure correct behavior from<br>
&gt; user space and backend implementations. Each subtest is<br>
&gt; self-contained and can be executed independently.<br>
<br>
I have few nits, see below.<br>
<br>
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
&gt; <br>
&gt; Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dbassey@redhat.com=
" target=3D"_blank">dbassey@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Erico Nunes &lt;<a href=3D"mailto:ernunes@redhat.com" tar=
get=3D"_blank">ernunes@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; v5 changes:<br>
&gt; Modify test_capset() to return int error codes instead of void<br>
&gt; Update drm-virtgpu-get-caps subtest to assert on test_capset()<br>
&gt; Add runtime configurability for GFXSTREAM_VULKAN capset test:<br>
&gt;=C2=A0 =C2=A0expect failure by default unless TEST_GFXSTREAM_CAPSET=3D1=
 is set,<br>
&gt;=C2=A0 =C2=A0enabling testing across different backends(gfxstream).<br>
&gt; Fix calloc() usage<br>
&gt; Improve igt_info() messages for ioctls<br>
&gt; Fix spacing and style issues<br>
&gt; Remove unused defines<br>
&gt; <br>
&gt;=C2=A0 tests/drm_virtgpu.c | 427 ++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 tests/meson.build=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 428 insertions(+)<br>
&gt;=C2=A0 create mode 100644 tests/drm_virtgpu.c<br>
&gt; <br>
&gt; diff --git a/tests/drm_virtgpu.c b/tests/drm_virtgpu.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000..8f766913d<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/drm_virtgpu.c<br>
&gt; @@ -0,0 +1,427 @@<br>
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
&gt; +#include &lt;fcntl.h&gt;<br>
&gt; +#include &lt;errno.h&gt;<br>
<br>
fcntl.h should be after errno.h:<br>
<br>
#include &lt;errno.h&gt;<br>
#include &lt;fcntl.h&gt;<br>
<br>
&gt; +#include &lt;string.h&gt;<br>
&gt; +#include &lt;sys/ioctl.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;drm.h&quot;<br>
&gt; +#include &quot;virtgpu_drm.h&quot;<br>
&gt; +#include &quot;igt.h&quot;<br>
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
&gt; + * SUBTEST: drm-virtgpu-resource-create<br>
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
&gt; +IGT_TEST_DESCRIPTION(&quot;Testing of the virtIO-GPU driver DRM ioctl=
s&quot;);<br>
&gt; +<br>
&gt; +#define CAPS_BUFFER_SIZE 4096<br>
&gt; +#define MAX_CARDS 16<br>
&gt; +<br>
&gt; +int drm_fd;<br>
&gt; +struct drm_virtgpu_resource_create args;<br>
&gt; +bool resource_created;<br>
&gt; +bool test_gfxstream;<br>
<br>
Make all that global vars static, for example:<br>
static int drm_fd;<br>
<br>
&gt; +<br>
&gt; +static void setup(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *env =3D getenv(&quot;TEST_GFXSTREAM_C=
APSET&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (env &amp;&amp; strcmp(env, &quot;1&quot;) =3D=
=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_gfxstream =3D tr=
ue;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int open_virtgpu_device(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drmVersionPtr version;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int opened_devices =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; MAX_CARDS; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char path[64];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(path, sizeof=
(path), &quot;/dev/dri/card%d&quot;, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_fd =3D open(path,=
 O_RDWR | O_CLOEXEC);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_fd &lt; 0)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opened_devices++;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version =3D drmGetVer=
sion(drm_fd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (version &amp;&amp=
; strcmp(version-&gt;name, &quot;virtio_gpu&quot;) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drmFreeVersion(version);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0igt_info(&quot;Found virtio_gpu device: %s\n&quot;, path);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return drm_fd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drmFreeVersion(versio=
n);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(drm_fd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
Add newline after closing bracket.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_info(&quot;No virtio_gpu device found, total =
DRM devices opened: %d\n&quot;, opened_devices);<br>
<br>
Add newline before final &#39;return&#39;.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int test_capset(int fd, uint32_t capset_id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uint8_t *caps_buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_get_caps caps;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0caps_buf =3D calloc(1, CAPS_BUFFER_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_require(caps_buf);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0memset(&amp;caps, 0, sizeof(caps));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0caps.cap_set_id =3D capset_id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0caps.size =3D CAPS_BUFFER_SIZE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0caps.addr =3D (uintptr_t)caps_buf;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D ioctl(fd, DRM_IOCTL_VIRTGPU_GET_CAPS, &am=
p;caps);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(caps_buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
Add newline.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_info(&quot;Capset ID %u: FAILED - %m\n&quot;,=
 capset_id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0free(caps_buf);<br>
<br>
Add newline.<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -errno;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void create_resource_if_needed(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (resource_created)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0memset(&amp;args, 0, sizeof(args));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0args.target =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0args.format =3D 67;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0args.bind =3D (1 &lt;&lt; 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0args.width =3D 64;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0args.height =3D 64;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0args.depth =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0args.array_size =3D 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D ioctl(drm_fd, DRM_IOCTL_VIRTGPU_RESOURCE_=
CREATE, &amp;args);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_assert_f(ret =3D=3D 0, &quot;RESOURCE_CREATE =
failed: %s\n&quot;, strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_assert_neq(args.res_handle, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0resource_created =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_info(&quot;Created resource: res_handle=3D%u,=
 bo_handle=3D%u\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.res_handle, arg=
s.bo_handle);<br>
&gt; +}<br>
&gt; +<br>
&gt; +igt_main {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void *caps_buf =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_fixture {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_fd =3D open_virtg=
pu_device();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_require(drm_fd &g=
t;=3D 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0caps_buf =3D calloc(1=
, CAPS_BUFFER_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_require(caps_buf)=
;<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_resource_if_ne=
eded();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;map, 0, s=
izeof(map));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0map.handle =3D args.b=
o_handle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Request mmap offse=
t */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(drm_fd,=
 DRM_IOCTL_VIRTGPU_MAP, &amp;map);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_f(!ret, &q=
uot;MAP ioctl failed: %m\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(map.offset=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Try mmap */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0map_ptr =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmap(NU=
LL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, drm_fd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 map.offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(map_ptr !=
=3D MAP_FAILED);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;Succes=
sfully mmap&#39;ed BO: offset=3D0x%&quot; PRIx64 &quot;\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (unsigned long)map.offset);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Simple test: write=
 and read */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(map_ptr, 0xaa,=
 4096);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(((uint8_t =
*)map_ptr)[0] =3D=3D 0xaa);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_resource_if_ne=
eded();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handles[0] =3D args.b=
o_handle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Submit dummy execb=
uffer */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execbuf.flags =3D 0;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execbuf.size =3D 0;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* No command */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execbuf.command =3D 0=
;=C2=A0 =C2=A0 /* No command buffer */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execbuf.bo_handles =
=3D (uintptr_t)handles;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execbuf.num_bo_handle=
s =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execbuf.fence_fd =3D =
-1;=C2=A0 /* No fence */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execbuf.ring_idx =3D =
0;=C2=A0 =C2=A0/* Default ring */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(drm_fd,=
 DRM_IOCTL_VIRTGPU_EXECBUFFER, &amp;execbuf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_f(!ret, &q=
uot;EXECBUFFER ioctl failed: %m\n&quot;);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_resource_if_ne=
eded();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;info, 0, =
sizeof(info));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info.bo_handle =3D ar=
gs.bo_handle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(drm_fd,=
 DRM_IOCTL_VIRTGPU_RESOURCE_INFO, &amp;info);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_f(!ret, &q=
uot;RESOURCE_INFO failed: %m\n&quot;);<br>
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
_transfer_to_host xfer;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_resource_if_ne=
eded();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;xfer, 0, =
sizeof(xfer));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer.bo_handle =3D ar=
gs.bo_handle;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer.box.x =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer.box.y =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer.box.z =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer.box.w =3D args.w=
idth;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer.box.h =3D args.h=
eight;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer.box.d =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer.level =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer.offset =3D 0;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer.stride =3D 0;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer.layer_stride =3D=
 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(drm_fd,=
 DRM_IOCTL_VIRTGPU_TRANSFER_TO_HOST, &amp;xfer);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_f(!ret, &q=
uot;TRANSFER_TO_HOST failed: %m\n&quot;);<br>
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
_transfer_from_host xfer_in;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_resource_if_ne=
eded();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;xfer_in, =
0, sizeof(xfer_in));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer_in.bo_handle =3D=
 args.bo_handle;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer_in.box.x =3D 0;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer_in.box.y =3D 0;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer_in.box.z =3D 0;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer_in.box.w =3D arg=
s.width;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer_in.box.h =3D arg=
s.height;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer_in.box.d =3D 1;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer_in.level =3D 0;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer_in.offset =3D 0;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer_in.stride =3D 0;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfer_in.layer_stride =
=3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(drm_fd,=
 DRM_IOCTL_VIRTGPU_TRANSFER_FROM_HOST, &amp;xfer_in);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_f(!ret, &q=
uot;TRANSFER_FROM_HOST failed: %m\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;TRANSF=
ER_FROM_HOST completed\n&quot;);<br>
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
 =C2=A0igt_info(&quot;DRM_IOCTL_VIRTGPU_WAIT succeeded: GPU operations on r=
esource handle %u have completed.\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wait.handle);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0igt_info(&quot;DRM_IOCTL_VIRTGPU_WAIT failed on resource handle %u a=
s expected: %m\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wait.handle);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_describe<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;Creates a stan=
dard 2D GPU resource using RESOURCE_CREATE ioctl.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_subtest(&quot;drm-virtgpu-resource-create&quo=
t;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_resource_if_ne=
eded();<br>
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
 =C2=A0.cmd =3D (uintptr_t)NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ioctl(d=
rm_fd, DRM_IOCTL_VIRTGPU_RESOURCE_CREATE_BLOB,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&amp;blob);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_f(!ret, &q=
uot;Blob creation ioctl failed: %m\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_neq(blob.r=
es_handle, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_describe<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;Queries different GPU capset=
s and prints the response payload.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_subtest(&quot;drm-virtgpu-get-caps&quot;) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setup();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Test multiple caps=
ets */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_eq(test_ca=
pset(drm_fd, 1), 0); /* VirGL */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_eq(test_ca=
pset(drm_fd, 2), 0); /* VirGL2 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (test_gfxstream)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0igt_assert_eq(test_capset(drm_fd, 3), 0); /* GFXSTREAM_VULKAN */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* Expect failure if not gfxstream backend */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0igt_assert(test_capset(drm_fd, 3) !=3D 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(test_capse=
t(drm_fd, 9999) !=3D 0); /* Invalid (expect failure) */<br>
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
=3D (uintptr_t)&quot;IGT-Test-Context&quot;;<br>
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
 =C2=A0igt_assert_f(!ret, &quot;CONTEXT_INIT with params ioctl failed: %m\n=
&quot;);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static const struct {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0const char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0uint64_t id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} params[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{&quot;3D_FEATURES&quot;, VIRTGPU_PARAM_3D_FEATURES},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{&quot;CAPSET_QUERY_FIX&quot;, VIRTGPU_PARAM_CAPSET_QUERY_FIX},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{&quot;RESOURCE_BLOB&quot;, VIRTGPU_PARAM_RESOURCE_BLOB},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{&quot;HOST_VISIBLE&quot;, VIRTGPU_PARAM_HOST_VISIBLE},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{&quot;CROSS_DEVICE&quot;, VIRTGPU_PARAM_CROSS_DEVICE},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{&quot;CONTEXT_INIT&quot;, VIRTGPU_PARAM_CONTEXT_INIT},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{&quot;SUPPORTED_CAPSET_IDs&quot;, VIRTGPU_PARAM_SUPPORTED_CAPSET_ID=
s},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{&quot;EXPLICIT_DEBUG_NAME&quot;, VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME}=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
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
ailed - %m\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params[i].n=
ame, params[i].id);<br>
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

--0000000000007d997906384dcb13--

