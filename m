Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AE510E19C
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Dec 2022 10:23:32 +0000 (UTC)
Date: Mon, 12 Dec 2022 12:24:06 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Message-ID: <Y5cBJHf6k4tBy2j0@platvala-desk.ger.corp.intel.com>
References: <20221202154228.45766-1-mcanal@igalia.com>
 <20221202154228.45766-5-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221202154228.45766-5-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/5] tests/vc4: Skip VC4 tests if
 they are running on BCM2711/RaspberryPi4
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Dec 02, 2022 at 12:42:27PM -0300, Maíra Canal wrote:
> Currently, if the VC4 tests are run on BCM2711/Raspberry Pi 4, they will
> fail with no warning. So, add igt_require to the VC4 tests to check if
> VC4 has rendering capabilities before running the tests.
> 
> In order to check if VC4 is running on BCM2711/Raspberry Pi 4, create a
> function that checks if the vc4 driver has syncobj capabilities. If not so,
> it means that the tests are being run on BCM2711/Raspberry Pi 4, as vc5
> doesn't have syncobj capabilities.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  lib/igt_vc4.c               | 12 ++++++++++++
>  lib/igt_vc4.h               |  1 +
>  tests/vc4/vc4_create_bo.c   |  1 +
>  tests/vc4/vc4_dmabuf_poll.c |  4 +++-
>  tests/vc4/vc4_label_bo.c    |  4 +++-
>  tests/vc4/vc4_tiling.c      |  4 +++-
>  tests/vc4/vc4_wait_bo.c     |  1 +
>  tests/vc4/vc4_wait_seqno.c  |  4 +++-
>  8 files changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_vc4.c b/lib/igt_vc4.c
> index 54718cee..760f2210 100644
> --- a/lib/igt_vc4.c
> +++ b/lib/igt_vc4.c
> @@ -59,6 +59,18 @@ bool igt_vc4_is_tiled(uint64_t modifier)
>  	}
>  }
>  
> +bool igt_vc4_is_v3d(int fd)
> +{
> +	uint64_t value;
> +
> +	/*
> +	 * vc5 doesn't have syncobj capabilities, only vc4.
> +	 */
> +	if (drmGetCap(fd, DRM_CAP_SYNCOBJ, &value))
> +		return false;
> +	return value ? true : false;


Can't you just

return value;

?


-- 
Petri Latvala



> +}
> +
>  /**
>   * igt_vc4_get_cleared_bo:
>   * @fd: device file descriptor
> diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
> index ddce90da..79a6ab7d 100644
> --- a/lib/igt_vc4.h
> +++ b/lib/igt_vc4.h
> @@ -34,6 +34,7 @@ void *igt_vc4_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned prot);
>  int igt_vc4_get_param(int fd, uint32_t param, uint64_t *val);
>  bool igt_vc4_purgeable_bo(int fd, int handle, bool purgeable);
>  bool igt_vc4_is_tiled(uint64_t modifier);
> +bool igt_vc4_is_v3d(int fd);
>  
>  void igt_vc4_set_tiling(int fd, uint32_t handle, uint64_t modifier);
>  uint64_t igt_vc4_get_tiling(int fd, uint32_t handle);
> diff --git a/tests/vc4/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
> index c4909b49..c17f25b0 100644
> --- a/tests/vc4/vc4_create_bo.c
> +++ b/tests/vc4/vc4_create_bo.c
> @@ -30,6 +30,7 @@ igt_main
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_VC4);
> +		igt_require(igt_vc4_is_v3d(fd));
>  	}
>  
>  	igt_subtest("create-bo-4096") {
> diff --git a/tests/vc4/vc4_dmabuf_poll.c b/tests/vc4/vc4_dmabuf_poll.c
> index da99964b..c76d4950 100644
> --- a/tests/vc4/vc4_dmabuf_poll.c
> +++ b/tests/vc4/vc4_dmabuf_poll.c
> @@ -59,8 +59,10 @@ igt_main
>  {
>  	int fd;
>  
> -	igt_fixture
> +	igt_fixture {
>  		fd = drm_open_driver(DRIVER_VC4);
> +		igt_require(igt_vc4_is_v3d(fd));
> +	}
>  
>  	igt_subtest("poll-write-waits-until-write-done") {
>  		poll_write_bo_test(fd, POLLOUT);
> diff --git a/tests/vc4/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
> index dd8b5f9a..252bd1ed 100644
> --- a/tests/vc4/vc4_label_bo.c
> +++ b/tests/vc4/vc4_label_bo.c
> @@ -43,8 +43,10 @@ igt_main
>  {
>  	int fd;
>  
> -	igt_fixture
> +	igt_fixture {
>  		fd = drm_open_driver(DRIVER_VC4);
> +		igt_require(igt_vc4_is_v3d(fd));
> +	}
>  
>  	igt_subtest("set-label") {
>  		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
> diff --git a/tests/vc4/vc4_tiling.c b/tests/vc4/vc4_tiling.c
> index 372b1fed..f5bf31f5 100644
> --- a/tests/vc4/vc4_tiling.c
> +++ b/tests/vc4/vc4_tiling.c
> @@ -28,8 +28,10 @@ igt_main
>  {
>  	int fd;
>  
> -	igt_fixture
> +	igt_fixture {
>  		fd = drm_open_driver(DRIVER_VC4);
> +		igt_require(igt_vc4_is_v3d(fd));
> +	}
>  
>  	igt_subtest("get-bad-handle") {
>  		struct drm_vc4_get_tiling get = {
> diff --git a/tests/vc4/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
> index 386642b9..c88a4ac4 100644
> --- a/tests/vc4/vc4_wait_bo.c
> +++ b/tests/vc4/vc4_wait_bo.c
> @@ -64,6 +64,7 @@ igt_main
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_VC4);
> +		igt_require(igt_vc4_is_v3d(fd));
>  		bo_handle = igt_vc4_create_bo(fd, PAGE_SIZE);
>  	}
>  
> diff --git a/tests/vc4/vc4_wait_seqno.c b/tests/vc4/vc4_wait_seqno.c
> index 61485bbf..78984fa3 100644
> --- a/tests/vc4/vc4_wait_seqno.c
> +++ b/tests/vc4/vc4_wait_seqno.c
> @@ -28,8 +28,10 @@ igt_main
>  {
>  	int fd;
>  
> -	igt_fixture
> +	igt_fixture {
>  		fd = drm_open_driver(DRIVER_VC4);
> +		igt_require(igt_vc4_is_v3d(fd));
> +	}
>  
>  	/* A 64-bit seqno should never hit the maximum value over the
>  	 * lifetime of the system.  (A submit per 1000 cycles at 1Ghz
> -- 
> 2.38.1
> 
