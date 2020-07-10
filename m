Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366376EC43
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2020 13:12:46 +0000 (UTC)
References: <20200630132419.4091-1-stanislav.lisovskiy@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <f067c7eb-df2a-e5f4-efdf-551682c30790@intel.com>
Date: Fri, 10 Jul 2020 18:42:41 +0530
MIME-Version: 1.0
In-Reply-To: <20200630132419.4091-1-stanislav.lisovskiy@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2] igt/tests: Clear pipes properly in
 kms_atomic_transition
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, lakshminarayana.vudum@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Thanks for the patch. Pushed.
There is regression seen in kms_vblank; but its not related to changes 
in the patch.
@lakshmi can you please re-report?

On 30-Jun-20 6:54 PM, Stanislav Lisovskiy wrote:
> There is an issue happening from time to time in kms_atomic_transition
> (bug #1918). We periodically get assertion that some two outputs
> attempt to use same pipe like this:
> 
> "Failed assertion: output->pending_pipe != b->pending_pipe"
> 
> After some investigation came to conclusion that this is happening
> because we are calling igt_output_set_pipe(output, PIPE_NONE) only
> for connected outputs, which is wrong.
> Periodically igt_display_refresh/igt_output_refresh call calls can
> update the output state to disconnected. However that doesn't clear
> the pipe being assigned(i.e output->pending_pipe).
> So this causes assertion to be triggered on next igt_display_refresh
> called during commit.
> 
> Bugzilla: https://gitlab.freedesktop.org/drm/intel/-/issues/1918
> 
> v2: - Do not use for_each_valid_output_on_pipe as it also iterates
>        only on connected outputs(Maarten)
>      - Also fix run_modeset_tests function
> 
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---
>   tests/kms_atomic_transition.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 754a4969..656bd51e 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -664,9 +664,10 @@ static unsigned set_combinations(igt_display_t *display, unsigned mask, struct i
>   	igt_output_t *output;
>   	enum pipe pipe;
>   	unsigned event_mask = 0;
> +	int i;
>   
> -	for_each_connected_output(display, output)
> -		igt_output_set_pipe(output, PIPE_NONE);
> +	for (i = 0; i < display->n_outputs; i++)
> +		igt_output_set_pipe(&display->outputs[i], PIPE_NONE);
>   
>   	for_each_pipe(display, pipe) {
>   		igt_plane_t *plane = igt_pipe_get_plane_type(&display->pipes[pipe],
> @@ -743,11 +744,12 @@ static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblock
>   	igt_output_t *output;
>   	unsigned width = 0, height = 0;
>   
> +	for (i = 0; i < display->n_outputs; i++)
> +		igt_output_set_pipe(&display->outputs[i], PIPE_NONE);
> +
>   	for_each_connected_output(display, output) {
>   		drmModeModeInfo *mode = igt_output_get_mode(output);
>   
> -		igt_output_set_pipe(output, PIPE_NONE);
> -
>   		width = max(width, mode->hdisplay);
>   		height = max(height, mode->vdisplay);
>   	}
> 

-- 
~Swati Sharma
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
