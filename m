Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6079C5B543
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 16:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614D410E320;
	Tue, 10 Jun 2025 16:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G7qzKdv1";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26F710E320
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 16:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749572906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kakx7bYbDdc73uhXsb5HmlwvxtzNS76Le4SjPNpzuUc=;
 b=G7qzKdv1SAE7AZMvHGI5+P+rthON13Ub0LN3RnEbsnc/9Ug/KlfYyarFiH9sHMhatN/6iw
 iut+bLZEdjZHHUOdZqmJ8XkG06eXLbbalnT/RONSs5AtVGGXE2Jk2smAzmoRS7S3L0Jwd1
 8s0J6OOlIFnEmmtZf+iyKlnTQ/LRNyA=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-fAZhwpXbOv2jI-5llg9zEQ-1; Tue, 10 Jun 2025 12:28:24 -0400
X-MC-Unique: fAZhwpXbOv2jI-5llg9zEQ-1
X-Mimecast-MFC-AGG-ID: fAZhwpXbOv2jI-5llg9zEQ_1749572903
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3ddcc14b794so30761875ab.2
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 09:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749572903; x=1750177703;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kakx7bYbDdc73uhXsb5HmlwvxtzNS76Le4SjPNpzuUc=;
 b=KtllN1XP0TmiE4g6Z+XftMkzUx8T1n1dj0R8QzZg+iKcFZQutsNpKedYsDHuSBPHcH
 QGGPLqN9c5xdQPxzojCc/IU4ECRe429lfAHUW9riDB7DH/TMgf3XZmv2aIZY1nbw7nlR
 DVMOltKdlLPvzGLMq6/Ak3kxL5ZltnPKq01WSilQaPJBKsKg8Nmw9qArDnJ1ecXyher+
 KKAt5xtQX6qrkJx1mxAmWMYWU471aMPMq3z7tCE1ctxTuYiVXNGgPWI9DCi0lMyDEWQ6
 9Y7PKCKXLe53gmwMfPkBPRv1Gm2LQaI2vQo5JTZsQBXZp5NDpHNmEUyWA3vsOJUM3Znx
 WJ7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3Z12RNTD4jpoBdev1Yywq0fI0DZtysDcz7wXJg4hzzJiMrpxOSDVBj8dcv0N/ICNH0DMlPyba@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRips5Zha221UQJXq22z2grfRU6nDBsAcfa9ch8gdcgLbl+Kys
 SFDojFIFeVJyNcgw2jnCW1McrbKumz/ohxB85Y3yySv3QQqA6d152mGnF/0Wi//BDfMq2wtFLP8
 nqkQMBy3s482+lqlEj2vLChJPQPpg9JXYf97JLudzVlYxeHtBNxtszHZs5Rt2zFOM4WLXXosCan
 IfFbLJA3g/JmuXh4cA5+tM268fh+/oxkBmWarSnL7G8w==
X-Gm-Gg: ASbGncuePSUYo9xLW+IzdHOOs2myks8SlINahItXHx040A0tND6+CduCg/iCHd9IoqO
 U/s3LT67SABd2aFsnEyHqs/As5IAQZR2B9c7cYai15fHDc3VPg8cLk8LVxcCuIPS5kOyWllzYfy
 tDzoc/HA==
X-Received: by 2002:a05:6e02:3c82:b0:3dd:bfba:ff9c with SMTP id
 e9e14a558f8ab-3ddf379daa8mr5100765ab.11.1749572903337; 
 Tue, 10 Jun 2025 09:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBqbWsqawDhF1TB7WWAUz38DORnG7fLTTvPiInbHmxKLWB6MznqRZBPTcmKzedHDnOkOW7XFyjp2/E5T16VrE=
X-Received: by 2002:a05:6e02:3c82:b0:3dd:bfba:ff9c with SMTP id
 e9e14a558f8ab-3ddf379daa8mr5100455ab.11.1749572902876; Tue, 10 Jun 2025
 09:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250530090451.1438981-1-dbassey@redhat.com>
 <20250606155522.2mnzanrvr73yfc6n@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250606155522.2mnzanrvr73yfc6n@kamilkon-DESK.igk.intel.com>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Tue, 10 Jun 2025 18:28:11 +0200
X-Gm-Features: AX0GCFutgMayLwUgQPoyEHuI1AWMjndJI839Ec5ZPEWRgQL10qBoAwCqZ-GNEwM
Message-ID: <CACzuRywxL5AoJeTA2Sg43nvXg=fZNkBVP1SgycY8gmKuW-or-A@mail.gmail.com>
Subject: Re: [PATCH v3] tests/drm_virtgpu: Add functional coverage for core
 VirtIO-GPU ioctls
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dorinda Bassey <dbassey@redhat.com>, 
 igt-dev@lists.freedesktop.org, javierm@redhat.com, aesteve@redhat.com, 
 ernunes@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gH464erWtVxmR2_BagKuPeLxgHyGAxoHNcV0mkuDP9c_1749572903
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006293e406373a2f93"
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

--0000000000006293e406373a2f93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

Thanks for the review.

Please use checkpatch.pl script from Linux kernel, for usefull
> options see CONTRIBUTING.md
> You could ignore MAINTAINER or CamelCase but please fix others.

For this I believe I already formatted the v3 patch using this checkpatch.p=
l
script. Is there something I'm missing?

Same here, you could print number of opened devices (with drm_fd >=3D0)

Ack

Br,
Dorinda.

On Fri, Jun 6, 2025 at 5:56=E2=80=AFPM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Dorinda,
> On 2025-05-30 at 11:02:20 +0200, Dorinda Bassey wrote:
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
>
> Please use checkpatch.pl script from Linux kernel, for usefull
> options see CONTRIBUTING.md
> You could ignore MAINTAINER or CamelCase but please fix others.
>
> With that fixed
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> I will wait with merge for a review from someone in your Cc list.
>
> One more nit below.
>
> > ---
> > v3:
> > Fix resource format and clarify capset IDs
> >
> >  tests/drm_virtgpu.c | 420 ++++++++++++++++++++++++++++++++++++++++++++
> >  tests/meson.build   |   1 +
> >  2 files changed, 421 insertions(+)
> >  create mode 100644 tests/drm_virtgpu.c
> >
> > diff --git a/tests/drm_virtgpu.c b/tests/drm_virtgpu.c
> > new file mode 100644
> > index 000000000..4d7c9e8f5
> > --- /dev/null
> > +++ b/tests/drm_virtgpu.c
> > @@ -0,0 +1,420 @@
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
> > +#define VIRTGPU_DEVICE "/dev/dri/card0"
> > +
> > +#define CAPS_BUFFER_SIZE 4096
> > +#define MAX_CARDS 16
> > +
> > +int drm_fd;
> > +struct drm_virtgpu_resource_create args;
> > +bool resource_created;
> > +
> > +static int open_virtgpu_device(void)
> > +{
> > +     drmVersionPtr version;
> > +
> > +     for (int i =3D 0; i < MAX_CARDS; i++) {
> > +             char path[64];
> > +
> > +             snprintf(path, sizeof(path), "/dev/dri/card%d", i);
> > +             drm_fd =3D open(path, O_RDWR | O_CLOEXEC);
> > +             if (drm_fd < 0)
> > +                     continue;
> > +
> > +             version =3D drmGetVersion(drm_fd);
> > +             if (version && strcmp(version->name, "virtio_gpu") =3D=3D=
 0) {
> > +                     drmFreeVersion(version);
>
> You could print path here (with igt_info or igt_debug).
>
> > +                     return drm_fd;
> > +             }
> > +
> > +             drmFreeVersion(version);
> > +             close(drm_fd);
> > +     }
>
> Same here, you could print number of opened devices (with drm_fd >=3D0)
>
> Regards,
> Kamil
>
> > +     return -1;
> > +}
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
>
> ...cut...
>
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

--0000000000006293e406373a2f93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Kamil,</div><div><br></div><div>Thanks for the rev=
iew.</div><div><br></div><div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Please use <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=
=3D"_blank">checkpatch.pl</a> script from Linux kernel, for usefull<br>
options see CONTRIBUTING.md<br>
You could ignore MAINTAINER or CamelCase but please fix others.</blockquote=
>
</div><div>For this I believe I already formatted the v3 patch using this <=
a href=3D"http://checkpatch.pl">checkpatch.pl</a> script. Is there somethin=
g I&#39;m missing?</div><div><span class=3D"gmail-im"><br></span><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
Same here, you could print number of opened devices (with drm_fd &gt;=3D0)<=
/blockquote></div><div>Ack</div><div><br></div><div>Br,</div><div>Dorinda.<=
/div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr">On Fri, Jun 6, 2025 at 5:56=E2=80=AFPM Kamil Kon=
ieczny &lt;<a href=3D"mailto:kamil.konieczny@linux.intel.com">kamil.koniecz=
ny@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hi Dorinda,<br>
On 2025-05-30 at 11:02:20 +0200, Dorinda Bassey wrote:<br>
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
<br>
Please use <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_b=
lank">checkpatch.pl</a> script from Linux kernel, for usefull<br>
options see CONTRIBUTING.md<br>
You could ignore MAINTAINER or CamelCase but please fix others.<br>
<br>
With that fixed<br>
Acked-by: Kamil Konieczny &lt;<a href=3D"mailto:kamil.konieczny@linux.intel=
.com" target=3D"_blank">kamil.konieczny@linux.intel.com</a>&gt;<br>
<br>
I will wait with merge for a review from someone in your Cc list.<br>
<br>
One more nit below.<br>
<br>
&gt; ---<br>
&gt; v3:<br>
&gt; Fix resource format and clarify capset IDs<br>
&gt; <br>
&gt;=C2=A0 tests/drm_virtgpu.c | 420 ++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 tests/meson.build=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 421 insertions(+)<br>
&gt;=C2=A0 create mode 100644 tests/drm_virtgpu.c<br>
&gt; <br>
&gt; diff --git a/tests/drm_virtgpu.c b/tests/drm_virtgpu.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000..4d7c9e8f5<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/drm_virtgpu.c<br>
&gt; @@ -0,0 +1,420 @@<br>
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
&gt; +#define VIRTGPU_DEVICE &quot;/dev/dri/card0&quot;<br>
&gt; +<br>
&gt; +#define CAPS_BUFFER_SIZE 4096<br>
&gt; +#define MAX_CARDS 16<br>
&gt; +<br>
&gt; +int drm_fd;<br>
&gt; +struct drm_virtgpu_resource_create args;<br>
&gt; +bool resource_created;<br>
&gt; +<br>
&gt; +static int open_virtgpu_device(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drmVersionPtr version;<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version =3D drmGetVer=
sion(drm_fd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (version &amp;&amp=
; strcmp(version-&gt;name, &quot;virtio_gpu&quot;) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drmFreeVersion(version);<br>
<br>
You could print path here (with igt_info or igt_debug).<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return drm_fd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drmFreeVersion(versio=
n);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(drm_fd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
Same here, you could print number of opened devices (with drm_fd &gt;=3D0)<=
br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; +}<br>
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
<br>
...cut...<br>
<br>
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

--0000000000006293e406373a2f93--

