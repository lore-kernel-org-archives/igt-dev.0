Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87B56E190
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2020 11:32:11 +0000 (UTC)
Date: Thu, 23 Jul 2020 14:32:09 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200723113209.GV20883@platvala-desk.ger.corp.intel.com>
References: <20200723111615.1933636-1-arkadiusz.hiler@intel.com>
 <20200723111615.1933636-2-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723111615.1933636-2-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915_pm_lpsp: Fix compilation
 warning
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jul 23, 2020 at 02:16:15PM +0300, Arkadiusz Hiler wrote:
> ... and make the test do what it claims to be doing.
> 
> The test needs all outputs to be disabled, but it was iterating with
> for_each_pipe_with_single_output, which iterates over pipes and tries
> to match them with some output. This may lead to us not iterating over
> all the outputs in some circumstances.
> 
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Is it time to implement for_each_output?


> ---
>  tests/i915/i915_pm_lpsp.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
> index e9a59307..4a187810 100644
> --- a/tests/i915/i915_pm_lpsp.c
> +++ b/tests/i915/i915_pm_lpsp.c
> @@ -82,12 +82,10 @@ static bool dmc_supported(int debugfs)
>   */
>  static void screens_disabled_subtest(data_t *data)
>  {
> -	igt_output_t *output;
>  	int valid_output = 0;
> -	enum pipe pipe;
>  
> -	for_each_pipe_with_single_output(&data->display, pipe, output) {
> -		data->output = output;
> +	for (int i = 0; i < data->display.n_outputs; i++) {
> +		data->output = &data->display.outputs[i];
>  		igt_output_set_pipe(data->output, PIPE_NONE);
>  		igt_display_commit(&data->display);
>  		valid_output++;
> -- 
> 2.25.4
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
