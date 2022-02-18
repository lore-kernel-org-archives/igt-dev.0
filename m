Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4879210F0D8
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Feb 2022 13:34:46 +0000 (UTC)
Date: Fri, 18 Feb 2022 14:34:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yg+gcdqp/xKNGBJQ@kamilkon-DESK1>
References: <20220216051636.2445965-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220216051636.2445965-1-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v2] i915/i915_getparams_basic: Added test description for test case
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

Hi Apoorva,

Dnia 2022-02-16 at 10:46:36 +0530, apoorva1.singh@intel.com napisał(a):
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Added test description to all the available subtests.
> 
> v2: Rebase
> 
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> ---
>  tests/i915/i915_getparams_basic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/i915_getparams_basic.c b/tests/i915/i915_getparams_basic.c
> index 09b38d8a..5422d585 100644
> --- a/tests/i915/i915_getparams_basic.c
> +++ b/tests/i915/i915_getparams_basic.c
> @@ -153,9 +153,11 @@ igt_main
>  		init();
>  	}
>  
> +	igt_describe("Examine the export of SUBSLICE_TOTAL parameter");
>  	igt_subtest("basic-subslice-total")
>  		subslice_total();
>  
> +	igt_describe("Examine the export of EU_TOTAL parameter");
>  	igt_subtest("basic-eu-total")
>  		eu_total();
>  }
> -- 
> 2.25.1
> 
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil
