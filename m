Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DF289DC0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Mar 2022 14:45:36 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id kd12so1204102qvb.1
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Mar 2022 07:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220311070309.3281660-1-mastanx.katragadda@intel.com>
In-Reply-To: <20220311070309.3281660-1-mastanx.katragadda@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 15 Mar 2022 14:45:09 +0000
Message-ID: <CAM0jSHNYA6q2-tfXaxOWMRJDWdM_r1B7MSgKGrY9dyfhKwTfbg@mail.gmail.com>
To: Mastan Katragadda <mastanx.katragadda@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [i-g-t,
 v2] igt/gem_mmap_offset: Adding subtest oob_read
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 11 Mar 2022 at 07:02, Mastan Katragadda
<mastanx.katragadda@intel.com> wrote:
>
> This test will Detect A missing bounds check in vm_access().
> can lead to an out-of-bounds read or write in the adjacent memory area.
>
> Changes Since V1:
>         - Incorporated minor changes as suggested in feedback [Chris/Matthew].
>         - Fixed build failures.
>
> Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Pushed with the style nits fixed, and the improved commit message
suggested by Kamil. Thanks.

> ---
>  tests/i915/gem_mmap_offset.c | 44 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index 8148f0a2..c8fab18b 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -22,6 +22,8 @@
>   */
>
>  #include <errno.h>
> +#include <unistd.h>
> +#include <fcntl.h>
>  #include <pthread.h>
>  #include <signal.h>
>  #include <stdatomic.h>
> @@ -289,6 +291,44 @@ static void *memchr_inv(const void *s, int c, size_t n)
>         return NULL;
>  }
>
> +static void
> +test_oob_read(int i915)
> +{
> +       unsigned char read_buf[4096];
> +       uint32_t handle;
> +       uintptr_t addr;
> +       int memfd;
> +       int ret;
> +
> +       handle = gem_create(i915, 4096);
> +
> +       for_each_mmap_offset_type(i915, t) {
> +               uint32_t *ptr;
> +
> +               ptr = __mmap_offset(i915, handle, 0, 4096,
> +                                   PROT_READ | PROT_WRITE,
> +                                   t->type);
> +               if (!ptr)
> +                       continue;
> +
> +               memfd = open("/proc/self/mem", O_RDWR);
> +               igt_require_f(memfd != -1, "/proc/self/mem\n");
> +
> +               addr = (uintptr_t)ptr + 4092;
> +               ret = lseek(memfd, addr, SEEK_SET);
> +               igt_assert_f(ret != -1, "lseek failed\n");
> +
> +               /* Triggering the buf (out of bound read) */
> +               ret = read(memfd, read_buf, 8);
> +               igt_assert(ret == -1 && errno ==  EIO);
> +
> +               munmap(ptr, 4096);
> +               close(memfd);
> +       }
> +
> +       gem_close(i915, handle);
> +}
> +
>  static void test_ptrace(int i915)
>  {
>         const unsigned int SZ = 3 * 4096;
> @@ -692,6 +732,10 @@ igt_main
>         igt_subtest_f("pf-nonblock")
>                 pf_nonblock(i915);
>
> +       igt_describe("Check Linear Out-Of-Bound in Vm_access");
> +       igt_subtest("oob-read")
> +               test_oob_read(i915);
> +
>         igt_subtest_with_dynamic("ptrace")
>                 test_ptrace(i915);
>
> --
> 2.25.1
>
