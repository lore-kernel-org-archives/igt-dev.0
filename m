Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F090510E09C
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 09:15:25 +0000 (UTC)
Message-ID: <23f3cd8a-da7a-834b-6999-8de060723105@intel.com>
Date: Fri, 21 Apr 2023 14:45:10 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
 <20230418164501.1687266-25-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230418164501.1687266-25-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 24/45] tests/kms_async_flips: No XE support
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


On 4/18/2023 10:14 PM, Bhanuprakash Modem wrote:
> Async flips won't work with linear buffers on Intel hardware,
> hence don't run tests on XE device as XE won't support tiling.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_async_flips.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 1e6506e3d..51ffa523a 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -592,7 +592,13 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
>   	int i;
>   
>   	igt_fixture {
> -		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		/*
> +		 * FIXME: As of now, Async flips won't work with linear buffers
> +		 * on Intel hardware, hence don't run tests on XE device as XE
> +		 * won't support tiling.
> +		 * Once Kernel changes got landed, please update this logic.
> +		 */
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY & ~DRIVER_XE);
>   		kmstest_set_vt_graphics_mode();
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
