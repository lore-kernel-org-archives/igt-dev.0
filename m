Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58026E9C1
 for <igt-dev@lists.freedesktop.org>; Tue, 11 May 2021 06:02:32 +0000 (UTC)
References: <20210508162303.8235-1-bhanuprakash.modem@intel.com>
 <20210508162303.8235-7-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <b822534d-76d5-b9ae-ebd8-f1c7c03659a6@intel.com>
Date: Tue, 11 May 2021 11:32:26 +0530
MIME-Version: 1.0
In-Reply-To: <20210508162303.8235-7-bhanuprakash.modem@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [v5 i-g-t 06/14] tests/kms_plane_scaling: Fix mode
 selection for 2x tests
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
>   tests/kms_plane_scaling.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 34efc588e..7464b5bdf 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -630,9 +630,6 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
>   	d->plane3 = igt_output_get_plane(output2, 0);
>   	d->plane4 = get_num_scalers(d, pipe2) >= 2 ? igt_output_get_plane(output2, 1) : NULL;
>   
> -	mode1 = igt_output_get_mode(output1);
> -	mode2 = igt_output_get_mode(output2);
> -
>   	igt_skip_on(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888,
>   						tiling));
>   
> @@ -658,8 +655,20 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
>   	igt_plane_set_fb(d->plane3, &d->fb[2]);
>   	if (d->plane4)
>   		igt_plane_set_fb(d->plane4, &d->fb[3]);
> +
> +	if (igt_display_try_commit_atomic(display,
> +				DRM_MODE_ATOMIC_TEST_ONLY |
> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL) != 0) {
> +		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
> +		igt_require_f(found, "No valid mode combo found.\n");
> +	}
> +
>   	igt_display_commit2(display, COMMIT_ATOMIC);

As discussed in previous patches, this commit should be part of else block.

Also commit message can be modified for general 2x cases.

Other than that patch looks good to me.

With above fixed:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>   
> +	mode1 = igt_output_get_mode(output1);
> +	mode2 = igt_output_get_mode(output2);
> +
>   	/* Upscaling Primary */
>   	igt_plane_set_size(d->plane1, mode1->hdisplay, mode1->vdisplay);
>   	igt_plane_set_size(d->plane3, mode2->hdisplay, mode2->vdisplay);
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
