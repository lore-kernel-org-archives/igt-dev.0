Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58897C88E75
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 14:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CDC10E59B;
	Tue, 15 Sep 2026 14:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="erLA6i2e";
	dkim-atps=neutral
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com
 [74.125.225.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EAB10E8D5
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2026 14:38:05 +0000 (UTC)
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b91369d18so2804645e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2026 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1789483084; x=1790087884; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=B7eMR6U+uMgef24FQoMy/XnimeZfn3DHv51IX6PJ82E=;
 b=erLA6i2eo0TmsRxz+K7h7WbP16UYMSGDcd139YDbh7LFRQ+cosf3sJKgoeJ2sfWO6S
 uY/lR7KgWLhmcsxgCeRCgcyHPBOGJ2RI1hbj76FhVk1IY7jYi5zpFoAqZ6eUgDxBtpxS
 ZzhHWt58dDE1Rbbpkfm2GkWBnbPimw7v9AfKYZsGpLkHNo4kCCbNNT4pgb21iUvaOx/d
 Uzres639s2iS/JSy4updbdDhVr2EtZ1ykpS6S8yAxJbRZXrnA0TL/ErSBVSKNaWG+Yhr
 nGT1aSBsLbqaxQgicMw4ZQ9YR7J+57wsjFLctHhjvGh4Jahd3Qids2WxE5zFKKq8Sk2g
 kuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789483084; x=1790087884;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=B7eMR6U+uMgef24FQoMy/XnimeZfn3DHv51IX6PJ82E=;
 b=ovqj4hddYAo3kpfZDcLqv131Lc/NsYs0KQp7SQcA+QEuhEziDLOXOdpQ/yAtsu6NtX
 9z+cHE0ExF83cxmMHvWKyGw1vYPZaek4Zu0wxd+bYm/IURe71oGctjLq81a6u9HwO3wZ
 t26L2FpcYpfYQwdLk9ediCGzgSVSQ7XVbBx/vHiodkQnJJs17QoFo+PxfKRbNlWlOjso
 AhBYzAtuOl9A4W9siSjNHak41n3kjFIuDfDGCHAZVLeyj/9M8/Cxk1Y1co7DlsNionBl
 hksZsd87a4vuKTmu3TjNBxkPEoJGfK4dh7ZxadFZbuolM0chxWehoBtPyPnoINC/oNvT
 u5sg==
X-Forwarded-Encrypted: i=1;
 AKwUvBynV05B9hMZ9gy48CNiBdrn7EZ6wbFOjyGpPc4WlCmup9BpGo0FxlaR0IKvTTwc7vin7Zfsaa4f@lists.freedesktop.org
X-Gm-Message-State: AFuF++l71L3bD7H+qEZENHecFGv3ReUnK/PygHkcRuIyMSjn66DQQ62m
 XbUM1O+LESMVqjEt3X75KxqhVEft0Uq68dYZx3jA6b1ukM+NMhg+u2tRpR9El/uUwOM=
X-Gm-Gg: AYBFou1e9WAcJGhwpiSKIxMD3tip494lzTADYIF0Xvt/64aLvuNavz0srFqpGuRa208
 f0eVDlyfypNkn2Oh62H7RewAZOFgHnrRp/x5Pf0ZzyX1uJ/1vlTd/xseUkA2VDPX1F48mnhPU6S
 enwiIdy6EPqqwlD5fNKWjyZqO+0Tky9RiPFxgWMbXr1r0QzbRGUD8Try8gkMlGnAYQAJDFQkaxf
 grN12yg1o57uB5sPr7HKxRhPwAaV3A/xXITDWOtwS4icKvY9715jr+FWe79BIO39DTyvOgREEh3
 CzUed6Mfw5uBlZdGz5aLNybSerHW6mc6yMKmP/agcVokkb3vwT9KbIGs9b8t+I72N9cqwTLvUqq
 J7yy/3lOle3/uLs+It5DVC+f33s8BV8D8g3uFtKYTf4XhH7H8RGeoznrLvTEo+OCGlpvDdKTjsZ
 Em2iF7YBoodY1K2l/LYFVwNe6oOxTWdA+2Xl9dL/LFnClgMQEIflPJFvS5PbQQPCrZpokcRiTvR
 6jbvdhmSl/k6ok=
X-Received: by 2002:a05:600c:6298:b0:49e:660a:935e with SMTP id
 5b1f17b1804b1-49e822b5626mr17709785e9.29.1789483083555; 
 Tue, 15 Sep 2026 07:38:03 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83ac3c52sm167435e9.13.2026.09.15.07.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 07:38:02 -0700 (PDT)
Message-ID: <7ec605b2-7c71-461f-97fa-ede23d9335d3@ursulin.net>
Date: Tue, 15 Sep 2026 15:38:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] tests/intel: Add gem_change_handle_race test suite
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
Cc: simona@ffwll.ch, kamil.konieczny@linux.intel.com,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 sebastian.brzezinka@intel.com
References: <cover.1788309579.git.vitaly.prosyak@amd.com>
 <a3a958aae152ba6c3c4b8ec95f99f544a612a624.1788309579.git.vitaly.prosyak@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <a3a958aae152ba6c3c4b8ec95f99f544a612a624.1788309579.git.vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 02/09/2026 02:03, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Add a GPU-agnostic GEM_CHANGE_HANDLE race-test suite covering concurrent
> handle changes, object invalidation, randomized offsets, VMAs, PPGTTs, and
> object/context contention in execbuf paths.
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
> ---
>   tests/intel/gem_change_handle_race.c | 1850 ++++++++++++++++++++++++++
>   tests/meson.build                    |    1 +
>   2 files changed, 1851 insertions(+)
>   create mode 100644 tests/intel/gem_change_handle_race.c
> 
> diff --git a/tests/intel/gem_change_handle_race.c b/tests/intel/gem_change_handle_race.c
> new file mode 100644
> index 000000000..6aff590b8
> --- /dev/null
> +++ b/tests/intel/gem_change_handle_race.c
> @@ -0,0 +1,1850 @@
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
> + * ARM compatibility: This test uses pthread_setaffinity_np() which requires
> + * _GNU_SOURCE and may behave differently on ARM due to different CPU topology.
> + * The test gracefully handles CPU pinning failures and continues execution.
> + * SUBTEST: object invalid race to random offsets
> + * Description: Validate race behavior when object handles are invalidated while
> + *              offsets are queried with randomized access patterns.
> + *
> +
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

In upstream it is there no?

> +#include "lib/amdgpu/amd_memory.h"
> +#include "igt_amd.h"
> +#define HAS_AMDGPU 1
> +#else
> +#define HAS_AMDGPU 0
> +#endif
> +
> +static inline void gem_change_handle_wait(void)
> +{
> +	sched_yield();
> +}

Feels misleading to hide sched_yield into a helper with a wait in its 
name. Given there are only two callers I would just make them call 
sched_yield() directly.

> +
> +/* Helper to check for concurrent access traces in kernel log */
> +static void require_dmesg_access(void)
> +{
> +	FILE *fp;
> +	char line[64];
> +
> +	fp = popen("dmesg | grep -m 1 . 2>/dev/null", "r");
> +	igt_require_f(fp, "dmesg is not accessible; skipping tests that validate via dmesg\n");
> +	igt_require_f(fgets(line, sizeof(line), fp),
> +		      "dmesg appears inaccessible; skipping tests that validate via dmesg\n");
> +	pclose(fp);
> +}
> +
> +static int check_kernel_traces(void)
> +{
> +	FILE *fp;
> +	char line[1024];
> +	int trace_count = 0;
> +
> +	/*
> +	 * concurrent access manifests in kernel logs as:
> +	 * - KASAN reports (if CONFIG_KASAN=y)
> +	 * - Kernel oops/warnings in drm_gem_object_release_handle
> +	 * - Stack traces with drm_gem_object_handle_put_unlocked
> +	 *
> +	 * We grep for function names that appear in the concurrent access path.
> +	 */
> +	fp = popen("dmesg | grep -c -E '(KASAN.*(drm_gem|change_handle)|"
> +		   "drm_gem_object_release_handle|"
> +		   "drm_gem_object_handle_put_unlocked|"
> +		   "drm_gem_change_handle.*RIP)' 2>/dev/null", "r");
> +	if (!fp)
> +		return 0;
> +
> +	if (fgets(line, sizeof(line), fp))
> +		trace_count = atoi(line);
> +	pclose(fp);
> +
> +	return trace_count;
> +}
> +
> +static void pin_to_cpu(int cpu)
> +{
> +	cpu_set_t cpuset;
> +	int ret;
> +
> +	CPU_ZERO(&cpuset);
> +	CPU_SET(cpu, &cpuset);
> +	ret = pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset);
> +
> +	/*
> +	 * ARM compatibility: pthread_setaffinity_np() may fail on ARM systems
> +	 * due to different CPU topology or when running in containers/VMs.
> +	 * We don't fail the test - CPU pinning is a best-effort optimization
> +	 * to increase race condition probability, not a hard requirement.
> +	 */
> +	if (ret != 0)
> +		igt_debug("Failed to pin to CPU %d (errno=%d), continuing anyway\n",
> +			  cpu, ret);
> +}
> +
> +/* Define DRM_IOCTL_GEM_CHANGE_HANDLE if not available in kernel headers */
> +#ifndef DRM_IOCTL_GEM_CHANGE_HANDLE
> +struct drm_gem_change_handle {
> +	__u32 handle;
> +	__u32 new_handle;
> +};
> +
> +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)
> +#endif

It is available in upstream so you can drop it.

> +
> +/**
> + * TEST: gem change handle race
> + * Description: Multi-threaded race condition tests for GEM_CHANGE_HANDLE
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: GEM handles
> + * Functionality: gem change handle
> + * Feature: gem
> + * Run type: FULL
> + *
> + * SUBTEST: race-close-before-lock
> + * Description: GEM_CLOSE before CHANGE_HANDLE table_lock (concurrent access)
> + *
> + * SUBTEST: race-change-vs-close
> + * Description: Validate subtest behavior and race handling for this scenario.
> + *
> + * SUBTEST: race-change-vs-prime
> + * Description: Validate subtest behavior and race handling for this scenario.
> + *
> + * SUBTEST: race-exploit-single-thread
> + * Description: Validate subtest behavior and race handling for this scenario.
> + *
> + * SUBTEST: race-close-before-lock
> + * Description: Validate subtest behavior and race handling for this scenario.
> + *
> +
> + * SUBTEST: race-change-vs-close
> + * Description: Validate subtest behavior and race handling for this scenario.
> + *
> + * SUBTEST: race-change-vs-change
> + * Description: Validate subtest behavior and race handling for this scenario.
> + *
> + * SUBTEST: race-change-vs-prime
> + * Description: Validate subtest behavior and race handling for this scenario.
> + *
> + * SUBTEST: race-aggressive-change-vs-close
> + * Description: Validate subtest behavior and race handling for this scenario.
> + *
> + * SUBTEST: race-exploit-single-thread
> + * Description: Validate subtest behavior and race handling for this scenario.
> + *
> + * SUBTEST: race-exploit-random-handles
> + * Description: Validate subtest behavior and race handling for this scenario.
> + *
> + * SUBTEST: race-close-before-lock
> + * Description: Validate subtest behavior and race handling for this scenario.
> + *
> +
> + */
> +
> +IGT_TEST_DESCRIPTION("Multi-threaded race condition tests for GEM_CHANGE_HANDLE");
> +
> +#define BO_SIZE (16 * 1024)
> +#define RACE_DURATION_SEC 1
> +
> +/* Verbose logging - set to false to reduce output */
> +static bool verbose_logging;
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
> +#if HAS_AMDGPU
> +	amdgpu_device_handle amdgpu_device;
> +#endif
> +};

This is interesting because recently Cascardo was proposing to add a 
driver agnostic buffer allocation. Look for a patch titled "lib/xe: 
Introduce dmem driver and implement Xe support". I wonder it two could 
be merged into something which works for both but I guess it can be 
follow up work as well.

Btw is the amdgpu_device needed? I don't see it used in the series 
unless I am missing something.

> +/* Thread synchronization */
> +struct thread_data {
> +	struct gpu_ctx *ctx;
> +	uint32_t handle;
> +	uint32_t alt_handle;
> +	uint32_t *race_detected;
> +	int *unexpected_errno;  /* Track what errno caused the race */
> +	bool running;
> +	pthread_barrier_t *barrier;
> +};
> +
> +struct aggressive_data {
> +	struct gpu_ctx *ctx;
> +	int go;
> +	uint32_t handle;
> +	uint32_t new_handle;
> +};
> +
> +struct single_thread_data {
> +	struct gpu_ctx *ctx;
> +	int *main_fd;
> +	pthread_mutex_t *fd_lock;
> +	bool running;
> +	bool hammer_ready;  /* Signal when BO created */
> +	uint32_t swap_count;
> +	uint32_t close_count;
> +	uint32_t *race_hits;
> +	pthread_barrier_t *barrier;
> +};
> +
> +struct random_handle_data {
> +	struct gpu_ctx *ctx;
> +	int *main_fd;
> +	pthread_mutex_t *fd_lock;
> +	bool running;
> +	bool hammer_ready;
> +	uint32_t swap_count;
> +	uint32_t close_count;
> +	uint32_t attempt_count;  /* Track total attempts */
> +	uint32_t *race_hits;
> +	pthread_barrier_t *barrier;
> +};
> +
> +struct race_shared {
> +	int fd;
> +	uint32_t old_handle;
> +	uint32_t new_handle;
> +	struct drm_gem_change_handle ch;
> +	struct drm_gem_close cl;
> +	sem_t change_sem;
> +	sem_t close_sem;
> +	int change_success;
> +	int close_success;
> +};
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
> +static const char *gpu_name(enum gpu_driver driver)
> +{
> +	switch (driver) {
> +	case DRIVER_TYPE_I915: return "Intel i915";
> +	case DRIVER_TYPE_AMDGPU: return "AMD GPU";
> +	default: return "Unknown";
> +	}
> +}
> +
> +static uint32_t gem_create_bo(struct gpu_ctx *ctx, uint64_t size)
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
> +	case DRIVER_TYPE_AMDGPU:
> +#if HAS_AMDGPU
> +		handle = igt_amd_create_bo(ctx->fd, size);
> +#else
> +		igt_require_f(0, "AMDGPU support not compiled in\n");

Isn't HAS_AMDGPU defined based on the header file presence, not the 
build configuration?

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
> +/*
> + * =======================================================================
> + * RACE CONDITION #1: CHANGE_HANDLE vs GEM_CLOSE
> + * =======================================================================
> + *
> + *
> + * Thread A (CHANGE_HANDLE)           Thread B (GEM_CLOSE)
> + * ------------------------           --------------------
> + * 1. Lookup handle 0x100
> + *    -> Find GEM object
> + *                                     2. Lookup handle 0x100
> + *                                        -> Find GEM object
> + *                                     3. Remove from handle table
> + *                                     4. Free GEM object
> + * 5. Change handle 0x100 -> 0x200
> + *    -> Operate on freed memory! !
> + *
> + * Test validates kernel properly locks to prevent concurrent access issues.
> + */
> +
> +static void *change_handle_thread(void *arg)
> +{
> +	struct thread_data *data = arg;
> +	uint32_t handle = data->handle;
> +	uint32_t new_handle = data->alt_handle;
> +	int ret;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		ret = gem_change_handle(data->ctx, handle, new_handle);
> +		if (ret == 0) {
> +			/* Successfully changed - try to change back */
> +			ret = gem_change_handle(data->ctx, new_handle, handle);

It should be possible to fold this into a single call to 
gem_change_handle if each iteration simply swaps new_handle and handle. 
That way you could have a single list of expected errnos etc.

> +			if (ret != 0 && errno != ENOENT && errno != EINVAL &&
> +			    errno != EEXIST && errno != ENOSPC) {
> +				/* Unexpected error - potential race */
> +				*data->unexpected_errno = errno;
> +				__sync_fetch_and_add(data->race_detected, 1);
> +			}
> +		} else if (errno != ENOENT && errno != EINVAL &&
> +		   errno != EEXIST && errno != ENOSPC) {
> +			/*
> +			 * Expected errors:
> +			 * - ENOENT: handle was closed
> +			 * - EINVAL: invalid handle
> +			 * - EEXIST: target handle already exists (collision detected early)
> +			 * - ENOSPC: target handle occupied (collision detected during idr_alloc)

The list of possible errors is a bit odd to me.

1)
What is the difference between invalid handle and a closed handle from 
userspace point of view?

2)
ENOSPC reads completely misleading - is the kernel side implementation 
sane? Why would userspace care to know the difference between EEXIST and 
ENOSPC?

> +			 */
> +			*data->unexpected_errno = errno;
> +			__sync_fetch_and_add(data->race_detected, 1);
> +		}
 > +		sched_yield();

Worry here is sched_yield() is documented as the suspicious thing to use 
with normal scheduling policies. How effective was it at hitting the race?

> +	}
> +
> +	return NULL;
> +}
> +
> +static void *close_recreate_thread(void *arg)
> +{
> +	struct thread_data *data = arg;
> +	uint32_t handle;
> +	uint32_t old_handle;
> +	pthread_t tid = pthread_self();
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		/* Close the handle */
> +		old_handle = data->handle;
> +		if (data->handle) {
> +			gem_close_bo(data->ctx, data->handle);

This may either succeed or fail, right?

> +			if (verbose_logging) {
> +				igt_info("[CLOSE-TID:%lu] Closed handle %u\n",
> +					 (unsigned long)tid, old_handle);
> +			}
> +		}

If old_handle is used only for debug, but data->handle is also not 
modified, you should either use the cached local more or not at all. 
Like this it is confusing to read.

> +
> +		/* Recreate BO with new handle */
> +		handle = gem_create_bo(data->ctx, BO_SIZE);

I guess here the expectation is allocated handle is equal to one of the 
two handles?

[comes back later]

Hm, or not. Rename is from handle to handle + 0x1000, so this allocation 
can result in a handle+1, so three unique handles can be in play? If it 
does result in handle+1 the renaming thread will never try to touch it 
though.

> +		data->handle = handle;
> +		if (verbose_logging) {
> +			igt_info("[CLOSE-TID:%lu] Created new BO with handle %u\n",
> +				 (unsigned long)tid, handle);
> +		}
> +
> +		sched_yield();
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * test_race_change_vs_close - Race CHANGE_HANDLE against GEM_CLOSE
> + *
> + *
> + * Spawns two threads:
> + * - Thread A: Continuously changes handle value
> + * - Thread B: Continuously closes and recreates handle
> + *
> + * Validates kernel prevents concurrent access issues through proper locking.
> + */
> +static void test_race_change_vs_close(struct gpu_ctx *ctx)
> +{
> +	pthread_t thread_change, thread_close;
> +	pthread_barrier_t barrier;
> +	struct thread_data data = {0};
> +	uint32_t race_detected = 0;
> +	int unexpected_errno = 0;
> +	uint32_t handle;
> +
> +	igt_info("Testing RACE #1: CHANGE_HANDLE vs CLOSE on %s\n",
> +		 gpu_name(ctx->driver));
> +	igt_info("  Duration: %d seconds\n", RACE_DURATION_SEC);
> +	igt_info("  Goal: Detect concurrent access issues scenarios\n");

The logs feel atypical for an IGT test and I suggest to drop them.

> +
> +	handle = gem_create_bo(ctx, BO_SIZE);
> +	igt_assert(handle != 0);
> +
> +	data.ctx = ctx;
> +	data.handle = handle;
> +	data.alt_handle = handle + 0x1000;
> +	data.race_detected = &race_detected;
> +	data.unexpected_errno = &unexpected_errno;

Do these two need to be pointers or they could be embdedded in data just 
as well?

> +	__atomic_store_n(&data.running, true, __ATOMIC_RELEASE);
> +
> +	pthread_barrier_init(&barrier, NULL, 2);
> +	data.barrier = &barrier;
> +
> +	/* Start both threads simultaneously */
> +	igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_thread, &data), 0);
> +	igt_assert_eq(pthread_create(&thread_close, NULL, close_recreate_thread, &data), 0);
> +
> +	/* Let them race */
> +	sleep(RACE_DURATION_SEC);
> +
> +	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> +	pthread_join(thread_change, NULL);
> +	pthread_join(thread_close, NULL);
> +
> +	pthread_barrier_destroy(&barrier);
> +
> +	/* Clean up final handle if exists */
> +	if (data.handle)
> +		gem_close_bo(ctx, data.handle);

100% only one handle to clean up?

> +
> +	igt_info("  Race test completed. Suspicious conditions: %u\n", race_detected);
> +	if (race_detected > 0) {
> +		igt_info("  ***  RACE DETECTED: Unexpected errno = %d (%s)\n",
> +			 unexpected_errno, strerror(unexpected_errno));
> +		igt_info("  This indicates the kernel may not be properly handling concurrent\n");
> +		igt_info("  CHANGE_HANDLE operations. Kernel should serialize these with\n");
> +		igt_info("  proper locking to prevent corruption and concurrent access issues.\n");
> +	}
> +	igt_assert_f(race_detected == 0,
> +		     "Race condition detected! errno=%d (%s). "
> +		     "Kernel locking may be insufficient.\n",
> +		     unexpected_errno, strerror(unexpected_errno));

IMO the last assert has enough logging and I would just remove the 
preceding igt_info lines since they look redundant.

> +}
> +
> +/*
> + * =======================================================================
> + * RACE CONDITION #2: CHANGE_HANDLE vs CHANGE_HANDLE
> + * =======================================================================
> + *
> + *
> + * "I'd just spawn two threads, that constantly try to change the handle
> + *  between just 2 back and forth, to maximize the amount of conflicts"
> + *
> + * Thread A: change_handle(H, H+1)
> + * Thread B: change_handle(H+1, H)
> + * ... continuously swapping ...
> + *
> + * Tests handle table corruption, reference counting, lost handles.
> + */
> +
> +static void *change_handle_thread_a(void *arg)
> +{
> +	struct thread_data *data = arg;
> +	int ret;
> +	pthread_t tid = pthread_self();
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		ret = gem_change_handle(data->ctx, data->handle, data->alt_handle);
> +		if (verbose_logging) {
> +			if (ret == 0) {
> +				igt_info("[THREAD-A-TID:%lu] %u -> %u: SUCCESS\n",
> +					 (unsigned long)tid, data->handle, data->alt_handle);
> +			} else {
> +				igt_info("[THREAD-A-TID:%lu] %u -> %u: FAILED - %s (errno=%d)\n",
> +					 (unsigned long)tid, data->handle, data->alt_handle,
> +					 strerror(errno), errno);
> +			}
> +		}
> +
> +		if (ret != 0 && errno != ENOENT && errno != EINVAL &&
> +		    errno != EEXIST && errno != ENOSPC) {
> +			/* Unexpected error - potential race */
> +			igt_info("[THREAD-A-TID:%lu] *** UNEXPECTED ERROR: %s (errno=%d) ***\n",
> +				 (unsigned long)tid, strerror(errno), errno);
> +			*data->unexpected_errno = errno;
> +			__sync_fetch_and_add(data->race_detected, 1);
> +		}
> +		sched_yield();
> +	}
> +
> +	return NULL;
> +}
> +
> +static void *change_handle_thread_b(void *arg)
> +{
> +	struct thread_data *data = arg;
> +	int ret;
> +	pthread_t tid = pthread_self();
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		ret = gem_change_handle(data->ctx, data->alt_handle, data->handle);
> +		if (verbose_logging) {
> +			if (ret == 0) {
> +				igt_info("[THREAD-B-TID:%lu] %u -> %u: SUCCESS\n",
> +					 (unsigned long)tid, data->alt_handle, data->handle);
> +			} else {
> +				igt_info("[THREAD-B-TID:%lu] %u -> %u: FAILED - %s (errno=%d)\n",
> +					 (unsigned long)tid, data->alt_handle, data->handle,
> +					 strerror(errno), errno);
> +			}
> +		}
> +
> +		if (ret != 0 && errno != ENOENT && errno != EINVAL &&
> +		    errno != EEXIST && errno != ENOSPC) {
> +			/* Unexpected error */
> +			igt_info("[THREAD-B-TID:%lu] *** UNEXPECTED ERROR: %s (errno=%d) ***\n",
> +				 (unsigned long)tid, strerror(errno), errno);
> +			*data->unexpected_errno = errno;
> +			__sync_fetch_and_add(data->race_detected, 1);
> +		}
> +		sched_yield();
> +	}
> +
> +	return NULL;
> +}

Aren't change_handle_thread_a and change_handle_thread_b identical? 
Pretty sure you could achieve the same coverage by using swap() in a 
loop and a single function.

> +
> +/**
> + * test_race_change_vs_change - Concurrent CHANGE_HANDLE operations
> + *
> + *
> + * Implements email thread test strategy:
> + * "spawn two threads that constantly try to change the handle between
> + *  just 2 back and forth, to maximize the amount of conflicts"
> + *
> + * Thread A: change(H, H+1)
> + * Thread B: change(H+1, H)
> + *
> + * Validates kernel prevents handle table corruption.
> + */
> +static void test_race_change_vs_change(struct gpu_ctx *ctx)
> +{
> +	pthread_t thread_a, thread_b;
> +	pthread_barrier_t barrier;
> +	struct thread_data data = {0};
> +	uint32_t race_detected = 0;
> +	int unexpected_errno = 0;
> +	uint32_t handle;
> +
> +	igt_info("Testing RACE #2: CHANGE_HANDLE vs CHANGE_HANDLE on %s\n",
> +		 gpu_name(ctx->driver));
> +	igt_info("  Duration: %d seconds\n", RACE_DURATION_SEC);
> +	igt_info("  Strategy: Two threads swapping handle H <-> H+1\n");
> +	igt_info("  Goal: Detect handle corruption and lost handles\n");
> +
> +	handle = gem_create_bo(ctx, BO_SIZE);
> +	igt_assert(handle != 0);
> +
> +	data.ctx = ctx;
> +	data.handle = handle;
> +	data.alt_handle = handle + 1;
> +	data.race_detected = &race_detected;
> +	data.unexpected_errno = &unexpected_errno;
> +	__atomic_store_n(&data.running, true, __ATOMIC_RELEASE);
> +
> +	pthread_barrier_init(&barrier, NULL, 2);
> +	data.barrier = &barrier;
> +
> +	/* Start both threads simultaneously */
> +	igt_assert_eq(pthread_create(&thread_a, NULL, change_handle_thread_a, &data), 0);
> +	igt_assert_eq(pthread_create(&thread_b, NULL, change_handle_thread_b, &data), 0);
> +
> +	/* Let them race */
> +	sleep(RACE_DURATION_SEC);
> +
> +	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> +	pthread_join(thread_a, NULL);
> +	pthread_join(thread_b, NULL);
> +
> +	pthread_barrier_destroy(&barrier);
> +
> +	/* Try to close both possible handles */
> +	gem_close_bo(ctx, handle);
> +	gem_close_bo(ctx, handle + 1);
> +
> +	igt_info("  Race test completed. Suspicious conditions: %u\n", race_detected);
> +	if (race_detected > 0) {
> +		igt_info("  ***  RACE DETECTED: Unexpected errno = %d (%s)\n",
> +			 unexpected_errno, strerror(unexpected_errno));
> +		igt_info("  This indicates the kernel may not be properly handling concurrent\n");
> +		igt_info("  CHANGE_HANDLE operations. Kernel should serialize these with\n");
> +		igt_info("  proper locking to prevent corruption and concurrent access issues.\n");
> +	}
> +	igt_assert_f(race_detected == 0,
> +		     "Race condition detected! errno=%d (%s). "
> +		     "Kernel locking may be insufficient.\n",
> +		     unexpected_errno, strerror(unexpected_errno));
> +}
> +
> +/*
> + * =======================================================================
> + * RACE CONDITION #3: CHANGE_HANDLE vs Prime Ioctls
> + * =======================================================================
> + *
> + *
> + * "maybe: 1. create bo 2. handle2fd, check that fd2handle gives us
> + *  the same handle back 3. change_handle 4. check that fd2handle
> + *  gives us the new handle back"
> + *
> + * Tests stale references, reference count corruption.
> + */
> +
> +/**
> + * change_handle_prime_thread - Continuously swap handle for prime test
> + *
> + * Like change_handle_thread_a/b but swaps back and forth between
> + * the two handle values to continuously exercise the race.
> + */
> +static void *change_handle_prime_thread(void *arg)
> +{
> +	struct thread_data *data = arg;
> +	uint32_t handle_a = data->handle;
> +	uint32_t handle_b = data->alt_handle;
> +	bool swap_direction = true;
> +	int ret;
> +	pthread_t tid = pthread_self();
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		if (swap_direction) {
> +			/* Try to change from handle_a to handle_b */
> +			ret = gem_change_handle(data->ctx, handle_a, handle_b);
> +			if (verbose_logging) {
> +				if (ret == 0) {
> +					igt_info("[PRIME-CHANGE-TID:%lu] %u -> %u: SUCCESS\n",
> +						 (unsigned long)tid, handle_a, handle_b);
> +				} else {
> +					igt_info("[PRIME-CHANGE-TID:%lu] %u -> %u: FAILED - %s (errno=%d)\n",
> +						 (unsigned long)tid, handle_a, handle_b,
> +					 strerror(errno), errno);
> +				}
> +			}
> +		} else {
> +			/* Try to change from handle_b to handle_a */
> +			ret = gem_change_handle(data->ctx, handle_b, handle_a);
> +			if (verbose_logging) {
> +				if (ret == 0) {
> +					igt_info("[PRIME-CHANGE-TID:%lu] %u -> %u: SUCCESS\n",
> +						 (unsigned long)tid, handle_b, handle_a);
> +				} else {
> +					igt_info("[PRIME-CHANGE-TID:%lu] %u -> %u: FAILED - %s (errno=%d)\n",
> +						 (unsigned long)tid, handle_b, handle_a,
> +					 strerror(errno), errno);
> +				}
> +			}
> +		}
> +
> +		/* Flip direction for next iteration to keep swapping */
> +		if (ret == 0)
> +			swap_direction = !swap_direction;

swap(handle_a, handle_b) and you can drop swap_direction and consolidate 
to a single gem_change_handle. Plus, probably it is the same thread body 
as for the change_handle_thread_a/b.

> +		/* All errors are acceptable during race - kernel will serialize */
> +
> +		sched_yield();
> +	}
> +
> +	return NULL;
> +}
> +
> +static void *prime_thread(void *arg)
> +{
> +	struct thread_data *data = arg;
> +	struct drm_prime_handle prime_args;
> +	uint32_t retrieved_handle;
> +	uint32_t handle_a = data->handle;
> +	uint32_t handle_b = data->alt_handle;
> +	int dmabuf_fd;
> +	int ret;
> +	pthread_t tid = pthread_self();
> +	uint32_t tried_handle;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		/*
> +		 * Try handle_a first. If it fails (handle was changed),
> +		 * try handle_b. One of them should work.
> +		 */
> +		prime_args.handle = handle_a;
> +		prime_args.flags = DRM_CLOEXEC | DRM_RDWR;
> +		tried_handle = handle_a;
> +		ret = igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime_args);
> +		if (verbose_logging) {
> +			if (ret == 0) {
> +				igt_info("[PRIME-TID:%lu] HANDLE_TO_FD(handle=%u): SUCCESS (fd=%d)\n",
> +					 (unsigned long)tid, tried_handle, prime_args.fd);
> +			} else {
> +				igt_info("[PRIME-TID:%lu] HANDLE_TO_FD(handle=%u): FAILED - %s (errno=%d)\n",
> +					 (unsigned long)tid, tried_handle,
> +					 strerror(errno), errno);
> +			}

It may be worth adding new helpers such as verbose_info and hide "if 
(verbose_logging)" in them, and tid=pthread_self(), and fold the "if 
(ret == 0) into one log. All in all end with something along the line of:

   ret = igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, 
&prime_args);
   verbose_info("...", pthread_self(), ret, ...other args for the wanted 
format...)

I am suggesting these things because the less repeated boiler plate 
there is the easier is to review the test logic.

I'll skip this sub test for now in case we agree a more radable version 
would be coming.

> +		}
> +		if (ret != 0) {
> +			/* handle_a failed, try handle_b */
> +			prime_args.handle = handle_b;
> +			tried_handle = handle_b;
> +			ret = igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime_args);
> +			if (verbose_logging) {
> +				if (ret == 0) {
> +					igt_info("[PRIME-TID:%lu] HANDLE_TO_FD(handle=%u): SUCCESS (fd=%d)\n",
> +						 (unsigned long)tid, tried_handle, prime_args.fd);
> +				} else {
> +					igt_info("[PRIME-TID:%lu] HANDLE_TO_FD(handle=%u): FAILED - %s (errno=%d)\n",
> +						 (unsigned long)tid, tried_handle,
> +					 strerror(errno), errno);
> +				}
> +			}
> +		}
> +
> +		if (ret == 0) {
> +			dmabuf_fd = prime_args.fd;
> +
> +			/* Convert back to handle */
> +			prime_args.fd = dmabuf_fd;
> +			prime_args.flags = 0;
> +			ret = igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &prime_args);
> +			if (verbose_logging) {
> +				if (ret == 0) {
> +					igt_info("[PRIME-TID:%lu] FD_TO_HANDLE(fd=%d): SUCCESS (handle=%u)\n",
> +						 (unsigned long)tid, dmabuf_fd, prime_args.handle);
> +				} else {
> +					igt_info("[PRIME-TID:%lu] FD_TO_HANDLE(fd=%d): FAILED - %s (errno=%d)\n",
> +						 (unsigned long)tid, dmabuf_fd,
> +					 strerror(errno), errno);
> +				}
> +			}
> +			if (ret == 0) {
> +				retrieved_handle = prime_args.handle;
> +
> +				/*
> +				 * Handle should be one of our two known handles.
> +				 * If it's neither, Prime reference table is corrupted.
> +				 */
> +				if (retrieved_handle != handle_a &&
> +				    retrieved_handle != handle_b) {
> +					/* Handle corruption detected */
> +					__sync_fetch_and_add(data->race_detected, 1);
> +				}
> +
> +				/* Close retrieved handle */
> +				gem_close_bo(data->ctx, retrieved_handle);
> +			}
> +			close(dmabuf_fd);
> +		}
> +		/* All errors acceptable during race */
> +
> +		usleep(100); /* Prime operations are slower */
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * test_race_change_vs_prime - Race CHANGE_HANDLE against Prime ioctls
> + *
> + *
> + * Implements email thread test:
> + * "create bo, handle2fd, check fd2handle returns same, change_handle,
> + *  check fd2handle returns new handle"
> + *
> + * Thread A: Continuously changes handle
> + * Thread B: Continuously does fd2handle and validates result
> + *
> + * Validates kernel updates Prime references correctly.
> + */
> +static void test_race_change_vs_prime(struct gpu_ctx *ctx)
> +{
> +	pthread_t thread_change, thread_prime;
> +	pthread_barrier_t barrier;
> +	struct thread_data data = {0};
> +	uint32_t race_detected = 0;
> +	int unexpected_errno = 0;
> +	uint32_t handle;
> +	struct drm_prime_handle prime_args;
> +	int dmabuf_fd, ret;
> +	uint32_t retrieved_handle;
> +
> +	igt_info("Testing RACE #3: CHANGE_HANDLE vs Prime on %s\n",
> +		 gpu_name(ctx->driver));
> +	igt_info("  Duration: %d seconds\n", RACE_DURATION_SEC);
> +	igt_info("  Goal: Detect stale references and refcount corruption\n");
> +
> +	handle = gem_create_bo(ctx, BO_SIZE);
> +	igt_assert(handle != 0);
> +
> +	/* Initial prime export - verify it works */
> +	prime_args.handle = handle;
> +	prime_args.flags = DRM_CLOEXEC | DRM_RDWR;
> +	ret = igt_ioctl(ctx->fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime_args);
> +	igt_assert_eq(ret, 0);
> +	dmabuf_fd = prime_args.fd;
> +
> +	prime_args.fd = dmabuf_fd;
> +	prime_args.flags = 0;
> +	ret = igt_ioctl(ctx->fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &prime_args);
> +	igt_assert_eq(ret, 0);
> +	retrieved_handle = prime_args.handle;
> +	igt_assert_eq(retrieved_handle, handle);
> +
> +	gem_close_bo(ctx, retrieved_handle);
> +	close(dmabuf_fd);
> +
> +	/* Now test concurrent change + prime operations */
> +	data.ctx = ctx;
> +	data.handle = handle;
> +	data.alt_handle = handle + 1;
> +	data.race_detected = &race_detected;
> +	data.unexpected_errno = &unexpected_errno;
> +	__atomic_store_n(&data.running, true, __ATOMIC_RELEASE);
> +
> +	pthread_barrier_init(&barrier, NULL, 2);
> +	data.barrier = &barrier;
> +
> +	igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_prime_thread, &data), 0);
> +	igt_assert_eq(pthread_create(&thread_prime, NULL, prime_thread, &data), 0);
> +
> +	/* Let them race */
> +	sleep(RACE_DURATION_SEC);
> +
> +	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> +	pthread_join(thread_change, NULL);
> +	pthread_join(thread_prime, NULL);
> +
> +	pthread_barrier_destroy(&barrier);
> +
> +	/* Cleanup */
> +	gem_close_bo(ctx, handle);
> +	gem_close_bo(ctx, handle + 1);
> +
> +	igt_info("  Race test completed. Handle corruption: %u\n", race_detected);
> +	igt_assert_eq(race_detected, 0);
> +}
> +
> +/*
> + * Aggressive race test - follows proven concurrent access reproducer pattern.
> + * Thread A: CHANGE_HANDLE(h->nh), Thread B: CLOSE(h)
> + * CPU pinning for maximum race potential.
> + */
> +
> +static void *aggressive_change_thread(void *arg)
> +{
> +	struct aggressive_data *data = arg;
> +	pthread_t tid = pthread_self();
> +	int ret;
> +
> +	pin_to_cpu(0);
> +
> +	while (!__atomic_load_n(&data->go, __ATOMIC_ACQUIRE))
> +		gem_change_handle_wait();
> +
> +	ret = gem_change_handle(data->ctx, data->handle, data->new_handle);
> +
> +	if (verbose_logging) {
> +		if (ret == 0) {
> +			igt_info("[AGG-CHANGE-TID:%lu] %u -> %u: SUCCESS\n",
> +				 (unsigned long)tid, data->handle, data->new_handle);
> +		} else {
> +			igt_info("[AGG-CHANGE-TID:%lu] %u -> %u: FAILED - %s (errno=%d)\n",
> +				 (unsigned long)tid, data->handle, data->new_handle,
> +				 strerror(errno), errno);
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static void *aggressive_close_thread(void *arg)
> +{
> +	struct aggressive_data *data = arg;
> +	pthread_t tid = pthread_self();
> +
> +	pin_to_cpu(1);
> +
> +	while (!__atomic_load_n(&data->go, __ATOMIC_ACQUIRE))
> +		gem_change_handle_wait();
> +
> +	gem_close_bo(data->ctx, data->handle);
> +
> +	if (verbose_logging) {
> +		igt_info("[AGG-CLOSE-TID:%lu] Closed handle %u\n",
> +			 (unsigned long)tid, data->handle);

Closed or failed to close right?

> +	}
> +
> +	return NULL;
> +}
> +
> +static void test_race_aggressive(struct gpu_ctx *ctx)
> +{
> +	struct aggressive_data data = {};
> +	pthread_t thread_change, thread_close;
> +	int iterations = 5000;
> +	int race_wins = 0;
> +	int kasan_before, kasan_after;
> +	int i;
> +
> +	igt_info("Testing AGGRESSIVE RACE: CHANGE_HANDLE vs CLOSE on %s\n",
> +		 gpu_name(ctx->driver));
> +	igt_info("  Pattern: concurrent access reproducer from DRM mailing list\n");
> +	igt_info("  Iterations: %d\n", iterations);
> +	igt_info("  CPU pinning: Change->CPU0, Close->CPU1\n");
> +	igt_info("\n");
> +	igt_info("  Expected results:\n");
> +	igt_info("    Unpatched kernel: Race wins ~50-60%%, KASAN traces in dmesg\n");
> +	igt_info("    Patched kernel:   0 race wins (mutex serializes ops)\n");
> +	igt_info("\n");
> +	igt_info("  Note: KASAN traces appear in kernel log (dmesg), not test output\n");
> +	igt_info("        Kernel must have CONFIG_KASAN=y to see detailed concurrent access reports\n");
> +	igt_info("\n");

This is very worthwhile info but I'd put it in a comment, not log.

Is it worth running this test when KASAN is not enabled?

What makes this more "aggressive" than test_race_change_vs_close? CPU 
pinning? The first one does not catch it so reliably?

> +
> +	data.ctx = ctx;
> +
> +	/* Clear/mark kernel log before test */
> +	kasan_before = check_kernel_traces();
> +
> +	for (i = 0; i < iterations; i++) {
> +		uint32_t h = gem_create_bo(ctx, BO_SIZE);
> +
> +		data.handle = h;
> +		data.new_handle = 0x4000 + (i & 0x3FFF);
> +		__atomic_store_n(&data.go, 0, __ATOMIC_RELEASE);
> +
> +		__sync_synchronize();

What are the memory barriers for?

> +
> +		pthread_create(&thread_change, NULL, aggressive_change_thread, &data);
> +		pthread_create(&thread_close, NULL, aggressive_close_thread, &data);
> +
> +		__sync_synchronize();
> +		__atomic_store_n(&data.go, 1, __ATOMIC_RELEASE);
> +
> +		pthread_join(thread_change, NULL);

On dual CPU this could be penalizing the thread which happens to share 
the CPU with the main thread, becuase the other one is likely to start 
first. Have you tried? If I am right it could be worth adding 
igt_require(num_cpus > 2) and pinning the main thread to a different one.

> +		pthread_join(thread_close, NULL);
> +
> +		/*
> +		 * concurrent access Detection Strategy:
> +		 *
> +		 * The concurrent access happens when CHANGE_HANDLE races with CLOSE.
> +		 * Handle state checking doesn't work because:
> +		 * - With mutex: CHANGE can win cleanly (not a race)
> +		 * - Without mutex: concurrent access happens but handles appear normal
> +		 *
> +		 * ONLY reliable detection: Monitor kernel log for concurrent access traces.
> +		 * concurrent access shows up in drm_gem_object_release_handle path.
> +		 */
> +
> +		/* Clean up handles (one or both may fail) */
> +		drmIoctl(ctx->fd, DRM_IOCTL_GEM_CLOSE,
> +			 &(struct drm_gem_close){ .handle = data.new_handle });
> +		drmIoctl(ctx->fd, DRM_IOCTL_GEM_CLOSE,
> +			 &(struct drm_gem_close){ .handle = h });
> +
> +		if ((i + 1) % 1000 == 0) {
> +			/* Check for KASAN traces periodically */
> +			int kasan_now = check_kernel_traces();
> +			int kasan_new = kasan_now - kasan_before;
> +
> +			igt_info("  Progress: %d/%d, KASAN traces: %d\n",
> +				 i + 1, iterations, kasan_new);
> +
> +			if (kasan_new > 0 && race_wins == 0)
> +				race_wins = kasan_new;
> +		}
> +	}
> +
> +	/* Final KASAN check */
> +	kasan_after = check_kernel_traces();
> +	race_wins = kasan_after - kasan_before;
> +
> +	igt_info("\nAggressive race test completed:\n");
> +	igt_info("  Iterations: %d\n", iterations);
> +	igt_info("  KASAN concurrent access traces detected: %d\n", race_wins);
> +
> +	if (race_wins > 0) {
> +		igt_info("\n*** RACE CONDITION DETECTED (concurrent access) ***\n");
> +		igt_info("  Kernel is UNPATCHED (missing handle_map_lock mutex)\n");
> +		igt_info("  KASAN detected %d concurrent access issues events\n", race_wins);
> +		igt_info("\n");
> +		igt_info("  View concurrent access traces:\n");
> +		igt_info("    dmesg | grep -A40 -E '(drm_gem_object_release_handle|drm_gem_object_handle_put_unlocked)'\n");
> +		igt_info("\n");
> +		igt_info("  The concurrent access happens when CHANGE_HANDLE tries to access\n");
> +		igt_info("  an object that was freed by concurrent CLOSE.\n");
> +		igt_info("\n");
> +		igt_info("  Fix: Apply V5 patch (add handle_map_lock mutex)\n");
> +
> +		/* Fail the test if concurrent access detected */
> +		igt_assert_eq(race_wins, 0);
> +	} else {
> +		igt_info("\n=== NO concurrent access DETECTED ===\n");
> +		igt_info("  Kernel appears PATCHED (handle_map_lock prevents race)\n");
> +		igt_info("  No KASAN traces found after %d iterations\n", iterations);
> +		igt_info("  This is the expected behavior with V5 patch applied\n");
> +		igt_info("\n");
> +		igt_info("  Note: concurrent access detection via kernel log monitoring\n");
> +		igt_info("        Works with KASAN or kernel oops/warnings\n");
> +	}
> +}
> +
> +/*
> + * =======================================================================
> + * SINGLE-THREADED TEST - Focused race exploitation
> + * =======================================================================
> + */
> +
> +/*
> + * =======================================================================
> + * SINGLE-THREADED TEST - Fixed timing
> + * =======================================================================
> + */

The single threaded wording really confuses me because the test actually 
creates three threads. :)

> +
> +static void *single_thread_hammer(void *arg)
> +{
> +	struct single_thread_data *data = arg;
> +	uint32_t handle, alt_handle;
> +	int local_fd;
> +	int ret;
> +	bool is_base = true;
> +	unsigned long swaps = 0;
> +	struct gpu_ctx local_ctx;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	/* Create BO BEFORE closer starts */
> +	pthread_mutex_lock(data->fd_lock);
> +	local_fd = *data->main_fd;
> +	pthread_mutex_unlock(data->fd_lock);
> +
> +	local_ctx = *data->ctx;
> +	local_ctx.fd = local_fd;

Isn't this the same as if the locked section simply copied data->ctx 
into local_ctx?

> +
> +	handle = gem_create_bo(&local_ctx, 4096);
> +	if (handle == 0) {
> +		igt_info("[HAMMER] Failed to create BO\n");
> +		/* Signal even on failure */
> +		__atomic_store_n(&data->hammer_ready, true, __ATOMIC_RELEASE);
> +		return NULL;
> +	}
> +
> +	alt_handle = handle + 1;
> +	igt_info("[HAMMER] Created handle %u, will swap with %u\n", handle, alt_handle);
> +
> +	/* Signal that BO is ready - closer can start now */
> +	__atomic_store_n(&data->hammer_ready, true, __ATOMIC_RELEASE);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		/* Rapid swap - no FD checks, just swap */
> +		ret = gem_change_handle(&local_ctx,
> +					is_base ? handle : alt_handle,
> +					is_base ? alt_handle : handle);
> +		if (ret == 0) {
> +			swaps++;
> +			__sync_fetch_and_add(&data->swap_count, 1);
> +			is_base = !is_base;
> +
> +			if (swaps % 10000 == 0)
> +				igt_info("[HAMMER] %lu swaps\n", swaps);
> +		}
> +		/* No error handling - just keep hammering */

Won't closer immediately close the fd hammer is using to swap - or is 
that the very point? But in that case why it is worth to keep trying 
after the first failure?

> +	}
> +
> +	igt_info("[HAMMER] Final: %lu swaps\n", swaps);
> +	return NULL;
> +}
> +
> +static void *single_thread_closer(void *arg)
> +{
> +	struct single_thread_data *data = arg;
> +	unsigned long closes = 0;
> +	int new_fd;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	/* Wait for hammer to create BO first */
> +	while (!__atomic_load_n(&data->hammer_ready, __ATOMIC_ACQUIRE))
> +		usleep(100);

Not yield this time, okay.

> +
> +	igt_info("[CLOSER] Hammer ready, starting closes\n");
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		/* Close FD to trigger idr_for_each() */
> +		pthread_mutex_lock(data->fd_lock);
> +		if (*data->main_fd >= 0) {
> +			close(*data->main_fd);
> +			*data->main_fd = -1;
> +			closes++;
> +			__sync_fetch_and_add(&data->close_count, 1);
> +		}
> +		pthread_mutex_unlock(data->fd_lock);
> +
> +		/* Small delay - this is the window for hitting the race */
> +		usleep(1000);
> +
> +		/* Reopen */
> +		new_fd = drm_open_driver_render(DRIVER_ANY);
> +		if (new_fd >= 0) {
> +			pthread_mutex_lock(data->fd_lock);
> +			*data->main_fd = new_fd;
> +			pthread_mutex_unlock(data->fd_lock);
> +		}
> +
> +		/* Check KASAN */
> +		if (closes % 100 == 0) {
> +			int kasan_now = check_kernel_traces();
> +
> +			if (kasan_now > 0) {
> +				__sync_fetch_and_add(data->race_hits, 1);
> +				igt_info("[CLOSER] *** KASAN DETECTED: %d traces ***\n", kasan_now);
> +			}
> +		}
> +	}
> +
> +	igt_info("[CLOSER] %lu closes\n", closes);
> +	return NULL;
> +}
> +
> +static void *single_thread_monitor(void *arg)
> +{
> +	struct single_thread_data *data = arg;
> +	int kasan_last = 0;
> +	int kasan_now;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		sleep(5);

The three threads appear to be run for 3 seconds from the controlling 
thread so this sleeping for five means it only checks once?

Also, the closer  thread itself periodically checks dmesg so is this one 
needed to begin with?

> +
> +		kasan_now = check_kernel_traces();
> +		if (kasan_now > kasan_last) {
> +			igt_info("[MONITOR] +%d KASAN traces (total: %d)\n",
> +				 kasan_now - kasan_last, kasan_now);
> +			kasan_last = kasan_now;
> +		}
> +
> +		igt_info("[STATS] Swaps:%u Closes:%u KASAN:%u\n",
> +			 __atomic_load_n(&data->swap_count, __ATOMIC_RELAXED),
> +			__atomic_load_n(&data->close_count, __ATOMIC_RELAXED),
> +			*data->race_hits);
> +	}
> +
> +	return NULL;
> +}
> +
> +static void test_race_single_thread(struct gpu_ctx *ctx)
> +{
> +	pthread_t hammer, closer, monitor;
> +	pthread_barrier_t barrier;
> +	pthread_mutex_t fd_lock = PTHREAD_MUTEX_INITIALIZER;
> +	struct single_thread_data data = {0};
> +	uint32_t race_hits = 0;
> +	int main_fd;
> +	int kasan_before, kasan_after;
> +	int race_detected;
> +
> +	igt_info("===========================================================\n");
> +	igt_info("  SINGLE-THREADED FOCUSED TEST (Fixed Timing)\n");
> +	igt_info("===========================================================\n");
> +	igt_info("  Duration: 3 seconds\n");
> +	igt_info("  Threads: 1 hammer + 1 closer + 1 monitor\n");
> +	igt_info("  Strategy:\n");
> +	igt_info("    1. Hammer creates ONE BO\n");
> +	igt_info("    2. Hammer swaps H <-> H+1 rapidly in tight loop\n");
> +	igt_info("    3. Closer periodically close(fd) -> idr_for_each()\n");
> +	igt_info("  Race window: idr_alloc(new) ... idr_replace(old, NULL)\n");
> +	igt_info("    Between these two, BOTH handles point to same object\n");
> +	igt_info("    If idr_for_each() runs here -> double release -> concurrent access\n");
> +	igt_info("===========================================================\n\n");
> +
> +	kasan_before = check_kernel_traces();
> +	igt_info("KASAN traces before test: %d\n\n", kasan_before);
> +
> +	main_fd = drm_open_driver_render(DRIVER_ANY);
> +	igt_require(main_fd >= 0);
> +
> +	data.ctx = ctx;
> +	data.main_fd = &main_fd;
> +	data.fd_lock = &fd_lock;
> +	__atomic_store_n(&data.running, true, __ATOMIC_RELEASE);
> +	__atomic_store_n(&data.hammer_ready, false, __ATOMIC_RELEASE);
> +	data.race_hits = &race_hits;
> +
> +	pthread_barrier_init(&barrier, NULL, 3);
> +	data.barrier = &barrier;
> +
> +	igt_info("Starting threads...\n");
> +
> +	pthread_create(&hammer, NULL, single_thread_hammer, &data);
> +	pthread_create(&closer, NULL, single_thread_closer, &data);
> +	pthread_create(&monitor, NULL, single_thread_monitor, &data);
> +
> +	igt_info("Racing for 3 seconds...\n\n");
> +	sleep(3);
> +
> +	igt_info("\nStopping threads...\n");
> +	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> +
> +	pthread_join(hammer, NULL);
> +	pthread_join(closer, NULL);
> +	pthread_join(monitor, NULL);
> +
> +	pthread_barrier_destroy(&barrier);
> +	pthread_mutex_destroy(&fd_lock);
> +
> +	if (main_fd >= 0)
> +		close(main_fd);
> +
> +	kasan_after = check_kernel_traces();
> +	race_detected = kasan_after - kasan_before;
> +
> +	igt_info("\n===========================================================\n");
> +	igt_info("  SINGLE-THREADED TEST RESULTS\n");
> +	igt_info("===========================================================\n");
> +	igt_info("  Total swaps: %u\n", __atomic_load_n(&data.swap_count, __ATOMIC_RELAXED));
> +	igt_info("  Total closes: %u\n", __atomic_load_n(&data.close_count, __ATOMIC_RELAXED));
> +	igt_info("  KASAN concurrent access traces: %d\n", race_detected);
> +	igt_info("===========================================================\n\n");
> +
> +	if (race_detected > 0) {
> +		igt_info("*** SUCCESS: RACE CONDITION TRIGGERED! ***\n\n");
> +		igt_info("concurrent access detected with %d KASAN traces!\n\n", race_detected);
> +		igt_info("This confirms the vulnerability in the wrong operation order:\n\n");
> +		igt_info("  Race Timeline:\n");
> +		igt_info("  --------------\n");
> +		igt_info("  T1: Hammer thread calls change_handle(H, H+1)\n");
> +		igt_info("      -> enters drm_gem_change_handle_ioctl()\n");
> +		igt_info("      -> spin_lock(&table_lock)\n");
> +		igt_info("      -> idr_alloc(H+1, obj)\n");
> +		igt_info("         [RACE WINDOW OPENS - Both H and H+1 point to obj]\n\n");
> +		igt_info("  T2: Closer thread calls close(fd)\n");
> +		igt_info("      -> drm_gem_release()\n");
> +		igt_info("      -> idr_for_each(&object_idr, release_handle, ...)\n");
> +		igt_info("         Iteration 1: handle H -> release(obj)\n");
> +		igt_info("         Iteration 2: handle H+1 -> release(obj) AGAIN\n");
> +		igt_info("      -> DOUBLE RELEASE -> USE-AFTER-FREE!\n\n");
> +		igt_info("  T3: Hammer thread continues (if not crashed):\n");
> +		igt_info("      -> idr_replace(H, NULL)\n");
> +		igt_info("         [Too late - obj already freed]\n\n");
> +		igt_info("View KASAN traces:\n");
> +		igt_info("  sudo dmesg | grep -B10 -A40 'concurrent access issues'\n\n");
> +		igt_info("The fix (correct order):\n");
> +		igt_info("  1. idr_replace(H, NULL)  FIRST  <- Make H invisible\n");
> +		igt_info("  2. idr_alloc(H+1, obj)   SECOND <- Create new handle\n");
> +		igt_info("  Result: At no point do both handles exist simultaneously\n");
> +		igt_info("          idr_for_each() can never see both -> no double release\n\n");
> +	} else {
> +		igt_info("=== NO concurrent access DETECTED ===\n\n");
> +		if (data.swap_count == 0) {
> +			igt_info("ERROR: No successful handle swaps!\n");
> +			igt_info("The change_handle ioctl may not be working properly.\n\n");
> +		} else if (__atomic_load_n(&data.swap_count, __ATOMIC_RELAXED) < 100) {
> +			igt_info("WARNING: Very few swaps (%u). May not have hit race window.\n\n",
> +				 __atomic_load_n(&data.swap_count, __ATOMIC_RELAXED));
> +		} else {
> +			igt_info("Completed %u swaps and %u closes without detecting concurrent access.\n\n",
> +				 __atomic_load_n(&data.swap_count, __ATOMIC_RELAXED),
> +				 __atomic_load_n(&data.close_count, __ATOMIC_RELAXED));
> +			igt_info("Possible reasons:\n");
> +			igt_info("  1. Correct patch is applied (NULL old BEFORE alloc new)\n");
> +			igt_info("  2. Race window is extremely small (nanoseconds)\n");
> +			igt_info("  3. Timing didn't align to hit the exact window\n");
> +			igt_info("  4. KASAN may not be sensitive enough to catch it\n");
> +			igt_info("  5. Test needs different timing parameters\n\n");
> +			igt_info("Note: Absence of concurrent access detection doesn't prove correctness.\n");
> +			igt_info("      Code analysis shows the race exists in principle.\n");
> +		}
> +	}
> +}
> +
> +/*
> + * =======================================================================
> + * RANDOM HANDLE TEST - Try random handle numbers to find free slots
> + * =======================================================================
> + */
> +
> +static void *random_handle_hammer(void *arg)
> +{
> +	struct random_handle_data *data = arg;
> +	uint32_t handle;
> +	int local_fd;
> +	int ret;
> +	unsigned long swaps = 0;
> +	unsigned long attempts = 0;
> +	struct gpu_ctx local_ctx;
> +	uint32_t random_handle;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	/* Create BO BEFORE closer starts */
> +	pthread_mutex_lock(data->fd_lock);
> +	local_fd = *data->main_fd;
> +	pthread_mutex_unlock(data->fd_lock);
> +
> +	local_ctx = *data->ctx;
> +	local_ctx.fd = local_fd;
> +
> +	handle = gem_create_bo(&local_ctx, 4096);
> +	if (handle == 0) {
> +		igt_info("[HAMMER] Failed to create BO\n");
> +		__atomic_store_n(&data->hammer_ready, true, __ATOMIC_RELEASE);
> +		return NULL;
> +	}
> +
> +	igt_info("[HAMMER] Created base handle %u\n", handle);
> +	__atomic_store_n(&data->hammer_ready, true, __ATOMIC_RELEASE);
> +
> +	/* Seed random number generator with thread ID + time */
> +	srand(time(NULL) ^ pthread_self());
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		/* Try random handle numbers in different ranges */
> +		int range = attempts % 4;
> +
> +		switch (range) {
> +		case 0:
> +			/* Small random offset (1-100) */
> +			random_handle = handle + (rand() % 100) + 1;
> +			break;
> +		case 1:
> +			/* Medium random offset (100-10000) */
> +			random_handle = handle + (rand() % 9900) + 100;
> +			break;
> +		case 2:
> +			/* Large random offset (1M-2M) */
> +			random_handle = handle + 1000000 + (rand() % 1000000);
> +			break;
> +		case 3:
> +			/* Completely random handle */
> +			random_handle = rand() % 0xFFFFFF;
> +			if (random_handle == handle)
> +				random_handle++;
> +			break;
> +		}
> +
> +		attempts++;
> +		__sync_fetch_and_add(&data->attempt_count, 1);
> +
> +		/* Try to change to random handle */
> +		ret = gem_change_handle(&local_ctx, handle, random_handle);
> +		if (ret == 0) {
> +			swaps++;
> +			__sync_fetch_and_add(&data->swap_count, 1);
> +
> +			/* Successfully swapped, now swap back */
> +			ret = gem_change_handle(&local_ctx, random_handle, handle);
> +			if (ret != 0) {
> +				/* Failed to swap back, update current handle */
> +				handle = random_handle;
> +			}
> +
> +			if (swaps % 100 == 0)
> +				igt_info("[HAMMER] %lu successful swaps (%.2f%% success rate)\n",
> +					 swaps, 100.0 * swaps / attempts);
> +		}
> +
> +		/* Every 10000 attempts, report stats */
> +		if (attempts % 10000 == 0) {
> +			igt_info("[HAMMER] %lu attempts, %lu swaps (%.4f%% success)\n",
> +				 attempts, swaps, 100.0 * swaps / attempts);
> +		}
> +	}
> +
> +	igt_info("[HAMMER] Final: %lu swaps from %lu attempts (%.4f%%)\n",
> +		 swaps, attempts, 100.0 * swaps / attempts);
> +
> +	/* Cleanup current handle */
> +	gem_close_bo(&local_ctx, handle);
> +
> +	return NULL;
> +}
> +
> +static void *random_handle_closer(void *arg)

Same as the single thread closer?

> +{
> +	struct random_handle_data *data = arg;
> +	unsigned long closes = 0;
> +	int new_fd;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	/* Wait for hammer to create BO first */
> +	while (!__atomic_load_n(&data->hammer_ready, __ATOMIC_ACQUIRE))
> +		usleep(100);
> +
> +	igt_info("[CLOSER] Hammer ready, starting closes\n");
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		/* Close FD to trigger idr_for_each() */
> +		pthread_mutex_lock(data->fd_lock);
> +		if (*data->main_fd >= 0) {
> +			close(*data->main_fd);
> +			*data->main_fd = -1;
> +			closes++;
> +			__sync_fetch_and_add(&data->close_count, 1);
> +		}
> +		pthread_mutex_unlock(data->fd_lock);
> +
> +		/* Small delay - race window */
> +		usleep(1000);
> +
> +		/* Reopen */
> +		new_fd = drm_open_driver_render(DRIVER_ANY);
> +		if (new_fd >= 0) {
> +			pthread_mutex_lock(data->fd_lock);
> +			*data->main_fd = new_fd;
> +			pthread_mutex_unlock(data->fd_lock);
> +		}
> +
> +		/* Check KASAN */
> +		if (closes % 100 == 0) {
> +			int kasan_now = check_kernel_traces();
> +
> +			if (kasan_now > 0) {
> +				__sync_fetch_and_add(data->race_hits, 1);
> +				igt_info("[CLOSER] *** KASAN DETECTED: %d traces ***\n", kasan_now);
> +			}
> +		}
> +	}
> +
> +	igt_info("[CLOSER] %lu closes\n", closes);
> +	return NULL;
> +}
> +
> +static void *random_handle_monitor(void *arg)

Same as the single threaded monitor?

> +{
> +	struct random_handle_data *data = arg;
> +	int kasan_last = 0;
> +	int kasan_now;
> +
> +	pthread_barrier_wait(data->barrier);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		sleep(5);
> +
> +		kasan_now = check_kernel_traces();
> +		if (kasan_now > kasan_last) {
> +			igt_info("[MONITOR] +%d KASAN traces (total: %d)\n",
> +				 kasan_now - kasan_last, kasan_now);
> +			kasan_last = kasan_now;
> +		}
> +
> +		igt_info("[STATS] Attempts:%u Swaps:%u Closes:%u KASAN:%u (%.4f%% success)\n",
> +			 __atomic_load_n(&data->attempt_count, __ATOMIC_RELAXED),
> +			 __atomic_load_n(&data->swap_count, __ATOMIC_RELAXED),
> +			 __atomic_load_n(&data->close_count, __ATOMIC_RELAXED),
> +			 *data->race_hits,
> +			 (__atomic_load_n(&data->attempt_count, __ATOMIC_RELAXED) > 0) ?
> +			 (100.0 * __atomic_load_n(&data->swap_count,
> +			 __ATOMIC_RELAXED) / __atomic_load_n(&data->attempt_count,
> +			 __ATOMIC_RELAXED)) : 0);
> +	}
> +
> +	return NULL;
> +}
> +
> +static void test_race_random_handles(struct gpu_ctx *ctx)
> +{
> +	pthread_t hammer, closer, monitor;
> +	pthread_barrier_t barrier;
> +	pthread_mutex_t fd_lock = PTHREAD_MUTEX_INITIALIZER;
> +	struct random_handle_data data = {0};
> +	uint32_t race_hits = 0;
> +	int main_fd;
> +	int kasan_before, kasan_after;
> +	int race_detected;
> +
> +	igt_info("===========================================================\n");
> +	igt_info("  RANDOM HANDLE TEST\n");
> +	igt_info("===========================================================\n");
> +	igt_info("  Duration: 3 seconds\n");
> +	igt_info("  Threads: 1 hammer + 1 closer + 1 monitor\n");
> +	igt_info("  Strategy:\n");
> +	igt_info("    1. Hammer creates ONE BO\n");
> +	igt_info("    2. Hammer tries RANDOM new handle numbers\n");
> +	igt_info("    3. Ranges: small (1-100), medium (100-10K),\n");
> +	igt_info("       large (1M-2M), completely random\n");
> +	igt_info("    4. Swaps back to original handle on success\n");
> +	igt_info("    5. Closer periodically close(fd) -> idr_for_each()\n");
> +	igt_info("  Goal: Find free handle slots by random probing\n");
> +	igt_info("===========================================================\n\n");
> +
> +	kasan_before = check_kernel_traces();
> +	igt_info("KASAN traces before test: %d\n\n", kasan_before);
> +
> +	main_fd = drm_open_driver_render(DRIVER_ANY);
> +	igt_require(main_fd >= 0);
> +
> +	data.ctx = ctx;
> +	data.main_fd = &main_fd;
> +	data.fd_lock = &fd_lock;
> +	__atomic_store_n(&data.running, true, __ATOMIC_RELEASE);
> +	__atomic_store_n(&data.hammer_ready, false, __ATOMIC_RELEASE);
> +	data.race_hits = &race_hits;
> +
> +	pthread_barrier_init(&barrier, NULL, 3);
> +	data.barrier = &barrier;
> +
> +	igt_info("Starting threads...\n");
> +
> +	pthread_create(&hammer, NULL, random_handle_hammer, &data);
> +	pthread_create(&closer, NULL, random_handle_closer, &data);
> +	pthread_create(&monitor, NULL, random_handle_monitor, &data);
> +
> +	igt_info("Racing for 3 seconds...\n\n");
> +	sleep(3);
> +
> +	igt_info("\nStopping threads...\n");
> +	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> +
> +	pthread_join(hammer, NULL);
> +	pthread_join(closer, NULL);
> +	pthread_join(monitor, NULL);
> +
> +	pthread_barrier_destroy(&barrier);
> +	pthread_mutex_destroy(&fd_lock);
> +
> +	if (main_fd >= 0)
> +		close(main_fd);
> +
> +	kasan_after = check_kernel_traces();
> +	race_detected = kasan_after - kasan_before;
> +
> +	igt_info("\n===========================================================\n");
> +	igt_info("  RANDOM HANDLE TEST RESULTS\n");
> +	igt_info("===========================================================\n");
> +	igt_info("  Total attempts: %u\n", __atomic_load_n(&data.attempt_count, __ATOMIC_RELAXED));
> +	igt_info("  Successful swaps: %u\n", __atomic_load_n(&data.swap_count, __ATOMIC_RELAXED));
> +	if (__atomic_load_n(&data.attempt_count, __ATOMIC_RELAXED) > 0) {
> +		igt_info("  Success rate: %.4f%%\n",
> +			 100.0 * __atomic_load_n(&data.swap_count,
> +			 __ATOMIC_RELAXED) / __atomic_load_n(&data.attempt_count,
> +			 __ATOMIC_RELAXED));
> +	}
> +	igt_info("  Total closes: %u\n", __atomic_load_n(&data.close_count, __ATOMIC_RELAXED));
> +	igt_info("  KASAN concurrent access traces: %d\n", race_detected);
> +	igt_info("===========================================================\n\n");
> +
> +	if (race_detected > 0) {
> +		igt_info("*** SUCCESS: RACE CONDITION TRIGGERED! ***\n\n");
> +		igt_info("concurrent access detected with %d KASAN traces!\n\n", race_detected);
> +		igt_info("This confirms the race with random handle probing.\n\n");
> +		igt_info("View KASAN traces:\n");
> +		igt_info("  sudo dmesg | grep -B10 -A40 'concurrent access issues'\n\n");
> +	} else {
> +		igt_info("=== NO concurrent access DETECTED ===\n\n");
> +		if (data.swap_count == 0) {
> +			igt_info("ERROR: No successful handle swaps!\n");
> +			igt_info("Random probing also failed to find free handles.\n\n");
> +		} else if (__atomic_load_n(&data.swap_count, __ATOMIC_RELAXED) < 100) {
> +			igt_info("WARNING: Very few swaps (%u). May not have hit race window.\n\n",
> +				 __atomic_load_n(&data.swap_count, __ATOMIC_RELAXED));
> +		} else {
> +			igt_info("Completed %u swaps and %u closes without detecting concurrent access.\n\n",
> +				 __atomic_load_n(&data.swap_count, __ATOMIC_RELAXED),
> +				 __atomic_load_n(&data.close_count, __ATOMIC_RELAXED));
> +			igt_info("Random handle probing success rate: %.4f%%\n\n",
> +				 100.0 * __atomic_load_n(&data.swap_count,
> +				 __ATOMIC_RELAXED) / __atomic_load_n(&data.attempt_count,
> +				 __ATOMIC_RELAXED));
> +			if (__atomic_load_n(&data.swap_count, __ATOMIC_RELAXED) > 1000)
> +				igt_info("Good swap rate - race window likely too small to hit.\n");
> +		}
> +	}
> +}
> +
> +/*
> + * Close-before-lock test - Exact race from vulnerability report
> + *
> + * Tests concurrent GEM_CLOSE and CHANGE_HANDLE operations.
> + * The race exploits the window where GEM_CLOSE runs BEFORE change_handle
> + * takes table_lock for idr_alloc:
> + *
> + *   Thread A (change_handle)          Thread B (GEM_CLOSE on H)
> + *   -----------------------          -------------------------
> + *   obj = lookup(H)  refcount 1->2
> + *                                    handle_count 1->0 -> put(obj)
> + *                                      refcount 2->1
> + *                                    idr_remove(H)
> + *   idr_alloc(obj, N)
> + *   idr_replace(NULL, H): H empty,
> + *     returns NULL -- discarded!
> + *   idr_replace(obj, N)
> + *   out: put(obj)  refcount 1->0
> + *     -> obj FREED
> + *
> + * End state: object_idr[N] points at freed obj -> concurrent access
> + *
> + * Uses DRM_IOCTL_MODE_CREATE_DUMB (driver-agnostic, no libdrm needed).
> + * Semaphore sync + CPU pinning for maximum race window exploitation.
> + *
> + * Expected:
> + *   Unpatched kernel: "Race Success" + KASAN traces in dmesg
> + *   Patched kernel (Sima's fix): 0 race wins in 2000 iterations
> + */
> +
> +static void *race_change_worker(void *arg)
> +{
> +	struct race_shared *s = arg;
> +
> +	pin_to_cpu(1);
> +	sem_wait(&s->change_sem);
> +
> +	if (igt_ioctl(s->fd, DRM_IOCTL_GEM_CHANGE_HANDLE, &s->ch) == 0)
> +		s->change_success = 1;
> +
> +	return NULL;
> +}
> +
> +static void *race_close_worker(void *arg)
> +{
> +	struct race_shared *s = arg;
> +
> +	pin_to_cpu(0);
> +	sem_wait(&s->close_sem);
> +
> +	if (igt_ioctl(s->fd, DRM_IOCTL_GEM_CLOSE, &s->cl) == 0)
> +		s->close_success = 1;
> +
> +	return NULL;
> +}
> +
> +static void test_race_close_before_lock(struct gpu_ctx *ctx)
> +{
> +	struct race_shared shared;
> +	int iterations = 2000;
> +	int race_wins = 0;
> +	int kasan_before, kasan_after;
> +	int i;
> +
> +	igt_info("Testing Close-before-lock test on %s\n",
> +		 gpu_name(ctx->driver));
> +	igt_info("  Tests close-before-lock scenario)\n");
> +	igt_info("  Race: GEM_CLOSE wins before CHANGE_HANDLE takes table_lock\n");
> +	igt_info("  Method: Semaphore sync + CPU pinning\n");
> +	igt_info("  Iterations: %d\n", iterations);
> +	igt_info("  Detection: Both change AND close succeed simultaneously\n\n");
> +
> +	shared.fd = ctx->fd;
> +	kasan_before = check_kernel_traces();
> +
> +	for (i = 0; i < iterations; i++) {
> +		struct drm_mode_create_dumb create = {
> +			.width = 64,
> +			.height = 64,
> +			.bpp = 32,
> +		};
> +		pthread_t tid_change, tid_close;
> +		int ret;
> +
> +		ret = igt_ioctl(ctx->fd, DRM_IOCTL_MODE_CREATE_DUMB, &create);
> +		if (ret < 0) {
> +			/*
> +			 * MODE_CREATE_DUMB may not be supported on all
> +			 * drivers/configs. Fall back to gem_create_bo.
> +			 */
> +			create.handle = gem_create_bo(ctx, BO_SIZE);
> +		}
> +
> +		shared.old_handle = create.handle;
> +		shared.new_handle = 0x4000 + i;
> +		shared.ch.handle = shared.old_handle;
> +		shared.ch.new_handle = shared.new_handle;
> +		shared.cl.handle = shared.old_handle;
> +		shared.change_success = 0;
> +		shared.close_success = 0;
> +
> +		sem_init(&shared.change_sem, 0, 0);
> +		sem_init(&shared.close_sem, 0, 0);
> +
> +		igt_assert_eq(pthread_create(&tid_change, NULL,
> +					     race_change_worker, &shared), 0);
> +		igt_assert_eq(pthread_create(&tid_close, NULL,
> +					     race_close_worker, &shared), 0);
> +
> +		/* Brief delay to let threads reach sem_wait */
> +		usleep(100);
> +
> +		/* Fire both threads as close to simultaneously as possible */
> +		sem_post(&shared.change_sem);
> +		sem_post(&shared.close_sem);

pthread_barrier approach the other test cases use does not work here?

> +
> +		pthread_join(tid_change, NULL);
> +		pthread_join(tid_close, NULL);
> +
> +		sem_destroy(&shared.change_sem);
> +		sem_destroy(&shared.close_sem);
> +
> +		if (shared.change_success && shared.close_success) {
> +			race_wins++;
> +			igt_info("  [%d] *** RACE WIN: both change and close "
> +				 "succeeded (handle %u -> %u) ***\n",
> +				 i, shared.old_handle, shared.new_handle);
> +			/*
> +			 * new_handle now points to a freed object.
> +			 * Do NOT touch it -- just record the event.
> +			 * The dangling handle will be cleaned up on fd close.
> +			 */
> +		} else if (shared.change_success) {
> +			/* Change won, close lost -- normal, clean up new handle */
> +			struct drm_gem_close cleanup = {
> +				.handle = shared.new_handle
> +			};
> +			igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CLOSE, &cleanup);
> +		}
> +		/* If close won and change lost: handle already freed, nothing to do */
> +
> +		if ((i + 1) % 500 == 0)
> +			igt_info("  Progress: %d/%d (race wins: %d)\n",
> +				 i + 1, iterations, race_wins);
> +	}
> +
> +	kasan_after = check_kernel_traces();
> +
> +	igt_info("\n  Results:\n");
> +	igt_info("  Iterations: %d\n", iterations);
> +	igt_info("  Race wins (both succeeded): %d\n", race_wins);
> +	igt_info("  KASAN concurrent access traces: %d\n", kasan_after - kasan_before);
> +
> +	if (race_wins > 0) {
> +		igt_info("\n  *** concurrent access RACE DETECTED ***\n");
> +		igt_info("  %d iterations had both CHANGE_HANDLE and GEM_CLOSE\n"
> +			 "  succeed on the same handle. The new handle now\n"
> +			 "  points to a freed GEM object.\n\n", race_wins);
> +		igt_info("  View KASAN traces:\n");
> +		igt_info("    sudo dmesg | grep -B5 -A40 'concurrent access issues'\n\n");
> +	} else {
> +		igt_info("\n  === NO RACE DETECTED ===\n");
> +		igt_info("  Kernel appears patched. No iteration had both\n");
> +		igt_info("  CHANGE_HANDLE and GEM_CLOSE succeed simultaneously.\n");
> +	}
> +
> +	/*
> +	 * Fail the test if races were detected -- this is a security bug.
> +	 * If KASAN found concurrent access traces, that's definitive proof.
> +	 */
> +	igt_assert_f(race_wins == 0,
> +		     "concurrent access race detected: %d wins in %d iterations\n",
> +		     race_wins, iterations);
> +}
> +
> +int igt_main()
> +{
> +	struct gpu_ctx ctx = { .fd = -1 };
> +
> +	igt_fixture() {
> +		ctx.fd = drm_open_driver_render(DRIVER_ANY);
> +		igt_require(ctx.fd >= 0);

Please double check but I have a feeling drm_open_driver_render() comes 
with a built-in skip on failure.

> +
> +	require_dmesg_access();
> +
> +		ctx.driver = detect_driver(ctx.fd);
> +		igt_require_f(ctx.driver != DRIVER_TYPE_UNKNOWN,
> +			      "Unsupported GPU driver\n");
> +
> +		igt_info("===============================================\n");
> +		igt_info("  GPU-Agnostic Race Condition Tests\n");
> +		igt_info("  Running on: %s\n", gpu_name(ctx.driver));
> +		igt_info("===============================================\n");
> +
> +#if HAS_AMDGPU
> +		if (ctx.driver == DRIVER_TYPE_AMDGPU) {
> +			uint32_t major, minor;
> +			int err = amdgpu_device_initialize(ctx.fd, &major, &minor,
> +							   &ctx.amdgpu_device);

Is libdrm needed?

> +			igt_require(err == 0);
> +			igt_info("  AMDGPU version: %d.%d\n", major, minor);
> +		}
> +#endif
> +
> +		if (ctx.driver == DRIVER_TYPE_I915) {
> +			igt_require_gem(ctx.fd);
> +			igt_info("  i915 GEM verified\n");
> +		}
> +
> +		igt_info("===============================================\n\n");
> +	}
> +
> +	igt_describe("Race Condition #1: CHANGE_HANDLE vs GEM_CLOSE (concurrent access issues)");
> +	igt_subtest("race-change-vs-close")
> +		test_race_change_vs_close(&ctx);
> +
> +	igt_describe("Race Condition #2: Concurrent CHANGE_HANDLE (handle corruption)");
> +	igt_subtest("race-change-vs-change")
> +		test_race_change_vs_change(&ctx);
> +
> +	igt_describe("Race Condition #3: CHANGE_HANDLE vs Prime (stale references)");
> +	igt_subtest("race-change-vs-prime")
> +		test_race_change_vs_prime(&ctx);
> +	igt_describe("Aggressive concurrent access race: CHANGE_HANDLE vs CLOSE with KASAN detection");
> +	igt_subtest("race-aggressive-change-vs-close")
> +		test_race_aggressive(&ctx);
> +	igt_describe("Single-thread: One BO swapped H<->H+1 with periodic FD close");
> +	igt_subtest("race-exploit-single-thread")
> +		test_race_single_thread(&ctx);
> +	igt_describe("Random handle probing: Try random new_handle values to find free slots");
> +	igt_subtest("race-exploit-random-handles")
> +		test_race_random_handles(&ctx);
> +	igt_describe(" GEM_CLOSE races CHANGE_HANDLE lookup ");
> +	igt_subtest("race-close-before-lock")
> +		test_race_close_before_lock(&ctx);
> +
> +	igt_fixture() {
> +#if HAS_AMDGPU
> +		if (ctx.driver == DRIVER_TYPE_AMDGPU && ctx.amdgpu_device)
> +			amdgpu_device_deinitialize(ctx.amdgpu_device);
> +#endif
> +		drm_close_driver(ctx.fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 1ac89bab7..c8375af8a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -106,6 +106,7 @@ intel_i915_progs = [
>   	'gem_caching',
>   	'gem_create',
>   	'gem_ccs',
> +	'gem_change_handle_race',
>   	'gem_close',
>   	'gem_close_race',
>   	'gem_compute',

Regards,

Tvrtko

