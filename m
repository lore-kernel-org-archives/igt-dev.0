Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE34D10EB49
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 11:45:42 +0000 (UTC)
Date: Tue, 31 May 2022 13:45:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YpX/4lLk0Da67jx0@kamilkon-desk1>
References: <20220531103033.31128-1-zbigniew.kempczynski@intel.com>
 <20220531103033.31128-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220531103033.31128-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_exec_schedule: Run
 spinner in non-default context
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

On 2022-05-31 at 12:30:32 +0200, Zbigniew Kempczyński wrote:
> Engine passed to the subtest comes from configuration which is build
> on top of all-physical-engines context. Add dedicated context for
> the spinner which is compatibile with this engine.
> 
> Fixes: pi-shared-iova and pi-distinct-iova
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/gem_exec_schedule.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> index cf2625cbf5..43d9d06c09 100644
> --- a/tests/i915/gem_exec_schedule.c
> +++ b/tests/i915/gem_exec_schedule.c
> @@ -2703,6 +2703,7 @@ static void test_pi_iova(int i915, const intel_ctx_cfg_t *cfg,
>  			 unsigned int engine, unsigned int flags)
>  {
>  	intel_ctx_cfg_t ufd_cfg = *cfg;
> +	const intel_ctx_t *spinctx;
>  	struct uffdio_api api = { .api = UFFD_API };
>  	struct uffdio_register reg;
>  	struct uffdio_copy copy;
> @@ -2712,7 +2713,7 @@ static void test_pi_iova(int i915, const intel_ctx_cfg_t *cfg,
>  	pthread_t hi, lo;
>  	char poison[4096];
>  	int ufd;
> -	uint64_t ahnd = get_reloc_ahnd(i915, 0);
> +	uint64_t ahnd;
>  
>  	/*
>  	 * In this scenario, we have a pair of contending contexts that
> @@ -2740,6 +2741,8 @@ static void test_pi_iova(int i915, const intel_ctx_cfg_t *cfg,
>  	if ((flags & SHARED) && gem_uses_full_ppgtt(i915))
>  		ufd_cfg.vm = gem_vm_create(i915);
>  
> +	spinctx = intel_ctx_create(i915, cfg);
> +	ahnd = get_reloc_ahnd(i915, spinctx->id);
>  	t.i915 = i915;
>  	t.cfg = &ufd_cfg;
>  	t.engine = engine;
> @@ -2782,7 +2785,7 @@ static void test_pi_iova(int i915, const intel_ctx_cfg_t *cfg,
>  	 * the local tasklet will not run until after all signals have been
>  	 * delivered... but another tasklet might).
>  	 */
> -	spin = igt_spin_new(i915, .ahnd = ahnd, .engine = engine);
> +	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = spinctx, .engine = engine);
>  	for (int i = 0; i < MAX_ELSP_QLEN; i++) {
>  		const intel_ctx_t *ctx = create_highest_priority(i915, cfg);
>  		spin->execbuf.rsvd1 = ctx->id;
> @@ -2815,6 +2818,7 @@ static void test_pi_iova(int i915, const intel_ctx_cfg_t *cfg,
>  	pthread_mutex_unlock(&t.mutex);
>  	igt_debugfs_dump(i915, "i915_engine_info");
>  	igt_spin_free(i915, spin);
> +	intel_ctx_destroy(i915, spinctx);
>  	put_offset(ahnd, t.scratch);
>  	put_offset(ahnd, t.batch);
>  	put_ahnd(ahnd);
> -- 
> 2.32.0
> 
