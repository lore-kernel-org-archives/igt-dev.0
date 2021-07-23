Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629AC6F565
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jul 2021 09:08:55 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 13-20020a4ae1ad0000b029024b19a4d98eso235104ooy.5
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jul 2021 02:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210720105652.996036-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <CAKMK7uFnUoy5+XMK=ty+spx10O=a9nh_MF1ziCXVO9AUU+fqfA@mail.gmail.com>
 <20210723072616.GA4721@zkempczy-mobl2>
 <SN6PR11MB3421D0102BDC408FF6A082C0DFE59@SN6PR11MB3421.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB3421D0102BDC408FF6A082C0DFE59@SN6PR11MB3421.namprd11.prod.outlook.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 23 Jul 2021 11:08:43 +0200
Message-ID: <CAKMK7uFDEiL7qZA88wzrvrdq5RDsZ0Ffji1eGfTd0UtapSiVWA@mail.gmail.com>
Subject: Re: [igt-dev] [i-g-t V2] tests/kms_prime: Use 256B aligned width
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 9:54 AM Surendrakumar Upadhyay, TejaskumarX
<tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> > Sent: 23 July 2021 12:56
> > To: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Surendrakumar Upadhyay, TejaskumarX
> > <tejaskumarx.surendrakumar.upadhyay@intel.com>; IGT development <igt-
> > dev@lists.freedesktop.org>
> > Subject: Re: [igt-dev] [i-g-t V2] tests/kms_prime: Use 256B aligned width
> >
> > On Thu, Jul 22, 2021 at 02:55:47PM +0200, Daniel Vetter wrote:
> > > On Tue, Jul 20, 2021 at 1:05 PM Tejas Upadhyay
> > > <tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
> > > >
> > > > Having different alignment requirement by different drivers, 256B
> > > > aligned should work for all drm drivers.
> > > >
> > > > amdgpu and radeon, amdgpu_align_pitch: 256B armada, armada_pitch:
> > > > 128B
> > > > exynos_drm_gem_dumb_create: No alignment required
> > > > drm_gem_shmem_dumb_create: 8B
> > > > drm_gem_vram_fill_create_dumb: 8B
> > > >
> > > > Thus 256B covers everything we see in the kernel drm drivers.
> > > >
> > > > Changes since V1:
> > > >         - Edited commit message with driver compatible with 256B
> > > > align-Daniel
> > > >
> > > > Signed-off-by: Tejas Upadhyay
> > > > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > >
> > > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > Why we should create bigger dumb buffer on specific driver than required?
>
> In order to have generic minimum align requirement across vendor drivers, we need to put 256B.

This doesn't explain anything about why _this_ location is the right
spot to put this alignment. And I agree with Zbyscek that the commit
message really doesn't explain that. I guess that needs to be added
before merging ...

Also I think Zbyscek volunteered to push this, please don't shop
around for committers until someone just pushes without asking
questions or trying to understand the patch beforehand. That's not how
it's supposed to work.
-Daniel

> Thanks,
> Tejas
> >
> > --
> > Zbigniew
> >
> >
> > >
> > > > ---
> > > >  tests/kms_prime.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/tests/kms_prime.c b/tests/kms_prime.c index
> > > > 35f4b5b7..2e20c58b 100644
> > > > --- a/tests/kms_prime.c
> > > > +++ b/tests/kms_prime.c
> > > > @@ -101,7 +101,7 @@ static void prepare_scratch(int exporter_fd, struct
> > dumb_bo *scratch,
> > > >         scratch->bpp = 32;
> > > >
> > > >         scratch->handle = kmstest_dumb_create(exporter_fd,
> > > > -                       scratch->width,
> > > > +                       ALIGN(scratch->width, 256),
> > > >                         scratch->height,
> > > >                         scratch->bpp,
> > > >                         &scratch->pitch,
> > > > --
> > > > 2.31.1
> > > >
> > > > _______________________________________________
> > > > igt-dev mailing list
> > > > igt-dev@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
