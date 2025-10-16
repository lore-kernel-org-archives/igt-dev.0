Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C110CCD199
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 14:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2917D10EA02;
	Thu, 16 Oct 2025 14:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MMp5Y7g1";
	dkim-atps=neutral
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB68010EA02
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 14:51:21 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8599c274188so121915785a.1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 07:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760626280; x=1761231080;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dTWpQ6LmkiuD62hUHyPz5qCJ04yk80UYg+Ni9LTYWY0=;
 b=MMp5Y7g1hvRfTI/SeXdQZtZ0s26S9P9Xig/6JfApF5uaflGTgZPp9f9cVQ3LHPNKvV
 QNFch2RVFNhNzLa3vpTYGyjM6o8E4eHmBpkPDQ4AABVrdz7IYoJ3uINce7zN/yvXf3hQ
 uvz7ZDfDyfchkLolsE5vzTGurHBgo26ZxvJG/qNsXoo9gZuXpbKORu/MmD5pvujfzPZ3
 UgtW4MVGvg3Hp5+GLLbYpJl2peibE4RTULp1Ulkmb9tjZK7eeBZb4yt7WTL1TbTpGT6M
 7zwph1N4Jc4MGCyEwj/Zg7On3LP9dckoqi9X5CYXj7zfVMQeUPrG1XzKYstKEFlk39b+
 bOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760626280; x=1761231080;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dTWpQ6LmkiuD62hUHyPz5qCJ04yk80UYg+Ni9LTYWY0=;
 b=K9ShWSJEtHjsXwjjn1KmYBzizjX8qY56jgi0k7YWreMKOPpsexyUqrr38meAs3xJ58
 zu5koRkt7IesnLJLRCrfuX+Tg0CksiaexBGuZIqiAQda/P52M3LppVty7+ALX0ql+HDx
 S8S6h8EakPqDgGOGgwi1+fMM+hGwUYUEY8BCAqN7xmksZGVPcGF6x+9pTwQ/WSXJl1C4
 6dB1LzD0i+uF/jvZaDCmZAg6UNRO8F6zrSOLD5WAMnM5HK5qMwABUWXPbgYY3mFP819V
 /qiqn0YbcneSfpRifvlj5gIVflY/S7CgOmWHUVLUugtswmkpSeMKpgGUeDBh/JCn16TR
 jVaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9rl15qphQwbApKakK/gSgvcW13MciVD8YfN8+WhH4vzgzU4VQRNE1AtFkDLjOgYTzh2dWm+Kx@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4xq40huQ45iMktL/tUZQm4i1RlS3sysg7hkc87wNu9sVx7uSp
 TeK/3JzL0J/lIizPTecBYo2t9l0y5IBguf/wEbIfFDi3tpT+pqpvCioZhv1D6dyIkAde1OVURV1
 CtCatIFsuKy/FqHuFe43SJnRF7H0SFCPePDqtl7nm
X-Gm-Gg: ASbGnctNS3SZkvvIVvV8u4cNTLEEZ2Qf/50nSFFFDF5mqvyC6Pi81byoifSlKbhiAW6
 1Ne4Jbt71f5up77iX+dyOhhaZcoAMvY0LhCBeJE3Ize6oL9s5FK87O4ZlGTK0NgD2OYkhKYhVd4
 KrJzEl4LJQP9FTX5PrKJCrfG4ET6BpCnzANM3CXHbOSyyv7X3eZF0ogcLQufksyK/CWBVzVsB5q
 Or2+RqePJfMfO4aPDM5lt2D/qcQuTq91sSB6jgo9YvAXW/K41UF8DRAKyx7xL3+1V5vMzl5bFIx
 gprtLjWrYC4Wm5Dx5KEjMNlAEPeiJhXB
X-Google-Smtp-Source: AGHT+IFkWIHdxxjYfL70btkJHQ7BVFk+RdwPWHPoCrRWEOt/Vjd4XbqJKKRkSAuqgdmsY7K9YeDJhNncFdnUnzipJHs=
X-Received: by 2002:a05:622a:349:b0:4e8:8590:f9ab with SMTP id
 d75a77b69052e-4e89d3de402mr4611361cf.60.1760626279874; Thu, 16 Oct 2025
 07:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251008160209.463702-1-markyacoub@google.com>
 <20251009164600.btzj5kiscl5ftdl7@kamilkon-DESK.igk.intel.com>
 <CAC0gqY7ZeCZPP8WHPq8uS-sOZVGpi8Fnzn-uDsWdt4jW72B8RA@mail.gmail.com>
 <20251015181649.ca7psctqj2vj2dt2@kamilkon-DESK.igk.intel.com>
 <d67971d5-8bc5-4a4d-becf-59696631f21d@bootlin.com> <aPDQOgFtR0aMo4_C@fedora>
In-Reply-To: <aPDQOgFtR0aMo4_C@fedora>
From: Mark Yacoub <markyacoub@google.com>
Date: Thu, 16 Oct 2025 10:51:07 -0400
X-Gm-Features: AS18NWBUxbISYpfmF_7gQALCJB0iNxixjm9RO0DrD80eW6pvZI0fpISGt8rr31A
Message-ID: <CAC0gqY5tYG_3S5P+Xjq2k0=a_4Ktux3sCuQn9ef1Yn7ZPfYqdg@mail.gmail.com>
Subject: Re: [PATCH i-g-t] lib/drmtest: Remove VKMS from Exclusion list
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, juhapekka.heikkila@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Oct 16, 2025 at 7:00=E2=80=AFAM Jos=C3=A9 Exp=C3=B3sito <jose.expos=
ito89@gmail.com> wrote:
>
> Hi everyone,
>
> Thanks for CCing me Louis.
>
> On Thu, Oct 16, 2025 at 10:40:32AM +0200, Louis Chauvet wrote:
> >
> >
> > Le 15/10/2025 =C3=A0 20:16, Kamil Konieczny a =C3=A9crit :
> > > Hi Mark,
> > > On 2025-10-09 at 12:53:24 -0400, Mark Yacoub wrote:
> > > > Hi Kamil,
> > > >
> > > > Thanks for your feedback. I'd like to elaborate on my use case to p=
rovide
> > > > more context about the problem I'm trying to solve.
> > > >
> > > > I am building IGT for Android, and the same build system is deploye=
d on
> > > > both physical hardware and virtual machines. On the hardware, the
> > > > appropriate hardware driver is correctly detected, so there are no =
issues
> > > > there. However, on the VM, VKMS is running, but it's currently excl=
uded
> > > > from `DRIVER_ANY`, which prevents the tests from running against it=
. I need
> > > > the tests to execute on VKMS in this scenario.
> > > >
> > > > Using `IGT_FORCE_DRIVER` would require me to fork the build process=
es for
> > > > hardware and VM, which I would prefer to avoid. My goal is to maint=
ain a
> > >
> > > You do not need to fork it nor recompile, this is env var for
> > > CI run with tests, it uses the same igt binaries only makes them
> > > using a forced driver when opening card. Now it do not work as
> > > no user before needed to force it into vgem or VKMS.
> > >
> > > In theory you could define it like: export IGT_FORCE_DRIVER=3Dvkms
> > > and then all kms tests and core_ ones should honor it.
> >
> > +CC: Jos=C3=A9
> >
> > Hi,
> >
> > I had the same issue this week, but IGT_FORCE_DRIVER is not enough: all=
 the
> > tests using DRIVER_ANY are skipped.
> >
> > # export IGT_DEVICE=3Ddrm:/dev/dri/card0
> > # export IGT_FORCE_DRIVER=3Dvkms
> > # export IGT_LOG_LEVEL=3Ddebug
> > # /usr/libexec/igt-gpu-tools/kms_plane
> > (kms_plane:125) igt_core-DEBUG: Notice: using IGT_DEVICE env:
> > (kms_plane:125) igt_core-DEBUG: [drm:/dev/dri/card0]
> > [IGT] kms_plane: executing
> > IGT-Version: 2.2-g6d82d231ced6 (x86_64) (Linux:
> > 6.17.0-rc6-01217-g1ddd2876eeb9 x86_64)
> > Using IGT_SRANDOM=3D1760602572 for randomisation
> > (kms_plane:125) drmtest-DEBUG: Looking for devices to open using filter=
 0:
> > drm:/dev/dri/card0
> > (kms_plane:125) drmtest-DEBUG: Filter matched /dev/dri/card0 |
> > (kms_plane:125) igt_kmod-DEBUG: Module vkms already inserted
> > Test requirement not met in function drm_open_driver, file
> > ../igt/lib/drmtest.c:735:
> > Test requirement: !(fd<0)
> > No known gpu found for chipset flags 0x4294965755 (any)
> > Last errno: 2, No such file or directory
> > Subtest pixel-format: SKIP (0.000s)
> > Subtest pixel-format-source-clamping: SKIP (0.000s)
> > Subtest plane-position-covered: SKIP (0.000s)
> > Subtest plane-position-hole: SKIP (0.000s)
> > Subtest plane-position-hole-dpms: SKIP (0.000s)
> > Subtest plane-panning-top-left: SKIP (0.000s)
> > Subtest plane-panning-bottom-right: SKIP (0.000s)
> > Subtest plane-panning-bottom-right-suspend: SKIP (0.000s)
> > Subtest planar-pixel-format-settings: SKIP (0.000s)
> > [IGT] kms_plane: exiting, ret=3D77
> > (kms_plane:125) igt_core-DEBUG: Exiting with status code 77
> >
> > Jos=C3=A9 suggested this fix, it seems to properly use vkms if IGT_FORC=
E_DRIVER
> > is set:
> >
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index a1fb0b5ba..f630bc157 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -350,7 +350,7 @@ int __drm_open_device(const char *name, unsigned in=
t
> > chipset)
> >
> >         modulename_to_chipset(dev_name, &chip);
> >
> > -       if ((chipset & chip) =3D=3D chip) {
> > +       if ((chipset & chip) =3D=3D chip || (forced && strcmp(forced, d=
ev_name)
> > =3D=3D 0)) {
> >                 log_opened_device_path(name);
> >                 return fd;
> >         }
> >
> > @Mark, is it enough for you?
> > @Jos=C3=A9, do you want to send the proper patch?
>
> Sorry I couldn't send a patch earlier, I have been pretty busy this week.
>
> The reason why VKMS is excluded from DRIVERS_ANY is that, when a test
> selects any driver ("drm_open_driver(DRIVER_ANY)") hardware drivers are
> prioritized over virtual drivers (vgem, vkms or virtio) to avoid them
> being accidentally selected due to device-load ordering.
Hey, so I'm a bit confused here. I have a VM with VKMS, and another
hardware DUT with intel, so there is never an accidental use of the
wrong driver.
Do you have hardware that might carry both drivers?
>
> There is a nice comment in drmtest.h explaining it with more detail. So, =
in
> my opinion, VKMS is correctly excluded from DRIVERS_ANY.
>
> However, I'd expect that setting the IGT_FORCE_DRIVER environment variabl=
e to
> "vkms" would actually use VKMS for testing.
> I have refined a bit the initial workaround I discuss with  Louis 2 days =
ago
> and I think this could be an acceptable solution:
>
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index a1fb0b5ba..8f295d436 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -350,6 +350,14 @@ int __drm_open_device(const char *name, unsigned int=
 chipset)
>
>         modulename_to_chipset(dev_name, &chip);
>
> +       /*
> +        * Virtual drivers like vgem or vkms are excluded from DRIVER_ANY=
 and
> +        * therefore it is not possible to use them in tests using the
> +        * IGT_FORCE_DRIVER environment variable. Include them when force=
d.
> +        */
> +       if (forced && chipset =3D=3D DRIVER_ANY)
> +               chipset |=3D chip;
> +
>         if ((chipset & chip) =3D=3D chip) {
>                 log_opened_device_path(name);
>                 return fd;
>
> I don't know if making that check even more precise would be a better sol=
ution.
> For example, calling a "is_virtual_driver()" helper:
>
>   if (forced && chipset =3D=3D DRIVER_ANY && is_virtual_driver(chip))
>           chipset |=3D chip;
>
> I can send a patch with that fix, but I'd appreciate as much feedback as =
possible
> as this code is used by every tests and I don't have enough experience wi=
th IGT
> to make sure it doesn't introduce a bug.
>
> Best wishes,
> Jose
>
> >
> > Hav a nice day,
> > Louis Chauvet
> >
> > > Regards,
> > > Kamil
> > >
> > > > unified build system and allow IGT to run on whatever driver is pre=
sent. Is
> > > > there a way to achieve this?
> > > >
> > > > I understand that the current code prioritizes the hardware driver,=
 which
> > > > is a desirable behavior. I'm trying to understand the potential iss=
ues that
> > > > might arise if VKMS were not excluded in other contexts.
> > > >
> > > > Thank you!
> > > > Mark
> > > >
> > > >
> > > > On Thu, Oct 9, 2025 at 12:46=E2=80=AFPM Kamil Konieczny <
> > > > kamil.konieczny@linux.intel.com> wrote:
> > > >
> > > > > Hi Mark,
> > > > > On 2025-10-08 at 12:02:09 -0400, Mark Yacoub wrote:
> > > > > > [Why]
> > > > > > VKMS (Virtual VKMS) is typically running on a virtual machine w=
here it's
> > > > > > expected to be without a contention with a hardware driver.
> > > > > > When it's there, we would like to run IGT on it.
> > > > > >
> > > > > > [How]
> > > > > > Delete VKMS from DRIVER_ANY's exclusion list to allow IGT to be=
 picked
> > > > > > up.
> > > > > >
> > > > > > Tested: Ran kms_bw on Android's VM with VKMS enabled.
> > > > > >
> > > > > > Change-Id: Ib13ad9261b8c2617370c02d0ffb5aa878bf3d8f8
> > > > > > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > > > > > ---
> > > > > >   lib/drmtest.h | 4 +---
> > > > > >   1 file changed, 1 insertion(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > > > > > index 8416aa491..ab991da57 100644
> > > > > > --- a/lib/drmtest.h
> > > > > > +++ b/lib/drmtest.h
> > > > > > @@ -63,10 +63,8 @@ int __get_drm_device_name(int fd, char *name=
, int
> > > > > name_size);
> > > > > >    * on a system with them as well as a supported driver, you c=
an end up
> > > > > >    * with a near-100% skip rate if you don't explicitly specify=
 the
> > > > > device,
> > > > > >    * depending on device-load ordering.
> > > > > > - *
> > > > > > - * Exclude VKMS to prefer hardware drivers.
> > > > > >    */
> > > > > > -#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRT=
IO)
> > > > > > +#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VIRTIO)
> > > > >
> > > > > Nak, this is bad as there could be vkms module also on host.
> > > > >
> > > > > Let me work on improving IGT_FORCE_DRIVER.
> > > > >
> > > > > Regards,
> > > > > Kamil
> > > > >
> > > > > >
> > > > > >   /*
> > > > > >    * Compile friendly enum for i915/xe.
> > > > > > --
> > > > > > 2.51.0.740.g6adb054d12-goog
> > > > > >
> > > > >
> >
> > --
> > --
> > Louis Chauvet, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
