Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DDEC55ABF
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 06:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7663410F0C7;
	Thu,  6 Aug 2026 06:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jO/UhYcH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252CD10E29B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 06:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785998052; x=1817534052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9+FY6mvHR+Ei5atFZyxFRlzMXtqxbV4y7xaAOY4kUUk=;
 b=jO/UhYcHLJj8Nzj6xn00Ntrv74JFOcFeAvV2AxRfSYCubOcmJSQr598X
 yy4Yq3b7O6R/c3lADXIpxDNo9bhKt7CnU0HDCZIlxvUlHhZVqOAfoWuCF
 Azq6PAWtnFnokZ8QBnKEGJOIS+u7xqA1KpE5ZtkBllUu91TfsJGjSWQ5C
 tJz9HuW/hFNi0+QXmnI95crS4VNSDMT51zH+C101zVkPHzZ1EvlfJuYt9
 zeOWsXX9BMwGwcJTi1kuTWA07M41Jws7VKhjYkF/JYNj9FqtUJZqvDUpM
 j+GWrUAQjwOlM6aqGss/7Msy1BUgSXYFEAY1kk4ae22QGZgW6avx/DGrS A==;
X-CSE-ConnectionGUID: W81537rHQhe+WfkmmUZMGQ==
X-CSE-MsgGUID: S+ZuzD5fREeV4c6HllCCIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86610762"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="86610762"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 23:34:12 -0700
X-CSE-ConnectionGUID: c3Ka3o3JT16x1GdWWfy9cw==
X-CSE-MsgGUID: n40ucBZdSnO/uzv+5J1/mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="258688809"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 23:34:10 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	shekhar.chauhan@intel.com
Subject: [PATCH i-g-t v3] tools/xe-perf-recorder: expose some OA stream open
 properties
Date: Thu,  6 Aug 2026 12:04:02 +0530
Message-ID: <20260806063402.4003061-1-shekhar.chauhan@intel.com>
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

v2: Remove properties which don't exercise anything in xe-perf-recorder.
v3: Minor nitpicks.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tools/xe-perf/xe_perf_recorder.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index c69050b43..e13eef519 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -364,6 +364,9 @@ struct recording_context {
 	struct drm_xe_oa_unit *oa_unit;
 	struct drm_xe_engine_class_instance *hwe;
 
+	int oa_buffer_size;
+	int wait_num_reports;
+
 	uint32_t vm;
 	uint32_t exec_queue;
 	struct intel_bb *ibb;
@@ -487,6 +490,12 @@ perf_open(struct recording_context *ctx)
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, ctx->metric_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(ctx->metric_set->perf_oa_format),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, ctx->oa_exponent,
+
+		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, ctx->oa_buffer_size,
+		DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS, ctx->wait_num_reports,
+
+		/* Open disabled; the stream is enabled right after open */
+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
@@ -924,7 +933,10 @@ usage(const char *name)
 		"     --output,             -o <path>   Output file (default = xe_perf.record)\n"
 		"     --cpu-clock,          -k <path>   Cpu clock to use for correlations\n"
 		"                                       Values: boot, mono, mono_raw (default = mono)\n"
-		"     --oa-unit-id          -u <value>  OA unit id for the capture.\n",
+		"     --oa-unit-id          -u <value>  OA unit id for the capture.\n"
+		"     --oa-buffer-size      -b <value>  OA buffer size in bytes (default = 64M)\n"
+		"     --wait-num-reports    -w <value>  Num reports before unblocking poll()/read()\n"
+		"                                       (default = 1)\n",
 		name);
 }
 
@@ -1038,6 +1050,8 @@ main(int argc, char *argv[])
 		{"command-fifo",	required_argument, 0, 'f'},
 		{"cpu-clock",		required_argument, 0, 'k'},
 		{"oa-unit-id",		required_argument, 0, 'u'},
+		{"oa-buffer-size",	required_argument, 0, 'b'},
+		{"wait-num-reports",	required_argument, 0, 'w'},
 		{0, 0, 0, 0}
 	};
 	const struct {
@@ -1066,9 +1080,11 @@ main(int argc, char *argv[])
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
@@ -1119,6 +1135,12 @@ main(int argc, char *argv[])
 		case 'u':
 			ctx.oa_unit_id = atoi(optarg);
 			break;
+		case 'b':
+			ctx.oa_buffer_size = atoi(optarg);
+			break;
+		case 'w':
+			ctx.wait_num_reports = atoi(optarg);
+			break;
 		default:
 			fprintf(stderr, "Internal error: "
 				"unexpected getopt value: %d\n", opt);
@@ -1291,6 +1313,12 @@ main(int argc, char *argv[])
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

