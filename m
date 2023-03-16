Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7B510E39D
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 18:19:19 +0000 (UTC)
Date: Thu, 16 Mar 2023 19:19:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230316181915.kpjr5vav6zeozgfg@kamilkon-desk1>
References: <20230309135116.128602-1-mcanal@igalia.com>
 <20230309135116.128602-3-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230309135116.128602-3-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/vgem_basic: Add negative
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Daniel Vetter <daniel@ffwll.ch>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Maíra,

On 2023-03-09 at 10:51:16 -0300, Maíra Canal wrote:
> Currently, the vgem_basic tests don't cover any negative tests. So, add
---------- ^ ---------------------------------------------------- ^^^
Drop "," and "So,", also s/add/Added/

> tests covering possible error paths of the driver by inputting invalid
> arguments and checking if the driver is returning the correct values.
-------------------------------------------------------------- ^
Insert here "error" word.

> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  tests/vgem_basic.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index 2a2900f8..4f371b3d 100644
> --- a/tests/vgem_basic.c
> +++ b/tests/vgem_basic.c
> @@ -152,6 +152,27 @@ static void test_dmabuf_export(int fd)
>  	close(other);
>  }
>  
> +static void test_busy_fence(int fd)
> +{
> +	struct drm_vgem_fence_attach arg = {};
> +	struct vgem_bo bo;
> +
> +	bo.width = 1024;
> +	bo.height = 1;
> +	bo.bpp = 32;
> +	vgem_create(fd, &bo);
> +
> +	/* Attach a fence for reading */
> +	vgem_fence_attach(fd, &bo, 0);
> +
> +	/* Attach a fence for writing, so it should be an exclusive fence */
> +	arg.handle = bo.handle;
> +	arg.flags = VGEM_FENCE_WRITE;
> +
> +	/* As the fence is not exclusive, return -EBUSY, indicating a conflicting fence */
> +	do_ioctl_err(fd, DRM_IOCTL_VGEM_FENCE_ATTACH, &arg, EBUSY);
> +}
> +
>  static void test_dmabuf_mmap(int fd)
>  {
>  	struct vgem_bo bo;
> @@ -434,6 +455,48 @@ igt_main
>  	igt_subtest_f("mmap")
>  		test_mmap(fd);
>  
> +	igt_describe("Make sure a fence cannot be attached and signaled with invalid flags.");
> +	igt_subtest("bad-flag") {
> +		struct drm_vgem_fence_attach attach = {
> +			.flags = 0xff,
> +		};
> +
> +		struct drm_vgem_fence_signal signal = {
> +			.flags = 0xff,
> +		};
> +
> +		do_ioctl_err(fd, DRM_IOCTL_VGEM_FENCE_ATTACH, &attach, EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_VGEM_FENCE_SIGNAL, &signal, EINVAL);
> +	}
> +
> +	igt_describe("Make sure the pad is zero.");
--------------------------------------- ^^^^
imho better write: non-zero pad is rejected

> +	igt_subtest("bad-pad") {
> +		struct drm_vgem_fence_attach arg = {
> +			.pad = 0x01,

What about few other invalid values ? If you think it is worth
checking it can go in following patch or with this one.

With small description fixes
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> +		};
> +		do_ioctl_err(fd, DRM_IOCTL_VGEM_FENCE_ATTACH, &arg, EINVAL);
> +	}
> +
> +	igt_describe("Make sure a fence cannot be attached to a invalid handle.");
> +	igt_subtest("bad-handle") {
> +		struct drm_vgem_fence_attach arg = {
> +			.handle = 0xff,
> +		};
> +		do_ioctl_err(fd, DRM_IOCTL_VGEM_FENCE_ATTACH, &arg, ENOENT);
> +	}
> +
> +	igt_describe("Make sure a non-existent fence cannot be signaled.");
> +	igt_subtest("bad-fence") {
> +		struct drm_vgem_fence_signal arg = {
> +			.fence = 0xff,
> +		};
> +		do_ioctl_err(fd, DRM_IOCTL_VGEM_FENCE_SIGNAL, &arg, ENOENT);
> +	}
> +
> +	igt_describe("Make sure a conflicting fence cannot be attached.");
> +	igt_subtest("busy-fence")
> +		test_busy_fence(fd);
> +
>  	igt_subtest_group {
>  		igt_fixture {
>  			igt_require(has_prime_export(fd));
> -- 
> 2.39.2
> 
