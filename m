Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F4D10E7EB
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 10:33:40 +0000 (UTC)
Date: Fri, 11 Nov 2022 12:33:36 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Message-ID: <Y24lAITU855WxQ3C@intel.com>
References: <20220903174803.2937836-1-alex.hung@amd.com>
 <20220903174803.2937836-2-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220903174803.2937836-2-alex.hung@amd.com>
Subject: Re: [igt-dev] [PATCH 2/2][V4] tests/kms_universal_plane: Skip
 offscreen test for universal API
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

On Sat, Sep 03, 2022 at 11:48:03AM -0600, Alex Hung wrote:
> amdgpu driver intentionally rejects plane outside of the screen and thus
> this test is skipped on AMD HW. See more details in kernel commits
> 40d916a2602c and 4abdb72bd8576 which are summarized as below:
> 
> "Reject this condition (too small viewport size) at validation time.
> This gives the calling level a chance to handle this gracefully and
> avoid inconsistent behaviors."
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_universal_plane.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 9eab1a57..432f56ba 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -241,17 +241,22 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  	igt_plane_set_fb(sprite, &test.red_fb);
>  	igt_display_commit2(display, COMMIT_LEGACY);
>  
> -	/* Step 14: Universal API, set primary completely offscreen (CRC 9) */
> -	igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
> -				   output->config.crtc->crtc_id,
> -				   test.blue_fb.fb_id, 0,
> -				   9000, 9000,
> -				   test.mode->hdisplay,
> -				   test.mode->vdisplay,
> -				   IGT_FIXED(0,0), IGT_FIXED(0,0),
> -				   IGT_FIXED(test.mode->hdisplay,0),
> -				   IGT_FIXED(test.mode->vdisplay,0)) == 0);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_9);
> +	/*
> +	 * Step 14: Universal API, set primary completely offscreen (CRC 9).
> +	 * Skip on amdgpu which rejects offscreen planes.
> +	 */
> +	if (!is_amdgpu_device(data->drm_fd)) {

These random checks all over the place aren't really great. Is the test
even testing anything anymore? ... I guess it sort of is since this
"single" test seems to be actually about twenty different tests rolled
into one. Would be nice if this was actually split into proper subtests
and then amdgpu could just skip the ones it can't actually do...

-- 
Ville Syrjälä
Intel
