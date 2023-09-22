Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467F110E623
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 04:54:41 +0000 (UTC)
Message-ID: <160cb1ad-d6ec-39b2-2c65-5f7517aefd17@intel.com>
Date: Fri, 22 Sep 2023 10:24:35 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 igt-dev@lists.freedesktop.org
References: <20230921163530.285456-1-juhapekka.heikkila@gmail.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230921163530.285456-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe: on xe driver use blitter for
 x-tile
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi JP,

Since for xe, we want to use blitter generically, please update commit 
message and subject accordingly.

With above fixed.

LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 21-Sep-23 10:05 PM, Juha-Pekka Heikkila wrote:
> on xe driver need to use blitter for x-tile
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/igt_fb.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 4b592825d..c8a7b31a8 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2557,7 +2557,8 @@ static bool use_blitter(const struct igt_fb *fb)
>   	return fb->modifier == I915_FORMAT_MOD_4_TILED ||
>   	       fb->modifier == I915_FORMAT_MOD_Y_TILED ||
>   	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
> -	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
> +	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd)) ||
> +	       is_xe_device(fb->fd);
>   }
>   
>   static void init_buf_ccs(struct intel_buf *buf, int ccs_idx,
