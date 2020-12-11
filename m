Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF576ED11
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Dec 2020 09:48:06 +0000 (UTC)
References: <20201124094149.1004-1-nidhi1.gupta@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <755a68ba-74a5-5b7c-fbbb-b15be243b172@intel.com>
Date: Fri, 11 Dec 2020 15:18:00 +0530
MIME-Version: 1.0
In-Reply-To: <20201124094149.1004-1-nidhi1.gupta@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v5] Added dynamic Subtest
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
To: nidhi1.gupta@intel.com, igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 11/24/2020 3:11 PM, nidhi1.gupta@intel.com wrote:
> From: Nidhi Gupta <nidhi1.gupta@intel.com>
>
> In kms_atomic_transition subtest will test all the
> pipes defined in IGT which is 6 weather the output

Typo. 'weather'.

Also, please quote IGT_MAX_PIPES instead of quoting it as '6'.

> is available or not.Later it has to be analysed and
> discard it as valid skip.To save this time updated
> in test to first check the available outputs and
> then execute the test.
>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_atomic_transition.c | 25 +++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index a71bbe10..8d5739df 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -918,7 +918,7 @@ igt_main
>   	igt_display_t display;
>   	igt_output_t *output;
>   	enum pipe pipe;
> -	int i;
> +	int i, count = 0;
>   
>   	igt_fixture {
>   		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -1024,18 +1024,23 @@ igt_main
>   		for_each_pipe_with_valid_output(&display, pipe, output)
>   			run_transition_test(&display, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
>   
> -	for (i = 1; i <= IGT_MAX_PIPES; i++) {
> -		igt_subtest_f("%ix-modeset-transitions", i)
> -			run_modeset_transition(&display, i, false, false);
> +	igt_subtest_with_dynamic("modeset-transitions") {
> +		for_each_pipe_with_single_output(&display, pipe, output) {

This will still list subtests until 4x- even if only one output is 
connected, and not serve the required purpose.

Please use 'for_each_connected_output' instead.

> +			count++;
> +		}

You can remove these braces as we've just one line.

Thanks,

Karthik.B.S

> +		for (i = 1; i <= count; i++) {
> +			igt_dynamic_f("%ix-modeset-transitions", i)
> +				run_modeset_transition(&display, i, false, false);
>   
> -		igt_subtest_f("%ix-modeset-transitions-nonblocking", i)
> -			run_modeset_transition(&display, i, true, false);
> +			igt_dynamic_f("%ix-modeset-transitions-nonblocking", i)
> +				run_modeset_transition(&display, i, true, false);
>   
> -		igt_subtest_f("%ix-modeset-transitions-fencing", i)
> -			run_modeset_transition(&display, i, false, true);
> +			igt_dynamic_f("%ix-modeset-transitions-fencing", i)
> +				run_modeset_transition(&display, i, false, true);
>   
> -		igt_subtest_f("%ix-modeset-transitions-nonblocking-fencing", i)
> -			run_modeset_transition(&display, i, true, true);
> +			igt_dynamic_f("%ix-modeset-transitions-nonblocking-fencing", i)
> +				run_modeset_transition(&display, i, true, true);
> +		}
>   	}
>   
>   	igt_fixture {


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
