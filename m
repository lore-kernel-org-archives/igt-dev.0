Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1731B6EB6C
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 17:00:30 +0000 (UTC)
From: "Ram Moon, AnandX" <anandx.ram.moon@intel.com>
Date: Thu, 25 Mar 2021 17:00:23 +0000
Message-ID: <SA2PR11MB506802C6FA1E00C55F8A6A6AAE629@SA2PR11MB5068.namprd11.prod.outlook.com>
References: <20210325101404.2735-1-anandx.ram.moon@intel.com>
 <YFxqD25SKS/nDyBm@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YFxqD25SKS/nDyBm@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/i915/perf: Added check for testcase to
 get discarded on less than gen12 platform
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
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

-----Original Message-----
From: Latvala, Petri <petri.latvala@intel.com> 
Sent: Thursday, March 25, 2021 4:17 PM
To: Ram Moon, AnandX <anandx.ram.moon@intel.com>
Cc: igt-dev@lists.freedesktop.org; Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/i915/perf: Added check for testcase to get discarded on less than gen12 platform

On Thu, Mar 25, 2021 at 03:44:04PM +0530, Anand Moon wrote:
> Added check for testcase to get discarded on less than gen12 platform
> 
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Anand Moon <anandx.ram.moon@intel.com>
> ---
>  tests/i915/perf.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c index 
> 664fd0a9..18cf9fb1 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -5062,19 +5062,20 @@ igt_main
>  	}
>  
>  	igt_subtest_group {
> -		igt_fixture igt_require(intel_gen(devid) >= 12);
> +		if (intel_gen(devid) >= 12) {


You can't do that. Tests must exist regardless of the running platform.

Thanks for the input. So to resolve this issue I need to fix the subtest. 

--
Petri Latvala

-Anand


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
