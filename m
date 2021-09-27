Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF016E826
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Sep 2021 04:09:41 +0000 (UTC)
Date: Mon, 27 Sep 2021 09:31:49 +0530
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Message-ID: <20210927040149.GA28615@arjun-NUC8i7BEH>
References: <20210922230344.41384-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922230344.41384-1-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_cs_tlb: Drop
 gem_require_ring() check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 22, 2021 at 04:03:44PM -0700, Ashutosh Dixit wrote:
> 80f48722f429 ("tests/i915/gem_cs_tlb: Convert to intel_ctx_t") passes a
> intel_ctx_t (initialized with intel_ctx_create_all_physical()) into
> run_on_ring(). However gem_require_ring() checks if the ring is available
> to context 0, not the intel_ctx_t which is passed in. This will cause the
> test to skip for all engines not available to context 0. Hence drop the
> gem_require_ring() check since we already know that the intel_ctx_t has all
> physical engines available to it.
> 
> Cc: "Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>"
> Fixes: 80f48722f429 ("tests/i915/gem_cs_tlb: Convert to intel_ctx_t")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/i915/gem_cs_tlb.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/i915/gem_cs_tlb.c b/tests/i915/gem_cs_tlb.c
> index 7a88866501c..2117b41e47c 100644
> --- a/tests/i915/gem_cs_tlb.c
> +++ b/tests/i915/gem_cs_tlb.c
> @@ -102,7 +102,6 @@ static void run_on_ring(int fd, const intel_ctx_t *ctx,
>  	} obj[2];
>  	unsigned i;
>  
> -	gem_require_ring(fd, ring_id);
>  	igt_require(has_softpin(fd));
LGTM:
Reviewed-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
>  
>  	for (i = 0; i < 2; i++) {
> -- 
> 2.33.0
> 
