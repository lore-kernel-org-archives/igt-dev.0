Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D0A10E3AD
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 07:51:26 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbea14706eso45235735e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Aug 2023 00:51:26 -0700 (PDT)
Message-ID: <95ae5549-8e22-3feb-51f2-0f1936970a4a@gmail.com>
Date: Tue, 8 Aug 2023 10:51:19 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, igt-dev@lists.freedesktop.org
References: <20230807201245.214280-1-robdclark@gmail.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230807201245.214280-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: juhapekka.heikkila@gmail.com
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Those ci reported issues are not relating to these changes.

On 7.8.2023 23.12, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Skip the tests which require legacy gamma, instead of failing, if the hw
> does not support legacy gamma.
> 
> v2: igt_require(lut_size > 0) instead
> v3: simplify patch

I think this description need to be adjusted a bit to reflect current 
change. With this description fixed these two patches are

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
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
