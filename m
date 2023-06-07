Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CEE10E476
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 08:57:42 +0000 (UTC)
Date: Wed, 7 Jun 2023 10:57:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: IGT dev <igt-dev@lists.freedesktop.org>
Message-ID: <20230607085737.tgauj4s2pvbjx7rg@kamilkon-desk1>
References: <20230606175226.502703-1-andi.shyti@linux.intel.com>
 <20230606175226.502703-2-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230606175226.502703-2-andi.shyti@linux.intel.com>
Subject: Re: [igt-dev] [PATCH v3 1/1] test/gem_create: limit set_pat only to
 Meteor Lake
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Fei Yang <fei.yang@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-06-06 at 19:52:26 +0200, Andi Shyti wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> For platforms other than Meteor Lake the set_pat extension should
> return -ENODEV.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  tests/i915/gem_create.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> index e9e8216d2b..b7961d9ef2 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -657,6 +657,7 @@ static void create_ext_set_pat(int fd)
>  		.base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
>  		.pat_index = 65,
>  	};
> +	uint32_t devid = intel_get_drm_devid(fd);
>  	struct drm_i915_gem_caching arg;
>  	uint64_t size;
>  	uint32_t handle;
> @@ -672,6 +673,9 @@ static void create_ext_set_pat(int fd)
>  	 */
>  	if (ret == -EINVAL)
>  		igt_skip("I915_GEM_CREATE_EXT_SET_PAT is not supported\n");
> +	else if (!IS_METEORLAKE(devid))
> +		igt_assert_eq(ret, -ENODEV);
> +

lgtm,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  	igt_assert(ret == 0);
>  
>  	/*
> -- 
> 2.40.1
> 
