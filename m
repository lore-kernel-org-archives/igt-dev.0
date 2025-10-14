Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF71CCD184
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 14:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B927B10E14B;
	Tue, 14 Oct 2025 14:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4Vp10lgs";
	dkim-atps=neutral
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65D510E14B
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 14:46:49 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8608f72582eso371652585a.2
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 07:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760453209; x=1761058009;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FCCi6bdavyNeJj1TbEkVAPTrJmPygiCRZT/z6wRkX9s=;
 b=4Vp10lgsqU6zXc6E1+OByiXOlLQj5j+WKqXwXNiWFBqH2wZTu0fj2b229RbgUrVdJA
 mtuzyvUhHE7pSbycLaJpTSbpMfOO2ZzP9NHPR31+KVOm9YVoONLFZaISMGLuJz4f1tOX
 5s08h64SZQb1vXyNQlK/3jG40maPC57fn0VhvOaxrAwuUTVftatwneQnhLOVoTe+YZ+W
 TtTEeOk1JL7FDIt1kp+MEedSkjoOCQVWM9iudZ+u7s5PjRvDkWfSAw4YUNk+4pHqdFvK
 4D1YADzdAVjlvHot9iJGFnGhGJvaHtHXBpN44TAcO8XKZ0WqR2mMhv415m4Bf15C4zN/
 Yedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760453209; x=1761058009;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FCCi6bdavyNeJj1TbEkVAPTrJmPygiCRZT/z6wRkX9s=;
 b=FQvEw1rekdwZu84s4cfr9NL1M053LKdBR/5QZ+iVnaqhYp68VFJ/tKpu0WrA5WCz/s
 jpKIJJ5fi/hyxd0H08W3pCZzx+DlQaVup9LN+agsj13ElFma7K+q8gMR8h6Tt5VqoC+5
 lRZ6I4lxRTJnE4gNahm6GAA+ggZNM51ghoYo4TAOpgChnI1+DQKP1HWuXqMn2Vd93ZkT
 1u5rJKO48nZMlJ8KE8J1yMPoJUjUdqrOhX2dR0LcY5S4qDlGsBjL2kSijjxhK5TKy7+y
 Mr+Gvs+iBdGcu6ql5jk8rOTyx+rjQoQLV4kpn4gaV4x1M8pyY1F8hp5ygyTzet52Eufg
 DgIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhgl/4dQ7qQIj4yr3UkedXUBbM5KEp9npat+tmf5w9ETBFCOQA0QyPSTNH2JxsHIRadtzHmLtB@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy80lWA5AowkrlwdpFMepmxoeOFyoqK5V1l2HaxE0QlRzCVrB4u
 UYmIUCGj6Y9++fuxVN6awt6cbTk/9pnl6cLeptcMSXLOfHJ2U4GatqXh1QIf/aPBIEfxKzOq35w
 VGWIxiW7yT3SnYfhI0FHxp/ZT2U+r1MJQ0Ovmmvws
X-Gm-Gg: ASbGncts8xVudpTVNBTSQOxwpMVVBqFFVZ1TBwP4+YBAOnpEnvNp/GtjvpFNhNm3oHC
 wuwmEtr53jecpnXYa52dIGGHSQnr9/0RqaE0mFDI/xf7i1z8Sd6vAcvdW7GHOf4U8Bl47X0Plw8
 DiEyhpFdn0HHZg/6j+AQ5HZedGSKK//WbJApkbZttQjrXLLJGGM0pXQjUeGLIMn5CMXr/s+Eqzi
 VEFOPtadbhPwim4SctT7LnJJOfzfp0pqnIuaA2GXY9opNIuG2KOuqJ+T/v/9Jor/SPKoHTu8d8=
X-Google-Smtp-Source: AGHT+IHnEjAD7Hih5WyRr2kIYfZIUXJLODvGxCAY5IC7p4so8M75A3DO1Q0M9IlERF2oOoIPY7yjIJ4Ye1mcQn005HM=
X-Received: by 2002:a05:622a:4814:b0:4b7:9c98:aed6 with SMTP id
 d75a77b69052e-4e6ead58053mr377912831cf.41.1760453208573; Tue, 14 Oct 2025
 07:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251008160209.463702-1-markyacoub@google.com>
 <20251009164600.btzj5kiscl5ftdl7@kamilkon-DESK.igk.intel.com>
 <CAC0gqY7ZeCZPP8WHPq8uS-sOZVGpi8Fnzn-uDsWdt4jW72B8RA@mail.gmail.com>
In-Reply-To: <CAC0gqY7ZeCZPP8WHPq8uS-sOZVGpi8Fnzn-uDsWdt4jW72B8RA@mail.gmail.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Tue, 14 Oct 2025 10:46:37 -0400
X-Gm-Features: AS18NWDx4BfVcGOKbXTZtbpaxw9udIYTh8TqtKnbrwSxABb0dwxFnFWP401JchQ
Message-ID: <CAC0gqY6W0He7qzUg1FO+fBwHiqKh7QBVpgBEcmUzq1syn9We6Q@mail.gmail.com>
Subject: Re: [PATCH i-g-t] lib/drmtest: Remove VKMS from Exclusion list
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, 
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com, 
 juhapekka.heikkila@gmail.com
Content-Type: multipart/alternative; boundary="00000000000024a64806411f7436"
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

--00000000000024a64806411f7436
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kamil, I hope all is well. Just following up on this.
To your idea though, I will try to see if I can set `IGT_FORCE_DRIVER`
within the build config targeting only the VMs, but I would love to not
have to do that, if possible in a clean way of course.

On Thu, Oct 9, 2025 at 12:53=E2=80=AFPM Mark Yacoub <markyacoub@google.com>=
 wrote:

> Hi Kamil,
>
> Thanks for your feedback. I'd like to elaborate on my use case to provide
> more context about the problem I'm trying to solve.
>
> I am building IGT for Android, and the same build system is deployed on
> both physical hardware and virtual machines. On the hardware, the
> appropriate hardware driver is correctly detected, so there are no issues
> there. However, on the VM, VKMS is running, but it's currently excluded
> from `DRIVER_ANY`, which prevents the tests from running against it. I ne=
ed
> the tests to execute on VKMS in this scenario.
>
> Using `IGT_FORCE_DRIVER` would require me to fork the build processes for
> hardware and VM, which I would prefer to avoid. My goal is to maintain a
> unified build system and allow IGT to run on whatever driver is present. =
Is
> there a way to achieve this?
>
> I understand that the current code prioritizes the hardware driver, which
> is a desirable behavior. I'm trying to understand the potential issues th=
at
> might arise if VKMS were not excluded in other contexts.
>
> Thank you!
> Mark
>
>
> On Thu, Oct 9, 2025 at 12:46=E2=80=AFPM Kamil Konieczny <
> kamil.konieczny@linux.intel.com> wrote:
>
>> Hi Mark,
>> On 2025-10-08 at 12:02:09 -0400, Mark Yacoub wrote:
>> > [Why]
>> > VKMS (Virtual VKMS) is typically running on a virtual machine where it=
's
>> > expected to be without a contention with a hardware driver.
>> > When it's there, we would like to run IGT on it.
>> >
>> > [How]
>> > Delete VKMS from DRIVER_ANY's exclusion list to allow IGT to be picked
>> > up.
>> >
>> > Tested: Ran kms_bw on Android's VM with VKMS enabled.
>> >
>> > Change-Id: Ib13ad9261b8c2617370c02d0ffb5aa878bf3d8f8
>> > Signed-off-by: Mark Yacoub <markyacoub@google.com>
>> > ---
>> >  lib/drmtest.h | 4 +---
>> >  1 file changed, 1 insertion(+), 3 deletions(-)
>> >
>> > diff --git a/lib/drmtest.h b/lib/drmtest.h
>> > index 8416aa491..ab991da57 100644
>> > --- a/lib/drmtest.h
>> > +++ b/lib/drmtest.h
>> > @@ -63,10 +63,8 @@ int __get_drm_device_name(int fd, char *name, int
>> name_size);
>> >   * on a system with them as well as a supported driver, you can end u=
p
>> >   * with a near-100% skip rate if you don't explicitly specify the
>> device,
>> >   * depending on device-load ordering.
>> > - *
>> > - * Exclude VKMS to prefer hardware drivers.
>> >   */
>> > -#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
>> > +#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VIRTIO)
>>
>> Nak, this is bad as there could be vkms module also on host.
>>
>> Let me work on improving IGT_FORCE_DRIVER.
>>
>> Regards,
>> Kamil
>>
>> >
>> >  /*
>> >   * Compile friendly enum for i915/xe.
>> > --
>> > 2.51.0.740.g6adb054d12-goog
>> >
>>
>

--00000000000024a64806411f7436
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Kamil, I hope all is well. Just following up on this.<d=
iv>To your idea though, I will try to see if I can set `IGT_FORCE_DRIVER` w=
ithin the build config targeting only the VMs, but I would love to not have=
 to do that, if possible in a clean way of course.</div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Oct 9, 2025 at 12:53=E2=80=AFPM Mark Yacoub &lt;<a href=3D"mailt=
o:markyacoub@google.com">markyacoub@google.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi Kami=
l,</div><div><br></div><div>Thanks for your feedback. I&#39;d like to elabo=
rate on my use case to provide more context about the problem I&#39;m tryin=
g to solve.</div><div><br></div><div>I am building IGT for Android, and the=
 same build system is deployed on both physical hardware and virtual machin=
es. On the hardware, the appropriate hardware driver is correctly detected,=
 so there are no issues there. However, on the VM, VKMS is running, but it&=
#39;s currently excluded from `DRIVER_ANY`, which prevents the tests from r=
unning against it. I need the tests to execute on VKMS in this scenario.</d=
iv><div><br></div><div>Using `IGT_FORCE_DRIVER` would require me to fork th=
e build processes for hardware and VM, which I would prefer to avoid. My go=
al is to maintain a unified build system and allow IGT to run on whatever d=
river is present. Is there a way to achieve this?</div><div><br></div><div>=
I understand that the current code prioritizes the hardware driver, which i=
s a desirable behavior. I&#39;m trying to understand the potential issues t=
hat might arise if VKMS were not excluded in other contexts.</div><div><br>=
</div><div>Thank you!</div><div>Mark</div></div><br><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 9, 2025 at 12:46=
=E2=80=AFPM Kamil Konieczny &lt;<a href=3D"mailto:kamil.konieczny@linux.int=
el.com" target=3D"_blank">kamil.konieczny@linux.intel.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Mark,<br>
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
</blockquote></div>

--00000000000024a64806411f7436--
