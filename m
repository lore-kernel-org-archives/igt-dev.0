Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7036E5A5
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 17:28:11 +0000 (UTC)
Date: Mon, 20 Sep 2021 19:28:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210920172806.GA78788@zkempczy-mobl2>
References: <20210920080047.31650-1-vidya.srinivas@intel.com>
 <20210920092455.19691-1-vidya.srinivas@intel.com>
 <20210920094638.GB58558@zkempczy-mobl2>
 <BY5PR11MB437217DD27CF0AB34C0628CD89A09@BY5PR11MB4372.namprd11.prod.outlook.com>
 <DM8PR11MB57199F8801292EE03EAE11B88DA09@DM8PR11MB5719.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM8PR11MB57199F8801292EE03EAE11B88DA09@DM8PR11MB5719.namprd11.prod.outlook.com>
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
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: "Srinivas, Vidya" <vidya.srinivas@intel.com>, "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "markyacoub@google.com" <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 20, 2021 at 12:32:03PM +0200, Modem, Bhanuprakash wrote:
> > From: Srinivas, Vidya <vidya.srinivas@intel.com>
> > Sent: Monday, September 20, 2021 3:43 PM
> > To: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Modem,
> > Bhanuprakash <bhanuprakash.modem@intel.com>; Joshi, Kunal1
> > <kunal1.joshi@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; markyacoub@google.com
> > Subject: RE: [PATCH i-g-t] lib/intel_bufops: Fix regression on 5.4 kernel
> >
> >
> >
> > > -----Original Message-----
> > > From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> > > Sent: Monday, September 20, 2021 3:17 PM
> > > To: Srinivas, Vidya <vidya.srinivas@intel.com>
> > > Cc: igt-dev@lists.freedesktop.org; Modem, Bhanuprakash
> > > <bhanuprakash.modem@intel.com>; markyacoub@google.com
> > > Subject: Re: [PATCH i-g-t] lib/intel_bufops: Fix regression on 5.4 kernel
> > >
> > > On Mon, Sep 20, 2021 at 02:54:55PM +0530, Vidya Srinivas wrote:
> > > > Starting commit 8759c4a3020ce4 "Add intel_buf_init_in_region"
> > > > __intel_buf_init uses gem_create_in_memory_regions instead of
> > > > gem_create. Older kernels like 5.4 still dont have support for
> > > > I915_GEM_CREATE_EXT_MEMORY_REGIONS (i915_gem_create_ext_ioctl)
> > > from
> > > > kernel commit
> > > > (https://patchwork.freedesktop.org/patch/431581/?series=89648&rev=1)
> > > > Due to this, the flip-vs-fences tests are failing on kernel 5.4 Patch
> > > > adds fall back to gem_create when __gem_create_in_memory_region_list
> > > fails.
> > > >
> > > > v2 - Addressed review comments from Zbigniew and Mark Added the fall
> > > > back in __intel_buf_init
> > > >
> > > > v3 - Fixed space issue - review comment from Zbigniew
> > > >
> > > > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > > > ---
> > > >  lib/intel_bufops.c | 8 ++++++--
> > > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c index
> > > > f5f67eddabd7..0236e4d919d5 100644
> > > > --- a/lib/intel_bufops.c
> > > > +++ b/lib/intel_bufops.c
> > > > @@ -818,8 +818,12 @@ static void __intel_buf_init(struct buf_ops
> > > > *bops,
> > > >
> > > >   if (handle)
> > > >           buf->handle = handle;
> > > > - else
> > > > -         buf->handle = gem_create_in_memory_regions(bops->fd,
> > > size, region);
> > > > + else {
> > > > +         if (__gem_create_in_memory_regions(bops->fd, &handle,
> > > size, region) != 0)
> > > > +                 buf->handle = gem_create(bops->fd, size);
> > > > +         else
> > > > +                 buf->handle = handle;
> 
> There is nothing wrong with this code, but I personally feels to update
> as below can be more user understandable (Just throw legacy/incompatible
> stuff to else condition)
> 
> if (!__gem_create_in_memory_regions(bops->fd, &handle, size, region))
>         buf->handle = handle;
> else
>         buf->handle = gem_create(bops->fd, size);
> 
> Acked-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> - Bhanu

Hmm, after looking at wider context we could even do

if (__gem_create_in_memory_regions(bops->fd, &buf->handle, size, region))
         buf->handle = gem_create(bops->fd, size);

But this will likely obscure the intention.

--
Zbigniew

> 
> > > > + }
> > >
> > > Patchwork didn't get my previous rb, so for easier merge:
> > >
> > > Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> >
> > Hello Zbigniew,
> >
> > Thank you so much. That is extremely kind of you.
> >
> > @Modem, Bhanuprakash, @Joshi, Kunal1 kindly help with merge if it passes CI.
> >
> > Regards
> > Vidya
> >
> > >
> > > --
> > > Zbigniew
> > >
> > > >
> > > >   set_hw_tiled(bops, buf);
> > > >  }
> > > > --
> > > > 2.33.0
> > > >
