Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F80010E1F6
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 09:24:11 +0000 (UTC)
Date: Fri, 3 Feb 2023 10:24:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230203092406.2q2j22z3stpcplp5@kamilkon-desk1>
References: <20230202172744.22955-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230202172744.22955-1-nirmoy.das@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] i915/gem_exec_params: Cross-check
 getparam against engine execution
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nirmoy,

LGTM,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

On 2023-02-02 at 18:27:44 +0100, Nirmoy Das wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Do not just skip the test if getparam for bsd, blt, vebox passes.
> Be more robust and compare result of getparam with a engine execution
> which should give more test coverage.
> 
> v2: improve commit message and keep RUN_FAIL()(Kamil)
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Co-developed-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/i915/gem_exec_params.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
> index 618635ec3..fd86afa16 100644
> --- a/tests/i915/gem_exec_params.c
> +++ b/tests/i915/gem_exec_params.c
> @@ -411,24 +411,23 @@ igt_main
>  	igt_subtest("mmapped")
>  		mmapped(fd);
>  
> -#define RUN_FAIL(expected_errno) do { \
> -		igt_assert_eq(__gem_execbuf(fd, &execbuf), -expected_errno); \
> -	} while(0)
> +#define CHK_RUN(has_check, expected_errno) \
> +		igt_assert_eq(__gem_execbuf(fd, &execbuf), has_check(fd) ? 0 : -(expected_errno))
> +#define RUN_FAIL(expected_errno) \
> +		igt_assert_eq(__gem_execbuf(fd, &execbuf), -(expected_errno))
> +
>  
>  	igt_subtest("no-bsd") {
> -		igt_require(!gem_has_bsd(fd));
>  		execbuf.flags = I915_EXEC_BSD;
> -		RUN_FAIL(EINVAL);
> +		CHK_RUN(gem_has_bsd, EINVAL);
>  	}
>  	igt_subtest("no-blt") {
> -		igt_require(!gem_has_blt(fd));
>  		execbuf.flags = I915_EXEC_BLT;
> -		RUN_FAIL(EINVAL);
> +		CHK_RUN(gem_has_blt, EINVAL);
>  	}
>  	igt_subtest("no-vebox") {
> -		igt_require(!gem_has_vebox(fd));
>  		execbuf.flags = I915_EXEC_VEBOX;
> -		RUN_FAIL(EINVAL);
> +		CHK_RUN(gem_has_vebox, EINVAL);
>  	}
>  	igt_subtest("invalid-ring") {
>  		execbuf.flags = I915_EXEC_RING_MASK;
> -- 
> 2.39.0
> 
