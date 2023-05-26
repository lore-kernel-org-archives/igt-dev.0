Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CBC10E1C6
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 12:25:11 +0000 (UTC)
Date: Fri, 26 May 2023 14:25:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230526122507.5egosg4zjnucllwz@kamilkon-desk1>
References: <20230526064624.2886063-1-mauro.chehab@linux.intel.com>
 <20230526064624.2886063-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230526064624.2886063-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/perf_pmu: sync documentation
 with latest changes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-05-26 at 08:46:23 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> There are some changes on some test names since when the
> documentation was generated for this file.
> 
> Update it to keep in sync with the actual tests.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/perf_pmu.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index 2aa018e13aff..8b31df7b229e 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -145,9 +145,6 @@
>   * Feature: i915 pmu perf interface, pmu
>   * Test category: Perf
>   *
> - * SUBTEST: frequency-idle
> - * Feature: pmu
> - *
>   * SUBTEST: gt-awake
>   * Description: Setup workload on all engines,measure gt awake time via pmu
>   * Feature: i915 pmu perf interface, pmu
> @@ -226,10 +223,7 @@
>   * SUBTEST: rc6
>   * Feature: pmu
>   *
> - * SUBTEST: rc6-runtime-pm
> - * Feature: pmu
> - *
> - * SUBTEST: rc6-runtime-pm-long
> + * SUBTEST: rc6-all-gts
>   * Feature: pmu
>   *
>   * SUBTEST: rc6-suspend
> -- 
> 2.40.1
> 

