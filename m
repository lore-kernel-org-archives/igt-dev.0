Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F36410E37A
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 18:29:13 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe3b86cec1so7446069e87.2
 for <igt-dev@lists.freedesktop.org>; Mon, 07 Aug 2023 11:29:13 -0700 (PDT)
Message-ID: <90bf29f0-a403-5cd0-680f-fc8595e64627@gmail.com>
Date: Mon, 7 Aug 2023 21:29:04 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, igt-dev@lists.freedesktop.org
References: <20230807165411.206456-1-robdclark@gmail.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230807165411.206456-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH v3] tests/kms_plane: Handle hw without legacy
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

Hi Rob,

On 7.8.2023 19.54, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Skip the tests which require legacy gamma, instead of failing, if the hw
> does not support legacy gamma.
> 
> v2: igt_require(lut_size > 0) instead
> v3: simplify patch
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   tests/kms_plane.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 67cff61d6cd1..44cad2bf2491 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -469,6 +469,8 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
>   	lut_size = crtc->gamma_size;
>   	drmModeFreeCrtc(crtc);
>   
> +	igt_require(lut_size > 0);
> +

Is this something you really want on your hw? This lut stuff is 
originally coming from this patch

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/093fa482371795c3aa246509994eb21907f501b9

where it is mentioned:

---
We also abuse the legacy LUT to drop the precision down to 6 bits
so that still errors causes by the RGB<->YCbCr conversion end up
being ignored.
---

With your change you'd skip testing of all available pixel 
formats/modifiers combos on your driver while originally this feature is 
mostly intended just to avoid hitting Intel hw related anomalies. Do 
those tests work for you if you just not set that lut?

/Juha-Pekka

>   	lut = malloc(sizeof(uint16_t) * lut_size);
>   
>   	for (i = 0; i < lut_size; i++)
