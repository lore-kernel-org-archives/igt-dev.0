Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <25733ca1-dcb2-4ca1-7ec4-879644e83607@linux.intel.com>
Date: Wed, 7 Dec 2022 12:08:11 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, intel-gfx@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org
References: <20221207114730.77304-1-andrzej.hajda@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20221207114730.77304-1-andrzej.hajda@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_persistence: adjust
 timeout according to engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 07/12/2022 11:47, Andrzej Hajda wrote:
> With introduction of long running compute context preemption timeouts
> in some engines (rcs and ccs) can be quite big (by default 7.5s).
> Keeping spinner timeout to at least twice bigger than engines preemption
> timeout should allow to finish the test without -ETIME error.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2410
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>   tests/i915/gem_ctx_persistence.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index a844439de19..9fb52818616 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -1173,6 +1173,14 @@ static void many_contexts(int i915, const intel_ctx_cfg_t *cfg)
>   	gem_sync(i915, spin->handle);
>   	igt_spin_reset(spin);
>   
> +	for_each_ctx_cfg_engine(i915, cfg, e) {
> +		int t = 0;
> +
> +		gem_engine_property_scanf(i915, e->name,
> +					  "preempt_timeout_ms", "%d", &t);
> +		timeout = max_t(int64_t, timeout, 2000000ll * t);
> +	}
> +
>   	igt_until_timeout(30) {
>   		for_each_ctx_cfg_engine(i915, cfg, e) {
>   			const intel_ctx_t *ctx;

LGTM. And over time we will see if there will be remaining unexplained 
failures.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
