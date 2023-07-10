Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389A310E2AF
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 17:16:47 +0000 (UTC)
Message-ID: <98563e34-c1bd-f25c-dcaa-32701b9c5eca@amd.com>
Date: Mon, 10 Jul 2023 11:16:42 -0600
Content-Language: en-US
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
References: <20230710075749.2377896-1-chiahsuan.chung@amd.com>
 <20230710075749.2377896-4-chiahsuan.chung@amd.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20230710075749.2377896-4-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t,
 v4 3/8] tests/amdgpu/amd_freesync_video_mode: Fix wrong resolution
 setting during the test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2023-07-10 01:57, Tom Chung wrote:
> [Why]
> Some monitors may have different resolution for non-Freesync video mode and it may
> cause the IGT test set to a wrong resolution during the test.
> 
> [How]
> Check the resolution and use the same one during select the video mode.
> 
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
>   tests/amdgpu/amd_freesync_video_mode.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
> index be1bf4944..29ba1f65c 100644
> --- a/tests/amdgpu/amd_freesync_video_mode.c
> +++ b/tests/amdgpu/amd_freesync_video_mode.c
> @@ -421,10 +421,11 @@ static drmModeModeInfo *select_mode(
>   	case FSV_NON_FREESYNC_VIDEO_MODE:
>   		for (i = 0; i < data->count_modes; i++) {
>   			mode = &data->modes[i];
> -			if (mode->vrefresh == refresh_rate &&
> -			    !is_freesync_video_mode(data, mode)) {
> +			if (mode->hdisplay == data->hdisplay &&
> +				mode->vdisplay == data->vdisplay &&
> +				mode->vrefresh == refresh_rate &&
> +				!is_freesync_video_mode(data, mode))
>   				break;
> -			}
>   		}
>   		if (i >= data->count_modes)
>   			mode = NULL;
