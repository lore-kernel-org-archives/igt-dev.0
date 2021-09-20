Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844C66E453
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 09:45:00 +0000 (UTC)
Date: Mon, 20 Sep 2021 11:44:55 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210920094455.GA58558@zkempczy-mobl2>
References: <20210920075623.31580-1-vidya.srinivas@intel.com>
 <20210920080047.31650-1-vidya.srinivas@intel.com>
 <20210920092432.GA4614@zkempczy-mobl2>
 <BY5PR11MB437271D7E85B0C2310406C8689A09@BY5PR11MB4372.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BY5PR11MB437271D7E85B0C2310406C8689A09@BY5PR11MB4372.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_bufops: Fix regression on 5.4
 kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Cc: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "markyacoub@google.com" <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 20, 2021 at 11:40:02AM +0200, Srinivas, Vidya wrote:
> 
> 
> > -----Original Message-----
> > From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> > Sent: Monday, September 20, 2021 2:55 PM
> > To: Srinivas, Vidya <vidya.srinivas@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Modem, Bhanuprakash
> > <bhanuprakash.modem@intel.com>; markyacoub@google.com
> > Subject: Re: [PATCH i-g-t] lib/intel_bufops: Fix regression on 5.4 kernel
> >
> > On Mon, Sep 20, 2021 at 01:30:47PM +0530, Vidya Srinivas wrote:
> > > Starting commit 8759c4a3020ce4 "Add intel_buf_init_in_region"
> > > __intel_buf_init uses gem_create_in_memory_regions instead of
> > > gem_create. Older kernels like 5.4 still dont have support for
> > > I915_GEM_CREATE_EXT_MEMORY_REGIONS (i915_gem_create_ext_ioctl)
> > from
> > > kernel commit
> > > (https://patchwork.freedesktop.org/patch/431581/?series=89648&rev=1)
> > > Due to this, the flip-vs-fences tests are failing on kernel 5.4 Patch
> > > adds fall back to gem_create when __gem_create_in_memory_region_list
> > fails.
> > >
> > > v2 - Addressed review comments from Zbigniew and Mark Added the fall
> > > back in __intel_buf_init
> > >
> > > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > > ---
> > >  lib/intel_bufops.c | 8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c index
> > > f5f67eddabd7..c8c0a730ccfa 100644
> > > --- a/lib/intel_bufops.c
> > > +++ b/lib/intel_bufops.c
> > > @@ -818,8 +818,12 @@ static void __intel_buf_init(struct buf_ops
> > > *bops,
> > >
> > >     if (handle)
> > >             buf->handle = handle;
> > > -   else
> > > -           buf->handle = gem_create_in_memory_regions(bops->fd,
> > size, region);
> > > +   else {
> > > +           if( __gem_create_in_memory_regions(bops->fd, &handle,
> > size, region)
> > > +!= 0)
> >                   ^---- missing space
> >
> > Fix minor syntax nit, then:
> 
> Hello Zbigniew,
> 
> Apologies for the syntax error. 

It's not syntax error, just convention we try to keep to have code clear
and standarized.

--
Zbigniew

> I have fixed and repushed the change.
> https://patchwork.freedesktop.org/patch/454579/?series=94761&rev=4
> Thanks much for the Reviewed-by.
> @Modem, Bhanuprakash, @Joshi, Kunal1 - Can we merge this change if CI completes?
> Thank you.
> 
> Regards
> Vidya
> 
> >
> > Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> >
> > --
> > Zbigniew
> >
> > > +                   buf->handle = gem_create(bops->fd, size);
> > > +           else
> > > +                   buf->handle = handle;
> > > +   }
> > >
> > >     set_hw_tiled(bops, buf);
> > >  }
> > > --
> > > 2.33.0
> > >
