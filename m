Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F2E10EB2E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 13:29:03 +0000 (UTC)
Date: Wed, 9 Mar 2022 14:28:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YiirmxorwOEmW/PQ@kamilkon-DESK1>
References: <20220309094719.144716-1-priyanka.dandamudi@intel.com>
 <20220309094719.144716-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220309094719.144716-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_ctx_exec: Added test
 description for testcase
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

Hi Priyanka,

please do not resend this, I missed two issues. I would be
gratefull if you could reply to first question below.

Dnia 2022-03-09 at 15:17:18 +0530, priyanka.dandamudi@intel.com napisał(a):
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description to all the available subtests.
> 
> v2: Added description for newly added test case.
> 
> v3: Modified test descriptions.
> 
> Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
<cut>
>  
> +	igt_describe("Verify that contexts are automatically shotdown"
------------------------------------------------------------ ^
Did you mean "shutdown" here ?

> +		     " on close, if hangchecking is disabled.");

>  	igt_subtest("basic-nohangcheck")
>  		nohangcheck_hostile(fd);
>  
> +	igt_describe("Race the execution and interrupt handlers along a context,"
> +	             " while closing it at a random time.");
-- ^^^
I missed it here, there are too many spaces. You can catch it
with checkpatch or use editor to show white chars (tabs, spaces).

>  	igt_subtest_group {
>  		igt_fixture {
>  			intel_allocator_multiprocess_start();
> @@ -505,6 +515,8 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Check if the kernel doesn't leak the vma"
> +		     " pin_count for the last context on reset.");
>  	igt_subtest("reset-pin-leak") {
>  		int i;
>  		uint64_t ahnd;
> -- 
> 2.25.1
> 

Regards,
Kamil
