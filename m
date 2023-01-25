Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820B010E00B
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 13:34:06 +0000 (UTC)
Date: Wed, 25 Jan 2023 15:31:01 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <Y9EvFaMNnkAeMI8v@platvala-desk.ger.corp.intel.com>
References: <20230123151711.94167-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123151711.94167-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/prime_vgem: fix test listing
 problem
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

On Mon, Jan 23, 2023 at 04:17:11PM +0100, Kamil Konieczny wrote:
> Move call to function with possible usage of card fd inside
> fixture, as uses of fd are allowed inside fixtures or subtests.
> This may eliminate problem when using --list-subtests option,
> depending on implementation it can assert like:
> 
> sudo build/tests/prime_vgem --list-subtests
> ...
> coherency-blt
> (prime_vgem:259195) intel_ctx-CRITICAL: Test assertion failure function intel_ctx_create_all_physical, file ../lib/intel_ctx.c:344:
> (prime_vgem:259195) intel_ctx-CRITICAL: Failed assertion: err == 0
> (prime_vgem:259195) intel_ctx-CRITICAL: error: -9 != 0
> Test prime_vgem failed.
> 
> v2: improve commit messages and use fixtures for create and
>   destroy of context (Petri)
> 
> Reported-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/prime_vgem.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index f876e748..06be273c 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -1093,7 +1093,10 @@ static void test_each_engine(const char *name, int vgem, int i915,
>  					unsigned int flags))
>  {
>  	const struct intel_execution_engine2 *e;
> -	const intel_ctx_t *ctx = intel_ctx_create_all_physical(i915);
> +	const intel_ctx_t *ctx;
> +
> +	igt_fixture
> +		ctx = intel_ctx_create_all_physical(i915);
>  
>  	igt_subtest_with_dynamic(name) {
>  		for_each_ctx_engine(i915, ctx, e) {
> @@ -1110,7 +1113,8 @@ static void test_each_engine(const char *name, int vgem, int i915,
>  		}
>  	}
>  
> -	intel_ctx_destroy(i915, ctx);
> +	igt_fixture
> +		intel_ctx_destroy(i915, ctx);
>  }
>  
>  igt_main
> -- 
> 2.37.2
> 
