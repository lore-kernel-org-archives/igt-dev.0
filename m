Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <85639b1a-f85e-cf26-42d5-8ce868a494a4@linux.intel.com>
Date: Wed, 4 May 2022 17:22:06 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
References: <20220504150845.158789-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220504150845.158789-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_caching: handle
 discrete
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

The series is Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 5/4/2022 5:08 PM, Matthew Auld wrote:
> Test should still be valid, even if we can't explicitly control the PTE
> caching bits, like on discrete, where the caching should already be
> enabled by default for system memory objects.
>
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/4873
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> ---
>   tests/i915/gem_caching.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
> index 4e844952..eb0170ab 100644
> --- a/tests/i915/gem_caching.c
> +++ b/tests/i915/gem_caching.c
> @@ -147,7 +147,8 @@ igt_main
>   
>   		igt_require_gem(data.fd);
>   		gem_require_blitter(data.fd);
> -		gem_require_caching(data.fd);
> +		if (!gem_has_lmem(data.fd))
> +			gem_require_caching(data.fd);
>   
>   		data.devid = intel_get_drm_devid(data.fd);
>   		if (IS_GEN2(data.devid)) /* chipset only handles cached -> uncached */
> @@ -162,7 +163,8 @@ igt_main
>   		scratch_buf = intel_buf_create(data.bops, BO_SIZE/4, 1,
>   					       32, 0, I915_TILING_NONE, 0);
>   
> -		gem_set_caching(data.fd, scratch_buf->handle, 1);
> +		if (!gem_has_lmem(data.fd))
> +			gem_set_caching(data.fd, scratch_buf->handle, 1);
>   
>   		staging_buf = intel_buf_create(data.bops, BO_SIZE/4, 1,
>   					       32, 0, I915_TILING_NONE, 0);
