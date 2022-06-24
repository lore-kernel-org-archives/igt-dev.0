Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAA910F8A3
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jun 2022 05:09:57 +0000 (UTC)
Message-ID: <859c6652-d4b8-dd8d-2860-e2fbe884d196@intel.com>
Date: Fri, 24 Jun 2022 10:39:38 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220623235728.5749-1-nidhi1.gupta@intel.com>
 <20220623235728.5749-3-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220623235728.5749-3-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_invalid_mode: Test Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri-24-06-2022 05:27 am, Nidhi Gupta wrote:
> Sanitize the system state before starting the subtest.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_invalid_mode.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 7e1f683b..423d360f 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -184,9 +184,9 @@ test_output(data_t *data)
>   	igt_output_t *output = data->output;
>   	drmModeModeInfo mode;
>   	struct igt_fb fb;
> -	int ret;
> -	uint32_t crtc_id;
>   
> +	igt_display_reset(&data->display);
> +	igt_output_set_pipe(output, data->pipe);
>   	/*
>   	 * FIXME test every mode we have to be more
>   	 * sure everything is really getting rejected?

mode = *igt_output_get_mode(output);
igt_require(data->adjust_mode(data, &mode));

As we are adjusting the mode, I guess we must override with the updated one.

hmm, we are always trying with default mode. How about trying with few 
override modes?

> @@ -203,12 +203,7 @@ test_output(data_t *data)
>   
>   	kmstest_unset_all_crtcs(data->drm_fd, data->res);

This is redundant to igt_display_reset(), also it'll unset all crtcs 
before commit, so we'll endup to commit with out crtc. Please drop it.

Also, data->res is no more required as we are using IGT wrappers.

And please add igt_display_require_output() to igt_fixture.

>   
> -	crtc_id = data->display.pipes[data->pipe].crtc_id;
> -
> -	ret = drmModeSetCrtc(data->drm_fd, crtc_id,
> -			     fb.fb_id, 0, 0,
> -			     &output->id, 1, &mode);
> -	igt_assert_lt(ret, 0);
> +	igt_display_commit(&data->display);

Cleanup is required here.
igt_output_set_pipe(output, PIPE_NONE);

>   
>   	igt_remove_fb(data->drm_fd, &fb);
>   }
