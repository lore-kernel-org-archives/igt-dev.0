Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B41A10E041
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Aug 2023 08:21:20 +0000 (UTC)
Date: Fri, 4 Aug 2023 10:21:10 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Message-ID: <20230804082110.46xxmvq2i42lblyu@zkempczy-mobl2>
References: <20230803074902.172493-1-zbigniew.kempczynski@intel.com>
 <20230803074902.172493-2-zbigniew.kempczynski@intel.com>
 <7f16bc86-d81d-5065-3a23-afdc5e49b214@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f16bc86-d81d-5065-3a23-afdc5e49b214@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/media_fill: Use RENDER engine
 flag to work on Xe
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

On Thu, Aug 03, 2023 at 11:11:19PM +0200, Manszewski, Christoph wrote:
> Hi Zbigniew,
> 
> On 3.08.2023 09:49, Zbigniew Kempczyński wrote:
> > Due to explicit requirement of running on valid hw engine on xe
> > change I915_EXEC_DEFAULT to I915_EXEC_RENDER. This change doesn't
> > break i915 media pipeline allowing to create and assign valid xe
> > engine to execute media fill test.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> > ---
> >   lib/media_fill.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/media_fill.c b/lib/media_fill.c
> > index e80dae1505..2520995d97 100644
> > --- a/lib/media_fill.c
> > +++ b/lib/media_fill.c
> > @@ -281,7 +281,7 @@ __gen9_media_fillfunc(int i915,
> >   	intel_bb_ptr_align(ibb, 32);
> >   	intel_bb_exec(ibb, intel_bb_offset(ibb),
> > -		      I915_EXEC_DEFAULT | I915_EXEC_NO_RELOC, true);
> > +		      I915_EXEC_RENDER | I915_EXEC_NO_RELOC, true);
> 
> As discussed offline - since we are the ones doing the i915 to xe engine
> type conversion, we could as well translate 'I915_EXEC_DEFAULT' to
> 'DRM_XE_ENGINE_CLASS_RENDER'. But I think it's a minor thing, besides I
> already reviewed a similar change in gpgpu_fill so:
> 
> Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> Christoph

Thank you for the review. If I'm not wrong blitter didn't have dedicated
ring for gen < 6 (see HAS_BLT_RING() macro in igt code for reference).

--
Zbigniew

> 
> 
> >   	intel_bb_destroy(ibb);
> >   }
