Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6363610E14F
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 13:53:47 +0000 (UTC)
Date: Wed, 6 Apr 2022 16:53:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <Yk2bZ5WZmXMEcnVn@intel.com>
References: <20220406130058.25378-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406130058.25378-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_big_fb: take out test
 only flag for try commit in inner loop
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 04:00:58PM +0300, Juha-Pekka Heikkila wrote:
> This will cause try commit to do modeset which could cause crc buffer
> overflow in later commit. I changed small fb not to be cleared with
> green color so there will be no unnecessary green flashes, this seem
> to also take portion of execution time away.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/i915/kms_big_fb.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
> index 8724d6069..7c9bb5d2a 100644
> --- a/tests/i915/kms_big_fb.c
> +++ b/tests/i915/kms_big_fb.c
> @@ -348,8 +348,7 @@ static bool test_plane(data_t *data)
>  		 */
>  		if (i == 0 && data->display.is_atomic &&
>  		    igt_display_try_commit_atomic(&data->display,
> -						  DRM_MODE_ATOMIC_ALLOW_MODESET |
> -						  DRM_MODE_ATOMIC_TEST_ONLY,
> +						  DRM_MODE_ATOMIC_ALLOW_MODESET,
>  						  NULL) != 0) {

The point here is to validate that the plane configuration is valid,
if not we skip the test. Doing a real commit here doesn't make sense.

If there's some step that's too slow while we have the crc capture
enabled, then we should try do that step before we enable the crc
capture. A modeset should not cause a crc buffer overflow in itself
since it stops the crc capture for the duration of the modeset.
But looking at the code it looks like it should be possible to
reorder igt_pipe_crc_start() and copy_pattern(). I guess it would
even be possible to do the igt_pipe_crc_start() after the commit.

>  			if (igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
>  				igt_plane_set_rotation(plane, IGT_ROTATION_0);
> @@ -420,9 +419,8 @@ static bool test_pipe(data_t *data)
>  	if (igt_rotation_90_or_270(data->rotation))
>  		igt_swap(width, height);
>  
> -	igt_create_color_fb(data->drm_fd, width, height,
> -			    data->format, data->modifier,
> -			    0, 1, 0, &data->small_fb);
> +	igt_create_fb(data->drm_fd, width, height,
> +		      data->format, data->modifier, &data->small_fb);

I probably made it look obnoxious to make sure it's easy to spot
should the rendercopy fails somehow.

>  
>  	igt_output_set_pipe(data->output, data->pipe);
>  
> -- 
> 2.28.0

-- 
Ville Syrjälä
Intel
