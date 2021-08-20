Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C2C6EA00
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Aug 2021 06:27:42 +0000 (UTC)
Date: Fri, 20 Aug 2021 08:27:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210820062737.GB3286@zkempczy-mobl2>
References: <20210819044941.7699-1-zbigniew.kempczynski@intel.com>
 <20210819044941.7699-2-zbigniew.kempczynski@intel.com>
 <87v941b0f6.wl-ashutosh.dixit@intel.com>
 <20210820044614.GA3286@zkempczy-mobl2>
 <87czq87k3n.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87czq87k3n.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/gem_ctx_shared: Adopt to use
 allocator
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

On Thu, Aug 19, 2021 at 10:37:00PM -0700, Dixit, Ashutosh wrote:
> On Thu, 19 Aug 2021 21:46:14 -0700, Zbigniew Kempczyński wrote:
> >
> > On Thu, Aug 19, 2021 at 02:16:13PM -0700, Dixit, Ashutosh wrote:
> > > On Wed, 18 Aug 2021 21:49:39 -0700, Zbigniew Kempczyński wrote:
> > > >
> > > > @@ -518,12 +533,24 @@ static void store_dword(int i915, const intel_ctx_t *ctx, unsigned ring,
> > > >
> > > >	memset(obj, 0, sizeof(obj));
> > > >	obj[0].handle = cork;
> > > > -	obj[0].offset = cork << 20;
> > > >	obj[1].handle = target;
> > > > -	obj[1].offset = target << 20;
> > > >	obj[2].handle = gem_create(i915, 4096);
> > > > -	obj[2].offset = 256 << 10;
> > > > -	obj[2].offset += (random() % 128) << 12;
> > > > +	if (ahnd) {
> > > > +		obj[0].offset = cork_offset;
> > > > +		obj[0].flags |= EXEC_OBJECT_PINNED;
> > > > +		obj[1].offset = target_offset;
> > > > +		obj[1].flags |= EXEC_OBJECT_PINNED;
> > > > +		if (write_domain)
> > > > +			obj[1].flags |= EXEC_OBJECT_WRITE;
> > > > +		obj[2].offset = get_offset(ahnd, obj[2].handle, 4096, 0x0);
> > > > +		obj[2].flags |= EXEC_OBJECT_PINNED;
> > > > +		execbuf.flags |= I915_EXEC_NO_RELOC;
> > >
> > > I915_EXEC_NO_RELOC needed (since I think we weren't doing this earlier)?
> >
> > That's minor optimization for softpinning. We got relocation_count == 0 for
> > each gem object, so eb->relocs is empty list. We also don't expect offset
> > change on execbuf return.
> 
> I thought I915_EXEC_NO_RELOC is only needed if we are using relocations, if
> we are softpinning it's not needed?
> 

For softpinning using that flag just ensures you will skip some code
which does nothing (but for example is iterating over buffer list).

Take a look to execbuffer beginning:

	if (DBG_FORCE_RELOC || !(args->flags & I915_EXEC_NO_RELOC))
		args->flags |= __EXEC_HAS_RELOC;

then see two contitionals:
	if (eb->args->flags & __EXEC_HAS_RELOC) {
		...
	}

That code is not executed when NO_RELOC is set giving some small
performance improvement (otherwise it is iterating over buffers to update
offsets if necessary).

--
Zbigniew
