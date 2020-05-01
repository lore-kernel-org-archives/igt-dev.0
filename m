Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20200430194151.1003933-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200430194151.1003933-1-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 1 May 2020 15:58:29 +0100
Message-ID: <CAM0jSHNw98i2TMn+n_up_u_zaic=Lu5piUzK1UJgkkwaBQRzLg@mail.gmail.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_mmap_gtt: Simulate
 gdb inspecting a GTT mmap using ptrace()
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 30 Apr 2020 at 20:42, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> gdb uses ptrace() to peek and poke bytes of the target's address space.
> The kernel must implement an vm_ops->access() handler or else gdb will
> be unable to inspect the pointer and report it as out-of-bounds. Worse
> than useless as it causes immediate suspicion of the valid GTT pointer.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/i915/gem_mmap_gtt.c | 79 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 78 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> index 1f4655af4..38b4d02d7 100644
> --- a/tests/i915/gem_mmap_gtt.c
> +++ b/tests/i915/gem_mmap_gtt.c
> @@ -34,8 +34,11 @@
>  #include <inttypes.h>
>  #include <pthread.h>
>  #include <errno.h>
> -#include <sys/stat.h>
> +#include <signal.h>
>  #include <sys/ioctl.h>
> +#include <sys/ptrace.h>
> +#include <sys/stat.h>
> +#include <sys/wait.h>
>  #include "drm.h"
>
>  #include "igt.h"
> @@ -501,6 +504,78 @@ test_write_gtt(int fd)
>         munmap(src, OBJECT_SIZE);
>  }
>
> +static void *memchr_inv(const void *s, int c, size_t n)
> +{
> +       const uint8_t *us = s;
> +       const uint8_t uc = c;
> +
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wcast-qual"
> +       while (n--) {
> +               if (*us != uc)
> +                       return (void *) us;
> +               us++;
> +       }
> +#pragma GCC diagnostic pop
> +
> +       return NULL;
> +}
> +
> +static void
> +test_ptrace(int fd)
> +{
> +       unsigned long AA, CC;
> +       unsigned long *gtt, *cpy;
> +       uint32_t bo;
> +       pid_t pid;
> +
> +       memset(&AA, 0xaa, sizeof(AA));
> +       memset(&CC, 0x55, sizeof(CC));
> +
> +       cpy = malloc(OBJECT_SIZE);
> +       memset(cpy, AA, OBJECT_SIZE);
> +
> +       bo = gem_create(fd, OBJECT_SIZE);
> +       gtt = mmap_bo(fd, bo, OBJECT_SIZE);
> +       memset(gtt, CC, OBJECT_SIZE);
> +       gem_close(fd, bo);
> +
> +       igt_assert(!memchr_inv(gtt, CC, OBJECT_SIZE));
> +       igt_assert(!memchr_inv(cpy, AA, OBJECT_SIZE));
> +
> +       igt_fork(child, 1) {
> +               ptrace(PTRACE_TRACEME, 0, NULL, NULL);
> +               raise(SIGSTOP);
> +       }
> +
> +       /* Wait for the child to ready themselves [SIGSTOP] */
> +       pid = wait(NULL);
> +
> +       ptrace(PTRACE_ATTACH, pid, NULL, NULL);
> +       for (int i = 0; i < OBJECT_SIZE / sizeof(long); i++) {
> +               long ret;
> +
> +               ret = ptrace(PTRACE_PEEKDATA, pid, gtt + i);
> +               igt_assert_eq_u64(ret, CC);
> +               cpy[i] = ret;
> +
> +               ret = ptrace(PTRACE_POKEDATA, pid, gtt + i, AA);
> +               igt_assert_eq(ret, 0l);

igt_assert_eq_u64() ?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
