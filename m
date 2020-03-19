Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0EC6E174
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2020 16:35:16 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 11so3256176wmo.2
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2020 09:35:16 -0700 (PDT)
Received: from [0.0.0.0] (jfdmzpr03-ext.jf.intel.com. [134.134.139.72])
 by smtp.googlemail.com with ESMTPSA id o16sm4389212wrs.44.2020.03.19.09.35.12
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Mar 2020 09:35:13 -0700 (PDT)
References: <20200319114206.1307-1-mika.kahola@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <f836094b-d9b4-c172-2215-179f13a0c181@gmail.com>
Date: Thu, 19 Mar 2020 18:35:07 +0200
MIME-Version: 1.0
In-Reply-To: <20200319114206.1307-1-mika.kahola@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Test for maximum
 number of planes
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 19.3.2020 13.42, Mika Kahola wrote:
> In some cases we ran out of bandwidth when executiong a test.
> An error such as this can be seen on dmesg
> 
> "Bandwidth 16632 MB/s exceeds max available 6553 MB/s (7 active planes)"
> 
> The patch tests first, how many planes the platform can support with
> the given resolution. The actual test is then performed by using the
> calculated maximum number of planes instead of maximum number of planes
> that the platform supports.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>   tests/kms_concurrent.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 14ca5fab..61137139 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -196,20 +196,19 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
>   }
>   
>   static void
> -test_plane_position_with_output(data_t *data, enum pipe pipe, igt_output_t *output)
> +test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
> +				igt_output_t *output)
>   {
>   	int i;
>   	int iterations = opt.iterations < 1 ? 1 : opt.iterations;
>   	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
> -	int max_planes = data->display.pipes[pipe].n_planes;
>   
>   	igt_pipe_refresh(&data->display, pipe, true);
>   
>   	i = 0;
>   	while (i < iterations || loop_forever) {
>   		prepare_planes(data, pipe, max_planes, output);
> -		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -
> +		igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>   		i++;
>   	}
>   }
> @@ -242,7 +241,7 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
>   	return mode;
>   }
>   
> -static void
> +static int
>   test_resolution_with_output(data_t *data, enum pipe pipe, igt_output_t *output)
>   {
>   	const drmModeModeInfo *mode_hi, *mode_lo;
> @@ -294,6 +293,8 @@ test_resolution_with_output(data_t *data, enum pipe pipe, igt_output_t *output)
>   
>   		i++;
>   	}
> +
> +	return max_planes;
>   }
>   
>   static void
> @@ -301,6 +302,7 @@ run_test(data_t *data, enum pipe pipe, igt_output_t *output)
>   {
>   	int connected_outs;
>   	int n_planes = data->display.pipes[pipe].n_planes;
> +	int max_planes = n_planes;
>   
>   	if (!opt.user_seed)
>   		opt.seed = time(NULL);
> @@ -311,9 +313,10 @@ run_test(data_t *data, enum pipe pipe, igt_output_t *output)
>   			 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
>   
>   		test_init(data, pipe, n_planes, output);
> +		max_planes = test_resolution_with_output(data, pipe, output);
>   
>   		igt_fork(child, 1) {
> -			test_plane_position_with_output(data, pipe, output);
> +			test_plane_position_with_output(data, pipe, max_planes, output);
>   		}
>   
>   		test_resolution_with_output(data, pipe, output);
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
