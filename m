Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CF1CAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 19:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E872810E38D;
	Thu,  2 Oct 2025 19:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kzbYpxBz";
	dkim-atps=neutral
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7635F10E38D
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 19:46:20 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4df2911ac5aso8859861cf.2
 for <igt-dev@lists.freedesktop.org>; Thu, 02 Oct 2025 12:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759434379; x=1760039179;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UvwT8CIHkfQtStg7YjDbLX8gU1XPh0Dj+s2e/eChT24=;
 b=kzbYpxBzQfyEmVz+CWbZ31iMq/2FYIpoqIb3FzuXzYHU4u7uxtC/KgWCLJtwwehvCD
 SAHYeTYLBZN1uw3+qb4R/f7FRx8RZYEfrx0jWPUDBzPjmj2iT529jrijvhrmdIbvemGD
 TtkkveO2EJecuFXVsj2R/4+VxUZKw7GXqUN0aQF8eDeCjOcuYkjIJJgmM+uoxfarYAhc
 UXQClkkpMah0FI98rjnHv+/NJ8SagizDo61Awum/cQFDdZCXrvvub2sQheCDfmzLi3gh
 NtoS5bsGxih/Q0KmZWH4PfFYhKGAB2j8M0gpX/Dfw9KbkmlKbioGaAg5PvfECkpDqLfL
 zO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759434379; x=1760039179;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UvwT8CIHkfQtStg7YjDbLX8gU1XPh0Dj+s2e/eChT24=;
 b=RIKVlXt+BNCI8U7lhm/8BNXrsVHNMQqIDzwFAdA0VWYLzQchAe/4gxZ+ThqEtjV9MG
 6FueSTEfBBEfLjN6hUHCMne5flz+QYLLcD+oJLzWecpAFvYkvzYbLSR5ASdY9Md9Qmwv
 irKyg44XSdhgc3q47Ke6iEEZDeuxwVpRYVJhWCSE4P93KKcu5I+bE5wyypc2VrColDMt
 JyEZObwAjZywfob1DmogwcQ1ysL6AnCo1F58Ap+s1x53edTLiYjqy4axLeA4x67Ct+dv
 Xvim17y+RowK2mRKXLUkWz7V/AdN0yyHyCvRIkNf52Y8WWHUPwBMq6v84xe46iqW8yQn
 GZtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFD+lZaCNr85RyK3LWKwzveLJhBzs6p1Ghkr3W1HsiaxiTOEOIhPOF0dIUhE3kqXhGGF4qfcQ1@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxex/wK0Vv4N0R35KEXDBkXMDGh9Va2iPYi1iTHNyDZQqPoukbR
 KtGRiD8Ra64bqf9c4BaPTIOfJyAor+RgszymwJCf0CwtKd6IsfJjAZkUZb/5LAEnEaqim6Yc9nP
 FWN6M4y+fRHmbLZq+tHUbHTlehfvJnWbJIy697ZDM
X-Gm-Gg: ASbGncuLVVzYYKVDEiPZXnkoLVxsP96nFckFBW770DHDbxryogNH4FPFKLvj3hoo/uE
 JIcpWWfRPE60kYvr6uxBUGdD+OmRUcydyvzlk+9SA1/N4h2PaRl76sqowhhml4gTvmWd1eqUnjh
 T/j2wkEZZuMmNnxhYlCQzTMl5PWAPd3AaNvZvUSgdHdRCrUjzkk/e3kwM9+//PhmrYbkV6Um4JZ
 OS2gfNBHO0YAgBgIuR61rbYjV5QIouJb5pkJ1IexayZMn9+hQCF5hGlQa3XknW51RwgTgUkDj1g
 ZJU=
X-Google-Smtp-Source: AGHT+IHX0WDvJ9HUraP9r05HtRjwhAkwGctGRjPVKUnXAX3Cuk0EMihAutUi06wEbd8+dgaZVYW33qIquSHXpieiB14=
X-Received: by 2002:a05:622a:394:b0:4e5:6c5e:4309 with SMTP id
 d75a77b69052e-4e576b03c3fmr6843071cf.56.1759434378621; Thu, 02 Oct 2025
 12:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251001185039.3386207-1-markyacoub@google.com>
 <20251002130314.yspo5xmgpc7tie6f@kamilkon-DESK.igk.intel.com>
 <CAC0gqY7hFmhOHVCwEq0CwXwe8PpjRUkWMt3G7HRQR7rWGFBx9Q@mail.gmail.com>
 <20251002191832.dc5eyfgyoius6l64@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251002191832.dc5eyfgyoius6l64@kamilkon-DESK.igk.intel.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Thu, 2 Oct 2025 15:46:07 -0400
X-Gm-Features: AS18NWCNG50Dxfo8nX5FVUWQmvH5Me7jIsFv_X7CaZxqUa7BqkYGBNQrpS77Gcs
Message-ID: <CAC0gqY5AnpOmM7GoMm0Y80Pkp+rb375RkNka2mekCHZGvreyQQ@mail.gmail.com>
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

On Thu, Oct 2, 2025 at 3:18=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Mark,
> On 2025-10-02 at 10:12:27 -0400, Mark Yacoub wrote:
> > Hi Kamil, thanks a lot for the review.
> > clarification inline.
> >
> > On Thu, Oct 2, 2025 at 9:03=E2=80=AFAM Kamil Konieczny
> > <kamil.konieczny@linux.intel.com> wrote:
> > >
> > > Hi Mark,
> > > On 2025-10-01 at 14:50:38 -0400, Mark Yacoub wrote:
> > >
> > > please remove dot from end of subject, also imho this should
> > > be splitted into two commits, one for adding VIRTIO to
> > > drivers in lib/drmtest, second for your workaround to DRIVER_ANY
> > >
> > > > [Why]
> > > > Android's VM use virtio-gpu as its default driver, but VKMS can be
> > > > enabled on top it.
> > > > VKMS is the preferred driver to run IGT.
> > > >
> > > > [How]
> > > > To maintain the current way to preferring hardware drivers, introdu=
ce a
> > > > "PREFER_VKMS" flag which does not remove DRIVER_VKMS from the list =
of
> > > > drivers to be opened. Android will keep this as always true.
> > > >
> > > > Also, added explicit support for virtio-gpu to be explictly filtere=
d
> > > > out, making room for VKMS to be the primary driver in use.
> > > >
> > > > Test: kms_bw on AVD
> > > > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > > > ---
> > > >  lib/drmtest.c |  1 +
> > > >  lib/drmtest.h | 20 +++++++++++++-------
> > > >  2 files changed, 14 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > > > index 551385867..a1fb0b5ba 100644
> > > > --- a/lib/drmtest.c
> > > > +++ b/lib/drmtest.c
> > > > @@ -223,6 +223,7 @@ static const struct module {
> > > >       { DRIVER_V3D, "v3d" },
> > > >       { DRIVER_VC4, "vc4" },
> > > >       { DRIVER_VGEM, "vgem" },
> > > > +     { DRIVER_VIRTIO, "virtio_gpu" },
> > > >       { DRIVER_VKMS, "vkms" },
> > > >       { DRIVER_VMWGFX, "vmwgfx" },
> > > >       { DRIVER_XE, "xe" },
> > > > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > > > index a9542dde2..29356041b 100644
> > > > --- a/lib/drmtest.h
> > > > +++ b/lib/drmtest.h
> > > > @@ -37,6 +37,7 @@
> > > >  #include <xf86drm.h>
> > > >
> > > >  #include "igt_core.h"
> > > > +#include "config.h"
> > >
> > > This should be before igt_core.h (alphabetical order), also add
> > > some comment why you need it, like
> > >
> > > +#include "config.h" /* for ....reason... */
> > >  #include "igt_core.h"
> > >
> > > Is it needed for a workaround? (see below)
> > >
> > > >
> > > >  int __get_drm_device_name(int fd, char *name, int name_size);
> > > >
> > > > @@ -56,16 +57,21 @@ int __get_drm_device_name(int fd, char *name, i=
nt name_size);
> > > >  #define DRIVER_XE    (1 << 7)
> > > >  #define DRIVER_VMWGFX   (1 << 8)
> > > >  #define DRIVER_VKMS  (1 << 9)
> > > > +#define DRIVER_VIRTIO        (1 << 10)
> > > >
> > > >  /*
> > > > - * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
> > > > - * with vgem as well as a supported driver, you can end up with a
> > > > - * near-100% skip rate if you don't explicitly specify the device,
> > > > - * depending on device-load ordering.
> > > > - *
> > > > - * Exclude VKMS to prefer hardware drivers.
> > > > + * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if
> > > > + * you run on a system with vgem or virtio-gpu as well as a suppor=
ted driver,
> > > > + * you can end up with a near-100% skip rate if you don't explicit=
ly specify
> > > > + * the device, depending on device-load ordering.
> > > >   */
> > > > -#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS)
> > > > +/* Exclude VKMS to prefer hardware drivers if VKMS is not the pref=
erred driver. */
> > > > +#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
> > >
> > > Above (adding DRIVER_VIRTIO) should be in separate commit, with
> > > subject like:
> > >
> > > lib/drmtest: Add VIRTIO support
> > >
> > > and with proper description.
> > >
> > > > +
> > > > +#ifdef PREFER_VKMS
> > > > +#undef DRIVER_ANY
> > > > +#define DRIVER_ANY   ~(DRIVER_VGEM  | DRIVER_VIRTIO)
> > > > +#endif
> > >
> > > This looks like workaround, did you try running your test(s)
> > > with IGT_FORCE_DRIVER? Where is a problem? Do you need two
> > the problem is that originally DRIVER_ANY removes DRIVER_VKMS from the
> > list, so I'm unable to make IGT use VKMS as the driver.
> > A simple solution would be to remove it from the list of ~ and replace
> > it with `#define DRIVER_ANY   ~(DRIVER_VGEM  | DRIVER_VIRTIO)` but I'm
> > not sure what would it break. Do you have platforms that have VKMS +
> > other drivers where VKMS would have been picked up first and it's the
> > undesired behavior?
> > My virtual machine has both VIRTIO and VKMS, so I want it to pick
> > VKMS, while our Intel DUTs do not have any VKMS running on them.
> > What do you recommend that I do here?
>
> I see, nobody before needed it so now imho we could fix it
> with proper use of IGT_FORCE_DRIVER. I tried it with vgem
> and core_getversion, it seems I will need to fix drmtest and
> then I will ask you for a test.
> It would be more complicated if you want DRIVER_ANY + FORCE
> load two drivers, not one, but I assume it is not the case?
Nope, not at all, I don't need to load 2 drivers. I just wanted IGT to
load VKMS only when it's available.
Do you find okay at this point to just remove VKMS from the exclusion
list? Do you  have devices in the CI that run both xe/i915 and VKMS?
I'm curious what is the use case for this?
I can try to see how to make it work but I would prefer to avoid
`IGT_FORCE_DRIVER` so I can build IGT for any target, whether intel
DUTs or VKMS with the same build file.


>
> Regards,
> Kamil
>
> >
> > > drivers loaded, not just one? imho this should work:
> > >
> > > sudo IGT_FORCE_DRIVER=3Dvkms build/tests/kms_content_protection --r s=
ubtest
> > >
> > > or try simple test:
> > >
> > > sudo IGT_FORCE_DRIVER=3Dvkms build/tests/core_getversion --r basic
> > >
> > > If this do not work drmlib should be fixed, as imho IGT_FORCE_DRIVER
> > > should override DRIVER_ANY? +cc Karthik and J-P
> > >
> > > Cc: Karthik B S <karthik.b.s@intel.com>
> > > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > >
> > > Regards,
> > > Kamil
> > >
> > > >
> > > >  /*
> > > >   * Compile friendly enum for i915/xe.
> > > > --
> > > > 2.51.0.618.g983fd99d29-goog
> > > >
