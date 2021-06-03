Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802FB6F46C
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 12:37:57 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id ba2so5194761edb.2
 for <igt-dev@lists.freedesktop.org>; Thu, 03 Jun 2021 05:37:57 -0700 (PDT)
Date: Thu, 3 Jun 2021 14:37:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YLjNIepj+ZwflG8L@phenom.ffwll.local>
References: <20210524205225.872316-1-jason@jlekstrand.net>
 <20210524205225.872316-2-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524205225.872316-2-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/dmabuf: Add tests for
 sync_file export (v3)
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 24, 2021 at 03:52:24PM -0500, Jason Ekstrand wrote:
> v2 (Jason Ekstrand):
>  - Rename subtests to have "export" in the name
> =

> v3 (Jason Ekstrand):
>  - Add an export-before-signal subtest
> =

> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  tests/dmabuf_sync_file.c | 294 +++++++++++++++++++++++++++++++++++++++
>  tests/meson.build        |   1 +
>  2 files changed, 295 insertions(+)
>  create mode 100644 tests/dmabuf_sync_file.c
> =

> diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
> new file mode 100644
> index 00000000..afac5535
> --- /dev/null
> +++ b/tests/dmabuf_sync_file.c
> @@ -0,0 +1,294 @@
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#include "igt.h"
> +#include "igt_vgem.h"
> +
> +#include <linux/dma-buf.h>
> +#include <sys/poll.h>
> +
> +IGT_TEST_DESCRIPTION("Tests for sync_file export from dma-buf");
> +
> +struct igt_dma_buf_sync_file {
> +	__u32 flags;
> +	__s32 fd;
> +};
> +
> +#define IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct=
 igt_dma_buf_sync_file)
> +
> +static bool has_dmabuf_export_sync_file(int fd)
> +{
> +	struct vgem_bo bo;
> +	int dmabuf, ret;
> +	struct igt_dma_buf_sync_file arg;
> +
> +	bo.width =3D 1;
> +	bo.height =3D 1;
> +	bo.bpp =3D 32;
> +	vgem_create(fd, &bo);
> +
> +	dmabuf =3D prime_handle_to_fd(fd, bo.handle);
> +	gem_close(fd, bo.handle);
> +
> +	arg.flags =3D DMA_BUF_SYNC_WRITE;
> +	arg.fd =3D -1;
> +
> +	ret =3D igt_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE, &arg);
> +	close(dmabuf);
> +	igt_assert(ret =3D=3D 0 || errno =3D=3D ENOTTY);
> +
> +	return ret =3D=3D 0;
> +}
> +
> +static int dmabuf_export_sync_file(int dmabuf, uint32_t flags)
> +{
> +	struct igt_dma_buf_sync_file arg;
> +
> +	arg.flags =3D flags;
> +	arg.fd =3D -1;
> +	do_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE, &arg);
> +
> +	return arg.fd;
> +}
> +
> +static bool sync_file_busy(int sync_file)
> +{
> +	struct pollfd pfd =3D { .fd =3D sync_file, .events =3D POLLIN };
> +	return poll(&pfd, 1, 0) =3D=3D 0;
> +}
> +
> +static bool dmabuf_sync_file_busy(int dmabuf, uint32_t flags)
> +{
> +	int sync_file;
> +	bool busy;
> +
> +	sync_file =3D dmabuf_export_sync_file(dmabuf, flags);
> +	busy =3D sync_file_busy(sync_file);
> +	close(sync_file);

I think for paranoia it would be good if this also cross-checks with poll
status. Just to make absolutely sure we're consistent across all flavours
of implicit sync.

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

Move this into the top-level fixture instead of in each test.

> +
> +	bo.width =3D 1;
> +	bo.height =3D 1;
> +	bo.bpp =3D 32;
> +	vgem_create(fd, &bo);
> +
> +	dmabuf =3D prime_handle_to_fd(fd, bo.handle);

Comment here that for read fence we expect only read to be busy, but for
write fence both.

> +
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +
> +	fence =3D vgem_fence_attach(fd, &bo, 0);
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +
> +	vgem_fence_signal(fd, fence);
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +
> +	fence =3D vgem_fence_attach(fd, &bo, VGEM_FENCE_WRITE);
> +	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +
> +	vgem_fence_signal(fd, fence);
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
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
> +	bo.width =3D 1;
> +	bo.height =3D 1;
> +	bo.bpp =3D 32;
> +	vgem_create(fd, &bo);

For longer tests I like to sprinkle comments around about what's going on,
since it tends to be hard to read among all the asserts. E.g. below

> +
> +	dmabuf =3D prime_handle_to_fd(fd, bo.handle);
> +
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
> +	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
> +

	/* first test read case, write slot should never get busy */

> +	fence =3D vgem_fence_attach(fd, &bo, 0);
> +
> +	read_fd =3D dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_READ);
> +	write_fd =3D dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
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

	/* test write slot, both read and write fences should become busy */
> +	fence =3D vgem_fence_attach(fd, &bo, VGEM_FENCE_WRITE);
> +
> +	read_fd =3D dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_READ);
> +	write_fd =3D dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
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
> +	bo.width =3D 1;
> +	bo.height =3D 1;
> +	bo.bpp =3D 32;
> +	vgem_create(fd, &bo);
> +
> +	dmabuf =3D prime_handle_to_fd(fd, bo.handle);
> +

	/* attach two read fences */

> +	fence1 =3D vgem_fence_attach(fd, &bo, 0);
> +	fence2 =3D vgem_fence_attach(fd, &bo, 0);
> +
> +	sync_file =3D dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
> +
> +	fence3 =3D vgem_fence_attach(fd, &bo, 0);
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

I think you're missing an important case here:
- attach write and then read fences
- complete write fence, read slot should be still busy
- complete read fence, both retired

Ofc assuming vgem does this all correctly, I'm not sure :-)

Also maybe the other way round of retiring the 2nd read fence before the
write fence

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
> +	bo.width =3D 1;
> +	bo.height =3D 1;
> +	bo.bpp =3D 32;
> +	vgem_create(fd, &bo);
> +
> +	dmabuf =3D prime_handle_to_fd(fd, bo.handle);
> +
> +	read_sync_file =3D dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_READ);
> +	write_sync_file =3D dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
> +
> +	fence1 =3D vgem_fence_attach(fd, &bo, VGEM_FENCE_WRITE);
> +
> +	igt_assert(!sync_file_busy(read_sync_file));
> +	igt_assert(!sync_file_busy(write_sync_file));
> +	close(read_sync_file);
> +	close(write_sync_file);
> +
> +	/* These wait on fence1 */
> +	read_sync_file =3D dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_READ);
> +	write_sync_file =3D dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
> +
> +	igt_assert(sync_file_busy(read_sync_file));
> +	igt_assert(sync_file_busy(write_sync_file));
> +
> +	vgem_fence_signal(fd, fence1);
> +	fence2 =3D vgem_fence_attach(fd, &bo, VGEM_FENCE_WRITE);
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

I think that test duped with the read slot would be good for completeness.

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
> +		fd =3D drm_open_driver(DRIVER_VGEM);
> +	}
> +
> +	igt_subtest_f("export-basic")

igt test descriptions missing.

See IGT_TEST_DESCRIPTION for the top level and igt_describe for subtests.


> +		test_export_basic(fd);
> +
> +	igt_subtest_f("export-before-signal")
> +		test_export_before_signal(fd);
> +
> +	igt_subtest_f("export-multiwait")
> +		test_export_multiwait(fd);
> +
> +	igt_subtest_f("export-wait-after-attach")
> +		test_export_wait_after_attach(fd);

invalid ioctl parameters test missing. It's a bit annoying when you extend
an ioctl, but then it's also very annoying when the checks are not there
and you try to extend something.

With the comments addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> +
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 19cc4ebe..a0992989 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -7,6 +7,7 @@ test_progs =3D [
>  	'core_setmaster_vs_auth',
>  	'debugfs_test',
>  	'dmabuf',
> +	'dmabuf_sync_file',
>  	'device_reset',
>  	'drm_import_export',
>  	'drm_mm',
> -- =

> 2.31.1
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
