Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CA910E58F
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jun 2023 09:53:23 +0000 (UTC)
Date: Fri, 16 Jun 2023 11:53:19 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230616095319.pycxpn4wa6mkddmp@zkempczy-mobl2>
References: <20230612171908.29906-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230612171908.29906-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] igt_core: Avoid exit_subtest in
 subthread
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 07:19:08PM +0200, Kamil Konieczny wrote:
> From: Petri Latvala <petri.latvala@intel.com>
> 
> If a thread crashes, the signal handler for SIGSEGV and pals try to
> make the subtest fail and eventually longjmps out of the
> subtest. Naturally this can cause multiple threads to yield subtest
> results and other weirdness.
> 
> We already check for non-main-thread in igt_fail_assert() but the path
> from a signal handler to subtest exit doesn't have such protection.
> 

I'm sorry you had to wait so long for the review. Change looks safe
for me, I mean exit_subtest() won't try to n-time reinitialize
allocator and other global data.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


> Cc: Petri Latvala <adrinael@adrinael.net>
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index cd9c2002d..1d8e3a6ee 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -1585,6 +1585,11 @@ __noreturn static void exit_subtest(const char *result)
>  	struct timespec *thentime = in_dynamic_subtest ? &dynamic_subtest_time : &subtest_time;
>  	jmp_buf *jmptarget = in_dynamic_subtest ? &igt_dynamic_jmpbuf : &igt_subtest_jmpbuf;
>  
> +	if (!igt_thread_is_main()) {
> +		igt_thread_fail();
> +		pthread_exit(NULL);
> +	}
> +
>  	igt_gettime(&now);
>  
>  	if (test_multi_fork_child)
> -- 
> 2.39.2
> 
