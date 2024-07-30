Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B33C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B07310E50E;
	Tue, 30 Jul 2024 11:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJksjbHT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B1910E50E
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340195; x=1753876195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ehuRw7XBrn+A9XjYcclXuVY846TofzKNGq2WmrtqYHI=;
 b=mJksjbHTqTp41BFG500fGJK9eKwwnk9heIQo4gWc/d9XGSRAREu7Si/x
 PIrIDfEd5SL08SOLvy3/dPCJrpYFJ7UOsUXzh3Pi9IzZSqXwgmZucPiGf
 Pcct4wdqu1OaOxT5DmkEBUXlwUOCcZUTjS2Xo+PSV0NcBkNOVNWQMzrrM
 iOEvz+iBZav3W8LvFyJOFth9LideG4+JKhKVb/BifqVi6q1lxyZQKDmo+
 Z0lOcDlUUrmoPbjxpFIZ7+ly78X8JKKtPf3p52MHdQVrgvo+X/9QSu0zp
 7bgOhca8NrF8NpH/0eYyxWlL9NzuPUoCD+uGlLRScHJEJmDsztQs9eueC g==;
X-CSE-ConnectionGUID: 7kygvRERRjmyLWdrlkdmUQ==
X-CSE-MsgGUID: S/8bwp7pQAaPLT1uCUIG2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20286787"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20286787"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:55 -0700
X-CSE-ConnectionGUID: aZUkTy+hRh2QFKgmyKYZQw==
X-CSE-MsgGUID: aja/+4R7QGiDd2CVVsmE3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217771"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:52 -0700
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
Subject: [PATCH i-g-t v2 64/66] tests/xe_eudebug_online: Add multisession test
 cases
Date: Tue, 30 Jul 2024 13:45:21 +0200
Message-Id: <20240730114523.334156-65-christoph.manszewski@intel.com>
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

From: Karolina Stolarek <karolina.stolarek@intel.com>

Add subtests where we run many sessions, either on a single or
multiple tiles. Extract a macro that selects compute or render
engine from the same GT so it can be used in a helper.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug_online.c | 208 +++++++++++++++++++++++++++++++-
 1 file changed, 202 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 864591a34..ab1a57d9b 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -29,6 +29,7 @@
 #define SHADER_CACHING_SRAM		(1 << 6)
 #define SHADER_CACHING_VRAM		(1 << 7)
 #define DISABLE_LONG_RUNNING_MODE	(1 << 8)
+#define SHADER_MIN_THREADS		(1 << 9)
 #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
 #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
 #define TRIGGER_RECONNECT		(1 << 27)
@@ -56,6 +57,7 @@
 #define SIMD_SIZE		16
 
 #define STARTUP_TIMEOUT_MS	3000
+#define WORKLOAD_DELAY_US	(5000 * 1000)
 
 #define PAGE_SIZE 4096
 
@@ -109,6 +111,9 @@ static struct intel_buf *create_uc_buf(int fd, int width, int height)
 
 static int get_number_of_threads(uint64_t flags)
 {
+	if (flags & SHADER_MIN_THREADS)
+		return 16;
+
 	if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
 		     TRIGGER_RESUME_PARALLEL_WALK | SHADER_CACHING_SRAM | SHADER_CACHING_VRAM))
 		return 32;
@@ -342,6 +347,7 @@ struct online_debug_data {
 	int stepped_threads_count;
 	struct timespec exception_arrived;
 	int last_eu_control_seqno;
+	struct drm_xe_eudebug_event *exception_event;
 };
 
 static struct online_debug_data *
@@ -561,6 +567,19 @@ static int get_stepped_threads_count(struct online_debug_data *data, int threads
 	return count;
 }
 
+static void save_first_exception_trigger(struct xe_eudebug_debugger *d,
+					 struct drm_xe_eudebug_event *e)
+{
+	struct online_debug_data *data = d->ptr;
+
+	pthread_mutex_lock(&data->mutex);
+	if (!data->exception_event) {
+		igt_gettime(&data->exception_arrived);
+		data->exception_event = igt_memdup(e, e->len);
+	}
+	pthread_mutex_unlock(&data->mutex);
+}
+
 #define MAX_PREEMPT_TIMEOUT 10ull
 static int is_client_resumed;
 static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
@@ -1768,22 +1787,193 @@ static void test_caching(int fd, struct drm_xe_engine_class_instance *hwe, int f
 	online_debug_data_destroy(data);
 }
 
+static int wait_for_exception(struct online_debug_data *data, int timeout)
+{
+	int ret = -ETIMEDOUT;
+
+	igt_for_milliseconds(timeout) {
+		pthread_mutex_lock(&data->mutex);
+		if ((data->exception_arrived.tv_sec |
+		     data->exception_arrived.tv_nsec) != 0)
+			ret = 0;
+		pthread_mutex_unlock(&data->mutex);
+
+		if (!ret)
+			break;
+		usleep(1000);
+	}
+
+	return ret;
+}
+
+#define is_compute_on_gt(__e, __gt) ((__e->engine_class == DRM_XE_ENGINE_CLASS_RENDER || \
+				      __e->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) && \
+				      __e->gt_id == __gt)
+
+struct xe_engine_list_entry {
+	struct igt_list_head link;
+	struct drm_xe_engine_class_instance *hwe;
+};
+
+#define MAX_TILES	2
+static int find_suitable_engines(struct drm_xe_engine_class_instance *hwes[GEM_MAX_ENGINES],
+				 int fd, bool many_tiles)
+{
+	struct xe_device *xe_dev;
+	struct drm_xe_engine_class_instance *e;
+	struct xe_engine_list_entry *en, *tmp;
+	struct igt_list_head compute_engines[MAX_TILES];
+	int gt_id;
+	int tile_id, i, engine_count = 0, tile_count = 0;
+
+	xe_dev = xe_device_get(fd);
+
+	for (i = 0; i < MAX_TILES; i++)
+		IGT_INIT_LIST_HEAD(&compute_engines[i]);
+
+	xe_for_each_gt(fd, gt_id) {
+		xe_for_each_engine(fd, e) {
+			if (is_compute_on_gt(e, gt_id)) {
+				tile_id = xe_dev->gt_list->gt_list[gt_id].tile_id;
+
+				en = malloc(sizeof(struct xe_engine_list_entry));
+				en->hwe = e;
+
+				igt_list_add_tail(&en->link, &compute_engines[tile_id]);
+			}
+		}
+	}
+
+	for (i = 0; i < MAX_TILES; i++) {
+		if (igt_list_empty(&compute_engines[i]))
+			continue;
+
+		if (many_tiles) {
+			en = igt_list_first_entry(&compute_engines[i], en, link);
+			hwes[engine_count++] = en->hwe;
+			tile_count++;
+		} else {
+			if (igt_list_length(&compute_engines[i]) > 1) {
+				igt_list_for_each_entry(en, &compute_engines[i], link)
+					hwes[engine_count++] = en->hwe;
+				break;
+			}
+		}
+	}
+
+	for (i = 0; i < MAX_TILES; i++) {
+		igt_list_for_each_entry_safe(en, tmp, &compute_engines[i], link) {
+			igt_list_del(&en->link);
+			free(en);
+		}
+	}
+
+	if (many_tiles)
+		igt_require_f(tile_count > 1, "Mulit-tile scenario requires more tiles\n");
+
+	return engine_count;
+}
+
+/**
+ * SUBTEST: breakpoint-many-sessions-single-tile
+ * Description:
+ *	Schedules EU workload with preinstalled breakpoint on every compute engine
+ *	available on the tile. Checks if the contexts hit breakpoint in sequence
+ *	and resumes them.
+ *
+ * SUBTEST: breakpoint-many-sessions-tiles
+ * Description:
+ *	Schedules EU workload with preinstalled breakpoint on selected compute
+ *      engines, with one per tile. Checks if each context hit breakpoint and
+ *      resumes them.
+ */
+static void test_many_sessions_on_tiles(int fd, bool multi_tile)
+{
+	int n = 0, flags = SHADER_BREAKPOINT | SHADER_MIN_THREADS;
+	struct xe_eudebug_session *s[GEM_MAX_ENGINES] = {};
+	struct online_debug_data *data[GEM_MAX_ENGINES] = {};
+	struct drm_xe_engine_class_instance *hwe[GEM_MAX_ENGINES] = {};
+	struct drm_xe_eudebug_event_eu_attention *eus;
+	uint64_t current_t, next_t, diff;
+	int i;
+
+	n = find_suitable_engines(hwe, fd, multi_tile);
+
+	igt_require_f(n > 1, "Test requires at least two parallel compute engines!\n");
+
+	for (i = 0; i < n; i++) {
+		data[i] = online_debug_data_create(hwe[i]);
+		s[i] = xe_eudebug_session_create(fd, run_online_client, flags, data[i]);
+
+		xe_eudebug_debugger_add_trigger(s[i]->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+						eu_attention_debug_trigger);
+		xe_eudebug_debugger_add_trigger(s[i]->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+						save_first_exception_trigger);
+		xe_eudebug_debugger_add_trigger(s[i]->d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+						ufence_ack_trigger);
+
+		igt_assert_eq(xe_eudebug_debugger_attach(s[i]->d, s[i]->c), 0);
+
+		xe_eudebug_debugger_start_worker(s[i]->d);
+		xe_eudebug_client_start(s[i]->c);
+	}
+
+	for (i = 0; i < n; i++) {
+		/* XXX: Sometimes racy, expects clients to execute in sequence */
+		igt_assert(!wait_for_exception(data[i], STARTUP_TIMEOUT_MS));
+
+		eus = (struct drm_xe_eudebug_event_eu_attention *)data[i]->exception_event;
+
+		/* Delay all but the last workload to check serialization */
+		if (i < n - 1)
+			usleep(WORKLOAD_DELAY_US);
+
+		eu_ctl_resume(s[i]->d->master_fd, s[i]->d->fd,
+			      eus->client_handle, eus->exec_queue_handle,
+			      eus->lrc_handle, eus->bitmask, eus->bitmask_size);
+		free(eus);
+	}
+
+	for (i = 0; i < n - 1; i++) {
+		/* Convert timestamps to microseconds */
+		current_t = data[i]->exception_arrived.tv_nsec * 1000;
+		next_t = data[i + 1]->exception_arrived.tv_nsec * 1000;
+		diff = current_t < next_t ? next_t - current_t : current_t - next_t;
+
+		if (multi_tile)
+			igt_assert_f(diff < WORKLOAD_DELAY_US,
+				     "Expected to execute workloads concurrently. Actual delay: %lu ms\n",
+				     diff);
+		else
+			igt_assert_f(diff >= WORKLOAD_DELAY_US,
+				     "Expected a serialization of workloads. Actual delay: %lu ms\n",
+				     diff);
+	}
+
+	for (i = 0; i < n; i++) {
+		xe_eudebug_client_wait_done(s[i]->c);
+		xe_eudebug_debugger_stop_worker(s[i]->d, 1);
+
+		xe_eudebug_event_log_print(s[i]->d->log, true);
+		online_session_check(s[i], flags);
+
+		xe_eudebug_session_destroy(s[i]);
+		online_debug_data_destroy(data[i]);
+	}
+}
+
 static struct drm_xe_engine_class_instance *pick_compute(int fd, int gt)
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int count = 0;
 
-	#define match(__e) ((__e->engine_class == DRM_XE_ENGINE_CLASS_RENDER || \
-			     __e->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) && __e->gt_id == gt)
-
 	xe_for_each_engine(fd, hwe)
-		if (match(hwe))
+		if (is_compute_on_gt(hwe, gt))
 			count++;
 
 	xe_for_each_engine(fd, hwe)
-		if (match(hwe) && rand() % count-- == 0)
+		if (is_compute_on_gt(hwe, gt) && rand() % count-- == 0)
 			return hwe;
-	#undef match
 
 	return NULL;
 }
@@ -1863,6 +2053,12 @@ igt_main
 	test_gt_render_or_compute("writes-caching-vram", fd, hwe)
 		test_caching(fd, hwe, SHADER_CACHING_VRAM);
 
+	igt_subtest("breakpoint-many-sessions-single-tile")
+		test_many_sessions_on_tiles(fd, false);
+
+	igt_subtest("breakpoint-many-sessions-tiles")
+		test_many_sessions_on_tiles(fd, true);
+
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
 
-- 
2.34.1

