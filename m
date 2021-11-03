Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107C373B77
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Nov 2021 18:23:49 +0000 (UTC)
Message-ID: <f8387c55-190e-360e-b838-b61047460501@intel.com>
Date: Wed, 3 Nov 2021 11:23:40 -0700
Content-Language: en-GB
References: <cover.1635895537.git.ashutosh.dixit@intel.com>
 <376c418d5c5a245a4cf80e3e2a7d83b6b76e3c67.1635895538.git.ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <376c418d5c5a245a4cf80e3e2a7d83b6b76e3c67.1635895538.git.ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/gem_ctx_shared: Fix
 disjoint_timelines test requirements
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 11/2/2021 16:30, Ashutosh Dixit wrote:
> Use gem_uses_ppgtt() for create vm and gem_scheduler_enabled() for
> context re-ordering.
>
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   tests/i915/gem_ctx_shared.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> index 7e3a2617b21..2f7ee69b1d3 100644
> --- a/tests/i915/gem_ctx_shared.c
> +++ b/tests/i915/gem_ctx_shared.c
> @@ -159,7 +159,7 @@ static void disjoint_timelines(int i915, const intel_ctx_cfg_t *cfg)
>   	uint32_t plug;
>   	uint64_t ahnd;
>   
> -	igt_require(gem_using_execlists(i915) || gem_using_guc_submission(i915));
> +	igt_require(gem_uses_ppgtt(i915) && gem_scheduler_enabled(i915));
>   
>   	/*
>   	 * Each context, although they share a vm, are expected to be
