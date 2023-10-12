Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FFB10E169
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Oct 2023 00:41:49 +0000 (UTC)
Message-ID: <d4a72665-2f73-409d-9da4-a9db136f9ef8@quicinc.com>
Date: Wed, 11 Oct 2023 17:41:43 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
References: <20231011210352.671199-1-robdclark@gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231011210352.671199-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] tests/kms_plane: Fix skips/fails vs CRC
 cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Helen Koike <helen.koike@collabora.com>,
 Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 10/11/2023 2:03 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> test_fini() isn't necessarily called if a subtest skips/fails, leaving
> the kernel drm_crtc_crc still in the open state, causing further
> attempts to open/configure the crc to fail.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Hi Rob,

Thanks for the fix -- it looks good to me:

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # RB5 (sm8250)

BR,

Jessica Zhang

> ---
>   tests/kms_plane.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 9a515559c9b0..b3d6043496b1 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -84,6 +84,8 @@ static color_t blue  = { 0.0f, 0.0f, 1.0f };
>   static void test_init(data_t *data, enum pipe pipe)
>   {
>   	igt_require(data->display.pipes[pipe].n_planes > 0);
> +	if (data->pipe_crc)
> +		igt_pipe_crc_free(data->pipe_crc);
>   	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
>   					  IGT_PIPE_CRC_SOURCE_AUTO);
>   	igt_display_reset(&data->display);
> @@ -92,6 +94,7 @@ static void test_init(data_t *data, enum pipe pipe)
>   static void test_fini(data_t *data)
>   {
>   	igt_pipe_crc_free(data->pipe_crc);
> +	data->pipe_crc = NULL;
>   }
>   
>   enum {
> -- 
> 2.41.0
> 
