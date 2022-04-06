Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2068.outbound.protection.outlook.com [40.107.100.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533F910E110
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 22:24:49 +0000 (UTC)
Message-ID: <183da466-52ea-b42f-7009-97d781061334@amd.com>
Date: Wed, 6 Apr 2022 18:25:13 -0400
Content-Language: en-US
To: David Zhang <dingchen.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20220405142434.40630-1-dingchen.zhang@amd.com>
 <20220405142434.40630-2-dingchen.zhang@amd.com>
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20220405142434.40630-2-dingchen.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] tests/amdgpu/amd_psr: add interactive
 option of PSR visual confirm
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-04-05 10:24, David Zhang wrote:
> [why & how]
> AMDGPU DM debugfs provides a debug option of PSR visual confirm,
> we'd make it an interactive option that provides capability to
> usermode to choose if or not to enable the PSR visual confirm.
> 
> - add interactive option "visual-confirm" and by-default we select
>    it as TRUE to enable visual confirm for PSR-SU test cases.
> - set PSR visual confirm debugfs if interactive debug option of
>    visual confirm set before any test run begins, and reset after
>    any test run ends.
> 
> Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Jay Pillai <aurabindo.pillai@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> 
> Signed-off-by: David Zhang <dingchen.zhang@amd.com>
> ---
>   tests/amdgpu/amd_psr.c | 44 ++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index d21d41e3..e70c07cb 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -62,6 +62,12 @@ typedef struct data {
>   	int h;
>   } data_t;
>   
> +struct {
> +	bool visual_confirm;
> +} opt = {
> +	.visual_confirm = true,	/* visual confirm debug option */
> +};
> +
>   static void draw_color_alpha(igt_fb_t *fb, int x, int y, int w, int h,
>   		             double r, double g, double b, double a)
>   {
> @@ -312,10 +318,31 @@ static void run_check_psr_su_mpo(data_t *data)
>   	for (int i = 0; i < N_MPO_TEST_RECT_FB; ++i)
>   		igt_remove_fb(data->fd, &rect_fb[i]);
>   	test_fini(data);
> -	close(data->fd);
>   }
>   
> -igt_main
> +const char *help_str =
> +"  --visual-confirm           PSR visual confirm debug option enable\n";
> +
> +struct option long_options[] = {
> +	{"visual-confirm",	optional_argument, NULL, 'v'},
> +	{ 0, 0, 0, 0 }
> +};
> +
> +static int opt_handler(int option, int option_index, void *data)
> +{
> +	switch (option) {
> +	case 'v':
> +		opt.visual_confirm = strtol(optarg, NULL, 0);
> +		igt_info(" PSR Visual Confirm %s\n", opt.visual_confirm ? "enabled" : "disabled");
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +igt_main_args("", long_options, help_str, opt_handler, NULL)
>   {
>   	data_t data;
>   
> @@ -333,6 +360,15 @@ igt_main
>   		igt_display_require(&data.display, data.fd);
>   		igt_require(&data.display.is_atomic);
>   		igt_display_require_output(&data.display);
> +
> +		/* check if visual confirm option available */
> +		if (opt.visual_confirm) {
> +			igt_skip_on(!igt_amd_dm_has_visual_confirm(data.fd));
> +			igt_skip_on_f(!igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_PSR),
> +			      "set PSR visual confirm failed\n");
nit: Align with previous line's opening brace

> +			/* double check set to PSR vc */
> +			igt_require(igt_amd_dm_get_visual_confirm(data.fd) == VISUAL_CONFIRM_PSR);
Is this required? I would expect set_visual_confirm() to return error if 
anything unexpected occurs.

> +		}
>   	}
>   
>   	igt_describe("Test whether PSR can be enabled with static screen");
> @@ -347,6 +383,10 @@ igt_main
>   
>   	igt_fixture
>   	{
> +		if (opt.visual_confirm) {
> +			igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE);
> +			igt_require(igt_amd_dm_get_visual_confirm(data.fd) == VISUAL_CONFIRM_DISABLE);
Ditto, could we igt_require(igt_amd_dm_set_visual_confirm(...)); instead?

Thanks,
Leo
> +		}
>   		close(data.debugfs_fd);
>   		igt_display_fini(&data.display);
>   	}
