Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FEA10E3E7
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 16:57:26 +0000 (UTC)
Message-ID: <c33b3960-4a45-3e97-6728-26eabc4f36ec@quicinc.com>
Date: Tue, 8 Aug 2023 09:57:21 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
References: <20230808145334.24277-1-robdclark@gmail.com>
 <20230808145334.24277-2-robdclark@gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230808145334.24277-2-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 2/2] tests/kms_plane: Skip QCOM_COMPRESSED
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 8/8/2023 7:53 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We don't know how to generate valid compressed/UBWC data in igt, so
> don't try.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

> ---
>   tests/kms_plane.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index a444cdca23e2..8e7dc75d349c 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1011,6 +1011,11 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>   		    f.modifier != DRM_FORMAT_MOD_LINEAR)
>   			continue;
>   
> +		/* igt doesn't know how to sw generate UBWC: */
> +		if (is_msm_device(data->drm_fd) &&
> +		    f.modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
> +			continue;
> +
>   		if (f.format == ref.format &&
>   		    f.modifier == ref.modifier)
>   			continue;
