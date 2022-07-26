Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB7110EC9C
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 05:51:42 +0000 (UTC)
Date: Tue, 26 Jul 2022 07:51:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yt+A6WLXKOHGRPoX@kamilkon-desk1>
References: <20220725121504.99519-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220725121504.99519-1-adrian.larumbe@collabora.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_mmap: remove useless memset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Adrian Larumbe <adrian.larumbe@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-07-25 at 13:15:04 +0100, Adrian Larumbe wrote:
> Array 'expected' is never used again in a comparison after memset'ing it.
> Remove the useless statement.
> 
> Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
> ---
>  tests/i915/gem_mmap.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
> index 61f862a8e275..926cd03c577e 100644
> --- a/tests/i915/gem_mmap.c
> +++ b/tests/i915/gem_mmap.c
> @@ -264,7 +264,6 @@ igt_main
>  		igt_info("Testing coherency of writes and mmap reads.\n");
>  		memset(buf, 0, sizeof(buf));
>  		memset(buf + 1024, 0x01, 1024);
> -		memset(expected + 1024, 0x01, 1024);

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  		gem_write(fd, arg.handle, 0, buf, OBJECT_SIZE);
>  		igt_assert(memcmp(buf, addr, sizeof(buf)) == 0);
>  
> -- 
> 2.37.0
> 
