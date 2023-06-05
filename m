Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 5 Jun 2023 13:03:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230605110310.s6owlebfxot72ntj@kamilkon-desk1>
References: <20230526130001.71730-1-nunes.erico@gmail.com>
 <20230526130001.71730-3-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230526130001.71730-3-nunes.erico@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/3] lib/lima: Add lima helpers
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

On 2023-05-26 at 15:00:00 +0200, Erico Nunes wrote:
> Add initial gem helpers for lima tests, based on the panfrost ones.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  lib/igt_lima.c  | 97 +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_lima.h  | 26 +++++++++++++
>  lib/meson.build |  1 +
>  3 files changed, 124 insertions(+)
>  create mode 100644 lib/igt_lima.c
>  create mode 100644 lib/igt_lima.h
> 
> diff --git a/lib/igt_lima.c b/lib/igt_lima.c
> new file mode 100644
> index 00000000..0d0f3c80
> --- /dev/null
> +++ b/lib/igt_lima.c
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Erico Nunes
> + */
> +
> +#include <assert.h>
> +#include <string.h>
> +#include <signal.h>
------------ ^
Please sort all system headers alphabetically.

> +#include <errno.h>
------------ ^

> +#include <sys/mman.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <sys/ioctl.h>
> +#include <fcntl.h>
------------ ^

> +
> +#include "drmtest.h"
> +#include "igt_aux.h"
> +#include "igt_core.h"
> +#include "igt_lima.h"
> +#include "ioctl_wrappers.h"
> +#include "lima_drm.h"
> +
> +/**
> + * SECTION:igt_lima
> + * @short_description: LIMA support library
> + * @title: LIMA
> + * @include: igt.h
> + *
> + * This library provides various auxiliary helper functions for writing Lima
> + * tests.
> + */
> +

Remove empty line.

> +struct lima_bo *
> +igt_lima_gem_new(int fd, size_t size)
> +{
> +	struct lima_bo *bo = calloc(1, sizeof(*bo));
> +
> +	struct drm_lima_gem_create create_bo = {
> +		.size = size,
> +		.flags = 0,
> +	};
> +
> +	do_ioctl(fd, DRM_IOCTL_LIMA_GEM_CREATE, &create_bo);
> +
> +	bo->handle = create_bo.handle;
> +	bo->size = size;
> +	return bo;
> +}
> +

Please add descriptions to all new public functions.

> +void
> +igt_lima_free_bo(int fd, struct lima_bo *bo)
> +{
> +	if (!bo)
> +		return;
> +
> +	if (bo->map)
> +		munmap(bo->map, bo->size);

You ignore error here.

> +	gem_close(fd, bo->handle);
> +	free(bo);
> +}
> +

Write description for igt_lima_get_bo_offset.

> +uint64_t
> +igt_lima_get_bo_offset(int fd, uint32_t handle)
> +{
> +	struct drm_lima_gem_info gem_info = {
> +		.handle = handle,
> +	};
> +
> +	do_ioctl(fd, DRM_IOCTL_LIMA_GEM_INFO, &gem_info);
> +
> +	return gem_info.offset;
> +}
> +

Same here.

> +uint32_t
> +igt_lima_get_param(int fd, int param)
> +{
> +	struct drm_lima_get_param get = {
> +		.param = param,
> +	};
> +
> +	do_ioctl(fd, DRM_IOCTL_LIMA_GET_PARAM, &get);
> +
> +	return get.value;
> +}
> +

Same here.

> +void *
> +igt_lima_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned int prot)
> +{
> +	uint64_t offset = igt_lima_get_bo_offset(fd, handle);
> +	void *ptr;
> +
> +	ptr = mmap(0, size, prot, MAP_SHARED, fd, offset);
> +	if (ptr == MAP_FAILED)
> +		return NULL;

We name __igt_function for functions which run regardless of
error, while igt_function fails on error. Above you used
do_ioctl which will fail on error. Your choice.

Regards,
Kamil

> +	else
> +		return ptr;
> +}
> diff --git a/lib/igt_lima.h b/lib/igt_lima.h
> new file mode 100644
> index 00000000..3c4eaf3d
> --- /dev/null
> +++ b/lib/igt_lima.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Erico Nunes
> + */
> +
> +#ifndef IGT_LIMA_H
> +#define IGT_LIMA_H
> +
> +#include "lima_drm.h"
> +
> +struct lima_bo {
> +	int handle;
> +	uint64_t offset;
> +	uint32_t size;
> +	void *map;
> +};
> +
> +struct lima_bo *igt_lima_gem_new(int fd, size_t size);
> +void igt_lima_free_bo(int fd, struct lima_bo *bo);
> +
> +/* IOCTL wrappers */
> +uint64_t igt_lima_get_bo_offset(int fd, uint32_t handle);
> +uint32_t igt_lima_get_param(int fd, int param);
> +void *igt_lima_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned int prot);
> +
> +#endif /* IGT_LIMA_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 85f100f7..a0f92941 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -89,6 +89,7 @@ lib_sources = [
>  	'uwildmat/uwildmat.c',
>  	'igt_kmod.c',
>  	'igt_panfrost.c',
> +	'igt_lima.c',
>  	'igt_v3d.c',
>  	'igt_vc4.c',
>  	'igt_vmwgfx.c',
> -- 
> 2.40.1
> 
