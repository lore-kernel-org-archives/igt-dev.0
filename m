Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1932C10F240
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Mar 2022 10:15:22 +0000 (UTC)
Message-ID: <f05813cd-a706-23fa-7871-2c44e23c60ed@intel.com>
Date: Thu, 31 Mar 2022 11:15:18 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
References: <20220331101344.8377-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220331101344.8377-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH v2 i-g-t] i915/gem_ctx_shared: handle mmap for
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

On 31/03/2022 11:13, Nirmoy Das wrote:
> Make mmap play nice on discrete.
> 
> Issue: https://gitlab.freedesktop.org/drm/intel/-/issues/5451
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/i915/gem_ctx_shared.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> index cc547b87b..eb3b024f8 100644
> --- a/tests/i915/gem_ctx_shared.c
> +++ b/tests/i915/gem_ctx_shared.c
> @@ -290,8 +290,7 @@ static void exec_shared_gtt(int i915, const intel_ctx_cfg_t *cfg,
>   	execbuf.flags |= I915_EXEC_FENCE_IN;
>   
>   	scratch = gem_create(i915, 4096);
> -	s = gem_mmap__wc(i915, scratch, 0, 4096, PROT_WRITE);
> -
> +	s =  gem_mmap__device_coherent(i915, scratch, 0, 4096, PROT_WRITE);
>   	gem_set_domain(i915, scratch, I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
>   	s[0] = bbe;
>   	s[64] = bbe;
