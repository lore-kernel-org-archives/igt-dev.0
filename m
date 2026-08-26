Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75BDC5DF97
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 04:22:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4FB10E241;
	Wed, 26 Aug 2026 04:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZPkNJr7j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F8810E241
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 04:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787718128; x=1819254128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YgJQbY6qnvNDZcVSSP+gDTbNvlPZ+VTpO8hZ9uhbLXI=;
 b=ZPkNJr7j/JN9WjngQYBlTDFxJ1lO3aB+8w7W+8EipAkopqzJftL7/bAy
 S122kXWiWWOmpf6UmHMl+cqElC9By6zhrjZpONrCYsRNMuFxMORzTyvab
 cInJCdRCQ6c2+MFdQC51rXJ1qHKiVNnzX5nenQ2UWxPR9hORnTmw69U9/
 6kQj8Kdd0/3DI3tnueEdmUXYD+TYIZJ4EiyGkjYQvBuZqXcPuX9mYfNas
 YRLgIT2SY01R6RzLCU2rOwkAak4YiL8J/QWuC1b6L8bXvQq+mChSf1rDW
 4BayIOghqmRNf5vSIlsx/bWdxOh4k4+1GjylqdYlvj9HNG6vS5gToTSYE g==;
X-CSE-ConnectionGUID: qYlDnM/mTY2XgeGDb3KwqA==
X-CSE-MsgGUID: LpzpNQCkRrutdIqZs9X6kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="105569930"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="105569930"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 21:22:07 -0700
X-CSE-ConnectionGUID: WVFm9+daR8uANWR2PIxQDQ==
X-CSE-MsgGUID: ZPfS4xwJRbihey0TM6vBmw==
X-ExtLoop1: 1
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 21:22:06 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	shekhar.chauhan@intel.com
Subject: [PATCH i-g-t] tools/xe-perf-recorder: Wait for mmio-trigger-report
Date: Wed, 26 Aug 2026 09:51:59 +0530
Message-ID: <20260826042159.2346433-1-shekhar.chauhan@intel.com>
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

Trigger reports can be delayed in the OA buffer, so reading it every
second affects performance. Only read mmio-triggers if expected. Normal
recording operations is assigned a wait_value 0 to keep it unchanged.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tools/xe-perf/xe_perf_recorder.c | 43 +++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index e13eef519..a1996caed 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -635,20 +635,24 @@ report_reason(const uint32_t *report)
 	return (report[0] >> OAREPORT_REASON_SHIFT) & OAREPORT_REASON_MASK;
 }
 
-static void
-check_mmio_trigger_report(struct recording_context *ctx, const void *report)
+static bool
+check_mmio_trigger_report(struct recording_context *ctx, const void *report,
+			  uint32_t value)
 {
 	const struct xe_oa_format *fmt = &oa_formats[ctx->metric_set->perf_oa_format];
 	const uint32_t *report_32 = report;
-	uint64_t value;
+	uint64_t v;
 
 	if (report_reason(report_32))
-		return;
+		return false;
+
+	v = (fmt->header == HDR_64_BIT) ? ((const uint64_t *)report)[2] : report_32[2];
 
-	value = (fmt->header == HDR_64_BIT) ? ((const uint64_t *)report)[2] : report_32[2];
+	if (v != value)
+		return false;
 
-	if (value == 0xc0ffee01 || value == 0xc0ffee02)
-		fprintf(stdout, "Received trigger report with value 0x%" PRIx64 "\n", value);
+	fprintf(stdout, "Received trigger report with value 0x%" PRIx64 "\n", v);
+	return true;
 }
 
 static bool write_stream_data(struct recording_context *ctx,
@@ -664,8 +668,6 @@ static bool write_stream_data(struct recording_context *ctx,
 			.size = sizeof(header) + format_size,
 		};
 
-		check_mmio_trigger_report(ctx, data);
-
 		if (fwrite(&header, sizeof(header), 1, output) != 1)
 			return false;
 
@@ -678,8 +680,12 @@ static bool write_stream_data(struct recording_context *ctx,
 	return true;
 }
 
-static bool write_perf_data(FILE *output, struct recording_context *ctx)
+static bool write_perf_data(FILE *output, struct recording_context *ctx,
+			    uint32_t wait_value)
 {
+	ssize_t format_size = oa_formats[ctx->metric_set->perf_oa_format].size;
+	struct pollfd pfd = { .fd = ctx->perf_fd, .events = POLLIN };
+	bool found = false;
 	char data[4096];
 	ssize_t len;
 	bool ret;
@@ -696,7 +702,11 @@ static bool write_perf_data(FILE *output, struct recording_context *ctx)
 				break;
 			case EAGAIN:
 			case EINTR:
-				return true;
+				/* Keep waiting until the mmio trigger report shows up. */
+				if (!wait_value || found)
+					return true;
+				poll(&pfd, 1, -1);
+				break;
 			default:
 				/* Not expecting -EFAULT, -ENOSPC, -EINVAL */
 				assert(0);
@@ -705,6 +715,10 @@ static bool write_perf_data(FILE *output, struct recording_context *ctx)
 			ret = write_stream_data(ctx, data, len, output);
 			if (!ret)
 				return ret;
+
+			for (int i = 0; wait_value && !found && i < len / format_size; i++)
+				found = check_mmio_trigger_report(ctx, data + i * format_size,
+								  wait_value);
 		}
 	}
 
@@ -815,7 +829,7 @@ read_command_file(struct recording_context *ctx)
 		FILE *file;
 
 		emit_oa_trigger(ctx, 0xc0ffee02);
-		write_perf_data(ctx->output_stream, ctx);
+		write_perf_data(ctx->output_stream, ctx, 0xc0ffee02);
 
 		while (offset < len &&
 		       ((ret = read(ctx->command_fifo_fd,
@@ -1321,6 +1335,7 @@ main(int argc, char *argv[])
 
 	init_mmio_trigger_ctx(&ctx);
 	emit_oa_trigger(&ctx, 0xc0ffee01);
+	write_perf_data(ctx.output_stream, &ctx, 0xc0ffee01);
 
 	corr_period_ns = corr_period * 1000000000ul;
 	poll_time_ns = corr_period_ns;
@@ -1343,7 +1358,7 @@ main(int argc, char *argv[])
 
 		if (ret > 0) {
 			if (pollfd[0].revents & POLLIN) {
-				if (!write_perf_data(ctx.output_stream, &ctx)) {
+				if (!write_perf_data(ctx.output_stream, &ctx, 0)) {
 					fprintf(stderr, "Failed to write xe-oa data: %s\n",
 						strerror(errno));
 					break;
@@ -1373,7 +1388,7 @@ main(int argc, char *argv[])
 	emit_oa_trigger(&ctx, 0xc0ffee02);
 	fprintf(stdout, "Exiting...\n");
 
-	if (!write_perf_data(ctx.output_stream, &ctx)) {
+	if (!write_perf_data(ctx.output_stream, &ctx, 0xc0ffee02)) {
 		fprintf(stderr, "Failed to write xe-oa data: %s\n",
 			strerror(errno));
 	}
-- 
2.53.0

