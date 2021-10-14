Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBAA6EC1F
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 07:25:34 +0000 (UTC)
Date: Thu, 14 Oct 2021 09:25:29 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211014072529.GB3617@zkempczy-mobl2>
References: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
 <20211008065432.15482-3-zbigniew.kempczynski@intel.com>
 <87a6jcib6l.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a6jcib6l.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/7] lib/intel_batchbuffer: Detect and
 use kernel alignment capability
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

On Wed, Oct 13, 2021 at 07:37:22PM -0700, Dixit, Ashutosh wrote:
> On Thu, 07 Oct 2021 23:54:27 -0700, Zbigniew Kempczyński wrote:
> >
> > diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> > index 9c26fe207..ed7c25015 100644
> > --- a/lib/intel_batchbuffer.c
> > +++ b/lib/intel_batchbuffer.c
> > @@ -1335,6 +1335,7 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
> >
> >	igt_assert(ibb);
> >
> > +	ibb->allows_passing_alignment = gem_allows_passing_alignment(i915);
> >	ibb->uses_full_ppgtt = gem_uses_full_ppgtt(i915);
> >	ibb->devid = intel_get_drm_devid(i915);
> >	ibb->gen = intel_gen(ibb->devid);
> > @@ -1783,6 +1784,7 @@ __add_to_cache(struct intel_bb *ibb, uint32_t handle)
> >	igt_assert(object);
> >
> >	object->handle = handle;
> > +	object->alignment = 0;
> >	found = tsearch((void *) object, &ibb->root, __compare_objects);
> >
> >	if (*found == object) {
> > @@ -1905,7 +1907,7 @@ intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
> >		   || ALIGN(offset, alignment) == offset);
> >
> >	object = __add_to_cache(ibb, handle);
> > -	object->alignment = alignment ?: 4096;
> > +	alignment = alignment ?: 4096;
> 
> Can't we do:
> 	if (ibb->allows_passing_alignment)
> 		object->alignment = alignment ?: 4096;
> So we don't need further changes in this function? Or it breaks something?

I think it will work at this place, object->alignment is touched twice:
1. first on __add_to_cache() and set to 0
2. second on finalizing object settings after acquiring offset

I added this on the bottom where object->... are filling with established
values. I just wanted to have all those settings in one place, not
object->alignment on the top and all the rest on the bottom. But there's
cosmetic and personal preference.

--
Zbigniew

> 
> >	__add_to_objects(ibb, object);
> >
> >	/*
> > @@ -1917,7 +1919,7 @@ intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
> >	if (INVALID_ADDR(object->offset)) {
> >		if (INVALID_ADDR(offset)) {
> >			offset = __intel_bb_get_offset(ibb, handle, size,
> > -						       object->alignment);
> > +						       alignment);
> >		} else {
> >			offset = offset & (ibb->gtt_size - 1);
> >
> > @@ -1962,6 +1964,9 @@ intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
> >	if (ibb->uses_full_ppgtt && !ibb->enforce_relocs)
> >		object->flags |= EXEC_OBJECT_PINNED;
> >
> > +	if (ibb->allows_passing_alignment)
> > +		object->alignment = alignment;
> > +
> >	return object;
> >  }
