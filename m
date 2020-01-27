Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008A86EA61
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2020 08:56:18 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200127084610.29356-1-ramalingam.c@intel.com>
References: <20200127084610.29356-1-ramalingam.c@intel.com>
Message-ID: <158011536751.25356.9436764177649025245@skylake-alporthouse-com>
Date: Mon, 27 Jan 2020 08:56:07 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_create: Remove page
 nonaligned buffer tests
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

Quoting Ramalingam C (2020-01-27 08:46:10)
> Considering that kernel returns the real memory size(page aligned)
> allocated, nonaligned buffer tests are not valid anymore. Hence removing
> them.

> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/i915/gem_create.c | 46 -----------------------------------------
>  1 file changed, 46 deletions(-)
> 
> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> index 8fc128dae6e2..d80479c757e8 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -119,46 +119,6 @@ static void invalid_size_test(int fd)
>         igt_assert_eq(create_ioctl(fd, &create), -EINVAL);
>  }
>  
> -/*
> - * Creating an object with non-aligned size and trying to access it with an
> - * offset, which is greater than the requested size but smaller than the
> - * object's last page boundary. pwrite here must be successful.
> - */
> -static void valid_nonaligned_size(int fd)
> -{
> -       struct drm_i915_gem_create create = {
> -               .size = PAGE_SIZE / 2,
> -       };
> -       char buf[PAGE_SIZE];
> -
> -       igt_assert_eq(create_ioctl(fd, &create), 0);
> -
> -       gem_write(fd, create.handle, PAGE_SIZE / 2, buf, PAGE_SIZE / 2);
> -
> -       gem_close(fd, create.handle);

This is reasonable, just add a igt_assert(create.size >= PAGE_SIZE) as
well. We pass in a small request, the kernel pads it to a minimum of
system page size so that it will work with the usual page aligned
interfaces. We verify that the extra size returned by the kernel is
usable.

> -}
> -
> -/*
> - * Creating an object with non-aligned size and trying to access it with an
> - * offset, which is greater than the requested size and larger than the
> - * object's last page boundary. pwrite here must fail.
> - */
> -static void invalid_nonaligned_size(int fd)
> -{
> -       struct drm_i915_gem_create create = {
> -               .size = PAGE_SIZE / 2,
> -       };
> -       char buf[PAGE_SIZE];
> -
> -       igt_assert_eq(create_ioctl(fd, &create), 0);
> -
> -       /* This should fail. Hence cannot use gem_write. */
> -       igt_assert(__gem_write(fd, create.handle,
> -                              PAGE_SIZE / 2, buf, PAGE_SIZE));

This is falling under gem_write testing, since we aren't looking at
create.size and deliberating trying to write passed the end.

So I wouldn't be upset losing this.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
