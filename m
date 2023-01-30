Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F083610E09A
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jan 2023 19:30:06 +0000 (UTC)
Date: Mon, 30 Jan 2023 20:30:03 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230130193003.e2gyeufe7e3hjznd@zkempczy-mobl2>
References: <cover.1674469729.git.karolina.stolarek@intel.com>
 <9583a3ed0f8e373e447553726f41313a49e91279.1674469729.git.karolina.stolarek@intel.com>
 <20230126120049.cwrq4fym3fovgexu@zkempczy-mobl2>
 <60dfaf80-8a48-d887-8586-40f8250e3def@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60dfaf80-8a48-d887-8586-40f8250e3def@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915_blt: Remove create_mapping
 flag from blt_create_object
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 30, 2023 at 09:10:10AM +0100, Karolina Stolarek wrote:
> Hi Zbigniew,
> 
> Sorry for my late response, the email got stuck in my inbox.
> 
> On 26.01.2023 13:00, Zbigniew Kempczyński wrote:
> > On Mon, Jan 23, 2023 at 11:52:42AM +0100, Karolina Stolarek wrote:
> > > In the tests we have, we always set create_mapping flag to true, as we
> > > wish to create memory mappings when creating blitter copy objects. As
> > > this is the only use case, we can delete the flag and just create a
> > > mapping.
> > > 
> > > Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
> > > Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> > > ---
> > >   lib/i915/i915_blt.c           |  8 +++-----
> > >   lib/i915/i915_blt.h           |  3 +--
> > >   tests/i915/gem_ccs.c          | 14 +++++++-------
> > >   tests/i915/gem_exercise_blt.c | 12 ++++++------
> > >   4 files changed, 17 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
> > > index bbfb6ffc..3e64efeb 100644
> > > --- a/lib/i915/i915_blt.c
> > > +++ b/lib/i915/i915_blt.c
> > > @@ -1219,8 +1219,7 @@ blt_create_object(int i915, uint32_t region,
> > >   		  uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
> > >   		  enum blt_tiling_type tiling,
> > >   		  enum blt_compression compression,
> > > -		  enum blt_compression_type compression_type,
> > > -		  bool create_mapping)
> > > +		  enum blt_compression_type compression_type)
> > 
> > In this case I would like to keep create_mapping flag. gem_ccs and
> > gem_exercise_blt use this mapping but if you someone would like
> > to reuse blt_create_object() without creation additional mapping
> > lack of this argument enforces creating object in the test.
> 
> Hm, but in the majority of cases we'd like to create a new object. From the
> API point of view, we could introduce another function to do it. The list of
> parameters is already quite long here.

With this number one more doesn't extend it too much. But this additional
argument allows user to avoid create mapping during object creation.
I wouldn't assume client of blitter lib will always require mapping.

--
Zbigniew

> 
> Thanks,
> Karolina
> 
> > 
> > --
> > Zbigniew
> > 
> > >   {
> > >   	struct blt_copy_object *obj;
> > >   	uint64_t size = width * height * bpp / 8;
> > > @@ -1237,9 +1236,8 @@ blt_create_object(int i915, uint32_t region,
> > >   		       compression, compression_type);
> > >   	blt_set_geom(obj, stride, 0, 0, width, height, 0, 0);
> > > -	if (create_mapping)
> > > -		obj->ptr = gem_mmap__device_coherent(i915, handle, 0, size,
> > > -						     PROT_READ | PROT_WRITE);
> > > +	obj->ptr = gem_mmap__device_coherent(i915, handle, 0, size,
> > > +					     PROT_READ | PROT_WRITE);
> > >   	return obj;
> > >   }
> > > diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
> > > index 299dff8e..eaf4cc1f 100644
> > > --- a/lib/i915/i915_blt.h
> > > +++ b/lib/i915/i915_blt.h
> > > @@ -218,8 +218,7 @@ blt_create_object(int i915, uint32_t region,
> > >   		  uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
> > >   		  enum blt_tiling_type tiling,
> > >   		  enum blt_compression compression,
> > > -		  enum blt_compression_type compression_type,
> > > -		  bool create_mapping);
> > > +		  enum blt_compression_type compression_type);
> > >   void blt_destroy_object(int i915, struct blt_copy_object *obj);
> > >   void blt_set_object(struct blt_copy_object *obj,
> > >   		    uint32_t handle, uint64_t size, uint32_t region,
> > > diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> > > index f629f664..b7a32673 100644
> > > --- a/tests/i915/gem_ccs.c
> > > +++ b/tests/i915/gem_ccs.c
> > > @@ -361,11 +361,11 @@ static void block_copy(int i915,
> > >   		pext = NULL;
> > >   	src = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> > > -				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
> > > +				T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > >   	mid = blt_create_object(i915, mid_region, width, height, bpp, uc_mocs,
> > > -				mid_tiling, mid_compression, comp_type, true);
> > > +				mid_tiling, mid_compression, comp_type);
> > >   	dst = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> > > -				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
> > > +				T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > >   	igt_assert(src->size == dst->size);
> > >   	PRINT_SURFACE_INFO("src", src);
> > >   	PRINT_SURFACE_INFO("mid", mid);
> > > @@ -477,13 +477,13 @@ static void block_multicopy(int i915,
> > >   		pext3 = NULL;
> > >   	src = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> > > -				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
> > > +				T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > >   	mid = blt_create_object(i915, mid_region, width, height, bpp, uc_mocs,
> > > -				mid_tiling, mid_compression, comp_type, true);
> > > +				mid_tiling, mid_compression, comp_type);
> > >   	dst = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> > > -				mid_tiling, COMPRESSION_DISABLED, comp_type, true);
> > > +				mid_tiling, COMPRESSION_DISABLED, comp_type);
> > >   	final = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> > > -				  T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
> > > +				  T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > >   	igt_assert(src->size == dst->size);
> > >   	PRINT_SURFACE_INFO("src", src);
> > >   	PRINT_SURFACE_INFO("mid", mid);
> > > diff --git a/tests/i915/gem_exercise_blt.c b/tests/i915/gem_exercise_blt.c
> > > index 02c54f85..b1123356 100644
> > > --- a/tests/i915/gem_exercise_blt.c
> > > +++ b/tests/i915/gem_exercise_blt.c
> > > @@ -136,11 +136,11 @@ static void fast_copy_emit(int i915, const intel_ctx_t *ctx,
> > >   	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
> > >   	src = blt_create_object(i915, region1, width, height, bpp, 0,
> > > -				T_LINEAR, COMPRESSION_DISABLED, 0, true);
> > > +				T_LINEAR, COMPRESSION_DISABLED, 0);
> > >   	mid = blt_create_object(i915, region2, width, height, bpp, 0,
> > > -				mid_tiling, COMPRESSION_DISABLED, 0, true);
> > > +				mid_tiling, COMPRESSION_DISABLED, 0);
> > >   	dst = blt_create_object(i915, region1, width, height, bpp, 0,
> > > -				T_LINEAR, COMPRESSION_DISABLED, 0, true);
> > > +				T_LINEAR, COMPRESSION_DISABLED, 0);
> > >   	igt_assert(src->size == dst->size);
> > >   	PRINT_SURFACE_INFO("src", src);
> > > @@ -196,11 +196,11 @@ static void fast_copy(int i915, const intel_ctx_t *ctx,
> > >   	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
> > >   	src = blt_create_object(i915, region1, width, height, bpp, 0,
> > > -				T_LINEAR, COMPRESSION_DISABLED, 0, true);
> > > +				T_LINEAR, COMPRESSION_DISABLED, 0);
> > >   	mid = blt_create_object(i915, region2, width, height, bpp, 0,
> > > -				mid_tiling, COMPRESSION_DISABLED, 0, true);
> > > +				mid_tiling, COMPRESSION_DISABLED, 0);
> > >   	dst = blt_create_object(i915, region1, width, height, bpp, 0,
> > > -				T_LINEAR, COMPRESSION_DISABLED, 0, true);
> > > +				T_LINEAR, COMPRESSION_DISABLED, 0);
> > >   	igt_assert(src->size == dst->size);
> > >   	blt_surface_fill_rect(i915, src, width, height);
> > > -- 
> > > 2.25.1
> > > 
