Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3671C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701C010E425;
	Mon, 29 Jul 2024 16:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mKyQhZeg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A6010E425
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269118; x=1753805118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GnfM0/bsc2YTQ7GHJ9mj3jzbBJXdWROIAv97oz1lVHY=;
 b=mKyQhZegUG4ffAAyzAB7n/BVEOjBdezTYFgDXxv1M6nE6lC5BTZNkfxg
 J9VtypuITWLIy7unSfOyHY1uip74wxoLe0U7tEKULJ3Em2RQufErv1ekM
 noGQChfbVQwokcNpOknGrGBa3foadZnqKTWLXxMU8sFH3/pf8z75295kf
 qAZhl/pcGOgX5u47CGMk+RcZL0Ln8nwEGqtBOCi7XsbnEh4NdO0g5ySoh
 SB5tpYiphR6vK4svrO1DKQEQCIBtGknx8VwJLHf9aVxt26A/F9pFQ3Jm0
 /xupxI4USgl0d6zIgMoMrXCSa9m9HVE1OGra8173GM+l3v0kgH4zhNCga w==;
X-CSE-ConnectionGUID: O/VD1XPESeCi+a/FrjheBw==
X-CSE-MsgGUID: ZW4BULZtSdWg07Px1aYTNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427628"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427628"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:06 -0700
X-CSE-ConnectionGUID: hT8YYBsVSCighBPObtuC7w==
X-CSE-MsgGUID: MK2wP3tRR7amTsAij2sPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53739579"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:02 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 52/66] tests/xe_eudebug_online: Debug client which runs
 workloads on EU
Date: Mon, 29 Jul 2024 18:01:45 +0200
Message-Id: <20240729160159.37036-53-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

1# Sanity check for attention events

Introduce first online scenario (basic-attention-event)
in which we schedule EU workload with breakpoint bit set.
We expect to get eu attention and peacefully resume workload.

2# Basic coverage for eu thread control

Eu thread control is an ioctl which allows the debugger to
interfere with eu thread execution. Provide initial coverage for
that functionality Exercise interrupt-all, stopped,
and resume with bunch of different granularities.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com> #1
Cc: Mika Kuoppala <mika.kuoppala@intel.com> #2
---
 tests/intel/xe_eudebug_online.c | 977 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   1 +
 2 files changed, 978 insertions(+)
 create mode 100644 tests/intel/xe_eudebug_online.c

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
new file mode 100644
index 000000000..8791b29fa
--- /dev/null
+++ b/tests/intel/xe_eudebug_online.c
@@ -0,0 +1,977 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Tests for eudebug online functionality
+ * Category: Core
+ * Mega feature: EUdebug
+ * Sub-category: EUdebug tests
+ * Functionality: eu kernel debug
+ * Test category: functionality test
+ */
+
+#include "xe/xe_eudebug.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "igt.h"
+#include "intel_pat.h"
+#include "intel_mocs.h"
+#include "gpgpu_shader.h"
+
+#define SHADER_BREAKPOINT	(1 << 0)
+#define SHADER_LOOP		(1 << 1)
+#define TRIGGER_RESUME_DELAYED	(1 << 29)
+#define TRIGGER_RESUME_DSS	(1 << 30)
+#define TRIGGER_RESUME_ONE	(1 << 31)
+
+#define STEERING_END_LOOP	0xdeadca11
+
+#define SHADER_CANARY 0x01010101
+
+#define WALKER_X_DIM		4
+#define WALKER_ALIGNMENT	16
+#define SIMD_SIZE		16
+
+#define STARTUP_TIMEOUT_MS	3000
+
+#define PAGE_SIZE 4096
+
+struct dim_t {
+	uint32_t x;
+	uint32_t y;
+	uint32_t alignment;
+};
+
+static struct dim_t walker_dimensions(int threads)
+{
+	uint32_t x_dim = min_t(x_dim, threads, WALKER_X_DIM);
+	struct dim_t ret = {
+		.x = x_dim,
+		.y = threads / x_dim,
+		.alignment = WALKER_ALIGNMENT
+	};
+
+	return ret;
+}
+
+static struct dim_t surface_dimensions(int threads)
+{
+	struct dim_t ret = walker_dimensions(threads);
+
+	ret.y = max_t(ret.y, threads/ret.x, 4);
+	ret.x *= SIMD_SIZE;
+	ret.alignment *= SIMD_SIZE;
+
+	return ret;
+}
+
+static uint32_t steering_offset(int threads)
+{
+	struct dim_t w = walker_dimensions(threads);
+
+	return ALIGN(w.x, w.alignment) * w.y * 4;
+}
+
+static struct intel_buf *create_uc_buf(int fd, int width, int height)
+{
+	struct intel_buf *buf;
+
+	buf = intel_buf_create_full(buf_ops_create(fd), 0, width/4, height,
+				    32, 0, I915_TILING_NONE, 0, 0, 0,
+				    vram_if_possible(fd, 0),
+				    DEFAULT_PAT_INDEX, DEFAULT_MOCS_INDEX);
+
+	return buf;
+}
+
+static int get_number_of_threads(uint64_t flags)
+{
+	if (flags & (TRIGGER_RESUME_ONE))
+		return 32;
+
+	return 512;
+}
+
+static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
+{
+	struct dim_t w_dim = walker_dimensions(get_number_of_threads(flags));
+	static struct gpgpu_shader *shader;
+
+	shader = gpgpu_shader_create(fd);
+
+	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
+	if (flags & SHADER_BREAKPOINT) {
+		gpgpu_shader__nop(shader);
+		gpgpu_shader__breakpoint(shader);
+	} else if (flags & SHADER_LOOP) {
+		gpgpu_shader__label(shader, 0);
+		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
+		gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
+		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
+	}
+
+	gpgpu_shader__eot(shader);
+	return shader;
+}
+
+static struct gpgpu_shader *get_sip(int fd)
+{
+	static struct gpgpu_shader *sip;
+
+	sip = gpgpu_shader_create(fd);
+	gpgpu_shader__write_aip(sip, 0);
+
+	gpgpu_shader__wait(sip);
+	gpgpu_shader__end_system_routine(sip, true);
+	return sip;
+}
+
+static int count_set_bits(void *ptr, size_t size)
+{
+	uint8_t *p = ptr;
+	int count = 0;
+	int i, j;
+
+	for (i = 0; i < size; i++)
+		for (j = 0; j < 8; j++)
+			count += !!(p[i] & (1 << j));
+
+	return count;
+}
+
+static int count_canaries_eq(uint32_t *ptr, struct dim_t w_dim, uint32_t value)
+{
+	int count = 0;
+	int x, y;
+
+	for (x = 0; x < w_dim.x; x++)
+		for (y = 0; y < w_dim.y; y++)
+			if (READ_ONCE(ptr[x + ALIGN(w_dim.x, w_dim.alignment) * y]) == value)
+				count++;
+
+	return count;
+}
+
+static int count_canaries_neq(uint32_t *ptr, struct dim_t w_dim, uint32_t value)
+{
+	return w_dim.x * w_dim.y - count_canaries_eq(ptr, w_dim, value);
+}
+
+static const char *td_ctl_cmd_to_str(uint32_t cmd)
+{
+	switch (cmd) {
+	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL:
+		return "interrupt all";
+	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED:
+		return "stopped";
+	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME:
+		return "resume";
+	default:
+		return "unknown command";
+	}
+}
+
+static int __eu_ctl(int debugfd, uint64_t client,
+		    uint64_t exec_queue, uint64_t lrc,
+		    uint8_t *bitmask, uint32_t *bitmask_size,
+		    uint32_t cmd, uint64_t *seqno)
+{
+	struct drm_xe_eudebug_eu_control control = {
+		.client_handle = lower_32_bits(client),
+		.exec_queue_handle = exec_queue,
+		.lrc_handle = lrc,
+		.cmd = cmd,
+		.bitmask_ptr = to_user_pointer(bitmask),
+	};
+	int ret;
+
+	if (bitmask_size)
+		control.bitmask_size = *bitmask_size;
+
+	ret = igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_EU_CONTROL, &control);
+
+	if (ret < 0)
+		return -errno;
+
+	igt_debug("EU CONTROL[%llu]: %s\n", control.seqno, td_ctl_cmd_to_str(cmd));
+
+	if (bitmask_size)
+		*bitmask_size = control.bitmask_size;
+
+	if (seqno)
+		*seqno = control.seqno;
+
+	return 0;
+
+}
+
+static uint64_t eu_ctl(int debugfd, uint64_t client,
+		       uint64_t exec_queue, uint64_t lrc,
+		       uint8_t *bitmask, uint32_t *bitmask_size, uint32_t cmd)
+{
+	uint64_t seqno;
+
+	igt_assert_eq(__eu_ctl(debugfd, client, exec_queue, lrc, bitmask,
+			       bitmask_size, cmd, &seqno), 0);
+
+	return seqno;
+}
+
+static bool intel_gen_needs_resume_wa(int fd)
+{
+	const uint32_t id = intel_get_drm_devid(fd);
+
+	return intel_gen(id) == 12 && intel_graphics_ver(id) < IP_VER(12, 55);
+}
+
+static uint64_t eu_ctl_resume(int fd, int debugfd, uint64_t client,
+			      uint64_t exec_queue, uint64_t lrc,
+			      uint8_t *bitmask, uint32_t bitmask_size)
+{
+	int i;
+
+	/* XXX: WA for hsd: 14011332042 */
+	if (intel_gen_needs_resume_wa(fd)) {
+		uint32_t *att_reg_half = (uint32_t *)bitmask;
+
+		for (i = 0; i < bitmask_size / sizeof(uint32_t); i += 2) {
+			att_reg_half[i] |= att_reg_half[i + 1];
+			att_reg_half[i + 1] |= att_reg_half[i];
+		}
+	}
+
+	return eu_ctl(debugfd, client, exec_queue, lrc, bitmask, &bitmask_size,
+		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME);
+}
+
+static inline uint64_t eu_ctl_stopped(int debugfd, uint64_t client,
+				      uint64_t exec_queue, uint64_t lrc,
+				      uint8_t *bitmask, uint32_t *bitmask_size)
+{
+	return eu_ctl(debugfd, client, exec_queue, lrc, bitmask, bitmask_size,
+		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED);
+}
+
+static inline uint64_t eu_ctl_interrupt_all(int debugfd, uint64_t client,
+					    uint64_t exec_queue, uint64_t lrc)
+{
+	return eu_ctl(debugfd, client, exec_queue, lrc, NULL, 0,
+		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL);
+}
+
+struct online_debug_data {
+	pthread_mutex_t mutex;
+	/* client in */
+	struct drm_xe_engine_class_instance hwe;
+	/* client out */
+	int threads_count;
+	/* debugger internals */
+	uint64_t client_handle;
+	uint64_t exec_queue_handle;
+	uint64_t lrc_handle;
+	uint64_t target_offset;
+	size_t target_size;
+	uint64_t bb_offset;
+	size_t bb_size;
+	int vm_fd;
+	struct timespec exception_arrived;
+	int last_eu_control_seqno;
+};
+
+static struct online_debug_data *
+online_debug_data_create(struct drm_xe_engine_class_instance *hwe)
+{
+	struct online_debug_data *data;
+
+	data = mmap(0, ALIGN(sizeof(*data), PAGE_SIZE),
+		    PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	memcpy(&data->hwe, hwe, sizeof(*hwe));
+	pthread_mutex_init(&data->mutex, NULL);
+	data->client_handle = -1ULL;
+	data->exec_queue_handle = -1ULL;
+	data->lrc_handle = -1ULL;
+	data->vm_fd = -1;
+
+	return data;
+}
+
+static void online_debug_data_destroy(struct online_debug_data *data)
+{
+
+	munmap(data, ALIGN(sizeof(*data), PAGE_SIZE));
+}
+
+static void eu_attention_debug_trigger(struct xe_eudebug_debugger *d,
+					struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
+	uint32_t *ptr = (uint32_t *) att->bitmask;
+
+	igt_debug("EVENT[%llu] eu-attenttion; threads=%d "
+		 "client[%llu], exec_queue[%llu], lrc[%llu], bitmask_size[%d]\n",
+		 att->base.seqno, count_set_bits(att->bitmask, att->bitmask_size),
+				att->client_handle, att->exec_queue_handle,
+				att->lrc_handle, att->bitmask_size);
+
+	for (uint32_t i = 0; i < att->bitmask_size/4; i += 2)
+		igt_debug("bitmask[%d] = 0x%08x%08x\n", i/2, ptr[i], ptr[i+1]);
+
+}
+
+static void copy_first_bit(uint8_t *dst, uint8_t *src, int size)
+{
+	bool found = false;
+	int i, j;
+
+	for (i = 0; i < size; i++) {
+		if (found) {
+			dst[i] = 0;
+		} else {
+			uint32_t tmp = src[i]; /* in case dst == src */
+
+			for (j = 0; j < 8; j++) {
+				dst[i] = tmp & (1 << j);
+				if (dst[i]) {
+					found = true;
+					break;
+				}
+			}
+		}
+	}
+}
+
+#define MAX_PREEMPT_TIMEOUT 10ull
+static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
+					struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
+	struct online_debug_data *data = d->ptr;
+	uint32_t bitmask_size = att->bitmask_size;
+	uint8_t *bitmask;
+	int i;
+
+	if (data->last_eu_control_seqno > att->base.seqno)
+		return;
+
+	bitmask = calloc(1, att->bitmask_size);
+
+	eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
+		       att->lrc_handle, bitmask, &bitmask_size);
+	igt_assert(bitmask_size == att->bitmask_size);
+	igt_assert(memcmp(bitmask, att->bitmask, att->bitmask_size) == 0);
+
+	pthread_mutex_lock(&data->mutex);
+	if (igt_nsec_elapsed(&data->exception_arrived) < (MAX_PREEMPT_TIMEOUT + 1) * NSEC_PER_SEC &&
+	    d->flags & TRIGGER_RESUME_DELAYED) {
+		pthread_mutex_unlock(&data->mutex);
+		free(bitmask);
+		return;
+	} else if (d->flags & TRIGGER_RESUME_ONE) {
+		copy_first_bit(bitmask, bitmask, bitmask_size);
+	} else if (d->flags & TRIGGER_RESUME_DSS) {
+		uint64_t *event = (uint64_t *)att->bitmask;
+		uint64_t *resume = (uint64_t *)bitmask;
+
+		memset(bitmask, 0, bitmask_size);
+		for (i = 0; i < att->bitmask_size / sizeof(uint64_t); i++) {
+			if (!event[i])
+				continue;
+
+			resume[i] = event[i];
+			break;
+		}
+	}
+
+	if (d->flags & SHADER_LOOP) {
+		uint32_t threads = get_number_of_threads(d->flags);
+		uint32_t val = STEERING_END_LOOP;
+
+		igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
+				     data->target_offset + steering_offset(threads)),
+			      sizeof(uint32_t));
+		fsync(data->vm_fd);
+	}
+	pthread_mutex_unlock(&data->mutex);
+
+	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
+						    att->exec_queue_handle, att->lrc_handle,
+						    bitmask, att->bitmask_size);
+
+	free(bitmask);
+}
+
+static void open_trigger(struct xe_eudebug_debugger *d,
+			 struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_client *client = (void *)e;
+	struct online_debug_data *data = d->ptr;
+
+	if (e->flags & DRM_XE_EUDEBUG_EVENT_DESTROY)
+		return;
+
+	pthread_mutex_lock(&data->mutex);
+	data->client_handle = client->client_handle;
+	pthread_mutex_unlock(&data->mutex);
+}
+
+static void exec_queue_trigger(struct xe_eudebug_debugger *d,
+			       struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_exec_queue *eq = (void *)e;
+	struct online_debug_data *data = d->ptr;
+
+	if (e->flags & DRM_XE_EUDEBUG_EVENT_DESTROY)
+		return;
+
+	pthread_mutex_lock(&data->mutex);
+	data->exec_queue_handle = eq->exec_queue_handle;
+	data->lrc_handle = eq->lrc_handle[0];
+	pthread_mutex_unlock(&data->mutex);
+}
+
+static void vm_open_trigger(struct xe_eudebug_debugger *d,
+			    struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_vm *vm = (void *)e;
+	struct online_debug_data *data = d->ptr;
+	struct drm_xe_eudebug_vm_open vo = {
+		.client_handle = vm->client_handle,
+		.vm_handle = vm->vm_handle,
+	};
+	int fd;
+
+	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
+		fd = igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
+		igt_assert_lte(0, fd);
+
+		pthread_mutex_lock(&data->mutex);
+		igt_assert(data->vm_fd == -1);
+		data->vm_fd = fd;
+		pthread_mutex_unlock(&data->mutex);
+		return;
+	}
+
+	pthread_mutex_lock(&data->mutex);
+	close(data->vm_fd);
+	data->vm_fd = -1;
+	pthread_mutex_unlock(&data->mutex);
+}
+
+static void read_metadata(struct xe_eudebug_debugger *d,
+			  uint64_t client_handle,
+			  uint64_t metadata_handle,
+			  uint64_t type,
+			  uint64_t len)
+{
+	struct drm_xe_eudebug_read_metadata rm = {
+		.client_handle = client_handle,
+		.metadata_handle = metadata_handle,
+		.size = len,
+	};
+	struct online_debug_data *data = d->ptr;
+	uint64_t *metadata;
+
+	metadata = malloc(len);
+	igt_assert(metadata);
+
+	rm.ptr = to_user_pointer(metadata);
+	igt_assert_eq(igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_READ_METADATA, &rm), 0);
+
+	pthread_mutex_lock(&data->mutex);
+	switch (type) {
+	case DRM_XE_DEBUG_METADATA_ELF_BINARY:
+		data->bb_offset = metadata[0];
+		data->bb_size = metadata[1];
+		break;
+	case DRM_XE_DEBUG_METADATA_PROGRAM_MODULE:
+		data->target_offset = metadata[0];
+		data->target_size = metadata[1];
+		break;
+	default:
+		break;
+	}
+	pthread_mutex_unlock(&data->mutex);
+
+	free(metadata);
+}
+
+static void create_metadata_trigger(struct xe_eudebug_debugger *d, struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_metadata *em = (void *)e;
+
+	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
+		read_metadata(d, em->client_handle, em->metadata_handle, em->type, em->len);
+	}
+}
+
+static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint32_t vm,
+					       uint64_t offset, uint32_t size)
+{
+	struct intel_bb *ibb;
+
+	ibb = intel_bb_create_with_context(fd, exec_queue, vm, NULL, size);
+
+	/* update intel bb offset */
+	intel_bb_remove_object(ibb, ibb->handle, ibb->batch_offset, ibb->size);
+	intel_bb_add_object(ibb, ibb->handle, ibb->size, offset, ibb->alignment, false);
+	ibb->batch_offset = offset;
+
+	return ibb;
+}
+
+static void run_online_client(struct xe_eudebug_client *c)
+{
+	const int threads = c->flags & (TRIGGER_RESUME_ONE) ? 64 : 512;
+	const uint64_t target_offset = 0x1a000000;
+	const uint64_t bb_offset = 0x1b000000;
+	const size_t bb_size = 4096;
+	struct online_debug_data *data = c->ptr;
+	struct drm_xe_engine_class_instance hwe = data->hwe;
+	struct drm_xe_ext_set_property ext = {
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG,
+		.value = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE,
+	};
+	struct drm_xe_exec_queue_create create = {
+		.instances = to_user_pointer(&hwe),
+		.width = 1,
+		.num_placements = 1,
+		.extensions = to_user_pointer(&ext)
+	};
+	struct dim_t w_dim = walker_dimensions(threads);
+	struct dim_t s_dim = surface_dimensions(threads);
+	struct timespec ts = { };
+	struct gpgpu_shader *sip, *shader;
+	uint32_t metadata_id[2];
+	uint64_t *metadata[2];
+	struct intel_bb *ibb;
+	struct intel_buf *buf;
+	uint32_t *ptr;
+	int fd;
+
+	metadata[0] = calloc(2, sizeof(*metadata));
+	metadata[1] = calloc(2, sizeof(*metadata));
+	igt_assert(metadata[0]);
+	igt_assert(metadata[1]);
+
+	fd = xe_eudebug_client_open_driver(c);
+	xe_device_get(fd);
+
+	/* Additional memory for steering control */
+	if (c->flags & SHADER_LOOP)
+		s_dim.y++;
+	buf = create_uc_buf(fd, s_dim.x, s_dim.y);
+
+	buf->addr.offset = target_offset;
+
+	metadata[0][0] = bb_offset;
+	metadata[0][1] = bb_size;
+	metadata[1][0] = target_offset;
+	metadata[1][1] = buf->size;
+	metadata_id[0] = xe_eudebug_client_metadata_create(c, fd, DRM_XE_DEBUG_METADATA_ELF_BINARY,
+							   2 * sizeof(*metadata), metadata[0]);
+	metadata_id[1] = xe_eudebug_client_metadata_create(c, fd,
+							   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
+							   2 * sizeof(*metadata), metadata[1]);
+
+	create.vm_id = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	xe_eudebug_client_exec_queue_create(c, fd, &create);
+
+	ibb = xe_bb_create_on_offset(fd, create.exec_queue_id, create.vm_id,
+				     bb_offset, bb_size);
+	intel_bb_set_lr_mode(ibb, true);
+
+	sip = get_sip(fd);
+	shader = get_shader(fd, c->flags);
+
+	igt_nsec_elapsed(&ts);
+	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, sip, 0, 0);
+
+	gpgpu_shader_destroy(sip);
+	gpgpu_shader_destroy(shader);
+
+	intel_bb_sync(ibb);
+
+	/* Make sure it wasn't the timeout. */
+	igt_assert(igt_nsec_elapsed(&ts) <
+		   XE_EUDEBUG_DEFAULT_TIMEOUT_MS / MSEC_PER_SEC * NSEC_PER_SEC);
+
+	ptr = xe_bo_mmap_ext(fd, buf->handle, buf->size, PROT_READ);
+	data->threads_count = count_canaries_neq(ptr, w_dim, 0);
+	igt_assert_f(data->threads_count, "No canaries found, nothing executed?\n");
+
+	if (c->flags & SHADER_BREAKPOINT) {
+		uint32_t aip = ptr[0];
+
+		igt_assert_f(aip != SHADER_CANARY, "Workload executed but breakpoint not hit!\n");
+		igt_assert_eq(count_canaries_eq(ptr, w_dim, aip), data->threads_count);
+		igt_debug("Breakpoint hit in %d threads, AIP=0x%08x\n", data->threads_count, aip);
+	}
+
+	munmap(ptr, buf->size);
+
+	intel_bb_destroy(ibb);
+
+	xe_eudebug_client_exec_queue_destroy(c, fd, &create);
+	xe_eudebug_client_vm_destroy(c, fd,  create.vm_id);
+
+	xe_eudebug_client_metadata_destroy(c, fd, metadata_id[0], DRM_XE_DEBUG_METADATA_ELF_BINARY,
+					   2 * sizeof(*metadata));
+	xe_eudebug_client_metadata_destroy(c, fd, metadata_id[1],
+					   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
+					   2 * sizeof(*metadata));
+
+	xe_device_put(fd);
+	xe_eudebug_client_close_driver(c, fd);
+}
+
+static bool intel_gen_has_lockstep_eus(int fd)
+{
+	const uint32_t id = intel_get_drm_devid(fd);
+
+	/*
+	 * Lockstep (or in some parlance, fused) EUs are pair of EUs
+	 * that work in sync, supposedly same clock and same control flow.
+	 * Thus for attentions, if the control has breakpoint, both will be
+	 * excepted into SIP. In this level, the hardware has only one attention
+	 * thread bit for units. PVC is the first one without lockstepping.
+	 */
+	return !(intel_graphics_ver(id) == IP_VER(12, 60) || intel_gen(id) >= 20);
+}
+
+static int query_attention_bitmask_size(int fd, int gt)
+{
+	const unsigned int threads = 8;
+	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
+	struct drm_xe_query_topology_mask *topology;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
+		.size = 0,
+		.data = 0,
+	};
+	int pos = 0, eus;
+	uint8_t *any_dss;
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert_neq(query.size, 0);
+
+	topology = malloc(query.size);
+	igt_assert(topology);
+
+	query.data = to_user_pointer(topology);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
+		struct drm_xe_query_topology_mask *topo;
+		int sz;
+
+		topo = (struct drm_xe_query_topology_mask *)((unsigned char *)topology + pos);
+		sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
+
+		query.size -= sz;
+		pos += sz;
+
+		if (topo->gt_id != gt)
+			continue;
+
+		if (topo->type == DRM_XE_TOPO_DSS_GEOMETRY)
+			g_dss = topo;
+		else if (topo->type == DRM_XE_TOPO_DSS_COMPUTE)
+			c_dss = topo;
+		else if (topo->type == DRM_XE_TOPO_EU_PER_DSS ||
+			 topo->type == DRM_XE_TOPO_SIMD16_EU_PER_DSS)
+			eu_per_dss = topo;
+	}
+
+	igt_assert(g_dss && c_dss && eu_per_dss);
+	igt_assert_eq_u32(c_dss->num_bytes, g_dss->num_bytes);
+
+	any_dss = malloc(c_dss->num_bytes);
+
+	for (int i = 0; i < c_dss->num_bytes; i++)
+		any_dss[i] = c_dss->mask[i] | g_dss->mask[i];
+
+	eus = count_set_bits(any_dss, c_dss->num_bytes);
+	eus *= count_set_bits(eu_per_dss->mask, eu_per_dss->num_bytes);
+
+	if (intel_gen_has_lockstep_eus(fd))
+		eus /= 2;
+
+	free(any_dss);
+	free(topology);
+
+	return eus * threads / 8;
+}
+
+static struct drm_xe_eudebug_event_exec_queue *
+match_attention_with_exec_queue(struct xe_eudebug_event_log *log,
+				struct drm_xe_eudebug_event_eu_attention *ea)
+{
+	struct drm_xe_eudebug_event_exec_queue *ee;
+	struct drm_xe_eudebug_event *event = NULL, *current = NULL, *matching_destroy = NULL;
+	int lrc_idx;
+
+	xe_eudebug_for_each_event(event, log) {
+		if (event->type == DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE &&
+		    event->flags == DRM_XE_EUDEBUG_EVENT_CREATE) {
+			ee = (struct drm_xe_eudebug_event_exec_queue *)event;
+
+			if (ee->exec_queue_handle != ea->exec_queue_handle)
+				continue;
+
+			if (ee->client_handle != ea->client_handle)
+				continue;
+
+			for (lrc_idx = 0; lrc_idx < ee->width; lrc_idx++) {
+				if (ee->lrc_handle[lrc_idx] == ea->lrc_handle)
+					break;
+			}
+
+			if (lrc_idx >= ee->width) {
+				igt_debug("No matching lrc handle within matching exec_queue!");
+				continue;
+			}
+
+			/* event logs are sorted, every found next would not be present. */
+			if (ea->base.seqno < ee->base.seqno)
+				break;
+
+			/* sanity check whether attention did
+			 * not appear yet on already destroyed exec_queue
+			 */
+			current = event;
+			xe_eudebug_for_each_event(current, log) {
+				if (current->type == DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE &&
+				    current->flags == DRM_XE_EUDEBUG_EVENT_DESTROY) {
+					uint8_t offset = sizeof(struct drm_xe_eudebug_event);
+
+					if (memcmp((uint8_t *)current + offset,
+						   (uint8_t *)event + offset,
+						   current->len - offset) == 0) {
+						matching_destroy = current;
+					}
+				}
+			}
+
+			if (!matching_destroy || ea->base.seqno > matching_destroy->seqno)
+				continue;
+
+			return ee;
+		}
+	}
+
+	return NULL;
+}
+
+static void online_session_check(struct xe_eudebug_session *s, int flags)
+{
+	struct drm_xe_eudebug_event_eu_attention *ea = NULL;
+	struct drm_xe_eudebug_event *event = NULL;
+	struct online_debug_data *data = s->c->ptr;
+	int sum = 0;
+	int bitmask_size;
+
+	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
+					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
+					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
+
+	bitmask_size = query_attention_bitmask_size(s->d->master_fd, data->hwe.gt_id);
+
+	xe_eudebug_for_each_event(event, s->d->log) {
+		if (event->type == DRM_XE_EUDEBUG_EVENT_EU_ATTENTION) {
+			ea = (struct drm_xe_eudebug_event_eu_attention *)event;
+
+			igt_assert(event->flags == DRM_XE_EUDEBUG_EVENT_STATE_CHANGE);
+			igt_assert_eq(ea->bitmask_size, bitmask_size);
+			sum += count_set_bits(ea->bitmask, bitmask_size);
+			igt_assert(match_attention_with_exec_queue(s->d->log, ea));
+		}
+	}
+
+	/*
+	 * We can expect attention to sum up only
+	 * if we have a breakpoint set and we resume all threads always.
+	 */
+	if (flags == SHADER_BREAKPOINT)
+		igt_assert_eq(sum, data->threads_count);
+
+	igt_assert(sum > 0);
+}
+
+static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
+			       struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_vm_bind_ufence *ef = (void *)e;
+
+	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE)
+		xe_eudebug_ack_ufence(d->fd, ef);
+}
+
+/**
+ * SUBTEST: basic-breakpoint
+ * Description:
+ *	Check whether KMD sends attention events
+ *	for runalone workload stopped on breakpoint.
+ *
+ * SUBTEST: stopped-thread
+ * Description:
+ *	Hits breakpoint on runalone workload and
+ *	reads attention for fixed time.
+ *
+ * SUBTEST: resume-%s
+ * Description:
+ *	Resumes stopped on a breakpoint workload
+ *	with granularity of %arg[1].
+ *
+ *
+ * arg[1]:
+ *
+ * @one:	one thread
+ * @dss:	threads running on one subslice
+ */
+static void test_basic_online(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+{
+	struct xe_eudebug_session *s;
+	struct online_debug_data *data;
+
+	data = online_debug_data_create(hwe);
+	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_debug_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_resume_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					ufence_ack_trigger);
+
+	xe_eudebug_session_run(s);
+	online_session_check(s, s->flags);
+
+	xe_eudebug_session_destroy(s);
+	online_debug_data_destroy(data);
+}
+
+/**
+ * SUBTEST: interrupt-all
+ * Description:
+ *	Schedules EU workload which should last about a few seconds, then
+ *	interrupts all threads, checks whether attention event came, and
+ *	resumes stopped threads back.
+ */
+static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+{
+	struct xe_eudebug_session *s;
+	struct online_debug_data *data;
+	uint32_t val;
+
+	data = online_debug_data_create(hwe);
+	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_OPEN,
+					open_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+					exec_queue_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_debug_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_resume_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_METADATA,
+					create_metadata_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					ufence_ack_trigger);
+
+	igt_assert_eq(xe_eudebug_debugger_attach(s->d, s->c), 0);
+	xe_eudebug_debugger_start_worker(s->d);
+	xe_eudebug_client_start(s->c);
+
+	/* wait for workload to start */
+	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
+		/* collect needed data from triggers */
+		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
+			continue;
+
+		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
+			if (val != 0)
+				break;
+	}
+
+	pthread_mutex_lock(&data->mutex);
+	igt_assert(data->client_handle != -1);
+	igt_assert(data->exec_queue_handle != -1);
+	eu_ctl_interrupt_all(s->d->fd, data->client_handle,
+			     data->exec_queue_handle, data->lrc_handle);
+	pthread_mutex_unlock(&data->mutex);
+
+	xe_eudebug_client_wait_done(s->c);
+
+	xe_eudebug_debugger_stop_worker(s->d, 1);
+
+	xe_eudebug_event_log_print(s->d->log, true);
+	xe_eudebug_event_log_print(s->c->log, true);
+
+	online_session_check(s, s->flags);
+
+	xe_eudebug_session_destroy(s);
+	online_debug_data_destroy(data);
+}
+
+static struct drm_xe_engine_class_instance *pick_compute(int fd, int gt)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int count = 0;
+
+	#define match(__e) ((__e->engine_class == DRM_XE_ENGINE_CLASS_RENDER || \
+			     __e->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) && __e->gt_id == gt)
+
+	xe_for_each_engine(fd, hwe)
+		if (match(hwe))
+			count++;
+
+	xe_for_each_engine(fd, hwe)
+		if (match(hwe) && rand() % count-- == 0)
+			return hwe;
+	#undef match
+
+	return NULL;
+}
+
+#define test_gt_render_or_compute(t, i915, __hwe) \
+	igt_subtest_with_dynamic(t) \
+		for (int gt = 0; (__hwe = pick_compute(i915, gt)); gt++) \
+			igt_dynamic_f("%s%d", xe_engine_class_string(__hwe->engine_class), hwe->engine_instance)
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		intel_allocator_multiprocess_start();
+		igt_srandom();
+	}
+
+	test_gt_render_or_compute("basic-breakpoint", fd, hwe)
+		test_basic_online(fd, hwe, SHADER_BREAKPOINT);
+
+	test_gt_render_or_compute("stopped-thread", fd, hwe)
+		test_basic_online(fd, hwe, SHADER_BREAKPOINT | TRIGGER_RESUME_DELAYED);
+
+	test_gt_render_or_compute("resume-one", fd, hwe)
+		test_basic_online(fd, hwe, SHADER_BREAKPOINT | TRIGGER_RESUME_ONE);
+
+	test_gt_render_or_compute("resume-dss", fd, hwe)
+		test_basic_online(fd, hwe, SHADER_BREAKPOINT | TRIGGER_RESUME_DSS);
+
+	test_gt_render_or_compute("interrupt-all", fd, hwe)
+		test_interrupt_all(fd, hwe, SHADER_LOOP);
+
+	igt_fixture {
+		intel_allocator_multiprocess_stop();
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 35bf8ed35..f18eec7e7 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -280,6 +280,7 @@ intel_xe_progs = [
 	'xe_debugfs',
 	'xe_drm_fdinfo',
 	'xe_eudebug',
+	'xe_eudebug_online',
 	'xe_evict',
 	'xe_evict_ccs',
 	'xe_exec_atomic',
-- 
2.34.1

