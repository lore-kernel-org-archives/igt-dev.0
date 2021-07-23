Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B9D6E9B0
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jul 2021 07:54:10 +0000 (UTC)
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Fri, 23 Jul 2021 07:54:00 +0000
Message-ID: <SN6PR11MB3421D0102BDC408FF6A082C0DFE59@SN6PR11MB3421.namprd11.prod.outlook.com>
References: <20210720105652.996036-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <CAKMK7uFnUoy5+XMK=ty+spx10O=a9nh_MF1ziCXVO9AUU+fqfA@mail.gmail.com>
 <20210723072616.GA4721@zkempczy-mobl2>
In-Reply-To: <20210723072616.GA4721@zkempczy-mobl2>
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
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> Sent: 23 July 2021 12:56
> To: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Surendrakumar Upadhyay, TejaskumarX
> <tejaskumarx.surendrakumar.upadhyay@intel.com>; IGT development <igt-
> dev@lists.freedesktop.org>
> Subject: Re: [igt-dev] [i-g-t V2] tests/kms_prime: Use 256B aligned width
> 
> On Thu, Jul 22, 2021 at 02:55:47PM +0200, Daniel Vetter wrote:
> > On Tue, Jul 20, 2021 at 1:05 PM Tejas Upadhyay
> > <tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
> > >
> > > Having different alignment requirement by different drivers, 256B
> > > aligned should work for all drm drivers.
> > >
> > > amdgpu and radeon, amdgpu_align_pitch: 256B armada, armada_pitch:
> > > 128B
> > > exynos_drm_gem_dumb_create: No alignment required
> > > drm_gem_shmem_dumb_create: 8B
> > > drm_gem_vram_fill_create_dumb: 8B
> > >
> > > Thus 256B covers everything we see in the kernel drm drivers.
> > >
> > > Changes since V1:
> > >         - Edited commit message with driver compatible with 256B
> > > align-Daniel
> > >
> > > Signed-off-by: Tejas Upadhyay
> > > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> >
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Why we should create bigger dumb buffer on specific driver than required?

In order to have generic minimum align requirement across vendor drivers, we need to put 256B.

Thanks,
Tejas
> 
> --
> Zbigniew
> 
> 
> >
> > > ---
> > >  tests/kms_prime.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/tests/kms_prime.c b/tests/kms_prime.c index
> > > 35f4b5b7..2e20c58b 100644
> > > --- a/tests/kms_prime.c
> > > +++ b/tests/kms_prime.c
> > > @@ -101,7 +101,7 @@ static void prepare_scratch(int exporter_fd, struct
> dumb_bo *scratch,
> > >         scratch->bpp = 32;
> > >
> > >         scratch->handle = kmstest_dumb_create(exporter_fd,
> > > -                       scratch->width,
> > > +                       ALIGN(scratch->width, 256),
> > >                         scratch->height,
> > >                         scratch->bpp,
> > >                         &scratch->pitch,
> > > --
> > > 2.31.1
> > >
> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
