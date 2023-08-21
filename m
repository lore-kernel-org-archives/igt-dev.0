Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0E210E096
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Aug 2023 11:41:55 +0000 (UTC)
Date: Mon, 21 Aug 2023 14:41:46 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <ZONNelmocydf43H+@intel.com>
References: <20230817175406.48757-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817175406.48757-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_fb: take x-tile out from
 blitter path
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 08:54:06PM +0300, Juha-Pekka Heikkila wrote:
> take x-tile out from blitter path, x-tile came to blitter path on older
> intel gens by mistake.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> ---
>  lib/igt_fb.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 60b0e2669..140711075 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2555,7 +2555,6 @@ static bool use_blitter(const struct igt_fb *fb)
>  		return false;
>  
>  	return fb->modifier == I915_FORMAT_MOD_4_TILED ||
> -	       fb->modifier == I915_FORMAT_MOD_X_TILED ||
>  	       fb->modifier == I915_FORMAT_MOD_Y_TILED ||
>  	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
>  	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
> -- 
> 2.34.1
> 
