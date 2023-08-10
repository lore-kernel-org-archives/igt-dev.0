Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6F610E1E3
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 17:18:08 +0000 (UTC)
Message-ID: <27fac926-8eb5-324a-a33e-fb083335de18@quicinc.com>
Date: Thu, 10 Aug 2023 10:17:59 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>, <igt-dev@lists.freedesktop.org>
References: <20230809-kms-plane-fix-v2-1-314eb86af313@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230809-kms-plane-fix-v2-1-314eb86af313@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_plane: Skip plane position
 test if primary ID > sprite ID
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



On 8/9/2023 3:24 PM, Jessica Zhang wrote:
> Currently, IGT assumes that the primary plane in
> test_plane_position_with_output() will always be committed under the
> sprite plane. This will not always hold true if the plane_id of the
> primary plane is greater than the plane_id of the sprite as the DRM
> framework will calculate a higher normalized-zpos for planes with larger
> plane_id's if the zpos property isn't set [1].
> 
> Since this is a non-atomic test, we won't be able to explicitly set the
> zpos property. So instead, skip testing the plane position test output for
> cases where the primary plane ID is greater than the sprite plane ID
> 
> [1] https://elixir.bootlin.com/linux/v6.5-rc5/source/drivers/gpu/drm/drm_blend.c#L431
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
> Changes in v2:
> - Mention that plane-position-* is a non-atomic test
> ---
>   tests/kms_plane.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 67cff61d6cd1..15116b33b764 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -225,6 +225,12 @@ test_plane_position_with_output(data_t *data,
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	sprite = igt_output_get_plane(output, plane);
>   
> +	if (primary->drm_plane->plane_id > sprite->drm_plane->plane_id) {
> +		igt_info("primary plane ID (%d) > sprite plane ID (%d), skipping plane %d\n",
> +				primary->drm_plane->plane_id, sprite->drm_plane->plane_id, plane);
> +		return;
> +	}
> +
>   	create_fb_for_mode(data, mode, &green, &rect, 1, &primary_fb);
>   	igt_plane_set_fb(primary, &primary_fb);
>   
> 
> ---
> base-commit: f12c2533941c9dfce43f455a02b7986605692b29
> change-id: 20230808-kms-plane-fix-8b4e489e78b1
> 
> Best regards,
