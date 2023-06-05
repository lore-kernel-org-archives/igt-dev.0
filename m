Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 5 Jun 2023 13:17:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230605111738.stcgxju5kjqkdjyi@kamilkon-desk1>
References: <20230526130001.71730-1-nunes.erico@gmail.com>
 <20230526130001.71730-4-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230526130001.71730-4-nunes.erico@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/3] tests/lima: Add initial tests
 for lima
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: anarsoul@gmail.com, yuq825@gmail.com, lima@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Erico,

On 2023-05-26 at 15:00:01 +0200, Erico Nunes wrote:
> Some gem tests based on the panfrost and v3d ones.

Could you write a little more what new tests you added ?

> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  tests/lima_gem_new.c | 78 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build    |  1 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 tests/lima_gem_new.c
> 
> diff --git a/tests/lima_gem_new.c b/tests/lima_gem_new.c
> new file mode 100644
> index 00000000..3b054317
> --- /dev/null
> +++ b/tests/lima_gem_new.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Erico Nunes
> + */
> +
> +#include "igt.h"
------------ ^
> +#include "igt_lima.h"
------------ ^
Move this after system includes.

> +#include <unistd.h>
------------ ^
Sort includes alphabetically.

> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <fcntl.h>
> +#include <inttypes.h>
> +#include <errno.h>
> +#include <sys/stat.h>
> +#include <sys/ioctl.h>

Add newline after system includes.
Put here "igt...h" headers.

> +#include "lima_drm.h"
> +

Write here global description with

IGT_TEST_DESCRIPTION("Global test description.")

> +igt_main
> +{
> +	int fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_LIMA);

You can put here
		igt_require(fd > 0);

> +	}
> +
> +	igt_describe("Sanity check for creating a BO with size 4096.");
> +	igt_subtest("gem-new-4096") {
> +		struct lima_bo *bo = igt_lima_gem_new(fd, 4096);
> +
> +		igt_lima_free_bo(fd, bo);
> +	}
> +
> +	igt_describe("Make sure a BO cannot be created with size zero.");
> +	igt_subtest("gem-new-0") {
> +		struct drm_lima_gem_create arg = {
> +			.size = 0,
> +		};
> +
> +		do_ioctl_err(fd, DRM_IOCTL_LIMA_GEM_CREATE, &arg, EINVAL);
> +	}
> +
> +	igt_describe("Make sure that BOs can be allocated in different fd without "
> +		     "carrying old contents from one another.");
> +	igt_subtest("gem-new-zeroed") {
> +		int fd2 = drm_open_driver(DRIVER_LIMA);
> +		struct lima_bo *bo;
> +		uint32_t *map;
> +		/* A size different from any used in our other tests, to try
> +		 * to convince it to land as the only one of its size in the
> +		 * kernel BO cache
> +		 */
> +		size_t size = 3 * 4096;
> +		size_t i;
> +
> +		/* Make a BO and free it on our main fd. */
> +		bo = igt_lima_gem_new(fd, size);
> +		map = igt_lima_mmap_bo(fd, bo->handle, size, PROT_READ | PROT_WRITE);
--------------- ^
In your current implementation you can get NULL here.

> +		memset(map, 0xd0, size);
> +		munmap(map, size);
> +		igt_lima_free_bo(fd, bo);
> +
> +		/* Now, allocate a BO on the other fd and make sure it doesn't
> +		 * have the old contents.
> +		 */
> +		bo = igt_lima_gem_new(fd2, size);
> +		map = igt_lima_mmap_bo(fd2, bo->handle, size, PROT_READ | PROT_WRITE);
--------------- ^
Same here, mey be NULL.

> +		for (i = 0; i < size / 4; i++)
-------------------------------------- ^
It may be also sizeof(map[0]) instead of 4.

Regards,
Kamil

> +			igt_assert_eq_u32(map[i], 0x0);
> +		munmap(map, size);
> +		igt_lima_free_bo(fd2, bo);
> +
> +		close(fd2);
> +	}
> +
> +	igt_fixture
> +		close(fd);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index f71be1db..980e77e9 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -62,6 +62,7 @@ test_progs = [
>  	'kms_vblank',
>  	'kms_vrr',
>  	'kms_writeback',
> +	'lima_gem_new',
>  	'meta_test',
>  	'panfrost_get_param',
>  	'panfrost_gem_new',
> -- 
> 2.40.1
> 
