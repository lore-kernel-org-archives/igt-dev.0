Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3222F6E1D2
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2020 12:22:45 +0000 (UTC)
Date: Wed, 8 Jan 2020 13:22:42 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20200108122242.GD18397@kdec5-desk.ger.corp.intel.com>
References: <20200108053437.6268-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108053437.6268-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] i915/gem_exec_basic: Use dynamic
 subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 08, 2020 at 07:34:37AM +0200, Petri Latvala wrote:
> Instead of generating a subtest for each engine in a static list,
> convert to dynamic subtests, with one dynamic subtest per actually
> present physical engine.
> 
> v2:
>  - Remove the now-redundant *-all subtests
>  - Use the "basic" subtest in intel-ci/fast-feedback.testlist
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Reviewed-by: Katarzyna Dec <katarzyna.dec@intel.com>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/i915/gem_exec_basic.c           | 55 +++++++++------------------
>  tests/intel-ci/fast-feedback.testlist |  2 +-
>  2 files changed, 18 insertions(+), 39 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
> index 1287860b..70dce34b 100644
> --- a/tests/i915/gem_exec_basic.c
> +++ b/tests/i915/gem_exec_basic.c
> @@ -114,30 +114,6 @@ static void gtt(int fd, uint64_t flags)
>  	munmap(execbuf, 4096);
>  }
>  
> -static void all(int i915)
> -{
> -	const struct intel_execution_engine2 *e;
> -
> -	__for_each_physical_engine(i915, e)
> -		noop(i915, e->flags);
> -}
> -
> -static void readonly_all(int i915)
> -{
> -	const struct intel_execution_engine2 *e;
> -
> -	__for_each_physical_engine(i915, e)
> -		readonly(i915, e->flags);
> -}
> -
> -static void gtt_all(int i915)
> -{
> -	const struct intel_execution_engine2 *e;
> -
> -	__for_each_physical_engine(i915, e)
> -		gtt(i915, e->flags);
> -}
> -
>  igt_main
>  {
>  	const struct intel_execution_engine2 *e;
> @@ -150,22 +126,25 @@ igt_main
>  		igt_fork_hang_detector(fd);
>  	}
>  
> -	igt_subtest("basic-all")
> -		all(fd);
> -
> -	igt_subtest("readonly-all")
> -		readonly_all(fd);
> +	igt_subtest_with_dynamic("basic") {
> +		__for_each_physical_engine(fd, e) {
> +			igt_dynamic_f("%s", e->name)
> +				noop(fd, e->flags);
> +		}
> +	}
>  
> -	igt_subtest("gtt-all")
> -		gtt_all(fd);
> +	igt_subtest_with_dynamic("readonly") {
> +		__for_each_physical_engine(fd, e) {
> +			igt_dynamic_f("%s", e->name)
> +				readonly(fd, e->flags);
> +		}
> +	}
>  
> -	__for_each_physical_engine(fd, e) {
> -		igt_subtest_f("basic-%s", e->name)
> -			noop(fd, e->flags);
> -		igt_subtest_f("readonly-%s", e->name)
> -			readonly(fd, e->flags);
> -		igt_subtest_f("gtt-%s", e->name)
> -			gtt(fd, e->flags);
> +	igt_subtest_with_dynamic("gtt") {
> +		__for_each_physical_engine(fd, e) {
> +			igt_dynamic_f("%s", e->name)
> +				gtt(fd, e->flags);
> +		}
>  	}
>  
>  	igt_fixture {
Acked-by: Katarzyna Dec <katarzyna.dec@intel.com>
Kasia :)
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 71dc99a6..8081446e 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -16,7 +16,7 @@ igt@gem_ctx_param@basic
>  igt@gem_ctx_param@basic-default
>  igt@gem_ctx_switch@legacy-render
>  igt@gem_ctx_switch@rcs0
> -igt@gem_exec_basic@basic-all
> +igt@gem_exec_basic@basic
>  igt@gem_exec_create@basic
>  igt@gem_exec_fence@basic-busy-default
>  igt@gem_exec_fence@basic-wait-default
> -- 
> 2.20.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
