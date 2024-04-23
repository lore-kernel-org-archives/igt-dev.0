Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A06BC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 08:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D126310FEAB;
	Tue, 23 Apr 2024 08:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyiESq0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF2511322A
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 08:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713862686; x=1745398686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kOyEeJQhDUKpgPNt2PthumCrD/wnCAnc22jo5mwUFH0=;
 b=XyiESq0Fw1xBbcGgFbbA00sTAt5tMwF1cl6LTRq00Em6yFeL9fPRN0pi
 RYci+12K8KVfZdOZf4Vbu8LDBLOSe/USZEWKOhO1DQ39uhfCJVRPYIGKF
 aqBbDYiyPgg66l62SRszPnGF5BtHsrIIwz7TVbvRP1I54sQcSGR+bVnHN
 Kz3gxH9gUUwpL4zjhxAWsN5qzoaLla9xw/gu71C6Um+PnIzH+9PwST8CM
 bzqVmrVmBYkm9uNfZS72lMmkXUABGQPkg++7K8tL2mcZiRRurUE7lA71O
 0T0vTmQmNSO3r284Wb1Z8hTbIsL5iVNcyUDir/taGakLwvCPzYK3HWf4e g==;
X-CSE-ConnectionGUID: /8sH0m3qRRKyNqElpb09zw==
X-CSE-MsgGUID: Tb4xtPcoSFym3YVNpECjxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="26949854"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="26949854"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:58:06 -0700
X-CSE-ConnectionGUID: cqt5h2btQfGZLKYyhlSbwg==
X-CSE-MsgGUID: w0kxSvlmQzypbcRd21YVdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24822961"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:58:04 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: tvrtko.ursulin@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 i-g-t 5/6] benchmarks/gem_wsim: Extend engine selection
 syntax
Date: Tue, 23 Apr 2024 10:56:45 +0200
Message-Id: <20240423085646.6672-6-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240423085646.6672-1-marcin.bernatowicz@linux.intel.com>
References: <20240423085646.6672-1-marcin.bernatowicz@linux.intel.com>
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

This patch introduces a more flexible and detailed approach to
specifying engines.
The tool now dynamically generates a list of available physical engines
by querying the device, moving away from a static enumeration of engine
IDs.
Engines are now identified using [class:instance:gt] tuples.
This approach accommodates the specification of engine instances in the
format `engine_class[<engine_instance>-<gt_id>]`, enhancing the
granularity of engine selection, ex. First VCS engine may be specified
as VCS, VCS1, and VCS1-0.
The patch adds support for the compute engine class (CCS).
To maintain compatibility with existing workload definitions, the patch
ensures that 1-based engine instance IDs are preserved.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 641 +++++++++++++++++++++---------------------
 1 file changed, 320 insertions(+), 321 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 821746feb..effe8a479 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -68,17 +68,44 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_spin.h"
 
-enum intel_engine_id {
-	DEFAULT,
+enum intel_engine_class {
 	RCS,
 	BCS,
 	VCS,
-	VCS1,
-	VCS2,
 	VECS,
-	NUM_ENGINES
+	CCS,
+	NUM_ENGINE_CLASSES,
 };
 
+_Static_assert(RCS == DRM_XE_ENGINE_CLASS_RENDER, "mismatch");
+_Static_assert(BCS == DRM_XE_ENGINE_CLASS_COPY, "mismatch");
+_Static_assert(VCS == DRM_XE_ENGINE_CLASS_VIDEO_DECODE, "mismatch");
+_Static_assert(VECS == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE, "mismatch");
+_Static_assert(CCS == DRM_XE_ENGINE_CLASS_COMPUTE, "mismatch");
+_Static_assert((int)RCS == (int)I915_ENGINE_CLASS_RENDER, "mismatch");
+_Static_assert((int)BCS == (int)I915_ENGINE_CLASS_COPY, "mismatch");
+_Static_assert((int)VCS == (int)I915_ENGINE_CLASS_VIDEO, "mismatch");
+_Static_assert((int)VECS == (int)I915_ENGINE_CLASS_VIDEO_ENHANCE, "mismatch");
+_Static_assert((int)CCS == (int)I915_ENGINE_CLASS_COMPUTE, "mismatch");
+
+static const char *intel_engine_class_string(uint16_t engine_class)
+{
+	switch (engine_class) {
+	case RCS:
+		return "RCS";
+	case BCS:
+		return "BCS";
+	case VCS:
+		return "VCS";
+	case VECS:
+		return "VECS";
+	case CCS:
+		return "CCS";
+	default:
+		igt_assert(0);
+	}
+}
+
 struct duration {
 	unsigned int min, max;
 	bool unbound;
@@ -126,14 +153,19 @@ struct w_arg {
 	bool sseu;
 };
 
+#define INVALID_ID ((uint16_t)-2)
+#define DEFAULT_ID ((uint16_t)-1)
+
+typedef struct drm_xe_engine_class_instance intel_engine_t;
+
 struct intel_engines {
 	unsigned int nr_engines;
-	enum intel_engine_id *engines;
+	intel_engine_t *engines;
 };
 
 struct bond {
-	uint64_t mask;
-	enum intel_engine_id master;
+	struct intel_engines mask;
+	intel_engine_t master;
 };
 
 struct work_buffer_size {
@@ -158,7 +190,7 @@ struct w_step {
 	/* Workload step metadata */
 	enum w_type type;
 	unsigned int context;
-	unsigned int engine;
+	intel_engine_t engine;
 	unsigned int engine_idx;
 	struct duration duration;
 	struct deps data_deps;
@@ -264,8 +296,8 @@ struct workload {
 	int sync_timeline;
 	uint32_t sync_seqno;
 
-	struct igt_list_head requests[NUM_ENGINES];
-	unsigned int nrequest[NUM_ENGINES];
+	struct igt_list_head *requests;
+	unsigned int *nrequest;
 };
 
 #define __for_each_ctx(__ctx, __wrk, __ctx_idx) \
@@ -293,16 +325,6 @@ static struct drm_i915_gem_context_param_sseu device_sseu = {
 #define FLAG_DEPSYNC		(1<<2)
 #define FLAG_SSEU		(1<<3)
 
-static const char *ring_str_map[NUM_ENGINES] = {
-	[DEFAULT] = "DEFAULT",
-	[RCS] = "RCS",
-	[BCS] = "BCS",
-	[VCS] = "VCS",
-	[VCS1] = "VCS1",
-	[VCS2] = "VCS2",
-	[VECS] = "VECS",
-};
-
 static void w_step_sync(struct w_step *w)
 {
 	if (is_xe)
@@ -518,41 +540,100 @@ out:
 	} \
 }
 
-static int str_to_engine(const char *str)
-{
-	unsigned int i;
+/* engine_class[<engine_instance>-<gt_id>] */
+static intel_engine_t str_to_engine(const char *str)
+{
+	intel_engine_t e = {INVALID_ID, DEFAULT_ID, DEFAULT_ID};
+	size_t pos;
+
+	if (!strcasecmp("DEFAULT", str)) {
+		e.engine_class = DEFAULT_ID;
+		return e;
+	} else if (!strncasecmp("RCS", str, 3)) {
+		e.engine_class = RCS;
+		pos = 3;
+	} else if (!strncasecmp("BCS", str, 3)) {
+		e.engine_class = BCS;
+		pos = 3;
+	} else if (!strncasecmp("VCS", str, 3)) {
+		e.engine_class = VCS;
+		pos = 3;
+	} else if (!strncasecmp("VECS", str, 4)) {
+		e.engine_class = VECS;
+		pos = 4;
+	} else if (!strncasecmp("CCS", str, 3)) {
+		e.engine_class = CCS;
+		pos = 3;
+	} else
+		return (intel_engine_t){INVALID_ID};
+
+	if (str[pos]) {
+		char *s = strchr(&str[pos], '-');
+		char *endptr = NULL;
+		long id;
+
+		if (!s || (s && *s != str[pos])) {
+			id = strtol(&str[pos], &endptr, 10);
+			if (endptr == &str[pos] || id < 1 || id >= INVALID_ID)
+				return (intel_engine_t){INVALID_ID};
+			e.engine_instance = id - 1;
+		}
 
-	for (i = 0; i < ARRAY_SIZE(ring_str_map); i++) {
-		if (!strcasecmp(str, ring_str_map[i]))
-			return i;
+		if (s && *(++s)) {
+			id = strtol(s, &endptr, 10);
+			if (endptr == s || id < 0 || id >= INVALID_ID)
+				return (intel_engine_t){INVALID_ID};
+			e.gt_id = id;
+		}
+
+		if (endptr && endptr != (str + strlen(str)))
+			return (intel_engine_t){INVALID_ID};
 	}
 
-	return -1;
+	return e;
+}
+
+static struct i915_engine_class_instance
+engine_to_i915_engine_class(const intel_engine_t *engine)
+{
+	return (struct i915_engine_class_instance){ engine->engine_class,
+						    engine->engine_instance };
 }
 
 static unsigned int
-engine_to_i915_legacy_ring(const enum intel_engine_id *engine)
-{
-	static const unsigned int eb_engine_map[NUM_ENGINES] = {
-		[DEFAULT] = I915_EXEC_DEFAULT,
-		[RCS] = I915_EXEC_RENDER,
-		[BCS] = I915_EXEC_BLT,
-		[VCS] = I915_EXEC_BSD,
-		[VCS1] = I915_EXEC_BSD | I915_EXEC_BSD_RING1,
-		[VCS2] = I915_EXEC_BSD | I915_EXEC_BSD_RING2,
-		[VECS] = I915_EXEC_VEBOX
+engine_to_i915_legacy_ring(const intel_engine_t *engine)
+{
+	switch (engine->engine_class) {
+	case DEFAULT_ID:
+		return I915_EXEC_DEFAULT;
+	case RCS:
+		return I915_EXEC_RENDER;
+	case BCS:
+		return I915_EXEC_BLT;
+	case VCS:
+		if (engine->engine_instance == DEFAULT_ID)
+			return I915_EXEC_BSD;
+		else if (engine->engine_instance == 0)
+			return I915_EXEC_BSD | I915_EXEC_BSD_RING1;
+		else if (engine->engine_instance == 1)
+			return I915_EXEC_BSD | I915_EXEC_BSD_RING2;
+		break;
+	case VECS:
+		return I915_EXEC_VEBOX;
 	};
 
-	return eb_engine_map[*engine];
+	igt_assert(0);
 }
 
-static bool are_equal_engines(const enum intel_engine_id *e1,
-			      const enum intel_engine_id *e2)
+static bool are_equal_engines(const intel_engine_t *e1,
+			      const intel_engine_t *e2)
 {
-	return *e1 == *e2;
+	return e1->engine_class == e2->engine_class &&
+	       e1->engine_instance == e2->engine_instance &&
+	       e1->gt_id == e2->gt_id;
 }
 
-static bool find_engine_in_map(const enum intel_engine_id *engine,
+static bool find_engine_in_map(const intel_engine_t *engine,
 			       struct intel_engines *engines, unsigned int *idx)
 {
 	igt_assert(idx);
@@ -565,208 +646,156 @@ static bool find_engine_in_map(const enum intel_engine_id *engine,
 	return false;
 }
 
-static struct intel_engine_data *query_engines(void)
+static struct intel_engines *query_engines(void)
 {
-	static struct intel_engine_data engines = {};
+	static struct intel_engines engines = {};
 
-	if (engines.nengines)
+	if (engines.nr_engines)
 		return &engines;
 
 	if (is_xe) {
 		struct drm_xe_engine_class_instance *hwe;
 
-		xe_for_each_engine(fd, hwe) {
-			engines.engines[engines.nengines].class = hwe->engine_class;
-			engines.engines[engines.nengines].instance = hwe->engine_instance;
-			engines.nengines++;
+		engines.engines = calloc(xe_number_engines(fd), sizeof(intel_engine_t));
+		igt_assert(engines.engines);
+		engines.nr_engines = 0;
+		xe_for_each_engine(fd, hwe)
+			engines.engines[engines.nr_engines++] = *hwe;
+		igt_assert(engines.nr_engines);
+	} else {
+		struct intel_engine_data ed = {};
+
+		ed = intel_engine_list_of_physical(fd);
+		igt_assert(ed.nengines);
+		engines.nr_engines = ed.nengines;
+		engines.engines = calloc(engines.nr_engines, sizeof(intel_engine_t));
+		igt_assert(engines.engines);
+		for (int i = 0; i < ed.nengines; ++i) {
+			engines.engines[i].engine_class = ed.engines[i].class;
+			engines.engines[i].engine_instance = ed.engines[i].instance;
+			engines.engines[i].gt_id = DEFAULT_ID;
 		}
-	} else
-		engines = intel_engine_list_of_physical(fd);
+	}
 
-	igt_assert(engines.nengines);
 	return &engines;
 }
 
-static unsigned int num_engines_in_class(enum intel_engine_id class)
+static bool is_valid_engine(const intel_engine_t *engine)
 {
-	const struct intel_engine_data *engines = query_engines();
-	unsigned int i, count = 0;
-
-	igt_assert(class == VCS);
-
-	for (i = 0; i < engines->nengines; i++) {
-		if (engines->engines[i].class == I915_ENGINE_CLASS_VIDEO)
-			count++;
-	}
-
-	igt_assert(count);
-	return count;
+	return engine->engine_class != INVALID_ID;
 }
 
-static void
-fill_engines_id_class(enum intel_engine_id *list,
-		      enum intel_engine_id class)
+static bool is_default_engine(const intel_engine_t *engine)
 {
-	const struct intel_engine_data *engines = query_engines();
-	enum intel_engine_id engine = VCS1;
-	unsigned int i, j = 0;
-
-	igt_assert(class == VCS);
-	igt_assert(num_engines_in_class(VCS) <= 2);
-
-	for (i = 0; i < engines->nengines; i++) {
-		if (engines->engines[i].class != I915_ENGINE_CLASS_VIDEO)
-			continue;
+	return engine->engine_class == DEFAULT_ID &&
+	       engine->engine_instance == DEFAULT_ID &&
+	       engine->gt_id == DEFAULT_ID;
+}
 
-		list[j++] = engine++;
-	}
+static bool engine_matches_filter(const intel_engine_t *engine, const intel_engine_t *filter)
+{
+	return (filter->engine_class == DEFAULT_ID ||
+		filter->engine_class == engine->engine_class) &&
+	       (filter->engine_instance == DEFAULT_ID ||
+		filter->engine_instance == engine->engine_instance) &&
+	       (filter->gt_id == DEFAULT_ID ||
+		filter->gt_id == engine->gt_id);
 }
 
+#define for_each_matching_engine(__engine, __filter, __engines) \
+	for (unsigned int __i = 0; __i < __engines->nr_engines && \
+	     (__engine = &__engines->engines[__i]); __i++) \
+		for_if(engine_matches_filter(__engine, __filter))
+
 static unsigned int
-find_physical_instance(enum intel_engine_id class, unsigned int logical)
+append_matching_engines(const intel_engine_t *filter, struct intel_engines *engines)
 {
-	const struct intel_engine_data *engines = query_engines();
-	unsigned int i, j = 0;
+	unsigned int prev_nr_engines;
+	struct intel_engines *all = query_engines();
+	intel_engine_t *engine;
 
-	igt_assert(class == VCS);
-
-	for (i = 0; i < engines->nengines; i++) {
-		if (engines->engines[i].class != I915_ENGINE_CLASS_VIDEO)
-			continue;
+	igt_assert(engines);
+	prev_nr_engines = engines->nr_engines;
 
-		/* Map logical to physical instances. */
-		if (logical == j++)
-			return engines->engines[i].instance;
+	for_each_matching_engine(engine, filter, all) {
+		engines->nr_engines++;
+		engines->engines = realloc(engines->engines,
+					   engines->nr_engines * sizeof(intel_engine_t));
+		igt_assert(engines->engines);
+		engines->engines[engines->nr_engines - 1] = *engine;
 	}
 
-	igt_assert(0);
-	return 0;
+	return engines->nr_engines - prev_nr_engines;
 }
 
-static struct i915_engine_class_instance
-get_engine(enum intel_engine_id engine)
+static intel_engine_t get_default_engine(void)
 {
-	struct i915_engine_class_instance ci;
+	struct intel_engines *all_engines = query_engines();
+	const intel_engine_t filters[] = {
+		{RCS, DEFAULT_ID, DEFAULT_ID},
+		{CCS, DEFAULT_ID, DEFAULT_ID},
+		{DEFAULT_ID, DEFAULT_ID, DEFAULT_ID},
+		{INVALID_ID}
+	}, *filter, *default_engine;
 
-	query_engines();
-
-	switch (engine) {
-	case RCS:
-		ci.engine_class = I915_ENGINE_CLASS_RENDER;
-		ci.engine_instance = 0;
-		break;
-	case BCS:
-		ci.engine_class = I915_ENGINE_CLASS_COPY;
-		ci.engine_instance = 0;
-		break;
-	case VCS1:
-	case VCS2:
-		ci.engine_class = I915_ENGINE_CLASS_VIDEO;
-		ci.engine_instance = find_physical_instance(VCS, engine - VCS1);
-		break;
-	case VECS:
-		ci.engine_class = I915_ENGINE_CLASS_VIDEO_ENHANCE;
-		ci.engine_instance = 0;
-		break;
-	default:
-		igt_assert(0);
-	};
+	for (filter = filters; is_valid_engine(filter); filter++)
+		for_each_matching_engine(default_engine, filter, all_engines)
+			return *default_engine;
 
-	return ci;
+	igt_assert(0);
 }
 
-static struct drm_xe_engine_class_instance
-xe_get_engine(enum intel_engine_id engine)
+static intel_engine_t resolve_to_physical_engine_(const intel_engine_t *engine)
 {
-	struct drm_xe_engine_class_instance hwe = {}, *hwe1;
-	bool found_physical = false;
+	struct intel_engines *all_engines = query_engines();
+	intel_engine_t *resolved;
 
-	switch (engine) {
-	case RCS:
-		hwe.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
-		break;
-	case BCS:
-		hwe.engine_class = DRM_XE_ENGINE_CLASS_COPY;
-		break;
-	case VCS1:
-		hwe.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
-		break;
-	case VCS2:
-		hwe.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
-		hwe.engine_instance = 1;
-		break;
-	case VECS:
-		hwe.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
-		break;
-	default:
-		igt_assert(0);
-	};
+	igt_assert(engine);
+	if (is_default_engine(engine))
+		return get_default_engine();
 
-	xe_for_each_engine(fd, hwe1) {
-		if (hwe.engine_class == hwe1->engine_class &&
-		    hwe.engine_instance  == hwe1->engine_instance) {
-			hwe = *hwe1;
-			found_physical = true;
-			break;
-		}
-	}
+	for_each_matching_engine(resolved, engine, all_engines)
+		return *resolved;
 
-	igt_assert(found_physical);
-	return hwe;
+	return (intel_engine_t){INVALID_ID};
 }
 
-static struct drm_xe_engine_class_instance
-xe_get_default_engine(void)
+static void resolve_to_physical_engine(intel_engine_t *engine)
 {
-	struct drm_xe_engine_class_instance default_hwe, *hwe;
-
-	/* select RCS0 | CCS0 or first available engine */
-	default_hwe = xe_engine(fd, 0)->instance;
-	xe_for_each_engine(fd, hwe) {
-		if ((hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
-		     hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) &&
-		    hwe->engine_instance == 0) {
-			default_hwe = *hwe;
-			break;
-		}
-	}
-
-	return default_hwe;
+	*engine = resolve_to_physical_engine_(engine);
+	igt_assert(is_valid_engine(engine));
 }
 
 static int parse_engine_map(struct w_step *step, const char *_str)
 {
 	char *token, *tctx = NULL, *tstart = (char *)_str;
+	intel_engine_t engine;
 
 	while ((token = strtok_r(tstart, "|", &tctx))) {
-		enum intel_engine_id engine;
-		unsigned int add;
-
 		tstart = NULL;
 
-		if (!strcmp(token, "DEFAULT"))
+		engine = str_to_engine(token);
+		if (!is_valid_engine(&engine) || is_default_engine(&engine))
 			return -1;
 
-		engine = str_to_engine(token);
-		if ((int)engine < 0)
+		if (!append_matching_engines(&engine, &step->engine_map))
 			return -1;
+	}
 
-		if (engine != VCS && engine != VCS1 && engine != VCS2 &&
-		    engine != RCS)
-			return -1; /* TODO */
+	return 0;
+}
 
-		add = engine == VCS ? num_engines_in_class(VCS) : 1;
-		step->engine_map.nr_engines += add;
-		step->engine_map.engines = realloc(step->engine_map.engines,
-						step->engine_map.nr_engines *
-						sizeof(step->engine_map.engines[0]));
+static int parse_bond_engines(struct w_step *step, const char *_str)
+{
+	char *token, *tctx = NULL, *tstart = (char *)_str;
+	intel_engine_t engine;
 
-		if (engine != VCS)
-			step->engine_map.engines[step->engine_map.nr_engines - add] = engine;
-		else
-			fill_engines_id_class(
-				&step->engine_map.engines[step->engine_map.nr_engines - add],
-				VCS);
+	while ((token = strtok_r(tstart, "|", &tctx))) {
+		tstart = NULL;
+
+		engine = str_to_engine(token);
+		if (append_matching_engines(&engine, &step->bond.mask) != 1)
+			return -1;
 	}
 
 	return 0;
@@ -888,26 +917,6 @@ static int parse_working_set(struct working_set *set, char *str)
 	return 0;
 }
 
-static uint64_t engine_list_mask(const char *_str)
-{
-	uint64_t mask = 0;
-
-	char *token, *tctx = NULL, *tstart = (char *)_str;
-
-	while ((token = strtok_r(tstart, "|", &tctx))) {
-		enum intel_engine_id engine = str_to_engine(token);
-
-		if ((int)engine < 0 || engine == DEFAULT || engine == VCS)
-			return 0;
-
-		mask |= 1 << engine;
-
-		tstart = NULL;
-	}
-
-	return mask;
-}
-
 static unsigned long
 allocate_working_set(struct workload *wrk, struct working_set *set);
 
@@ -1179,18 +1188,19 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 							  "Invalid context at step %u!\n",
 							  nr_steps);
 					} else if (nr == 1) {
-						step.bond.mask = engine_list_mask(field);
-						check_arg(step.bond.mask == 0,
-							"Invalid siblings list at step %u!\n",
-							nr_steps);
+						tmp = parse_bond_engines(&step, field);
+						check_arg(tmp < 0,
+							  "Invalid siblings list at step %u!\n",
+							  nr_steps);
 					} else if (nr == 2) {
-						tmp = str_to_engine(field);
-						check_arg(tmp <= 0 ||
-							  tmp == VCS ||
-							  tmp == DEFAULT,
+						struct intel_engines engines;
+
+						step.bond.master = str_to_engine(field);
+						check_arg(append_matching_engines(&step.bond.master,
+										  &engines) != 1,
 							  "Invalid master engine at step %u!\n",
 							  nr_steps);
-						step.bond.master = tmp;
+						free(engines.engines);
 					}
 
 					nr++;
@@ -1248,13 +1258,11 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 		if (field) {
 			fstart = NULL;
 
-			i = str_to_engine(field);
-			check_arg(i < 0,
+			step.engine = str_to_engine(field);
+			check_arg(!is_valid_engine(&step.engine),
 				  "Invalid engine id at step %u!\n", nr_steps);
 
 			valid++;
-
-			step.engine = i;
 		}
 
 		field = strtok_r(fstart, ".", &fctx);
@@ -1420,9 +1428,9 @@ add_step:
 static struct workload *
 clone_workload(struct workload *_wrk)
 {
+	int nr_engines = query_engines()->nr_engines;
 	struct workload *wrk;
 	struct w_step *w;
-	int i;
 
 	wrk = malloc(sizeof(*wrk));
 	igt_assert(wrk);
@@ -1457,8 +1465,12 @@ clone_workload(struct workload *_wrk)
 		}
 	}
 
-	for (i = 0; i < NUM_ENGINES; i++)
-		IGT_INIT_LIST_HEAD(&wrk->requests[i]);
+	wrk->requests = calloc(nr_engines, sizeof(*wrk->requests));
+	igt_assert(wrk->requests);
+	wrk->nrequest = calloc(nr_engines, sizeof(*wrk->nrequest));
+	igt_assert(wrk->nrequest);
+	while (--nr_engines >= 0)
+		IGT_INIT_LIST_HEAD(&wrk->requests[nr_engines]);
 
 	return wrk;
 }
@@ -1485,37 +1497,32 @@ __get_ctx(struct workload *wrk, const struct w_step *w)
 	return &wrk->ctx_list[w->context];
 }
 
-static uint32_t mmio_base(int i915, enum intel_engine_id engine, int gen)
+static uint32_t mmio_base(int i915, const intel_engine_t *engine, int gen)
 {
-	const char *name;
+	char name[16];
 
 	if (gen >= 11)
 		return 0;
 
-	switch (engine) {
-	case NUM_ENGINES:
+	switch (engine->engine_class) {
 	default:
 		return 0;
 
-	case DEFAULT:
+	case DEFAULT_ID:
 	case RCS:
-		name = "rcs0";
+		snprintf(name, sizeof(name), "rcs%u", engine->engine_instance);
 		break;
-
 	case BCS:
-		name = "bcs0";
+		snprintf(name, sizeof(name), "bcs%u", engine->engine_instance);
 		break;
-
 	case VCS:
-	case VCS1:
-		name = "vcs0";
-		break;
-	case VCS2:
-		name = "vcs1";
+		snprintf(name, sizeof(name), "vcs%u", engine->engine_instance);
 		break;
-
 	case VECS:
-		name = "vecs0";
+		snprintf(name, sizeof(name), "vecs%u", engine->engine_instance);
+		break;
+	case CCS:
+		snprintf(name, sizeof(name), "ccs%u", engine->engine_instance);
 		break;
 	}
 
@@ -1525,7 +1532,7 @@ static uint32_t mmio_base(int i915, enum intel_engine_id engine, int gen)
 static unsigned int create_bb(struct w_step *w, int self)
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
-	const uint32_t base = mmio_base(fd, w->engine, gen);
+	const uint32_t base = mmio_base(fd, &w->engine, gen);
 #define CS_GPR(x) (base + 0x600 + 8 * (x))
 #define TIMESTAMP (base + 0x3a8)
 	const int use_64b = gen >= 8;
@@ -1890,22 +1897,6 @@ static void vm_destroy(int i915, uint32_t vm_id)
 	igt_assert_eq(__vm_destroy(i915, vm_id), 0);
 }
 
-static unsigned int
-find_engine(struct i915_engine_class_instance *ci, unsigned int count,
-	    enum intel_engine_id engine)
-{
-	struct i915_engine_class_instance e = get_engine(engine);
-	unsigned int i;
-
-	for (i = 0; i < count; i++, ci++) {
-		if (!memcmp(&e, ci, sizeof(*ci)))
-			return i;
-	}
-
-	igt_assert(0);
-	return 0;
-}
-
 static struct drm_i915_gem_context_param_sseu get_device_sseu(void)
 {
 	struct drm_i915_gem_context_param param = { };
@@ -2243,7 +2234,10 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 					else
 						igt_assert(ctx->load_balance);
 
-					w->request_idx = ctx->engine_map.engines[map_idx];
+					igt_assert(find_engine_in_map(
+						&ctx->engine_map.engines[map_idx],
+						query_engines(),
+						&w->request_idx));
 				}
 			}
 
@@ -2258,7 +2252,8 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 
 				for (j = 0; j < ctx->engine_map.nr_engines; j++)
 					load_balance->engines[j] =
-						get_engine(ctx->engine_map.engines[j]);
+						engine_to_i915_engine_class(
+							&ctx->engine_map.engines[j]);
 			}
 
 			/* Reserve slot for virtual engine. */
@@ -2269,32 +2264,30 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 
 			for (j = 1; j <= ctx->engine_map.nr_engines; j++)
 				set_engines->engines[j] =
-					get_engine(ctx->engine_map.engines[j - 1]);
+					engine_to_i915_engine_class(
+						&ctx->engine_map.engines[j - 1]);
 
 			last = NULL;
 			for (j = 0; j < ctx->bond_count; j++) {
-				unsigned long mask = ctx->bonds[j].mask;
+				struct intel_engines *mask = &ctx->bonds[j].mask;
 				struct i915_context_engines_bond *bond =
-					alloca0(sizeof_engines_bond(__builtin_popcount(mask)));
+					alloca0(sizeof_engines_bond(mask->nr_engines));
 				unsigned int b, e;
 
 				bond->base.next_extension = to_user_pointer(last);
 				bond->base.name = I915_CONTEXT_ENGINES_EXT_BOND;
 
 				bond->virtual_index = 0;
-				bond->master = get_engine(ctx->bonds[j].master);
+				bond->master = engine_to_i915_engine_class(&ctx->bonds[j].master);
 
-				for (b = 0, e = 0; mask; e++, mask >>= 1) {
+				for (b = 0, e = 0; e < mask->nr_engines; e++) {
 					unsigned int idx;
 
-					if (!(mask & 1))
-						continue;
+					igt_assert(find_engine_in_map(&mask->engines[e],
+								      &ctx->engine_map,
+								      &idx));
 
-					idx = find_engine(&set_engines->engines[1],
-							  ctx->engine_map.nr_engines,
-							  e);
-					bond->engines[b++] =
-						set_engines->engines[1 + idx];
+					bond->engines[b++] = set_engines->engines[1 + idx];
 				}
 
 				last = bond;
@@ -2309,7 +2302,11 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 					continue;
 				if (w->type == BATCH) {
 					w->engine_idx = engine_to_i915_legacy_ring(&w->engine);
-					w->request_idx = w->engine;
+					resolve_to_physical_engine(&w->engine);
+					igt_assert(find_engine_in_map(
+							&w->engine,
+							query_engines(),
+							&w->request_idx));
 				}
 			}
 		}
@@ -2368,7 +2365,7 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 			eq->nr_hwes = ctx->engine_map.nr_engines;
 			eq->hwe_list = calloc(eq->nr_hwes, sizeof(*eq->hwe_list));
 			for (i = 0; i < eq->nr_hwes; ++i) {
-				eq->hwe_list[i] = xe_get_engine(ctx->engine_map.engines[i]);
+				eq->hwe_list[i] = ctx->engine_map.engines[i];
 
 				/* check no mixing classes and no duplicates */
 				for (int j = 0; j < i; ++j) {
@@ -2390,65 +2387,67 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 				}
 
 				if (verbose > 3)
-					printf("%u ctx[%d] %s [%u:%u:%u]\n",
-						id, ctx_idx,
-						ring_str_map[ctx->engine_map.engines[i]],
-						eq->hwe_list[i].engine_class,
-						eq->hwe_list[i].engine_instance,
-						eq->hwe_list[i].gt_id);
+					printf("%u ctx[%d] %s [%u:%u:%u]\n", id,
+					       ctx_idx,
+					       intel_engine_class_string(
+						       ctx->engine_map.engines[i].engine_class),
+					       eq->hwe_list[i].engine_class,
+					       eq->hwe_list[i].engine_instance,
+					       eq->hwe_list[i].gt_id);
 			}
 
-			/* update engine_idx */
+			xe_exec_queue_create_(ctx, eq);
+		} else {
+			/* create engine_map, update engine_idx */
 			for_each_w_step(w, wrk) {
 				if (w->context != ctx_idx)
 					continue;
 				if (w->type == BATCH) {
-					w->engine_idx = 0;
-					w->request_idx = ctx->engine_map.engines[w->engine_idx];
+					resolve_to_physical_engine(&w->engine);
+					if (!find_engine_in_map(&w->engine, &ctx->engine_map,
+								&w->engine_idx)) {
+						igt_assert_eq(1, append_matching_engines(&w->engine,
+										&ctx->engine_map));
+						w->engine_idx = ctx->engine_map.nr_engines - 1;
+					}
 				}
 			}
 
-			xe_exec_queue_create_(ctx, eq);
-		} else {
-			int engine_classes[NUM_ENGINES] = {};
+			/* skip not referenced context */
+			if (!ctx->engine_map.nr_engines)
+				continue;
 
-			ctx->xe.nr_queues = NUM_ENGINES;
+			ctx->xe.nr_queues = ctx->engine_map.nr_engines;
 			ctx->xe.queue_list = calloc(ctx->xe.nr_queues, sizeof(*ctx->xe.queue_list));
 
-			for_each_w_step(w, wrk) {
-				if (w->context != ctx_idx)
-					continue;
-				if (w->type == BATCH) {
-					engine_classes[w->engine]++;
-					/* update engine_idx and request_idx */
-					w->engine_idx = w->engine;
-					w->request_idx = w->engine;
-				}
-			}
-
-			for (i = 0; i < NUM_ENGINES; i++) {
-				if (engine_classes[i]) {
-					eq = &ctx->xe.queue_list[i];
-					eq->nr_hwes = 1;
-					eq->hwe_list = calloc(1, sizeof(*eq->hwe_list));
+			for (i = 0; i < ctx->xe.nr_queues; i++) {
+				eq = &ctx->xe.queue_list[i];
+				eq->nr_hwes = 1;
+				eq->hwe_list = calloc(1, sizeof(*eq->hwe_list));
+				eq->hwe_list[0] = ctx->engine_map.engines[i];
 
-					if (i == DEFAULT)
-						eq->hwe_list[0] = xe_get_default_engine();
-					else if (i == VCS)
-						eq->hwe_list[0] = xe_get_engine(VCS1);
-					else
-						eq->hwe_list[0] = xe_get_engine(i);
+				if (verbose > 3)
+					printf("%u ctx[%d] %s [%d:%d:%d]\n",
+						id, ctx_idx,
+						intel_engine_class_string(
+							ctx->engine_map.engines[i].engine_class),
+						eq->hwe_list[0].engine_class,
+						eq->hwe_list[0].engine_instance,
+						eq->hwe_list[0].gt_id);
 
-					if (verbose > 3)
-						printf("%u ctx[%d] %s [%u:%u:%u]\n",
-							id, ctx_idx, ring_str_map[i],
-							eq->hwe_list[0].engine_class,
-							eq->hwe_list[0].engine_instance,
-							eq->hwe_list[0].gt_id);
+				xe_exec_queue_create_(ctx, eq);
+			}
+		}
 
-					xe_exec_queue_create_(ctx, eq);
-				}
-				engine_classes[i] = 0;
+		/* update request_idx */
+		for_each_w_step(w, wrk) {
+			if (w->context != ctx_idx)
+				continue;
+			if (w->type == BATCH) {
+				igt_assert(find_engine_in_map(
+						&ctx->engine_map.engines[w->engine_idx],
+						query_engines(),
+						&w->request_idx));
 			}
 		}
 	}
@@ -2911,7 +2910,7 @@ static void *run_workload(void *data)
 		}
 	}
 
-	for (int i = 0; i < NUM_ENGINES; i++) {
+	for (int i = query_engines()->nr_engines; --i >= 0;) {
 		if (!wrk->nrequest[i])
 			continue;
 
-- 
2.31.1

