Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16566E2E6
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 06:52:24 +0000 (UTC)
Date: Tue, 5 Oct 2021 08:52:18 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211005065218.GA3744@zkempczy-mobl2>
References: <20211004054056.24346-1-zbigniew.kempczynski@intel.com>
 <20211004054056.24346-3-zbigniew.kempczynski@intel.com>
 <87bl44z8av.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bl44z8av.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/intel_bufops: Store gem bo size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 04, 2021 at 04:20:24PM -0700, Dixit, Ashutosh wrote:
> On Sun, 03 Oct 2021 22:40:56 -0700, Zbigniew Kempczyński wrote:
> >
> > intel_buf is keeping its size which may differ to underlying gem bo size.
> > Introduce keeping bo_size field which is used along with softpin mode
> > - like in intel_bb.
> >
> > Patch also should remove previous discrepancy where intel_buf_bo_size()
> > returned requested (not gem bo size).
> >
> > From now on user has an access to:
> > 1. raw buffer size - intel_buf_size() - function returns how buffer data
> >    really takes in the memory
> 
> Not sure what we mean by this since intel_buf_size() can return 0 even with
> a non-zero handle. See below.
> 
> > 2. gem bo buffer size - intel_buf_bo_size() - function returns how big
> >    underlying gem object is
> 
> > diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> > index 7199723bb..80c5bb80b 100644
> > --- a/lib/intel_bufops.c
> > +++ b/lib/intel_bufops.c
> > @@ -813,17 +813,16 @@ static void __intel_buf_init(struct buf_ops *bops,
> >		size = bo_size;
> >	}
> >
> > -	/* Store real bo size to avoid mistakes in calculating it again */
> > +	/* Store buffer size to avoid mistakes in calculating it again */
> >	buf->size = size;
> > +	buf->handle = handle;
> >
> > -	if (handle)
> > -		buf->handle = handle;
> > -	else {
> > -		if (!__gem_create_in_memory_regions(bops->fd, &handle, &size, region))
> > -			buf->handle = handle;
> > -		else
> > -			buf->handle = gem_create(bops->fd, size);
> > -	}
> > +	if (!handle)
> > +		if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &size, region))
> > +			igt_assert_eq(__gem_create(bops->fd, &size, &buf->handle), 0);
> > +
> > +	/* Store gem bo size */
> > +	buf->bo_size = size;
> 
> The code after the above changes is like this:
> 
>         if (bo_size > 0) {
>                 igt_assert(bo_size >= size);
>                 size = bo_size;
>         }
> 
>         /* Store buffer size to avoid mistakes in calculating it again */
>         buf->size = size;
>         buf->handle = handle;
> 
>         if (!handle)
>                 if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &size, region))
>                         igt_assert_eq(__gem_create(bops->fd, &size, &buf->handle), 0);
> 
>         /* Store gem bo size */
>         buf->bo_size = size;
> 
> The function is called with:
> 
> a. handle == 0 or != 0
> b. bo_size == 0 or != 0
> 
> As seen in __intel_buf_init callers:
> 
> *** lib/intel_bufops.c:
> __intel_buf_init[728]          static void __intel_buf_init(struct buf_ops *bops,
> intel_buf_init[851]            __intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
> intel_buf_init_in_region[868]  __intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
> intel_buf_init_using_handle[927] __intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
> intel_buf_create_using_handle_and_size[1013] __intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
> 
> So when handle != 0 and bo_size == 0, we end with both buf->size == buf->bo_size == 0.

But we're overwriting size only when bo_size > 0:

	if (bo_size > 0) {
		igt_assert(bo_size >= size);
		size = bo_size;
	}

> When handle == 0 and bo_size == 0, we end up with buf->size == 0 and buf->bo_size != 0.

Regardless handle we got size > 0 always. It comes from 

	if (compression) {
		...
		size = buf->ccs[0].offset + aux_width * aux_height;	
	} else {
		...
		size = buf->surface[0].stride * ALIGN(height, align_h);
	}

or

	if (bo_size > 0) {
		igt_assert(bo_size >= size);
		size = bo_size;
	}

Asserts on the beginning guarantees we got size > 0:

	igt_assert(width > 0 && height > 0);
	igt_assert(bpp == 8 || bpp == 16 || bpp == 32 || bpp == 64);

So initialization

	buf->size = size; 

won't be 0 here.

> 
> So this is not a new issue, maybe it's ok, but I just wanted to check with
> you if you think all these scenarios work out ok even after introducing
> separate buf->size and buf->bo_size. Thanks.

Thank you're carefully looking at the code. Please go over it one more time
and verify what I've written. Maybe I just don't see something obvious...

--
Zbigniew
