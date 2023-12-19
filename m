Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21BF10E2E7
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Dec 2023 13:47:51 +0000 (UTC)
Date: Tue, 19 Dec 2023 14:47:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/4] tests/kms_atomic: Add solid fill plane subtest
Message-ID: <20231219134720.noikavmijqhyb5s5@kamilkon-desk.igk.intel.com>
References: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
 <20231215-solid-fill-v1-3-12932f9f452d@quicinc.com>
 <20231218121247.454bc00a.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231218121247.454bc00a.pekka.paalanen@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Pekka,
On 2023-12-18 at 12:12:47 +0200, Pekka Paalanen wrote:
> On Fri, 15 Dec 2023 16:40:23 -0800
> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> 

please subscribe to igt-dev mailinglist, you can do it here:
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Regards,
Kamil

> > Add a basic test for solid fill planes.
> > 
> > This test will first commit a single-color framebuffer plane then
> > a solid fill plane with the same contents. It then validates the solid
> > fill plane by comparing the resulting CRC with the CRC of the reference
> > framebuffer commit.
> > 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  tests/kms_atomic.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 94 insertions(+)
> > 
> > diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> > old mode 100644
> > new mode 100755
> > index 2b6e9a8f0383..8f81e65ad84f
> > --- a/tests/kms_atomic.c
> > +++ b/tests/kms_atomic.c
> > @@ -128,6 +128,13 @@ enum kms_atomic_check_relax {
> >  	PLANE_RELAX_FB = (1 << 1)
> >  };
> >  
> > +struct solid_fill_blob {
> > +	uint32_t r;
> > +	uint32_t g;
> > +	uint32_t b;
> > +	uint32_t pad;
> > +};
> > +
> >  static inline int damage_rect_width(struct drm_mode_rect *r)
> >  {
> >  	return r->x2 - r->x1;
> > @@ -1322,6 +1329,79 @@ static void atomic_plane_damage(data_t *data)
> >  	igt_remove_fb(data->drm_fd, &fb_2);
> >  }
> >  
> > +static void test_solid_fill_plane(data_t *data, igt_output_t *output,  igt_plane_t *plane)
> > +{
> > +	struct drm_mode_create_blob c;
> > +	struct drm_mode_destroy_blob d;
> > +	drmModeModeInfo *mode = igt_output_get_mode(output);
> > +	struct drm_mode_rect rect = { 0 };
> > +	struct igt_fb ref_fb;
> > +	igt_pipe_crc_t *pipe_crc;
> > +	igt_crc_t ref_crc, new_crc;
> > +	enum pipe pipe = data->pipe->pipe;
> > +	int height, width;
> > +	int ret;
> > +
> > +	struct solid_fill_blob blob_data = {
> > +		.r = 0x00000000,
> > +		.g = 0x00000000,
> > +		.b = 0xff000000,
> > +		.pad = 0x0,
> > +	};
> 
> Hi Jessica!
> 
> This is the blob sent to KMS as the solid fill color...
> 
> ...
> 
> > +	igt_create_color_fb(data->drm_fd, width, height,
> > +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> > +			    0.0, 0.0, 1.0, &ref_fb);
> 
> ..and this (0.0, 0.0, 1.0) is the corresponding color in normalized
> values, I presume.
> 
> So you say that 0xff000000 = 1.0.
> 
> However, the patch for the kernel UAPI header says this:
> 
> +/**
> + * struct drm_mode_solid_fill - User info for solid fill planes
> + *
> + * This is the userspace API solid fill information structure.
> + *
> + * Userspace can enable solid fill planes by assigning the plane "solid_fill"
> + * property to a blob containing a single drm_mode_solid_fill struct populated with an RGB323232
> + * color and setting the pixel source to "SOLID_FILL".
> + *
> + * For information on the plane property, see drm_plane_create_solid_fill_property()
> + *
> + * @r: Red color value of single pixel
> + * @g: Green color value of single pixel
> + * @b: Blue color value of single pixel
> + * @pad: padding, must be zero
> + */
> +struct drm_mode_solid_fill {
> +	__u32 r;
> +	__u32 g;
> +	__u32 b;
> +	__u32 pad;
> +};
> 
> I assume that RGB323232 means unsigned 32-bit UNORM (Vulkan term)
> format. That means 1.0 is 0xffffffff, not 0xff000000. This looks like a
> bug in the test.
> 
> It would be good to test more than one color:
> - 0.0, 0.0, 0.0
> - 1.0, 0.0, 0.0
> - 0.0, 1.0, 0.0
> - 0.0, 0.0, 1.0
> - 1.0, 1.0, 1.0
> 
> for example. That would get at least the so often used black explicitly
> tested, and verify each channel gets mapped correctly rather than only
> blue.
> 
> It would also be really good to test dim and mid grays, but I assume it
> might be difficult to get CRC to match over various hardware. You'd
> need to use writeback with an error tolerance. (For watching photos for
> example, the background is not usually black but dim gray I believe.)
> 
> 
> Thanks,
> pq

