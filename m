Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464AA10E872
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Feb 2022 16:41:24 +0000 (UTC)
Date: Tue, 22 Feb 2022 18:41:37 +0200
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20220222164137.GA31344@intel.com>
References: <20220218090936.15857-1-jeevan.b@intel.com>
 <20220218090936.15857-3-jeevan.b@intel.com>
 <YhM8DzfyNHVt4sLg@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YhM8DzfyNHVt4sLg@zkempczy-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t v4 02/16] include/drm-uapi: Introduce
 new Tile 4 format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com,
 petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 08:15:27AM +0100, Zbigniew Kempczyński wrote:
> On Fri, Feb 18, 2022 at 02:39:22PM +0530, Jeevan B wrote:
> > This tiling layout uses 4KB tiles in a row-major layout. It has the same
> > shape as Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x 4). It
> > only differs from Tile Y at the 256B granularity in between. At this
> > granularity, Tile Y has a shape of 16B x 32 rows, but this tiling has a shape
> > of 64B x 8 rows.
> > 
> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >  include/drm-uapi/drm_fourcc.h | 11 +++++++++++
> >  include/drm-uapi/i915_drm.h   |  3 ++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
> > index 91b6a0fd..318b50fa 100644
> > --- a/include/drm-uapi/drm_fourcc.h
> > +++ b/include/drm-uapi/drm_fourcc.h
> > @@ -559,6 +559,17 @@ extern "C" {
> >   */
> >  #define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
> >  
> > +/*
> > + * Intel Tile 4 layout
> > + *
> > + * This is a tiled layout using 4KB tiles in a row-major layout. It has the same
> > + * shape as Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x 4). It
> > + * only differs from Tile Y at the 256B granularity in between. At this
> > + * granularity, Tile Y has a shape of 16B x 32 rows, but this tiling has a shape
> > + * of 64B x 8 rows.
> > + */
> > +#define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
> > +
> >  /*
> >   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
> >   *
> > diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> > index 9c9e1afa..75206fc3 100644
> > --- a/include/drm-uapi/i915_drm.h
> > +++ b/include/drm-uapi/i915_drm.h
> > @@ -1522,13 +1522,14 @@ struct drm_i915_gem_caching {
> >  #define I915_TILING_NONE	0
> >  #define I915_TILING_X		1
> >  #define I915_TILING_Y		2
> > +#define I915_TILING_4		3
> >  /*
> >   * Do not add new tiling types here.  The I915_TILING_* values are for
> >   * de-tiling fence registers that no longer exist on modern platforms.  Although
> >   * the hardware may support new types of tiling in general (e.g., Tile4), we
> >   * do not need to add them to the uapi that is specific to now-defunct ioctls.
> >   */
> 
> Looks comment + change are in a contradiction.
> 
> I think we should rework tiling a bit in IGT to break away from I915_TILING_*.
> Newer gens supports different tilings and it would be good if we would have
> single point of information what is supported on devid we're on. 
> 
> --
> Zbigniew

Yes, Jeevan I think, you just need to place it where those I915_TILING_Yf/I915_TILING_Ys
are located. See your previous igt/lib patch.
Otherwise we are not supposed to use those modifiers here.

Stan

> 
> > -#define I915_TILING_LAST	I915_TILING_Y
> > +#define I915_TILING_LAST	I915_TILING_4
> >  
> >  #define I915_BIT_6_SWIZZLE_NONE		0
> >  #define I915_BIT_6_SWIZZLE_9		1
> > -- 
> > 2.17.1
> > 
