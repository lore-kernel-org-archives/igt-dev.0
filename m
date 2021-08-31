Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF056E069
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Aug 2021 19:15:01 +0000 (UTC)
Date: Tue, 31 Aug 2021 22:08:43 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20210831190843.GH3458504@ideak-desk.fi.intel.com>
References: <20210827145756.3342904-1-imre.deak@intel.com>
 <20210827145756.3342904-7-imre.deak@intel.com>
 <06800e54-a3cf-8209-3c51-a193fe88d7cd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06800e54-a3cf-8209-3c51-a193fe88d7cd@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] for-ci: Check for ccs remap support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 31, 2021 at 08:52:21PM +0300, Juha-Pekka Heikkila wrote:
> I wonder if this was unnecessary?

It wasn't strictly necessary. I thought to test the AUX pagetable
programming w/o the kernel support for remapping as well (also on
the shards run).

> I think those ccs tests will only run on shards and there's no adlp in
> shards yet?

Ok, though the TGL results are still interesting to me (the AUX pagetable
programming changed for that too).

> /Juha-Pekka
> 
> On 27.8.2021 17.57, Imre Deak wrote:
> > Remove the power-of-two stride size restriction only if there is a
> > kernel support for this.
> > 
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >   lib/igt_fb.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++----
> >   1 file changed, 60 insertions(+), 5 deletions(-)
> > 
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index 72291f4f7..e729703d9 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -715,6 +715,55 @@ void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
> >   	}
> >   }
> > +static bool adlp_ccs_remap_supported(int drm_fd)
> > +{
> > +	uint64_t modifier = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
> > +	uint64_t size;
> > +	uint32_t width = 48 * 32;	/* Min stride with remapping to 48->64 tiles */
> > +	uint32_t height = 32 * 32;	/* 4 tile aligned height */
> > +	uint32_t format = DRM_FORMAT_XRGB8888;
> > +	uint32_t strides[4] = {};
> > +	uint32_t offsets[4] = {};
> > +	uint32_t bo;
> > +	uint32_t fb_id;
> > +	static int supported = -1;
> > +
> > +	if (supported != -1)
> > +		return supported;
> > +
> > +	strides[0] = width * 4;
> > +	strides[1] = roundup_power_of_two(strides[0] / 512) * 64;
> > +
> > +	offsets[0] = 0;
> > +	/* Ensure CCS plane 1 is misaligned. */
> > +	offsets[1] = ALIGN(offsets[0] + strides[0] * height, 2 * 1024 * 1024) + 4096;
> > +
> > +	size = offsets[1] + strides[1] * height / 32;
> > +
> > +	bo = gem_buffer_create_fb_obj(drm_fd, size);
> > +	igt_assert(bo);
> > +
> > +	if (__kms_addfb(drm_fd, bo,
> > +			width, height,
> > +			format, modifier,
> > +			strides, offsets,
> > +			2,
> > +			DRM_MODE_FB_MODIFIERS, &fb_id) != 0) {
> > +		supported = 0;
> > +		igt_debug("CCS framebuffer remapping not supported.\n");
> > +
> > +		return false;
> > +	}
> > +
> > +	igt_ioctl(drm_fd, DRM_IOCTL_MODE_RMFB, &fb_id);
> > +	gem_close(drm_fd, bo);
> > +
> > +	supported = 1;
> > +	igt_debug("CCS framebuffer remapping supported\n");
> > +
> > +	return true;
> > +}
> > +
> >   static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
> >   {
> >   	uint32_t min_stride = fb->plane_width[plane] *
> > @@ -786,7 +835,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
> >   				     &tile_width, &tile_height);
> >   		if (is_gen12_ccs_modifier(fb->modifier)) {
> > -			if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)))
> > +			if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd))) {
> >   				/*
> >   				 * The main surface stride must be aligned to the CCS AUX
> >   				 * page table block size (covered by one AUX PTE). This
> > @@ -796,8 +845,13 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
> >   				 * tile rows.
> >   				 */
> >   				tile_align = (min_stride <= 8 * tile_width) ? 8 : 16;
> > -			else
> > +				if (!adlp_ccs_remap_supported(fb->fd)) {
> > +					tile_align = roundup_power_of_two(min_stride) / 128;
> > +					tile_align = max(tile_align, 8);
> > +				}
> > +			} else {
> >   				tile_align = 4;
> > +			}
> >   		}
> >   		return ALIGN(min_stride, tile_width * tile_align);
> > @@ -848,7 +902,8 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
> >   		 * On ADL_P CCS color planes must be 2MB aligned, until remapping
> >   		 * support is added for CCS FBs.
> >   		 */
> > -		if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)))
> > +		if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)) &&
> > +		    !adlp_ccs_remap_supported(fb->fd))
> >   			size = ALIGN(size, 2 * 1024 * 1024);
> >   		return size;
> > @@ -870,9 +925,9 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
> >   		 * On ADL_P CCS color planes must be 2MB aligned, until remapping
> >   		 * support is added for CCS FBs.
> >   		 */
> > -		if (is_i915_device(fb->fd) &&
> > +		if (is_ccs_modifier(fb->modifier) &&
> >   		    IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)) &&
> > -		    is_ccs_modifier(fb->modifier))
> > +		    !adlp_ccs_remap_supported(fb->fd))
> >   			size = ALIGN(size, 2 * 1024 * 1024);
> >   		return size;
> > 
> 
