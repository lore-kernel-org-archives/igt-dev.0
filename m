Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BCD10EA80
 for <igt-dev@lists.freedesktop.org>; Thu, 26 May 2022 09:35:03 +0000 (UTC)
Date: Thu, 26 May 2022 11:34:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yo9JwhJA/0cwJvZW@kamilkon-desk1>
References: <20220525161237.2213204-1-jason.ekstrand@collabora.com>
 <20220525161237.2213204-2-jason.ekstrand@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220525161237.2213204-2-jason.ekstrand@collabora.com>
Subject: Re: [igt-dev] [PATCH 1/2] tests/dmabuf: Add tests for sync_file
 export (v5)
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jason Ekstrand <jason.ekstrand@intel.com>,
 Jason Ekstrand <jason.ekstrand@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jason,

small nits, see below.

On 2022-05-25 at 11:12:36 -0500, Jason Ekstrand wrote:
> From: Jason Ekstrand <jason@jlekstrand.net>
> 
> v2 (Jason Ekstrand):
>  - Rename subtests to have "export" in the name
> 
> v3 (Jason Ekstrand):
>  - Add an export-before-signal subtest
> 
> v4 (Jason Ekstrand):
>  - Test both via sync_file and via poll to ensure the semantics match
>    properly.
> 
> v5 (Kamil Konieczny):
>  - Add igt_describe() for each subtest
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
> Signed-off-by: Jason Ekstrand <jason.ekstrand@collabora.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  tests/dmabuf_sync_file.c | 337 +++++++++++++++++++++++++++++++++++++++
>  tests/meson.build        |   1 +
>  2 files changed, 338 insertions(+)
>  create mode 100644 tests/dmabuf_sync_file.c
> 
> diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
> new file mode 100644
> index 00000000..9b7e0855
> --- /dev/null
> +++ b/tests/dmabuf_sync_file.c
> @@ -0,0 +1,337 @@
> +/*
> + * Copyright © 2021 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */

Please use SPDX licence here.

> +
> +#include "igt.h"
> +#include "igt_vgem.h"
> +
> +#include <linux/dma-buf.h>
> +#include <sys/poll.h>
> +
> +IGT_TEST_DESCRIPTION("Tests for sync_file export from dma-buf");

May you make this a little more generic ? You add import test in
other patch. Maybe s/export from/support in/ ?

Br,
Kamil

> +
> +struct igt_dma_buf_sync_file {
> +	__u32 flags;
> +	__s32 fd;
> +};
> +
> +#define IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct igt_dma_buf_sync_file)
> +
> +static bool has_dmabuf_export_sync_file(int fd)
> +{
> +	struct vgem_bo bo;
> +	int dmabuf, ret;
> +	struct igt_dma_buf_sync_file arg;
> +
> +	bo.width = 1;
> +	bo.height = 1;
> +	bo.bpp = 32;
> +	vgem_create(fd, &bo);
> +
> +	dmabuf = prime_handle_to_fd(fd, bo.handle);
> +	gem_close(fd, bo.handle);
> +
> +	arg.flags = DMA_BUF_SYNC_WRITE;
> +	arg.fd = -1;
> +
> +	ret = igt_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE, &arg);
> +	close(dmabuf);
> +	igt_assert(ret == 0 || errno == ENOTTY);
> +
> +	return ret == 0;
> +}
> +
> +static int dmabuf_export_sync_file(int dmabuf, uint32_t flags)
> +{
> +	struct igt_dma_buf_sync_file arg;
> +
> +	arg.flags = flags;
> +	arg.fd = -1;
> +	do_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE, &arg);
> +
> +	return arg.fd;
> +}
> +
> +static bool dmabuf_busy(int dmabuf, uint32_t flags)
> +{
> +	struct pollfd pfd = { .fd = dmabuf };
> +
> +	/* If DMA_BUF_SYNC_WRITE is set, we don't want to set POLLIN or
> +	 * else poll() may return a non-zero value if there are only read
> +	 * fences because POLLIN is ready even if POLLOUT isn't.
> +	 */
> +	if (flags & DMA_BUF_SYNC_WRITE)
> +		pfd.events |= POLLOUT;
> +	else if (flags & DMA_BUF_SYNC_READ)
> +		pfd.events |= POLLIN;
> +
> +	return poll(&pfd, 1, 0) == 0;
> +}
> +
> +static bool sync_file_busy(int sync_file)
> +{
> +	struct pollfd pfd = { .fd = sync_file, .events = POLLIN };
> +	return poll(&pfd, 1, 0) == 0;
> +}
> +
> +static bool dmabuf_sync_file_busy(int dmabuf, uint32_t flags)
> +{
> +	int sync_file;
> +	bool busy;
> +
> +	sync_file = dmabuf_export_sync_file(dmabuf, flags);
> +	busy = sync_file_busy(sync_file);
> +	close(sync_file);
> +
> +	return busy;
> +}
> +
> +static void test_export_basic(int fd)
> +{
> +	struct vgem_bo bo;
> +	int dmabuf;
> +	uint32_t fence;
> +
> +	igt_require(has_dmabuf_export_sync_file(fd));
> +
> +	bo.width = 1;
> +	bo.height = 1;
> +	bo.bpp = 32;
> +	vgem_create(fd, &bo);
> +
> +	dmabuf = prime_handle_to_fd(fd, bo.handle);
> +
> +	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +
> +	fence = vgem_fence_attach(fd, &bo, 0);
> +	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_RW));
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_RW));
> +
> +	vgem_fence_signal(fd, fence);
> +	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_RW));
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_RW));
> +
> +	fence = vgem_fence_attach(fd, &bo, VGEM_FENCE_WRITE);
> +	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_RW));
> +	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_RW));
> +
> +	vgem_fence_signal(fd, fence);
> +	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_RW));
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_RW));
> +
> +	close(dmabuf);
> +	gem_close(fd, bo.handle);
> +}
> +
> +static void test_export_before_signal(int fd)
> +{
> +	struct vgem_bo bo;
> +	int dmabuf, read_fd, write_fd;
> +	uint32_t fence;
> +
> +	igt_require(has_dmabuf_export_sync_file(fd));
> +
> +	bo.width = 1;
> +	bo.height = 1;
> +	bo.bpp = 32;
> +	vgem_create(fd, &bo);
> +
> +	dmabuf = prime_handle_to_fd(fd, bo.handle);
> +
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +
> +	fence = vgem_fence_attach(fd, &bo, 0);
> +
> +	read_fd = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_READ);
> +	write_fd = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
> +
> +	igt_assert(!sync_file_busy(read_fd));
> +	igt_assert(sync_file_busy(write_fd));
> +
> +	vgem_fence_signal(fd, fence);
> +
> +	igt_assert(!sync_file_busy(read_fd));
> +	igt_assert(!sync_file_busy(write_fd));
> +
> +	close(read_fd);
> +	close(write_fd);
> +
> +	fence = vgem_fence_attach(fd, &bo, VGEM_FENCE_WRITE);
> +
> +	read_fd = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_READ);
> +	write_fd = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
> +
> +	igt_assert(sync_file_busy(read_fd));
> +	igt_assert(sync_file_busy(write_fd));
> +
> +	vgem_fence_signal(fd, fence);
> +
> +	igt_assert(!sync_file_busy(read_fd));
> +	igt_assert(!sync_file_busy(write_fd));
> +
> +	close(read_fd);
> +	close(write_fd);
> +
> +	close(dmabuf);
> +	gem_close(fd, bo.handle);
> +}
> +
> +static void test_export_multiwait(int fd)
> +{
> +	struct vgem_bo bo;
> +	int dmabuf, sync_file;
> +	uint32_t fence1, fence2, fence3;
> +
> +	igt_require(has_dmabuf_export_sync_file(fd));
> +
> +	bo.width = 1;
> +	bo.height = 1;
> +	bo.bpp = 32;
> +	vgem_create(fd, &bo);
> +
> +	dmabuf = prime_handle_to_fd(fd, bo.handle);
> +
> +	fence1 = vgem_fence_attach(fd, &bo, 0);
> +	fence2 = vgem_fence_attach(fd, &bo, 0);
> +
> +	sync_file = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
> +
> +	fence3 = vgem_fence_attach(fd, &bo, 0);
> +
> +	igt_assert(sync_file_busy(sync_file));
> +
> +	vgem_fence_signal(fd, fence1);
> +
> +	igt_assert(sync_file_busy(sync_file));
> +
> +	vgem_fence_signal(fd, fence2);
> +
> +	igt_assert(!sync_file_busy(sync_file));
> +
> +	vgem_fence_signal(fd, fence3);
> +
> +	close(sync_file);
> +	close(dmabuf);
> +	gem_close(fd, bo.handle);
> +}
> +
> +static void test_export_wait_after_attach(int fd)
> +{
> +	struct vgem_bo bo;
> +	int dmabuf, read_sync_file, write_sync_file;
> +	uint32_t fence1, fence2;
> +
> +	igt_require(has_dmabuf_export_sync_file(fd));
> +
> +	bo.width = 1;
> +	bo.height = 1;
> +	bo.bpp = 32;
> +	vgem_create(fd, &bo);
> +
> +	dmabuf = prime_handle_to_fd(fd, bo.handle);
> +
> +	read_sync_file = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_READ);
> +	write_sync_file = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
> +
> +	fence1 = vgem_fence_attach(fd, &bo, VGEM_FENCE_WRITE);
> +
> +	igt_assert(!sync_file_busy(read_sync_file));
> +	igt_assert(!sync_file_busy(write_sync_file));
> +	close(read_sync_file);
> +	close(write_sync_file);
> +
> +	/* These wait on fence1 */
> +	read_sync_file = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_READ);
> +	write_sync_file = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
> +
> +	igt_assert(sync_file_busy(read_sync_file));
> +	igt_assert(sync_file_busy(write_sync_file));
> +
> +	vgem_fence_signal(fd, fence1);
> +	fence2 = vgem_fence_attach(fd, &bo, VGEM_FENCE_WRITE);
> +
> +	/* fence1 has signaled */
> +	igt_assert(!sync_file_busy(read_sync_file));
> +	igt_assert(!sync_file_busy(write_sync_file));
> +
> +	/* fence2 has not */
> +	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +
> +	vgem_fence_signal(fd, fence2);
> +	close(read_sync_file);
> +	close(write_sync_file);
> +
> +	close(dmabuf);
> +	gem_close(fd, bo.handle);
> +}
> +
> +igt_main
> +{
> +	int fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_VGEM);
> +	}
> +
> +	igt_describe("Sanity test for exporting a sync_file from a dma-buf.");
> +	igt_subtest("export-basic")
> +		test_export_basic(fd);
> +
> +	igt_describe("Test exporting a sync_file from a dma-buf before "
> +		     "signaling any of its fences.");
> +	igt_subtest("export-before-signal")
> +		test_export_before_signal(fd);
> +
> +	igt_describe("Test exporting a sync_file from a dma-buf with multiple "
> +		     "fences on it.");
> +	igt_subtest("export-multiwait")
> +		test_export_multiwait(fd);
> +
> +	igt_describe("Test exporting a sync_file from a dma-buf then adding "
> +		     "fences to the dma-buf before we wait.  The sync_file "
> +		     "should snapshot the current set of fences and not wait "
> +		     "for any fences added after it was exported.");
> +	igt_subtest("export-wait-after-attach")
> +		test_export_wait_after_attach(fd);
> +
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index fb0f1e37..b548dc3b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -7,6 +7,7 @@ test_progs = [
>  	'core_setmaster_vs_auth',
>  	'debugfs_test',
>  	'dmabuf',
> +	'dmabuf_sync_file',
>  	'device_reset',
>  	'drm_buddy',
>  	'drm_import_export',
> -- 
> 2.36.1
> 
