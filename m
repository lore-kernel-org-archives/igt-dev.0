Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571D66E0E3
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2020 10:12:45 +0000 (UTC)
Date: Thu, 12 Mar 2020 12:12:42 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200312101242.GA9497@platvala-desk.ger.corp.intel.com>
References: <20200312095137.551252-1-arkadiusz.hiler@intel.com>
 <20200312095137.551252-2-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312095137.551252-2-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_chamelium: Don't fail
 random palnes tests on invalid config
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Martin Peres <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 12, 2020 at 11:51:37AM +0200, Arkadiusz Hiler wrote:
> It is possible to generate a configuration that the driver rejects
> because it cannot be handled (e.g. exceeding the number of available
> scalers). Until now the test was failing in such cases with:
> 
>   igt_kms-CRITICAL: Test assertion failure function igt_display_commit_atomic, file ../lib/igt_kms.c:3490:
>   igt_kms-CRITICAL: Failed assertion: ret == 0
>   igt_kms-CRITICAL: Last errno: 22, Invalid argument
>   igt_kms-CRITICAL: error: -22 != 0
> 
> With this change we will just note that the atomic commit is invalid and
> pass the test without causing random noise.
> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Martin Peres <martin.peres@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  tests/kms_chamelium.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> index 8046ac65..b563cce4 100644
> --- a/tests/kms_chamelium.c
> +++ b/tests/kms_chamelium.c
> @@ -2402,6 +2402,7 @@ static void test_display_planes_random(data_t *data,
>  	bool allow_yuv;
>  	unsigned int i;
>  	unsigned int fb_id;
> +	int ret;
>  
>  	switch (check) {
>  	case CHAMELIUM_CHECK_CRC:
> @@ -2478,7 +2479,15 @@ static void test_display_planes_random(data_t *data,
>  		fb_crc = chamelium_calculate_fb_crc_async_start(data->drm_fd,
>  								&result_fb);
>  
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	/* we have invalid configuration, noting we can do */

I'm noting that there's nothing we can do.


-- 
Petri Latvala


> +	if (ret == -EINVAL) {
> +		igt_info("The random plane configuration is invalid, "
> +			 "passing the test without testing anything.\n");
> +		goto cleanup;
> +	}
> +
>  
>  	if (check == CHAMELIUM_CHECK_CRC) {
>  		chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> @@ -2505,6 +2514,8 @@ static void test_display_planes_random(data_t *data,
>  		chamelium_destroy_frame_dump(dump);
>  	}
>  
> +cleanup:
> +
>  	for (i = 0; i < overlay_planes_count; i++)
>  		igt_remove_fb(data->drm_fd, &overlay_fbs[i]);
>  
> -- 
> 2.24.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
