Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D827A3B5B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jul 2022 09:16:51 +0000 (UTC)
Message-ID: <84075281-cdbe-3f89-4ab3-3a963383cba8@intel.com>
Date: Thu, 14 Jul 2022 14:46:33 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>, <swati2.sharma@intel.com>
References: <20220714081409.671724-1-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220714081409.671724-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 1/2] tests/kms_color: Fix multiple failures in
 deep-color tests
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

On 7/14/2022 1:44 PM, Bhanuprakash Modem wrote:
> This patch will sanitize the system state before starting the subtest.
> And also, preserve connector's mode to use all over the subtets, since
Typo: 'subtets'
> igt_display_reset() will clear it.
>
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6198
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/4137
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_color.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 6ea721f1..8c15c7be 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -839,6 +839,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
>   		if (!panel_supports_deep_color(data->drm_fd, output->name))
>   			continue;
>   
> +		igt_display_reset(&data->display);
>   		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
>   		igt_output_set_pipe(output, p);
>   		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> @@ -850,7 +851,10 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
>   		data->color_depth = 10;
>   		data->drm_format = DRM_FORMAT_XRGB2101010;
>   		data->output = output;
> -		data->mode = igt_output_get_mode(data->output);
> +
> +		data->mode = malloc(sizeof(drmModeModeInfo));
> +		igt_assert(data->mode);
> +		memcpy(data->mode, igt_output_get_mode(data->output), sizeof(drmModeModeInfo));
>   
>   		igt_dynamic_f("pipe-%s-%s-gamma", kmstest_pipe_name(p), output->name) {
>   			igt_display_reset(&data->display);
> @@ -884,6 +888,8 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
>   			igt_assert(ret);
>   		}
>   
> +		free(data->mode);
> +
>   		break;
>   	}
>   

