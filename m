Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFD614B089
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Jul 2022 10:12:05 +0000 (UTC)
Date: Tue, 19 Jul 2022 12:12:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YtaDct4VbiXWfqHv@kamilkon-desk1>
References: <20220719072451.12323-1-zbigniew.kempczynski@intel.com>
 <20220719072451.12323-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220719072451.12323-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/perf_pmu: Add softpin
 flag for no-reloc path
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

On 2022-07-19 at 09:24:50 +0200, Zbigniew Kempczyński wrote:
> As Chris noticed semaphore object doesn't have EXEC_OBJECT_PINNED flag.
> It is likely not a problem as we provide offsets from reloc allocator
> thus there's no risk of overlapping offsets. But for purity ensure
> we passed pinned flag when we're in softpin mode.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

lgtm,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/perf_pmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index 1e385bebc7..39e9fc5fef 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -861,6 +861,7 @@ __sema_busy(int gem_fd, uint64_t ahnd, int pmu, const intel_ctx_t *ctx,
>  		.handle = create_sema(gem_fd, ahnd, reloc, &obj.offset),
>  		.relocation_count = !ahnd ? 2 : 0,
>  		.relocs_ptr = to_user_pointer(reloc),
> +		.flags = !ahnd ? 0 : EXEC_OBJECT_PINNED,
>  	};
>  	struct drm_i915_gem_execbuffer2 eb = {
>  		.batch_start_offset = 64,
> -- 
> 2.34.1
> 
