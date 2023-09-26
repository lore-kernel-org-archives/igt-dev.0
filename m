Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39A310E3B9
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 12:13:13 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-532c66a105bso9968855a12.3
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 05:13:13 -0700 (PDT)
Message-ID: <77a288e8-f626-54e6-0e53-4735a48cebc3@gmail.com>
Date: Tue, 26 Sep 2023 15:13:06 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230911072249.1935228-1-bhanuprakash.modem@intel.com>
 <20230911072249.1935228-2-bhanuprakash.modem@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230911072249.1935228-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V5 1/5] tests/i915/kms_ccs: Add XE support
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

On 11.9.2023 10.22, Bhanuprakash Modem wrote:
> Add XE driver support for kms tests. This patch will add a support
> to call the corresponding apis based on the driver (i915/xe)
> 
> V2: - Update XE blocklist
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel/kms_ccs.c | 42 ++++++++++++++++++++++++++----------------
>   1 file changed, 26 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 976aedb06..4a0f024dd 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -32,6 +32,7 @@
>   #include "igt.h"
>   
>   #include "i915/gem_create.h"
> +#include "xe/xe_ioctl.h"
>   
>   /**
>    * SUBTEST: %s-%s-%s
> @@ -313,17 +314,19 @@ static void check_ccs_plane(int drm_fd, igt_fb_t *fb, int plane)
>   	ccs_size = fb->strides[plane] * fb->plane_height[plane];
>   	igt_assert(ccs_size);
>   
> -	gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, 0);
> -
> -	map = gem_mmap__cpu(drm_fd, fb->gem_handle, 0, fb->size, PROT_READ);
> -
> +	if (is_i915_device(drm_fd)) {
> +		gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, 0);
> +		map = gem_mmap__cpu(drm_fd, fb->gem_handle, 0, fb->size, PROT_READ);
> +	} else {
> +		map = xe_bo_mmap_ext(drm_fd, fb->gem_handle, fb->size, PROT_READ);
> +	}
>   	ccs_size = fb->strides[plane] * fb->plane_height[plane];
>   	ccs_p = map + fb->offsets[plane];
>   	for (i = 0; i < ccs_size; i += sizeof(uint32_t))
>   		if (*(uint32_t *)(ccs_p + i))
>   			break;
>   
> -	munmap(map, fb->size);
> +	igt_assert(gem_munmap(map, fb->size) == 0);
>   
>   	igt_assert_f(i < ccs_size,
>   		     "CCS plane %d (for main plane %d) lacks compression meta-data\n",
> @@ -339,9 +342,12 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
>   	void *map;
>   	uint32_t native_color;
>   
> -	gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, 0);
> -
> -	map = gem_mmap__cpu(drm_fd, fb->gem_handle, 0, fb->size, PROT_READ);
> +	if (is_i915_device(drm_fd)) {
> +		gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, 0);
> +		map = gem_mmap__cpu(drm_fd, fb->gem_handle, 0, fb->size, PROT_READ);
> +	} else {
> +		map = xe_bo_mmap_ext(drm_fd, fb->gem_handle, fb->size, PROT_READ);
> +	}
>   	cc_p = map + fb->offsets[plane];
>   
>   	igt_assert(cc_color[0] == cc_p[0].f &&
> @@ -356,7 +362,7 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
>   
>   	igt_assert(native_color == cc_p[4].d);
>   
> -	munmap(map, fb->size);
> +	igt_assert(gem_munmap(map, fb->size) == 0);
>   };
>   
>   static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const float *cc_color, bool check_cc_plane)
> @@ -378,14 +384,17 @@ static void fill_fb_random(int drm_fd, igt_fb_t *fb)
>   	uint8_t *p;
>   	int i;
>   
> -	gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
> -
> -	p = map = gem_mmap__cpu(drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
> +	if (is_i915_device(drm_fd)) {
> +		gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
> +		p = map = gem_mmap__cpu(drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
> +	} else {
> +		p = map = xe_bo_mmap_ext(drm_fd, fb->gem_handle, fb->size, PROT_READ | PROT_WRITE);

I kind of assume here wouldn't need PROT_READ but I don't see it 
changing test result. As is this show green results and as discussed 
earlier this test maybe not so useful overall on Xe in any case so lets 
go with this.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

> +	}
>   
>   	for (i = 0; i < fb->size; i++)
>   		p[i] = rand();
>   
> -	munmap(map, fb->size);
> +	igt_assert(gem_munmap(map, fb->size) == 0);
>   }
>   
>   static void test_bad_ccs_plane(data_t *data, int width, int height, int ccs_plane,
> @@ -493,8 +502,9 @@ static void fast_clear_fb(int drm_fd, struct igt_fb *fb, const float *cc_color)
>   	struct buf_ops *bops = buf_ops_create(drm_fd);
>   	struct intel_buf *dst = igt_fb_create_intel_buf(drm_fd, bops, fb, "fast clear dst");
>   
> -	gem_set_domain(drm_fd, fb->gem_handle,
> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> +	if (is_i915_device(drm_fd))
> +		gem_set_domain(drm_fd, fb->gem_handle,
> +			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
>   
>   	fast_clear(ibb, dst, 0, 0, fb->width, fb->height, cc_color);
>   
> @@ -814,7 +824,7 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
>   	enum pipe pipe;
>   
>   	igt_fixture {
> -		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   
>   		igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 9);
>   		kmstest_set_vt_graphics_mode();
