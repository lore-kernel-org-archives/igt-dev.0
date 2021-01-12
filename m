Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5608B89F71
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jan 2021 06:41:27 +0000 (UTC)
Date: Tue, 12 Jan 2021 08:41:23 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20210112064123.GX7444@platvala-desk.ger.corp.intel.com>
References: <20210112015726.2785-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112015726.2785-1-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_suspend: Fix
 cached/uncached test names
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 11, 2021 at 08:57:26PM -0500, Ashutosh Dixit wrote:
> 9e7c581519 ("i915/gem_exec_suspend: Remove legacy ring abi") botched up
> cached/uncached test names. Fix these:
> 
> Before:
> 
> uncached-
> cached-
> uncached--S3
> cached--S3
> uncached--S4
> cached--S4
> 
> After:
> 
> uncached
> cached
> uncached-S3
> cached-S3
> uncached-S4
> cached-S4
> 
> Fixes: 9e7c581519 ("i915/gem_exec_suspend: Remove legacy ring abi")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/i915/gem_exec_suspend.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
> index a31dd6625..b6558a144 100644
> --- a/tests/i915/gem_exec_suspend.c
> +++ b/tests/i915/gem_exec_suspend.c
> @@ -297,7 +297,7 @@ igt_main
>  		run_test(fd, ALL_ENGINES, HIBERNATE);
>  
>  	for (m = modes; m->suffix; m++) {
> -		igt_subtest_with_dynamic_f("uncached-%s", m->suffix) {
> +		igt_subtest_with_dynamic_f("uncached%s", m->suffix) {
>  			__for_each_physical_engine(fd, e) {
>  				if (!gem_class_can_store_dword(fd, e->class))
>  					continue;
> @@ -306,7 +306,7 @@ igt_main
>  			}
>  		}
>  
> -		igt_subtest_with_dynamic_f("cached-%s", m->suffix) {
> +		igt_subtest_with_dynamic_f("cached%s", m->suffix) {
>  			__for_each_physical_engine(fd, e) {
>  				if (!gem_class_can_store_dword(fd, e->class))
>  					continue;


Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
