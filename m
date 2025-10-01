Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774B9CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 18:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1642710E058;
	Wed,  1 Oct 2025 18:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="g/4M/xox";
	dkim-atps=neutral
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE7110E058
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 18:52:42 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-85780d76b48so18947685a.1
 for <igt-dev@lists.freedesktop.org>; Wed, 01 Oct 2025 11:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759344761; x=1759949561;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F76ZwaaMuP1z9EoNNo3QVVj33Lj7mrDPlBQ55lYmdJs=;
 b=g/4M/xoxj363/bRZHKLsLPDycu+OnFRsS7DpEp23ZPM8sVqbO3JU3aXgey1Vf4xgYU
 4bXS9CvK61fUO01Re55+ciokFSbI+zbiBfP/3xj/fMj9oxW13v/vYOCuD5YzxMxKIkB3
 6iDQhfEJB9ICgLjaR961l4Z0g+soxvOngH/Ah+BX70SU0+1GvRi6u3v8IA16YnGuCav8
 dP1ID87wBwYeEMW2WruHYmX9lI5IKXjGecgBk3qVisovnUUYXYzixgu4kpl/auELZvqK
 JWN6grfMMQY3nmh9s/aQ/R2OGxC4iTO8jMTViBuATbyMeKNZwiysUCNCmvAVDmbFYGS+
 sbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759344761; x=1759949561;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F76ZwaaMuP1z9EoNNo3QVVj33Lj7mrDPlBQ55lYmdJs=;
 b=sIRrpfB77roRN0ikAjkL4thOAmgzuGnnt8uFK01mG+4kHPRyscs0Y0o3WF4pumvy42
 Y0+XGVP0oiCARC3IR5lYhNF12Y+Hz94f2mLQ4T83MYmkT6Qu7zFdFTCn07zaE20Xc3LS
 0W3D1pYFLMrDQCae81sX80a2IpJEuoFiwdXsURcanS32mCzzuikHbskrM0WYG91uJROa
 vRi/CLngIHTzVg1AD7gfz+gs3xTa8zID5VvIPpNj5fiF2fPfVIsmZZ5HOR1tpMGRXKIq
 mTafk8shAGZQLLa7uveysGk+VK4f3zulVkwWwhUnjOa7xGc0oSBxKL26k1K9CRDr4v3T
 v7Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfdp499pvD73McSK/blbYjly18s81t7mclGjVq6Qbwb4f4XZws9w2PegSMMaGDDVmG5B9YmBwM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSGIySqOpLx+DZi11UyuLnJM3zFvzR5SfcDar5ZFfiwAb70DP3
 7iP99+E1ZBCdgCkU8szAcd5orzo70M256E5lWkRp2GHJ9+d3qK6KSEmP8R3jMymx6QRED9xWnWo
 i0B0EgjoBt1pl7Xz+pbGkNY7ZSwQATWxWwb/FDEA5
X-Gm-Gg: ASbGncvvdLJLIu/Ni/hTMOF0YQPqQoH8g+QIf1BXafNUK3vWBcD1ZSn3n4zRecjE/AB
 NfnQeJ8rK9hpvcCw8aWvQzeLCCnmB1z+A28ExyXepzL9HvWzUoX7L/EiyadTOAxa6glRSF/gPH0
 Tb/lLnlcqCf4OcmrbpC2dzVWyqN3n355aQXKEbFYqDfLD8XZyY3O0C/VTc1cLmWrMIXo2ENDMsX
 EGw5a5Z5qWvu9vS/lhpvsurYZR3HI4xefnOgWsOnc2hHmHN9wmFvWhcQeKNGqwN8NPw
X-Google-Smtp-Source: AGHT+IHQjlKlTez1fVPWgEpfuGr3hBYGvlRcShHkscUt6ISoTsnsHYtMYGtV1ay2TVv36A5Bh02D0in/3zJ14r4YDsY=
X-Received: by 2002:a05:620a:45aa:b0:85d:df83:f6a7 with SMTP id
 af79cd13be357-87371450e81mr628360185a.29.1759344761113; Wed, 01 Oct 2025
 11:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251001163635.3353517-1-markyacoub@google.com>
 <20251001183223.dt7rybzbu5bglbeq@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251001183223.dt7rybzbu5bglbeq@kamilkon-DESK.igk.intel.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Wed, 1 Oct 2025 14:52:29 -0400
X-Gm-Features: AS18NWA89Nwn3KwIriVGyiRdM_KgznCNlYBZPjLq7s4jfUrsNtenNH3uermYzJo
Message-ID: <CAC0gqY7rKxL3zz3sycCwFn6p-Bh1F8Mo=xOKJ+WWvfHr+nSMxg@mail.gmail.com>
Subject: Re: [PATCH i-g-t] lib/drmtest: Allow DRIVER_ANY tests to run on VKMS
 when supported.
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, 
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com
Content-Type: multipart/alternative; boundary="00000000000086d7e006401d5f39"
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

--00000000000086d7e006401d5f39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 2:32=E2=80=AFPM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Mark,
> On 2025-10-01 at 12:36:34 -0400, Mark Yacoub wrote:
> > [Why]
> > Android's VM use virtio-gpu as its default driver, but VKMS can be
> > enabled on top it.
> > VKMS is the preferred driver to run IGT.
> >
> > [How]
> > To maintain the current way to preferring hardware drivers, introduce a
> > "PREFER_VKMS" flag which does not remove DRIVER_VKMS from the list of
> > drivers to be opened. Android will keep this as always true.
> >
> > Also, added explicit support for virtio-gpu to be explictly filtered
> > out, making room for VKMS to be the primary driver in use.
> >
> > Test: kms_bw on AVD
> > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > ---
> >  lib/drmtest.c |  1 +
> >  lib/drmtest.h | 18 +++++++++++-------
> >  2 files changed, 12 insertions(+), 7 deletions(-)
> >
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index 551385867..a1fb0b5ba 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -223,6 +223,7 @@ static const struct module {
> >       { DRIVER_V3D, "v3d" },
> >       { DRIVER_VC4, "vc4" },
> >       { DRIVER_VGEM, "vgem" },
> > +     { DRIVER_VIRTIO, "virtio_gpu" },
>
> Please add it properly with a define, like others.
>
done. it was missed during a copy-paste to a clean branch.

>
> >       { DRIVER_VKMS, "vkms" },
> >       { DRIVER_VMWGFX, "vmwgfx" },
> >       { DRIVER_XE, "xe" },
> > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > index a9542dde2..32fec584a 100644
> > --- a/lib/drmtest.h
> > +++ b/lib/drmtest.h
> > @@ -37,6 +37,7 @@
> >  #include <xf86drm.h>
> >
> >  #include "igt_core.h"
> > +#include "config.h"
> >
> >  int __get_drm_device_name(int fd, char *name, int name_size);
> >
> > @@ -58,14 +59,17 @@ int __get_drm_device_name(int fd, char *name, int
> name_size);
> >  #define DRIVER_VKMS  (1 << 9)
> >
> >  /*
> > - * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
> > - * with vgem as well as a supported driver, you can end up with a
> > - * near-100% skip rate if you don't explicitly specify the device,
> > - * depending on device-load ordering.
> > - *
> > - * Exclude VKMS to prefer hardware drivers.
> > + * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if
> > + * you run on a system with vgem or virtio-gpu as well as a supported
> driver,
> > + * you can end up with a near-100% skip rate if you don't explicitly
> specify
> > + * the device, depending on device-load ordering.
> >   */
> > -#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS)
> > +#ifdef PREFER_VKMS
>
> Please no ifdef's when no needed, if anyone wants that igt test
> uses some other driver, it could have IGT_FORCE_DRIVER=3Dsome_gpu_driver
>
> > +#define DRIVER_ANY   ~(DRIVER_VGEM  | DRIVER_VIRTIO)
> > +#else
> > +/* Exclude VKMS to prefer hardware drivers if VKMS is not the preferre=
d
> driver. */
> > +#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
>
> This should be without any conditional.
>
done. did undef then def again.


> Please also send code which compile, see CI report.
>
my apologies. it was missed during a copy-paste to a clean branch.  The
working branch was tested on an android VM.
V2 uploaded.

>
> Regards,
> Kamil
>
> > +#endif
> >
> >  /*
> >   * Compile friendly enum for i915/xe.
> > --
> > 2.51.0.618.g983fd99d29-goog
> >
>

--00000000000086d7e006401d5f39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 1, =
2025 at 2:32=E2=80=AFPM Kamil Konieczny &lt;<a href=3D"mailto:kamil.koniecz=
ny@linux.intel.com">kamil.konieczny@linux.intel.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Mark,<br>
On 2025-10-01 at 12:36:34 -0400, Mark Yacoub wrote:<br>
&gt; [Why]<br>
&gt; Android&#39;s VM use virtio-gpu as its default driver, but VKMS can be=
<br>
&gt; enabled on top it.<br>
&gt; VKMS is the preferred driver to run IGT.<br>
&gt; <br>
&gt; [How]<br>
&gt; To maintain the current way to preferring hardware drivers, introduce =
a<br>
&gt; &quot;PREFER_VKMS&quot; flag which does not remove DRIVER_VKMS from th=
e list of<br>
&gt; drivers to be opened. Android will keep this as always true.<br>
&gt; <br>
&gt; Also, added explicit support for virtio-gpu to be explictly filtered<b=
r>
&gt; out, making room for VKMS to be the primary driver in use.<br>
&gt; <br>
&gt; Test: kms_bw on AVD<br>
&gt; Signed-off-by: Mark Yacoub &lt;<a href=3D"mailto:markyacoub@google.com=
" target=3D"_blank">markyacoub@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 lib/drmtest.c |=C2=A0 1 +<br>
&gt;=C2=A0 lib/drmtest.h | 18 +++++++++++-------<br>
&gt;=C2=A0 2 files changed, 12 insertions(+), 7 deletions(-)<br>
&gt; <br>
&gt; diff --git a/lib/drmtest.c b/lib/drmtest.c<br>
&gt; index 551385867..a1fb0b5ba 100644<br>
&gt; --- a/lib/drmtest.c<br>
&gt; +++ b/lib/drmtest.c<br>
&gt; @@ -223,6 +223,7 @@ static const struct module {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ DRIVER_V3D, &quot;v3d&quot; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ DRIVER_VC4, &quot;vc4&quot; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ DRIVER_VGEM, &quot;vgem&quot; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ DRIVER_VIRTIO, &quot;virtio_gpu&quot; },<br>
<br>
Please add it properly with a define, like others.<br></blockquote><div>don=
e. it was missed during a copy-paste to a clean branch.=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ DRIVER_VKMS, &quot;vkms&quot; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ DRIVER_VMWGFX, &quot;vmwgfx&quot; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ DRIVER_XE, &quot;xe&quot; },<br>
&gt; diff --git a/lib/drmtest.h b/lib/drmtest.h<br>
&gt; index a9542dde2..32fec584a 100644<br>
&gt; --- a/lib/drmtest.h<br>
&gt; +++ b/lib/drmtest.h<br>
&gt; @@ -37,6 +37,7 @@<br>
&gt;=C2=A0 #include &lt;xf86drm.h&gt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &quot;igt_core.h&quot;<br>
&gt; +#include &quot;config.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 int __get_drm_device_name(int fd, char *name, int name_size);<br=
>
&gt;=C2=A0 <br>
&gt; @@ -58,14 +59,17 @@ int __get_drm_device_name(int fd, char *name, int =
name_size);<br>
&gt;=C2=A0 #define DRIVER_VKMS=C2=A0 (1 &lt;&lt; 9)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt; - * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system<br=
>
&gt; - * with vgem as well as a supported driver, you can end up with a<br>
&gt; - * near-100% skip rate if you don&#39;t explicitly specify the device=
,<br>
&gt; - * depending on device-load ordering.<br>
&gt; - *<br>
&gt; - * Exclude VKMS to prefer hardware drivers.<br>
&gt; + * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if<br>
&gt; + * you run on a system with vgem or virtio-gpu as well as a supported=
 driver,<br>
&gt; + * you can end up with a near-100% skip rate if you don&#39;t explici=
tly specify<br>
&gt; + * the device, depending on device-load ordering.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -#define DRIVER_ANY=C2=A0 =C2=A0~(DRIVER_VGEM | DRIVER_VKMS)<br>
&gt; +#ifdef PREFER_VKMS<br>
<br>
Please no ifdef&#39;s when no needed, if anyone wants that igt test<br>
uses some other driver, it could have IGT_FORCE_DRIVER=3Dsome_gpu_driver<br=
>
<br>
&gt; +#define DRIVER_ANY=C2=A0 =C2=A0~(DRIVER_VGEM=C2=A0 | DRIVER_VIRTIO)<b=
r>
&gt; +#else<br>
&gt; +/* Exclude VKMS to prefer hardware drivers if VKMS is not the preferr=
ed driver. */<br>
&gt; +#define DRIVER_ANY=C2=A0 =C2=A0~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_V=
IRTIO)<br>
<br>
This should be without any conditional.<br></blockquote><div>done. did unde=
f then def again.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
Please also send code which compile, see CI report.<br></blockquote><div>my=
 apologies. it was missed during a copy-paste to a clean branch.=C2=A0 The =
working branch was tested on an android VM.</div><div>V2 uploaded.</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Kamil<br>
<br>
&gt; +#endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Compile friendly enum for i915/xe.<br>
&gt; -- <br>
&gt; 2.51.0.618.g983fd99d29-goog<br>
&gt; <br>
</blockquote></div></div>

--00000000000086d7e006401d5f39--
