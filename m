Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1419C55167
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 05:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CD510F16E;
	Fri, 31 Jul 2026 05:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3DJnZj1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B4D10F148
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 05:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785476754; x=1817012754;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tcaiMSFGxhnwBBeJFp25HHeKcNQqDqOW73Sg4W2k3r8=;
 b=F3DJnZj1v7Mm5+c5Z/bZXG5siOF/qpEqf7saqCZ2IuEByNeqml/cOi/l
 XY0Eb8yjcEKRZmeWI3T4TtezCgsyGbh61dZ0WQOP8qUEEhb0Gtmbwrgyp
 ipU1vUUfwWMlt3rUft72Mv9tvzdCDZBp/FG9IqmM58MRJil9+jW2re7fJ
 ACn7Hh7Na3NRI6CINr7sTP3rUUlxQn5fVv60l4AQ0ruvqsjIq5/JDkebY
 jcTLu2fHpXCgM7o9nHtKjbnbuVzAdfQCI+QrVp87naaGJrzv5z7qRF+XK
 /mRZYfvYiI7n21kcCW4McYkHmvSmT5PGOI+4IGy4zmVhxxeuUVJf3gzBo Q==;
X-CSE-ConnectionGUID: E0onvWRYTtaPbAXnRn/yKA==
X-CSE-MsgGUID: XBYG0mhISYKpbmGVVj983A==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="73636085"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="73636085"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 22:45:54 -0700
X-CSE-ConnectionGUID: tQnArpn2QwikndG6Yhhz5w==
X-CSE-MsgGUID: 0qLkdTdJQnidzQR+MmpoXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="257815789"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 22:45:51 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	shekhar.chauhan@intel.com
Subject: [PATCH i-g-t v2] tools/xe-perf-recorder: expose some OA stream open
 properties
Date: Fri, 31 Jul 2026 11:15:43 +0530
Message-ID: <20260731054543.3246926-1-shekhar.chauhan@intel.com>
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
 tools/xe-perf/xe_perf_recorder.c | 34 ++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index c69050b43..01ec84cbb 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -364,6 +364,10 @@ struct recording_context {
 	struct drm_xe_oa_unit *oa_unit;
 	struct drm_xe_engine_class_instance *hwe;
 
+	/* OA stream open properties (defaults overridable via command line) */
+	uint64_t oa_buffer_size;
+	uint64_t wait_num_reports;
+
 	uint32_t vm;
 	uint32_t exec_queue;
 	struct intel_bb *ibb;
@@ -487,6 +491,13 @@ perf_open(struct recording_context *ctx)
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, ctx->metric_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(ctx->metric_set->perf_oa_format),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, ctx->oa_exponent,
+
+		/* Open disabled; the stream is enabled right after open */
+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
+
+		/* OA buffer size and wait-num-reports (overridable via cmdline) */
+		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, ctx->oa_buffer_size,
+		DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS, ctx->wait_num_reports,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
@@ -924,7 +935,10 @@ usage(const char *name)
 		"     --output,             -o <path>   Output file (default = xe_perf.record)\n"
 		"     --cpu-clock,          -k <path>   Cpu clock to use for correlations\n"
 		"                                       Values: boot, mono, mono_raw (default = mono)\n"
-		"     --oa-unit-id          -u <value>  OA unit id for the capture.\n",
+		"     --oa-unit-id          -u <value>  OA unit id for the capture.\n"
+		"     --oa-buffer-size      -b <value>  OA buffer size in bytes (default = 64M)\n"
+		"     --wait-num-reports    -w <value>  Min reports before poll()/read() unblocks\n"
+		"                                       (default = 1)\n",
 		name);
 }
 
@@ -1038,6 +1052,8 @@ main(int argc, char *argv[])
 		{"command-fifo",	required_argument, 0, 'f'},
 		{"cpu-clock",		required_argument, 0, 'k'},
 		{"oa-unit-id",		required_argument, 0, 'u'},
+		{"oa-buffer-size",	required_argument, 0, 'b'},
+		{"wait-num-reports",	required_argument, 0, 'w'},
 		{0, 0, 0, 0}
 	};
 	const struct {
@@ -1066,9 +1082,11 @@ main(int argc, char *argv[])
 		.command_fifo_fd = -1,
 
 		.oa_unit_id = 0,
+		.oa_buffer_size = 64 * 1024 * 1024,
+		.wait_num_reports = 1,
 	};
 
-	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:u:", long_options, NULL)) != -1) {
+	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:u:b:w:", long_options, NULL)) != -1) {
 		switch (opt) {
 		case 'h':
 			usage(argv[0]);
@@ -1119,6 +1137,12 @@ main(int argc, char *argv[])
 		case 'u':
 			ctx.oa_unit_id = atoi(optarg);
 			break;
+		case 'b':
+			ctx.oa_buffer_size = strtoull(optarg, NULL, 0);
+			break;
+		case 'w':
+			ctx.wait_num_reports = strtoull(optarg, NULL, 0);
+			break;
 		default:
 			fprintf(stderr, "Internal error: "
 				"unexpected getopt value: %d\n", opt);
@@ -1291,6 +1315,12 @@ main(int argc, char *argv[])
 		goto fail;
 	}
 
+	if (perf_ioctl(ctx.perf_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0) < 0) {
+		fprintf(stderr, "Unable to enable xe oa stream: %s\n",
+			strerror(errno));
+		goto fail;
+	}
+
 	init_mmio_trigger_ctx(&ctx);
 	emit_oa_trigger(&ctx, 0xc0ffee01);
 
-- 
2.53.0

