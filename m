Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01B110E0D7
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 07:42:12 +0000 (UTC)
Date: Fri, 20 Jan 2023 08:42:08 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230120074208.wzkjsaohfsx2wh7n@zkempczy-mobl2>
References: <20230119142929.127976-1-zbigniew.kempczynski@intel.com>
 <fdce235d-9927-1bcd-a4aa-ba1009c4ff57@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdce235d-9927-1bcd-a4aa-ba1009c4ff57@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ccs: Use extended block-copy
 on MTL
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

On Fri, Jan 20, 2023 at 08:35:08AM +0100, Karolina Stolarek wrote:
> On 19.01.2023 15:29, Zbigniew Kempczyński wrote:
> > Integrated platforms and DG1 (exception in discrete, doesn't have
> > flatccs) use shorter version of block-copy blit (12 dwords length,
> > extended command use 22 dwords). MTL is first integrated which uses
> > extended block-copy instruction.
> > 
> > At the moment change enables using block-copy for uncompressed blits
> > on MTL only due to fact aux-ccs support for blitter is still unclear
> > for me. We haven't before code which uses aux-ccs for blitter so
> > enablement of this might occur in future changes.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >   tests/i915/gem_ccs.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> > index ff28c6d889..6ae5ad85b8 100644
> > --- a/tests/i915/gem_ccs.c
> > +++ b/tests/i915/gem_ccs.c
> > @@ -443,6 +443,7 @@ static void block_copy(int i915,
> >   	uint32_t run_id = mid_tiling;
> >   	uint32_t mid_region = region2, bb;
> >   	uint32_t width = param.width, height = param.height;
> > +	uint32_t devid = intel_get_drm_devid(i915);
> >   	enum blt_compression mid_compression = config->compression;
> >   	int mid_compression_format = param.compression_format;
> >   	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> > @@ -451,7 +452,7 @@ static void block_copy(int i915,
> >   	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
> > -	if (!blt_supports_compression(i915))
> > +	if (!blt_supports_compression(i915) && !IS_METEORLAKE(devid))
> 
> This is fine as a temporary change -- I think we'll be able to handle this
> case with blt_tiling_info patches, but for now:

Thanks for the review, I'm planning to add flags to code after your series
will be merged.

--
Zbigniew

> 
> Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
> 
> Thanks,
> Karolina
> 
> >   		pext = NULL;
> >   	src = create_object(i915, region1, width, height, bpp, uc_mocs,
