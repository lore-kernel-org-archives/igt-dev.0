Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFA0C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9474610E514;
	Tue, 30 Jul 2024 11:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpbFOhtR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE5B10E514
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340098; x=1753876098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=67xos6slqTdf3TnOnmi5dcQMm4cxvSFhcZat6umxkSg=;
 b=cpbFOhtRfdVE9XNadbPmJxBQ00a9ZcmAchDWGhMCTdhFlJSFJQTnRzoy
 ZIR9JS9Jyp15ACtM8PheaV5tgGCre9cedqhMT79uIThJgtJO6rPeUV0lx
 J/vmQ9jAVxGDY2ha/Apciygn7CzYiVsP2bQ1xbLRVXiOMnLynP8CW6uh3
 zguKyvOiBnvR3T6evS9930i2nBPqomjWwCq8ASWeSMud31KS6Z+ZBURIL
 v8c4Wrf+//ra2d3nf1H7Lr8n922MbxVjBb6kN41RlfcnCN0MHp/9WpUx5
 46yDBl1WBpcr0fTiRpWRSSr2Wzg18BlqVHDxdjxfyYvc10V55Y/vlrj1k Q==;
X-CSE-ConnectionGUID: cnWELKhxRFWSQG7m/NHcNw==
X-CSE-MsgGUID: Hi/T8KWfRSKRourQC9MWlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937335"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937335"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:18 -0700
X-CSE-ConnectionGUID: e8mhn5jcRNK9zqyoCH3i5A==
X-CSE-MsgGUID: cxGenkH0SRO/1Wbgwq4flA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217011"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:14 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 32/66] tests/xe_eudebug: Add basic-vm-bind-ufence
Date: Tue, 30 Jul 2024 13:44:49 +0200
Message-Id: <20240730114523.334156-33-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

Add a basic test to check if ufence will be blocked and released
by debugger ack.

Signed-off-by: Mika Kuoppala <mika.kuoppala@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 214 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 214 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 1e9f16765..4bcca4fc6 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1757,6 +1757,217 @@ static void test_metadata_attach(int fd, unsigned int flags, int num_clients)
 				 NULL, true, 0);
 }
 
+#define STAGE_CLIENT_WAIT_ON_UFENCE_DONE 1337
+
+#define UFENCE_EVENT_COUNT_EXPECTED 4
+#define UFENCE_EVENT_COUNT_MAX 100
+
+struct ufence_bind {
+	struct drm_xe_sync f;
+	uint64_t addr;
+	uint64_t range;
+	uint64_t value;
+	struct {
+		uint64_t vm_sync;
+	} *fence_data;
+};
+
+static void basic_ufence_client(struct xe_eudebug_client *c)
+{
+	const int64_t default_fence_timeout_ns = MS_TO_NS(500);
+	const unsigned int n = UFENCE_EVENT_COUNT_EXPECTED;
+	int fd = xe_eudebug_client_open_driver(c);
+	uint32_t vm = xe_eudebug_client_vm_create(c, fd, 0, 0);
+	size_t bo_size = n * xe_get_default_alignment(fd);
+	uint32_t bo = xe_bo_create(fd, 0, bo_size,
+				   system_memory(fd), 0);
+	struct ufence_bind *binds;
+	int64_t timeout_ns;
+	int err;
+
+	binds = calloc(n, sizeof(*binds));
+	igt_assert(binds);
+
+	for (int i = 0; i < n; i++) {
+		struct ufence_bind *b = &binds[i];
+
+		b->range = 0x1000;
+		b->addr = 0x100000 + b->range * i;
+		b->fence_data = aligned_alloc(xe_get_default_alignment(fd),
+					      sizeof(*b->fence_data));
+		igt_assert(b->fence_data);
+		memset(b->fence_data, 0, sizeof(*b->fence_data));
+
+		b->f.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+		b->f.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+		b->f.addr = to_user_pointer(&b->fence_data->vm_sync);
+		b->f.timeline_value = UFENCE_EVENT_COUNT_EXPECTED + i;
+	}
+
+	for (int i = 0; i < n; i++) {
+		struct ufence_bind *b = &binds[i];
+
+		xe_eudebug_client_vm_bind_flags(c, fd, vm, bo, 0, b->addr, b->range, 0,
+						&b->f, 1, 0);
+	}
+
+	/* Ensure that wait on unacked ufence times out */
+	for (int i = 0; i < n; i++) {
+		struct ufence_bind *b = &binds[i];
+
+		timeout_ns = default_fence_timeout_ns;
+		err = __xe_wait_ufence(fd, &b->fence_data->vm_sync, b->f.timeline_value,
+				       0, &timeout_ns);
+		igt_assert_eq(err, -ETIME);
+		igt_assert_neq(b->fence_data->vm_sync, b->f.timeline_value);
+		igt_debug("wait #%d blocked on ack\n", i);
+	}
+
+	/* Wait on fence timed out, now tell the debugger to ack */
+	xe_eudebug_client_signal_stage(c, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
+
+	/* Check that ack unblocks ufence */
+	for (int i = 0; i < n; i++) {
+		struct ufence_bind *b = &binds[i];
+
+		timeout_ns = MS_TO_NS(XE_EUDEBUG_DEFAULT_TIMEOUT_MS);
+		err = __xe_wait_ufence(fd, &b->fence_data->vm_sync, b->f.timeline_value,
+				       0, &timeout_ns);
+		igt_assert_eq(err, 0);
+		igt_assert_eq(b->fence_data->vm_sync, b->f.timeline_value);
+		igt_debug("wait #%d completed\n", i);
+	}
+
+	for (int i = 0; i < n; i++) {
+		struct ufence_bind *b = &binds[i];
+
+		xe_eudebug_client_vm_unbind(c, fd, vm, 0, b->addr, b->range);
+	}
+
+	free(binds);
+	gem_close(fd, bo);
+	xe_eudebug_client_vm_destroy(c, fd, vm);
+	xe_eudebug_client_close_driver(c, fd);
+}
+
+struct ufence_priv {
+	struct drm_xe_eudebug_event_vm_bind_ufence ufence_events[UFENCE_EVENT_COUNT_MAX];
+	unsigned int ufence_event_count;
+	pthread_mutex_t mutex;
+};
+
+static struct ufence_priv *ufence_priv_create(void)
+{
+	struct ufence_priv *priv;
+
+	priv = mmap(0, ALIGN(sizeof(*priv), PAGE_SIZE),
+		    PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	igt_assert(priv);
+	memset(priv, 0, sizeof(*priv));
+	pthread_mutex_init(&priv->mutex, NULL);
+
+	return priv;
+}
+
+static void ufence_priv_destroy(struct ufence_priv *priv)
+{
+	munmap(priv, ALIGN(sizeof(*priv), PAGE_SIZE));
+}
+
+static void ack_fences(struct xe_eudebug_debugger *d)
+{
+	struct ufence_priv *priv = d->ptr;
+
+	for (int i = 0; i < priv->ufence_event_count; i++)
+		xe_eudebug_ack_ufence(d->fd, &priv->ufence_events[i]);
+}
+
+static void basic_ufence_trigger(struct xe_eudebug_debugger *d,
+				 struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_vm_bind_ufence *ef = (void *)e;
+	struct ufence_priv *priv = d->ptr;
+
+	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
+		char event_str[XE_EUDEBUG_EVENT_STRING_MAX_LEN];
+		struct drm_xe_eudebug_event_vm_bind *eb;
+
+		xe_eudebug_event_to_str(e, event_str, XE_EUDEBUG_EVENT_STRING_MAX_LEN);
+		igt_debug("ufence event received: %s\n", event_str);
+
+		xe_eudebug_assert_f(d, priv->ufence_event_count < UFENCE_EVENT_COUNT_EXPECTED,
+				    "surplus ufence event received: %s\n", event_str);
+		xe_eudebug_assert(d, ef->vm_bind_ref_seqno);
+
+		memcpy(&priv->ufence_events[priv->ufence_event_count++], ef, sizeof(*ef));
+
+		eb = (struct drm_xe_eudebug_event_vm_bind *)
+			xe_eudebug_event_log_find_seqno(d->log, ef->vm_bind_ref_seqno);
+		xe_eudebug_assert_f(d, eb, "vm bind event with seqno (%lld) not found\n",
+				    ef->vm_bind_ref_seqno);
+	}
+}
+
+static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
+{
+	int ret = -ETIMEDOUT;
+
+	igt_for_milliseconds(timeout_ms) {
+		pthread_mutex_lock(&priv->mutex);
+		if (priv->ufence_event_count == UFENCE_EVENT_COUNT_EXPECTED)
+			ret = 0;
+		pthread_mutex_unlock(&priv->mutex);
+
+		if (!ret)
+			break;
+		usleep(1000);
+	}
+
+	return ret;
+}
+
+/**
+ * SUBTEST: basic-vm-bind-ufence
+ * Description:
+ *      Give user fence in application and check if ufence ack works
+ */
+static void test_basic_ufence(int fd, unsigned int flags)
+{
+	struct xe_eudebug_debugger *d;
+	struct xe_eudebug_session *s;
+	struct xe_eudebug_client *c;
+	struct ufence_priv *priv;
+
+	priv = ufence_priv_create();
+	s = xe_eudebug_session_create(fd, basic_ufence_client, flags, priv);
+	c = s->c;
+	d = s->d;
+
+	xe_eudebug_debugger_add_trigger(d,
+					DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					basic_ufence_trigger);
+
+	igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
+	xe_eudebug_debugger_start_worker(d);
+	xe_eudebug_client_start(c);
+
+	xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
+	xe_eudebug_assert_f(d, wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_MS) == 0,
+			    "missing ufence events\n");
+	ack_fences(d);
+
+	xe_eudebug_client_wait_done(c);
+	xe_eudebug_debugger_stop_worker(d, 1);
+
+	xe_eudebug_event_log_print(d->log, true);
+	xe_eudebug_event_log_print(c->log, true);
+
+	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
+
+	xe_eudebug_session_destroy(s);
+	ufence_priv_destroy(priv);
+}
+
 igt_main
 {
 	bool was_enabled;
@@ -1809,6 +2020,9 @@ igt_main
 	igt_subtest("basic-vm-bind")
 		test_basic_sessions(fd, VM_BIND, 1, true);
 
+	igt_subtest("basic-vm-bind-ufence")
+		test_basic_ufence(fd, 0);
+
 	igt_subtest("basic-vm-bind-discovery")
 		test_basic_discovery(fd, VM_BIND, true);
 
-- 
2.34.1

