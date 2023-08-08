Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBDD10E1AE
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 15:18:40 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe2ba3e260so55667155e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Aug 2023 08:18:40 -0700 (PDT)
Message-ID: <406271de-a941-a6bd-c475-818c87d7d077@gmail.com>
Date: Tue, 8 Aug 2023 18:18:32 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, igt-dev@lists.freedesktop.org
References: <20230808145334.24277-1-robdclark@gmail.com>
 <20230808145334.24277-2-robdclark@gmail.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230808145334.24277-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 2/2] tests/kms_plane: Skip QCOM_COMPRESSED
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

I somehow thought I had given r-b for this patch too..but here it is for 
the record

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 8.8.2023 17.53, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We don't know how to generate valid compressed/UBWC data in igt, so
> don't try.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
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
