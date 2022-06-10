Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8C910EA47
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 12:49:06 +0000 (UTC)
Date: Fri, 10 Jun 2022 14:49:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YqM9vuQPzhgb/vwA@kamilkon-desk1>
References: <20220610054834.469387-1-sinjan.kumar@intel.com>
 <20220610054834.469387-2-sinjan.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220610054834.469387-2-sinjan.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH 1/2] i915/gem_exec_await: Add subtests
 description
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

Hi Sinjan,

On 2022-06-10 at 11:18:33 +0530, sinjan.kumar@intel.com wrote:
> From: Sinjan Kumar <sinjan.kumar@intel.com>
> 
> Add subtest description for the following subtest
> 1. wide-all
> 2. wide-context

You do not need to add this here, it will be better placed in
cover letter.

> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: Sinjan Kumar <sinjan.kumar@intel.com>
> ---
>  tests/i915/gem_exec_await.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
> index 4935cf39..dc8d0255 100644
> --- a/tests/i915/gem_exec_await.c
> +++ b/tests/i915/gem_exec_await.c
> @@ -276,9 +276,13 @@ igt_main
>  		igt_fork_hang_detector(device);
>  	}

Please add also global description of this test, please see for
other tests descrption, like gem_exec_basic.

>  
> +        igt_describe("Test to catch GPU hang by executing batch buffer "
> +                     "in a loop for the given timeout period.");

Please change this description, look at commit messages in git,
git log tests/i915/gem_exec_await.c

and when you see commit about moving tests into i195 folder,
use its hash to search further:

git log 741bf7064c46 -- tests/gem_exec_await.c

>  	igt_subtest("wide-all")
>  		wide(device, ctx, ring_size, TIMEOUT, 0);
>  
> +        igt_describe("Test to catch GPU hang by creating context and executing "
> +                     "batch buffer in a loop for the given timeout period.");

Same here, change it.

One last thing, use checkpatch script from linux kernel to catch
possible errors, here you used spaces at begin of line instead of
tabs, see log from checkpatch:

checkpatch 0002-i915-Add-subtests-description.patch

ERROR: code indent should use tabs where possible
#25: FILE: tests/i915/gem_exec_await.c:279:
+        igt_describe("Test to catch GPU hang by executing batch buffer "$

WARNING: please, no spaces at the start of a line
#25: FILE: tests/i915/gem_exec_await.c:279:
+        igt_describe("Test to catch GPU hang by executing batch buffer "$

Regards,
Kamil

>  	igt_subtest("wide-contexts") {
>  		gem_require_contexts(device);
>  		wide(device, ctx, ring_size, TIMEOUT, CONTEXTS);
> -- 
> 2.25.1
> 
