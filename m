Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535A26F58F
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jul 2021 09:21:15 +0000 (UTC)
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Fri, 23 Jul 2021 09:21:07 +0000
Message-ID: <SN6PR11MB3421405CEA358098EA5C22E6DFE59@SN6PR11MB3421.namprd11.prod.outlook.com>
References: <20210720105652.996036-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <CAKMK7uFnUoy5+XMK=ty+spx10O=a9nh_MF1ziCXVO9AUU+fqfA@mail.gmail.com>
 <20210723072616.GA4721@zkempczy-mobl2>
 <SN6PR11MB3421D0102BDC408FF6A082C0DFE59@SN6PR11MB3421.namprd11.prod.outlook.com>
 <CAKMK7uFDEiL7qZA88wzrvrdq5RDsZ0Ffji1eGfTd0UtapSiVWA@mail.gmail.com>
In-Reply-To: <CAKMK7uFDEiL7qZA88wzrvrdq5RDsZ0Ffji1eGfTd0UtapSiVWA@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Daniel Vetter <daniel.vetter@ffwll.ch>
> Sent: 23 July 2021 14:39
> To: Surendrakumar Upadhyay, TejaskumarX
> <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; IGT
> development <igt-dev@lists.freedesktop.org>
> Subject: Re: [igt-dev] [i-g-t V2] tests/kms_prime: Use 256B aligned width
> 
> On Fri, Jul 23, 2021 at 9:54 AM Surendrakumar Upadhyay, TejaskumarX
> <tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> > > Sent: 23 July 2021 12:56
> > > To: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Surendrakumar Upadhyay, TejaskumarX
> > > <tejaskumarx.surendrakumar.upadhyay@intel.com>; IGT development
> > > <igt- dev@lists.freedesktop.org>
> > > Subject: Re: [igt-dev] [i-g-t V2] tests/kms_prime: Use 256B aligned
> > > width
> > >
> > > On Thu, Jul 22, 2021 at 02:55:47PM +0200, Daniel Vetter wrote:
> > > > On Tue, Jul 20, 2021 at 1:05 PM Tejas Upadhyay
> > > > <tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
> > > > >
> > > > > Having different alignment requirement by different drivers,
> > > > > 256B aligned should work for all drm drivers.
> > > > >
> > > > > amdgpu and radeon, amdgpu_align_pitch: 256B armada,
> armada_pitch:
> > > > > 128B
> > > > > exynos_drm_gem_dumb_create: No alignment required
> > > > > drm_gem_shmem_dumb_create: 8B
> > > > > drm_gem_vram_fill_create_dumb: 8B
> > > > >
> > > > > Thus 256B covers everything we see in the kernel drm drivers.
> > > > >
> > > > > Changes since V1:
> > > > >         - Edited commit message with driver compatible with 256B
> > > > > align-Daniel
> > > > >
> > > > > Signed-off-by: Tejas Upadhyay
> > > > > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > > >
> > > > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >
> > > Why we should create bigger dumb buffer on specific driver than
> required?
> >
> > In order to have generic minimum align requirement across vendor drivers,
> we need to put 256B.
> 
> This doesn't explain anything about why _this_ location is the right spot to
> put this alignment. And I agree with Zbyscek that the commit message really
> doesn't explain that. I guess that needs to be added before merging ...
>
This location is right because kms_prime is the test which uses Vgem driver --> which does not take care of Intel alignment requirement. Earlier I pushed for Vgem driver where if we detect intel platform we should align to 64B/256B which is rejected by Daniel saying we should keep Vgem driver away from this better put change in IGT. And in IGT this is the only place where we need to align before sending request to Vgem driver.
 
> Also I think Zbyscek volunteered to push this, please don't shop around for
> committers until someone just pushes without asking questions or trying to
> understand the patch beforehand. That's not how it's supposed to work.

Its urgent for google and I have been following with multiple patches with multiple people over some time to get the change to what they think is right. I explained same thing to Zbyscek while I was requesting for push. I am sorry if anybody is annoyed with requests.

Thanks,
Tejas
> -Daniel
> 
> > Thanks,
> > Tejas
> > >
> > > --
> > > Zbigniew
> > >
> > >
> > > >
> > > > > ---
> > > > >  tests/kms_prime.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/tests/kms_prime.c b/tests/kms_prime.c index
> > > > > 35f4b5b7..2e20c58b 100644
> > > > > --- a/tests/kms_prime.c
> > > > > +++ b/tests/kms_prime.c
> > > > > @@ -101,7 +101,7 @@ static void prepare_scratch(int exporter_fd,
> > > > > struct
> > > dumb_bo *scratch,
> > > > >         scratch->bpp = 32;
> > > > >
> > > > >         scratch->handle = kmstest_dumb_create(exporter_fd,
> > > > > -                       scratch->width,
> > > > > +                       ALIGN(scratch->width, 256),
> > > > >                         scratch->height,
> > > > >                         scratch->bpp,
> > > > >                         &scratch->pitch,
> > > > > --
> > > > > 2.31.1
> > > > >
> > > > > _______________________________________________
> > > > > igt-dev mailing list
> > > > > igt-dev@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > > >
> > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation http://blog.ffwll.ch
> > > > _______________________________________________
> > > > igt-dev mailing list
> > > > igt-dev@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> 
> 
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
