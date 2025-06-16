Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16B5C71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 16:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6EE10E102;
	Mon, 16 Jun 2025 16:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f9CqL3Rd";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9C110E102
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 16:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750091530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HNMSI7GYqaJ3exgMVqp8oMa7XpAPxSYdDMjvDmxQ0mk=;
 b=f9CqL3Rdr8+/x3+at2f03RRteEKWGnoZ8m7RpJqQzqEv/KH32Vx5VZUf+7YFQ/RJXFj+2H
 /f0PY0veXukrpGt3WSCdbkiUA5tICPiuE+uNhXiiredkZxxCRQz8D1drIfPhP6WTHXoOV+
 2MpDqbVt5dLUzvOOTi7GXi+5GIwIdxc=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-Z59CY4mzOGy5ypmQtNnhwQ-1; Mon, 16 Jun 2025 12:32:08 -0400
X-MC-Unique: Z59CY4mzOGy5ypmQtNnhwQ-1
X-Mimecast-MFC-AGG-ID: Z59CY4mzOGy5ypmQtNnhwQ_1750091528
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3ddbec809acso55945615ab.2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 09:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750091528; x=1750696328;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HNMSI7GYqaJ3exgMVqp8oMa7XpAPxSYdDMjvDmxQ0mk=;
 b=Q20UBmyhw02Sq4tTvc0AAy/EZOqDJiu797Vj1ieRi5Dp9unl/g65oYv6E6grDoHLqr
 KHqdpg5E3sTo2GlrFTKlWZXMaV1ZQoGjNhGlShZBO9qTnJo/WoX3q83eoAwNULTrmfNG
 l1AVF5n/GNZC5O0ERZcZdu+Y6V6qng5q1p7URCG9o7E5g+yNVZwB+ocaYBWzceP5B5wt
 7S9E7bEH9LqQ0f/b3duTrWSrQuW+dec6DhoSNurGdQ12OR8a5zkGNA0nqYnuyG73jnEd
 eU8AaERK/CG8cybNWtnu/q4JTBe1qNuNecxNdum2y55xeYkB81sJQdupuWSR2J8GbzOU
 V/Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsCFLMQCqTPG/wTHrxSLwFtPsxRMbOwqg91qzzyhPJzeWNz9ccszcoBrQ37gdCHBewkDy0A3jb@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+A4qMR1RJmy5H5uzeljaF4a560RfhAqHzpDt3YD7l8xXRHaF0
 atzPCxYi0aSH04VYksuPuG0Cxe5ds2vbR3lcso852th1KesKhleW6stnK0FZlydFSU6IR2q7u/a
 LX9Q1BHHNylX+4R8H/l29rYREGAPrlD8oW35oA2alLQ8USZ/tukSClSSpvBdolJZEyfq04lVUBj
 zk+GylBZAFcjr2kUGUlQiIlyoh38dy2uUTdJu2tU78BA==
X-Gm-Gg: ASbGncu7KrCiISVfD07ycP0goDgKCfQM6qGrGZmpHM98lSEh+bNd0OFTelvgBt4u4QE
 Yyqkm68CJCyMBR2fj2PoGkCykVo5DzGbHWedq2bO7u+B2yphA6TChbRF3vKwnGKu7/Fmx1EqEDT
 Yu3AdD6w==
X-Received: by 2002:a05:6e02:1a2b:b0:3dd:ce95:7f36 with SMTP id
 e9e14a558f8ab-3de07c4c2cemr111428085ab.4.1750091527779; 
 Mon, 16 Jun 2025 09:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErBwZrdA7CIlADT38HrsXMlxC/0pPPdP7zUPaYj1ecTd9yxjjpxaJvMjw6mknglHgdDtmITT8MBKNuu3HSwXo=
X-Received: by 2002:a05:6e02:1a2b:b0:3dd:ce95:7f36 with SMTP id
 e9e14a558f8ab-3de07c4c2cemr111427715ab.4.1750091527388; Mon, 16 Jun 2025
 09:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250610163135.1122267-1-dbassey@redhat.com>
 <a1ede824-3651-429a-a269-0e933066b12a@redhat.com>
 <20250611170405.hyn3jomelj5bmla5@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250611170405.hyn3jomelj5bmla5@kamilkon-DESK.igk.intel.com>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Mon, 16 Jun 2025 18:31:56 +0200
X-Gm-Features: AX0GCFutsbN6W5AwG2S-WKCh-aOea1GUYP_LhADTRIK7UaF3hMz9xBVJKNwMCyw
Message-ID: <CACzuRyz_iJgA97C_zgbTB17OA7F6CLocpKzsYBPvGyu=OGEysw@mail.gmail.com>
Subject: Re: [PATCH v4] tests/drm_virtgpu: Add functional coverage for core
 VirtIO-GPU ioctls
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Erico Nunes <ernunes@redhat.com>, 
 Dorinda Bassey <dbassey@redhat.com>, igt-dev@lists.freedesktop.org,
 javierm@redhat.com, aesteve@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KcZRleA39KHPc3se__MspHdgdcq87gL92p5MaquNijU_1750091528
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d0acd50637b2efb3"
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

--000000000000d0acd50637b2efb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Thank you Erico and Kamil for the reviews. very much appreciated.

BR,
Dorinda.

On Wed, Jun 11, 2025 at 7:05=E2=80=AFPM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Erico,
> On 2025-06-11 at 18:10:52 +0200, Erico Nunes wrote:
> > Hello,
> >
> > On 6/10/25 6:30 PM, Dorinda Bassey wrote:
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
> > >
> > > How to Test with QEMU virtio-vga-gl or rustvmm vhost-device-gpu
> > >
> > > 1. Launch a QEMU guest with virtio-vga-gl
> > > ./build/qemu-system-x86_64 \
> > >   -enable-kvm \
> > >   -cpu host \
> > >   -m 4096 \
> > >   -machine q35 \
> > >   -display gtk,gl=3Don \
> > >   -vga none \
> > >   -device virtio-vga-gl \
> > >   -drive file=3Dimage.qcow2,format=3Dqcow2 \
> > >   -netdev user,id=3Dn0,hostfwd=3Dtcp::2222-:22 \
> > >   -device virtio-net-pci,netdev=3Dn0
> > >
> > > ssh into the guest and run the tests.
> > >
> > > 2. Start the vhost-device-gpu backend and Launch a QEMU
> > > guest with vhost-user-gpu-pci or vhost-user-vga, see guide on:
> > > https://crates.io/crates/vhost-device-gpu
> >
> > Overall this looks quite good to me. Thanks for doing this initial batc=
h
> > of tests for virtio-gpu. I think it is a good start to build upon and
> > start enabling some more DRM tests in CIs especially since this can
> > astract hardware details.
> >
> > I have a couple of comments below, to consider if you will do another
> > respin:
> >
> >
> > >
> > >  tests/drm_virtgpu.c | 425 ++++++++++++++++++++++++++++++++++++++++++=
++
> > >  tests/meson.build   |   1 +
> > >  2 files changed, 426 insertions(+)
> > >  create mode 100644 tests/drm_virtgpu.c
> >
> > Would it make sense for this to live in its own subdirectory? Since it
> > is testing "device-specific" commands (for virtio-gpu being the device)=
.
> > I see that some of the other drivers have their own directory, and
> > currently this one is bundled together with some fairly generic DRM or
> > KMS API tests in meson.build.
> > But I'm not sure if there is a policy for this so I'd leave it to the
> > igt maintainers.
> >
>
> Lets start with something simple, new folder could be created when
> there will be more virtgpu tests.
>
> > > +#define VIRTGPU_DEVICE "/dev/dri/card0"
> >
> > VIRTGPU_DEVICE is unused since an earlier revision, so it can be remove=
d.
> >
>
> Thank you for spotting this.
>
> Regards,
> Kamil
>
> > > +static const struct {
> > > +   const char *name;
> > > +   uint64_t id;
> > > +} params[] =3D {
> > > +   {"3D_FEATURES", VIRTGPU_PARAM_3D_FEATURES},
> > > +   {"CAPSET_QUERY_FIX", VIRTGPU_PARAM_CAPSET_QUERY_FIX},
> > > +   {"RESOURCE_BLOB", VIRTGPU_PARAM_RESOURCE_BLOB},
> > > +   {"HOST_VISIBLE", VIRTGPU_PARAM_HOST_VISIBLE},
> > > +   {"CROSS_DEVICE", VIRTGPU_PARAM_CROSS_DEVICE},
> > > +   {"CONTEXT_INIT", VIRTGPU_PARAM_CONTEXT_INIT},
> > > +   {"SUPPORTED_CAPSET_IDs", VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs},
> > > +   {"EXPLICIT_DEBUG_NAME", VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME},
> > > +};
> >
> > Might make sense to move this params array to the "drm-virtgpu-getparam=
"
> > subtest since it is only used there.
> >
> > Considering these you can add my:
> > Reviewed-by: Erico Nunes <ernunes@redhat.com>
> >
> > Thanks
> >
> > Erico
> >
>
>

--000000000000d0acd50637b2efb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>Thank you Erico and =
Kamil for the reviews. very much appreciated.<br></div><div><br></div><div>=
BR,</div><div>Dorinda.</div></div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 11, 2025 at 7=
:05=E2=80=AFPM Kamil Konieczny &lt;<a href=3D"mailto:kamil.konieczny@linux.=
intel.com">kamil.konieczny@linux.intel.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi Erico,<br>
On 2025-06-11 at 18:10:52 +0200, Erico Nunes wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; On 6/10/25 6:30 PM, Dorinda Bassey wrote:<br>
&gt; &gt; This test suite adds coverage for multiple DRM ioctls specific<br=
>
&gt; &gt; to the VirtIO-GPU driver, verifying functionality such as<br>
&gt; &gt; resource creation, memory mapping, 3D transfers, context<br>
&gt; &gt; initialization, and parameter querying.<br>
&gt; &gt; Each test validates a key ioctl to ensure correct behavior from<b=
r>
&gt; &gt; user space and backend implementations. Each subtest is<br>
&gt; &gt; self-contained and can be executed independently.<br>
&gt; &gt; <br>
&gt; &gt; Included subtests:<br>
&gt; &gt;=C2=A0 =C2=A0- drm-virtgpu-map<br>
&gt; &gt;=C2=A0 =C2=A0- drm-virtgpu-execbuffer<br>
&gt; &gt;=C2=A0 =C2=A0- drm-virtgpu-resource-info<br>
&gt; &gt;=C2=A0 =C2=A0- drm-virtgpu-3d-transfer-to-host<br>
&gt; &gt;=C2=A0 =C2=A0- drm-virtgpu-3d-transfer-from-host<br>
&gt; &gt;=C2=A0 =C2=A0- drm-virtgpu-3d-wait<br>
&gt; &gt;=C2=A0 =C2=A0- drm-virtgpu-resource-create-blob<br>
&gt; &gt;=C2=A0 =C2=A0- drm-virtgpu-get-caps<br>
&gt; &gt;=C2=A0 =C2=A0- drm-virtgpu-context-init<br>
&gt; &gt;=C2=A0 =C2=A0- drm-virtgpu-getparam<br>
&gt; &gt; <br>
&gt; &gt; How to Test with QEMU virtio-vga-gl or rustvmm vhost-device-gpu<b=
r>
&gt; &gt; <br>
&gt; &gt; 1. Launch a QEMU guest with virtio-vga-gl<br>
&gt; &gt; ./build/qemu-system-x86_64 \<br>
&gt; &gt;=C2=A0 =C2=A0-enable-kvm \<br>
&gt; &gt;=C2=A0 =C2=A0-cpu host \<br>
&gt; &gt;=C2=A0 =C2=A0-m 4096 \<br>
&gt; &gt;=C2=A0 =C2=A0-machine q35 \<br>
&gt; &gt;=C2=A0 =C2=A0-display gtk,gl=3Don \<br>
&gt; &gt;=C2=A0 =C2=A0-vga none \<br>
&gt; &gt;=C2=A0 =C2=A0-device virtio-vga-gl \<br>
&gt; &gt;=C2=A0 =C2=A0-drive file=3Dimage.qcow2,format=3Dqcow2 \<br>
&gt; &gt;=C2=A0 =C2=A0-netdev user,id=3Dn0,hostfwd=3Dtcp::2222-:22 \<br>
&gt; &gt;=C2=A0 =C2=A0-device virtio-net-pci,netdev=3Dn0<br>
&gt; &gt; <br>
&gt; &gt; ssh into the guest and run the tests.<br>
&gt; &gt; <br>
&gt; &gt; 2. Start the vhost-device-gpu backend and Launch a QEMU<br>
&gt; &gt; guest with vhost-user-gpu-pci or vhost-user-vga, see guide on:<br=
>
&gt; &gt; <a href=3D"https://crates.io/crates/vhost-device-gpu" rel=3D"nore=
ferrer" target=3D"_blank">https://crates.io/crates/vhost-device-gpu</a><br>
&gt; <br>
&gt; Overall this looks quite good to me. Thanks for doing this initial bat=
ch<br>
&gt; of tests for virtio-gpu. I think it is a good start to build upon and<=
br>
&gt; start enabling some more DRM tests in CIs especially since this can<br=
>
&gt; astract hardware details.<br>
&gt; <br>
&gt; I have a couple of comments below, to consider if you will do another<=
br>
&gt; respin:<br>
&gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 tests/drm_virtgpu.c | 425 +++++++++++++++++++++++++++++++++=
+++++++++++<br>
&gt; &gt;=C2=A0 tests/meson.build=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt;=C2=A0 2 files changed, 426 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 tests/drm_virtgpu.c<br>
&gt; <br>
&gt; Would it make sense for this to live in its own subdirectory? Since it=
<br>
&gt; is testing &quot;device-specific&quot; commands (for virtio-gpu being =
the device).<br>
&gt; I see that some of the other drivers have their own directory, and<br>
&gt; currently this one is bundled together with some fairly generic DRM or=
<br>
&gt; KMS API tests in meson.build.<br>
&gt; But I&#39;m not sure if there is a policy for this so I&#39;d leave it=
 to the<br>
&gt; igt maintainers.<br>
&gt; <br>
<br>
Lets start with something simple, new folder could be created when<br>
there will be more virtgpu tests.<br>
<br>
&gt; &gt; +#define VIRTGPU_DEVICE &quot;/dev/dri/card0&quot;<br>
&gt; <br>
&gt; VIRTGPU_DEVICE is unused since an earlier revision, so it can be remov=
ed.<br>
&gt; <br>
<br>
Thank you for spotting this.<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; &gt; +static const struct {<br>
&gt; &gt; +=C2=A0 =C2=A0const char *name;<br>
&gt; &gt; +=C2=A0 =C2=A0uint64_t id;<br>
&gt; &gt; +} params[] =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0{&quot;3D_FEATURES&quot;, VIRTGPU_PARAM_3D_FEATURES=
},<br>
&gt; &gt; +=C2=A0 =C2=A0{&quot;CAPSET_QUERY_FIX&quot;, VIRTGPU_PARAM_CAPSET=
_QUERY_FIX},<br>
&gt; &gt; +=C2=A0 =C2=A0{&quot;RESOURCE_BLOB&quot;, VIRTGPU_PARAM_RESOURCE_=
BLOB},<br>
&gt; &gt; +=C2=A0 =C2=A0{&quot;HOST_VISIBLE&quot;, VIRTGPU_PARAM_HOST_VISIB=
LE},<br>
&gt; &gt; +=C2=A0 =C2=A0{&quot;CROSS_DEVICE&quot;, VIRTGPU_PARAM_CROSS_DEVI=
CE},<br>
&gt; &gt; +=C2=A0 =C2=A0{&quot;CONTEXT_INIT&quot;, VIRTGPU_PARAM_CONTEXT_IN=
IT},<br>
&gt; &gt; +=C2=A0 =C2=A0{&quot;SUPPORTED_CAPSET_IDs&quot;, VIRTGPU_PARAM_SU=
PPORTED_CAPSET_IDs},<br>
&gt; &gt; +=C2=A0 =C2=A0{&quot;EXPLICIT_DEBUG_NAME&quot;, VIRTGPU_PARAM_EXP=
LICIT_DEBUG_NAME},<br>
&gt; &gt; +};<br>
&gt; <br>
&gt; Might make sense to move this params array to the &quot;drm-virtgpu-ge=
tparam&quot;<br>
&gt; subtest since it is only used there.<br>
&gt; <br>
&gt; Considering these you can add my:<br>
&gt; Reviewed-by: Erico Nunes &lt;<a href=3D"mailto:ernunes@redhat.com" tar=
get=3D"_blank">ernunes@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Thanks<br>
&gt; <br>
&gt; Erico<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000d0acd50637b2efb3--

