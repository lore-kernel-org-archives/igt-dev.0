Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A223210EEDF
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 11:46:34 +0000 (UTC)
Date: Tue, 31 May 2022 13:46:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YpYAFv+hmrYymDhO@kamilkon-desk1>
References: <20220531103033.31128-1-zbigniew.kempczynski@intel.com>
 <20220531103033.31128-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220531103033.31128-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_exec_schedule:
 Execute spinner in valid context
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

On 2022-05-31 at 12:30:33 +0200, Zbigniew Kempczyński wrote:
> Running spinner in default context is not correct because it can
> contain less engines than spinner expect. Fix this by setting
> appropriate context for this spinner.
> 
> Fixes: semaphore-noskip and u-semaphore-noskip
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_exec_schedule.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> index 43d9d06c09..8a2a4c0994 100644
> --- a/tests/i915/gem_exec_schedule.c
> +++ b/tests/i915/gem_exec_schedule.c
> @@ -1269,6 +1269,7 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
>  		eb.buffer_count = 2;
>  		eb.buffers_ptr = to_user_pointer(obj);
>  		eb.flags = inner->flags;
> +		eb.rsvd1 = ctx->id;
>  		gem_execbuf(i915, &eb);
>  
>  		igt_spin_set_timeout(chain, NSEC_PER_SEC / 100);
> -- 
> 2.32.0
> 

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
