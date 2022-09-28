Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5575A10E0CB
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 08:45:43 +0000 (UTC)
Date: Wed, 28 Sep 2022 10:45:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YzQJs6BuVQFTjT51@kamilkon-desk1>
References: <20220928080227.5615-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220928080227.5615-1-dominik.karol.piatkowski@intel.com>
Subject: Re: [igt-dev] [i-g-t] i915/gem_spin_batch: Typo fix
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

On 2022-09-28 at 10:02:27 +0200, Dominik Karol Piatkowski wrote:
> Fixed undef typo in i915/gem_spin_batch.
> 
> Signed-off-by: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

When sending new patches in future please put PATCH before i-g-t
in subject line. Patch itself is ok, so

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/gem_spin_batch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
> index 9b39bfc7..7dc68ebc 100644
> --- a/tests/i915/gem_spin_batch.c
> +++ b/tests/i915/gem_spin_batch.c
> @@ -225,7 +225,7 @@ igt_main
>  	test_each_legacy_ring("legacy-resubmit-new")
>  		spin_resubmit(fd, intel_ctx_0(fd), eb_ring(e), RESUBMIT_NEW_CTX);
>  
> -#undef test_each_legcy_ring
> +#undef test_each_legacy_ring
>  
>  	igt_subtest("spin-all")
>  		spin_all(fd, ctx, 0);
> -- 
> 2.34.1
> 
