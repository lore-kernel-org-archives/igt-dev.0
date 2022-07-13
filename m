Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A039F6E4
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Jul 2022 23:30:04 +0000 (UTC)
Date: Wed, 13 Jul 2022 16:30:04 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <Ys9VfNOWe1YzE5l5@orsosgc001.jf.intel.com>
References: <20220713154816.39383-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220713154816.39383-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_hangman: add DG2 wa for
 hang subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 05:48:16PM +0200, Kamil Konieczny wrote:
>DG2 requires a workaround that prevents context switches on CCS when
>RCS is not idle. That breaks the hangman test because a hang on RCS
>means CCS cannot switch. Thus, the well behaved background task on CCS
>is seen as hanging and thus the test fails. The same problem is seen
>on RCS when CCS is hang, so do not use the other one when causing hang.
>
>Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5884
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>---
> tests/i915/i915_hangman.c | 9 +++++++++
> 1 file changed, 9 insertions(+)
>
>diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
>index 687dee14..9e244a10 100644
>--- a/tests/i915/i915_hangman.c
>+++ b/tests/i915/i915_hangman.c
>@@ -304,11 +304,17 @@ test_engine_hang(const intel_ctx_t *ctx,
> 	igt_spin_t *spin, *next;
> 	IGT_LIST_HEAD(list);
> 	uint64_t ahnd = get_reloc_ahnd(device, ctx->id), ahndN;
>+	int skip_class = -1;
> 	int num_ctx;
>
> 	igt_skip_on(flags & IGT_SPIN_INVALID_CS &&
> 		    gem_engine_has_cmdparser(device, &ctx->cfg, e->flags));
>
>+	/* Wa_14014494547:DG2 hang on RCS means CCS cannot switch */
>+	if (IS_DG2(intel_get_drm_devid(device)))
>+		skip_class = e->class == I915_ENGINE_CLASS_RENDER ? I915_ENGINE_CLASS_COMPUTE :
>+					 I915_ENGINE_CLASS_RENDER;
>+

This works, but also has a side effect of skipping background batch on 
render when testing media engines. Based on the commit msg, I think you 
want to skip render for compute specific hangs only.

Regards,
Umesh

> 	/*
> 	 * Fill all engines with background load.
> 	 * This verifies that independent engines are unaffected and gives
>@@ -317,6 +323,9 @@ test_engine_hang(const intel_ctx_t *ctx,
> 	 */
> 	num_ctx = 0;
> 	for_each_ctx_engine(device, ctx, other) {
>+		if (other->class == skip_class)
>+			continue;
>+
> 		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
> 		context_unban(device, local_ctx[num_ctx]->id);
> 		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
>-- 
>2.34.1
>
