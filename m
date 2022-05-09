Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE9910E748
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 09:10:00 +0000 (UTC)
Date: Mon, 9 May 2022 12:10:15 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Message-ID: <Ynjad7oekC6FiUe8@platvala-desk.ger.corp.intel.com>
References: <20220506181432.165-1-quic_jesszhan@quicinc.com>
 <20220506181432.165-3-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506181432.165-3-quic_jesszhan@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1 2/3] tests/kms_universal_plane: Use
 igt_get_assigned_primary to get the primary plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com,
 robdclark@chromium.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 06, 2022 at 11:14:31AM -0700, Jessica Zhang wrote:
> Currently, pageflip_test_pipe will use igt_output_get_plane_type to get
> the primary plane of the pipe and assumes that the primary plane marked
> by the driver will also be used by drmModePageFlip to perform the page flip.
> 
> This is not necessarily true in cases where there are multiple possible
> primary planes.
> 
> To fix this, let's use igt_get_assigned_primary to get the primary plane
> instead.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  tests/kms_universal_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 3cb6d704a6ef..7bd2c667b552 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -483,7 +483,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  
>  	pageflip_test_init(&test, output, pipe);
>  
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	primary = igt_get_assigned_primary(output, &data->display.pipes[pipe]);

https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7059/shard-glk6/igt@kms_rotation_crc@primary-rotation-270.html

The setcrtc call is getting ENOSPC there. Doing that unconditionally
is a no-go, and needs to be handled somehow cleanly.

Check in igt_get_assigned_primary that there's multiple primary
planes? Check that in init and store that info in igt_output_t or
igt_pipe_t? Check for msm device specifically (I don't like this, but
it's the option if all else is unclean)?


-- 
Petri Latvala
