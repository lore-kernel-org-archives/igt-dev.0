Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C69E10ECE9
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 23:14:44 +0000 (UTC)
Date: Thu, 21 Apr 2022 16:14:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Message-ID: <YmHlYkSG2fsRbJL9@mdroper-desk1.amr.corp.intel.com>
References: <20220421213442.366-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421213442.366-1-quic_jesszhan@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_universal_plane: Change
 num_primary and num_cursor asserts into warnings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, petri.latvala@intel.com,
 igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 02:34:42PM -0700, Jessica Zhang wrote:
> This check was originally put in place to prevent accidental calls to
> drm_plane_init instead of drm_universal_plane_init to go uncaught due to
> similarities in parameters.
> 
> However, both method signatures have now diverged enough so that
> accidental calls will be caught by the compiler. In addition, DRM allows
> drivers to support multiple primary planes, so demoting the assert to a
> warning instead will prevent subtests from being blocked for drivers
> where multiple primary planes are supported.

I think the _intent_ of the DRM core is still that there's only ever one
DRM_PLANE_TYPE_PRIMARY per CRTC (since the meaning of "primary" is "this
is the specific plane that the legacy ioctls like SET_CRTC will
update").  That information isn't as terribly important to modern
userspace that's fully atomic and doesn't use legacy ioctls, and it
sounds like that's true for all of the userspace that's every run on
your platform, so the multiple primary planes per pipe doesn't actually
cause any confusion or bugs in your setting.

Since MSM has already been allowing multiple primaries per pipe for a
while (due to the way your planes can migrate between pipes) we don't
want to break your existing ABI behavior, so we should continue to allow
this going forward.  Demoting the IGT assert below to a warning seems
reasonable to me given that justification.

I think we should still make it clear that multiple primary planes per
pipe isn't really the intent of the api and we're just allowing it for
compatibility, so maybe adding a comment to that effect above those
igt_warn_on()'s would be a good idea.  For hardware like yours where
planes can migrate between pipes and you'll never have to deal with any
userspace relying on non-atomic ioctls, I think it would actually be
more natural to have zero primary planes (and just return an error from
legacy ioctls like setcrtc that need one designated).

Anway, I'm fine with the change here so,

Acked-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  tests/kms_universal_plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 2e8958979dd6..3cb6d704a6ef 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -154,8 +154,8 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  		else if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_CURSOR)
>  			num_cursor++;
>  
> -	igt_assert_eq(num_primary, 1);
> -	igt_assert_lte(num_cursor, 1);
> +	igt_warn_on(num_primary != 1);
> +	igt_warn_on(num_cursor > 1);
>  
>  	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> -- 
> 2.31.0
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
