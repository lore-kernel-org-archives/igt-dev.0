Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <22b1a0d6-35c9-73ba-8115-f7bf6bc72f61@intel.com>
Date: Tue, 28 Jun 2022 15:26:56 +0300
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220627161004.70153-1-matthew.auld@intel.com>
 <20220627161004.70153-2-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220627161004.70153-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/i915/kms_mmap_write_crc:
 handle missing gem_get_caching()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Looks good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 6/27/22 7:10 PM, Matthew Auld wrote:
> The kernel is meant to force the caching level for the object to
> CACHE_NONE or CACHE_WT when first scanning out the object, since the
> display engine is not coherent (assuming userspace hasn't already done
> this). On discrete we no longer support set/get_caching, but we can only
> do the scanout from lmem, which can only be mapped as WC and so should
> always be coherent for scanout. Adjust the test and ensure it still
> passes as expected.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5303
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>   tests/i915/kms_mmap_write_crc.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
> index b17e5fdb..da7312d6 100644
> --- a/tests/i915/kms_mmap_write_crc.c
> +++ b/tests/i915/kms_mmap_write_crc.c
> @@ -78,7 +78,6 @@ static void test(data_t *data)
>   	drmModeModeInfo *mode;
>   	cairo_t *cr;
>   	char *ptr;
> -	uint32_t caching;
>   	void *buf;
>   	igt_crc_t crc;
>   
> @@ -102,9 +101,13 @@ static void test(data_t *data)
>   	igt_plane_set_fb(data->primary, &data->fb[0]);
>   	igt_display_commit(display);
>   
> -	/* make sure caching mode has become UC/WT */
> -	caching = gem_get_caching(data->drm_fd, fb->gem_handle);
> -	igt_assert(caching == I915_CACHING_NONE || caching == I915_CACHING_DISPLAY);
> +	if (!gem_has_lmem(data->drm_fd)) {
> +		uint32_t caching;
> +
> +		/* make sure caching mode has become UC/WT */
> +		caching = gem_get_caching(data->drm_fd, fb->gem_handle);
> +		igt_assert(caching == I915_CACHING_NONE || caching == I915_CACHING_DISPLAY);
> +	}
>   
>   	/*
>   	 * firstly demonstrate the need for DMA_BUF_SYNC_START ("begin_cpu_access")
> 
