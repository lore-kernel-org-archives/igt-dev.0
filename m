Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C64C25B74
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 06:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15E6112AE2;
	Sat,  4 May 2024 06:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OE5/1HUA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B048E112ADB
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714805159; x=1746341159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ljrXCw/pQJfxIAnOUyMRw4gyqqTaUHzOEIMSN5ExapQ=;
 b=OE5/1HUAHdHTEhEgZ7+7uuPtJLt6jEYvA9n1/QFF+R1sTu9Mr7xaqcYl
 JtmeASsvwl7biUfOWAaBC98RO4qzA9/9fSLnIiEDbPNu3CqvAAQR9UMbI
 D+ONwNpoKf1sHSn+FnLSyo2gvcp6fW8DUDHQTLw/zUMh2VMVx+VYKS7Ts
 /A7KFzCva9sfzxaFgRsS9x2/9tM8BJ8EYuUv0NY+mlfjvgY9tYJYZKvoD
 nESO73BRhrjIwtvS+IOs4qS2BAKM/KdItFDsXPThBvKjCkFdXLmfLUtok
 1WByC8CBGtNsgVr3qe5lLRsmI3H0O67ZnL1WhcF8u227hAXcvykZHTfuT w==;
X-CSE-ConnectionGUID: RtivczfATb2IsRVO8VShsw==
X-CSE-MsgGUID: QsVi+wOlRPCU7MHwZGdJHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10545759"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10545759"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:58 -0700
X-CSE-ConnectionGUID: Wx1HC9oPTq6KWWAqrEZFYw==
X-CSE-MsgGUID: WN/3Lf2DTJunrINCehQIZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="32169815"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 08/13] treewide: Rename engine busyness variables
Date: Fri,  3 May 2024 23:46:38 -0700
Message-ID: <20240504064643.25863-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504064643.25863-1-lucas.demarchi@intel.com>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
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

In preparation to have more possible ways to calculate engine
busyness/utilization, rename variables related to the current way: it's
reading the "engine time in nsec" spent by the client on each engine.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_clients.c    | 28 +++++++++++++------------
 lib/igt_drm_clients.h    |  8 ++++----
 lib/igt_drm_fdinfo.c     |  6 +++---
 lib/igt_drm_fdinfo.h     |  2 +-
 tests/intel/drm_fdinfo.c | 44 ++++++++++++++++++++--------------------
 tools/gputop.c           |  8 ++++----
 tools/intel_gpu_top.c    | 24 +++++++++++-----------
 7 files changed, 61 insertions(+), 59 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index ab0c2cec2..3f4265015 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -103,19 +103,19 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 
 	/* Engines */
 
-	c->last_runtime = 0;
-	c->total_runtime = 0;
+	c->agg_delta_engine_time = 0;
+	c->total_engine_time = 0;
 
 	for (i = 0; i <= c->engines->max_engine_id; i++) {
-		assert(i < ARRAY_SIZE(info->busy));
+		assert(i < ARRAY_SIZE(info->engine_time));
 
-		if (info->busy[i] < c->last[i])
+		if (info->engine_time[i] < c->last_engine_time[i])
 			continue; /* It will catch up soon. */
 
-		c->total_runtime += info->busy[i];
-		c->val[i] = info->busy[i] - c->last[i];
-		c->last_runtime += c->val[i];
-		c->last[i] = info->busy[i];
+		c->total_engine_time += info->engine_time[i];
+		c->delta_engine_time[i] = info->engine_time[i] - c->last_engine_time[i];
+		c->agg_delta_engine_time += c->delta_engine_time[i];
+		c->last_engine_time[i] = info->engine_time[i];
 	}
 
 	/* Memory regions */
@@ -183,9 +183,11 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 		c->engines->max_engine_id = i;
 	}
 
-	c->val = calloc(c->engines->max_engine_id + 1, sizeof(*c->val));
-	c->last = calloc(c->engines->max_engine_id + 1, sizeof(*c->last));
-	assert(c->val && c->last);
+	c->delta_engine_time = calloc(c->engines->max_engine_id + 1,
+			       sizeof(*c->delta_engine_time));
+	c->last_engine_time = calloc(c->engines->max_engine_id + 1,
+			      sizeof(*c->last_engine_time));
+	assert(c->delta_engine_time && c->last_engine_time);
 
 	/* Memory regions */
 	c->regions = calloc(1, sizeof(*c->regions));
@@ -223,8 +225,8 @@ void igt_drm_client_free(struct igt_drm_client *c, bool clear)
 	}
 	free(c->engines);
 
-	free(c->val);
-	free(c->last);
+	free(c->delta_engine_time);
+	free(c->last_engine_time);
 
 	if (c->regions) {
 		for (i = 0; i <= c->regions->max_region_id; i++)
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 52888aedc..f2ff13182 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -63,10 +63,10 @@ struct igt_drm_client {
 	char name[24]; /* Process name of the owning PID. */
 	char print_name[24]; /* Name without any non-printable characters. */
 	unsigned int samples; /* Count of times scanning updated this client. */
-	unsigned long total_runtime; /* Aggregate busyness on all engines since client start. */
-	unsigned long last_runtime; /* Aggregate busyness on all engines since previous scan. */
-	unsigned long *val; /* Array of engine busyness data, relative to previous scan. */
-	uint64_t *last; /* Array of engine busyness data as parsed from fdinfo. */
+	unsigned long total_engine_time; /* Aggregate of @agg_delta_engine_time, i.e. engine time on all engines since client start. */
+	unsigned long agg_delta_engine_time; /* Aggregate of @delta_engine_time, i.e. engine time on all engines since previous scan. */
+	unsigned long *delta_engine_time; /* Array of engine time data, relative to previous scan. */
+	uint64_t *last_engine_time; /* Array of engine time data as parsed from fdinfo. */
 	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
 };
 
diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 79b72c54d..9deeadd4e 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -190,10 +190,10 @@ out:
 		}							\
 	} while (0)
 
-#define UPDATE_ENGINE(idx, engine, val, utilization_key)		\
+#define UPDATE_ENGINE(idx, member, val, utilization_key)		\
 	do {								\
 		if (idx >= 0) {						\
-			info->engine[idx] = val;			\
+			info->member[idx] = val;			\
 			info->utilization_mask |= utilization_key;	\
 			if (!info->capacity[idx])			\
 					info->capacity[idx] = 1;	\
@@ -260,7 +260,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 		} else if (strstartswith(l, "drm-engine-", &keylen)) {
 			idx = parse_engine(l + keylen, info,
 					   name_map, map_entries, &val);
-			UPDATE_ENGINE(idx, busy, val, DRM_FDINFO_UTILIZATION_ENGINE_TIME);
+			UPDATE_ENGINE(idx, engine_time, val, DRM_FDINFO_UTILIZATION_ENGINE_TIME);
 		} else if (strstartswith(l, "drm-cycles-", &keylen)) {
 			idx = parse_engine(l + keylen, info,
 					   name_map, map_entries, &val);
diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
index 3f641d79d..ea90edd79 100644
--- a/lib/igt_drm_fdinfo.h
+++ b/lib/igt_drm_fdinfo.h
@@ -60,7 +60,7 @@ struct drm_client_fdinfo {
 	unsigned int utilization_mask;
 
 	/* drm-engine-<engine> values */
-	uint64_t busy[DRM_CLIENT_FDINFO_MAX_ENGINES];
+	uint64_t engine_time[DRM_CLIENT_FDINFO_MAX_ENGINES];
 	/* drm-cycles-<engine> values */
 	uint64_t cycles[DRM_CLIENT_FDINFO_MAX_ENGINES];
 
diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
index 61c66079e..2d155180f 100644
--- a/tests/intel/drm_fdinfo.c
+++ b/tests/intel/drm_fdinfo.c
@@ -192,14 +192,14 @@ static void end_spin(int fd, igt_spin_t *spin, unsigned int flags)
 	}
 }
 
-static uint64_t read_busy(int i915, unsigned int class)
+static uint64_t read_engine_time(int i915, unsigned int class)
 {
 	struct drm_client_fdinfo info = { };
 
 	igt_assert(igt_parse_drm_fdinfo(i915, &info, engine_map,
 					ARRAY_SIZE(engine_map), NULL, 0));
 
-	return info.busy[class];
+	return info.engine_time[class];
 }
 
 static void
@@ -229,11 +229,11 @@ single(int gem_fd, const intel_ctx_t *ctx,
 	else
 		spin = NULL;
 
-	val = read_busy(gem_fd, e->class);
+	val = read_engine_time(gem_fd, e->class);
 	slept = measured_usleep(batch_duration_ns / 1000);
 	if (flags & TEST_TRAILING_IDLE)
 		end_spin(spin_fd, spin, flags);
-	val = read_busy(gem_fd, e->class) - val;
+	val = read_engine_time(gem_fd, e->class) - val;
 
 	if (flags & FLAG_HANG)
 		igt_force_gpu_reset(spin_fd);
@@ -250,9 +250,9 @@ single(int gem_fd, const intel_ctx_t *ctx,
 		gem_quiescent_gpu(spin_fd);
 		igt_assert(!gem_bo_busy(spin_fd, spin->handle));
 
-		val = read_busy(gem_fd, e->class);
+		val = read_engine_time(gem_fd, e->class);
 		slept = measured_usleep(batch_duration_ns / 1000);
-		val = read_busy(gem_fd, e->class) - val;
+		val = read_engine_time(gem_fd, e->class) - val;
 
 		assert_within_epsilon(val, 0, tolerance);
 	}
@@ -282,14 +282,14 @@ static void log_busy(unsigned int num_engines, uint64_t *val)
 	igt_info("%s", buf);
 }
 
-static void read_busy_all(int i915, uint64_t *val)
+static void read_engine_time_all(int i915, uint64_t *val)
 {
 	struct drm_client_fdinfo info = { };
 
 	igt_assert(igt_parse_drm_fdinfo(i915, &info, engine_map,
 					ARRAY_SIZE(engine_map), NULL, 0));
 
-	memcpy(val, info.busy, sizeof(info.busy));
+	memcpy(val, info.engine_time, sizeof(info.engine_time));
 }
 
 static void
@@ -312,11 +312,11 @@ busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 
 	spin = igt_sync_spin(gem_fd, ahnd, ctx, e);
 
-	read_busy_all(gem_fd, tval[0]);
+	read_engine_time_all(gem_fd, tval[0]);
 	slept = measured_usleep(batch_duration_ns / 1000);
 	if (flags & TEST_TRAILING_IDLE)
 		end_spin(gem_fd, spin, flags);
-	read_busy_all(gem_fd, tval[1]);
+	read_engine_time_all(gem_fd, tval[1]);
 
 	end_spin(gem_fd, spin, FLAG_SYNC);
 	igt_spin_free(gem_fd, spin);
@@ -388,11 +388,11 @@ most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 	/* Small delay to allow engines to start. */
 	usleep(__igt_sync_spin_wait(gem_fd, spin) * num_engines / 1e3);
 
-	read_busy_all(gem_fd, tval[0]);
+	read_engine_time_all(gem_fd, tval[0]);
 	slept = measured_usleep(batch_duration_ns / 1000);
 	if (flags & TEST_TRAILING_IDLE)
 		end_spin(gem_fd, spin, flags);
-	read_busy_all(gem_fd, tval[1]);
+	read_engine_time_all(gem_fd, tval[1]);
 
 	end_spin(gem_fd, spin, FLAG_SYNC);
 	igt_spin_free(gem_fd, spin);
@@ -443,11 +443,11 @@ all_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 	/* Small delay to allow engines to start. */
 	usleep(__igt_sync_spin_wait(gem_fd, spin) * num_engines / 1e3);
 
-	read_busy_all(gem_fd, tval[0]);
+	read_engine_time_all(gem_fd, tval[0]);
 	slept = measured_usleep(batch_duration_ns / 1000);
 	if (flags & TEST_TRAILING_IDLE)
 		end_spin(gem_fd, spin, flags);
-	read_busy_all(gem_fd, tval[1]);
+	read_engine_time_all(gem_fd, tval[1]);
 
 	end_spin(gem_fd, spin, FLAG_SYNC);
 	igt_spin_free(gem_fd, spin);
@@ -589,11 +589,11 @@ virtual(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
 			else
 				spin = NULL;
 
-			val = read_busy(i915, class);
+			val = read_engine_time(i915, class);
 			slept = measured_usleep(batch_duration_ns / 1000);
 			if (flags & TEST_TRAILING_IDLE)
 				end_spin(i915, spin, flags);
-			val = read_busy(i915, class) - val;
+			val = read_engine_time(i915, class) - val;
 
 			if (flags & FLAG_HANG)
 				igt_force_gpu_reset(i915);
@@ -610,10 +610,10 @@ virtual(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
 				gem_quiescent_gpu(i915);
 				igt_assert(!gem_bo_busy(i915, spin->handle));
 
-				val = read_busy(i915, class);
+				val = read_engine_time(i915, class);
 				slept = measured_usleep(batch_duration_ns /
 							1000);
-				val = read_busy(i915, class) - val;
+				val = read_engine_time(i915, class) - val;
 
 				assert_within_epsilon(val, 0, tolerance);
 			}
@@ -700,11 +700,11 @@ virtual_all(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
 		/* Small delay to allow engines to start. */
 		usleep(__igt_sync_spin_wait(i915, spin) * count / 1e3);
 
-		val = read_busy(i915, class);
+		val = read_engine_time(i915, class);
 		slept = measured_usleep(batch_duration_ns / 1000);
 		if (flags & TEST_TRAILING_IDLE)
 			end_spin(i915, spin, flags);
-		val = read_busy(i915, class) - val;
+		val = read_engine_time(i915, class) - val;
 
 		if (flags & FLAG_HANG)
 			igt_force_gpu_reset(i915);
@@ -718,10 +718,10 @@ virtual_all(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
 			gem_quiescent_gpu(i915);
 			igt_assert(!gem_bo_busy(i915, spin->handle));
 
-			val = read_busy(i915, class);
+			val = read_engine_time(i915, class);
 			slept = measured_usleep(batch_duration_ns /
 						1000);
-			val = read_busy(i915, class) - val;
+			val = read_engine_time(i915, class) - val;
 
 			assert_within_epsilon(val, 0, tolerance);
 		}
diff --git a/tools/gputop.c b/tools/gputop.c
index 8cec951b4..80bc94be4 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -176,7 +176,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 	int len;
 
 	/* Filter out idle clients. */
-	if (!c->total_runtime || c->samples < 2)
+	if (!c->total_engine_time || c->samples < 2)
 		return lines;
 
 	/* Print header when moving to a different DRM card. */
@@ -208,7 +208,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 		if (!c->engines->capacity[i])
 			continue;
 
-		pct = (double)c->val[i] / period_us / 1e3 * 100 /
+		pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100 /
 		      c->engines->capacity[i];
 
 		/*
@@ -257,8 +257,8 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
 	 * Within buckets sort by last sampling period aggregated runtime, with
 	 * client id as a tie-breaker.
 	 */
-	val_a = a->last_runtime;
-	val_b = b->last_runtime;
+	val_a = a->agg_delta_engine_time;
+	val_b = b->agg_delta_engine_time;
 	if (val_a == val_b)
 		return __client_id_cmp(a, b);
 	else if (val_b > val_a)
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 5b4f94d7d..35122493c 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -793,7 +793,7 @@ static int client_last_cmp(const void *_a, const void *_b, void *unused)
 {
 	const struct igt_drm_client *a = _a;
 	const struct igt_drm_client *b = _b;
-	long val_a = a->last_runtime, val_b = b->last_runtime;
+	long val_a = a->agg_delta_engine_time, val_b = b->agg_delta_engine_time;
 
 	/*
 	 * Sort clients in descending order of runtime in the previous sampling
@@ -812,7 +812,7 @@ static int client_total_cmp(const void *_a, const void *_b, void *unused)
 {
 	const struct igt_drm_client *a = _a;
 	const struct igt_drm_client *b = _b;
-	long val_a = a->total_runtime, val_b = b->total_runtime;
+	long val_a = a->total_engine_time, val_b = b->total_engine_time;
 
 	if (val_a == val_b)
 		return __client_id_cmp(a, b);
@@ -893,9 +893,9 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
 			strcpy(ac->pid_str, c->pid_str);
 			strcpy(ac->print_name, c->print_name);
 			ac->engines = c->engines;
-			ac->val = calloc(c->engines->max_engine_id + 1,
-					 sizeof(ac->val[0]));
-			assert(ac->val);
+			ac->delta_engine_time = calloc(c->engines->max_engine_id + 1,
+						sizeof(ac->delta_engine_time[0]));
+			assert(ac->delta_engine_time);
 			ac->regions = c->regions;
 			ac->memory = calloc(c->regions->max_region_id + 1,
 					    sizeof(ac->memory[0]));
@@ -908,11 +908,11 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
 			continue;
 
 		ac->samples = 2; /* All what matters for display. */
-		ac->total_runtime += c->total_runtime;
-		ac->last_runtime += c->last_runtime;
+		ac->total_engine_time += c->total_engine_time;
+		ac->agg_delta_engine_time += c->agg_delta_engine_time;
 
 		for (i = 0; i <= c->engines->max_engine_id; i++)
-			ac->val[i] += c->val[i];
+			ac->delta_engine_time[i] += c->delta_engine_time[i];
 
 		for (i = 0; i <= c->regions->max_region_id; i++) {
 			ac->memory[i].total += c->memory[i].total;
@@ -946,7 +946,7 @@ static void free_display_clients(struct igt_drm_clients *clients)
 	 * or borrowed fields which we don't want the library to try and free.
 	 */
 	igt_for_each_drm_client(clients, c, tmp) {
-		free(c->val);
+		free(c->delta_engine_time);
 		free(c->memory);
 	}
 
@@ -2120,7 +2120,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
 	int len;
 
 	if (output_mode == INTERACTIVE) {
-		if (filter_idle && (!c->total_runtime || c->samples < 2))
+		if (filter_idle && (!c->total_engine_time || c->samples < 2))
 			return lines;
 
 		lines++;
@@ -2161,7 +2161,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
 				continue;
 			}
 
-			pct = (double)c->val[i] / period_us / 1e3 * 100;
+			pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100;
 
 			/*
 			 * Guard against possible time-drift between sampling
@@ -2235,7 +2235,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
 					 iclients->classes.names[i]);
 				pops->open_struct(buf);
 
-				pct = (double)c->val[i] / period_us / 1e3 * 100;
+				pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100;
 				snprintf(buf, sizeof(buf), "%f", pct);
 				__json_add_member("busy", buf);
 
-- 
2.43.0

