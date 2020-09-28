Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20200803101458.2369-1-chris@chris-wilson.co.uk>
References: <20200803093051.2112-1-chris@chris-wilson.co.uk>
 <20200803101458.2369-1-chris@chris-wilson.co.uk>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Message-ID: <160129022865.8141.7177521062986891385@jlahtine-mobl.ger.corp.intel.com>
Date: Mon, 28 Sep 2020 13:50:29 +0300
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_parallel: Add basic
 userptr thrashing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Chris Wilson (2020-08-03 13:14:58)
> Mix in a modicum of generic userptr thrashing for a quick (1s) BAT pass,
> as we have currently no coverage of userptr at all in BAT.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Definitely makes sense as there was a reported userptr regression.

Reviewed-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

Regards, Joonas

> ---
>  tests/i915/gem_exec_parallel.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
> index bf94b93d4..96feb8250 100644
> --- a/tests/i915/gem_exec_parallel.c
> +++ b/tests/i915/gem_exec_parallel.c
> @@ -45,6 +45,7 @@ static inline uint32_t hash32(uint32_t val)
>  
>  #define CONTEXTS 0x1
>  #define FDS 0x2
> +#define USERPTR 0x4
>  
>  #define NUMOBJ 16
>  
> @@ -164,6 +165,30 @@ static void check_bo(int fd, uint32_t handle, int pass, struct thread *threads)
>         igt_assert_eq_u32(result, x);
>  }
>  
> +static uint32_t handle_create(int fd, unsigned int flags, void **data)
> +{
> +       if (flags & USERPTR) {
> +               uint32_t handle;
> +               void *ptr;
> +
> +               posix_memalign(&ptr, 4096, 4096);
> +               gem_userptr(fd, ptr, 4096, 0, 0, &handle);
> +               *data = ptr;
> +
> +               return handle;
> +       }
> +
> +       return gem_create(fd, 4096);
> +}
> +
> +static void handle_close(int fd, unsigned int flags, uint32_t handle, void *data)
> +{
> +       if (flags & USERPTR)
> +               free(data);
> +
> +       gem_close(fd, handle);
> +}
> +
>  static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
>  {
>         const int gen = intel_gen(intel_get_drm_devid(fd));
> @@ -172,6 +197,7 @@ static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
>         struct thread *threads;
>         uint32_t scratch[NUMOBJ], handle[NUMOBJ];
>         unsigned engines[16], nengine;
> +       void *arg[NUMOBJ];
>         int go;
>         int i;
>  
> @@ -196,7 +222,7 @@ static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
>         igt_require(nengine);
>  
>         for (i = 0; i < NUMOBJ; i++) {
> -               scratch[i] = handle[i] = gem_create(fd, 4096);
> +               scratch[i] = handle[i] = handle_create(fd, flags, &arg[i]);
>                 if (flags & FDS)
>                         scratch[i] = gem_flink(fd, handle[i]);
>         }
> @@ -233,7 +259,7 @@ static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
>  
>         for (i = 0; i < NUMOBJ; i++) {
>                 check_bo(fd, handle[i], i, threads);
> -               gem_close(fd, handle[i]);
> +               handle_close(fd, flags, handle[i], arg[i]);
>         }
>  
>         igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
> @@ -251,6 +277,7 @@ igt_main
>                 { "basic", 0 },
>                 { "contexts", CONTEXTS },
>                 { "fds", FDS },
> +               { "userptr", USERPTR },
>                 { NULL }
>         };
>         int fd;
> -- 
> 2.28.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
