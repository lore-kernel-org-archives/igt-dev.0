Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808DC10E4A2
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 07:37:10 +0000 (UTC)
Message-ID: <994a354b-0d69-f7ee-0781-45d2a619fbe7@intel.com>
Date: Wed, 12 Jul 2023 10:37:11 +0300
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, <igt-dev@lists.freedesktop.org>
References: <20230712071701.11235-1-contact@emersion.fr>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20230712071701.11235-1-contact@emersion.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2] tests/syncobj_eventfd: new test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: James Jones <jajones@nvidia.com>, Austin Shafer <ashafer@nvidia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Faith
 Ekstrand <faith.ekstrand@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 12/07/2023 10:17, Simon Ser wrote:
> This series implements a new test suite for the DRM_IOCTL_SYNCOBJ_EVENTFD
> IOCTL introduced in [1].
>
> v2:
> - Check for DRM_CAP_SYNCOBJ_TIMELINE instead of DRM_CAP_SYNCOBJ
> - Fix syncobj_eventfd availability check: ENOENT is returned when an
>    IOCTL doesn't exist, so use an error path which returns a different
>    errno
>
> [1]: https://lore.kernel.org/dri-devel/20230711142803.4054-1-contact@emersion.fr/T/#u
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: James Jones <jajones@nvidia.com>
> Cc: Austin Shafer <ashafer@nvidia.com>


These tests look correct to me.


Are you not planning on testing/supporting 
DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT and DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL ?


Thanks,


-Lionel


> ---
>   include/drm-uapi/drm.h  |  22 +++
>   lib/igt_syncobj.c       |  40 +++++
>   lib/igt_syncobj.h       |   4 +
>   tests/meson.build       |   1 +
>   tests/syncobj_eventfd.c | 344 ++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 411 insertions(+)
>   create mode 100644 tests/syncobj_eventfd.c
>
> diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
> index 5e54c3aa4c3a..7368a533c74b 100644
> --- a/include/drm-uapi/drm.h
> +++ b/include/drm-uapi/drm.h
> @@ -903,6 +903,27 @@ struct drm_syncobj_timeline_wait {
>   	__u32 pad;
>   };
>   
> +/**
> + * struct drm_syncobj_eventfd
> + * @handle: syncobj handle.
> + * @flags: Zero to wait for the point to be signalled, or
> + *         &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE to wait for a fence to be
> + *         available for the point.
> + * @point: syncobj timeline point (set to zero for binary syncobjs).
> + * @fd: Existing eventfd to sent events to.
> + * @pad: Must be zero.
> + *
> + * Register an eventfd to be signalled by a syncobj. The eventfd counter will
> + * be incremented by one.
> + */
> +struct drm_syncobj_eventfd {
> +	__u32 handle;
> +	__u32 flags;
> +	__u64 point;
> +	__s32 fd;
> +	__u32 pad;
> +};
> +
>   
>   struct drm_syncobj_array {
>   	__u64 handles;
> @@ -1089,6 +1110,7 @@ extern "C" {
>   #define DRM_IOCTL_SYNCOBJ_QUERY		DRM_IOWR(0xCB, struct drm_syncobj_timeline_array)
>   #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
>   #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
> +#define DRM_IOCTL_SYNCOBJ_EVENTFD	DRM_IOWR(0xCE, struct drm_syncobj_eventfd)
>   
>   #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
>   
> diff --git a/lib/igt_syncobj.c b/lib/igt_syncobj.c
> index a24ed10b7a0e..a53393bd7245 100644
> --- a/lib/igt_syncobj.c
> +++ b/lib/igt_syncobj.c
> @@ -543,3 +543,43 @@ syncobj_timeline_to_timeline(int fd,
>   					 timeline_dst, point_dst,
>   					 timeline_src, point_src, 0), 0);
>   }
> +
> +int
> +__syncobj_eventfd(int fd, uint32_t handle, uint64_t point, uint32_t flags,
> +		  int ev_fd)
> +{
> +	struct drm_syncobj_eventfd args;
> +	int ret;
> +
> +	args.handle = handle;
> +	args.flags = flags;
> +	args.point = point;
> +	args.fd = ev_fd;
> +	args.pad = 0;
> +
> +	ret = igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_EVENTFD, &args);
> +	if (ret) {
> +		ret = -errno;
> +		igt_assume(ret);
> +		errno = 0;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * syncobj_eventfd:
> + * @fd: The DRM file descriptor.
> + * @handle: A syncobj handle.
> + * @point: A point on the timeline syncobj, or 0 for binary syncobjs.
> + * @flags: Flags.
> + * @ev_fd: An eventfd.
> + *
> + * Wait for a syncobj with an eventfd.
> + */
> +void
> +syncobj_eventfd(int fd, uint32_t handle, uint64_t point, uint32_t flags,
> +		int ev_fd)
> +{
> +	igt_assert_eq(__syncobj_eventfd(fd, handle, point, flags, ev_fd), 0);
> +}
> diff --git a/lib/igt_syncobj.h b/lib/igt_syncobj.h
> index e6725671d900..3911696d52f0 100644
> --- a/lib/igt_syncobj.h
> +++ b/lib/igt_syncobj.h
> @@ -65,5 +65,9 @@ void syncobj_timeline_to_timeline(int fd,
>   				  uint64_t timeline_src, uint32_t point_src);
>   void syncobj_timeline_signal(int fd, uint32_t *handles, uint64_t *points,
>   			     uint32_t count);
> +int __syncobj_eventfd(int fd, uint32_t handle, uint64_t point, uint32_t flags,
> +		      int ev_fd);
> +void syncobj_eventfd(int fd, uint32_t handle, uint64_t point, uint32_t flags,
> +		     int ev_fd);
>   
>   #endif /* IGT_SYNCOBJ_H */
> diff --git a/tests/meson.build b/tests/meson.build
> index d56e4c89daf3..9fc9199e267b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -78,6 +78,7 @@ test_progs = [
>   	'prime_udl',
>   	'prime_vgem',
>   	'syncobj_basic',
> +	'syncobj_eventfd',
>   	'syncobj_wait',
>   	'syncobj_timeline',
>   	'sw_sync',
> diff --git a/tests/syncobj_eventfd.c b/tests/syncobj_eventfd.c
> new file mode 100644
> index 000000000000..95a2a4632114
> --- /dev/null
> +++ b/tests/syncobj_eventfd.c
> @@ -0,0 +1,344 @@
> +/*
> + * Copyright © 2023 Simon Ser
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
> +
> +#include "igt.h"
> +#include "sw_sync.h"
> +#include "igt_syncobj.h"
> +#include <fcntl.h>
> +#include <poll.h>
> +#include <sys/eventfd.h>
> +#include <stdint.h>
> +#include "drm.h"
> +/**
> + * TEST: syncobj eventfd
> + * Category: Infrastructure
> + * Description: Tests for the drm sync object eventfd API
> + * Feature: synchronization
> + * Functionality: semaphore
> + * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
> + */
> +
> +IGT_TEST_DESCRIPTION("Tests for the drm sync object eventfd API");
> +
> +static bool
> +has_syncobj_eventfd(int fd)
> +{
> +	uint64_t value;
> +	int ret;
> +
> +	if (drmGetCap(fd, DRM_CAP_SYNCOBJ_TIMELINE, &value))
> +		return false;
> +	if (!value)
> +		return false;
> +
> +	/* Try waiting with invalid flags should fail with EINVAL */
> +	ret = __syncobj_eventfd(fd, 0, 0, 0xdeadbeef, -1);
> +	return ret == -EINVAL;
> +}
> +
> +static int
> +syncobj_attach_sw_sync(int fd, uint32_t handle, uint64_t point)
> +{
> +	int timeline, fence;
> +	uint32_t syncobj;
> +
> +	timeline = sw_sync_timeline_create();
> +	fence = sw_sync_timeline_create_fence(timeline, 1);
> +
> +	if (point == 0) {
> +		syncobj_import_sync_file(fd, handle, fence);
> +	} else {
> +		syncobj = syncobj_create(fd, 0);
> +
> +		syncobj_import_sync_file(fd, syncobj, fence);
> +		syncobj_binary_to_timeline(fd, handle, point, syncobj);
> +		syncobj_destroy(fd, syncobj);
> +	}
> +
> +	close(fence);
> +
> +	return timeline;
> +}
> +
> +static int
> +ev_fd_read(int ev_fd)
> +{
> +	uint64_t ev_fd_value;
> +	int ret;
> +
> +	ret = read(ev_fd, &ev_fd_value, sizeof(ev_fd_value));
> +	if (ret == -1)
> +		return -errno;
> +	igt_assert_eq(ret, sizeof(ev_fd_value));
> +	return 0;
> +}
> +
> +static void
> +ev_fd_poll_in(int ev_fd, bool avail)
> +{
> +	struct pollfd pollfd;
> +	int ret;
> +	int timeout_ms;
> +
> +	/* Wait 5s if we're expecting data, 10ms otherwise */
> +	timeout_ms = avail ? 5000 : 10;
> +	pollfd.fd = ev_fd;
> +	pollfd.events = POLLIN;
> +	pollfd.revents = 0;
> +	ret = poll(&pollfd, 1, timeout_ms);
> +	if (avail) {
> +		igt_assert(ret >= 0);
> +		igt_assert(pollfd.revents & POLLIN);
> +	} else {
> +		igt_assert_eq(ret, 0);
> +	}
> +}
> +
> +static void
> +ev_fd_assert_unsignaled(int ev_fd)
> +{
> +	/* Poll the eventfd to give the kernel time to signal it, error out if
> +	 * that happens */
> +	ev_fd_poll_in(ev_fd, false);
> +	igt_assert_eq(ev_fd_read(ev_fd), -EAGAIN);
> +}
> +
> +static void
> +ev_fd_assert_signaled(int ev_fd)
> +{
> +	ev_fd_poll_in(ev_fd, true);
> +	igt_assert_eq(ev_fd_read(ev_fd), 0);
> +}
> +
> +static const char test_bad_flags_desc[] =
> +	"Verifies that passing bad flags is rejected";
> +static void
> +test_bad_flags(int fd)
> +{
> +	uint32_t flags;
> +	uint32_t syncobj;
> +	int ev_fd;
> +
> +	syncobj = syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
> +	flags = 0xdeadbeef;
> +	ev_fd = eventfd(0, EFD_NONBLOCK);
> +	igt_assert_eq(__syncobj_eventfd(fd, syncobj, 0, flags, ev_fd), -EINVAL);
> +
> +	close(ev_fd);
> +	syncobj_destroy(fd, syncobj);
> +}
> +
> +static const char test_illegal_handle_desc[] =
> +	"Verifies that passing an invalid syncobj handle is rejected";
> +static void
> +test_illegal_handle(int fd)
> +{
> +	int ev_fd;
> +
> +	ev_fd = eventfd(0, EFD_NONBLOCK);
> +	igt_assert_eq(__syncobj_eventfd(fd, 0, 0, 0, ev_fd), -ENOENT);
> +
> +	close(ev_fd);
> +}
> +
> +static const char test_illegal_eventfd_desc[] =
> +	"Verifies that passing an invalid eventfd is rejected";
> +static void
> +test_illegal_eventfd(int fd)
> +{
> +	int dev_null;
> +	uint32_t syncobj;
> +
> +	syncobj = syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
> +
> +	dev_null = open("/dev/null", O_RDWR);
> +	igt_assert(dev_null >= 0);
> +
> +	igt_assert_eq(__syncobj_eventfd(fd, syncobj, 0, 0, dev_null), -EINVAL);
> +
> +	close(dev_null);
> +	syncobj_destroy(fd, syncobj);
> +}
> +
> +static const char test_bad_pad_desc[] =
> +	"Verifies that passing a non-zero padding is rejected";
> +static void
> +test_bad_pad(int fd)
> +{
> +	struct drm_syncobj_eventfd args;
> +	int ret;
> +
> +	args.handle = syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
> +	args.flags = 0;
> +	args.point = 0;
> +	args.fd = eventfd(0, EFD_NONBLOCK);
> +	args.pad = 0xdeadbeef;
> +
> +	ret = drmIoctl(fd, DRM_IOCTL_SYNCOBJ_EVENTFD, &args);
> +	igt_assert(ret == -1 && errno == EINVAL);
> +}
> +
> +static const char test_wait_desc[] =
> +	"Verifies waiting an already-materialized fence";
> +static void
> +test_wait(int fd, bool use_timeline)
> +{
> +	uint32_t syncobj;
> +	int timeline, ev_fd_wait, ev_fd_avail;
> +	uint64_t point = use_timeline ? 1 : 0;
> +
> +	syncobj = syncobj_create(fd, 0);
> +	timeline = syncobj_attach_sw_sync(fd, syncobj, point);
> +	ev_fd_wait = eventfd(0, EFD_NONBLOCK);
> +	ev_fd_avail = eventfd(0, EFD_NONBLOCK);
> +
> +	syncobj_eventfd(fd, syncobj, point, 0, ev_fd_wait);
> +	syncobj_eventfd(fd, syncobj, point, DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE,
> +			ev_fd_avail);
> +
> +	ev_fd_assert_unsignaled(ev_fd_wait);
> +	ev_fd_assert_signaled(ev_fd_avail);
> +
> +	sw_sync_timeline_inc(timeline, 1);
> +
> +	ev_fd_assert_signaled(ev_fd_wait);
> +
> +	close(ev_fd_wait);
> +	close(ev_fd_avail);
> +	close(timeline);
> +	syncobj_destroy(fd, syncobj);
> +}
> +
> +static const char test_wait_before_signal_desc[] =
> +	"Verifies waiting a fence not yet materialized";
> +static void
> +test_wait_before_signal(int fd, bool use_timeline)
> +{
> +	uint32_t syncobj;
> +	int timeline, ev_fd_wait, ev_fd_avail;
> +	uint64_t point = use_timeline ? 1 : 0;
> +
> +	syncobj = syncobj_create(fd, 0);
> +	ev_fd_wait = eventfd(0, EFD_NONBLOCK);
> +	ev_fd_avail = eventfd(0, EFD_NONBLOCK);
> +
> +	syncobj_eventfd(fd, syncobj, point, 0, ev_fd_wait);
> +	syncobj_eventfd(fd, syncobj, point, DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE,
> +			ev_fd_avail);
> +
> +	ev_fd_assert_unsignaled(ev_fd_wait);
> +	ev_fd_assert_unsignaled(ev_fd_avail);
> +
> +	timeline = syncobj_attach_sw_sync(fd, syncobj, point);
> +
> +	ev_fd_assert_unsignaled(ev_fd_wait);
> +	ev_fd_assert_signaled(ev_fd_avail);
> +
> +	sw_sync_timeline_inc(timeline, 1);
> +
> +	ev_fd_assert_signaled(ev_fd_wait);
> +
> +	close(ev_fd_wait);
> +	close(ev_fd_avail);
> +	close(timeline);
> +	syncobj_destroy(fd, syncobj);
> +}
> +
> +static const char test_wait_signaled_desc[] =
> +	"Verifies waiting an already-signaled fence";
> +static void
> +test_wait_signaled(int fd, bool use_timeline)
> +{
> +	uint32_t syncobj;
> +	int timeline, ev_fd_wait, ev_fd_avail;
> +	uint64_t point = use_timeline ? 1 : 0;
> +
> +	syncobj = syncobj_create(fd, 0);
> +	ev_fd_wait = eventfd(0, EFD_NONBLOCK);
> +	ev_fd_avail = eventfd(0, EFD_NONBLOCK);
> +
> +	timeline = syncobj_attach_sw_sync(fd, syncobj, point);
> +	sw_sync_timeline_inc(timeline, 1);
> +
> +	syncobj_eventfd(fd, syncobj, point, 0, ev_fd_wait);
> +	syncobj_eventfd(fd, syncobj, point, DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE,
> +			ev_fd_avail);
> +
> +	ev_fd_assert_signaled(ev_fd_wait);
> +	ev_fd_assert_signaled(ev_fd_avail);
> +
> +	close(ev_fd_wait);
> +	close(ev_fd_avail);
> +	close(timeline);
> +	syncobj_destroy(fd, syncobj);
> +}
> +
> +igt_main
> +{
> +	int fd = -1, i;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_ANY);
> +		igt_require(has_syncobj_eventfd(fd));
> +		igt_require_sw_sync();
> +	}
> +
> +	igt_describe(test_bad_flags_desc);
> +	igt_subtest("invalid-bad-flags")
> +		test_bad_flags(fd);
> +
> +	igt_describe(test_illegal_handle_desc);
> +	igt_subtest("invalid-illegal-handle")
> +		test_illegal_handle(fd);
> +
> +	igt_describe(test_illegal_eventfd_desc);
> +	igt_subtest("invalid-illegal-eventfd")
> +		test_illegal_eventfd(fd);
> +
> +	igt_describe(test_bad_pad_desc);
> +	igt_subtest("invalid-bad-pad")
> +		test_bad_pad(fd);
> +
> +	for (i = 0; i < 2; i++) {
> +		bool use_timeline = i == 1;
> +		const char *kind = use_timeline ? "timeline" : "binary";
> +
> +		igt_describe(test_wait_desc);
> +		igt_subtest_f("%s-wait", kind)
> +			test_wait(fd, use_timeline);
> +
> +		igt_describe(test_wait_before_signal_desc);
> +		igt_subtest_f("%s-wait-before-signal", kind)
> +			test_wait_before_signal(fd, use_timeline);
> +
> +		igt_describe(test_wait_signaled_desc);
> +		igt_subtest_f("%s-wait-signaled", kind)
> +			test_wait_signaled(fd, use_timeline);
> +	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}

