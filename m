Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76FE10E425
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 16:16:53 +0000 (UTC)
Date: Tue, 24 Oct 2023 18:16:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231024161649.bhb4qgp6khabzmmu@kamilkon-desk.igk.intel.com>
References: <20231022155226.3484622-1-bernd@kuhls.net>
 <20231022155226.3484622-4-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231022155226.3484622-4-bernd@kuhls.net>
Subject: Re: [igt-dev] [PATCH 3/7] lib/igt_aux.h: Fix musl build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, Stefano Ragni <st3r4g@protonmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bernd,

On 2023-10-22 at 17:52:22 +0200, Bernd Kuhls wrote:
> From: Stefano Ragni <st3r4g@protonmail.com>
> 
> Original patch was added to void-linux:
> https://github.com/void-linux/void-packages/commit/ddfc1f66a0c571b420303c33aed29fd38ace4fc7
> 
> Bug report with request to split the original patch into some
> functional changes:
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
> 
> Fixes build error:
> ../lib/igt_aux.c:191:20: error: ‘struct sigevent’ has no member named ‘_sigev_un’
>   191 |                 sev.sigev_notify_thread_id = __igt_sigiter.tid;
> 
> ../lib/igt_aux.c:1994:12: error: ‘struct sigevent’ has no member named ‘_sigev_un’
>  1994 |         sev.sigev_notify_thread_id = gettid();

While it fixes your build (?) it breaks igt build on current
Ubuntu 22/x86_64, see:

[130/1763] Compiling C object lib/libigt-igt_aux_c.a.p/igt_aux.c.o
../lib/igt_aux.c: In function 'igt_sigiter_start':
../lib/igt_aux.c:191:44: warning: assignment to 'void (*)(__sigval_t)' {aka 'void (*)(union sigval)'} from 'pid_t' {aka 'int'} makes pointer from integer without a cast [-Wint-conversion]
  191 |                 sev.sigev_notify_thread_id = __igt_sigiter.tid;
      |                                            ^

../lib/igt_aux.c: In function 'igt_start_siglatency':
../lib/igt_aux.c:1994:36: warning: assignment to 'void (*)(__sigval_t)' {aka 'void (*)(union sigval)'} from '__pid_t' {aka 'int'} makes pointer from integer without a cast [-Wint-conversion]
 1994 |         sev.sigev_notify_thread_id = gettid();
      |                                    ^
--
[516/1763] Compiling C object tests/gem_close_race.p/intel_gem_close_race.c.o
../tests/intel/gem_close_race.c: In function 'thread':
../tests/intel/gem_close_race.c:269:36: warning: assignment to 'void (*)(__sigval_t)' {aka 'void (*)(union sigval)'} from '__pid_t' {aka 'int'} makes pointer from integer without a cast [-Wint-conversion]
  269 |         sev.sigev_notify_thread_id = gettid();
      |                                    ^
--
[1537/1763] Compiling C object benchmarks/gem_syslatency.p/gem_syslatency.c.o
../benchmarks/gem_syslatency.c: In function 'sys_wait':
../benchmarks/gem_syslatency.c:168:36: warning: assignment to 'void (*)(__sigval_t)' {aka 'void (*)(union sigval)'} from '__pid_t' {aka 'int'} makes pointer from integer without a cast [-Wint-conversion]
  168 |         sev.sigev_notify_thread_id = gettid();
      |                                    ^

Regards,
Kamil

> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  lib/igt_aux.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index fb76b0313..a13e8156a 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -48,7 +48,7 @@
>  # ifndef HAVE_GETTID
>  #  define gettid() (pid_t)(syscall(__NR_gettid))
>  # endif
> -# define sigev_notify_thread_id _sigev_un._tid
> +# define sigev_notify_thread_id sigev_notify_function
>  #endif
>  
>  /* auxialiary igt helpers from igt_aux.c */
> -- 
> 2.39.2
> 
