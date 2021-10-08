Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B746E09A
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 05:38:54 +0000 (UTC)
Date: Fri, 8 Oct 2021 07:38:49 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211008053849.GA5726@zkempczy-mobl2>
References: <20210928031100.34317-1-ashutosh.dixit@intel.com>
 <20210928065241.GA4608@zkempczy-mobl2>
 <8735pjf9rr.wl-ashutosh.dixit@intel.com>
 <7167a2c4-e9fa-61a4-7ae4-5410931d005d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7167a2c4-e9fa-61a4-7ae4-5410931d005d@intel.com>
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
To: John Harrison <john.c.harrison@intel.com>
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org, Andrzej Turko <andrzej.turko@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 07, 2021 at 12:26:16PM -0700, John Harrison wrote:
> On 10/2/2021 13:32, Dixit, Ashutosh wrote:
> > On Mon, 27 Sep 2021 23:52:41 -0700, Zbigniew Kempczyński wrote:
> > > > diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> > > > index d1395c1605d..52794c1ac10 100644
> > > > --- a/lib/intel_bufops.c
> > > > +++ b/lib/intel_bufops.c
> > > > @@ -819,7 +819,7 @@ static void __intel_buf_init(struct buf_ops *bops,
> > > > 	if (handle)
> > > > 		buf->handle = handle;
> > > > 	else {
> > > > -		if (!__gem_create_in_memory_regions(bops->fd, &handle, size, region))
> > > > +		if (!__gem_create_in_memory_regions(bops->fd, &handle, &size, region))
> > > > 			buf->handle = handle;
> > > > 		else
> > > > 			buf->handle = gem_create(bops->fd, size);
> > > As size can be different we pass we should update buf->size accordingly.
> > > Look at few lines above:
> > > 
> > > 	/* Store real bo size to avoid mistakes in calculating it again */
> > > 	buf->size = size;
> > > 
> > > I think these lines can be moved at the bottom of the condition.
> > > 
> > > buf->size is returned as a call to intel_buf_bo_size() and used in
> > > intel_bb_add_object(). This can be important for no-reloc mode to avoid
> > > overlapping object on softpin and hitting -ENOSPC.
> > I have a new patch reverting part of the changes done in 22643ce4014a:
> > 
> > https://patchwork.freedesktop.org/series/95376/
> > 
> > In this context I want to check regarding the above change again: should we
> > be setting buf->size above to the allocated size or to the requested size,
> > in case the two are different? Currently the code (even after the new
> > patch) is setting it to the allocated size which might be >= the requested
> > size. Thanks.
> There are valid reasons why the actual allocated size is required by some
> tests. For example, verifying that an error capture has captured a buffer
> object correctly (and not saved too little/much data). If there are also
> valid reasons why a test might fail if given the actual size rather than the
> requested size then maybe we need another mechanism. Either return both or
> provide support for querying one or both later on.

I've diverged requested size and bo size to fulfill your needs:

https://patchwork.freedesktop.org/series/95388/

Calculated buffer size reside in buf->size and is returned by intel_buf_size(),
similar buf->bo_size is returned from intel_buf_bo_size().

One disclaimer - intel_buf is not able to validate bo size if it is passed
from the caller (intel_buf_create_with_handle() family).
When it is used in "create" path what means it creates gem bo it catches
bo size returned from the kernel.

--
Zbigniew

> 
> John.
> 
