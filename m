Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD89C79F82
	for <igt-dev@archiver.kernel.org>; Sat,  5 Sep 2026 01:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D9510E22D;
	Sat,  5 Sep 2026 01:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUJ9vtxp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22A210E22D
 for <igt-dev@lists.freedesktop.org>; Sat,  5 Sep 2026 01:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788571262; x=1820107262;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=STMryn3pa71s5ukffyttDy7yJmi/ENVE/lKL9apX9RI=;
 b=dUJ9vtxpf2ChVrlQAMGuw6c8m9Td3F3C1466W5A5bJRda0vHCR4BIfMG
 AaCP0rx0oJ7KVbLsM2w7p+ey4695DPwLGggvt8MALMHoHgZFo9sJV1AG5
 D0mfoh5nhAhaJ/s0AXzxcc+WhTx9r8XC5a9nWh7Hh1ea5IY+xOTvNEWO2
 l9e7blOGdv/NOHWEuPZQr2yyPsxsNNCRy+yHDbn/c9Nd1mqJqfvayTb5L
 UXO5svExfBguVG4ZEb2yzN5P+D15n6dHNMNXfSdn1wz611J+pbu1ok7wC
 g1i4T5ISjdUMq2V2JcxyTT2bVnNQ3XOqq2YyVNeBRsmFapBhtvKeOcWrL w==;
X-CSE-ConnectionGUID: kIizl4zkTl+ubu1rg9ONYA==
X-CSE-MsgGUID: shSi47Y7QOSrHGc16tAYuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88953055"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="88953055"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 18:21:01 -0700
X-CSE-ConnectionGUID: woxF+3g8Rf+umOsSlgaTJw==
X-CSE-MsgGUID: owBYlCUtS3uQvVr8GA0WpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="272120992"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 18:21:01 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: [PATCH i-g-t v2] tools/xe-perf-recorder: Wait for mmio-trigger-report
Date: Fri,  4 Sep 2026 18:20:55 -0700
Message-ID: <20260905012055.494831-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.55.0
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

After mmio trigger is issued, we should wait till we receive a report with
the context id issued in the mmio trigger.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/xe-perf/xe_perf_recorder.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index e13eef5190..cb7ca67bdb 100644
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
@@ -712,6 +715,18 @@ static bool write_perf_data(FILE *output, struct recording_context *ctx)
 	return false;
 }
 
+static void write_mmio_trigger_data(struct recording_context *ctx)
+{
+	struct pollfd pollfd = { .fd = ctx->perf_fd, .events = POLLIN };
+
+	while (ctx->mmio_trg_val) {
+		poll(&pollfd, 1, -1);
+		assert(pollfd.revents & POLLIN);
+
+		write_perf_data(ctx->output_stream, ctx);
+	}
+}
+
 static clock_t correlation_clock_id = CLOCK_MONOTONIC;
 
 static const char *
@@ -797,6 +812,9 @@ static void emit_oa_trigger(struct recording_context *ctx, uint32_t value)
 	intel_bb_flush_render(ctx->ibb);
 	intel_bb_sync(ctx->ibb);
 	intel_bb_reset(ctx->ibb, false);
+
+	ctx->mmio_trg_val = value;
+	write_mmio_trigger_data(ctx);
 }
 
 static void
@@ -815,7 +833,6 @@ read_command_file(struct recording_context *ctx)
 		FILE *file;
 
 		emit_oa_trigger(ctx, 0xc0ffee02);
-		write_perf_data(ctx->output_stream, ctx);
 
 		while (offset < len &&
 		       ((ret = read(ctx->command_fifo_fd,
-- 
2.51.0

