Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B982510F506
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 07:36:30 +0000 (UTC)
Date: Wed, 6 Apr 2022 10:36:08 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Yk1C6J/r+Lgl/cFZ@platvala-desk.ger.corp.intel.com>
References: <20220405211913.2728176-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405211913.2728176-1-lucas.demarchi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel-ci/fast-feedback: Move
 gem_lmem_swapping
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 nirmoy.das@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 05, 2022 at 02:19:13PM -0700, Lucas De Marchi wrote:
> Since commit 37ec3b8ffd2c ("tests/gem_lmem_swapping: limit lmem to 4G")
> we load the driver with limited 4GB of lmem for test execution. However
> this means we also have to 1) reload the driver with that param set and
> 2) unload it after we are done. However tests/intel-ci/fast-feedback.testlist
> has a dedicated section for tests that rely on module (un|re)loading so
> not to impact other tests.
> 
> Move all gem_lmem_swapping to that section, after the coment:
> 
> 	# All tests that do module unloading and reloading are executed last.
> 	# They will sometimes reveal issues of earlier tests leaving the
> 	# driver in a broken state that is not otherwise noticed in that test.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Damn, I missed this when reviewing.

Acked-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/intel-ci/fast-feedback.testlist | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index c1014558..e24d2fa4 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -34,10 +34,6 @@ igt@gem_flink_basic@double-flink
>  igt@gem_flink_basic@flink-lifetime
>  igt@gem_huc_copy@huc-copy
>  igt@gem_linear_blits@basic
> -igt@gem_lmem_swapping@basic
> -igt@gem_lmem_swapping@parallel-random-engines
> -igt@gem_lmem_swapping@random-engines
> -igt@gem_lmem_swapping@verify-random
>  igt@gem_mmap@basic
>  igt@gem_mmap_gtt@basic
>  igt@gem_render_linear_blits@basic
> @@ -170,6 +166,10 @@ igt@vgem_basic@sysfs
>  # They will sometimes reveal issues of earlier tests leaving the
>  # driver in a broken state that is not otherwise noticed in that test.
>  
> +igt@gem_lmem_swapping@basic
> +igt@gem_lmem_swapping@parallel-random-engines
> +igt@gem_lmem_swapping@random-engines
> +igt@gem_lmem_swapping@verify-random
>  igt@core_hotunplug@unbind-rebind
>  igt@vgem_basic@unload
>  igt@i915_module_load@reload
> -- 
> 2.35.1
> 
