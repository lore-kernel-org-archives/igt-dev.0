Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36C36E1BA
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jun 2021 14:18:10 +0000 (UTC)
Date: Fri, 4 Jun 2021 10:18:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <YLo2IPieki6cFs1Y@intel.com>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
 <20210518103344.2264397-17-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518103344.2264397-17-alan.previn.teres.alexis@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 16/17] Verify protected surfaces are dma
 buffer sharable
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
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 18, 2021 at 03:33:43AM -0700, Alan Previn wrote:
> Verify we can export a protected surface from
> protected context A into protected context B (with
> different client driver handles) and protected
> rendering is successful even after prior file
> handle is closed (i.e. pxp specific refcounting
> works).
> =

> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/i915/gem_pxp.c | 103 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> =

> diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> index 69a3143a..179fb742 100644
> --- a/tests/i915/gem_pxp.c
> +++ b/tests/i915/gem_pxp.c
> @@ -3,6 +3,7 @@
>   * Copyright =A9 2021 Intel Corporation
>   */
>  =

> +#include <fcntl.h>
>  #include "igt.h"
>  #include "i915/gem.h"
>  =

> @@ -618,6 +619,106 @@ static void test_render_pxp_protsrc_to_protdest(int=
 i915)
>  	buf_ops_destroy(bops);
>  }
>  =

> +static int export_handle(int fd, uint32_t handle, int *outfd)
> +{
> +	struct drm_prime_handle args;
> +	int ret;
> +
> +	args.handle =3D handle;
> +	args.flags =3D DRM_CLOEXEC;
> +	args.fd =3D -1;
> +
> +	ret =3D drmIoctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
> +	if (ret)
> +		ret =3D errno;
> +	*outfd =3D args.fd;
> +
> +	return ret;
> +}
> +
> +static void test_pxp_dmabuffshare_refcnt(void)
> +{
> +	uint32_t ctx[2], sbo[2], dbo[2];
> +	struct intel_buf *sbuf[2], *dbuf[2];
> +	struct buf_ops *bops[2];
> +	struct intel_bb *ibb[2];
> +	int fd[2], dmabuf_fd =3D 0, ret, n, num_matches =3D 0;
> +	uint32_t encrypted[2][TSTSURF_SIZE/TSTSURF_BYTESPP];
> +
> +	/* First, create the client driver handles and
> +	 * protected dest buffer (is exported via dma-buff
> +	 * from first handle and imported to the second).
> +	 */
> +	for (n =3D 0; n < 2; ++n) {
> +		fd[n] =3D drm_open_driver(DRIVER_INTEL);
> +		igt_require(fd[n]);
> +		if (n =3D=3D 0) {
> +			dbo[0] =3D alloc_and_fill_dest_buff(fd[0], true, TSTSURF_SIZE,
> +							  TSTSURF_INITCOLOR1);
> +		} else {
> +			ret =3D export_handle(fd[0], dbo[0], &dmabuf_fd);
> +			igt_assert(ret =3D=3D 0);
> +			dbo[1] =3D prime_fd_to_handle(fd[1], dmabuf_fd);
> +			igt_assert(dbo[1]);
> +		}
> +	}
> +	/* Repeat twice: Create a full set of assets to perform
> +	 * a protected 3D session but using the same dest buffer
> +	 * from above.
> +	 */
> +	for (n =3D 0; n < 2; ++n) {
> +		ret =3D create_ctx_with_params(fd[n], true, true, true, false, &ctx[n]=
);
> +		igt_assert_eq(ret, 0);
> +		igt_assert_eq(get_ctx_protected_param(fd[n], ctx[n]), 1);
> +		ibb[n] =3D intel_bb_create_with_context(fd[n], ctx[n], 4096);
> +		intel_bb_set_pxp(ibb[n], true, DISPLAY_APPTYPE,
> +				 I915_PROTECTED_CONTENT_DEFAULT_SESSION);
> +
> +		bops[n] =3D buf_ops_create(fd[n]);
> +		if (n =3D=3D 1)
> +			fill_bo_content(fd[1], dbo[1], TSTSURF_SIZE, TSTSURF_INITCOLOR2);
> +
> +		dbuf[n] =3D intel_buf_create_using_handle(bops[n], dbo[n], TSTSURF_WID=
TH,
> +							TSTSURF_HEIGHT,	TSTSURF_BYTESPP*8, 0,
> +							I915_TILING_NONE, 0);
> +		intel_buf_set_pxp(dbuf[n], true);
> +
> +		sbo[n] =3D alloc_and_fill_dest_buff(fd[n], false, TSTSURF_SIZE, TSTSUR=
F_FILLCOLOR1);
> +		sbuf[n] =3D intel_buf_create_using_handle(bops[n], sbo[n], TSTSURF_WID=
TH,
> +							TSTSURF_HEIGHT, TSTSURF_BYTESPP*8, 0,
> +							I915_TILING_NONE, 0);
> +
> +		gen12_render_copyfunc(ibb[n], sbuf[n], 0, 0, TSTSURF_WIDTH, TSTSURF_HE=
IGHT,
> +				      dbuf[n], 0, 0);
> +		gem_sync(fd[n], dbo[n]);
> +
> +		assert_bo_content_check(fd[n], dbo[n], COMPARE_COLOR_UNREADIBLE, TSTSU=
RF_SIZE,
> +					TSTSURF_FILLCOLOR1, NULL, 0);
> +		assert_bo_content_check(fd[n], dbo[n], COPY_BUFFER, TSTSURF_SIZE, 0, e=
ncrypted[n],
> +					TSTSURF_SIZE);
> +
> +		/* free up all assets except the dest buffer to
> +		 * verify dma buff refcounting is performed on
> +		 * the protected dest buffer on the 2nd loop with
> +		 * successful reuse in another protected render.
> +		 */
> +		intel_bb_destroy(ibb[n]);
> +		intel_buf_destroy(sbuf[n]);
> +		intel_buf_destroy(dbuf[n]);
> +		gem_close(fd[n], sbo[n]);
> +		gem_close(fd[n], dbo[n]);
> +		gem_context_destroy(fd[n], ctx[n]);
> +		close(fd[n]);
> +	}
> +
> +	/* Verify that encrypted output across loops were equal */
> +	for (n =3D 0; n < (TSTSURF_SIZE/4); ++n)
> +		if (encrypted[0][n] =3D=3D encrypted[1][n])
> +			++num_matches;
> +	igt_assert(num_matches =3D=3D (TSTSURF_SIZE/4));
> +}
> +
> +
>  static void init_powermgt_resources(int i915, struct powermgt_data *pm)
>  {
>  	pm->debugfsdir =3D igt_debugfs_dir(i915);
> @@ -912,6 +1013,8 @@ igt_main
>  			test_render_pxp_src_to_protdest(i915);
>  		igt_subtest("protected-encrypted-src-copy-not-readible")
>  			test_render_pxp_protsrc_to_protdest(i915);
> +		igt_subtest("dmabuf-shared-protected-dst-is-context-refcounted")
> +			test_pxp_dmabuffshare_refcnt();
>  	}
>  	igt_subtest_group {
>  		igt_fixture {
> -- =

> 2.25.1
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
