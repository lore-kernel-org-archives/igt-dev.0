Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20200430195134.1044125-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200430195134.1044125-1-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 1 May 2020 16:00:37 +0100
Message-ID: <CAM0jSHOHE_b7-=snrKQS=H96w_8ZVAoPVxHuNNYgT8tXEOZjcg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] igt/gem_mmap_offset: Simulate gdb
 inspecting any mmap using ptrace()
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

On Thu, 30 Apr 2020 at 20:51, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> gdb uses ptrace() to peek and poke bytes of the target's address space.
> The kernel must implement an vm_ops->access() handler or else gdb will
> be unable to inspect the pointer and report it as out-of-bounds. Worse
> than useless as it causes immediate suspicion of the valid GPU pointer.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/i915/gem_mmap_offset.c | 91 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index 1ec963b25..c10cf606f 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -23,9 +23,12 @@
>
>  #include <errno.h>
>  #include <pthread.h>
> +#include <signal.h>
>  #include <stdatomic.h>
> -#include <sys/stat.h>
>  #include <sys/ioctl.h>
> +#include <sys/ptrace.h>
> +#include <sys/stat.h>
> +#include <sys/wait.h>
>  #include "drm.h"
>
>  #include "igt.h"
> @@ -265,6 +268,89 @@ static void pf_nonblock(int i915)
>         igt_spin_free(i915, spin);
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
> +static void test_ptrace(int i915)
> +{
> +       const unsigned int SZ = 3 * 4096;
> +       unsigned long *ptr, *cpy;
> +       unsigned long AA, CC;
> +       uint32_t bo;
> +
> +       memset(&AA, 0xaa, sizeof(AA));
> +       memset(&CC, 0x55, sizeof(CC));
> +
> +       cpy = malloc(SZ);
> +       bo = gem_create(i915, SZ);
> +
> +       for_each_mmap_offset_type(i915, t) {
> +               igt_dynamic_f("%s", t->name) {
> +                       pid_t pid;
> +
> +                       ptr = __mmap_offset(i915, bo, 0, SZ,
> +                                       PROT_READ | PROT_WRITE,
> +                                       t->type);
> +                       if (!ptr)
> +                               continue;
> +
> +                       memset(cpy, AA, SZ);
> +                       memset(ptr, CC, SZ);
> +
> +                       igt_assert(!memchr_inv(ptr, CC, SZ));
> +                       igt_assert(!memchr_inv(cpy, AA, SZ));
> +
> +                       igt_fork(child, 1) {
> +                               ptrace(PTRACE_TRACEME, 0, NULL, NULL);
> +                               raise(SIGSTOP);
> +                       }
> +
> +                       /* Wait for the child to ready themselves [SIGSTOP] */
> +                       pid = wait(NULL);
> +
> +                       ptrace(PTRACE_ATTACH, pid, NULL, NULL);
> +                       for (int i = 0; i < SZ / sizeof(long); i++) {
> +                               long ret;
> +
> +                               ret = ptrace(PTRACE_PEEKDATA, pid, ptr + i);
> +                               igt_assert_eq_u64(ret, CC);
> +                               cpy[i] = ret;
> +
> +                               ret = ptrace(PTRACE_POKEDATA, pid, ptr + i, AA);
> +                               igt_assert_eq(ret, 0l);

igt_assert_eq_u64() ?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
