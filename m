Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D80A6E049
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Feb 2021 12:14:25 +0000 (UTC)
References: <20210205100300.5188-1-nidhi1.gupta@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <932396d4-f682-c019-1cf1-9c43dd599b25@intel.com>
Date: Fri, 5 Feb 2021 17:44:19 +0530
MIME-Version: 1.0
In-Reply-To: <20210205100300.5188-1-nidhi1.gupta@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_Atomic_transition: Restrict
 execution to 2 pipes
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

On 2/5/2021 3:33 PM, Nidhi Gupta wrote:
> To reduce the execution time, restricting the execution of the
> test to only 2 pipes

Hi,

Please add details regarding the bug we're seeing in multiple display 
set ups, because of which this change is required.

>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_atomic_transition.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index c3601ae9..de29f758 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -991,11 +991,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   		for_each_connected_output(&data.display, output)
>   			count++;
> +

Please remove this blank line.

With these minor changes, this patch looks good to me.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Thanks,

Karthik.B.S

>   	}
>   
>   	igt_subtest("plane-primary-toggle-with-vblank-wait")
>   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>   				break;
>   			pipe_count++;
>   			run_primary_test(&data, pipe, output);
> @@ -1004,7 +1005,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_subtest_with_dynamic("plane-all-transition") {
>   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>   				break;
>   			pipe_count++;
>   			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> @@ -1014,7 +1015,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_subtest_with_dynamic("plane-all-transition-fencing") {
>   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>   				break;
>   			pipe_count++;
>   			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> @@ -1024,7 +1025,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_subtest_with_dynamic("plane-all-transition-nonblocking") {
>   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>   				break;
>   			pipe_count++;
>   			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> @@ -1034,7 +1035,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_subtest_with_dynamic("plane-all-transition-nonblocking-fencing") {
>   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>   				break;
>   			pipe_count++;
>   			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> @@ -1044,7 +1045,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind") {
>   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>   				break;
>   			pipe_count++;
>   			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> @@ -1054,7 +1055,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind-fencing") {
>   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>   				break;
>   			pipe_count++;
>   			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> @@ -1069,7 +1070,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	 */
>   	igt_subtest_with_dynamic("plane-all-modeset-transition")
>   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>   				break;
>   			pipe_count++;
>   			if (output_is_internal_panel(output))
> @@ -1081,7 +1082,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing")
>   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>   				break;
>   			pipe_count++;
>   			if (output_is_internal_panel(output))
> @@ -1093,7 +1094,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_subtest_with_dynamic("plane-all-modeset-transition-internal-panels") {
>   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>   				break;
>   			pipe_count++;
>   			if (!output_is_internal_panel(output))
> @@ -1106,7 +1107,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing-internal-panels") {
>   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>   				break;
>   			pipe_count++;
>   			if (!output_is_internal_panel(output))
> @@ -1119,7 +1120,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_subtest("plane-toggle-modeset-transition")
>   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>   				break;
>   			pipe_count++;
>   			run_transition_test(&data, pipe, output, TRANSITION_MODESET_DISABLE, false, false);


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
