Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5B510E441
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 07:42:09 +0000 (UTC)
Message-ID: <cbf9442c-bec7-dcc6-1d6a-dd40d1f78359@intel.com>
Date: Tue, 5 Sep 2023 13:11:35 +0530
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230905052058.2216763-1-riana.tauro@intel.com>
 <20230905052058.2216763-3-riana.tauro@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20230905052058.2216763-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/xe: Add GT id to identify
 failures
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 9/5/2023 10:50 AM, Riana Tauro wrote:
> Add GT id to igt assertions in xe_guc_pc that
> checks if a GT is in a required C State.
> This helps to identify which GT is causing a failure.
>
> No functional changes.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel/xe_guc_pc.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
> index 032816921..151e6cb0a 100644
> --- a/tests/intel/xe_guc_pc.c
> +++ b/tests/intel/xe_guc_pc.c
> @@ -240,7 +240,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   
>   	if (gt_idle) {
>   		/* Wait for GT to go in C6 as previous get_freq wakes up GT*/
> -		igt_assert(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10));
> +		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
> +			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(get_freq(fd, gt_id, "act") == 0);
>   	} else {
>   		igt_assert(get_freq(fd, gt_id, "act") == rpn);
> @@ -252,7 +253,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
>   
>   	if (gt_idle) {
> -		igt_assert(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10));
> +		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
> +			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(get_freq(fd, gt_id, "act") == 0);
>   	} else {
>   		igt_assert(get_freq(fd, gt_id, "act") == rpe);
> @@ -269,7 +271,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   	igt_assert(get_freq(fd, gt_id, "cur") == rp0);
>   
>   	if (gt_idle) {
> -		igt_assert(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10));
> +		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
> +			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(get_freq(fd, gt_id, "act") == 0);
>   	}
>   
> @@ -301,7 +304,8 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
>   	igt_assert(rpn <= cur && cur <= rpe);
>   
>   	if (gt_idle) {
> -		igt_assert(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10));
> +		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
> +			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(get_freq(fd, gt_id, "act") == 0);
>   	} else {
>   		act = get_freq(fd, gt_id, "act");
> @@ -411,7 +415,8 @@ igt_main
>   
>   	igt_subtest("freq_fixed_idle") {
>   		xe_for_each_gt(fd, gt) {
> -			igt_require(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10));
> +			igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10),
> +				      "GT %d should be in C6\n", gt);
>   			test_freq_fixed(fd, gt, true);
>   		}
>   	}
> @@ -432,7 +437,8 @@ igt_main
>   
>   	igt_subtest("freq_range_idle") {
>   		xe_for_each_gt(fd, gt) {
> -			igt_require(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10));
> +			igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10),
> +				      "GT %d should be in C6\n", gt);
>   			test_freq_range(fd, gt, true);
>   		}
>   	}

lgtm,

Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
