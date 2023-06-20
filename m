Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DD410E19C
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 22:28:21 +0000 (UTC)
Message-ID: <6b92bde7-a8ab-f40f-1975-748aff4d9914@amd.com>
Date: Tue, 20 Jun 2023 16:28:14 -0600
To: Hersen Wu <hersenxs.wu@amd.com>, igt-dev@lists.freedesktop.org,
 rodrigo.siqueira@amd.com, aurabindo.pillai@amd.com, stylon.wang@amd.com,
 hamza.mahfooz@amd.com
References: <20230620212035.147910-1-hersenxs.wu@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20230620212035.147910-1-hersenxs.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/amdgpu/amd_bypass: Skip test
 when DP Rx output bpc < 8 bpc
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2023-06-20 15:20, Hersen Wu wrote:
> Check DP or eDP Rx output bpc, skip test when output bpc is
> less than 8bpc.
> 
> This test compares CRC of CRTC and Rx. It needs both CRTC_CRC
> and Rx-CRC with 8bpc. If CRTC-CRC with 8bpc, but Rx-CRC with
> 6bpc, then their values  will not match.
> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>   tests/amdgpu/amd_bypass.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index d191779b0..d192a30ea 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -331,6 +331,13 @@ static void bypass_8bpc_test(data_t *data)
>   	igt_skip_on_f(igt_amd_read_dsc_clock_status(data->drm_fd, data->output->name) == 1,
>   		      "DSC enabled on %s and no sense to validate bypass mode\n", data->output->name);
>   
> +	/* 8bpc bypass only valid when DP or eDP Rx supports 8bpc or up. When
> +	 * Rx supports only up to 6bpc, Rx-crc will different from crtc-crc
> +	 * with 8bpc.
> +	 */
> +	igt_skip_on_f(igt_get_output_max_bpc(data->drm_fd, data->output->name) <= 6,
> +		      "check /sys/kernel/debug/dri/0/eDP-1 (connector)/output_bpc\n");
> +
>   	igt_create_fb(data->drm_fd, data->width, data->height,
>   		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
>   
