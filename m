Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EFD10E1BD
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 12:20:50 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 27 Apr 2023 12:20:46 +0000
Message-ID: <DM4PR11MB63123531706DF0180DE654C6906A9@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
 <20230426114725.2244653-17-bhanuprakash.modem@intel.com>
In-Reply-To: <20230426114725.2244653-17-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V3 16/45] lib/igt_fb: Add copy engine support
 for XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Wednesday, April 26, 2023 5:17 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [i-g-t V3 16/45] lib/igt_fb: Add copy engine support f=
or XE
>=20
> Add copy engine support for kms framebuffer mappings.
>
LGTM
=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/igt_fb.c | 30 ++++++++++++++++++++++++++----  lib/igt_fb.h |  2 ++
>  2 files changed, 28 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c index 76f2e1245..c9b86fcb0 10064=
4
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -45,6 +45,7 @@
>  #include "igt_amd.h"
>  #include "igt_x86.h"
>  #include "igt_nouveau.h"
> +#include "igt_syncobj.h"
>  #include "ioctl_wrappers.h"
>  #include "intel_batchbuffer.h"
>  #include "intel_chipset.h"
> @@ -2489,12 +2490,13 @@ static bool blitter_ok(const struct igt_fb *fb)
>=20
>  static bool use_enginecopy(const struct igt_fb *fb)  {
> -	if (blitter_ok(fb))
> +	if (!is_xe_device(fb->fd) && blitter_ok(fb))
>  		return false;
>=20
>  	return fb->modifier =3D=3D I915_FORMAT_MOD_Yf_TILED ||
>  	       is_ccs_modifier(fb->modifier) ||
> -	       !gem_has_mappable_ggtt(fb->fd);
> +	       (is_xe_device(fb->fd) && fb->modifier =3D=3D
> DRM_FORMAT_MOD_LINEAR) ||
> +	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
>  }
>=20
>  static bool use_blitter(const struct igt_fb *fb) @@ -2504,7 +2506,7 @@ s=
tatic
> bool use_blitter(const struct igt_fb *fb)
>=20
>  	return fb->modifier =3D=3D I915_FORMAT_MOD_Y_TILED ||
>  	       fb->modifier =3D=3D I915_FORMAT_MOD_Yf_TILED ||
> -	       !gem_has_mappable_ggtt(fb->fd);
> +	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
>  }
>=20
>  static void init_buf_ccs(struct intel_buf *buf, int ccs_idx, @@ -2706,7 =
+2708,7
> @@ static void blitcopy(const struct igt_fb *dst_fb,
>  	src_tiling =3D igt_fb_mod_to_tiling(src_fb->modifier);
>  	dst_tiling =3D igt_fb_mod_to_tiling(dst_fb->modifier);
>=20
> -	if (!gem_has_relocations(dst_fb->fd)) {
> +	if (is_i915_device(dst_fb->fd) && !gem_has_relocations(dst_fb->fd)) {
>  		igt_require(gem_has_contexts(dst_fb->fd));
>  		ctx =3D gem_context_create(dst_fb->fd);
>  		ahnd =3D get_reloc_ahnd(dst_fb->fd, ctx); @@ -2786,6 +2788,12
> @@ static void free_linear_mapping(struct fb_blit_upload *blit)
>  	} else if (is_nouveau_device(fd)) {
>  		igt_nouveau_fb_blit(fb, &linear->fb);
>  		igt_nouveau_delete_bo(&linear->fb);
> +	} else if (is_xe_device(fd)) {
> +		gem_munmap(linear->map, linear->fb.size);
> +		copy_with_engine(blit, fb, &linear->fb);
> +
> +		syncobj_wait(fd, &blit->ibb->engine_syncobj, 1, INT64_MAX, 0,
> NULL);
> +		gem_close(fd, linear->fb.gem_handle);
>  	} else {
>  		gem_munmap(linear->map, linear->fb.size);
>  		gem_set_domain(fd, linear->fb.gem_handle, @@ -2863,6
> +2871,11 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
>  		igt_nouveau_fb_blit(&linear->fb, fb);
>=20
>  		linear->map =3D igt_nouveau_mmap_bo(&linear->fb, PROT_READ
> | PROT_WRITE);
> +	} else if (is_xe_device(fd)) {
> +		copy_with_engine(blit, &linear->fb, fb);
> +
> +		linear->map =3D xe_bo_mmap_ext(fd, linear->fb.gem_handle,
> +					     linear->fb.size, PROT_READ |
> PROT_WRITE);
>  	} else {
>  		/* Copy fb content to linear BO */
>  		gem_set_domain(fd, linear->fb.gem_handle, @@ -2920,6
> +2933,9 @@ static void create_cairo_surface__gpu(int fd, struct igt_fb *f=
b)
>   */
>  int igt_dirty_fb(int fd, struct igt_fb *fb)  {
> +	if (fb->syncobj)
> +		syncobj_wait(fd, &fb->syncobj, 1, INT64_MAX, 0, NULL);
> +
>  	return drmModeDirtyFB(fb->fd, fb->fb_id, NULL, 0);  }
>=20
> @@ -2969,6 +2985,9 @@ static void *map_bo(int fd, struct igt_fb *fb)
>  				      PROT_READ | PROT_WRITE);
>  	else if (is_nouveau_device(fd))
>  		ptr =3D igt_nouveau_mmap_bo(fb, PROT_READ | PROT_WRITE);
> +	else if (is_xe_device(fd))
> +		ptr =3D xe_bo_mmap_ext(fd, fb->gem_handle,
> +				     fb->size, PROT_READ | PROT_WRITE);
>  	else
>  		igt_assert(false);
>=20
> @@ -4253,6 +4272,9 @@ void igt_remove_fb(int fd, struct igt_fb *fb)
>  	if (!fb || !fb->fb_id)
>  		return;
>=20
> +	if (fb->syncobj)
> +		syncobj_destroy(fd, fb->syncobj);
> +
>  	cairo_surface_destroy(fb->cairo_surface);
>  	do_or_die(drmModeRmFB(fd, fb->fb_id));
>  	if (fb->is_dumb)
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h index 73bdfc866..a127a8128 10064=
4
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -62,6 +62,7 @@ typedef struct _igt_crc igt_crc_t;
>   * @fb_id: KMS ID of the framebuffer
>   * @fd: DRM device fd this framebuffer is created on
>   * @gem_handle: GEM handler of the underlying backing storage
> + * @syncobj: Syncobj to sync to for last drawing operation
>   * @is_dumb: Whether this framebuffer was allocated using the dumb buffe=
r
> API
>   * @drm_format: DRM FOURCC code
>   * @width: width in pixels
> @@ -84,6 +85,7 @@ typedef struct igt_fb {
>  	uint32_t fb_id;
>  	int fd;
>  	uint32_t gem_handle;
> +	uint32_t syncobj;
>  	bool is_dumb;
>  	uint32_t drm_format;
>  	int width;
> --
> 2.40.0
