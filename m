Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD25410E283
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jan 2022 21:39:23 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id t24so1643968edi.8
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jan 2022 13:39:23 -0800 (PST)
Message-ID: <8f2268ba-b453-54cc-ec0e-3c17485d6334@gmail.com>
Date: Tue, 11 Jan 2022 23:39:15 +0200
MIME-Version: 1.0
Content-Language: en-US
References: <20220111105431.9459-1-jeevan.b@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220111105431.9459-1-jeevan.b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_draw_crc : check tiling
 support
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
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Why is this patch showing up again? Let's not do this for the second 
time either.

On 11.1.2022 12.54, Jeevan B wrote:
> From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> 
> We can check tiling support before executing test to avoid
> failure and smoothly skipping expected failure.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>   lib/intel_bufops.c        | 2 +-
>   tests/i915/kms_draw_crc.c | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index f13063fa..4ba4271a 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -1176,7 +1176,7 @@ void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename)
>   #define DEFAULT_BUFOPS(__gen_start, __gen_end) \
>   	.gen_start          = __gen_start, \
>   	.gen_end            = __gen_end, \
> -	.supported_hw_tiles = TILE_X | TILE_Y, \
> +	.supported_hw_tiles = TILE_NONE | TILE_X | TILE_Y, \

there's no need to think about (de-)tiling linear buffers.

>   	.linear_to          = copy_linear_to_wc, \
>   	.linear_to_x        = copy_linear_to_gtt, \
>   	.linear_to_y        = copy_linear_to_gtt, \
> diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
> index 82c368e1..ff1520d1 100644
> --- a/tests/i915/kms_draw_crc.c
> +++ b/tests/i915/kms_draw_crc.c
> @@ -182,6 +182,7 @@ static void draw_method_subtest(enum igt_draw_method method,
>   	igt_skip_on(method == IGT_DRAW_MMAP_GTT &&
>   		    !gem_has_mappable_ggtt(drm_fd));
>   
> +	igt_require(buf_ops_has_hw_fence(bops, modifier));

This will not work on hw where there is no hw detiling. See how 
__buf_ops_create(..) works in igt, if needed it just will do tiling with 
sw instead.

>   	igt_require(format_is_supported(formats[format_index], modifier));
>   
>   	/* Use IGT_DRAW_MMAP_GTT/WC on an untiled buffer as the parameter for
