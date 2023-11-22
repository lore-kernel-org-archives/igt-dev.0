Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752A610E5D5
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Nov 2023 08:20:55 +0000 (UTC)
Message-ID: <f6aeb561-ce48-4c08-b070-854521ab4d04@intel.com>
Date: Wed, 22 Nov 2023 13:50:39 +0530
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231114084504.159561-1-vinod.govindapillai@intel.com>
 <20231114084504.159561-2-vinod.govindapillai@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231114084504.159561-2-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v1 1/1] tests/kms_flip: add possibility
 to ignore long HPDs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 11/14/2023 2:15 PM, Vinod Govindapillai wrote:
> In some CI environments, spurious long HPDs are impacting the
> kms_flip test results. The provision to set ignore long HPDs was
> not being used by the kms_flip tests. Call igt_display_require
> for kms_flip as well which will track the usage of environment
> variable IGT_KMS_IGNORE_HPD
>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_flip.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index fc7cee050..c32b19412 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -2116,12 +2116,13 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		{ 0, TEST_BO_TOOBIG | TEST_NO_2X_OUTPUT, "bo-too-big" },
>   		{ 10, TEST_FLIP | TEST_SUSPEND, "flip-vs-suspend" },
>   	};
> +	igt_display_t display;
>   	int i;
>   
>   	igt_fixture {
>   		drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
> -		igt_enable_connectors(drm_fd);
> +		igt_display_require(&display, drm_fd);
>   
>   		kmstest_set_vt_graphics_mode();
>   		igt_install_exit_handler(kms_flip_exit_handler);
> @@ -2192,6 +2193,8 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   	}
>   	igt_stop_signal_helper();
>   
> -	igt_fixture
> +	igt_fixture {
> +		igt_display_fini(&display);
>   		drm_close_driver(drm_fd);
> +	}
>   }
