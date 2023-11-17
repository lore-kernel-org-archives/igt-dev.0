Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F1410E08E
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Nov 2023 13:24:23 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40853c639abso15592475e9.0
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Nov 2023 05:24:23 -0800 (PST)
Message-ID: <15ad1e3d-0b6c-47a9-a143-91fc44254b65@gmail.com>
Date: Fri, 17 Nov 2023 15:24:15 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231116132452.2671-1-ville.syrjala@linux.intel.com>
 <20231116132452.2671-2-ville.syrjala@linux.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231116132452.2671-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/igt_fb: Provide
 igt_fb_modifier_for_name()
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

On 16.11.2023 15.24, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Add a function that given a modifier's human readable
> name returns the actual modifier magic number.
> 
> TODO: figure out what to do about the "same" modifier with
>        multiple platform variants...
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 10 ++++++++++
>   lib/igt_fb.h |  1 +
>   2 files changed, 11 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 5670bc06c778..24275c06354b 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -4944,3 +4944,13 @@ const char *igt_fb_modifier_name(uint64_t modifier)
>   
>   	return "?";
>   }
> +
> +uint64_t igt_fb_modifier_for_name(const char *name)
> +{
> +	for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
> +		if (!strcasecmp(name, modifiers[i].name))
> +			return modifiers[i].modifier;
> +	}
> +
> +	return DRM_FORMAT_MOD_INVALID;
> +}
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 834aaef54dea..3bb577c02cd9 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -230,6 +230,7 @@ int igt_fill_cts_color_square_framebuffer(uint32_t *pixmap,
>   
>   int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc);
>   const char *igt_fb_modifier_name(uint64_t modifier);
> +uint64_t igt_fb_modifier_for_name(const char *name);
>   
>   #endif /* __IGT_FB_H__ */
>   
