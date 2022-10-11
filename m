Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F72810E514
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 08:52:57 +0000 (UTC)
Date: Tue, 11 Oct 2022 10:52:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y0Uu5fp40unW+8KO@kamilkon-desk1>
References: <20221007210112.3153308-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221007210112.3153308-1-jfree@freebsd.org>
Subject: Re: [igt-dev] [PATCH i-g-t] [r-b] tests/i915/gem_mmap_*: Add NULL
 to ptrace() calls
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>,
 Jake Freeland <jake@technologyfriends.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jake,

On 2022-10-07 at 16:01:12 -0500, Jake Freeland wrote:
> In FreeBSD, the ptrace() function cannot take a variable
> length list of arguments. This patch adds NULL in the @data
> parameter to allow for compilation on FreeBSD systems.
> 
> Signed-off-by: Jake Freeland <jfree@freebsd.org>

When I wrote about "adding r-b" that means you can add:

Reviewed-by: Name of Reviewer <reviewer@address>

after your s-b (signed-off-by) line, so it will look like:

Signed-off-by: Jake Freeland <jfree@freebsd.org>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/i915/gem_mmap_gtt.c    | 2 +-
>  tests/i915/gem_mmap_offset.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> index e39b9047..4f05eb18 100644
> --- a/tests/i915/gem_mmap_gtt.c
> +++ b/tests/i915/gem_mmap_gtt.c
> @@ -566,7 +566,7 @@ test_ptrace(int fd)
>  	for (int i = 0; i < sz / sizeof(long); i++) {
>  		long ret;
>  
> -		ret = ptrace(PTRACE_PEEKDATA, pid, gtt + i);
> +		ret = ptrace(PTRACE_PEEKDATA, pid, gtt + i, NULL);
>  		igt_assert_eq_u64(ret, CC);
>  		cpy[i] = ret;
>  
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index 2b416edd..d1a67f45 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -520,7 +520,7 @@ static void test_ptrace(int i915)
>  				for (int i = 0; i < SZ / sizeof(long); i++) {
>  					long ret;
>  
> -					ret = ptrace(PTRACE_PEEKDATA, pid, ptr + i);
> +					ret = ptrace(PTRACE_PEEKDATA, pid, ptr + i, NULL);
>  					igt_assert_eq_u64(ret, CC);
>  					cpy[i] = ret;
>  
> -- 
> 2.37.3
> 
