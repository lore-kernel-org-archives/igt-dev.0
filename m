Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417CD10E7AD
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 17:12:23 +0000 (UTC)
Date: Wed, 11 Jan 2023 18:09:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230111170934.tsx4evphbcjhrknr@kamilkon-desk1>
References: <20230111102633.27518-1-zbigniew.kempczynski@intel.com>
 <20230111102633.27518-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230111102633.27518-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] i915/gem_mmap_offset: Avoid FPE in
 calculating npages to clear
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-01-11 at 11:26:33 +0100, Zbigniew Kempczyński wrote:
> Add a small delay (ala gem_create/clear) to busywait when we run out of
> pages to allocate, avoid the FPE and continue on a bit later once the
> other threads have released some pages of their own.
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/7788
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/gem_mmap_offset.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index b38b7edae3..962fc1b739 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -673,8 +673,13 @@ static uint64_t get_npages(_Atomic(uint64_t) *global, uint64_t npages)
>  
>  	max = *global;
>  	do {
> +		while (max < 16) {
> +			usleep(10);
> +			max = *global;
> +		}
> +
>  		old = max;
> -		try = 1 + npages % (max / 2);
> +		try = 1 + npages % (max / 2 - 1);
>  		max -= try;
>  	} while ((max = atomic_compare_swap_u64(global, old, max)) != old);
>  
> -- 
> 2.34.1
> 
