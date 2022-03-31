Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7716E10F27D
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Mar 2022 09:56:07 +0000 (UTC)
Message-ID: <1ef2e497-f751-0f00-dfc9-c9e7cbeae96d@intel.com>
Date: Thu, 31 Mar 2022 10:56:03 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
References: <20220331095042.7528-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220331095042.7528-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ctx_shared: handle mmap for
 discrete
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

On 31/03/2022 10:50, Nirmoy Das wrote:
> On discrete we can only do fixed mmap and also setting
> domain is not allowed.
> 
> Issue: https://gitlab.freedesktop.org/drm/intel/-/issues/5451
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/i915/gem_ctx_shared.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> index cc547b87b..dd3ff3ee3 100644
> --- a/tests/i915/gem_ctx_shared.c
> +++ b/tests/i915/gem_ctx_shared.c
> @@ -290,9 +290,16 @@ static void exec_shared_gtt(int i915, const intel_ctx_cfg_t *cfg,
>   	execbuf.flags |= I915_EXEC_FENCE_IN;
>   
>   	scratch = gem_create(i915, 4096);
> -	s = gem_mmap__wc(i915, scratch, 0, 4096, PROT_WRITE);
> +	if (gem_has_lmem(i915))
> +		s = gem_mmap_offset__fixed(i915, scratch, 0, 4096, PROT_WRITE);
> +	else {
> +		s = gem_mmap_offset__wc(i915, scratch, 0, 4096, PROT_WRITE);
> +		if (!s)
> +			s = gem_mmap__wc(i915, scratch, 0, 4096, PROT_WRITE);

https://patchwork.freedesktop.org/series/100499/

gem_mmap__device_coherent() can be used here I think.

> +
> +		gem_set_domain(i915, scratch, I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);

This does an object wait some on discrete IIRC. I didn't check if the 
test is relying on that or not though.

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> +	}
>   
> -	gem_set_domain(i915, scratch, I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
>   	s[0] = bbe;
>   	s[64] = bbe;
>   
