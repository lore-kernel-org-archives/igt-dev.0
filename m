Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF2510E6DC
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Mar 2022 16:46:28 +0000 (UTC)
Date: Wed, 23 Mar 2022 17:46:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YjtO3wJ4NnjSM4N5@kamilkon-DESK1>
References: <20220323130653.65094-1-zbigniew.kempczynski@intel.com>
 <20220323130653.65094-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220323130653.65094-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_exec_suspend: Add
 48b exec flag for execbuf
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

Dnia 2022-03-23 at 14:06:52 +0100, Zbigniew Kempczyński napisał(a):
> On DG2 and beyond safe alignment is bigger than on previous gens
> so test could get offset which is >= 2^32. Add execbuf flag which
> allows using such offsets.

imho this is better to describe as in cover letter, e.g. that dg2
has vm larger than 4GB (2^32) so we need to add this flag.
Bigger alignment shows this in runs so you can add that also.
It is not strong opinion, you can change it or not.

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_exec_suspend.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
> index 59fad1dc9e..401026ef9a 100644
> --- a/tests/i915/gem_exec_suspend.c
> +++ b/tests/i915/gem_exec_suspend.c
> @@ -137,7 +137,7 @@ static void run_test(int fd, const intel_ctx_t *ctx,
>  	} else {
>  		/* ignore first execbuf offset */
>  		obj[0].offset = get_offset(ahnd, obj[0].handle, 4096, 0);
> -		obj[0].flags |= EXEC_OBJECT_PINNED;
> +		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>  	}
>  
>  	for (int i = 0; i < 1024; i++) {
> @@ -150,7 +150,7 @@ static void run_test(int fd, const intel_ctx_t *ctx,
>  		obj[1].handle = gem_create(fd, 4096);
>  		if (ahnd) {
>  			obj[1].offset = get_offset(ahnd, obj[1].handle, 4096, 0);
> -			obj[1].flags |= EXEC_OBJECT_PINNED;
> +			obj[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>  			offset = obj[0].offset + reloc.delta;
>  		} else {
>  			offset = reloc.presumed_offset + reloc.delta;
> -- 
> 2.32.0
> 
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil
