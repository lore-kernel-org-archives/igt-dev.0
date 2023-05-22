Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4865110E338
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 14:03:17 +0000 (UTC)
Date: Mon, 22 May 2023 16:02:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230522140233.qgebzajkhjhp47tl@kamilkon-desk1>
References: <20230403130124.15946-1-mcanal@igalia.com>
 <20230403130124.15946-5-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403130124.15946-5-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/kms_rotation_crc: create
 generic reflection tests
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

Hi Maíra,

On 2023-04-03 at 10:01:24 -0300, Maíra Canal wrote:
> Currently, kms_rotation_crc doesn't have any tests for the reflect-x and
> reflect-y properties. Therefore, add generic reflection tests for the
> primary and overlay planes. Note that this tests should skip on i915
----------------------------------------------------------------- ^
intel

+cc Ville, Juha-Pekka and Bhanuprakash

> devices, as i915 devices use reflect-x together with specific modifiers.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  tests/kms_rotation_crc.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 441a298b..47a3973b 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -131,6 +131,9 @@ static void rotate_colors(rgb_color_t *tl, rgb_color_t *tr, rgb_color_t *br,
>  	if (rotation & IGT_REFLECT_X) {
>  		igt_swap(*tl, *tr);
>  		igt_swap(*bl, *br);
> +	} else if (rotation & IGT_REFLECT_Y) {
> +		igt_swap(*tl, *bl);
> +		igt_swap(*tr, *br);
>  	}
>  
>  	if (rotation & IGT_ROTATION_90) {
> @@ -1055,6 +1058,10 @@ static const char *rot_test_str(igt_rotation_t rot)
>  		return "180";
>  	case IGT_ROTATION_270:
>  		return "270";
> +	case IGT_REFLECT_X:
> +		return "x";
> +	case IGT_REFLECT_Y:
> +		return "y";
>  	default:
>  		igt_assert(0);
>  	}
> @@ -1151,6 +1158,17 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  		{ 0, 0 }
>  	};
>  
> +	struct generic_reflect {
> +		unsigned int plane;
> +		igt_rotation_t rot;
> +	} *generic_reflect, generic_reflect_subtests[] = {
> +		{ DRM_PLANE_TYPE_PRIMARY, IGT_REFLECT_X },
> +		{ DRM_PLANE_TYPE_PRIMARY, IGT_REFLECT_Y },
> +		{ DRM_PLANE_TYPE_OVERLAY, IGT_REFLECT_X },
> +		{ DRM_PLANE_TYPE_OVERLAY, IGT_REFLECT_Y },
> +		{ 0, 0 }
> +	};
> +
>  	int gen = 0;
>  
>  	igt_fixture {
> @@ -1187,6 +1205,19 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  		}
>  	}
>  
> +	igt_describe("Generic reflection tests for primary and sprite planes");
> +	for (generic_reflect = generic_reflect_subtests; generic_reflect->rot; generic_reflect++) {
> +		igt_subtest_f("%s-reflect-%s",
> +			      plane_test_str(generic_reflect->plane),
> +			      rot_test_str(generic_reflect->rot)) {
> +			/* i915 devices have specific modifiers for reflection */
-------------------------- ^
intel
> +			igt_require(!is_i915_device(data.gfx_fd));
--------------------------------------- ^
is_intel_device

Regards,
Kamil

> +
> +			data.rotation = IGT_ROTATION_0 | generic_reflect->rot;
> +			test_plane_rotation(&data, generic_reflect->plane, false);
> +		}
> +	}
> +
>  	igt_describe("Rotation test with 90/180/270 degree for a plane of gen9+ with given position");
>  	for (rot_pos = rot_pos_subtests; rot_pos->rot; rot_pos++) {
>  		igt_subtest_f("sprite-rotation-%s-pos-%d-%d", rot_test_str(rot_pos->rot),
> -- 
> 2.39.2
> 
