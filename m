Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE8910E7C6
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Mar 2022 13:17:06 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id 11so4492143qtt.9
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Mar 2022 05:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20220309015114.2682899-1-mastanx.katragadda@intel.com>
In-Reply-To: <20220309015114.2682899-1-mastanx.katragadda@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 10 Mar 2022 13:16:39 +0000
Message-ID: <CAM0jSHOwjdP0mKu8quRfmYmr32pVdnFhRzAkfjEHQ1wA8pcSnQ@mail.gmail.com>
To: Mastan Katragadda <mastanx.katragadda@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [i-g-t] igt/gem_mmap_offset: Adding subtest oob_read
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

On Wed, 9 Mar 2022 at 08:19, Mastan Katragadda
<mastanx.katragadda@intel.com> wrote:
>
> This test will Detect A missing bounds check in vm_access().
> can lead to an out-of-bounds read or write in the adjacent memory area.
>
> Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  tests/i915/gem_mmap_offset.c | 37 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index 8148f0a2..9723f4e3 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -289,6 +289,40 @@ static void *memchr_inv(const void *s, int c, size_t n)
>         return NULL;
>  }
>
> +static void
> +test_oob_read(int i915)
> +{
> +

Nit: Random newline.

> +       int memfd;
> +       unsigned char p_init[4096];
> +       unsigned char p_read_buf[4096];
> +       void *ptr;
> +       uintptr_t p_addr;
> +       int ret;
> +       uint32_t handle;

Nit: Try to keep these roughly ordered by line length and type, for
better readability.

unsigned char p_read_buf[4096];
unsigned char p_init[4096];
uintptr_t p_addr;
uint32_t handle;
void *ptr;
int memfd;
int ret;

> +
> +       handle = gem_create(i915, 4096);
> +
> +       memset(p_init, 0x41, sizeof(p_init));
> +       gem_write(i915, handle, 0, &p_init, sizeof(p_init));

Why do we need the memset() + gem_write()?

> +
> +       ptr = __gem_mmap_offset__wc(i915, handle, 0, 4096, PROT_READ|PROT_WRITE);

Can we make this __device_coherent, otherwise I think this skips, or
just fails on discrete? And since vm_access uses tm_bo_vm_access() on
such platforms, it would be good to get coverage there also.

> +       igt_assert(ptr != MAP_FAILED);

We can use the normal gem_mmap__device_coherent, which already checks
this for us?

> +
> +       memfd = open("/proc/self/mem", O_RDWR, 0);
> +       igt_require_f(memfd != -1, "/proc/self/mem\n");
> +
> +       p_addr = (uintptr_t)((unsigned long)ptr + 4092);
> +       ret = lseek64(memfd, p_addr, SEEK_SET);
> +       igt_assert_f(ret != -1, "lseek failed\n");
> +
> +       /* Triggering the buf (out of bound read) */
> +       ret = read(memfd, p_read_buf, sizeof(p_read_buf));
> +       igt_assert(ret == -1 && errno ==  EIO);
> +       munmap(ptr, 4096);
> +       close(memfd);

gem_close(i915, handle);

> +}
> +
>  static void test_ptrace(int i915)
>  {
>         const unsigned int SZ = 3 * 4096;
> @@ -692,6 +726,9 @@ igt_main
>         igt_subtest_f("pf-nonblock")
>                 pf_nonblock(i915);
>
> +       igt_subtest("oob-read")
> +               test_oob_read(i915);

Newly added tests should also ideally include an igt_describe(), to
give a brief overview of what the test is trying to exercise.

Looking at the CI results, it looks like this triggers the issue
nicely on the kernel side.

> +
>         igt_subtest_with_dynamic("ptrace")
>                 test_ptrace(i915);
>
> --
> 2.25.1
>
