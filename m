Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAB66E3FC
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 08:30:10 +0000 (UTC)
Date: Mon, 22 Mar 2021 10:30:47 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YFhVt1hxwQ6HLJRf@platvala-desk.ger.corp.intel.com>
References: <20210322082535.1137703-1-martin.peres@mupuf.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322082535.1137703-1-martin.peres@mupuf.org>
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "tests/kms_plane: Don't unset
 primary_fb when testing other planes"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Martin Peres <martin.peres@mupuf.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 10:25:35AM +0200, Martin Peres wrote:
> The patch led to a regression in i915 results. The regression wasn't
> caught pre-merge because the test was blacklisted for pre-merge by
> yours truly due to its prohibitive execution time, but my creation
> came back to bite me in the ass, Frakenstein-style.
> 
> It is currently unclear if the regression introduced by this change is
> an i915 bug, a KMS spec violation introduced by the change, or
> generally a loose-spec and just incompatible HW between NVIDIA and
> Intel. While we figure this thing out, let's just revert the change
> and put the cost of integration on the people proposing the
> change (Lyude and I).
> 
> Sorry for the noise!
> 
> Signed-off-by: Martin Peres <martin.peres@mupuf.org>
> Cc: Jani Saarinen <jani.saarinen@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: juhapekka.heikkila@gmail.com

Acked-by: Petri Latvala <petri.latvala@intel.com>



> ---
>  tests/kms_plane.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index c87983a4..298a9375 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -817,10 +817,9 @@ enum crc_set { PACKED_CRC_SET,
>  	       MAX_CRC_SET };
>  
>  static bool test_format_plane(data_t *data, enum pipe pipe,
> -			      igt_output_t *output, igt_plane_t *plane, igt_fb_t *primary_fb)
> +			      igt_output_t *output, igt_plane_t *plane)
>  {
>  	struct igt_fb fb = {};
> -	struct igt_fb *clear_fb = plane->type == DRM_PLANE_TYPE_PRIMARY ? primary_fb : NULL;
>  	drmModeModeInfo *mode;
>  	uint32_t format, ref_format;
>  	uint64_t modifier, ref_modifier;
> @@ -880,7 +879,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>  			height = test_fb.height;
>  		}
>  
> -		igt_plane_set_fb(plane, clear_fb);
> +		igt_plane_set_fb(plane, NULL);
>  
>  		igt_remove_fb(data->drm_fd, &test_fb);
>  	}
> @@ -938,7 +937,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>  
>  	igt_pipe_crc_stop(data->pipe_crc);
>  
> -	igt_plane_set_fb(plane, clear_fb);
> +	igt_plane_set_fb(plane, NULL);
>  	igt_remove_fb(data->drm_fd, &fb);
>  
>  	return result;
> @@ -1011,7 +1010,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>  	for_each_plane_on_pipe(&data->display, pipe, plane) {
>  		if (skip_plane(data, plane))
>  			continue;
> -		result &= test_format_plane(data, pipe, output, plane, &primary_fb);
> +		result &= test_format_plane(data, pipe, output, plane);
>  	}
>  
>  	test_fini(data);
> -- 
> 2.30.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
