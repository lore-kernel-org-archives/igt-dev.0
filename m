Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0606D6EAF0
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Mar 2021 07:58:08 +0000 (UTC)
References: <20210311070158.17638-1-nidhi1.gupta@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <aaf0a357-349a-6b8c-63fa-741b8cdb2667@intel.com>
Date: Thu, 11 Mar 2021 13:28:03 +0530
MIME-Version: 1.0
In-Reply-To: <20210311070158.17638-1-nidhi1.gupta@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_frontbuffer_tracking:
 modified subtest name
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Nidhi Gupta <nidhi1.gupta@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

LGTM

Reviewed-by:
Swati Sharma <swati2.sharma@intel.com>

On 11-Mar-21 12:31 PM, Nidhi Gupta wrote:
> Some platforms do not have support for mappable GTT, for those platforms
> subtests with draw method as mmap-gtt will be skipped, added mmap-gtt in
> the end of the subtests name which uses it as a draw method so that filtering
> of those subtests as expected skip will be easier while assessing results.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_frontbuffer_tracking.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
> index 14f522d8..2e74bec6 100644
> --- a/tests/kms_frontbuffer_tracking.c
> +++ b/tests/kms_frontbuffer_tracking.c
> @@ -3411,10 +3411,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		    (t.feature & FEATURE_FBC) == 0)
>   			continue;
>   
> -		igt_subtest_f("%s-%s-%s-fliptrack",
> +		igt_subtest_f("%s-%s-%s-fliptrack-%s",
>   			      feature_str(t.feature),
>   			      pipes_str(t.pipes),
> -			      fbs_str(t.fbs))
> +			      fbs_str(t.fbs),
> +			      igt_draw_get_method_name(t.method))
>   			fliptrack_subtest(&t, FLIP_PAGEFLIP);
>   	TEST_MODE_ITER_END
>   
> @@ -3479,7 +3480,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		    t.method != IGT_DRAW_MMAP_GTT)
>   			continue;
>   
> -		igt_subtest_f("%s-farfromfence", feature_str(t.feature))
> +		igt_subtest_f("%s-farfromfence-%s",
> +			      feature_str(t.feature),
> +			      igt_draw_get_method_name(t.method))
>   			farfromfence_subtest(&t);
>   	TEST_MODE_ITER_END
>   
> 

-- 
~Swati Sharma
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
