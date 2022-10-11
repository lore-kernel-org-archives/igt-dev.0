Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B83210E514
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 09:00:32 +0000 (UTC)
Date: Tue, 11 Oct 2022 11:00:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y0UwrE8iinSl6Z4+@kamilkon-desk1>
References: <20221007220221.3189750-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221007220221.3189750-1-jfree@freebsd.org>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_mmap_*: Add NULL to
 ptrace() calls
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

On 2022-10-07 at 17:02:21 -0500, Jake Freeland wrote:
> In FreeBSD, the ptrace() function cannot take a variable
> length list of arguments. This patch adds NULL in the @data
> parameter to allow for compilation on FreeBSD systems.
> 
> Signed-off-by: Jake Freeland <jfree@freebsd.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/gem_mmap_gtt.c    | 2 +-
>  tests/i915/gem_mmap_offset.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> index e39b9047..7cd1c5e3 100644
> --- a/tests/i915/gem_mmap_gtt.c
> +++ b/tests/i915/gem_mmap_gtt.c
> @@ -566,7 +566,7 @@ test_ptrace(int fd)
>  	for (int i = 0; i < sz / sizeof(long); i++) {
>  		long ret;
>  
> -		ret = ptrace(PTRACE_PEEKDATA, pid, gtt + i);
> +		ret = ptrace(PTRACE_PEEKDATA, pid, gtt + i, (void *) 0);
>  		igt_assert_eq_u64(ret, CC);
>  		cpy[i] = ret;
>  
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index 2b416edd..c14398e2 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -520,7 +520,7 @@ static void test_ptrace(int i915)
>  				for (int i = 0; i < SZ / sizeof(long); i++) {
>  					long ret;
>  
> -					ret = ptrace(PTRACE_PEEKDATA, pid, ptr + i);
> +					ret = ptrace(PTRACE_PEEKDATA, pid, ptr + i, (void *) 0);
>  					igt_assert_eq_u64(ret, CC);
>  					cpy[i] = ret;
>  
> -- 
> 2.37.3
> 
