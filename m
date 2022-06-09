Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BFF11ACE7
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jun 2022 11:24:55 +0000 (UTC)
Date: Thu, 9 Jun 2022 13:24:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YqHYgxmauZ4QURN3@kamilkon-desk1>
References: <20220608055508.339194-1-sinjan.kumar@intel.com>
 <20220608055508.339194-2-sinjan.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220608055508.339194-2-sinjan.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH 1/2] i915/gem_exec_fair: Add subtests
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

On 2022-06-08 at 11:25:07 +0530, sinjan.kumar@intel.com wrote:
> From: Sinjan Kumar <sinjan.kumar@intel.com>
> 
> add subtest description
- ^ -------- ^---------- ^^

This can be improved a little: Add subtests descriptions.

> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: Sinjan Kumar <sinjan.kumar@intel.com>
> ---
>  tests/i915/gem_exec_fair.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
> index 935f9c4a..f856be1d 100644
> --- a/tests/i915/gem_exec_fair.c
> +++ b/tests/i915/gem_exec_fair.c
> @@ -1351,8 +1351,15 @@ igt_main
>  		}
>  	}
>  
> +        igt_describe("Test forks N independent clients and put an equal "
> +                     "amount of work in client and asserts that all of "
> +                     "them finishes within the given timeline.");

Please do not write down exact code steps taken, rather than
that try to describe what subtest is doing. Search for
igt_describe inside lib/igt_core.h for tips. You may also run
git log to see history (maybe with -p option):

git log tests/i915/gem_exec_fair.c

Other way you can try reaching to developer(s) who written these
tests, for example on irc, or search mailing list history.

Last one, after you add description, compile it and run with:

sudo ./gem_exec_fair --describe

to see what other ones are missing.

>  	igt_subtest("basic-deadline")
>  		deadline(i915, &cfg, 2, 0);
> +        igt_describe("Test forks N independent clients and put an equal "
> +                     "amount of work in client and asserts that all of "
> +                     "them finishes within the given timeline "
> +                     "when task priority is also set.");

imho this one also needs improvement. You can work on other
descriptions step by step, just extend this patch, so it will
be only one patch per test file.

Regards,
Kamil

>  	igt_subtest("deadline-prio")
>  		deadline(i915, &cfg, 2, DL_PRIO);
>  
> -- 
> 2.25.1
> 
