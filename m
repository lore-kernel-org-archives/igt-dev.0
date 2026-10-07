Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D7CCA5FF1
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 05:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3984D10E325;
	Wed,  7 Oct 2026 05:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7u+vwc+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141E010E325
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 05:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791351886; x=1822887886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OV5lwCHV31T2un0mupteWQjOc/x5BIU5sEwvA6JtDmc=;
 b=U7u+vwc+nr9cZJgujVQdBPfpl/loz4cKmPuRSV3x4QdTacIlfxtjoBOM
 pI82u/yrpNUkWRufpsleEKIBqJ+1k5u/ocFAdP+YxbLmGYxwYQXktX5oI
 4sd40GNMphJVinWEpbgWCGxuk1KvRfipF7evJN0U+8KZncqCHVjiiJ6jw
 L3KJx7S1jcHPnvSHxI2zboh5Uv4r7LEbKYboSgsEl6zuElJ2ufHmWuEcA
 oRXwV2NIyI/TarehZ4uWGcMbtUHuE38Z69fT4LAQnZHJTtrQ5fQ+WDRRr
 s6y5ZIprsjcDN6AFUa4K926UQqIJPv5LCzsxscX8RmwzgF2jHg/ecqrWH Q==;
X-CSE-ConnectionGUID: 7EWpgR3IS9uQtBRiZwMPJA==
X-CSE-MsgGUID: IOQpjvmXSmGcXx7l+u+fWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="108432170"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="108432170"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 22:44:46 -0700
X-CSE-ConnectionGUID: M40xuV8pTL6E5I3Ef5083A==
X-CSE-MsgGUID: KZLcYwh9T321/t5l0V4t7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="281095077"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 22:44:44 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v3] tools/xe-perf-recorder: Wait for mmio-trigger-report
Date: Wed,  7 Oct 2026 11:14:09 +0530
Message-ID: <20261007054409.3694489-1-shekhar.chauhan@intel.com>
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

From: Ashutosh Dixit <ashutosh.dixit@intel.com>

After mmio trigger is issued, we should wait till we receive a report with
the context id issued in the mmio trigger.

While waiting, propagate write_perf_data() failures back to main(). A
failed write can drop an already-read trigger report before it is checked,
which would otherwise leave the recorder waiting indefinitely.

v3: Propagate write_perf_data() failures out of the trigger wait (Shekhar)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Co-developed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tools/xe-perf/xe_perf_recorder.c | 57 ++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index e13eef519..6ec29558d 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -370,6 +370,7 @@ struct recording_context {
 	uint32_t vm;
 	uint32_t exec_queue;
 	struct intel_bb *ibb;
+	uint32_t mmio_trg_val;
 };
 
 static uint32_t oa_unit_mmio_trigger_reg(struct recording_context *ctx)
@@ -642,13 +643,15 @@ check_mmio_trigger_report(struct recording_context *ctx, const void *report)
 	const uint32_t *report_32 = report;
 	uint64_t value;
 
-	if (report_reason(report_32))
+	if (!ctx->mmio_trg_val || report_reason(report_32))
 		return;
 
 	value = (fmt->header == HDR_64_BIT) ? ((const uint64_t *)report)[2] : report_32[2];
 
-	if (value == 0xc0ffee01 || value == 0xc0ffee02)
+	if (value == ctx->mmio_trg_val) {
 		fprintf(stdout, "Received trigger report with value 0x%" PRIx64 "\n", value);
+		ctx->mmio_trg_val = 0;
+	}
 }
 
 static bool write_stream_data(struct recording_context *ctx,
@@ -712,6 +715,21 @@ static bool write_perf_data(FILE *output, struct recording_context *ctx)
 	return false;
 }
 
+static bool write_mmio_trigger_data(struct recording_context *ctx)
+{
+	struct pollfd pollfd = { .fd = ctx->perf_fd, .events = POLLIN };
+
+	while (ctx->mmio_trg_val) {
+		poll(&pollfd, 1, -1);
+		assert(pollfd.revents & POLLIN);
+
+		if (!write_perf_data(ctx->output_stream, ctx))
+			return false;
+	}
+
+	return true;
+}
+
 static clock_t correlation_clock_id = CLOCK_MONOTONIC;
 
 static const char *
@@ -790,23 +808,27 @@ static void emit_mmio_triggered_report(struct intel_bb *ibb, uint32_t reg, uint3
 	intel_bb_out(ibb, value);
 }
 
-static void emit_oa_trigger(struct recording_context *ctx, uint32_t value)
+static bool emit_oa_trigger(struct recording_context *ctx, uint32_t value)
 {
 	emit_mmio_triggered_report(ctx->ibb, oa_unit_mmio_trigger_reg(ctx), value);
 
 	intel_bb_flush_render(ctx->ibb);
 	intel_bb_sync(ctx->ibb);
 	intel_bb_reset(ctx->ibb, false);
+
+	ctx->mmio_trg_val = value;
+
+	return write_mmio_trigger_data(ctx);
 }
 
-static void
+static bool
 read_command_file(struct recording_context *ctx)
 {
 	struct recorder_command_base header;
 	ssize_t ret = read(ctx->command_fifo_fd, &header, sizeof(header));
 
 	if (ret < 0)
-		return;
+		return true;
 
 	switch (header.command) {
 	case RECORDER_COMMAND_DUMP: {
@@ -814,8 +836,10 @@ read_command_file(struct recording_context *ctx)
 		uint8_t *dump = malloc(len);
 		FILE *file;
 
-		emit_oa_trigger(ctx, 0xc0ffee02);
-		write_perf_data(ctx->output_stream, ctx);
+		if (!emit_oa_trigger(ctx, 0xc0ffee02)) {
+			free(dump);
+			return false;
+		}
 
 		while (offset < len &&
 		       ((ret = read(ctx->command_fifo_fd,
@@ -859,6 +883,8 @@ read_command_file(struct recording_context *ctx)
 		fprintf(stderr, "Unknown command 0x%x\n", header.command);
 		break;
 	}
+
+	return true;
 }
 
 static void
@@ -1320,7 +1346,11 @@ main(int argc, char *argv[])
 	}
 
 	init_mmio_trigger_ctx(&ctx);
-	emit_oa_trigger(&ctx, 0xc0ffee01);
+	if (!emit_oa_trigger(&ctx, 0xc0ffee01)) {
+		fprintf(stderr, "Failed to write xe-oa data: %s\n",
+			strerror(errno));
+		goto fail;
+	}
 
 	corr_period_ns = corr_period * 1000000000ul;
 	poll_time_ns = corr_period_ns;
@@ -1351,7 +1381,11 @@ main(int argc, char *argv[])
 			}
 
 			if (pollfd[1].revents & POLLIN) {
-				read_command_file(&ctx);
+				if (!read_command_file(&ctx)) {
+					fprintf(stderr, "Failed to write xe-oa data: %s\n",
+						strerror(errno));
+					break;
+				}
 			}
 		}
 
@@ -1370,7 +1404,10 @@ main(int argc, char *argv[])
 	}
 
 	/* Emit second OA trigger for the case where circular buffer is not used */
-	emit_oa_trigger(&ctx, 0xc0ffee02);
+	if (!emit_oa_trigger(&ctx, 0xc0ffee02))
+		fprintf(stderr, "Failed to write xe-oa data: %s\n",
+			strerror(errno));
+
 	fprintf(stdout, "Exiting...\n");
 
 	if (!write_perf_data(ctx.output_stream, &ctx)) {
-- 
2.53.0

