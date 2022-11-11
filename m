Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545B6890EA
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 10:36:40 +0000 (UTC)
Date: Fri, 11 Nov 2022 12:36:36 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Message-ID: <Y24ltLkqUbV1ql/a@intel.com>
References: <20221017004936.574303-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221017004936.574303-1-alex.hung@amd.com>
Subject: Re: [igt-dev] [PATCH 1/2][V2] tests/kms_universal_plane: turn off
 pipe when primary plane is off
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, Oct 16, 2022 at 06:49:35PM -0600, Alex Hung wrote:
> GPU drivers can reject when crtc is on and primary plane is off,
> so turn crtc off with primary plane and turn it on afterwards.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_universal_plane.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 64416afd..2db1d7e8 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -228,11 +228,14 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_7);
>  
>  	/* Step 11: Disable primary plane */
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, COMMIT_ATOMIC);

This is wrong. The test is not supposed to use atomic commits.

>  	igt_plane_set_fb(primary, NULL);
>  	igt_display_commit2(display, COMMIT_UNIVERSAL);

This is the commit that should have been used. Though I guess it would
have to converted to LEGACY. Not sure any of this actually makes sense
since after the modesets the test is testing something totally different
that what the original intent was.

>  
>  	/* Step 12: Legacy modeset to yellow FB (CRC 8) */
>  	igt_plane_set_fb(primary, &test.yellow_fb);
> +	igt_output_set_pipe(output, pipe);
>  	igt_display_commit2(display, COMMIT_LEGACY);
>  	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_8);
>  
> @@ -497,6 +500,8 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  	igt_display_commit2(&data->display, COMMIT_LEGACY);
>  
>  	/* Disable the primary plane */
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
>  
> @@ -506,6 +511,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  	 * Note that crtc->primary->fb = NULL causes flip to return EBUSY for
>  	 * historical reasons...
>  	 */
> +	igt_output_set_pipe(output, pipe);
>  	igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
>  				   test.red_fb.fb_id, 0, NULL) == -EBUSY);
>  
> @@ -520,9 +526,13 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  	 * completes, which we don't have a good way to specifically test for,
>  	 * but at least we can make sure that nothing blows up.
>  	 */
> +	igt_output_set_pipe(output, pipe);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  	igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
>  				   test.red_fb.fb_id, DRM_MODE_PAGE_FLIP_EVENT,
>  				   &test) == 0);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
>  
> -- 
> 2.38.0

-- 
Ville Syrjälä
Intel
