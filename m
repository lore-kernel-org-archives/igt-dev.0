Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C99CCD184
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 16:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE43A10E159;
	Thu,  9 Oct 2025 16:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0tExObya";
	dkim-atps=neutral
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE6510E159
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 16:53:37 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-87a0801ba1aso154312385a.2
 for <igt-dev@lists.freedesktop.org>; Thu, 09 Oct 2025 09:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760028816; x=1760633616;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oBhHt/G6EtQM2MAV5TjQ2PZQP46PqQyF6dRvhKk+u2A=;
 b=0tExObyauv3sUOv0zidka9AGI3Av/GapmDAy4U/dXSj0cIxDBvk6g6a7Uq3YoCyvQ8
 9aoBe8S05ykabel7ePshJOf79EPAwv4Hkc7UYziLgFfHmHQ+/nkk56x4TQ31pjCJYJ2G
 3IuwpZRhD3T2sGy7nPSf20ZM96AQK2ORteuMr+chyniWQEcIgS8rICETCYBybPviQ0uD
 IMukLjoG63bW3xMg3DR+d9UQZvEh7cqBJvgQCKyJ9LZ9G9NNYAX5KW7YEG1ltmNIasP0
 eF2bytQx5tJ96vrywCZzY4Y7DZ0+6kN4+bBFT9m+x8+Ys8A71Lvq1bg8d6N3t4JAznWW
 Eoqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760028816; x=1760633616;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oBhHt/G6EtQM2MAV5TjQ2PZQP46PqQyF6dRvhKk+u2A=;
 b=F36utsbLv28pcPA4DYzqRZhXQZCLDk2npaECBHoYZ9o2XtOlXm4m68ra6DBfpnF7gw
 pvsuCKBkiXEOzDeXomrv0LfpPdSIXrC/Uqkp+lJzEuiqufnA1+d87JdvgRWaFwA5Mo5v
 f3mQLzztbPhMahyMEnitqft6ZPUSZLO4h/zdz6TwEX+B+fUJCykluSLCqJz23e0jdtBH
 hVjaLLKjEQh6uvpfN4Ml64xwSQszw3RnPckq2Dzj9w2+LX82bupjNdK/k4aKYesv6uol
 qsKFtSV/IqLrFD3saGfqH/z/fPGNT/VfxFEZzCZwEIZF7ZS52nh0KfZYDi/V4v/XbtRV
 Wwmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD+v93y8g3xFH5MboGmAXv6/LEi7mZQuR7RYQ7UchagjtO0qPs7kFr8ChgNc23qNGcI34ECmfj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRWAU4iSxDb4T02OwI11rQNXe8ab4l3Vl2y317q5tbRuchxlXq
 cAxHQc8Ay2dnFRav5/u67U0gVSs830j7p9Ek9h/vDBO7z8sWhKJvAdRhjklJ04OB0bztqFIdzn1
 h952mtl2MVQptaaeR5VY8jHrd8Afcd4H46z1tf1+p
X-Gm-Gg: ASbGncuZAMcF/xsa8YOZ19jXhmQ/7b8I3Dt45UIzMfPJ6jGzMrDTjSAOM9J8ej3zPVa
 Yjuvs7s2V/XUVnicr90FqE9XCdUsudKUxBYtlgehLrjCxxKiVNTYdDikNdT4S8sfubNdHGYx4yJ
 L4T7q6BRE06XKhtkPE2/kBqMMzcRRYLCmpxUam/w4qf0n+ZBwSvieHy5OGt3E6s5oAOQQIVfYGA
 D3e5ozptyH7maDn33A3bbnrnyy2LaMRlWCDyFKb8CpSeiQb
X-Google-Smtp-Source: AGHT+IHnm1kGpXP0WQsM0F5s2yRScbAf0vS2bqt78j+LJts+6fNSNhsSuWMk/Xg2DIqlsd/AkRJZPuv3M4/uKpuMNzY=
X-Received: by 2002:a05:620a:1711:b0:805:f094:8abf with SMTP id
 af79cd13be357-883504a9cc6mr1179967785a.24.1760028815490; Thu, 09 Oct 2025
 09:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251008160209.463702-1-markyacoub@google.com>
 <20251009164600.btzj5kiscl5ftdl7@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251009164600.btzj5kiscl5ftdl7@kamilkon-DESK.igk.intel.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Thu, 9 Oct 2025 12:53:24 -0400
X-Gm-Features: AS18NWBgaetax4Uiv5o2aIbK96hsbzP0-s-jpHMNVgEeHdlkscZ2P5rNb_KW6pA
Message-ID: <CAC0gqY7ZeCZPP8WHPq8uS-sOZVGpi8Fnzn-uDsWdt4jW72B8RA@mail.gmail.com>
Subject: Re: [PATCH i-g-t] lib/drmtest: Remove VKMS from Exclusion list
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, 
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com, 
 juhapekka.heikkila@gmail.com
Content-Type: multipart/alternative; boundary="0000000000005860d80640bca41b"
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

--0000000000005860d80640bca41b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

Thanks for your feedback. I'd like to elaborate on my use case to provide
more context about the problem I'm trying to solve.

I am building IGT for Android, and the same build system is deployed on
both physical hardware and virtual machines. On the hardware, the
appropriate hardware driver is correctly detected, so there are no issues
there. However, on the VM, VKMS is running, but it's currently excluded
from `DRIVER_ANY`, which prevents the tests from running against it. I need
the tests to execute on VKMS in this scenario.

Using `IGT_FORCE_DRIVER` would require me to fork the build processes for
hardware and VM, which I would prefer to avoid. My goal is to maintain a
unified build system and allow IGT to run on whatever driver is present. Is
there a way to achieve this?

I understand that the current code prioritizes the hardware driver, which
is a desirable behavior. I'm trying to understand the potential issues that
might arise if VKMS were not excluded in other contexts.

Thank you!
Mark


On Thu, Oct 9, 2025 at 12:46=E2=80=AFPM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Mark,
> On 2025-10-08 at 12:02:09 -0400, Mark Yacoub wrote:
> > [Why]
> > VKMS (Virtual VKMS) is typically running on a virtual machine where it'=
s
> > expected to be without a contention with a hardware driver.
> > When it's there, we would like to run IGT on it.
> >
> > [How]
> > Delete VKMS from DRIVER_ANY's exclusion list to allow IGT to be picked
> > up.
> >
> > Tested: Ran kms_bw on Android's VM with VKMS enabled.
> >
> > Change-Id: Ib13ad9261b8c2617370c02d0ffb5aa878bf3d8f8
> > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > ---
> >  lib/drmtest.h | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > index 8416aa491..ab991da57 100644
> > --- a/lib/drmtest.h
> > +++ b/lib/drmtest.h
> > @@ -63,10 +63,8 @@ int __get_drm_device_name(int fd, char *name, int
> name_size);
> >   * on a system with them as well as a supported driver, you can end up
> >   * with a near-100% skip rate if you don't explicitly specify the
> device,
> >   * depending on device-load ordering.
> > - *
> > - * Exclude VKMS to prefer hardware drivers.
> >   */
> > -#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
> > +#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VIRTIO)
>
> Nak, this is bad as there could be vkms module also on host.
>
> Let me work on improving IGT_FORCE_DRIVER.
>
> Regards,
> Kamil
>
> >
> >  /*
> >   * Compile friendly enum for i915/xe.
> > --
> > 2.51.0.740.g6adb054d12-goog
> >
>

--0000000000005860d80640bca41b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Kamil,</div><div><br></div><div>Thanks for your fe=
edback. I&#39;d like to elaborate on my use case to provide more context ab=
out the problem I&#39;m trying to solve.</div><div><br></div><div>I am buil=
ding IGT for Android, and the same build system is deployed on both physica=
l hardware and virtual machines. On the hardware, the appropriate hardware =
driver is correctly detected, so there are no issues there. However, on the=
 VM, VKMS is running, but it&#39;s currently excluded from `DRIVER_ANY`, wh=
ich prevents the tests from running against it. I need the tests to execute=
 on VKMS in this scenario.</div><div><br></div><div>Using `IGT_FORCE_DRIVER=
` would require me to fork the build processes for hardware and VM, which I=
 would prefer to avoid. My goal is to maintain a unified build system and a=
llow IGT to run on whatever driver is present. Is there a way to achieve th=
is?</div><div><br></div><div>I understand that the current code prioritizes=
 the hardware driver, which is a desirable behavior. I&#39;m trying to unde=
rstand the potential issues that might arise if VKMS were not excluded in o=
ther contexts.</div><div><br></div><div>Thank you!</div><div>Mark</div></di=
v><br><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu, Oct 9, 2025 at 12:46=E2=80=AFPM Kamil Koniecz=
ny &lt;<a href=3D"mailto:kamil.konieczny@linux.intel.com">kamil.konieczny@l=
inux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi Mark,<br>
On 2025-10-08 at 12:02:09 -0400, Mark Yacoub wrote:<br>
&gt; [Why]<br>
&gt; VKMS (Virtual VKMS) is typically running on a virtual machine where it=
&#39;s<br>
&gt; expected to be without a contention with a hardware driver.<br>
&gt; When it&#39;s there, we would like to run IGT on it.<br>
&gt; <br>
&gt; [How]<br>
&gt; Delete VKMS from DRIVER_ANY&#39;s exclusion list to allow IGT to be pi=
cked<br>
&gt; up.<br>
&gt; <br>
&gt; Tested: Ran kms_bw on Android&#39;s VM with VKMS enabled.<br>
&gt; <br>
&gt; Change-Id: Ib13ad9261b8c2617370c02d0ffb5aa878bf3d8f8<br>
&gt; Signed-off-by: Mark Yacoub &lt;<a href=3D"mailto:markyacoub@google.com=
" target=3D"_blank">markyacoub@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 lib/drmtest.h | 4 +---<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/lib/drmtest.h b/lib/drmtest.h<br>
&gt; index 8416aa491..ab991da57 100644<br>
&gt; --- a/lib/drmtest.h<br>
&gt; +++ b/lib/drmtest.h<br>
&gt; @@ -63,10 +63,8 @@ int __get_drm_device_name(int fd, char *name, int n=
ame_size);<br>
&gt;=C2=A0 =C2=A0* on a system with them as well as a supported driver, you=
 can end up<br>
&gt;=C2=A0 =C2=A0* with a near-100% skip rate if you don&#39;t explicitly s=
pecify the device,<br>
&gt;=C2=A0 =C2=A0* depending on device-load ordering.<br>
&gt; - *<br>
&gt; - * Exclude VKMS to prefer hardware drivers.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -#define DRIVER_ANY=C2=A0 =C2=A0~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_V=
IRTIO)<br>
&gt; +#define DRIVER_ANY=C2=A0 =C2=A0~(DRIVER_VGEM | DRIVER_VIRTIO)<br>
<br>
Nak, this is bad as there could be vkms module also on host.<br>
<br>
Let me work on improving IGT_FORCE_DRIVER.<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Compile friendly enum for i915/xe.<br>
&gt; -- <br>
&gt; 2.51.0.740.g6adb054d12-goog<br>
&gt; <br>
</blockquote></div>

--0000000000005860d80640bca41b--
