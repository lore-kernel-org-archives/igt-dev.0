Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C1A10FD87
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Jul 2022 05:41:07 +0000 (UTC)
Message-ID: <2c8c6c17-ddf2-f60a-3a4e-cc09126b2c77@intel.com>
Date: Tue, 19 Jul 2022 11:10:57 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220718093240.14514-1-nidhi1.gupta@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220718093240.14514-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_invalid_mode: Avoid usage
 of same pipe on multiple outputs
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

On 7/18/2022 3:02 PM, Nidhi Gupta wrote:
> Sanitize the system state before starting the subtest.
>
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6435
> Fixes: 6725767a8410 (tests/kms_invalid_mode: Test Cleanup)
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_invalid_mode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 21ee91ab..0ae98a31 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -185,6 +185,7 @@ test_output(data_t *data)
>   	int ret;
>   	drmModeModeInfo *mode;
>   
> +	igt_display_reset(&data->display);
>   	igt_output_set_pipe(output, data->pipe);
>   
>   	igt_create_fb(data->drm_fd, 512, 512, DRM_FORMAT_XRGB8888,
> @@ -202,7 +203,6 @@ test_output(data_t *data)
>   	igt_remove_fb(data->drm_fd, &fb);
>   	igt_output_override_mode(output, NULL);
>   	/*unset_all_crtcs*/
> -	igt_display_reset(&data->display);
>   	igt_display_commit(&data->display);
>   }
>   

