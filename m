Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512D010E7AC
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 17:13:15 +0000 (UTC)
Date: Wed, 11 Jan 2023 18:11:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230111171127.glzhu2slv45aejzk@kamilkon-desk1>
References: <20230111080809.136425-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230111080809.136425-1-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc: Fixed dc6-dpms
 test description
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

Hi,

On 2023-01-11 at 13:38:09 +0530, Mohammed Thasleem wrote:
> Corrected typo in dc6-dpms test discription.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

btw this should go with HAX and no tests running as it only
changes description.

Regards,
Kamil

> ---
>  tests/i915/i915_pm_dc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index ba49d014..36c50667 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -552,7 +552,7 @@ igt_main
>  		test_dc_state_dpms(&data, CHECK_DC5);
>  	}
>  
> -	igt_describe("This test validates display engine entry to DC5 state "
> +	igt_describe("This test validates display engine entry to DC6 state "
>  		     "while all connectors's DPMS property set to OFF");
>  	igt_subtest("dc6-dpms") {
>  		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> -- 
> 2.25.1
> 
