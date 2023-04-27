Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A1710E142
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 05:46:32 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 27 Apr 2023 05:46:28 +0000
Message-ID: <DM4PR11MB631270ADBE9A9FBFA2DFD069906A9@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
 <20230426114725.2244653-19-bhanuprakash.modem@intel.com>
In-Reply-To: <20230426114725.2244653-19-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V3 18/45] tests/i915/kms_big_fb: Add XE support
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
> Subject: [igt-dev] [i-g-t V3 18/45] tests/i915/kms_big_fb: Add XE support
>=20
> Add XE driver support for kms tests.
LGTM

>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/i915/kms_big_fb.c | 74 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 59 insertions(+), 15 deletions(-)
>=20
> diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c index
> a0d5ef730..c120a14a6 100644
> --- a/tests/i915/kms_big_fb.c
> +++ b/tests/i915/kms_big_fb.c
> @@ -28,6 +28,7 @@
>  #include <string.h>
>=20
>  #include "i915/gem_create.h"
> +#include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>=20
>  IGT_TEST_DESCRIPTION("Test big framebuffers"); @@ -104,10 +105,12 @@
> static void copy_pattern(data_t *data,
>  	src =3D init_buf(data, src_fb, "big fb src");
>  	dst =3D init_buf(data, dst_fb, "big fb dst");
>=20
> -	gem_set_domain(data->drm_fd, dst_fb->gem_handle,
> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> -	gem_set_domain(data->drm_fd, src_fb->gem_handle,
> -		       I915_GEM_DOMAIN_GTT, 0);
> +	if (is_i915_device(data->drm_fd)) {
> +		gem_set_domain(data->drm_fd, dst_fb->gem_handle,
> +			       I915_GEM_DOMAIN_GTT,
> I915_GEM_DOMAIN_GTT);
> +		gem_set_domain(data->drm_fd, src_fb->gem_handle,
> +			       I915_GEM_DOMAIN_GTT, 0);
> +	}
>=20
>  	/*
>  	 * We expect the kernel to limit the max fb @@ -638,7 +641,7 @@
> test_size_overflow(data_t *data)
>  					       data->modifier));
>=20
>  	/*
> -	 * Try to hit a specific integer overflow in i915 fb size
> +	 * Try to hit a specific integer overflow in intel fb size
>  	 * calculations. 256k * 16k =3D=3D 1<<32 which is checked
>  	 * against the bo size. The check should fail on account
>  	 * of the bo being smaller, but due to the overflow the @@ -647,8
> +650,13 @@ test_size_overflow(data_t *data)
>  	igt_require(data->max_fb_width >=3D 16383 &&
>  		    data->max_fb_height >=3D 16383);
>=20
> -	bo =3D gem_buffer_create_fb_obj(data->drm_fd, (1ULL << 32) - 4096);
> -
> +	if (is_i915_device(data->drm_fd))
> +		bo =3D gem_buffer_create_fb_obj(data->drm_fd, (1ULL << 32) -
> 4096);
> +	else
> +		bo =3D xe_bo_create_flags(data->drm_fd, 0,
> +					ALIGN(((1ULL << 32) - 4096),
> +					      xe_get_default_alignment(data-
> >drm_fd)),
> +					vram_if_possible(data->drm_fd, 0));
>  	igt_require(bo);
>=20
>  	ret =3D __kms_addfb(data->drm_fd, bo,
> @@ -677,7 +685,7 @@ test_size_offset_overflow(data_t *data)
>  					       data->modifier));
>=20
>  	/*
> -	 * Try to hit a specific integer overflow in i915 fb size
> +	 * Try to hit a specific integer overflow in intel fb size
>  	 * calculations. This time it's offsets[1] + the tile
>  	 * aligned chroma plane size that overflows and
>  	 * incorrectly passes the bo size check.
> @@ -686,7 +694,13 @@ test_size_offset_overflow(data_t *data)
>  					       DRM_FORMAT_NV12,
>  					       data->modifier));
>=20
> -	bo =3D gem_buffer_create_fb_obj(data->drm_fd, (1ULL << 32) - 4096);
> +	if (is_i915_device(data->drm_fd))
> +		bo =3D gem_buffer_create_fb_obj(data->drm_fd, (1ULL << 32) -
> 4096);
> +	else
> +		bo =3D xe_bo_create_flags(data->drm_fd, 0,
> +					ALIGN(((1ULL << 32) - 4096),
> +					      xe_get_default_alignment(data-
> >drm_fd)),
> +					vram_if_possible(data->drm_fd, 0));
>  	igt_require(bo);
>=20
>  	offsets[0] =3D 0;
> @@ -745,10 +759,15 @@ test_addfb(data_t *data)
>  			 format, data->modifier,
>  			 &size, &strides[0]);
>=20
> -	bo =3D gem_buffer_create_fb_obj(data->drm_fd, size);
> +	if (is_i915_device(data->drm_fd))
> +		bo =3D gem_buffer_create_fb_obj(data->drm_fd, size);
> +	else
> +		bo =3D xe_bo_create_flags(data->drm_fd, 0,
> +					ALIGN(size,
> xe_get_default_alignment(data->drm_fd)),
> +					vram_if_possible(data->drm_fd, 0));
>  	igt_require(bo);
>=20
> -	if (intel_display_ver(data->devid) < 4)
> +	if (is_i915_device(data->drm_fd) && intel_display_ver(data->devid) <
> +4)
>  		gem_set_tiling(data->drm_fd, bo,
>  			       igt_fb_mod_to_tiling(data->modifier), strides[0]);
>=20
> @@ -844,9 +863,9 @@ igt_main
>  	igt_fixture {
>  		drmModeResPtr res;
>=20
> -		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> +		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL |
> DRIVER_XE);
>=20
> -		igt_require(is_i915_device(data.drm_fd));
> +		igt_require(is_intel_device(data.drm_fd));
>=20
>  		data.devid =3D intel_get_drm_devid(data.drm_fd);
>=20
> @@ -868,7 +887,11 @@ igt_main
>  			 data.max_fb_width, data.max_fb_height);
>=20
>  		data.ram_size =3D igt_get_total_ram_mb() << 20;
> -		data.aper_size =3D gem_aperture_size(data.drm_fd);
> +
> +		if (is_i915_device(data.drm_fd))
> +			data.aper_size =3D gem_aperture_size(data.drm_fd);
> +		else
> +			data.aper_size =3D (1ULL << xe_va_bits(data.drm_fd));
>  		data.mappable_size =3D
> gem_mappable_aperture_size(data.drm_fd);
>=20
>  		igt_info("RAM: %"PRIu64" MiB, GPU address space: %"PRId64"
> MiB, GGTT mappable size: %"PRId64" MiB\n", @@ -905,6 +928,10 @@ igt_main
>  	for (int i =3D 1; i < ARRAY_SIZE(modifiers); i++) {
>  		igt_subtest_f("%s-addfb-size-overflow",
>  			      modifiers[i].name) {
> +			/* No tiling support in XE. */
> +			igt_skip_on(is_xe_device(data.drm_fd) &&
> +				    modifiers[i].modifier !=3D
> DRM_FORMAT_MOD_LINEAR);
> +
>  			data.modifier =3D modifiers[i].modifier;
>  			test_size_overflow(&data);
>  		}
> @@ -914,6 +941,10 @@ igt_main
>  	for (int i =3D 1; i < ARRAY_SIZE(modifiers); i++) {
>  		igt_subtest_f("%s-addfb-size-offset-overflow",
>  			      modifiers[i].name) {
> +			/* No tiling support in XE. */
> +			igt_skip_on(is_xe_device(data.drm_fd) &&
> +				    modifiers[i].modifier !=3D
> DRM_FORMAT_MOD_LINEAR);
> +
>  			data.modifier =3D modifiers[i].modifier;
>  			test_size_offset_overflow(&data);
>  		}
> @@ -922,6 +953,10 @@ igt_main
>  	igt_describe("Sanity check if addfb ioctl works correctly for given siz=
e
> and strides of fb");
>  	for (int i =3D 0; i < ARRAY_SIZE(modifiers); i++) {
>  		igt_subtest_f("%s-addfb", modifiers[i].name) {
> +			/* No tiling support in XE. */
> +			igt_skip_on(is_xe_device(data.drm_fd) &&
> +				    modifiers[i].modifier !=3D
> DRM_FORMAT_MOD_LINEAR);
> +
>  			data.modifier =3D modifiers[i].modifier;
>  			test_addfb(&data);
>  		}
> @@ -939,8 +974,13 @@ igt_main
>  				igt_describe("Sanity check if addfb ioctl works
> correctly for given "
>  						"combination of modifier
> formats and rotation");
>  				igt_subtest_f("%s-%dbpp-rotate-%d",
> modifiers[i].name,
> -					      formats[j].bpp, rotations[k].angle)
> +					      formats[j].bpp, rotations[k].angle) {
> +					/* No tiling support in XE. */
> +					igt_skip_on(is_xe_device(data.drm_fd)
> &&
> +						    data.modifier !=3D
> DRM_FORMAT_MOD_LINEAR);
> +
>  					test_scanout(&data);
> +				}
>  			}
>=20
>  			igt_fixture
> @@ -982,6 +1022,10 @@ igt_main
>=20
> 	igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >=3D 5);
>  						data.max_hw_fb_width =3D
> min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
>=20
> +						/* No tiling support in XE. */
> +
> 	igt_skip_on(is_xe_device(data.drm_fd) &&
> +							    modifiers[i].modifier
> !=3D DRM_FORMAT_MOD_LINEAR);
> +
>  						test_scanout(&data);
>  					}
>=20
> --
> 2.40.0
