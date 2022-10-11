Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B7A10E7D7
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 08:29:06 +0000 (UTC)
Date: Tue, 11 Oct 2022 10:29:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y0UpTlBRCIvwjcba@kamilkon-desk1>
References: <20221007213056.3160561-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221007213056.3160561-1-jfree@freebsd.org>
Subject: Re: [igt-dev] [PATCH i-g-t] Restrict sigev_notify_thread_id macro
 definition to Linux
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

On 2022-10-07 at 16:30:56 -0500, Jake Freeland wrote:
> The `#define sigev_notify_thread_id _sigev_un._tid` macro differs on
> FreeBSD. This patch uses ifdefs to stop the compiler from overriding
> FreeBSD's existing definition.
> 
> Signed-off-by: Jake Freeland <jfree@freebsd.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  benchmarks/gem_syslatency.c | 3 +--
>  lib/igt_aux.h               | 2 +-
>  tests/i915/gem_close_race.c | 3 +--
>  3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c
> index c67b23cf..e98bb2a7 100644
> --- a/benchmarks/gem_syslatency.c
> +++ b/benchmarks/gem_syslatency.c
> @@ -48,8 +48,7 @@
>  
>  #include "i915/gem_create.h"
>  #include "i915/gem_ring.h"
> -
> -#define sigev_notify_thread_id _sigev_un._tid
> +#include "igt_aux.h"
>  
>  static volatile int done;
>  
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index c98cf28f..e734c87b 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -48,8 +48,8 @@
>  # ifndef HAVE_GETTID
>  #  define gettid() (pid_t)(syscall(__NR_gettid))
>  # endif
> +# define sigev_notify_thread_id _sigev_un._tid
>  #endif
> -#define sigev_notify_thread_id _sigev_un._tid
>  
>  /* auxialiary igt helpers from igt_aux.c */
>  /* generally useful helpers */
> diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
> index 938fde8f..e37a8882 100644
> --- a/tests/i915/gem_close_race.c
> +++ b/tests/i915/gem_close_race.c
> @@ -46,6 +46,7 @@
>  #include "i915/gem_create.h"
>  #include "i915/gem_mman.h"
>  #include "igt.h"
> +#include "igt_aux.h"
>  
>  #define OBJECT_SIZE (256 * 1024)
>  
> @@ -61,8 +62,6 @@ static bool has_softpin;
>  static uint64_t exec_addr;
>  static uint64_t data_addr;
>  
> -#define sigev_notify_thread_id _sigev_un._tid
> -
>  static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
>  {
>  	struct drm_i915_gem_relocation_entry reloc[2];
> -- 
> 2.37.3
> 
