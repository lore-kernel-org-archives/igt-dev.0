Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9620010E02F
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 19:08:31 +0000 (UTC)
Date: Fri, 7 Oct 2022 21:08:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y0B5GS3uCf3+ltXT@kamilkon-desk1>
References: <20221007145241.44592-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221007145241.44592-1-jfree@freebsd.org>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/tests/igt_fork.c: Fix error in
 mmap() flags
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>, Petri Latvala <petri.latvala@intel.com>,
 Jake Freeland <jake@technologyfriends.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jake,

On 2022-10-07 at 09:52:41 -0500, Jake Freeland wrote:
> In subtest_leak(), mmap() is called with the flag PROT_WRITE,
> but no PROT_READ. Later in the function, the mapped memory is
> read using `children[i]`. In FreeBSD, the lack of PROT_READ
> causes SIGSEGV. Adding the PROT_READ flag to the mmap() call
> fixes this.
> 
> Signed-off-by: Jake Freeland <jfree@freebsd.org>

Please note that when you got r-b (review-by) and you do just
resend with no modifications to your patch, you can add r-b
tag to this one patch which got r-b and send it. It will save
time for other people.

Please also read e-mails from CI when it says there was a
failure and if that is unrelated, replay with cc: to Lakshmi
Lakshminarayana Vudum <lakshminarayana.vudum@intel.com> 
and ask for adding exception and rescan.

Regards,
Kamil

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/tests/igt_fork.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c
> index d19d0945..d883aba4 100644
> --- a/lib/tests/igt_fork.c
> +++ b/lib/tests/igt_fork.c
> @@ -109,7 +109,7 @@ __noreturn static void igt_fork_timeout_leak(void)
>  __noreturn static void subtest_leak(void)
>  {
>  	pid_t *children =
> -		mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +		mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>  	const int num_children = 4096 / sizeof(*children);
>  
>  	igt_subtest_init(fake_argc, fake_argv);
> -- 
> 2.37.0 (Apple Git-136)
> 
