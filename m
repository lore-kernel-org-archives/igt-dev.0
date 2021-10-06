Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 6 Oct 2021 17:56:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <YV4bpoOQS8rXNE4O@intel.com>
References: <20211006165151.247868-1-alan.previn.teres.alexis@intel.com>
 <8dfaad70a9504fcebaec0949dc45ad90@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dfaad70a9504fcebaec0949dc45ad90@intel.com>
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
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 06, 2021 at 05:11:02PM +0000, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
> >Sent: Wednesday, October 6, 2021 12:52 PM
> >To: igt-dev@lists.freedesktop.org
> >Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; dri-
> >devel@lists.freedesktop.org; Ruhl; Ruhl, Michael J
> ><michael.j.ruhl@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> >Subject: [PATCH i-g-t 1/1] tests/i915_pxp: Use ioctl_wrapper for
> >DRM_IOCTL_PRIME_HANDLE_TO_FD
> >
> >Replace private helper with call to ioctl_wrapper for
> >DRM_IOCTL_PRIME_HANDLE_TO_FD.
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

pushed, thanks

> 
> M
> 
> >Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> >---
> > tests/i915/gem_pxp.c | 20 +-------------------
> > 1 file changed, 1 insertion(+), 19 deletions(-)
> >
> >diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> >index 79040165..0430f4b8 100644
> >--- a/tests/i915/gem_pxp.c
> >+++ b/tests/i915/gem_pxp.c
> >@@ -622,23 +622,6 @@ static void test_render_pxp_protsrc_to_protdest(int
> >i915)
> > 	buf_ops_destroy(bops);
> > }
> >
> >-static int export_handle(int fd, uint32_t handle, int *outfd)
> >-{
> >-	struct drm_prime_handle args;
> >-	int ret;
> >-
> >-	args.handle = handle;
> >-	args.flags = DRM_CLOEXEC;
> >-	args.fd = -1;
> >-
> >-	ret = drmIoctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
> >-	if (ret)
> >-		ret = errno;
> >-	*outfd = args.fd;
> >-
> >-	return ret;
> >-}
> >-
> > static void test_pxp_dmabuffshare_refcnt(void)
> > {
> > 	uint32_t ctx[2], sbo[2], dbo[2];
> >@@ -659,8 +642,7 @@ static void test_pxp_dmabuffshare_refcnt(void)
> > 			dbo[0] = alloc_and_fill_dest_buff(fd[0], true,
> >TSTSURF_SIZE,
> >
> >TSTSURF_INITCOLOR1);
> > 		} else {
> >-			ret = export_handle(fd[0], dbo[0], &dmabuf_fd);
> >-			igt_assert(ret == 0);
> >+			dmabuf_fd = prime_handle_to_fd(fd[0], dbo[0]);
> > 			dbo[1] = prime_fd_to_handle(fd[1], dmabuf_fd);
> > 			igt_assert(dbo[1]);
> > 		}
> >--
> >2.25.1
> 
