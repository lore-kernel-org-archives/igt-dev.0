Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E876E9A7
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Mar 2021 10:09:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so839377wmi.3
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Mar 2021 03:09:50 -0700 (PDT)
References: <20210323122943.6362-1-mohammed.khajapasha@intel.com>
 <20210323122943.6362-2-mohammed.khajapasha@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <50f885de-8f58-c1df-33bd-2817a5976e5c@gmail.com>
Date: Wed, 24 Mar 2021 12:09:42 +0200
MIME-Version: 1.0
In-Reply-To: <20210323122943.6362-2-mohammed.khajapasha@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] test/kms_plane_scaling: Don't run
 scaler clip/clamp with all formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Results look all green and there is as expected less time spent on pipes 
b and c.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

/Juha-Pekka


On 23.3.2021 14.29, Mohammed Khajapasha wrote:
> Don't run plane scaler tests with all formats for pipe C & D.
> We probably don't need to test plane scaler tests with each format
> for pipe C & D.
> 
> $ time ./build/tests/kms_plane_scaling
> - real	6m53,143s
> + real	4m39,406s
> 
> Cc: juhapekka.heikkila@gmail.com
> Cc: Mika Kahola <mika.kahola@intel.com>
> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> ---
>   tests/kms_plane_scaling.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index c63eb428..31f14275 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -230,6 +230,18 @@ static bool test_format(data_t *data,
>   	return true;
>   }
>   
> +static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iteration)
> +{
> +	if (!is_i915_device(data->drm_fd) ||
> +	    data->extended)
> +		return true;
> +
> +	if ((pipe > PIPE_B) && (iteration >= 2))
> +		return false;
> +
> +	return true;
> +}
> +
>   static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
>   					   igt_output_t *output)
>   {
> @@ -532,6 +544,9 @@ test_scaler_with_clipping_clamping_scenario(data_t *d, enum pipe pipe, igt_outpu
>   		unsigned f1 = d->plane1->drm_plane->formats[i];
>   		struct igt_vec tested_formats2;
>   
> +		if (!test_pipe_iteration(d, pipe, i))
> +			continue;
> +
>   		if (!test_format(d, &tested_formats1, f1) ||
>   		    !can_scale(d, f1))
>   			continue;
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
