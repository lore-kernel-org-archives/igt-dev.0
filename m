Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9103FF0183C
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 14:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F38F10ED2E;
	Fri,  6 Mar 2026 14:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fLuutegM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24BD10ED2E
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772805850; x=1804341850;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Oq1cnVrQ5yEJw6HiGpw3/j8E9Ej67lFNondb/PeYX8I=;
 b=fLuutegMuI6ZQ+pkP3d0WWty2OTxQWAj8uCC3Ygh0yii9DcEp0xQ3VR5
 kweSiLmCuh9a/Jk0KXK46KiXvfdCLfsLv7WhcxDP4IEUiFJ3vJXG0q/mr
 IfAIb2y4k7Ojphn9vAFusmhm5PbSQQFs4QpUIQ+8LMU8Ag9ys5hrMeb+y
 c1vwW4iRTWmjugsh/iWDoAmly5dAnROUcGgeJbkhzbs5cZfnmcFnXhYid
 TFwd7VzpHhI5pDxWNDBDZY9CCoixDHitagMD3o9cJl6itGCYId3k6zrXj
 m49rfFxz7mgJ5idy4Nd565iAhHOF5yArvYkI0sgDQo+kxTZiJrjUJffk3 g==;
X-CSE-ConnectionGUID: hWv/Kr7QSlGMkHTBnY3LBw==
X-CSE-MsgGUID: xyY06gYSRgSx6LhQXoR/eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73612533"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73612533"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 06:04:10 -0800
X-CSE-ConnectionGUID: f0KMvRpBRDSmyRyWucFVBg==
X-CSE-MsgGUID: SvycFwqXTaq4mZaXZvF0Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218961516"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.250])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 06:04:08 -0800
Date: Fri, 6 Mar 2026 16:04:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/5] tests/kms_multipipe_modeset: use igt_next_crtc()
Message-ID: <aare1TykX5nruyn7@intel.com>
References: <cover.1772803372.git.jani.nikula@intel.com>
 <7d66e7bd76f0a7b1caf2274eaf870c483ed75ae7.1772803372.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d66e7bd76f0a7b1caf2274eaf870c483ed75ae7.1772803372.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Fri, Mar 06, 2026 at 03:23:57PM +0200, Jani Nikula wrote:
> The test doesn't care about pipes, but rather just another CRTC, so
> prefer igt_next_crtc() over looping pipes and igt_crtc_for_pipe().
> 
> It's all a bit subtle, but previously the test depended on consecutive
> pipes. Using CRTC indices allows for fused off pipes in between.
> 
> While at it, prefer CRTC nomenclature in the variables and messages.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/kms_multipipe_modeset.c | 32 ++++++++++++++------------------
>  1 file changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
> index 1980a0c61116..3c10bb1bd5fe 100644
> --- a/tests/kms_multipipe_modeset.c
> +++ b/tests/kms_multipipe_modeset.c
> @@ -48,17 +48,16 @@ typedef struct {
>  	struct igt_fb fb;
>  } data_t;
>  
> -static void run_test(data_t *data, int valid_outputs)
> +static void run_test(data_t *data)
>  {
>  	igt_output_t *output;
>  	igt_pipe_crc_t *pipe_crcs[IGT_MAX_PIPES] = { 0 };
>  	igt_crc_t ref_crcs[IGT_MAX_PIPES], new_crcs[IGT_MAX_PIPES];
>  	igt_display_t *display = &data->display;
>  	uint16_t width = 0, height = 0;
> -	igt_crtc_t *crtc;
> +	igt_crtc_t *crtc = NULL;
>  	igt_plane_t *plane;
>  	drmModeModeInfo *mode;
> -	int i = 0;
>  
>  	for_each_connected_output(display, output) {
>  		mode = igt_output_get_mode(output);
> @@ -75,13 +74,12 @@ static void run_test(data_t *data, int valid_outputs)
>  
>  	/* Collect reference CRC by Committing individually on all outputs*/
>  	for_each_connected_output(display, output) {
> -		crtc = igt_crtc_for_pipe(display, i);
> +		crtc = igt_next_crtc(display, crtc);
>  		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
>  
>  		mode = NULL;
>  
> -		pipe_crcs[i] = igt_crtc_crc_new(crtc,
> -						IGT_PIPE_CRC_SOURCE_AUTO);
> +		pipe_crcs[crtc->crtc_index] = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
>  
>  		igt_output_set_crtc(output,
>  				    crtc);
> @@ -93,15 +91,14 @@ static void run_test(data_t *data, int valid_outputs)
>  		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>  
>  		igt_display_commit2(display, COMMIT_ATOMIC);
> -		igt_pipe_crc_collect_crc(pipe_crcs[i], &ref_crcs[i]);
> +		igt_pipe_crc_collect_crc(pipe_crcs[crtc->crtc_index], &ref_crcs[crtc->crtc_index]);
>  		igt_output_set_crtc(output, NULL);
> -		i++;
>  	}
>  
> -	i = 0;
>  	/* Simultaneously commit on all outputs */
> +	crtc = NULL;
>  	for_each_connected_output(display, output) {
> -		crtc = igt_crtc_for_pipe(display, i);
> +		crtc = igt_next_crtc(display, crtc);
>  		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
>  
>  		mode = NULL;
> @@ -114,22 +111,21 @@ static void run_test(data_t *data, int valid_outputs)
>  		igt_plane_set_fb(plane, &data->fb);
>  		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
>  		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -		i++;
>  	}
>  
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  
>  	/* CRC Verification */
> -	for (i = 0; i < valid_outputs; i++) {
> -		igt_pipe_crc_collect_crc(pipe_crcs[i], &new_crcs[i]);
> -		igt_assert_crc_equal(&ref_crcs[i], &new_crcs[i]);
> +	for_each_crtc(display, crtc) {
> +		igt_pipe_crc_collect_crc(pipe_crcs[crtc->crtc_index], &new_crcs[crtc->crtc_index]);
> +		igt_assert_crc_equal(&ref_crcs[crtc->crtc_index], &new_crcs[crtc->crtc_index]);

We may not have used up all the CRTCs since we only picked one for
each connected output. So this would need some kind of pipe_crcs[...]==NULL
check perhaps.

>  	}
>  
>  	igt_plane_set_fb(plane, NULL);
>  	igt_remove_fb(data->drm_fd, &data->fb);
>  }
>  
> -static void test_multipipe(data_t *data, int num_pipes)
> +static void test_multipipe(data_t *data, int num_crtcs)
>  {
>  	igt_output_t *output;
>  	int valid_outputs = 0;
> @@ -137,11 +133,11 @@ static void test_multipipe(data_t *data, int num_pipes)
>  	for_each_connected_output(&data->display, output)
>  		valid_outputs++;
>  
> -	igt_require_f(valid_outputs == num_pipes,
> +	igt_require_f(valid_outputs == num_crtcs,
>  		      "Number of connected outputs(%d) not equal to the "
> -		      "number of pipes supported(%d)\n", valid_outputs, num_pipes);
> +		      "number of CRTCs supported(%d)\n", valid_outputs, num_crtcs);

Oh, apparently we do check that we have the same number of outputs and
CRTCs. That makes no sense to me. Apparently the original intention was
to make sure all CRTCs can be lit up simultaneously. For that we should
only care about having at least as many outputs as CRTCs.

Or more correctly we should make sure we have valid output for each
CRTC, which given potential CRTC<->output routing constraints isn't
even the same thing as just comparing the numbers. So it should probably
use something like for_each_crtc_with_single_output(), and then make
sure it actually found a valid output for every CRTC.

But given the already poor state of the test, this patch doesn't 
seem to make it any worse so
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

I guess the other thing to consider is whether this test makes
any sense at all. I'm not sure what specifically lighting up all
the CRTCs is supposed to achieve vs. just lighting up some of them...

>  
> -	run_test(data, valid_outputs);
> +	run_test(data);
>  }
>  
>  int igt_main()
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
