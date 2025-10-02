Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D9BCAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 14:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A069910E7EA;
	Thu,  2 Oct 2025 14:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="X5JnXBQS";
	dkim-atps=neutral
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA7810E7EA
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 14:12:40 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4de659d5a06so6349601cf.3
 for <igt-dev@lists.freedesktop.org>; Thu, 02 Oct 2025 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759414359; x=1760019159;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nVmyVCsvEkwaT33Z+c1pwR160Uvxu5pqMZYkIzRUNJI=;
 b=X5JnXBQSBSYGSKchlMBx1qIVB2UIX9YBd6VvgNCpwsrwisnhTLtPHbkJJb+ysFwwi3
 nH7aWx2qLmuGOXhngEkG5TfApJiJENI6ZlNc8g6UgTUaFOPp8G6LubmXF4HWhKp/mhTu
 4/wBKZ+AK9gNC0MQHpk19NLnotfgrJjc5cVv17AnY7KS41nRiNBw2Kx8oBbGuwE9R6l9
 QZSAboLvNTz67aYQi0dSbD5qtZKjgm78PseW37gu3pjqrH6uz22VV2Au3eYUhCnSXotS
 VVjZCJvI5XDd6ZDeGKSTEx2m8XjKFj4D2ZzZ2CTMFDmmDzlB/D0Ur3+tK2dK5i+KZB+p
 egsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759414359; x=1760019159;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nVmyVCsvEkwaT33Z+c1pwR160Uvxu5pqMZYkIzRUNJI=;
 b=vPyFCcNiLVu7KYN1ey9rbq1fOjsjTP3/yNzbd9iO7fj6PmWcL68e0fRCcdbnDyMT/i
 8P/DVAwvH1VJjbCjpVfL8frYtClDNtqIGTRgpLhVm3y93crOIHZA98N54OgbuyJc1oGQ
 VmgZeOt+OBc/bCRElfS63/fLWltb6jFeFMIjfHoKnlqTiKdsJJAPg57kbI+5T80Svqsr
 N6gC6+oreb+wh7AWsHaPUZou9ZPmGl3a7qkcqDJbXpceOwjAbKCvjeFNmFQ8cN3ZRC1a
 tHkViqBrR68Jb2EZVDNbTFB9OjKKMqYy4qqExXwEu52uohHi1PfjHPvnT2o8q0Inb3CG
 Iu7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1a8eTmFDHMk9aqixRC6o0Dx95Lw9Vh+65uZ7j3dMDSRoM9h6gU9NqoFL/rv+6Dpbw3FDdeVkf@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDo+FzuChmNJksMcwdkCQd++9pN+Y3ELh9FinySarM0/7fl5qR
 B5i54rYGMuEpEECzb4YYLmgeYAvcJQi0g7pA34UvbpUd64tFOFjW8T/qldwBbJQZ7NBxmhJKTwE
 z+tzKA4dcYLqekdQ6xiQbNzbWDAtnNlgjSls4XQh4
X-Gm-Gg: ASbGncsFJO+WEL43BXXjRim+rtyJKCrfmrKKTWZAY2ipo1cXhZDB/nGrlL9IOMfqbiq
 udnA8LS3yFgB3FEscMM+ShqB+DUC5znm0e/rcE6kVqHA6cLnyqaHax+l7lYo+GSQbFC7XzhYXvn
 zBTwMR2coUDE4zMz79t6mMlpcbniXtCkVqfHFbrqUcF2DEMwj1aHAauPgmLntYPfM6cJKd/lIRT
 XJyFH5qBMjlVWBzPsFvZ0w3200+WKTS9bznfgyRZhU1e8/kPr4xFO+rZhXRmwMlGLa+
X-Google-Smtp-Source: AGHT+IFfWYtJrLWNqjfDwg8DKybX9TBFS5FKKVzyZ7N+5B2xARBIJNu154lFIcXWT7bSOFy2E5+fJM4nbqYx6xABtNA=
X-Received: by 2002:ac8:5fd3:0:b0:4b7:925b:440a with SMTP id
 d75a77b69052e-4e41ea177e2mr97990931cf.82.1759414358744; Thu, 02 Oct 2025
 07:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20251001185039.3386207-1-markyacoub@google.com>
 <20251002130314.yspo5xmgpc7tie6f@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251002130314.yspo5xmgpc7tie6f@kamilkon-DESK.igk.intel.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Thu, 2 Oct 2025 10:12:27 -0400
X-Gm-Features: AS18NWAv-5sZuwyCMpthgK0DDg1c14MORxTdK0FptJrD2zfwCYokrrndsJWWRCo
Message-ID: <CAC0gqY7hFmhOHVCwEq0CwXwe8PpjRUkWMt3G7HRQR7rWGFBx9Q@mail.gmail.com>
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

Hi Kamil, thanks a lot for the review.
clarification inline.

On Thu, Oct 2, 2025 at 9:03=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Mark,
> On 2025-10-01 at 14:50:38 -0400, Mark Yacoub wrote:
>
> please remove dot from end of subject, also imho this should
> be splitted into two commits, one for adding VIRTIO to
> drivers in lib/drmtest, second for your workaround to DRIVER_ANY
>
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
> >  lib/drmtest.h | 20 +++++++++++++-------
> >  2 files changed, 14 insertions(+), 7 deletions(-)
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
> >       { DRIVER_VKMS, "vkms" },
> >       { DRIVER_VMWGFX, "vmwgfx" },
> >       { DRIVER_XE, "xe" },
> > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > index a9542dde2..29356041b 100644
> > --- a/lib/drmtest.h
> > +++ b/lib/drmtest.h
> > @@ -37,6 +37,7 @@
> >  #include <xf86drm.h>
> >
> >  #include "igt_core.h"
> > +#include "config.h"
>
> This should be before igt_core.h (alphabetical order), also add
> some comment why you need it, like
>
> +#include "config.h" /* for ....reason... */
>  #include "igt_core.h"
>
> Is it needed for a workaround? (see below)
>
> >
> >  int __get_drm_device_name(int fd, char *name, int name_size);
> >
> > @@ -56,16 +57,21 @@ int __get_drm_device_name(int fd, char *name, int n=
ame_size);
> >  #define DRIVER_XE    (1 << 7)
> >  #define DRIVER_VMWGFX   (1 << 8)
> >  #define DRIVER_VKMS  (1 << 9)
> > +#define DRIVER_VIRTIO        (1 << 10)
> >
> >  /*
> > - * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
> > - * with vgem as well as a supported driver, you can end up with a
> > - * near-100% skip rate if you don't explicitly specify the device,
> > - * depending on device-load ordering.
> > - *
> > - * Exclude VKMS to prefer hardware drivers.
> > + * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if
> > + * you run on a system with vgem or virtio-gpu as well as a supported =
driver,
> > + * you can end up with a near-100% skip rate if you don't explicitly s=
pecify
> > + * the device, depending on device-load ordering.
> >   */
> > -#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS)
> > +/* Exclude VKMS to prefer hardware drivers if VKMS is not the preferre=
d driver. */
> > +#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
>
> Above (adding DRIVER_VIRTIO) should be in separate commit, with
> subject like:
>
> lib/drmtest: Add VIRTIO support
>
> and with proper description.
>
> > +
> > +#ifdef PREFER_VKMS
> > +#undef DRIVER_ANY
> > +#define DRIVER_ANY   ~(DRIVER_VGEM  | DRIVER_VIRTIO)
> > +#endif
>
> This looks like workaround, did you try running your test(s)
> with IGT_FORCE_DRIVER? Where is a problem? Do you need two
the problem is that originally DRIVER_ANY removes DRIVER_VKMS from the
list, so I'm unable to make IGT use VKMS as the driver.
A simple solution would be to remove it from the list of ~ and replace
it with `#define DRIVER_ANY   ~(DRIVER_VGEM  | DRIVER_VIRTIO)` but I'm
not sure what would it break. Do you have platforms that have VKMS +
other drivers where VKMS would have been picked up first and it's the
undesired behavior?
My virtual machine has both VIRTIO and VKMS, so I want it to pick
VKMS, while our Intel DUTs do not have any VKMS running on them.
What do you recommend that I do here?

> drivers loaded, not just one? imho this should work:
>
> sudo IGT_FORCE_DRIVER=3Dvkms build/tests/kms_content_protection --r subte=
st
>
> or try simple test:
>
> sudo IGT_FORCE_DRIVER=3Dvkms build/tests/core_getversion --r basic
>
> If this do not work drmlib should be fixed, as imho IGT_FORCE_DRIVER
> should override DRIVER_ANY? +cc Karthik and J-P
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>
> Regards,
> Kamil
>
> >
> >  /*
> >   * Compile friendly enum for i915/xe.
> > --
> > 2.51.0.618.g983fd99d29-goog
> >
