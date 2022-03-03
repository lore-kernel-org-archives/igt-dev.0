Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F1710E205
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Mar 2022 15:35:13 +0000 (UTC)
Date: Thu, 3 Mar 2022 16:35:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YiDgLIY3Pk7LkJct@kamilkon-DESK1>
References: <20220223133457.351501-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220223133457.351501-1-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v2] i915/gem_wait: Add description for test and subtests
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

Dnia 2022-02-23 at 19:04:57 +0530, apoorva1.singh@intel.com napisał(a):
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Add description for test and all the subtests
> 
> v2: Rebase

Please do not rebase when it is not needed, this patch will
apply unless someone makes other changes to this file. You can
rebase when you will make some changes to your patch. The main
reason why not send it when no change in patch was done, is that
it goes to CI testing, but there is no new functionality in it
(despite description).

Before sending new version, please wait until discussion about
such patches will end, see RFC post from Zbigniew with HAX in
subject.

> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_wait.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
> index b17927b6..9f84ef33 100644
> --- a/tests/i915/gem_wait.c
> +++ b/tests/i915/gem_wait.c
> @@ -32,6 +32,8 @@
>  #include "igt.h"
>  #include "igt_vgem.h"
>  
> +IGT_TEST_DESCRIPTION("Tests the GEM_WAIT ioctl");
> +
>  static int __gem_wait(int fd, struct drm_i915_gem_wait *w)
>  {
>  	int err;
> @@ -185,9 +187,11 @@ igt_main
>  		ctx = intel_ctx_create_all_physical(fd);
>  	}
>  
> +	igt_describe("Tests that GEM_WAIT ioctl returns relevant error with invalid flag");

s/ioctl//

Description it is a little unfortunate, please rewrite it, for
example:

"Verify that GEM_WAIT called with invalid flag will fail."

Please also split text if needed to keep whole line under 80 chars.
It can sometimes be a little longer, but please try to keep it
under 80.

>  	igt_subtest("invalid-flags")
>  		invalid_flags(fd);
>  
> +	igt_describe("Tests that GEM_WAIT ioctl returns relevant error with invalid buffer object");

Same here, rewrite it.

>  	igt_subtest("invalid-buf")
>  		invalid_buf(fd);
>  
> @@ -209,8 +213,11 @@ igt_main
>  			igt_fork_signal_helper();
>  		}
>  
> -		for (const typeof(*tests) *t = tests; t->name; t++)
> +		for (const typeof(*tests) *t = tests; t->name; t++) {
> +			igt_describe_f("For all engines, test the GEM_WAIT ioctl waiting on "
> +				       "buffer object in %s mode", t->name);

Rewrite this here, look like it is testing basic functionality,
so maybe something like:

Verify GEM_WAIT basic functionality in %s mode.

>  			test_all_engines(t->name, fd, ctx, t->flags);
> +		}
>  
>  		igt_fixture {
>  			igt_stop_signal_helper();
> @@ -236,8 +243,11 @@ igt_main
>  			igt_fork_signal_helper();
>  		}
>  
> -		for (const typeof(*tests) *t = tests; t->name; t++)
> +		for (const typeof(*tests) *t = tests; t->name; t++) {
> +			igt_describe_f("For all engines, test the GEM_WAIT ioctl waiting on "
> +				       "buffer object in %s mode when hang is allowed", (t->name+5));

Same here, rewrite it.

>  			test_all_engines(t->name, fd, ctx, t->flags);
> +		}
>  
>  		igt_fixture {
>  			igt_stop_signal_helper();
> -- 
> 2.25.1
>

Regards,
Kamil
