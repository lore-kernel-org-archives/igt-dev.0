Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DB76E89D
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Feb 2021 12:02:27 +0000 (UTC)
Date: Mon, 8 Feb 2021 14:02:27 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YCEoU8Qe3TVLqyim@platvala-desk.ger.corp.intel.com>
References: <20210208111939.20501-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208111939.20501-1-nidhi1.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_atomic_transition:restrict
 execution to 2 pipes
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
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 08, 2021 at 04:49:39PM +0530, Nidhi Gupta wrote:
> In multi display scenario the problem  is that subtest will get
> executed on single output twise and exit, do not execute the test
> on the other outputs, so now the value of pipe_count variable will
> depend on the number of outputs connected so the subtest is executed
> on all the outputs.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>

The subjectline

Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_atomic_transition:restrict execution to 2 pipes

doesn't quite match the patch. "Correctly restrict --" ?


-- 
Petri Latvala


> ---
>  tests/kms_atomic_transition.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index c3601ae9..e75cc637 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -995,7 +995,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_subtest("plane-primary-toggle-with-vblank-wait")
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>  				break;
>  			pipe_count++;
>  			run_primary_test(&data, pipe, output);
> @@ -1004,7 +1004,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_subtest_with_dynamic("plane-all-transition") {
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>  				break;
>  			pipe_count++;
>  			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> @@ -1014,7 +1014,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_subtest_with_dynamic("plane-all-transition-fencing") {
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>  				break;
>  			pipe_count++;
>  			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> @@ -1024,7 +1024,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_subtest_with_dynamic("plane-all-transition-nonblocking") {
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>  				break;
>  			pipe_count++;
>  			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> @@ -1034,7 +1034,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_subtest_with_dynamic("plane-all-transition-nonblocking-fencing") {
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>  				break;
>  			pipe_count++;
>  			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> @@ -1044,7 +1044,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind") {
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>  				break;
>  			pipe_count++;
>  			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> @@ -1054,7 +1054,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind-fencing") {
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>  				break;
>  			pipe_count++;
>  			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> @@ -1069,7 +1069,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  	 */
>  	igt_subtest_with_dynamic("plane-all-modeset-transition")
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>  				break;
>  			pipe_count++;
>  			if (output_is_internal_panel(output))
> @@ -1081,7 +1081,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing")
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>  				break;
>  			pipe_count++;
>  			if (output_is_internal_panel(output))
> @@ -1093,7 +1093,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_subtest_with_dynamic("plane-all-modeset-transition-internal-panels") {
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>  				break;
>  			pipe_count++;
>  			if (!output_is_internal_panel(output))
> @@ -1106,7 +1106,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing-internal-panels") {
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>  				break;
>  			pipe_count++;
>  			if (!output_is_internal_panel(output))
> @@ -1119,7 +1119,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_subtest("plane-toggle-modeset-transition")
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			if (pipe_count >= 2 && !data.extended)
> +			if (pipe_count == 2 * count && !data.extended)
>  				break;
>  			pipe_count++;
>  			run_transition_test(&data, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
> -- 
> 2.26.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
