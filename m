Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7236DC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F72910E435;
	Mon, 29 Jul 2024 16:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDG5Gcjl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C30010E42A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269049; x=1753805049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GqLuUZLSpChhfHjvBVgNqr9h2IQ6o5GQ+OPT+ZYxesI=;
 b=hDG5Gcjl6gmEdnThX4sdxVMeQ5E8+9i6VZPKSNMMytWpb7OWDlRv8mx3
 KaYR2fGRgdAes7r5k7XFGcXTas7Xfz+SKcoGM38Q6DcBL54BWy9pJ9D+w
 GQpSXdPviweamtzYHSYSl5k9u6/m62MmZMSNSsgEHZATcZfEuZMnn3M04
 /ypsC9SplZoHsnlBnAFSun6RGkwbQsuu+j5M2D/wk8Q8ilOYHU1LrxwgL
 RSqxGHt5mAErSMEvXAFuOqKfKA6ybdWoHpUlGztYDDknRMsRZul1K+fRs
 dL+64wWIBRs9Vu+Vwya3ta0HqGSOwePUJK4G1X1Qko7dm4/yeRIdDnGuw g==;
X-CSE-ConnectionGUID: /MZDRF7aSCelbQAaKNpRtQ==
X-CSE-MsgGUID: xMK/9AOBSwS3QLKZNkhT1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427202"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427202"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:09 -0700
X-CSE-ConnectionGUID: 2xQ/IAsFQo2JZeTj6QJc/w==
X-CSE-MsgGUID: /qf3Wj8QTgyNXG5ShNNkWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53738471"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:06 -0700
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
Subject: [PATCH 34/66] tests/xe_eudebug: Add vm-bind-clear test
Date: Mon, 29 Jul 2024 18:01:27 +0200
Message-Id: <20240729160159.37036-35-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
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

Port i915_debugger sanity check that fresh buffers we vm_bind into
the ppGTT are always clear.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Pawel Sikora <pawel.sikora@intel.com>
---
 tests/intel/xe_eudebug.c | 276 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 276 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 1f4bb49af..edb76685e 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1977,6 +1977,279 @@ static void test_basic_ufence(int fd, unsigned int flags)
 	ufence_priv_destroy(priv);
 }
 
+struct vm_bind_clear_thread_priv {
+	struct drm_xe_engine_class_instance *hwe;
+	struct xe_eudebug_client *c;
+	pthread_t thread;
+	uint64_t region;
+	unsigned long sum;
+};
+
+struct vm_bind_clear_priv {
+	unsigned long unbind_count;
+	unsigned long bind_count;
+	unsigned long sum;
+};
+
+static struct vm_bind_clear_priv *vm_bind_clear_priv_create(void)
+{
+	struct vm_bind_clear_priv *priv;
+
+	priv = mmap(0, ALIGN(sizeof(*priv), PAGE_SIZE),
+		    PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	igt_assert(priv);
+	memset(priv, 0, sizeof(*priv));
+
+	return priv;
+}
+
+static void vm_bind_clear_priv_destroy(struct vm_bind_clear_priv *priv)
+{
+	munmap(priv, ALIGN(sizeof(*priv), PAGE_SIZE));
+}
+
+static void *vm_bind_clear_thread(void *data)
+{
+	const uint32_t CS_GPR0 = 0x600;
+	const size_t batch_size = 16;
+	struct drm_xe_sync uf_sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	};
+	struct vm_bind_clear_thread_priv *priv = data;
+	int fd = xe_eudebug_client_open_driver(priv->c);
+	uint32_t gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
+	uint32_t vm = xe_eudebug_client_vm_create(priv->c, fd, 0, 0);
+	size_t bo_size = xe_bb_size(fd, batch_size);
+	unsigned long count = 0;
+	uint64_t *fence_data;
+
+	/* init uf_sync */
+	fence_data = aligned_alloc(xe_get_default_alignment(fd), sizeof(*fence_data));
+	igt_assert(fence_data);
+	uf_sync.timeline_value = 1337;
+	uf_sync.addr = to_user_pointer(fence_data);
+
+	igt_debug("Run on: %s%u\n", xe_engine_class_string(priv->hwe->engine_class),
+		  priv->hwe->engine_instance);
+
+	igt_until_timeout(5) {
+		struct drm_xe_exec_queue_create eq_create = { 0 };
+		uint32_t clean_bo = 0;
+		uint32_t batch_bo = 0;
+		uint64_t clean_offset, batch_offset;
+		uint32_t exec_queue;
+		uint32_t *map, *cs;
+		uint64_t delta;
+
+		/* calculate offsets (vma addresses) */
+		batch_offset = (random() * SZ_2M) & (gtt_size - 1);
+		/* XXX: for some platforms/memory regions batch offset '0' can be problematic */
+		if (batch_offset == 0)
+			batch_offset = SZ_2M;
+
+		do {
+			clean_offset = (random() * SZ_2M) & (gtt_size - 1);
+			if (clean_offset == 0)
+				clean_offset = SZ_2M;
+		} while (clean_offset == batch_offset);
+
+		batch_offset += random() % SZ_2M & -bo_size;
+		clean_offset += random() % SZ_2M & -bo_size;
+
+		delta = (random() % bo_size) & -4;
+
+		/* prepare clean bo */
+		clean_bo = xe_bo_create(fd, vm, bo_size, priv->region,
+					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		memset(fence_data, 0, sizeof(*fence_data));
+		xe_eudebug_client_vm_bind_flags(priv->c, fd, vm, clean_bo, 0, clean_offset, bo_size,
+						0, &uf_sync, 1, 0);
+		xe_wait_ufence(fd, fence_data, uf_sync.timeline_value, 0,
+			       MS_TO_NS(XE_EUDEBUG_DEFAULT_TIMEOUT_MS));
+
+		/* prepare batch bo */
+		batch_bo = xe_bo_create(fd, vm, bo_size, priv->region,
+					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		memset(fence_data, 0, sizeof(*fence_data));
+		xe_eudebug_client_vm_bind_flags(priv->c, fd, vm, batch_bo, 0, batch_offset, bo_size,
+						0, &uf_sync, 1, 0);
+		xe_wait_ufence(fd, fence_data, uf_sync.timeline_value, 0,
+			       MS_TO_NS(XE_EUDEBUG_DEFAULT_TIMEOUT_MS));
+
+		map = xe_bo_map(fd, batch_bo, bo_size);
+
+		cs = map;
+		*cs++ = MI_NOOP | 0xc5a3;
+		*cs++ = MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
+		*cs++ = CS_GPR0;
+		*cs++ = clean_offset + delta;
+		*cs++ = (clean_offset + delta) >> 32;
+		*cs++ = MI_STORE_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
+		*cs++ = CS_GPR0;
+		*cs++ = batch_offset;
+		*cs++ = batch_offset >> 32;
+		*cs++ = MI_BATCH_BUFFER_END;
+
+		/* execute batch */
+		eq_create.width = 1;
+		eq_create.num_placements = 1;
+		eq_create.vm_id = vm;
+		eq_create.instances = to_user_pointer(priv->hwe);
+		exec_queue = xe_eudebug_client_exec_queue_create(priv->c, fd, &eq_create);
+		xe_exec_wait(fd, exec_queue, batch_offset);
+
+		igt_assert_eq(*map, 0);
+
+		/* cleanup */
+		xe_eudebug_client_exec_queue_destroy(priv->c, fd, &eq_create);
+		munmap(map, bo_size);
+
+		xe_eudebug_client_vm_unbind(priv->c, fd, vm, 0, batch_offset, bo_size);
+		gem_close(fd, batch_bo);
+
+		xe_eudebug_client_vm_unbind(priv->c, fd, vm, 0, clean_offset, bo_size);
+		gem_close(fd, clean_bo);
+
+		count++;
+	}
+
+	priv->sum = count;
+
+	free(fence_data);
+	xe_eudebug_client_close_driver(priv->c, fd);
+	return NULL;
+}
+
+static void vm_bind_clear_client(struct xe_eudebug_client *c)
+{
+	int fd = xe_eudebug_client_open_driver(c);
+	struct xe_device *xe_dev = xe_device_get(fd);
+	int count = xe_number_engines(fd) * xe_dev->mem_regions->num_mem_regions;
+	uint64_t memreg = all_memory_regions(fd);
+	struct vm_bind_clear_priv *priv = c->ptr;
+	int current = 0;
+	struct drm_xe_engine_class_instance *engine;
+	struct vm_bind_clear_thread_priv *threads;
+	uint64_t region;
+
+	threads = calloc(count, sizeof(*threads));
+	igt_assert(threads);
+	priv->sum = 0;
+
+	xe_for_each_mem_region(fd, memreg, region) {
+		xe_for_each_engine(fd, engine) {
+			threads[current].c = c;
+			threads[current].hwe = engine;
+			threads[current].region = region;
+
+			pthread_create(&threads[current].thread, NULL,
+				       vm_bind_clear_thread, &threads[current]);
+			current++;
+		}
+	}
+
+	for (current = 0; current < count; current++)
+		pthread_join(threads[current].thread, NULL);
+
+	xe_for_each_mem_region(fd, memreg, region) {
+		unsigned long sum = 0;
+
+		for (current = 0; current < count; current++)
+			if (threads[current].region == region)
+				sum += threads[current].sum;
+
+		igt_info("%s sampled %lu objects\n", xe_region_name(region), sum);
+		priv->sum += sum;
+	}
+
+	free(threads);
+	xe_device_put(fd);
+	xe_eudebug_client_close_driver(c, fd);
+}
+
+static void vm_bind_clear_test_trigger(struct xe_eudebug_debugger *d,
+				       struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_vm_bind_op *eo = (void *)e;
+	struct vm_bind_clear_priv *priv = d->ptr;
+
+	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
+		if (random() & 1) {
+			struct drm_xe_eudebug_vm_open vo = { 0, };
+			uint32_t v = 0xc1c1c1c1;
+
+			struct drm_xe_eudebug_event_vm_bind *eb;
+			int fd, delta, r;
+
+			igt_debug("vm bind op event received with ref %lld, addr 0x%llx, range 0x%llx\n",
+				eo->vm_bind_ref_seqno,
+				eo->addr,
+				eo->range);
+
+			eb = (struct drm_xe_eudebug_event_vm_bind *)
+				xe_eudebug_event_log_find_seqno(d->log, eo->vm_bind_ref_seqno);
+			igt_assert(eb);
+
+			vo.client_handle = eb->client_handle;
+			vo.vm_handle = eb->vm_handle;
+
+			fd = igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
+			igt_assert_lte(0, fd);
+
+			delta = (random() % eo->range) & -4;
+			r = pread(fd, &v, sizeof(v), eo->addr + delta);
+			igt_assert_eq(r, sizeof(v));
+			igt_assert_eq_u32(v, 0);
+
+			close(fd);
+		}
+		priv->bind_count++;
+	}
+
+	if (e->flags & DRM_XE_EUDEBUG_EVENT_DESTROY)
+		priv->unbind_count++;
+}
+
+static void vm_bind_clear_ack_trigger(struct xe_eudebug_debugger *d,
+				      struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_vm_bind_ufence *ef = (void *)e;
+
+	xe_eudebug_ack_ufence(d->fd, ef);
+}
+
+/**
+ * SUBTEST: vm-bind-clear
+ * Description:
+ *      Check that fresh buffers we vm_bind into the ppGTT are always clear.
+ */
+static void test_vm_bind_clear(int fd)
+{
+	struct vm_bind_clear_priv *priv;
+	struct xe_eudebug_session *s;
+
+	priv = vm_bind_clear_priv_create();
+	s = xe_eudebug_session_create(fd, vm_bind_clear_client, 0, priv);
+
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
+					vm_bind_clear_test_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					vm_bind_clear_ack_trigger);
+
+	igt_assert_eq(xe_eudebug_debugger_attach(s->d, s->c), 0);
+	xe_eudebug_debugger_start_worker(s->d);
+	xe_eudebug_client_start(s->c);
+
+	xe_eudebug_client_wait_done(s->c);
+	xe_eudebug_debugger_stop_worker(s->d, 1);
+
+	igt_assert_eq(priv->bind_count, priv->unbind_count);
+	igt_assert_eq(priv->sum * 2, priv->bind_count);
+
+	xe_eudebug_session_destroy(s);
+	vm_bind_clear_priv_destroy(priv);
+}
+
 igt_main
 {
 	bool was_enabled;
@@ -2033,6 +2306,9 @@ igt_main
 	igt_subtest("basic-vm-bind-ufence")
 		test_basic_ufence(fd, 0);
 
+	igt_subtest("vm-bind-clear")
+		test_vm_bind_clear(fd);
+
 	igt_subtest("basic-vm-bind-discovery")
 		test_basic_discovery(fd, VM_BIND, true);
 
-- 
2.34.1

