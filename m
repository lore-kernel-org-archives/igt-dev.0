Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0246A6E459
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2020 09:48:08 +0000 (UTC)
Date: Mon, 2 Nov 2020 11:48:04 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201102094804.GK7444@platvala-desk.ger.corp.intel.com>
References: <20201030225548.7444-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030225548.7444-1-umesh.nerlige.ramappa@intel.com>
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

On Fri, Oct 30, 2020 at 03:55:48PM -0700, Umesh Nerlige Ramappa wrote:
> The previous test may have unloaded i915 or failed to load it back. To
> combat such cases, each test fixture is supposed to ensure that i915 is
> loaded prior to running the subtests. In most fixtures this happens
> automatically when we try to get a handle to i915. In perf OA, we stat
> some proc/sys files even before getting a handle to i915. Occassionally,
> perf tests fail trying to stat these files. Fix perf OA by checking and
> loading i915 if it's not loaded.
> 
> v2: Remove the if check (Ashutosh)
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/405
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/i915/perf.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index a5c4adc3..bd8281bd 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -41,6 +41,7 @@
>  #include "i915/gem.h"
>  #include "i915/perf.h"
>  #include "igt.h"
> +#include "igt_kmod.h"
>  #include "igt_sysfs.h"
>  #include "drm.h"
>  
> @@ -4806,6 +4807,13 @@ igt_main
>  	igt_fixture {
>  		struct stat sb;
>  
> +		/*
> +		 * Prior tests may have unloaded i915 or failed while
> +		 * loading/unloading i915. Load i915 here before we stat the
> +		 * files.
> +		 */
> +		igt_i915_driver_load(NULL);
> +


Please use drm_load_module() instead, Chris's patch for exporting that
is now merged.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
