Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A42410E58E
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Feb 2023 16:32:11 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id v13so16479073eda.11
 for <igt-dev@lists.freedesktop.org>; Tue, 07 Feb 2023 08:32:11 -0800 (PST)
Message-ID: <a7d54ddd-b251-8fe4-645b-c646cb3803f7@gmail.com>
Date: Tue, 7 Feb 2023 18:32:03 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, igt-dev@lists.freedesktop.org
References: <20230207134249.20336-1-nidhi1.gupta@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230207134249.20336-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_draw_crc: Ignore RGB565
 & XRGB2101010 formats on simulation
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

On 7.2.2023 15.42, Nidhi Gupta wrote:
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> As RGB565 and XRGB2101010 formats are bit slow in pre-si, we can
> ignore both the formats only on simulation to improve the execution
> time.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/i915/kms_draw_crc.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
> index c2ac4721..0c80a46c 100644
> --- a/tests/i915/kms_draw_crc.c
> +++ b/tests/i915/kms_draw_crc.c
> @@ -290,10 +290,19 @@ igt_main
>   		     "with different modifiers, DRM_FORMATS, DRAW_METHODS.");
>   	igt_subtest_with_dynamic("draw-method") {
>   		for (format_idx = 0; format_idx < ARRAY_SIZE(formats); format_idx++) {
> +			/* 10-bit & 16-bit formats are bit slow, ignore in pre-si. */
> +			if (igt_run_in_simulation() &&
> +			    (formats[format_idx] == DRM_FORMAT_XRGB2101010 ||
> +			    formats[format_idx] == DRM_FORMAT_RGB565))

Wouldn't it be more obvious to check just for != DRM_FORMAT_XRGB8888 ?

> +				continue;
> +
>   			for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
>   				for (modifier_idx = 0; modifier_idx < ARRAY_SIZE(modifiers); modifier_idx++) {
>   					modifier = modifiers[modifier_idx];
>   
> +					if (!igt_display_has_format_mod(&display, formats[format_idx], modifier))
> +						continue;
> +
>   					if (method == IGT_DRAW_MMAP_WC && !gem_mmap__has_wc(drm_fd))
>   						continue;
>   
> @@ -301,9 +310,6 @@ igt_main
>   					    !gem_has_mappable_ggtt(drm_fd))
>   						continue;
>   
> -					if (!igt_display_has_format_mod(&display, formats[format_idx], modifier))
> -						continue;
> -
>   					igt_dynamic_f("%s-%s-%s",
>   						      format_str(format_idx),
>   						      igt_draw_get_method_name(method),
