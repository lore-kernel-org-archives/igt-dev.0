Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CCC10E27F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Dec 2021 10:03:32 +0000 (UTC)
Date: Wed, 15 Dec 2021 11:03:28 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <Ybm9cH73V0xE/cHC@zkempczy-mobl2>
References: <20211214125902.4084623-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211214125902.4084623-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [igt-dev] [i-g-t,
 V3] tests/i915/gem_exec_balancer: bonding support check in
 invalid-balancer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 14, 2021 at 06:29:02PM +0530, Tejas Upadhyay wrote:
> Bonding is disabled on GEN12+ platforms, except ones already
> supported by the i915 - TGL, RKL, and ADL-S.
> 
> Currently few tests are failing for same reason, with this
> change they should rightly skip with proper message.
> 
> Reference: https://cgit.freedesktop.org/drm-tip/commit/?id=ce7e75c7ef1bf8ea3d947da8c674d2f40fd7d734
> 
> Changes since V2 :
> 	- Solved checkpatch errors.
> Changes since V1 :
>         - use function to check bonding capability so that
>           we dont skip whole test in case bonding not supported.
> 
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>  tests/i915/gem_exec_balancer.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> index d58734ab..0810f910 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -180,6 +180,33 @@ __set_param_fresh_context(int i915, struct drm_i915_gem_context_param param)
>  	return err;
>  }
>  
> +static bool has_bonding(int i915)
> +{
> +	I915_DEFINE_CONTEXT_ENGINES_BOND(bonds[16], 1);
> +	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 1);
> +	struct drm_i915_gem_context_param p = {
> +		.param = I915_CONTEXT_PARAM_ENGINES,
> +		.value = to_user_pointer(&engines),
> +		.size = sizeof(engines),
> +	};
> +	int ret;
> +
> +	memset(&engines, 0, sizeof(engines));
> +	igt_assert_eq(__set_param_fresh_context(i915, p), 0);
> +
> +	memset(bonds, 0, sizeof(bonds));
> +	for (int n = 0; n < ARRAY_SIZE(bonds); n++) {
> +		bonds[n].base.name = I915_CONTEXT_ENGINES_EXT_BOND;
> +		bonds[n].base.next_extension =
> +			n ? to_user_pointer(&bonds[n - 1]) : 0;
> +		bonds[n].num_bonds = 1;
> +	}
> +	engines.extensions = to_user_pointer(&bonds);
> +	ret = __set_param_fresh_context(i915, p);
> +
> +	return ret == -ENODEV ? false : true;
> +}
> +

Looks like candidate for library call but we drop bonding on newer
gens so it can stay here.

>  static void invalid_balancer(int i915)
>  {
>  	I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(balancer, 64);
> @@ -191,6 +218,7 @@ static void invalid_balancer(int i915)
>  	};
>  	uint32_t handle;
>  	void *ptr;
> +	bool bonding = false;

Initialization not necessary.
>  
>  	/*
>  	 * Assume that I915_CONTEXT_PARAM_ENGINE validates the array
> @@ -198,6 +226,7 @@ static void invalid_balancer(int i915)
>  	 * extension explodes.
>  	 */
>  
> +	bonding = has_bonding(i915);
>  	for (int class = 0; class < 32; class++) {
>  		struct i915_engine_class_instance *ci;
>  		unsigned int count;
> @@ -299,7 +328,7 @@ static void invalid_balancer(int i915)
>  
>  		munmap(ptr + 4096, 4096);
>  
> -		if (count >= 2) {
> +		if (count >= 2 && bonding) {
>  			/* You can't bond to a balanced engine */
>  			memset(&bond, 0, sizeof(bond));
>  			bond.base.name = I915_CONTEXT_ENGINES_EXT_BOND;
> -- 
> 2.31.1
> 

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew
