Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506A810E02F
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jun 2023 05:40:19 +0000 (UTC)
Message-ID: <dfe6fb18-e84f-9e2d-f803-168c43969885@intel.com>
Date: Mon, 12 Jun 2023 11:08:08 +0530
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230609101205.2803975-1-kunal1.joshi@intel.com>
 <20230609101205.2803975-5-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230609101205.2803975-5-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] RFC lib/ioctl_wrappers:
 GEM_SET_DOMAIN ioctl not supported on xe
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


On Fri-09-06-2023 03:42 pm, Kunal Joshi wrote:
> xe doesn't support GEM_SET_DOMAIN ioctl
> 
> v2: Keep i915 specific check in test only
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/i915/kms_frontbuffer_tracking.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
> index 09bfd3c3..7159cd37 100644
> --- a/tests/i915/kms_frontbuffer_tracking.c
> +++ b/tests/i915/kms_frontbuffer_tracking.c
> @@ -1573,7 +1573,8 @@ static void do_flush(const struct test_mode *t)
>   	struct modeset_params *params = pick_params(t);
>   	struct fb_region *target = pick_target(t, params);
>   
> -	gem_set_domain(drm.fd, target->fb->gem_handle, I915_GEM_DOMAIN_GTT, 0);
> +	if (is_i915_device(drm.fd))
> +		gem_set_domain(drm.fd, target->fb->gem_handle, I915_GEM_DOMAIN_GTT, 0);

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

>   }
>   
>   #define DONT_ASSERT_CRC			(1 << 0)
