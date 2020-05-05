Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53516E506
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 06:36:44 +0000 (UTC)
Date: Tue, 5 May 2020 09:36:42 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200505063642.GI9497@platvala-desk.ger.corp.intel.com>
References: <20200504112623.285610-1-arkadiusz.hiler@intel.com>
 <20200504112623.285610-2-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504112623.285610-2-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/igt_core: Disallow nesting of
 igt_dynamic inside igt_dynamic
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 04, 2020 at 02:26:22PM +0300, Arkadiusz Hiler wrote:
> igt_dynamic is allowed only inside igt_subtest_with_dynamic
> 
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/igt_core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 43f0ba8b..662a0986 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -1280,6 +1280,8 @@ bool __igt_run_dynamic_subtest(const char *dynamic_subtest_name)
>  {
>  	internal_assert(in_subtest && _igt_dynamic_tests_executed >= 0,
>  			"igt_dynamic is allowed only inside igt_subtest_with_dynamic\n");
> +	internal_assert(!in_dynamic_subtest,
> +			"igt_dynamic is not allowed to be nested in another igt_dynamic\n");
>  
>  	if (!valid_name_for_subtest(dynamic_subtest_name)) {
>  			igt_critical("Invalid dynamic subtest name \"%s\".\n",
> -- 
> 2.25.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
