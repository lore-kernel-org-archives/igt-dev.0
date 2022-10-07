Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AEA10E323
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 15:05:22 +0000 (UTC)
Date: Fri, 7 Oct 2022 18:04:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jake Freeland <jake@technologyfriends.net>
Message-ID: <Y0BAFmzQs1faXzN7@intel.com>
References: <20221007145241.44592-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: igt-dev@lists.freedesktop.org, Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 07, 2022 at 09:52:41AM -0500, Jake Freeland wrote:
> In subtest_leak(), mmap() is called with the flag PROT_WRITE,
> but no PROT_READ. Later in the function, the mapped memory is
> read using `children[i]`. In FreeBSD, the lack of PROT_READ
> causes SIGSEGV. Adding the PROT_READ flag to the mmap() call
> fixes this.

Isn't it a CPU architecture thing rather than an OS thing?
Well, I guess it could be both in some cases.

> 
> Signed-off-by: Jake Freeland <jfree@freebsd.org>
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

-- 
Ville Syrjälä
Intel
