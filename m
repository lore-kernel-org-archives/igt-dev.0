Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF436E969
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Oct 2021 06:51:44 +0000 (UTC)
Message-ID: <fb041d04-2717-bc9b-fcdb-c4236d648a93@intel.com>
Date: Mon, 18 Oct 2021 12:21:19 +0530
Content-Language: en-US
References: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
 <20211013221727.6392-2-ville.syrjala@linux.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20211013221727.6392-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/8] lib/fb: Introduce
 igt_fb_modifier_name()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 10/14/2021 3:47 AM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Provide a human redable name for modifiers. Only plugged in the
> i915 specific ones for now. Also provide some printf format macros
> for convenience.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Please fix typo: 'redable'

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   lib/igt_fb.c | 26 ++++++++++++++++++++++++++
>   lib/igt_fb.h |  4 ++++
>   2 files changed, 30 insertions(+)
>
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index f1e1099ec864..63f3c86e75f0 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -4328,3 +4328,29 @@ void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
>   		(*formats_array)[index++] = format->drm_id;
>   	}
>   }
> +
> +const char *igt_fb_modifier_name(uint64_t modifier)
> +{
> +	switch (modifier) {
> +	case DRM_FORMAT_MOD_LINEAR:
> +		return "linear";
> +	case I915_FORMAT_MOD_X_TILED:
> +		return "X";
> +	case I915_FORMAT_MOD_Y_TILED:
> +		return "Y";
> +	case I915_FORMAT_MOD_Yf_TILED:
> +		return "Yf";
> +	case I915_FORMAT_MOD_Y_TILED_CCS:
> +		return "Y-CCS";
> +	case I915_FORMAT_MOD_Yf_TILED_CCS:
> +		return "Yf-CCS";
> +	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
> +		return "Y-RC_CCS";
> +	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
> +		return "Y-RC_CCS-CC";
> +	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
> +		return "Y-MC_CCS";
> +	default:
> +		return "?";
> +	}
> +}
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 2c2b8265b5f6..c61d9e7219ff 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -52,6 +52,9 @@ struct buf_ops;
>   #define IGT_FORMAT_ARGS(f) ((f) >> 0) & 0xff, ((f) >> 8) & 0xff, \
>   		((f) >> 16) & 0xff, ((f) >> 24) & 0xff, (f)
>   
> +#define IGT_MODIFIER_FMT "%s(0x%" PRIx64 ")"
> +#define IGT_MODIFIER_ARGS(m) igt_fb_modifier_name(m), (m)
> +
>   /**
>    * igt_fb_t:
>    * @fb_id: KMS ID of the framebuffer
> @@ -217,6 +220,7 @@ int igt_fill_cts_framebuffer(uint32_t *pixmap, uint32_t video_width,
>   		uint32_t video_height, uint32_t bitdepth, int alpha);
>   
>   int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc);
> +const char *igt_fb_modifier_name(uint64_t modifier);
>   
>   #endif /* __IGT_FB_H__ */
>   

