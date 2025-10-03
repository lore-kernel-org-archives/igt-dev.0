Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75678CAC5B0
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 14:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250AD10E149;
	Fri,  3 Oct 2025 14:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4ry6NS1V";
	dkim-atps=neutral
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408B510E149
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 14:49:08 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4db385e046dso22604291cf.0
 for <igt-dev@lists.freedesktop.org>; Fri, 03 Oct 2025 07:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759502947; x=1760107747;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wlz7kQflI/kJztYJtOyGndY60DyXUnzUk6puU9YPGC8=;
 b=4ry6NS1Vp1mvd/KbqFgJBV3wwCoMAHNtyFX62i8EH6enjhGu5Ig+mrQ1HkqDi6KZYY
 BflyzZkod8y8lKgEzTVxPbxsB5jrihTeB4ghWKKhNTyOWFoEv6n6LUyC4LQvHHxMp6dB
 ATTqN/RQ9BKduzNjLqMI6D+AgP3hC5DoFhkIUqI3HbU/9JL+RsMEXHA9HPv4//U7IiYv
 Tu28TDGzuQYxmuFiOlbenPTLAyU8bavOFc8mbLM/Z9qSfmfrhZMdTAbbWfqu+/YIi4XX
 A40e5A4InnUtJyFMvBJmCTj8JfsbuqCHgf2lo0Oe7NIfhLkmx86CUpDNRQSnqD4+BAFw
 lrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759502947; x=1760107747;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wlz7kQflI/kJztYJtOyGndY60DyXUnzUk6puU9YPGC8=;
 b=liGCaQftvp+XuoHCcQJ8qTGt7K4zWEiiU4wjmTpo8JDHosm6ZQsBoC7XuL4R8uY/FE
 ExntT0H8KeVLgIVfcIFhErHxPBKZu8NRhYlih+VO/PpqiVEdZYiYfoQIhwb+XW00VS74
 TS3fxbPK4QNz/X7S7cq7ZuP+lCd0omRBrDUtvPsGq6eQt8L7n93alTk6HDv3rHJw4PWd
 F2ax40Y+7qk4kapnMFHPvVqxBPuw9OTeVVP+jRTB6L+G8qBPIkD3KYgF+rWaLdIPhs+Y
 rb5J4XdmUhoH0phwwvWNyfqB5POiChLU+UwFy5duMZudgEUJR2Rc2gnDn0tPbjJNqTNy
 j5Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtqHM4AiHf2mW3SO6e13Eh/YQifp1Hx+AiV0uuxpv2ViWmk6zklE8S13J2gkTxo1TnBH14X6Ir@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxaf0W1SEoSmW92oIQ6iZRUSEqW8IwuyprCZfDmhnuYsX08SMmj
 CCaB0nCnraGrX2zhOH5nQMX2XgHnH4AbdWpilrV4OO+Y5EvwMbtceipSeXQpxo+j72fJnJLrgW7
 rF4trnZMkdYoq/kns8iSJCF+wcSI/Q9BMZssWM0uB
X-Gm-Gg: ASbGnctntRW55VA/d/jQBqBkDuYyzyY0gTp4aFycE97oFcPaQsWhflFs/pjGC/szTOl
 vEYrthbAJjxLyP0q5Tsyn0xsy/33bd8/OjJX7/l54QFTOIKgI2SeDF7dbxn6+rKnP3BTJTL700j
 jjRQ/Aa6puJu+aoN+I48h4shu20WX0YXGAb24En9LhLNQ9ZUMbM96t6RQ+CtUwV5M+o0B/aqrf/
 SKnoq7vYdQLFRRnk/Jk3MTLizh+q/PEjkZM4WFY+38dE4YwPU4kAUpBbQG7EsnAQCcP
X-Google-Smtp-Source: AGHT+IFoHV2pjt30V3c4gejqWFWQE0KSND0Gdt0MmBmpZC4SOeoWPXs3RpXK2qKU4BnSzm3vjDY5nSAEQD423SxZJJ4=
X-Received: by 2002:ac8:5a08:0:b0:4df:39ae:6a9e with SMTP id
 d75a77b69052e-4e576b0e067mr45478241cf.79.1759502946733; Fri, 03 Oct 2025
 07:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251001185039.3386207-1-markyacoub@google.com>
 <20251002130314.yspo5xmgpc7tie6f@kamilkon-DESK.igk.intel.com>
 <CAC0gqY7hFmhOHVCwEq0CwXwe8PpjRUkWMt3G7HRQR7rWGFBx9Q@mail.gmail.com>
 <20251002191832.dc5eyfgyoius6l64@kamilkon-DESK.igk.intel.com>
 <CAC0gqY5AnpOmM7GoMm0Y80Pkp+rb375RkNka2mekCHZGvreyQQ@mail.gmail.com>
In-Reply-To: <CAC0gqY5AnpOmM7GoMm0Y80Pkp+rb375RkNka2mekCHZGvreyQQ@mail.gmail.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Fri, 3 Oct 2025 10:48:54 -0400
X-Gm-Features: AS18NWAetwA2OejrxS7y5YoYAoX-rbZIZIjr8rF6Jdd8g5xE2MXkfaUx632Kg-s
Message-ID: <CAC0gqY7VPMnun9aDhBX+eK6iyyR7t23oR8+pi+o2My7p+Lug=g@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] lib/drmtest: Allow DRIVER_ANY tests to run on
 VKMS when supported.
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, 
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com, 
 Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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

On Thu, Oct 2, 2025 at 3:46=E2=80=AFPM Mark Yacoub <markyacoub@google.com> =
wrote:
>
> On Thu, Oct 2, 2025 at 3:18=E2=80=AFPM Kamil Konieczny
> <kamil.konieczny@linux.intel.com> wrote:
> >
> > Hi Mark,
> > On 2025-10-02 at 10:12:27 -0400, Mark Yacoub wrote:
> > > Hi Kamil, thanks a lot for the review.
> > > clarification inline.
> > >
> > > On Thu, Oct 2, 2025 at 9:03=E2=80=AFAM Kamil Konieczny
> > > <kamil.konieczny@linux.intel.com> wrote:
> > > >
> > > > Hi Mark,
> > > > On 2025-10-01 at 14:50:38 -0400, Mark Yacoub wrote:
> > > >
> > > > please remove dot from end of subject, also imho this should
> > > > be splitted into two commits, one for adding VIRTIO to
> > > > drivers in lib/drmtest, second for your workaround to DRIVER_ANY
> > > >
> > > > > [Why]
> > > > > Android's VM use virtio-gpu as its default driver, but VKMS can b=
e
> > > > > enabled on top it.
> > > > > VKMS is the preferred driver to run IGT.
> > > > >
> > > > > [How]
> > > > > To maintain the current way to preferring hardware drivers, intro=
duce a
> > > > > "PREFER_VKMS" flag which does not remove DRIVER_VKMS from the lis=
t of
> > > > > drivers to be opened. Android will keep this as always true.
> > > > >
> > > > > Also, added explicit support for virtio-gpu to be explictly filte=
red
> > > > > out, making room for VKMS to be the primary driver in use.
> > > > >
> > > > > Test: kms_bw on AVD
> > > > > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > > > > ---
> > > > >  lib/drmtest.c |  1 +
> > > > >  lib/drmtest.h | 20 +++++++++++++-------
> > > > >  2 files changed, 14 insertions(+), 7 deletions(-)
> > > > >
> > > > > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > > > > index 551385867..a1fb0b5ba 100644
> > > > > --- a/lib/drmtest.c
> > > > > +++ b/lib/drmtest.c
> > > > > @@ -223,6 +223,7 @@ static const struct module {
> > > > >       { DRIVER_V3D, "v3d" },
> > > > >       { DRIVER_VC4, "vc4" },
> > > > >       { DRIVER_VGEM, "vgem" },
> > > > > +     { DRIVER_VIRTIO, "virtio_gpu" },
> > > > >       { DRIVER_VKMS, "vkms" },
> > > > >       { DRIVER_VMWGFX, "vmwgfx" },
> > > > >       { DRIVER_XE, "xe" },
> > > > > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > > > > index a9542dde2..29356041b 100644
> > > > > --- a/lib/drmtest.h
> > > > > +++ b/lib/drmtest.h
> > > > > @@ -37,6 +37,7 @@
> > > > >  #include <xf86drm.h>
> > > > >
> > > > >  #include "igt_core.h"
> > > > > +#include "config.h"
> > > >
> > > > This should be before igt_core.h (alphabetical order), also add
> > > > some comment why you need it, like
> > > >
> > > > +#include "config.h" /* for ....reason... */
> > > >  #include "igt_core.h"
> > > >
> > > > Is it needed for a workaround? (see below)
> > > >
> > > > >
> > > > >  int __get_drm_device_name(int fd, char *name, int name_size);
> > > > >
> > > > > @@ -56,16 +57,21 @@ int __get_drm_device_name(int fd, char *name,=
 int name_size);
> > > > >  #define DRIVER_XE    (1 << 7)
> > > > >  #define DRIVER_VMWGFX   (1 << 8)
> > > > >  #define DRIVER_VKMS  (1 << 9)
> > > > > +#define DRIVER_VIRTIO        (1 << 10)
> > > > >
> > > > >  /*
> > > > > - * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a syst=
em
> > > > > - * with vgem as well as a supported driver, you can end up with =
a
> > > > > - * near-100% skip rate if you don't explicitly specify the devic=
e,
> > > > > - * depending on device-load ordering.
> > > > > - *
> > > > > - * Exclude VKMS to prefer hardware drivers.
> > > > > + * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since i=
f
> > > > > + * you run on a system with vgem or virtio-gpu as well as a supp=
orted driver,
> > > > > + * you can end up with a near-100% skip rate if you don't explic=
itly specify
> > > > > + * the device, depending on device-load ordering.
> > > > >   */
> > > > > -#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS)
> > > > > +/* Exclude VKMS to prefer hardware drivers if VKMS is not the pr=
eferred driver. */
> > > > > +#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO=
)
> > > >
> > > > Above (adding DRIVER_VIRTIO) should be in separate commit, with
> > > > subject like:
> > > >
> > > > lib/drmtest: Add VIRTIO support
> > > >
> > > > and with proper description.
> > > >
> > > > > +
> > > > > +#ifdef PREFER_VKMS
> > > > > +#undef DRIVER_ANY
> > > > > +#define DRIVER_ANY   ~(DRIVER_VGEM  | DRIVER_VIRTIO)
> > > > > +#endif
> > > >
> > > > This looks like workaround, did you try running your test(s)
> > > > with IGT_FORCE_DRIVER? Where is a problem? Do you need two
> > > the problem is that originally DRIVER_ANY removes DRIVER_VKMS from th=
e
> > > list, so I'm unable to make IGT use VKMS as the driver.
> > > A simple solution would be to remove it from the list of ~ and replac=
e
> > > it with `#define DRIVER_ANY   ~(DRIVER_VGEM  | DRIVER_VIRTIO)` but I'=
m
> > > not sure what would it break. Do you have platforms that have VKMS +
> > > other drivers where VKMS would have been picked up first and it's the
> > > undesired behavior?
> > > My virtual machine has both VIRTIO and VKMS, so I want it to pick
> > > VKMS, while our Intel DUTs do not have any VKMS running on them.
> > > What do you recommend that I do here?
> >
> > I see, nobody before needed it so now imho we could fix it
> > with proper use of IGT_FORCE_DRIVER. I tried it with vgem
> > and core_getversion, it seems I will need to fix drmtest and
> > then I will ask you for a test.
> > It would be more complicated if you want DRIVER_ANY + FORCE
> > load two drivers, not one, but I assume it is not the case?
> Nope, not at all, I don't need to load 2 drivers. I just wanted IGT to
> load VKMS only when it's available.
> Do you find okay at this point to just remove VKMS from the exclusion
> list? Do you  have devices in the CI that run both xe/i915 and VKMS?
> I'm curious what is the use case for this?
> I can try to see how to make it work but I would prefer to avoid
> `IGT_FORCE_DRIVER` so I can build IGT for any target, whether intel
> DUTs or VKMS with the same build file.
>
Hello, just following up if removing VKMS would be sufficient.
Thanks!
>
> >
> > Regards,
> > Kamil
> >
> > >
> > > > drivers loaded, not just one? imho this should work:
> > > >
> > > > sudo IGT_FORCE_DRIVER=3Dvkms build/tests/kms_content_protection --r=
 subtest
> > > >
> > > > or try simple test:
> > > >
> > > > sudo IGT_FORCE_DRIVER=3Dvkms build/tests/core_getversion --r basic
> > > >
> > > > If this do not work drmlib should be fixed, as imho IGT_FORCE_DRIVE=
R
> > > > should override DRIVER_ANY? +cc Karthik and J-P
> > > >
> > > > Cc: Karthik B S <karthik.b.s@intel.com>
> > > > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > >
> > > > Regards,
> > > > Kamil
> > > >
> > > > >
> > > > >  /*
> > > > >   * Compile friendly enum for i915/xe.
> > > > > --
> > > > > 2.51.0.618.g983fd99d29-goog
> > > > >
