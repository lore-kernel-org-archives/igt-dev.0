Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4CCD29DE4
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 08:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBD310E465;
	Tue, 13 Jan 2026 08:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZtP/JA9v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE91E10E45A
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 08:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768291594; x=1799827594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eJpglTgiRSHzz/+kcVeiw61evmPFZhf5PoHvzoyA5tI=;
 b=ZtP/JA9vkg7W98frQ+cE23osnCVMXlg0rFilLL17lVn3UGimwiJ7xwB+
 pP7Mc8qUKmThVNS9j4Iqrg6BxVRMhjW109/1IH1J6+6gq0ANAz1Fttkd8
 nTo93Nd2DyaPfoxWCbqHG9AfDrCDT3vMOtAqbEvVKjEZDL0kTjbjU9F2T
 sU52l04qiMiUnP7XxjJ5usmiBEto6toueUE6SThgjew8K+29Rtb7qSKY4
 ZoezA0uHvm8yRx6gnSNXVp1qqcpEDVo/v1zNJy3JWmV3JfZANCkNRyVhU
 8UQpaNg4LD2TAtZr/u9NfC1xvq1HLI0MDLmYOA44yDuBCmX8R2yllq7oo w==;
X-CSE-ConnectionGUID: rIULh/M7T16Vr7xMzylLgA==
X-CSE-MsgGUID: UbiwMGaIQLeNduKAmRDF5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="72153002"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="72153002"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:06:34 -0800
X-CSE-ConnectionGUID: uK5zh+D/RwG49FWaGTO/2w==
X-CSE-MsgGUID: xjA1YxkfQb2Kzm2uXhQkcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204212075"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:06:34 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 1/1] runner/executor: Adaptive dmesg disk write
Date: Tue, 13 Jan 2026 08:06:25 +0000
Message-ID: <20260113080625.208986-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113080625.208986-1-sobin.thomas@intel.com>
References: <20260113080625.208986-1-sobin.thomas@intel.com>
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

In current scenario  when disk usage limit is exceeded during a test, in
batch mode the test exits abruptly.  Implement a logging suppression
mechanism that drains kernel messages without writing to disk, allowing
the test to complete.

- Add suppress parameter to dump_dmesg() to control disk write
- Return 0 bytes written when suppression enabled (prevents disk writes)
- Write status message when limit is reached, then continue test

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 runner/executor.c | 65 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 11 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 847abe481..9fc148d4b 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -638,7 +638,7 @@ const char *get_out_filename(int fid)
 }
 
 /* Returns the number of bytes written to disk, or a negative number on error */
-static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
+static long dump_dmesg(int kmsgfd, int outfd, ssize_t size, bool suppress)
 {
 	/*
 	 * Write kernel messages to the log file until we reach
@@ -656,6 +656,7 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
 	char buf[2048];
 	ssize_t r;
 	long written = 0;
+	long drained = 0;
 
 	if (kmsgfd < 0)
 		return 0;
@@ -703,16 +704,23 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
 				continue;
 			} else if (errno != EAGAIN) {
 				errf("Error reading from kmsg: %m\n");
+				if (comparefd >= 0)
+					close(comparefd);
 				return -errno;
 			}
 
 			/* EAGAIN, so we're done dumping */
-			close(comparefd);
-			return written;
+			if (comparefd >= 0)
+				close(comparefd);
+			return suppress ? 0 : written;
 		}
 
-		write(outfd, buf, r);
-		written += r;
+		if (!suppress) {
+			write(outfd, buf, r);
+			written += r;
+		} else {
+			drained += r;
+		}
 
 		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
 					    &flags, &seq, &usec, &cont) == 4) {
@@ -722,15 +730,20 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
 			 * enough.
 			 */
 			if (seq >= cmpseq)
-				return written;
+				return suppress ? 0 : written;
 		}
 
-		if (size && written >= size) {
+		if (!suppress && size && written >= size) {
 			if (comparefd >= 0)
 				close(comparefd);
 
 			return written;
 		}
+		if (suppress && size && drained >= size) {
+			if (comparefd >= 0)
+				close(comparefd);
+			return 0;
+		}
 	}
 }
 
@@ -984,6 +997,8 @@ static int monitor_output(pid_t child,
 	long dmesgwritten;
 	bool socket_comms_used = false; /* whether the test actually uses comms */
 	bool results_received = false; /* whether we already have test results that might need overriding if we detect an abort condition */
+	bool logging_disabled = false;
+	bool suppress_logging = false;
 
 	runner_gettime(&time_beg);
 	time_last_activity = time_last_subtest = time_killed = time_beg;
@@ -1309,7 +1324,8 @@ static int monitor_output(pid_t child,
 		if (kmsgfd >= 0 && FD_ISSET(kmsgfd, &set)) {
 			time_last_activity = time_now;
 
-			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
+			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size,
+						  suppress_logging);
 			if (settings->sync)
 				fdatasync(outputs[_F_DMESG]);
 
@@ -1321,6 +1337,32 @@ static int monitor_output(pid_t child,
 			}
 		}
 
+		/* Check if we need to disable logging due to disk usage limit */
+
+		if (!logging_disabled && disk_usage_limit_exceeded(settings, disk_usage)) {
+			char msg[256];
+
+			suppress_logging = true;
+			logging_disabled = true;
+
+			/* Write warning message to output files */
+			snprintf(msg, sizeof(msg),
+				 "\n[RUNNER] Disk usage limit reached (%zu/%zu bytes). "
+				 "Disabling further logging and DRM debug. Test continues.\n ",
+				 disk_usage, settings->disk_usage_limit);
+
+			write(outputs[_F_OUT], msg, strlen(msg));
+			write(outputs[_F_ERR], msg, strlen(msg));
+
+			if (settings->log_level >= LOG_LEVEL_NORMAL)
+				fprintf(stderr, "%s", msg);
+
+			if (settings->sync) {
+				fdatasync(outputs[_F_OUT]);
+				fdatasync(outputs[_F_ERR]);
+			}
+		}
+
 		if (sigfd >= 0 && FD_ISSET(sigfd, &set)) {
 			double time;
 
@@ -1539,7 +1581,7 @@ static int monitor_output(pid_t child,
 						 igt_time_elapsed(&time_killed, &time_now),
 						 disk_usage);
 
-		if (timeout_reason) {
+		if (timeout_reason && !suppress_logging) {
 			if (killed == SIGKILL) {
 				/* Nothing that can be done, really. Let's tell the caller we want to abort. */
 
@@ -1553,7 +1595,8 @@ static int monitor_output(pid_t child,
 				}
 
 				dmsg_chunk_size = calc_last_dmesg_chunk(settings->disk_usage_limit, disk_usage);
-				dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
+				dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size,
+					   suppress_logging);
 				if (settings->sync)
 					fdatasync(outputs[_F_DMESG]);
 
@@ -1584,7 +1627,7 @@ static int monitor_output(pid_t child,
 	}
 
 	dmsg_chunk_size = calc_last_dmesg_chunk(settings->disk_usage_limit, disk_usage);
-	dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
+	dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size, suppress_logging);
 	if (settings->sync)
 		fdatasync(outputs[_F_DMESG]);
 	if (dmesgwritten > 0) {
-- 
2.51.0

