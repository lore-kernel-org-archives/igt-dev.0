Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3721CAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 19:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8605810E043;
	Thu,  2 Oct 2025 19:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fb4G3t61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FAE10E043
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 19:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759432717; x=1790968717;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+QdleJSpnMTMhG+8klOKJim3sdbZ1l6z50EOFXwCKvE=;
 b=fb4G3t614Rg3f3G5CeSpyg3Ag8iXs5yicqCxkhIiSf5+wrv51e9xi1BN
 DO8Hsh5c8AK2mH3pIRAtmT/vrtRX39obFL5sJd1h4D0AttgFZ1OcpBbIV
 WumP6RzWgSLcXZJpNZYjZnvmn8rg+MFrbD02qFmKtieIoi+e2WMPW2LHE
 T+V7HQfO/Z9zQwRpfhLR84+0+AeJeK1xrbahMTk4kpUpftCQ6eWxZm0pq
 NP2r8f2nayAAQGpyMuVA6WAk7qgowg1AlsVK3jjQBYROSkATJr2vdyXYN
 ne8PC7HY3/gjeStB0i+ukxP5J7Nz7SfsFHmDdFx/lOb6ncTkc6l3oVmA9 g==;
X-CSE-ConnectionGUID: fgjCnV8vQv24v/Kinvr8DA==
X-CSE-MsgGUID: 4yTSOTLBRj2N6P55o3aXeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65550169"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65550169"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:18:37 -0700
X-CSE-ConnectionGUID: g9ukZRvjQiqVVcajipSwAA==
X-CSE-MsgGUID: 75KuakwWQpOc8a5CGlF2yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="178235903"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 12:18:35 -0700
Date: Thu, 2 Oct 2025 21:18:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH i-g-t v2] lib/drmtest: Allow DRIVER_ANY tests to run on
 VKMS when supported.
Message-ID: <20251002191832.dc5eyfgyoius6l64@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 louis.chauvet@bootlin.com, Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20251001185039.3386207-1-markyacoub@google.com>
 <20251002130314.yspo5xmgpc7tie6f@kamilkon-DESK.igk.intel.com>
 <CAC0gqY7hFmhOHVCwEq0CwXwe8PpjRUkWMt3G7HRQR7rWGFBx9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC0gqY7hFmhOHVCwEq0CwXwe8PpjRUkWMt3G7HRQR7rWGFBx9Q@mail.gmail.com>
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

Hi Mark,
On 2025-10-02 at 10:12:27 -0400, Mark Yacoub wrote:
> Hi Kamil, thanks a lot for the review.
> clarification inline.
> 
> On Thu, Oct 2, 2025 at 9:03 AM Kamil Konieczny
> <kamil.konieczny@linux.intel.com> wrote:
> >
> > Hi Mark,
> > On 2025-10-01 at 14:50:38 -0400, Mark Yacoub wrote:
> >
> > please remove dot from end of subject, also imho this should
> > be splitted into two commits, one for adding VIRTIO to
> > drivers in lib/drmtest, second for your workaround to DRIVER_ANY
> >
> > > [Why]
> > > Android's VM use virtio-gpu as its default driver, but VKMS can be
> > > enabled on top it.
> > > VKMS is the preferred driver to run IGT.
> > >
> > > [How]
> > > To maintain the current way to preferring hardware drivers, introduce a
> > > "PREFER_VKMS" flag which does not remove DRIVER_VKMS from the list of
> > > drivers to be opened. Android will keep this as always true.
> > >
> > > Also, added explicit support for virtio-gpu to be explictly filtered
> > > out, making room for VKMS to be the primary driver in use.
> > >
> > > Test: kms_bw on AVD
> > > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > > ---
> > >  lib/drmtest.c |  1 +
> > >  lib/drmtest.h | 20 +++++++++++++-------
> > >  2 files changed, 14 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > > index 551385867..a1fb0b5ba 100644
> > > --- a/lib/drmtest.c
> > > +++ b/lib/drmtest.c
> > > @@ -223,6 +223,7 @@ static const struct module {
> > >       { DRIVER_V3D, "v3d" },
> > >       { DRIVER_VC4, "vc4" },
> > >       { DRIVER_VGEM, "vgem" },
> > > +     { DRIVER_VIRTIO, "virtio_gpu" },
> > >       { DRIVER_VKMS, "vkms" },
> > >       { DRIVER_VMWGFX, "vmwgfx" },
> > >       { DRIVER_XE, "xe" },
> > > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > > index a9542dde2..29356041b 100644
> > > --- a/lib/drmtest.h
> > > +++ b/lib/drmtest.h
> > > @@ -37,6 +37,7 @@
> > >  #include <xf86drm.h>
> > >
> > >  #include "igt_core.h"
> > > +#include "config.h"
> >
> > This should be before igt_core.h (alphabetical order), also add
> > some comment why you need it, like
> >
> > +#include "config.h" /* for ....reason... */
> >  #include "igt_core.h"
> >
> > Is it needed for a workaround? (see below)
> >
> > >
> > >  int __get_drm_device_name(int fd, char *name, int name_size);
> > >
> > > @@ -56,16 +57,21 @@ int __get_drm_device_name(int fd, char *name, int name_size);
> > >  #define DRIVER_XE    (1 << 7)
> > >  #define DRIVER_VMWGFX   (1 << 8)
> > >  #define DRIVER_VKMS  (1 << 9)
> > > +#define DRIVER_VIRTIO        (1 << 10)
> > >
> > >  /*
> > > - * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
> > > - * with vgem as well as a supported driver, you can end up with a
> > > - * near-100% skip rate if you don't explicitly specify the device,
> > > - * depending on device-load ordering.
> > > - *
> > > - * Exclude VKMS to prefer hardware drivers.
> > > + * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if
> > > + * you run on a system with vgem or virtio-gpu as well as a supported driver,
> > > + * you can end up with a near-100% skip rate if you don't explicitly specify
> > > + * the device, depending on device-load ordering.
> > >   */
> > > -#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS)
> > > +/* Exclude VKMS to prefer hardware drivers if VKMS is not the preferred driver. */
> > > +#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
> >
> > Above (adding DRIVER_VIRTIO) should be in separate commit, with
> > subject like:
> >
> > lib/drmtest: Add VIRTIO support
> >
> > and with proper description.
> >
> > > +
> > > +#ifdef PREFER_VKMS
> > > +#undef DRIVER_ANY
> > > +#define DRIVER_ANY   ~(DRIVER_VGEM  | DRIVER_VIRTIO)
> > > +#endif
> >
> > This looks like workaround, did you try running your test(s)
> > with IGT_FORCE_DRIVER? Where is a problem? Do you need two
> the problem is that originally DRIVER_ANY removes DRIVER_VKMS from the
> list, so I'm unable to make IGT use VKMS as the driver.
> A simple solution would be to remove it from the list of ~ and replace
> it with `#define DRIVER_ANY   ~(DRIVER_VGEM  | DRIVER_VIRTIO)` but I'm
> not sure what would it break. Do you have platforms that have VKMS +
> other drivers where VKMS would have been picked up first and it's the
> undesired behavior?
> My virtual machine has both VIRTIO and VKMS, so I want it to pick
> VKMS, while our Intel DUTs do not have any VKMS running on them.
> What do you recommend that I do here?

I see, nobody before needed it so now imho we could fix it
with proper use of IGT_FORCE_DRIVER. I tried it with vgem
and core_getversion, it seems I will need to fix drmtest and
then I will ask you for a test.
It would be more complicated if you want DRIVER_ANY + FORCE
load two drivers, not one, but I assume it is not the case?

Regards,
Kamil

> 
> > drivers loaded, not just one? imho this should work:
> >
> > sudo IGT_FORCE_DRIVER=vkms build/tests/kms_content_protection --r subtest
> >
> > or try simple test:
> >
> > sudo IGT_FORCE_DRIVER=vkms build/tests/core_getversion --r basic
> >
> > If this do not work drmlib should be fixed, as imho IGT_FORCE_DRIVER
> > should override DRIVER_ANY? +cc Karthik and J-P
> >
> > Cc: Karthik B S <karthik.b.s@intel.com>
> > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> >
> > Regards,
> > Kamil
> >
> > >
> > >  /*
> > >   * Compile friendly enum for i915/xe.
> > > --
> > > 2.51.0.618.g983fd99d29-goog
> > >
