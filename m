Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A68B10E6DB
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 05:00:30 +0000 (UTC)
Message-ID: <b764e4b5-d6f1-e26d-296b-6a5781a8f9b4@intel.com>
Date: Wed, 8 Feb 2023 10:30:17 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230208021745.24590-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230208021745.24590-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/kms_draw_crc: Ignore
 RGB565 & XRGB2101010 formats on simulation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nidhi,

On Wed-08-02-2023 07:47 am, Nidhi Gupta wrote:
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> As RGB565 and XRGB2101010 formats are bit slow in pre-si, we can
> ignore both the formats only on simulation to improve the execution
> time.
> 
> v2: update the skip format condition to
>      (formats[format_idx] != DRM_FORMAT_XRGB8888)
>      (Juha-Pekka)
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/i915/kms_draw_crc.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
> index c2ac4721..64d3b937 100644
> --- a/tests/i915/kms_draw_crc.c
> +++ b/tests/i915/kms_draw_crc.c
> @@ -290,10 +290,18 @@ igt_main
>   		     "with different modifiers, DRM_FORMATS, DRAW_METHODS.");
>   	igt_subtest_with_dynamic("draw-method") {
>   		for (format_idx = 0; format_idx < ARRAY_SIZE(formats); format_idx++) {
> +			/* 10-bit & 16-bit formats are bit slow, ignore in pre-si. */
> +			if (igt_run_in_simulation() &&
> +			    formats[format_idx] != DRM_FORMAT_XRGB8888)
> +				continue;
> +
>   			for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
>   				for (modifier_idx = 0; modifier_idx < ARRAY_SIZE(modifiers); modifier_idx++) {
>   					modifier = modifiers[modifier_idx];
>   
> +					if (!igt_display_has_format_mod(&display, formats[format_idx], modifier))
> +						continue;

Please mention about this change in commit message.

- Bhanu

> +
>   					if (method == IGT_DRAW_MMAP_WC && !gem_mmap__has_wc(drm_fd))
>   						continue;
>   
> @@ -301,9 +309,6 @@ igt_main
>   					    !gem_has_mappable_ggtt(drm_fd))
>   						continue;
>   
> -					if (!igt_display_has_format_mod(&display, formats[format_idx], modifier))
> -						continue;
> -
>   					igt_dynamic_f("%s-%s-%s",
>   						      format_str(format_idx),
>   						      igt_draw_get_method_name(method),
