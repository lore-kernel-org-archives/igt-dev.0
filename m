Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A904010E1FD
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 16:56:09 +0000 (UTC)
Message-ID: <37400473-1d0b-e001-c2c9-e306c63e52d8@quicinc.com>
Date: Tue, 8 Aug 2023 09:55:59 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
References: <20230808145334.24277-1-robdclark@gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230808145334.24277-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 1/2] tests/kms_plane: Handle hw without legacy
 gamma support
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
> Skip the legacy gamma on hw that doesn't support it, instead of failing.
> The legacy LUT support was used to drop the precision down to 6 bits, to
> paper over errors introduced y RGB<->YCbCr conversion, but this isn't
> necessarily needed on all hw.
> 
> v2: igt_require(lut_size > 0) instead
> v3: simplify patch
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

> ---
>   tests/kms_plane.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 67cff61d6cd1..a444cdca23e2 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -469,6 +469,10 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
>   	lut_size = crtc->gamma_size;
>   	drmModeFreeCrtc(crtc);
>   
> +	/* Skip if legacy LUT is not supported: */
> +	if (!lut_size)
> +		return;
> +
>   	lut = malloc(sizeof(uint16_t) * lut_size);
>   
>   	for (i = 0; i < lut_size; i++)
