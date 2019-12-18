Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926066E823
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 18:16:37 +0000 (UTC)
Date: Wed, 18 Dec 2019 20:16:33 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20191218181633.GU1208@intel.com>
References: <20191218055925.705070-1-vanshidhar.r.konda@intel.com>
 <20191218055925.705070-3-vanshidhar.r.konda@intel.com>
 <20191218151328.GK1208@intel.com>
 <20191218173930.metkztwd7c6l267z@vrkonda-desk.ra.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218173930.metkztwd7c6l267z@vrkonda-desk.ra.intel.com>
Subject: Re: [igt-dev] [PATCH 02/10] lib/intel_batchbuffer: Add blitter copy
 using XY_SRC_COPY_BLT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Cc: igt-dev@lists.freedesktop.org, brian.welty@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 18, 2019 at 09:39:30AM -0800, Vanshidhar Konda wrote:
> On Wed, Dec 18, 2019 at 05:13:28PM +0200, Ville Syrj=E4l=E4 wrote:
> >On Tue, Dec 17, 2019 at 09:59:17PM -0800, Vanshidhar Konda wrote:
> >> Add a method that uses the XY_SRC_COPY_BLT instruction for copying
> >> buffers using the blitter engine.
> >>
> >> Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
> >> ---
> >>  lib/intel_batchbuffer.c | 183 ++++++++++++++++++++++++++++++++++++++++
> >>  lib/intel_batchbuffer.h |  21 +++++
> >>  2 files changed, 204 insertions(+)
> >>
> >> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> >> index 51aae4dc..1352aa95 100644
> >> --- a/lib/intel_batchbuffer.c
> >> +++ b/lib/intel_batchbuffer.c
> >> @@ -46,6 +46,12 @@
> >>
> >>  #include <i915_drm.h>
> >>
> >> +#define MI_FLUSH_DW (0x26 << 23)
> >> +
> >> +#define BCS_SWCTRL 0x22200
> >> +#define BCS_SRC_Y (1 << 0)
> >> +#define BCS_DST_Y (1 << 1)
> >> +
> >>  /**
> >>   * SECTION:intel_batchbuffer
> >>   * @short_description: Batchbuffer and blitter support
> >> @@ -661,6 +667,183 @@ static void exec_blit(int fd,
> >>  	gem_execbuf(fd, &exec);
> >>  }
> >>
> >> +static uint32_t src_copy_dword0(uint32_t src_tiling, uint32_t dst_til=
ing,
> >> +				uint32_t bpp, uint32_t device_gen)
> >> +{
> >> +	uint32_t dword0 =3D 0;
> >> +
> >> +	dword0 |=3D XY_SRC_COPY_BLT_CMD;
> >> +	if (bpp =3D=3D 32)
> >> +		dword0 |=3D XY_SRC_COPY_BLT_WRITE_RGB |
> >> +			XY_SRC_COPY_BLT_WRITE_ALPHA;
> >> +
> >> +	if (device_gen >=3D 4 && src_tiling)
> >> +		dword0 |=3D XY_SRC_COPY_BLT_SRC_TILED;
> >> +	if (device_gen >=3D 4 && dst_tiling)
> >> +		dword0 |=3D XY_SRC_COPY_BLT_DST_TILED;
> >> +
> >> +	return dword0;
> >> +}
> >> +
> >> +static uint32_t src_copy_dword1(uint32_t dst_pitch, uint32_t bpp)
> >> +{
> >> +	uint32_t dword1 =3D 0;
> >> +
> >> +	switch (bpp) {
> >> +	case 8:
> >> +		break;
> >> +	case 16:
> >> +		dword1 |=3D (1 << 24); /* Only support 565 color */
> >> +		break;
> >> +	case 32:
> >> +		dword1 |=3D (3 << 24);
> >> +		break;
> >> +	default:
> >> +		igt_assert(0);
> >> +	}
> >> +
> >> +	dword1 |=3D 0xcc << 16;
> >> +	dword1 |=3D dst_pitch;
> >> +
> >> +	return dword1;
> >> +}
> >> +/**
> >> + * igt_blitter_src_copy__raw:
> >> + * @fd: file descriptor of the i915 driver
> >> + * @src_handle: GEM handle of the source buffer
> >> + * @src_delta: offset into the source GEM bo, in bytes
> >> + * @src_stride: Stride (in bytes) of the source buffer
> >> + * @src_tiling: Tiling mode of the source buffer
> >> + * @src_x: X coordinate of the source region to copy
> >> + * @src_y: Y coordinate of the source region to copy
> >> + * @width: Width of the region to copy
> >> + * @height: Height of the region to copy
> >> + * @bpp: source and destination bits per pixel
> >> + * @dst_handle: GEM handle of the destination buffer
> >> + * @dst_delta: offset into the destination GEM bo, in bytes
> >> + * @dst_stride: Stride (in bytes) of the destination buffer
> >> + * @dst_tiling: Tiling mode of the destination buffer
> >> + * @dst_x: X coordinate of destination
> >> + * @dst_y: Y coordinate of destination
> >> + *
> >> + */
> >> +void igt_blitter_src_copy__raw(int fd,
> >> +				/* src */
> >> +				uint32_t src_handle,
> >> +				unsigned int src_delta,
> >> +				unsigned int src_stride,
> >> +				unsigned int src_tiling,
> >> +				unsigned int src_x, unsigned src_y,
> >
> >Inconsistent unsigned int vs. unsigned
> =

> I'll fix this in the next version.
> =

> >
> >> +
> >> +				/* size */
> >> +				unsigned int width, unsigned int height,
> >> +
> >> +				/* bpp */
> >> +				int bpp,
> >> +
> >> +				/* dst */
> >> +				uint32_t dst_handle,
> >> +				unsigned dst_delta,
> >> +				unsigned int dst_stride,
> >> +				unsigned int dst_tiling,
> >> +				unsigned int dst_x, unsigned dst_y)
> >> +{
> >> +	uint32_t batch[32];
> >> +	struct drm_i915_gem_exec_object2 objs[3];
> >> +	struct drm_i915_gem_relocation_entry relocs[2];
> >> +	uint32_t batch_handle;
> >> +	uint32_t src_pitch, dst_pitch;
> >> +	uint32_t dst_reloc_offset, src_reloc_offset;
> >> +	int i =3D 0;
> >> +	uint32_t gen =3D intel_gen(intel_get_drm_devid(fd));
> >> +	const bool has_64b_reloc =3D gen >=3D 8;
> >> +
> >> +	memset(batch, 0, sizeof(batch));
> >> +
> >> +	igt_assert((src_tiling =3D=3D I915_TILING_NONE) ||
> >> +		   (src_tiling =3D=3D I915_TILING_X) ||
> >> +		   (src_tiling =3D=3D I915_TILING_Y));
> >> +	igt_assert((dst_tiling =3D=3D I915_TILING_NONE) ||
> >> +		   (dst_tiling =3D=3D I915_TILING_X) ||
> >> +		   (dst_tiling =3D=3D I915_TILING_Y));
> >> +
> >> +	src_pitch =3D fast_copy_pitch(src_stride, src_tiling);
> >> +	dst_pitch =3D fast_copy_pitch(dst_stride, dst_tiling);
> >
> >I believe those do the wrong thing for pre-gen4 tiling.
> =

> The implementation that I've added is based on the latest one in
> gem_blits.c. The logic I added is consistent with all the
> implementations in IGT that are setting tiling for XY_SRC_COPY_BLT.
> Not being aware of the history of the hardware I wanted to keep it
> inline with what I found.

See commit 9df50aef49e0 ("lib/igt_draw: Fix blt tiled stride for
gen2/3")

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
