Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8957389D5B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Dec 2020 04:56:49 +0000 (UTC)
References: <20201214035812.8224-1-nidhi1.gupta@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <cc34e464-b8fa-3835-9b6d-ce49c5fc052d@intel.com>
Date: Mon, 14 Dec 2020 10:26:43 +0530
MIME-Version: 1.0
In-Reply-To: <20201214035812.8224-1-nidhi1.gupta@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] Added dynamic Subtest
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 12/14/2020 9:28 AM, Nidhi Gupta wrote:
> In kms_atomic_transition subtest,it will test all the
> pipes defined in IGT, i.e. IGT_MAX_PIPES whether
> the output is available or not.Later it has to be
> analysed and discard it as valid skip.To save this
> time, updated in test to first check the available
> outputs and then execute the test.
>
> V7: -Modified commit message. (Karthik)
>      -Replaced for_each_single_pipe_with_single__output with
>       for_each_connected_output to execute the test only on
>       connected display. (Karthik)
>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_atomic_transition.c | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index a71bbe10..fcc093d3 100644
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
> @@ -1024,18 +1024,22 @@ igt_main
>   		for_each_pipe_with_valid_output(&display, pipe, output)
>   			run_transition_test(&display, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
>   
> -	for (i = 1; i <= IGT_MAX_PIPES; i++) {
> -		igt_subtest_f("%ix-modeset-transitions", i)
> -			run_modeset_transition(&display, i, false, false);
> +	igt_subtest_with_dynamic("modeset-transitions") {
> +		for_each_connected_output(&display, output)
> +			count++;

Please add a blank line here before the next loop.

With this, the patch looks good to me.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

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
