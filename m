Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD47510E021
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 17:16:58 +0000 (UTC)
Message-ID: <ffb077c5-48d9-189f-d688-a18999bc5903@amd.com>
Date: Thu, 14 Apr 2022 13:16:48 -0400
Content-Language: en-US
To: David Zhang <dingchen.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20220412192139.1530645-1-dingchen.zhang@amd.com>
 <20220412192139.1530645-4-dingchen.zhang@amd.com>
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20220412192139.1530645-4-dingchen.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 3/3] tests/amdgpu/amd_psr: define reusable
 wrapper for PSR support check
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




On 2022-04-12 15:21, David Zhang wrote:
> [why & how]
> For amdgpu PSR-SU test cases, we'd first check if the sink device
> and amdgpu driver support the PSR-SU feature at the beginning. We
> define a local helper to wrap the check for PSR-SU support from
> sink and driver as well and called by both MPO and FFU test case,
> to avoid the code repetition.
> 
> Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Jay Pillai <aurabindo.pillai@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> 
> Signed-off-by: David Zhang <dingchen.zhang@amd.com>
> ---
>   tests/amdgpu/amd_psr.c | 40 ++++++++++++++++++++++++----------------
>   1 file changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index 92628fee..e7614d71 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -138,6 +138,28 @@ static int check_conn_type(data_t *data, uint32_t type) {
>   	return -1;
>   }
>   
> +static bool psr_su_supported(data_t *data)
> +{
> +	/* run PSR-SU test i.i.f. eDP panel and kernel driver both support PSR-SU */
> +	if (!igt_amd_output_has_psr_cap(data->fd, data->output->name))
> +		return false;
> +
> +	if (!igt_amd_output_has_psr_state(data->fd, data->output->name))
> +		return false;
> +

Would be good to igt_warn on the above checks too, so the reason for
skipping is clear.

> +	if (!igt_amd_psr_support_sink(data->fd, data->output->name, PSR_MODE_2)) {
> +		igt_info(" output %s not support PSR-SU\n", data->output->name);

Consider using igt_warn()

With those addressed,

Reviewed-by: Leo Li <sunpeng.li@amd.com>

Thanks,
Leo

> +		return false;
> +	}
> +
> +	if (!igt_amd_psr_support_drv(data->fd, data->output->name, PSR_MODE_2)) {
> +		igt_info(" kernel driver not support PSR-SU\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   static void run_check_psr(data_t *data, bool test_null_crtc) {
>   	int fd, edp_idx, dp_idx, ret, i, psr_state;
>   	igt_fb_t ref_fb, ref_fb2;
> @@ -217,8 +239,6 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
>   static void run_check_psr_su_mpo(data_t *data)
>   {
>   	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> -	bool sink_support_psrsu = false;
> -	bool drv_suport_psrsu = false;
>   	igt_fb_t ov_fb;		// fb for overlay
>   	igt_fb_t rect_fb[N_MPO_TEST_RECT_FB]; 	// rectangle fbs for primary, emulate as video playback region
>   	igt_fb_t ref_fb;	// reference fb
> @@ -235,12 +255,7 @@ static void run_check_psr_su_mpo(data_t *data)
>   	frame_rate = data->mode->vrefresh;
>   
>   	/* run the test i.i.f. eDP panel supports and kernel driver both support PSR-SU  */
> -	igt_skip_on(!igt_amd_output_has_psr_cap(data->fd, data->output->name));
> -	igt_skip_on(!igt_amd_output_has_psr_state(data->fd, data->output->name));
> -	sink_support_psrsu = igt_amd_psr_support_sink(data->fd, data->output->name, PSR_MODE_2);
> -	igt_skip_on_f(!sink_support_psrsu, "output %s not support PSR-SU\n", data->output->name);
> -	drv_suport_psrsu = igt_amd_psr_support_drv(data->fd, data->output->name, PSR_MODE_2);
> -	igt_skip_on_f(!drv_suport_psrsu, "kernel driver not support PSR-SU\n");
> +	igt_skip_on(!psr_su_supported(data));
>   
>   	/* reference background pattern in grey */
>   	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> @@ -338,8 +353,6 @@ static void panning_rect_fb(data_t *data, igt_fb_t *rect_fb, int rect_w, int rec
>   static void run_check_psr_su_ffu(data_t *data)
>   {
>   	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> -	bool sink_support_psrsu = false;
> -	bool drv_suport_psrsu = false;
>   	igt_fb_t rect_fb; 	// rectangle fbs for primary
>   	igt_fb_t ref_fb;	// reference fb
>   	int pb_w, pb_h, ob_w, ob_h;
> @@ -355,12 +368,7 @@ static void run_check_psr_su_ffu(data_t *data)
>   	pb_h = data->h / 2;
>   
>   	/* run the test i.i.f. eDP panel supports and kernel driver both support PSR-SU  */
> -	igt_skip_on(!igt_amd_output_has_psr_cap(data->fd, data->output->name));
> -	igt_skip_on(!igt_amd_output_has_psr_state(data->fd, data->output->name));
> -	sink_support_psrsu = igt_amd_psr_support_sink(data->fd, data->output->name, PSR_MODE_2);
> -	igt_skip_on_f(!sink_support_psrsu, "output %s not support PSR-SU\n", data->output->name);
> -	drv_suport_psrsu = igt_amd_psr_support_drv(data->fd, data->output->name, PSR_MODE_2);
> -	igt_skip_on_f(!drv_suport_psrsu, "kernel driver not support PSR-SU\n");
> +	igt_skip_on(!psr_su_supported(data));
>   
>   	/* reference background pattern in grey */
>   	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
