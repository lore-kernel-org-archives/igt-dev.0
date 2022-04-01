Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <ee076b1b-dacc-9c0d-484f-165259fc7aa7@linux.intel.com>
Date: Fri, 1 Apr 2022 13:12:35 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
References: <20220401110902.446305-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220401110902.446305-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_pwrite_crc: handle
 missing get_caching
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

I was just looking into this :) LGTM Reviewed-by: Nirmoy Das 
<nirmoy.das@intel.com>

On 4/1/2022 1:09 PM, Matthew Auld wrote:
> gem_get_caching is not supported on discrete. The object itself should
> already be coherent with the display engine as-is on such platforms, by
> virtue of the scanout happening via local-memory.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4903
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> ---
>   tests/i915/kms_pwrite_crc.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
> index 44fcfadb..584e6a19 100644
> --- a/tests/i915/kms_pwrite_crc.c
> +++ b/tests/i915/kms_pwrite_crc.c
> @@ -50,7 +50,6 @@ static void test(data_t *data)
>   	igt_output_t *output = data->output;
>   	struct igt_fb *fb = &data->fb[1];
>   	drmModeModeInfo *mode;
> -	uint32_t caching;
>   	void *buf;
>   	igt_crc_t crc;
>   
> @@ -76,9 +75,14 @@ static void test(data_t *data)
>   			0, 0, fb->width, fb->height,
>   			0, 0, fb->width << 16, fb->height << 16);
>   
> -	/* make sure caching mode has become UC/WT */
> -	caching = gem_get_caching(data->drm_fd, fb->gem_handle);
> -	igt_assert(caching == I915_CACHING_NONE || caching == I915_CACHING_DISPLAY);
> +	if (!gem_has_lmem(data->drm_fd)) {
> +		uint32_t caching;
> +
> +		/* make sure caching mode has become UC/WT */
> +		caching = gem_get_caching(data->drm_fd, fb->gem_handle);
> +		igt_assert(caching == I915_CACHING_NONE ||
> +			   caching == I915_CACHING_DISPLAY);
> +	}
>   
>   	/* use pwrite to make the other fb all white too */
>   	buf = malloc(fb->size);
