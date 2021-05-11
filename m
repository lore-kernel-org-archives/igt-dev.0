Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9E4893BC
 for <igt-dev@lists.freedesktop.org>; Tue, 11 May 2021 09:30:14 +0000 (UTC)
References: <20210508162303.8235-1-bhanuprakash.modem@intel.com>
 <20210508162303.8235-8-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <bdb31162-956f-b8c7-bbff-deaaf60b7f0c@intel.com>
Date: Tue, 11 May 2021 15:00:03 +0530
MIME-Version: 1.0
In-Reply-To: <20210508162303.8235-8-bhanuprakash.modem@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [v5 i-g-t 07/14] tests/kms_atomic_transition: Fix
 mode selection for 2x tests
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 5/8/2021 9:52 PM, Bhanuprakash Modem wrote:
> When two monitors connected through MST, the second monitor also
> tries to use the same mode. So two such modes may not fit into the
> link bandwidth.
>
> This patch will find a combination of modes that fit into the BW.
>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_atomic_transition.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index be60940d7..e6931de5f 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -100,6 +100,7 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
>   	igt_plane_set_fb(primary, NULL);
>   	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_remove_fb(data->drm_fd, &fb);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);


Is this commit required? I guess it was working earlier.

>   }
>   
>   static void *fence_inc_thread(void *arg)
> @@ -793,6 +794,7 @@ static void run_modeset_tests(data_t *data, int howmany, bool nonblocking, bool
>   	for (i = 0; i < data->display.n_outputs; i++)
>   		igt_output_set_pipe(&data->display.outputs[i], PIPE_NONE);
>   
> +retry:
>   	for_each_connected_output(&data->display, output) {
>   		drmModeModeInfo *mode = igt_output_get_mode(output);
>   
> @@ -839,6 +841,19 @@ static void run_modeset_tests(data_t *data, int howmany, bool nonblocking, bool
>   
>   	iter_max = 1 << j;

I think this line must be after the try commit block.

In case of retry we will count double the pipes, as j is initialized 
only in the beginning.


>   
> +	if (igt_display_try_commit_atomic(&data->display,
> +				DRM_MODE_ATOMIC_TEST_ONLY |
> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL) != 0) {
> +		igt_output_t *out;
> +		bool found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
> +		igt_require_f(found, "No valid mode combo found.\n");
> +
> +		for_each_connected_output(&data->display, out)
> +			igt_output_set_pipe(out, PIPE_NONE);
> +
> +		goto retry;
> +	}
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);

As discussed earlier, commit to be in the else block.


Regards,

Ankit

>   
>   	for (i = 0; i < iter_max; i++) {
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
