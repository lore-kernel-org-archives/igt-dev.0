Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87F910E444
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 11:47:10 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f76a0a19d4so7954968e87.2
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 04:47:10 -0700 (PDT)
Message-ID: <22260e84-a0dd-6a5e-8e67-39034d75abfe@gmail.com>
Date: Wed, 21 Jun 2023 14:47:00 +0300
MIME-Version: 1.0
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
References: <20230621081405.2168956-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230621081405.2168956-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] lib/igt_fb: Stop using rendercopy for linear
 buffers on XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 21.6.2023 11.14, Bhanuprakash Modem wrote:
> Stop using rendercopy for linear buffers on XE driver, instead
> use the mmap.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   lib/igt_fb.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 9be312a28..402fadf41 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2511,7 +2511,6 @@ static bool use_enginecopy(const struct igt_fb *fb)
>   
>   	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
>   	       is_ccs_modifier(fb->modifier) ||
> -	       (is_xe_device(fb->fd) && fb->modifier == DRM_FORMAT_MOD_LINEAR) ||
>   	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
>   }
>   
