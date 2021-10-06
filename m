Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Date: Wed, 6 Oct 2021 17:11:02 +0000
Message-ID: <8dfaad70a9504fcebaec0949dc45ad90@intel.com>
References: <20211006165151.247868-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20211006165151.247868-1-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/i915_pxp: Use ioctl_wrapper
 for DRM_IOCTL_PRIME_HANDLE_TO_FD
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

>-----Original Message-----
>From: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
>Sent: Wednesday, October 6, 2021 12:52 PM
>To: igt-dev@lists.freedesktop.org
>Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; dri-
>devel@lists.freedesktop.org; Ruhl; Ruhl, Michael J
><michael.j.ruhl@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Subject: [PATCH i-g-t 1/1] tests/i915_pxp: Use ioctl_wrapper for
>DRM_IOCTL_PRIME_HANDLE_TO_FD
>
>Replace private helper with call to ioctl_wrapper for
>DRM_IOCTL_PRIME_HANDLE_TO_FD.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>---
> tests/i915/gem_pxp.c | 20 +-------------------
> 1 file changed, 1 insertion(+), 19 deletions(-)
>
>diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
>index 79040165..0430f4b8 100644
>--- a/tests/i915/gem_pxp.c
>+++ b/tests/i915/gem_pxp.c
>@@ -622,23 +622,6 @@ static void test_render_pxp_protsrc_to_protdest(int
>i915)
> 	buf_ops_destroy(bops);
> }
>
>-static int export_handle(int fd, uint32_t handle, int *outfd)
>-{
>-	struct drm_prime_handle args;
>-	int ret;
>-
>-	args.handle =3D handle;
>-	args.flags =3D DRM_CLOEXEC;
>-	args.fd =3D -1;
>-
>-	ret =3D drmIoctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
>-	if (ret)
>-		ret =3D errno;
>-	*outfd =3D args.fd;
>-
>-	return ret;
>-}
>-
> static void test_pxp_dmabuffshare_refcnt(void)
> {
> 	uint32_t ctx[2], sbo[2], dbo[2];
>@@ -659,8 +642,7 @@ static void test_pxp_dmabuffshare_refcnt(void)
> 			dbo[0] =3D alloc_and_fill_dest_buff(fd[0], true,
>TSTSURF_SIZE,
>
>TSTSURF_INITCOLOR1);
> 		} else {
>-			ret =3D export_handle(fd[0], dbo[0], &dmabuf_fd);
>-			igt_assert(ret =3D=3D 0);
>+			dmabuf_fd =3D prime_handle_to_fd(fd[0], dbo[0]);
> 			dbo[1] =3D prime_fd_to_handle(fd[1], dmabuf_fd);
> 			igt_assert(dbo[1]);
> 		}
>--
>2.25.1
