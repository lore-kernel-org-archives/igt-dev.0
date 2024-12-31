Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FED6E77194
	for <igt-dev@archiver.kernel.org>; Tue, 31 Dec 2024 09:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306B010E62B;
	Tue, 31 Dec 2024 09:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nGwBKaFn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F52510E62B
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2024 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735638397; x=1767174397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CB7SvjDzZlAJRUq9NDIy73f57jH7xRIi+cXNcOIkzSQ=;
 b=nGwBKaFn39YpI/Bn12HwKBf9O5cePG2UdGa804VK04hn4c6IqnB5tPCR
 RrRUrTxkxHxhHbY5Sc/JQLbG7DdkGuqtv9jUZYwA9Y6oq/xU31yNZaSiP
 rT0mVx5BQEhoRx/MKrfDPyg3hhT03f8vlwVfpCG5s3nt0IhO0DYa+J9qy
 hNTqHnS/JB5uIHI7OKFoA7LCORoisYbplnb99c9ic2COifmZNHJxO4VOE
 Gj3HnqkO4z05d79sLmnO/5ptfT8YCFeYbT6sSvyxhLeRD9DMcVfLujYyP
 nBnLsTi75iiyCuTWcTpBSlbRhgPn1F6vF4X2TJc8G3R4WB5C/USsB9bqR w==;
X-CSE-ConnectionGUID: p7MlImNmREiVG0Bx9gOgOQ==
X-CSE-MsgGUID: 359qNRmfQ86EdKw2OtQ5eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36078212"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="36078212"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 01:46:36 -0800
X-CSE-ConnectionGUID: EZZBn6fLRc6iVX4S5MHGwA==
X-CSE-MsgGUID: VW0nrIzHQaCt1lF/OVU49A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138354527"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 01:46:36 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 kamil.konieczny@linux.intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH i-g-t 1/2] lib/xe/oa: Add observation type input to
 intel_xe_perf_ioctl and intel_xe_perf_ioctl_err
Date: Tue, 31 Dec 2024 01:46:28 -0800
Message-ID: <e7b0c66e339243308f6072fd44f40afe8003a3e1.1735637542.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1735637542.git.harish.chegondi@intel.com>
References: <cover.1735637542.git.harish.chegondi@intel.com>
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

In order to reuse intel_xe_perf_ioctl() and intel_xe_perf_ioctl_err()
functions for EU stall sampling, add observation type as an input
parameter to these functions and set the input observation type to
observation_type in struct drm_xe_observation_param.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 lib/xe/xe_oa.c                   | 18 +++++++---
 lib/xe/xe_oa.h                   | 11 ++++--
 tests/intel/xe_oa.c              | 57 +++++++++++++++++++++-----------
 tools/xe-perf/xe_perf_configs.c  |  2 +-
 tools/xe-perf/xe_perf_recorder.c |  3 +-
 5 files changed, 63 insertions(+), 28 deletions(-)

diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index db614b732..b40a5a1db 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -691,7 +691,8 @@ load_metric_set_config(struct intel_xe_perf_metric_set *metric_set, int drm_fd)
 	memcpy(regs, metric_set->flex_regs, 2 * metric_set->n_flex_regs * sizeof(u32));
 	regs += 2 * metric_set->n_flex_regs * sizeof(u32);
 
-	ret = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config);
+	ret = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+				  DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config);
 	if (ret >= 0)
 		metric_set->perf_oa_metrics_set = ret;
 
@@ -1054,7 +1055,10 @@ void intel_xe_oa_prop_to_ext(struct intel_xe_oa_open_prop *properties,
 		ext[j].base.next_extension = to_user_pointer(&ext[j + 1]);
 }
 
-int intel_xe_perf_ioctl(int fd, enum drm_xe_observation_op op, void *arg)
+int intel_xe_perf_ioctl(int fd,
+			enum drm_xe_observation_type type,
+			enum drm_xe_observation_op op,
+			void *arg)
 {
 #define XE_OA_MAX_SET_PROPERTIES 16
 
@@ -1063,7 +1067,7 @@ int intel_xe_perf_ioctl(int fd, enum drm_xe_observation_op op, void *arg)
 	/* Chain the PERF layer struct */
 	struct drm_xe_observation_param p = {
 		.extensions = 0,
-		.observation_type = DRM_XE_OBSERVATION_TYPE_OA,
+		.observation_type = type,
 		.observation_op = op,
 		.param = to_user_pointer((op == DRM_XE_OBSERVATION_OP_STREAM_OPEN) ? ext : arg),
 	};
@@ -1078,9 +1082,13 @@ int intel_xe_perf_ioctl(int fd, enum drm_xe_observation_op op, void *arg)
 	return igt_ioctl(fd, DRM_IOCTL_XE_OBSERVATION, &p);
 }
 
-void intel_xe_perf_ioctl_err(int fd, enum drm_xe_observation_op op, void *arg, int err)
+void intel_xe_perf_ioctl_err(int fd,
+			     enum drm_xe_observation_type type,
+			     enum drm_xe_observation_op op,
+			     void *arg,
+			     int err)
 {
-	igt_assert_eq(intel_xe_perf_ioctl(fd, op, arg), -1);
+	igt_assert_eq(intel_xe_perf_ioctl(fd, type, op, arg), -1);
 	igt_assert_eq(errno, err);
 	errno = 0;
 }
diff --git a/lib/xe/xe_oa.h b/lib/xe/xe_oa.h
index 7d3d07456..598ea7427 100644
--- a/lib/xe/xe_oa.h
+++ b/lib/xe/xe_oa.h
@@ -400,8 +400,15 @@ const char *intel_xe_perf_read_report_reason(const struct intel_xe_perf *perf,
 
 void intel_xe_oa_prop_to_ext(struct intel_xe_oa_open_prop *properties,
 			     struct drm_xe_ext_set_property *extn);
-int intel_xe_perf_ioctl(int fd, enum drm_xe_observation_op op, void *arg);
-void intel_xe_perf_ioctl_err(int fd, enum drm_xe_observation_op op, void *arg, int err);
+int intel_xe_perf_ioctl(int fd,
+			enum drm_xe_observation_type type,
+			enum drm_xe_observation_op op,
+			void *arg);
+void intel_xe_perf_ioctl_err(int fd,
+			     enum drm_xe_observation_type type,
+			     enum drm_xe_observation_op op,
+			     void *arg,
+			     int err);
 
 #ifdef __cplusplus
 };
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 492a6b5d6..3984837bb 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -489,7 +489,8 @@ __perf_open(int fd, struct intel_xe_oa_open_prop *param, bool prevent_pm)
 		pm_fd = -1;
 	}
 
-	ret = intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, param);
+	ret = intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_TYPE_OA,
+				  DRM_XE_OBSERVATION_OP_STREAM_OPEN, param);
 
 	igt_assert_lte(0, ret);
 	errno = 0;
@@ -1125,7 +1126,8 @@ static void test_system_wide_paranoid(void)
 
 		igt_drop_root();
 
-		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EACCES);
+		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+					DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EACCES);
 	}
 
 	igt_waitchildren();
@@ -1182,10 +1184,12 @@ static void test_invalid_oa_metric_set_id(void)
 		.properties_ptr = to_user_pointer(properties),
 	};
 
-	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+				DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
 
 	properties[ARRAY_SIZE(properties) - 1] = 0; /* ID 0 is also be reserved as invalid */
-	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+				DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
 
 	/* Check that we aren't just seeing false positives... */
 	properties[ARRAY_SIZE(properties) - 1] = default_test_set->perf_oa_metrics_set;
@@ -1194,7 +1198,8 @@ static void test_invalid_oa_metric_set_id(void)
 
 	/* There's no valid default OA metric set ID... */
 	param.num_properties--;
-	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+				DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
 }
 
 /**
@@ -1219,10 +1224,12 @@ static void test_invalid_oa_format_id(void)
 		.properties_ptr = to_user_pointer(properties),
 	};
 
-	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+				DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
 
 	properties[ARRAY_SIZE(properties) - 1] = __ff(0); /* ID 0 is also be reserved as invalid */
-	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+				DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
 
 	/* Check that we aren't just seeing false positives... */
 	properties[ARRAY_SIZE(properties) - 1] = __ff(default_test_set->perf_oa_format);
@@ -1230,7 +1237,8 @@ static void test_invalid_oa_format_id(void)
 	__perf_close(stream_fd);
 	/* There's no valid default OA format... */
 	param.num_properties--;
-	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+				DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
 }
 
 /**
@@ -1254,7 +1262,8 @@ static void test_missing_sample_flags(void)
 		.properties_ptr = to_user_pointer(properties),
 	};
 
-	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+				DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
 }
 
 static void
@@ -1839,7 +1848,8 @@ static void test_invalid_oa_exponent(void)
 
 	for (int i = 32; i < 65; i++) {
 		properties[7] = i;
-		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
+		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+					DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
 	}
 }
 
@@ -3491,7 +3501,8 @@ test_stress_open_close(const struct drm_xe_engine_class_instance *hwe)
 
 static int __xe_oa_add_config(int fd, struct drm_xe_oa_config *config)
 {
-	int ret = intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, config);
+	int ret = intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_TYPE_OA,
+				      DRM_XE_OBSERVATION_OP_ADD_CONFIG, config);
 	if (ret < 0)
 		ret = -errno;
 	return ret;
@@ -3509,13 +3520,15 @@ static int xe_oa_add_config(int fd, struct drm_xe_oa_config *config)
 
 static void xe_oa_remove_config(int fd, uint64_t config_id)
 {
-	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
+	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_TYPE_OA,
+					  DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
 }
 
 static bool has_xe_oa_userspace_config(int fd)
 {
 	uint64_t config = 0;
-	int ret = intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config);
+	int ret = intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_TYPE_OA,
+				      DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config);
 	igt_assert_eq(ret, -1);
 
 	igt_debug("errno=%i\n", errno);
@@ -3613,12 +3626,14 @@ test_invalid_remove_userspace_config(void)
 	igt_fork(child, 1) {
 		igt_drop_root();
 
-		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id, EACCES);
+		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+					DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id, EACCES);
 	}
 	igt_waitchildren();
 
 	/* Removing invalid config ID should fail. */
-	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &wrong_config_id, ENOENT);
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+				DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &wrong_config_id, ENOENT);
 
 	xe_oa_remove_config(drm_fd, config_id);
 }
@@ -3797,7 +3812,8 @@ test_whitelisted_registers_userspace_config(void)
 	config.regs_ptr = (uintptr_t) regs;
 
 	/* Create a new config */
-	ret = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config);
+	ret = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+				  DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config);
 	igt_assert_lt(0, ret); /* Config 0 should be used by the kernel */
 	config_id = ret;
 
@@ -4183,7 +4199,8 @@ test_oa_unit_exclusive_stream(bool exponent)
 		properties[5] = test_set->perf_oa_metrics_set;
 		properties[7] = __ff(test_set->perf_oa_format);
 		properties[9] = hwe->engine_instance;
-		perf_fd[i] = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
+		perf_fd[i] = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+						 DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
 		igt_assert(perf_fd[i] >= 0);
 		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
 	}
@@ -4213,7 +4230,8 @@ test_oa_unit_exclusive_stream(bool exponent)
 		properties[9] = hwe->engine_instance;
 		properties[10] = DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT;
 		properties[11] = oa_exp_1_millisec;
-		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EBUSY);
+		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+					DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EBUSY);
 
 		/* case 2: concurrent access to non-OAG unit should fail */
 		igt_debug("try with exec_q with c:i %d:%d\n",
@@ -4222,7 +4240,8 @@ test_oa_unit_exclusive_stream(bool exponent)
 		properties[10] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
 		properties[11] = exec_q[i];
 		errno = 0;
-		err = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
+		err = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+					  DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
 		igt_assert_lt(err, 0);
 		igt_assert(errno == EBUSY || errno == ENODEV);
 		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
diff --git a/tools/xe-perf/xe_perf_configs.c b/tools/xe-perf/xe_perf_configs.c
index bd37fef5c..3531217b7 100644
--- a/tools/xe-perf/xe_perf_configs.c
+++ b/tools/xe-perf/xe_perf_configs.c
@@ -228,7 +228,7 @@ main(int argc, char *argv[])
 			continue;
 
 		if (purge) {
-			if (intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &metric_id) == 0)
+			if (intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_TYPE_OA, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &metric_id) == 0)
 				fprintf(stdout, "\tRemoved config %s id=%03" PRIu64 " name=%s\n",
 					entry->d_name, metric_id, metric_name(perf, entry->d_name));
 			else
diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index 9cf51f3e1..411557200 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -443,7 +443,8 @@ perf_open(struct recording_context *ctx)
 		.properties_ptr = to_user_pointer(properties),
 	};
 
-	stream_fd = intel_xe_perf_ioctl(ctx->drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
+	stream_fd = intel_xe_perf_ioctl(ctx->drm_fd, DRM_XE_OBSERVATION_TYPE_OA,
+					DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
 	if (stream_fd < 0) {
 		errno = 0;
 		goto exit;
-- 
2.47.1

