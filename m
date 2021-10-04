Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDA56E14B
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 03:40:43 +0000 (UTC)
Date: Mon, 4 Oct 2021 05:40:38 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211004034038.GA3975@zkempczy-mobl2>
References: <20210928031100.34317-1-ashutosh.dixit@intel.com>
 <20210928065241.GA4608@zkempczy-mobl2>
 <8735pjf9rr.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8735pjf9rr.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Return allocated size in
 gem_create_in_memory_regions() and friends
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
Cc: igt-dev@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Oct 02, 2021 at 01:32:08PM -0700, Dixit, Ashutosh wrote:
> On Mon, 27 Sep 2021 23:52:41 -0700, Zbigniew Kempczyński wrote:
> >
> > > diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> > > index d1395c1605d..52794c1ac10 100644
> > > --- a/lib/intel_bufops.c
> > > +++ b/lib/intel_bufops.c
> > > @@ -819,7 +819,7 @@ static void __intel_buf_init(struct buf_ops *bops,
> > >	if (handle)
> > >		buf->handle = handle;
> > >	else {
> > > -		if (!__gem_create_in_memory_regions(bops->fd, &handle, size, region))
> > > +		if (!__gem_create_in_memory_regions(bops->fd, &handle, &size, region))
> > >			buf->handle = handle;
> > >		else
> > >			buf->handle = gem_create(bops->fd, size);
> >
> > As size can be different we pass we should update buf->size accordingly.
> > Look at few lines above:
> >
> >	/* Store real bo size to avoid mistakes in calculating it again */
> >	buf->size = size;
> >
> > I think these lines can be moved at the bottom of the condition.
> >
> > buf->size is returned as a call to intel_buf_bo_size() and used in
> > intel_bb_add_object(). This can be important for no-reloc mode to avoid
> > overlapping object on softpin and hitting -ENOSPC.
> 
> I have a new patch reverting part of the changes done in 22643ce4014a:
> 
> https://patchwork.freedesktop.org/series/95376/
> 
> In this context I want to check regarding the above change again: should we
> be setting buf->size above to the allocated size or to the requested size,
> in case the two are different? Currently the code (even after the new
> patch) is setting it to the allocated size which might be >= the requested
> size. Thanks.

Keep the requested size, not underlying bo size. I'm going to do quick 
rename from intel_buf_bo_size() to intel_buf_size() to avoid confusion we
got gem bo size instead of raw sze.

--
Zbigniew 
