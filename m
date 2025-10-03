Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4E9CCA471
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 14:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA0310E934;
	Fri,  3 Oct 2025 14:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="35T2tM9X";
	dkim-atps=neutral
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECE910E934
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 14:48:26 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4db7e5a653cso23165731cf.1
 for <igt-dev@lists.freedesktop.org>; Fri, 03 Oct 2025 07:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759502905; x=1760107705;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uxRjqAcQgWh1a8gw/dNSS7oh2keDqbuYCUWAFZD2ZoY=;
 b=35T2tM9X5nGTYYenA+Ew5RHqpzGGc7GDEj62mWR6nklBszaaMcps/e/Le8hZcmy0Dh
 6CS1JUNbPMYayH1FHSfOFRGhL8Ac0OjnFg+NTE5Rh726r+roWB9j88LqAZ8e2d1vYwUU
 xoWNmm3JG0r/RAyjvxdORIHOihwuyNnOCZ5srUVIa0SDynwU7BDfhxVWira0eFobM36h
 /bERCcPTViBfA4PlUSHHoJoutvrqcOyS1n6LHi65FTeJItB9XR05+oe+PRnqUnxAUJFI
 V/niw7zlWtS2j0L4QJM8On8B+mOOnYkds/OT3PNfNo+iXItf+JauXH/indbi0m9rgbPO
 Kqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759502905; x=1760107705;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uxRjqAcQgWh1a8gw/dNSS7oh2keDqbuYCUWAFZD2ZoY=;
 b=ShiWyjecEd+hoWRK4RMob+yHzs/xg4jbkniMoghq4suhCiGSDHdfGHv/MxtDS4AOZF
 0DOOvJMO1Q5WuIWuMqS5SWG5WuKVJ24AUMytku+PLiXRmf0mn6z3LJiVtPiUjRuBGCZm
 iS6E195TSa+2OPScj5ZF/Sysxjigzn325glpw0xnUGd9ZIYGdxesUVGBWGd8mEsYrWgG
 ClyuqqBbUTYNYryAOLKlFXCeH4RAPpU5AfQJRlkANOsYdN3HIvI1X6pzcmQAdLkWe2o5
 fl63bdQsGm24KwvTCfmHDvSiTTp0qHwFoUa0HVzCH3pQwJ0x1NL91SDO2TxjdwqnF0xT
 /phg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSKqF0AjGvE6DH6qjKmk3TPSmHHySpbaUKtrxxBHVDw/n+9FUf0TtSbAoeM/FXZBz4yy5L0XXW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgmKdriVF1CIgY/z2zm7idzBEWSOn9MmM8NgTqqPIGjeMWzLWj
 F0xWn1QpakKLQJWXy6X0fxIH+oQVhylSU5OHJ0UqHelDXLz37GjqSbsrFS9FvIwF7gqVCMeFEMS
 IbzBz8Ex7eY/akc6zRoyD8pJppL/DsGornGTqavtc
X-Gm-Gg: ASbGnctZQyFPAPFQrPNUivhkR9Hb690YbevRXQnLDGvelquqfLqWAU8cGlUTJH8kdGV
 jBnRgXTNTshaHL3XA9cM3d1em5sILOLMg3xDNedsI4sY2SzrGTOQVnsCfbbdK/53jGTkGCsdsoL
 PXbDoGCUrMmqbcxyftI6TOnIdaweP2hKeKxsotr6sBwIkm2LRgJb+43ow79plA3mz7MbXuAdTYs
 GE+drZptadrPrkNRiwHZcgeeLh3nG3PuEx3sEf92GH0o7PcONRqwgFfk5pAuOAV31Df
X-Google-Smtp-Source: AGHT+IHNSXVRqW3GVQwb4x+IH64XIl4HMd3K201/S4J42WukvJt4AMzdoQoF9S0AgZG2gTj/W3ue39QiiPxTHeSAS1U=
X-Received: by 2002:ac8:5885:0:b0:4b5:fa2e:380f with SMTP id
 d75a77b69052e-4e576a40192mr51398071cf.27.1759502904404; Fri, 03 Oct 2025
 07:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251002151714.595492-1-markyacoub@google.com>
 <20251002190659.ssmba4pobyp7jmw5@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251002190659.ssmba4pobyp7jmw5@kamilkon-DESK.igk.intel.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Fri, 3 Oct 2025 10:48:13 -0400
X-Gm-Features: AS18NWDvuoFVoEDtnYc5RuaLIj3w6YwXgdczlYkEK1vbae1OoWlLfwJNxBfTxeQ
Message-ID: <CAC0gqY4tzJgO=hiTkGmkffL5sUWets-nDMiDEC7FK0_BGzr6PA@mail.gmail.com>
Subject: Re: [PATCH i-g-t] lib/drmtest: Add Support for Virtio-GPU
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, 
 igt-dev@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>
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

Thank you so much for applying it.

On Thu, Oct 2, 2025 at 3:07=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Mark,
> On 2025-10-02 at 11:17:14 -0400, Mark Yacoub wrote:
> > [Why]
> > Android's Virtual Device (AVD) has virtio-gpu has its primary driver. W=
e
> > want to be to detect it so we can filter out it through DRIVER_ANY.
> >
> > [How]
> > Add DRIVER_VIRTIO to the exclusion list of DRIVER_ANY
>
> s/to the/to known drivers and to/
>
> >
> > Test: ran kms_bw on AVD.
>
> Tested with kms_bw on AVD.
>
> >
> > Change-Id: Ie7987c706546bc0fbd437e221f7ecd4c7bc759a9
> > Signed-off-by: Mark Yacoub <markyacoub@google.com?
>
> s/?/>/
>
> No need for resend, it could be fixed at merge.
>
> > cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > cc: Louis Chauvet <louis.chauvet@bootlin.com>
>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> > ---
> >  lib/drmtest.c | 1 +
> >  lib/drmtest.h | 9 +++++----
> >  2 files changed, 6 insertions(+), 4 deletions(-)
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
> > index a9542dde2..8416aa491 100644
> > --- a/lib/drmtest.h
> > +++ b/lib/drmtest.h
> > @@ -56,16 +56,17 @@ int __get_drm_device_name(int fd, char *name, int n=
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
> > + * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if you =
run
> > + * on a system with them as well as a supported driver, you can end up
> > + * with a near-100% skip rate if you don't explicitly specify the devi=
ce,
> >   * depending on device-load ordering.
> >   *
> >   * Exclude VKMS to prefer hardware drivers.
> >   */
> > -#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS)
> > +#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
> >
> >  /*
> >   * Compile friendly enum for i915/xe.
> > --
> > 2.51.0.618.g983fd99d29-goog
> >
