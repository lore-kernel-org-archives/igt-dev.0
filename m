Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFD810E34F
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 09:13:58 +0000 (UTC)
Date: Wed, 12 Oct 2022 12:13:37 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <Y0aFQeg7PexyQpyS@platvala-desk.ger.corp.intel.com>
References: <20221010065929.32110-1-niranjana.vishwanathapura@intel.com>
 <20221010065929.32110-6-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010065929.32110-6-niranjana.vishwanathapura@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 05/11] lib/vm_bind: Add
 prime_handle_to_fd_no_assert()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, igt-dev@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, daniel.vetter@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, Oct 09, 2022 at 11:59:23PM -0700, Niranjana Vishwanathapura wrote:
> Make prime_handle_to_fd_no_assert() as a library interface
> as VM_BIND functionality will also be using it.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  lib/ioctl_wrappers.c | 39 +++++++++++++++++++++++++++++++++------
>  lib/ioctl_wrappers.h |  1 +
>  tests/prime_mmap.c   | 26 ++++----------------------
>  3 files changed, 38 insertions(+), 28 deletions(-)
> 
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index ac37b6bb43..bf7f5f430c 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -1153,28 +1153,55 @@ void gem_require_mocs_registers(int fd)
>  /* prime */
>  
>  /**
> - * prime_handle_to_fd:
> + * prime_handle_to_fd_no_assert:
>   * @fd: open i915 drm file descriptor
>   * @handle: file-private gem buffer object handle
> + * @flags: DRM_IOCTL_PRIME_HANDLE_TO_FD ioctl flags
> + * @fd_out: place holder for output file handle
>   *
>   * This wraps the PRIME_HANDLE_TO_FD ioctl, which is used to export a gem buffer
>   * object into a global (i.e. potentially cross-device) dma-buf file-descriptor
>   * handle.
>   *
> - * Returns: The created dma-buf fd handle.
> + * Returns: 0 on sucess, error otherwise. Upon success, it returns
> + *          the created dma-buf fd handle in fd_out.
>   */
> -int prime_handle_to_fd(int fd, uint32_t handle)
> +int prime_handle_to_fd_no_assert(int fd, uint32_t handle, int flags, int *fd_out)
>  {
>  	struct drm_prime_handle args;
> +	int ret;
>  
>  	memset(&args, 0, sizeof(args));
>  	args.handle = handle;
> -	args.flags = DRM_CLOEXEC;
> +	args.flags = flags;
>  	args.fd = -1;
>  
> -	do_ioctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
> +	ret = drmIoctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
> +	if (ret)
> +		ret = -errno;
> +	*fd_out = args.fd;
>  
> -	return args.fd;
> +	return ret;
> +}
> +
> +/**
> + * prime_handle_to_fd:
> + * @fd: open i915 drm file descriptor
> + * @handle: file-private gem buffer object handle
> + *
> + * This wraps the PRIME_HANDLE_TO_FD ioctl, which is used to export a gem buffer
> + * object into a global (i.e. potentially cross-device) dma-buf file-descriptor
> + * handle. It asserts that ioctl succeeds.
> + *
> + * Returns: The created dma-buf fd handle.
> + */
> +int prime_handle_to_fd(int fd, uint32_t handle)
> +{
> +	int dmabuf;
> +
> +	igt_assert_eq(prime_handle_to_fd_no_assert(fd, handle, DRM_CLOEXEC, &dmabuf), 0);
> +
> +	return dmabuf;
>  }


The convention for naming these kinds of functions is

__do_thing() - returns error code
do_thing()   - asserts success


-- 
Petri Latvala


>  
>  /**
> diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
> index 223cd9160c..9f50a24153 100644
> --- a/lib/ioctl_wrappers.h
> +++ b/lib/ioctl_wrappers.h
> @@ -143,6 +143,7 @@ struct local_dma_buf_sync {
>  #define LOCAL_DMA_BUF_BASE 'b'
>  #define LOCAL_DMA_BUF_IOCTL_SYNC _IOW(LOCAL_DMA_BUF_BASE, 0, struct local_dma_buf_sync)
>  
> +int prime_handle_to_fd_no_assert(int fd, uint32_t handle, int flags, int *fd_out);
>  int prime_handle_to_fd(int fd, uint32_t handle);
>  #ifndef DRM_RDWR
>  #define DRM_RDWR O_RDWR
> diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
> index bc19f68c98..815921e762 100644
> --- a/tests/prime_mmap.c
> +++ b/tests/prime_mmap.c
> @@ -298,24 +298,6 @@ test_dup(uint32_t region, uint64_t size)
>  	close (dma_buf_fd);
>  }
>  
> -/* Used for error case testing to avoid wrapper */
> -static int prime_handle_to_fd_no_assert(uint32_t handle, int flags, int *fd_out)
> -{
> -	struct drm_prime_handle args;
> -	int ret;
> -
> -	args.handle = handle;
> -	args.flags = flags;
> -	args.fd = -1;
> -
> -	ret = drmIoctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
> -	if (ret)
> -		ret = errno;
> -	*fd_out = args.fd;
> -
> -	return ret;
> -}
> -
>  static bool has_userptr(void)
>  {
>  	uint32_t handle = 0;
> @@ -346,9 +328,9 @@ test_userptr(uint32_t region, uint64_t size)
>  	gem_userptr(fd, (uint32_t *)ptr, size, 0, 0, &handle);
>  
>  	/* export userptr */
> -	ret = prime_handle_to_fd_no_assert(handle, DRM_CLOEXEC, &dma_buf_fd);
> +	ret = prime_handle_to_fd_no_assert(fd, handle, DRM_CLOEXEC, &dma_buf_fd);
>  	if (ret) {
> -		igt_assert(ret == EINVAL || ret == ENODEV);
> +		igt_assert(ret == -EINVAL || ret == -ENODEV);
>  		goto free_userptr;
>  	} else {
>  		igt_assert_eq(ret, 0);
> @@ -376,7 +358,7 @@ test_errors(uint32_t region, uint64_t size)
>  	/* Test for invalid flags */
>  	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
>  	for (i = 0; i < ARRAY_SIZE(invalid_flags); i++) {
> -		prime_handle_to_fd_no_assert(handle, invalid_flags[i], &dma_buf_fd);
> +		prime_handle_to_fd_no_assert(fd, handle, invalid_flags[i], &dma_buf_fd);
>  		igt_assert_eq(errno, EINVAL);
>  		errno = 0;
>  	}
> @@ -386,7 +368,7 @@ test_errors(uint32_t region, uint64_t size)
>  	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
>  	fill_bo(handle, size);
>  	gem_close(fd, handle);
> -	prime_handle_to_fd_no_assert(handle, DRM_CLOEXEC, &dma_buf_fd);
> +	prime_handle_to_fd_no_assert(fd, handle, DRM_CLOEXEC, &dma_buf_fd);
>  	igt_assert(dma_buf_fd == -1 && errno == ENOENT);
>  	errno = 0;
>  
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 
