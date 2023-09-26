Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEC510E3EA
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 16:17:49 +0000 (UTC)
Message-ID: <f4e8a585-2696-bb33-a365-a240b940f93c@intel.com>
Date: Tue, 26 Sep 2023 21:47:09 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230918102622.258614-1-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230918102622.258614-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_dither: rename subtest
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


On Mon-18-09-2023 03:56 pm, Swati Sharma wrote:
> Use small case for subtest naming.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/kms_dither.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
> index c41961937..3387a3b10 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -187,14 +187,14 @@ static bool is_supported(igt_output_t *output)
>   }
>   
>   /**
> - * SUBTEST: FB-8BPC-Vs-Panel-6BPC
> + * SUBTEST: fb-8bpc-vs-panel-6bpc
>    * Description: Framebuffer BPC:8, Panel BPC:6, Expected Dither:Enable
>    * Driver requirement: i915, xe
>    * Functionality: colorspace, kms_gem_interop
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    *
> - * SUBTEST: FB-8BPC-Vs-Panel-8BPC
> + * SUBTEST: fb-8bpc-vs-panel-8bpc
>    * Description: Framebuffer BPC:8, Panel BPC:8, Expected Dither:Disable
>    * Driver requirement: i915, xe
>    * Functionality: colorspace, kms_gem_interop
> @@ -257,7 +257,7 @@ igt_main
>   			       (tests[i].fb_bpc > tests[i].output_bpc) ?
>   							"Enable": "Disable");
>   
> -		igt_subtest_with_dynamic_f("FB-%dBPC-Vs-Panel-%dBPC",
> +		igt_subtest_with_dynamic_f("fb-%dbpc-vs-panel-%dbpc",
>   				tests[i].fb_bpc, tests[i].output_bpc)
>   			run_dither_test(&data,
>   					tests[i].fb_bpc,
