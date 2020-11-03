Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A546E0A5
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2020 08:06:49 +0000 (UTC)
Date: Tue, 3 Nov 2020 10:06:44 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201103080644.GN7444@platvala-desk.ger.corp.intel.com>
References: <20201102194957.30123-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102194957.30123-1-umesh.nerlige.ramappa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf: Make sure i915 is loaded
 before reading proc
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 11:49:57AM -0800, Umesh Nerlige Ramappa wrote:
> The previous test may have unloaded i915 or failed to load it back. To
> combat such cases, each test fixture is supposed to ensure that i915 is
> loaded prior to running the subtests. In most fixtures this happens
> automatically when we try to get a handle to i915. In perf OA, we stat
> some proc/sys files even before getting a handle to i915. Occassionally,
> perf tests fail trying to stat these files. Fix perf OA by checking and
> loading i915 if it's not loaded.
> 
> v2: Use drm_load_module() (Petri)
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/405
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---


Excellent, thanks. I would slap an R-b here but it's already in :P


-- 
Petri Latvala



>  tests/i915/perf.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index a5c4adc3..caeabd62 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -4806,6 +4806,13 @@ igt_main
>  	igt_fixture {
>  		struct stat sb;
>  
> +		/*
> +		 * Prior tests may have unloaded i915 or failed while
> +		 * loading/unloading i915. Load i915 here before we stat the
> +		 * files.
> +		 */
> +		drm_load_module(DRIVER_INTEL);
> +
>  		igt_require(stat("/proc/sys/dev/i915/perf_stream_paranoid", &sb)
>  			    == 0);
>  		igt_require(stat("/proc/sys/dev/i915/oa_max_sample_rate", &sb)
> -- 
> 2.20.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
