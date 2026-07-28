Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C076BC54F51
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 06:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4560D10E529;
	Tue, 28 Jul 2026 06:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPaCV8l6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80C010E529
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 06:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785220584; x=1816756584;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/5rZ/M/YseA7b0HrNIYwZHAEh/52m2MWR1snBebmgBw=;
 b=gPaCV8l6456mxmGIMN67c6A6rQe6ty72r4exh7RbhY13UuskgNdLAtpS
 PQ95P6CWakJiNYAPXAeQtnFuAk89Ruq8u/mTWuA0TnFgYi0Bet51MbnUL
 Q0UIdFS14VpYchbJ0isVdL7ey7D0An1IAN5xUv65+YL89TS21XB8NOMr8
 c95cZmORALd5g0/AbeAydtP65MGYfIaY0pGNNiUtVHGNXbQJ01bRxmEoA
 QibYC5ceMeWC0+xaXswkHDbo8WfvO5FeXk09fjN8NuqdwlhPOJY/e3YBk
 +DkEq8yXZxuR8SUIgHOOOjZQlK7SwYr7A/GEP52dYA3r5EA/PCv5wlN5s g==;
X-CSE-ConnectionGUID: 33R/7lJ6R3e/Ru3+xDjMfA==
X-CSE-MsgGUID: FZWowg3YSFSCnfriYTM9xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="111342536"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="111342536"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:36:24 -0700
X-CSE-ConnectionGUID: MSy6jLeVS4qrgK56SwmZfg==
X-CSE-MsgGUID: G1Fw1t73RZeQyE4uTWZliA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="256273822"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:36:22 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	shekhar.chauhan@intel.com
Subject: [PATCH] tools/xe-perf-recorder: expose some OA stream open properties
Date: Tue, 28 Jul 2026 12:06:06 +0530
Message-ID: <20260728063606.2874276-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
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

xe-perf-recorder only passes 5 of the OA stream open properties to
DRM_XE_OBSERVATION_OP_STREAM_OPEN, leaving the rest without an open
source consumer. Add few of the remaining ones.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tools/xe-perf/xe_perf_recorder.c | 105 ++++++++++++++++++++++++++++---
 1 file changed, 98 insertions(+), 7 deletions(-)

diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index c69050b43..06d1016a0 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -26,6 +26,7 @@
 #include <unistd.h>
 
 #include "igt_core.h"
+#include "igt_sizes.h"
 #include "intel_batchbuffer.h"
 #include "intel_chipset.h"
 #include "ioctl_wrappers.h"
@@ -364,6 +365,16 @@ struct recording_context {
 	struct drm_xe_oa_unit *oa_unit;
 	struct drm_xe_engine_class_instance *hwe;
 
+	/* Optional OA stream open properties */
+	bool oa_disabled;
+	bool no_preempt;
+	bool exec_queue_id_set;
+	uint32_t exec_queue_id;
+	bool oa_engine_instance_set;
+	uint32_t oa_engine_instance;
+	uint64_t oa_buffer_size;
+	uint64_t wait_num_reports;
+
 	uint32_t vm;
 	uint32_t exec_queue;
 	struct intel_bb *ibb;
@@ -477,7 +488,7 @@ perf_open(struct recording_context *ctx)
 {
 	int stream_fd;
 
-	uint64_t properties[] = {
+	uint64_t properties[32] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, ctx->oa_unit->oa_unit_id,
 
 		/* Include OA reports in samples */
@@ -488,10 +499,39 @@ perf_open(struct recording_context *ctx)
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(ctx->metric_set->perf_oa_format),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, ctx->oa_exponent,
 	};
-	struct intel_xe_oa_open_prop param = {
-		.num_properties = ARRAY_SIZE(properties) / 2,
-		.properties_ptr = to_user_pointer(properties),
-	};
+	struct intel_xe_oa_open_prop param = { 0 };
+	uint32_t n = 10; /* 5 mandatory properties (10 u64 slots) set above */
+
+	/* Optional properties, only passed when given on the command line */
+	if (ctx->oa_disabled) {
+		properties[n++] = DRM_XE_OA_PROPERTY_OA_DISABLED;
+		properties[n++] = 1;
+	}
+	if (ctx->exec_queue_id_set) {
+		properties[n++] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
+		properties[n++] = ctx->exec_queue_id;
+	}
+	if (ctx->oa_engine_instance_set) {
+		properties[n++] = DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE;
+		properties[n++] = ctx->oa_engine_instance;
+	}
+	if (ctx->no_preempt) {
+		properties[n++] = DRM_XE_OA_PROPERTY_NO_PREEMPT;
+		properties[n++] = 1;
+	}
+	if (ctx->oa_buffer_size) {
+		properties[n++] = DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE;
+		properties[n++] = ctx->oa_buffer_size;
+	}
+	if (ctx->wait_num_reports) {
+		properties[n++] = DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS;
+		properties[n++] = ctx->wait_num_reports;
+	}
+
+	igt_assert(n <= ARRAY_SIZE(properties));
+
+	param.num_properties = n / 2;
+	param.properties_ptr = to_user_pointer(properties);
 
 	stream_fd = intel_xe_perf_ioctl(ctx->drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
 	if (stream_fd < 0) {
@@ -924,7 +964,14 @@ usage(const char *name)
 		"     --output,             -o <path>   Output file (default = xe_perf.record)\n"
 		"     --cpu-clock,          -k <path>   Cpu clock to use for correlations\n"
 		"                                       Values: boot, mono, mono_raw (default = mono)\n"
-		"     --oa-unit-id          -u <value>  OA unit id for the capture.\n",
+		"     --oa-unit-id          -u <value>  OA unit id for the capture.\n"
+		"     --oa-disabled         -D          Open the OA stream in the disabled state\n"
+		"                                       (the stream is enabled right after open)\n"
+		"     --exec-queue-id       -q <value>  Exec queue id for context scoped capture\n"
+		"     --oa-engine-instance  -e <value>  Engine instance for context scoped capture\n"
+		"     --no-preempt          -n          Disable preemption (requires --exec-queue-id)\n"
+		"     --oa-buffer-size      -b <value>  OA buffer size in bytes (pow2, 128K - 128M)\n"
+		"     --wait-num-reports    -w <value>  Min reports before poll()/read() unblocks\n",
 		name);
 }
 
@@ -1038,6 +1085,12 @@ main(int argc, char *argv[])
 		{"command-fifo",	required_argument, 0, 'f'},
 		{"cpu-clock",		required_argument, 0, 'k'},
 		{"oa-unit-id",		required_argument, 0, 'u'},
+		{"oa-disabled",		no_argument,	   0, 'D'},
+		{"exec-queue-id",	required_argument, 0, 'q'},
+		{"oa-engine-instance",	required_argument, 0, 'e'},
+		{"no-preempt",		no_argument,	   0, 'n'},
+		{"oa-buffer-size",	required_argument, 0, 'b'},
+		{"wait-num-reports",	required_argument, 0, 'w'},
 		{0, 0, 0, 0}
 	};
 	const struct {
@@ -1068,7 +1121,7 @@ main(int argc, char *argv[])
 		.oa_unit_id = 0,
 	};
 
-	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:u:", long_options, NULL)) != -1) {
+	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:u:Dq:e:nb:w:", long_options, NULL)) != -1) {
 		switch (opt) {
 		case 'h':
 			usage(argv[0]);
@@ -1119,6 +1172,26 @@ main(int argc, char *argv[])
 		case 'u':
 			ctx.oa_unit_id = atoi(optarg);
 			break;
+		case 'D':
+			ctx.oa_disabled = true;
+			break;
+		case 'q':
+			ctx.exec_queue_id = strtoul(optarg, NULL, 0);
+			ctx.exec_queue_id_set = true;
+			break;
+		case 'e':
+			ctx.oa_engine_instance = strtoul(optarg, NULL, 0);
+			ctx.oa_engine_instance_set = true;
+			break;
+		case 'n':
+			ctx.no_preempt = true;
+			break;
+		case 'b':
+			ctx.oa_buffer_size = strtoull(optarg, NULL, 0);
+			break;
+		case 'w':
+			ctx.wait_num_reports = strtoull(optarg, NULL, 0);
+			break;
 		default:
 			fprintf(stderr, "Internal error: "
 				"unexpected getopt value: %d\n", opt);
@@ -1127,6 +1200,17 @@ main(int argc, char *argv[])
 		}
 	}
 
+	if (ctx.no_preempt && !ctx.exec_queue_id_set) {
+		fprintf(stderr, "--no-preempt requires --exec-queue-id\n");
+		return EXIT_FAILURE;
+	}
+	if (ctx.oa_buffer_size &&
+	    ((ctx.oa_buffer_size & (ctx.oa_buffer_size - 1)) ||
+	     ctx.oa_buffer_size < SZ_128K || ctx.oa_buffer_size > SZ_128M)) {
+		fprintf(stderr, "--oa-buffer-size must be a power of 2 in [128K, 128M]\n");
+		return EXIT_FAILURE;
+	}
+
 	if (dev_node_id == -2) {
 		print_intel_devices();
 		return EXIT_SUCCESS;
@@ -1291,6 +1375,13 @@ main(int argc, char *argv[])
 		goto fail;
 	}
 
+	if (ctx.oa_disabled &&
+	    perf_ioctl(ctx.perf_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0) < 0) {
+		fprintf(stderr, "Unable to enable xe oa stream: %s\n",
+			strerror(errno));
+		goto fail;
+	}
+
 	init_mmio_trigger_ctx(&ctx);
 	emit_oa_trigger(&ctx, 0xc0ffee01);
 
-- 
2.53.0

