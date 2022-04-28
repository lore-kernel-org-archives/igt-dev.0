Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2F010E085
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Apr 2022 21:58:33 +0000 (UTC)
Message-ID: <83971e57-35b0-87ad-70de-aca64cd59217@amd.com>
Date: Thu, 28 Apr 2022 17:58:30 -0400
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20220415003328.514267-1-alex.hung@amd.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220415003328.514267-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] tests/kms_panel_fitting: Use 800x600 as
 lowest resolution for AMD devices
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



On 2022-04-14 20:33, Alex Hung wrote:
> 800x600 is lowest resolution for recent AMD devices.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   tests/kms_panel_fitting.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> index 6c1b748d..7ed0d196 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -107,8 +107,13 @@ static void test_panel_fitting(data_t *d)
>   				      DRM_FORMAT_MOD_LINEAR, &d->fb2);
>   
>   		/* Set up display to enable panel fitting */
> -		mode->hdisplay = 640;
> -		mode->vdisplay = 480;
> +		if (is_amdgpu_device(display->drm_fd)) {
> +			mode->hdisplay = 800;
> +			mode->vdisplay = 600;
> +		} else {
> +			mode->hdisplay = 640;
> +			mode->vdisplay = 480;
> +		}
>   		d->plane1 = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   		prepare_crtc(d, output, pipe, d->plane1, mode, COMMIT_LEGACY);
>   

Reviewed-by: Rodrigo.Siqueira <Rodrigo.Siqueira@amd.com>
