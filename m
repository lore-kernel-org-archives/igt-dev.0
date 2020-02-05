Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C8C6E9A6
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2020 14:02:20 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200205135532.15757-1-ramalingam.c@intel.com>
References: <20200205135532.15757-1-ramalingam.c@intel.com>
Message-ID: <158091130753.3271.3749160701693221365@skylake-alporthouse-com>
Date: Wed, 05 Feb 2020 14:01:47 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/dumb_buffer: page_size for
 create_clear
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
To: Ramalingam C <ramalingam.c@intel.com>, igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ramalingam C (2020-02-05 13:55:32)
> For the dumb_buffer@clear_create test we need to detect the correct page
> size for the buffer size calculation.
> 
> We create the least sized buffer and see the page aligned size returned
> from kernel, which is minimum page size kernel will allocate.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/dumb_buffer.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> index ad854c0696e7..de0501873e59 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -52,8 +52,6 @@
>  
>  IGT_TEST_DESCRIPTION("This is a test for the generic dumb buffer interface.");
>  
> -#define PAGE_SIZE 4096
> -
>  static int __dumb_create(int fd, struct drm_mode_create_dumb *create)
>  {
>         int err = 0;
> @@ -225,6 +223,7 @@ struct thread_clear {
>         _Atomic(uint64_t) max;
>         int timeout;
>         int fd;
> +       unsigned long page_size;
>  };
>  
>  #define MAX_PAGE_TO_REQUEST    102400
> @@ -247,14 +246,12 @@ static void *thread_clear(void *data)
>  
>                 for (uint64_t _npages = npages; npages > 0; npages -= _npages) {
>                         create.bpp = 32;
> -                       create.width = PAGE_SIZE / (create.bpp / 8);
> +                       create.width = arg->page_size / (create.bpp / 8);
>                         _npages = npages <= MAX_PAGE_TO_REQUEST ? npages :
>                                   MAX_PAGE_TO_REQUEST;
>                         create.height = _npages;
>  
>                         dumb_create(fd, &create);
> -                       igt_assert_eq(PAGE_SIZE * create.height, create.size);
> -
>                         ptr = dumb_map(fd,
>                                        create.handle, create.size,
>                                        PROT_WRITE);
> @@ -286,7 +283,7 @@ static void sigprobe(int sig)
>         longjmp(sigjmp, sig);
>  }
>  
> -static uint64_t estimate_largest_dumb_buffer(int fd)
> +static uint64_t estimate_largest_dumb_buffer(int fd, unsigned long page_size)
>  {
>         sighandler_t old_sigbus = signal(SIGBUS, sigprobe);
>         sighandler_t old_sigsegv = signal(SIGSEGV, sigprobe);
> @@ -307,7 +304,7 @@ static uint64_t estimate_largest_dumb_buffer(int fd)
>  
>                 igt_info("Largest dumb buffer sucessfully created: %'"PRIu64" bytes\n",
>                          largest);
> -               return largest / PAGE_SIZE;
> +               return largest / page_size;
>         }
>  
>         for (create.height = 1; create.height; create.height *= 2) {
> @@ -334,13 +331,23 @@ static void always_clear(int fd, int timeout)
>         struct thread_clear arg = {
>                 .fd = fd,
>                 .timeout = timeout,
> -               .max = estimate_largest_dumb_buffer(fd), /* in pages */
>         };
>         const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> +       struct drm_mode_create_dumb create = {
> +               .bpp = 32,
> +               .width = 1, /* in pixels */
> +               .height = 1, /* in rows */
> +       };
>         unsigned long checked;
>         pthread_t thread[ncpus];
>         void *result;
>  
> +       dumb_create(fd, &create);
> +       arg.page_size = create.size;
> +       dumb_destroy(fd, create.handle);

Push this to its own function so we can document the intent concisely.
arg.page_size = probe_page_size(fd) ?

> +       arg.max = estimate_largest_dumb_buffer(fd, arg.page_size);

But we might as well return bytes here and / arg.page_size ourselves.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
