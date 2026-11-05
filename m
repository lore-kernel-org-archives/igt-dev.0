Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A84606A31B
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=lel/x4N7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FC6112334;
	Thu,  5 Nov 2026 10:50:32 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C69112334
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 10:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
 MIME-Version:Date:Message-ID:From:Reply-To;
 bh=dmctbHU84hVqYnDZw0U7z0+8NZ356gHvPoNYiao+9oM=; t=1793875769; x=2109235769; 
 b=lel/x4N71uiQaGehqeM49JrDRJKjxwsO4ONOeos23DqQzMI9Ps0a+wiyzcuy4//C9Bfryj8r6F8
 CkkSrb+o7Z6q8AUfaZ43AP8ogdOXuzf1KSywADofOLJqAmTQQ165QIvY4hNQYeFcNK6sX1+5ZwN7X
 hR3yCXfBcA6si0lVzDuVO/oAGanmbBIKF9HitkXywmDXzrztAYzefR3X4VnENBeY0cK6J0J9L9FtD
 IdcLYQudTi8aMApHSQ2gCTqY2P/wmhXDDRaw0ArZxHAbpeWy1Binqq/hmpAIl1Gkry4LkN7LKmRrT
 zMa3WSeFzQGhEUKpRkSjXjfkDSLbsW1q63xQ==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1xOv26-003FK5-LY; Thu, 05 Nov 2026 11:49:26 +0100
Message-ID: <b9ffe1b9-1a65-45bd-858b-74f6ddd40a3b@igalia.com>
Date: Thu, 5 Nov 2026 10:49:25 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
To: David Francis <David.Francis@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Christian Konig <christian.koenig@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20261007141209.2928162-1-David.Francis@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20261007141209.2928162-1-David.Francis@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Sorry for the delay, a combination of things..

On 07/10/2026 15:12, David Francis wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
> functionality, edge cases, and race conditions of this ioctl against
> itself, gem close, gem create, and prime import and export.
> 
> GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. This IGT
> coverage is a prerequisite for validating the eventual kernel-side ioctl
> implementation and makes fixing its security bugs safer.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Cc: Christian Konig <christian.koenig@amd.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>   tests/intel/gem_change_handle.c | 747 ++++++++++++++++++++++++++++++++
>   tests/meson.build               |   1 +
>   2 files changed, 748 insertions(+)
>   create mode 100644 tests/intel/gem_change_handle.c
> 
> diff --git a/tests/intel/gem_change_handle.c b/tests/intel/gem_change_handle.c
> new file mode 100644
> index 000000000..23f2f8b39
> --- /dev/null
> +++ b/tests/intel/gem_change_handle.c
> @@ -0,0 +1,747 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + * Copyright 2026 Intel Corporation
> + *
> + * GPU-agnostic race condition tests for GEM_CHANGE_HANDLE ioctl
> + *
> + * NOTE: This test is located in tests/intel/ directory because:
> + * 1. All gem_* tests are traditionally placed in tests/intel/ regardless
> + *    of GPU vendor, following IGT convention for GEM-related tests
> + * 2. The test uses i915/gem.h and i915/gem_create.h for GEM object creation
> + *    on Intel platforms, though it works vendor-agnostically via DRM core
> + * 3. Some subtest designs (noop-same-handle, invalid-*, edge-*, functional-*)
> + *    were proposed by Simona Vetter (Intel), hence Intel copyright header
> + *
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <pthread.h>
> +#include <sched.h>
> +#include <semaphore.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <sys/stat.h>
> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "i915/gem.h"
> +#include "i915/gem_create.h"
> +
> +/* AMDGPU includes (if available) */
> +#if __has_include("igt_amd.h")

I think I commented on this before. Igt_amd.h is upstream so why would 
we want this? I think just remove it and simpolify the rest of the test 
accordingly.

> +#include "lib/amdgpu/amd_memory.h"
> +#include "igt_amd.h"
> +#define HAS_AMDGPU 1
> +#else
> +#define HAS_AMDGPU 0
> +#endif
> +
> +#define BO_SIZE (16 * 1024)
> +#define RACE_DURATION_SEC 1
> +
> +static bool verbose_logging;
> +
> +/**
> + * TEST: gem change handle
> + * Description: tests for drm ioctl GEM_CHANGE_HANDLE
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: GEM handles
> + * Functionality: gem change handle
> + * Feature: gem
> + * Run type: FULL
> + *
> + * SUBTEST: sanity
> + * Description: Changing a handle to a new value works as intended
> + *
> + * SUBTEST: change_prime
> + * Description: Changing a handle affects the result of prime import
> + *
> + * SUBTEST: new_handle_zero
> + * Description: Changing a handle to 0 should fail
> + *
> + * SUBTEST: new_handle_exceeds_int_max
> + * Description: Changing a handle to > INT_MAX should fail
> + *
> + * SUBTEST: new_handle_equals_old_handle
> + * Description: Changing a handle to itself should fail
> + *
> + * SUBTEST: new_handle_taken
> + * Description: Changing a handle to a value already in use should fail
> + *
> + * SUBTEST: invalid_handle
> + * Description: Changing a non-existent handle should fail
> + *
> + * SUBTEST: race_change_change
> + * Description: Test for race conditions between two GEM_CHANGE_HANDLE
> + *
> + * SUBTEST: race_change_create_close
> + * Description: Test for race conditions between GEM_CHANGE_HANDLE, GEM_CREATE, and GEM_CLOSE
> + *
> + * SUBTEST: race_change_export_import
> + * Description: Test for race conditions between GEM_CHANGE_HANDLE, prime export, and prime import
> + */
> +
> +IGT_TEST_DESCRIPTION("Edge case and race condition tests for GEM_CHANGE_HANDLE");
> +
> +/* Structs */
> +
> +/* Define DRM_IOCTL_GEM_CHANGE_HANDLE if not available in kernel headers */

At this point it, given it landed more than a year ago, it would be 
better to sync drm.h from the kernel.

> +#ifndef DRM_IOCTL_GEM_CHANGE_HANDLE
> +struct drm_gem_change_handle {
> +	__u32 handle;
> +	__u32 new_handle;
> +};
> +
> +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)
> +#endif
> +
> +/* Driver type detection */
> +enum gpu_driver {
> +	DRIVER_TYPE_UNKNOWN = 0,
> +	DRIVER_TYPE_I915,
> +	DRIVER_TYPE_AMDGPU,
> +};
> +
> +/* GPU context structure */
> +struct gpu_ctx {
> +	int fd;
> +	enum gpu_driver driver;
> +};
> +
> +/* Helpers */
> +
> +static uint32_t gem_create_bo(struct gpu_ctx *ctx, uint64_t size)

This should maybe be called gpu_create_bo?

> +{
> +	uint32_t handle = 0;
> +
> +	switch (ctx->driver) {
> +	case DRIVER_TYPE_I915: {
> +		struct drm_i915_gem_create create = { .size = size };
> +
> +		do_ioctl(ctx->fd, DRM_IOCTL_I915_GEM_CREATE, &create);
> +		handle = create.handle;
> +		break;
> +	}

case DRIVER_TYPE_I915:
	return gem_create(ctx->fd, size);

Ie already available in gem_create.h.

> +	case DRIVER_TYPE_AMDGPU:
> +#if HAS_AMDGPU
> +		handle = igt_amd_create_bo(ctx->fd, size);
> +#else
> +		igt_require_f(0, "AMDGPU header not found for AMDGPU driver\n");
> +#endif
> +		break;
> +	default:
> +		igt_assert_f(0, "Unsupported driver\n");
> +	}
> +
> +	igt_assert(handle != 0);
> +	return handle;
> +}
> +
> +static int gem_close_bo(struct gpu_ctx *ctx, uint32_t handle)
> +{
> +	struct drm_gem_close close_args = { .handle = handle };
> +
> +	return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CLOSE, &close_args);
> +}
> +
> +static int gem_change_handle(struct gpu_ctx *ctx, uint32_t old_handle, uint32_t new_handle)
> +{
> +	struct drm_gem_change_handle args = {
> +		.handle = old_handle,
> +		.new_handle = new_handle,
> +	};
> +	return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CHANGE_HANDLE, &args);
> +}
> +
> +static enum gpu_driver detect_driver(int fd)
> +{
> +	/* Check AMDGPU first (primary target) */
> +	if (is_amdgpu_device(fd))
> +		return DRIVER_TYPE_AMDGPU;
> +	if (is_i915_device(fd))
> +		return DRIVER_TYPE_I915;
> +	return DRIVER_TYPE_UNKNOWN;
> +}
> +
> +/* Sanity and Functionality tests */
> +
> +/**
> + * test_sanity - verify rename actually works
> + *
> + * After a successful rename:
> + * - GEM_CLOSE(old_handle) must FAIL (handle no longer exists)
> + * - GEM_CLOSE(new_handle) must SUCCEED (object is there)
> + */
> +static void test_sanity(struct gpu_ctx *ctx)
> +{
> +	uint32_t handle, new_h;
> +	int ret;
> +
> +	handle = gem_create_bo(ctx, 4096);
> +	new_h = handle + 1000;
> +
> +	/* Perform the rename */
> +	ret = gem_change_handle(ctx, handle, new_h);
> +	igt_assert_f(ret == 0,
> +		     "gem_change_handle(%u -> %u) failed: %s\n",
> +		     handle, new_h, strerror(errno));
> +
> +	/* Old handle must be invalid now */
> +	ret = gem_close_bo(ctx, handle);
> +	igt_assert_f(ret < 0 && errno == EINVAL,
> +		     "GEM_CLOSE(old_handle=%u) should fail with EINVAL, "
> +		     "got ret=%d errno=%d (%s)\n",
> +		     handle, ret, errno, strerror(errno));
> +
> +	/* New handle must be valid */
> +	ret = gem_close_bo(ctx, new_h);

FWIW for all success checks you could use gem_close() from 
ioctl_wrappers which has the built in assert. You lose the custom error 
message, but is that really interesting.

For me it's more readable to be more compact so one can focus better on 
test logic versus the noise. I'd then rename gem_close_bo to __gem_close 
so end result is gem_close for success tests and ret = __gem_close for 
negative. That follows the existing helper naming pattern from 
ioctl_wrappers, where double underscore helpers return a negative errno, 
while normal ones assert success.

If you decide to go this route probably also have __gem_change_handle 
and gem_change_handle with the same pattern.

If we convert one of the below subtests to this we would have:

static void test_new_handle_zero(struct gpu_ctx *ctx)
{
	uint32_t handle;
	int ret;

	handle = gpu_create_bo(ctx, 4096);

	/* new_handle = 0 must fail with -EINVAL */
	ret = __gem_change_handle(ctx, handle, 0);
	igt_assert_eq(ret, -EINVAL);

	/* Original handle should still be valid */
	gem_close(ctx, handle);
}

Is it a bit nicer to read? I leave it to you.

> +	igt_assert_f(ret == 0,
> +		     "GEM_CLOSE(new_handle=%u) should succeed, "
> +		     "got ret=%d errno=%d (%s)\n",
> +		     new_h, ret, errno, strerror(errno));
> +}
> +
> +/**
> + * test_change_export - changing a handle affects prime import
> + *
> + * Importing a prime object that has had its handle changed since it was
> + * exported should get the new handle
> + */
> +static void test_change_export(struct gpu_ctx *ctx)
> +{
> +	int ret, handle1, handle2, dmabuf_fd, imported_handle;
> +
> +	/* Create a handle and export it */
> +	handle1 = gem_create_bo(ctx, 4096);
> +	handle2 = handle1 + 1;
> +	dmabuf_fd = prime_handle_to_fd(ctx->fd, handle1);
> +
> +	/* When you import, you get the same handle back */
> +	imported_handle = prime_fd_to_handle(ctx->fd, dmabuf_fd);
> +	igt_assert_eq(imported_handle, handle1);
> +
> +	/* Change the handle (should succeed) */
> +	ret = gem_change_handle(ctx, handle1, handle2);
> +	igt_assert_eq(ret, 0);
> +
> +	/* Import, should get the new handle */
> +	imported_handle = prime_fd_to_handle(ctx->fd, dmabuf_fd);
> +	igt_assert_eq(imported_handle, handle2);
> +
> +	/* Confirm gem object is at the new handle */
> +	igt_assert_eq(gem_close_bo(ctx, handle2), 0);
> +
> +	ret = gem_close_bo(ctx, handle1);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	close(dmabuf_fd);
> +}
> +
> +/* Edge case and fail case tests */
> +
> +/**
> + * test_new_handle_zero - new_handle = 0 should fail
> + *
> + * 0 is not a valid gem handle.
> + */
> +static void test_new_handle_zero(struct gpu_ctx *ctx)
> +{
> +	uint32_t handle;
> +	int ret;
> +
> +	handle = gem_create_bo(ctx, 4096);
> +
> +	/* new_handle = 0 must fail with -EINVAL */
> +	ret = gem_change_handle(ctx, handle, 0);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	/* Original handle should still be valid */
> +	igt_assert_eq(gem_close_bo(ctx, handle), 0);
> +}
> +
> +/**
> + * test_new_handle_exceeds_int_max - new_handle > INT_MAX should fail
> + *
> + * The kernel enforces an idr_alloc() limitation: new_handle must be <= INT_MAX.
> + */
> +static void test_new_handle_exceeds_int_max(struct gpu_ctx *ctx)
> +{
> +	uint32_t handle;
> +	int ret;
> +
> +	handle = gem_create_bo(ctx, 4096);
> +
> +	/* new_handle > INT_MAX must fail with -EINVAL */
> +	ret = gem_change_handle(ctx, handle, (uint32_t)INT_MAX + 1);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, EINVAL);

About this one I am not sure. Is it not implementation details as long 
as the uapi for handle is u32? Let say someone converts to XArray one 
day and then we have to artificially limit that to s32 just so 
gem_change_handle can keep working.

> +
> +	/* Also test 0xFFFFFFFF */
> +	ret = gem_change_handle(ctx, handle, 0xFFFFFFFF);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	/* Original handle should still be valid */
> +	igt_assert_eq(gem_close_bo(ctx, handle), 0);
> +}
> +
> +/**
> + * test_new_handle_equals_old_handle - new_handle = old_handle should fail
> + *
> + * The ioctl treats old_handle = new_handle as invalid input.
> + */
> +static void test_new_handle_equals_old_handle(struct gpu_ctx *ctx)
> +{
> +	uint32_t handle;
> +	int ret;
> +
> +	handle = gem_create_bo(ctx, 4096);
> +
> +	/* new_handle = old_handle must fail with -EINVAL */
> +	ret = gem_change_handle(ctx, handle, handle);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	/* same thing if handle doesn't exist */
> +	ret = gem_change_handle(ctx, handle + 1, handle + 1);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	/* Original handle should still be valid */
> +	igt_assert_eq(gem_close_bo(ctx, handle), 0);
> +}
> +
> +/**
> + * test_new_handle_taken - new_handle being the handle of another gem object must fail
> + *
> + * Not allowed to change a handle to a handle that's already taken
> + */
> +static void test_new_handle_taken(struct gpu_ctx *ctx)
> +{
> +	uint32_t handle, handle_2;
> +	int ret;
> +
> +	handle = gem_create_bo(ctx, 4096);
> +	handle_2 = gem_create_bo(ctx, 4096);
> +
> +	/* new_handle is taken must fail with -ENOSPC (direct from idr_alloc) */
> +	ret = gem_change_handle(ctx, handle, handle_2);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, ENOSPC);

Hmm.. this is actually leaking the wrong implementation detail of 
idr_alloc to ABI. ENOSPC is "no free handles". It feels it would be 
better if gem_change_handle returned EBUSY or EEXIST for this case so it 
is not conflated. Thoughts?

> +
> +	/* And the other way */
> +	ret = gem_change_handle(ctx, handle_2, handle);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, ENOSPC);
> +
> +	/* Original handles should still be valid */
> +	igt_assert_eq(gem_close_bo(ctx, handle), 0);
> +	igt_assert_eq(gem_close_bo(ctx, handle_2), 0);
> +}
> +
> +/**
> + * test_invalid_handle - non-existent handle should fail
> + *
> + * Using a handle that doesn't exist should return -ENOENT.
> + */
> +static void test_invalid_handle(struct gpu_ctx *ctx)
> +{
> +	int ret;
> +
> +	/* Use a handle that was never allocated */
> +	ret = gem_change_handle(ctx, 0xDEAD, 0xBEEF);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, ENOENT);
> +
> +	/* Handle 0 is also invalid */
> +	ret = gem_change_handle(ctx, 0, 100);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, ENOENT);

Okay-ish I guess. 0xdead could be 1 and 0xbeef could be 2, as could 100. 
Just from the point of view view use two different target handles when 
there is no need. Up to you.

> +}
> +
> +/* Race condition test structs and helpers */
> +
> +struct change_handle_thread_data {
> +	struct gpu_ctx *ctx;
> +	uint32_t handles[4];
> +	bool running;
> +	int unexpected_errno;
> +	pthread_barrier_t barrier;
> +};
> +
> +static void set_up_context(struct change_handle_thread_data *data, struct gpu_ctx *ctx)
> +{
> +	data->handles[0] = gem_create_bo(ctx, BO_SIZE);
> +	igt_assert(data->handles[0] != 0);
> +	data->handles[1] = gem_create_bo(ctx, BO_SIZE);
> +	igt_assert(data->handles[1] != 0);
> +
> +	data->ctx = ctx;
> +	data->handles[2] = max(data->handles[0], data->handles[1]) + 0x10;
> +	data->handles[3] = max(data->handles[0], data->handles[1]) + 0x20;
> +	data->unexpected_errno = 0;
> +	__atomic_store_n(&data->running, true, __ATOMIC_RELEASE);

Potentially simpler to flip the semantices to data->stop which only 
needs to be written before the join. Because threads are not running yet 
despite true being written so it is slightly confusing.

> +
> +	pthread_barrier_init(&data->barrier, NULL, 2);
> +}
> +
> +/* Race condition test threads */
> +
> +static void *change_handle_thread(void *arg)
> +{
> +	struct change_handle_thread_data *data = arg;
> +	uint32_t *h = data->handles;
> +	int from[] = {h[0], h[2], h[0], h[3], h[3], h[1], h[1], h[3], h[2], h[1], h[0], h[2]};
> +	int to[] =   {h[1], h[3], h[2], h[1], h[0], h[2], h[0], h[2], h[0], h[3], h[3], h[1]};

Haven't I asked about this before somewhere - why not just use random? 
Same to same is already handled so that would just keep working no?

[comes back later.. I was going mad, it looked so familiar where I 
thought I already reviewed it but it is actualyl the userq IGT which 
uses the same pattern..]

> +	int ret;
> +
> +	pthread_barrier_wait(&data->barrier);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		for (int i = 0; i < 12; i++) {

ARRAY_SIZE at least, if not simply random % ARRAY_SIZE.

> +			ret = gem_change_handle(data->ctx, from[i], to[i]);
> +			/*
> +			 * Expected errors:
> +			 * - ENOENT: old handle invalid
> +			 * - ENOSPC: target handle occupied (collision detected during idr_alloc)
> +			 */
> +			if (ret != 0 && errno != ENOENT && errno != ENOSPC)
> +				data->unexpected_errno = errno;
> +		}
> +
> +		sched_yield();
> +	}
> +
> +       return NULL;
> +}
> +
> +static void *close_recreate_thread(void *arg)
> +{
> +	struct change_handle_thread_data *data = arg;
> +	uint32_t *h = data->handles;
> +	pthread_t tid = pthread_self();
> +	int handle, i, ret;
> +
> +	pthread_barrier_wait(&data->barrier);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		/* Close a handle; keep trying until success */
> +		i = 0;

Would it be better to keep the handle to close index to be cycling?

> +		while (true) {
> +			ret = gem_close_bo(data->ctx, h[i]);
> +			if (ret == 0) {
> +				if (verbose_logging) {

Since verbose_logging is a development time thing I suggest to reduce 
the line noise in the code by adding a macro like verbose_log() and have 
it evaluate to nothing if some pre-processor symbol is not defined.

> +					igt_info("[CLOSE-TID:%lu] Closed handle %u\n",
> +						 (unsigned long)tid, h[i]);
> +				}
> +				break;
> +			}
> +
> +			i += 1;
> +			if (i > 3)
> +				i = 0;

i = (i + 1) % ARRAY_SIZE(data->handles), I think..

> +
> +			if (!__atomic_load_n(&data->running, __ATOMIC_ACQUIRE))
> +				return NULL;

Stop condition can go instead of while (true).

> +		}
> +
> +		/* Open a handle */
> +		handle = gem_create_bo(data->ctx, BO_SIZE);
> +		if (verbose_logging) {
> +			igt_info("[CLOSE-TID:%lu] Created new BO with handle %u\n",
> +				 (unsigned long)tid, handle);
> +		}
> +
> +		/* If the opened handle isn't one of the four ones being
> +		 * shuffled, change_handle it in. Keep trying until success.
> +		 */
> +		if (handle != h[0] && handle != h[1] && handle != h[2] && handle != h[3]) {
> +			i = 0;
> +			while (true) {
> +				ret = gem_change_handle(data->ctx, handle, h[i]);
> +				if (ret == 0) {
> +					if (verbose_logging) {
> +						igt_info("[CLOSE-TID:%lu] Change handle %u to %u\n",
> +							 (unsigned long)tid, handle, h[i]);
> +					}
> +					break;
> +				}

As in the other review I am not convinced this loop is guranteed to 
break out. The change handle thread can keep taking the target this loop 
wants by moving other handles around. Not sure how to solve it though 
apart from adding some coordination between the threads.

Sorry I cannot find if you replied to this already? We have many threads 
flying around.

> +
> +				if (ret != 0 && errno != ENOENT && errno != ENOSPC)
> +					data->unexpected_errno = errno;
> +
> +				i += 1;
> +				if (i > 3)
> +					i = 0;
> +
> +				if (!__atomic_load_n(&data->running, __ATOMIC_ACQUIRE))
> +					return NULL;
> +			}
> +		}
> +
> +		sched_yield();
> +	}
> +
> +	return NULL;
> +}
> +
> +static void *export_import_thread(void *arg)
> +{
> +	struct change_handle_thread_data *data = arg;
> +	struct drm_prime_handle prime_args;
> +	uint32_t *h = data->handles;
> +	pthread_t tid = pthread_self();
> +	int handle, i, ret, dmabuf_fd;
> +
> +	pthread_barrier_wait(&data->barrier);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		/* Export a handle; keep trying until success */
> +		i = 0;
> +		while (true) {
> +			prime_args.handle = h[i];
> +			prime_args.flags = DRM_CLOEXEC | DRM_RDWR;
> +			ret = igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime_args);
> +			if (ret == 0) {
> +				if (verbose_logging) {
> +					igt_info("[PRIME-TID:%lu] Exported handle %u\n",
> +						 (unsigned long)tid, h[i]);
> +				}
> +				break;
> +			}
> +
> +			i += 1;
> +			if (i > 3)
> +				i = 0;
> +
> +			if (!__atomic_load_n(&data->running, __ATOMIC_ACQUIRE))
> +				return NULL;
> +		}
> +
> +		dmabuf_fd = prime_args.fd;
> +
> +		/* Import the handle; it should be one of the four handles in the shuffle */
> +		prime_args.fd = dmabuf_fd;
> +		prime_args.flags = 0;
> +		ret = igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &prime_args);
> +
> +		igt_assert_eq(ret, 0);
> +		handle = prime_args.handle;
> +		if (verbose_logging) {
> +			igt_info("[PRIME-TID:%lu] Imported; got handle %u\n",
> +				 (unsigned long)tid, handle);
> +		}
> +		igt_assert(handle == h[0] || handle == h[1] || handle == h[2] || handle == h[3]);
> +
> +		close(dmabuf_fd);
> +
> +		sched_yield();
> +	}
> +
> +	return NULL;
> +}
> +
> +/* Race condition tests */
> +
> +/**
> + * test_race_change_change - Test for race conditions of change_handle against itself
> + *
> + * Start two threads, each of which constantly attempt changes between four different handles
> + * Try to catch race conditions such as changing same handle to two different handles,
> + * Changing two handles to the same handle, changing a handle to a handle itself being changed,
> + * etc.
> + */
> +static void test_race_change_change(struct gpu_ctx *ctx)
> +{
> +	pthread_t thread_change_1, thread_change_2;
> +	struct change_handle_thread_data data = {0};
> +	int num_handles, ret;
> +
> +	set_up_context(&data, ctx);
> +
> +	/* Start both threads simultaneously */
> +	igt_assert_eq(pthread_create(&thread_change_1, NULL, change_handle_thread, &data), 0);
> +	igt_assert_eq(pthread_create(&thread_change_2, NULL, change_handle_thread, &data), 0);
> +
> +	/* Let them race */
> +	sleep(RACE_DURATION_SEC);
> +
> +	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> +	pthread_join(thread_change_1, NULL);
> +	pthread_join(thread_change_2, NULL);
> +
> +	pthread_barrier_destroy(&data.barrier);
> +
> +	igt_assert_eq(data.unexpected_errno, 0);
> +
> +	/* Exactly two gem objects should still exist */
> +	num_handles = 0;
> +	for (int i = 0; i < 4; i++) {

ARRAY_SIZE

> +		ret = gem_close_bo(ctx, data.handles[i]);
> +
> +		if (ret == 0) {
> +			num_handles += 1;
> +		} else {
> +			igt_assert_eq(errno, EINVAL);
> +		}
> +	}
> +	igt_assert_eq(num_handles, 2);

Maaaybe ARRAY_SIZE / 2

Regards,

Tvrtko

> +}
> +
> +/**
> + * test_race_change_create_close - Test for race conditions of change_handle against gem create / close
> + *
> + * Start two threads, one of which attempts to change between four handles while the other alternates
> + * closing a gem handle and creating new ones. Test for race conditions such as change a handle that's
> + * being closed or change a handle to a value that's being created.
> + */
> +static void test_race_change_create_close(struct gpu_ctx *ctx)
> +{
> +	pthread_t thread_change, thread_create_close;
> +	struct change_handle_thread_data data = {0};
> +	int num_handles, ret;
> +
> +	set_up_context(&data, ctx);
> +
> +	/* Start both threads simultaneously */
> +	igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_thread, &data), 0);
> +	igt_assert_eq(pthread_create(&thread_create_close, NULL, close_recreate_thread, &data), 0);
> +
> +	/* Let them race */
> +	sleep(RACE_DURATION_SEC);
> +
> +	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> +	pthread_join(thread_change, NULL);
> +	pthread_join(thread_create_close, NULL);
> +
> +	pthread_barrier_destroy(&data.barrier);
> +
> +	igt_assert_eq(data.unexpected_errno, 0);
> +
> +	/* Depending on where create / close ended up, there can be 1 or 2 handles open */
> +	num_handles = 0;
> +	for (int i = 0; i < 4; i++) {
> +		ret = gem_close_bo(ctx, data.handles[i]);
> +
> +		if (ret == 0) {
> +			num_handles += 1;
> +		} else {
> +			igt_assert_eq(errno, EINVAL);
> +		}
> +	}
> +	igt_assert(num_handles >= 1 && num_handles <= 2);
> +}
> +
> +/**
> + * test_race_change_export_import - Test for race conditions of change_handle against prime export / import
> + *
> + * Start two threads, one of which attempts to change between four handles while the other exports
> + * handles, then imports them again. Check for race conditions such as changing a handle while exporting
> + * it or important a handle while changing it.
> + */
> +static void test_race_change_export_import(struct gpu_ctx *ctx)
> +{
> +	pthread_t thread_change, thread_export_import;
> +	struct change_handle_thread_data data = {0};
> +	int num_handles, ret;
> +
> +	set_up_context(&data, ctx);
> +
> +	/* Start both threads simultaneously */
> +	igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_thread, &data), 0);
> +	igt_assert_eq(pthread_create(&thread_export_import, NULL, export_import_thread, &data), 0);
> +
> +	/* Let them race */
> +	sleep(RACE_DURATION_SEC);
> +
> +	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> +	pthread_join(thread_change, NULL);
> +	pthread_join(thread_export_import, NULL);
> +
> +	pthread_barrier_destroy(&data.barrier);
> +
> +	igt_assert_eq(data.unexpected_errno, 0);
> +
> +	/* Exporting a handle doesn't close it, so should still be exactly 2 */
> +	num_handles = 0;
> +	for (int i = 0; i < 4; i++) {
> +		ret = gem_close_bo(ctx, data.handles[i]);
> +
> +		if (ret == 0) {
> +			num_handles += 1;
> +		} else {
> +			igt_assert_eq(errno, EINVAL);
> +		}
> +	}
> +	igt_assert_eq(num_handles, 2);
> +}
> +
> +int igt_main()
> +{
> +	struct gpu_ctx ctx = { .fd = -1 };
> +
> +	igt_fixture() {
> +		ctx.fd = drm_open_driver_render(DRIVER_ANY);
> +		igt_require(ctx.fd >= 0);
> +
> +		ctx.driver = detect_driver(ctx.fd);
> +		igt_require_f(ctx.driver != DRIVER_TYPE_UNKNOWN,
> +			      "Unsupported GPU driver\n");
> +
> +		if (ctx.driver == DRIVER_TYPE_I915)
> +			igt_require_gem(ctx.fd);
> +	}
> +
> +	igt_describe("Sanity Test: Change handle actually changes handle");
> +	igt_subtest("sanity")
> +		test_sanity(&ctx);
> +
> +	igt_describe("Functinality Test: Change handle affects result of prime import");
> +	igt_subtest("change_prime")
> +		test_change_export(&ctx);
> +
> +
> +	igt_describe("Edge Case: New handle = 0 should fail");
> +	igt_subtest("new_handle_zero")
> +		test_new_handle_zero(&ctx);
> +
> +	igt_describe("Edge Case: New handle > INT_MAX should fail");
> +	igt_subtest("new_handle_exceeds_int_max")
> +		test_new_handle_exceeds_int_max(&ctx);
> +
> +	igt_describe("Edge Case: Changing a handle to itself should fail");
> +	igt_subtest("new_handle_equals_old_handle")
> +		test_new_handle_equals_old_handle(&ctx);
> +
> +	igt_describe("Edge Case: Change a handle to a value which is taken should fail");
> +	igt_subtest("new_handle_taken")
> +		test_new_handle_taken(&ctx);
> +
> +	igt_describe("Edge Case: Changing a non-existent handle should fail");
> +	igt_subtest("invalid_handle")
> +		test_invalid_handle(&ctx);
> +
> +
> +	igt_describe("Race: Changing handle vs. Changing handle");
> +	igt_subtest("race_change_change")
> +		test_race_change_change(&ctx);
> +
> +	igt_describe("Race: Changing handle vs. Create / Close");
> +	igt_subtest("race_change_create_close")
> +		test_race_change_create_close(&ctx);
> +
> +	igt_describe("Race: Changing handle vs. Export / Import");
> +	igt_subtest("race_change_export_import")
> +		test_race_change_export_import(&ctx);
> +
> +	igt_fixture() {
> +		drm_close_driver(ctx.fd);
> +	}
> +
> +}
> \ No newline at end of file
> diff --git a/tests/meson.build b/tests/meson.build
> index 4f5c9be7b..ab083916d 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -104,6 +104,7 @@ intel_i915_progs = [
>   	'gem_blits',
>   	'gem_busy',
>   	'gem_caching',
> +	'gem_change_handle',
>   	'gem_create',
>   	'gem_ccs',
>   	'gem_close',

