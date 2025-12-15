Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C9CD59D99
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 10:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7906610E2B8;
	Mon, 15 Dec 2025 10:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NqY+IjUz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F2C10E2B8
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 10:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765794798; x=1797330798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mnG7LVKT+NWg5t+hy8g53VOGRwszDzgrabtN48fMY3g=;
 b=NqY+IjUzDTPtL2+c4okLZnLh0zLyGGUjtZDLV+oT+zpCigy7mkqnLm7f
 PIGo8p2Jn4cTdEONfJwjZsHI9sz2s4CV+cjZtBFFQheDARrqILIZa3BJn
 fAoWtw4cNtPl6oDryWc2Vj6ctSDU0phawt4t2dVy57rf8eYiK488P+Hax
 bGBhdhBvs/hKzkMZ59hV83WNSjBuuYc7j8Xv9nxqzpYSkObvyXbkbg60W
 H9A3TlKun+eghdfeOZBwGLOl7yPb7ciwMX1iKFGiqF2Kyp9HbAu2l3mN2
 7p/R27zYy+8rIyDK7LtRU16IWDmCLFr6Wz7rfVVWs0W8tk5S6wS+WJl37 g==;
X-CSE-ConnectionGUID: Cn37V2YdQb+thQbLgYPEEA==
X-CSE-MsgGUID: N+xX1zqgRye6wfHpTuN7Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="79148273"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="79148273"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:33:18 -0800
X-CSE-ConnectionGUID: kLpcup4MQAqpEtUex4XEBw==
X-CSE-MsgGUID: /Gn9QNQeR2K2tUqdnnMCzQ==
X-ExtLoop1: 1
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:33:18 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 1/1] feat: Enable/Disable DRM debug logging between
 tests in shard mode
Date: Mon, 15 Dec 2025 10:33:05 +0000
Message-ID: <20251215103305.445335-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251215103305.445335-1-sobin.thomas@intel.com>
References: <20251215103305.445335-1-sobin.thomas@intel.com>
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

In shard mode, when disk usage limit is exceeded during a test, DRM
debug logging is disabled by writing "0" to /sys/module/drm/parameters/debug
to prevent premature exit. However, this disabled state persisted across
subsequent tests in the same shard, causing loss of debug information for
tests that did not exceed the disk limit.

Add a global flag to track when DRM debug was disabled in a previous test.
At the start of each new test in monitor_output(), check this flag and
restore DRM debug logging to the original value (or default "14" if the
original value could not be saved). Verify the write succeeded by reading
back the value, retrying up to 10 times with 100ms delays if needed.

The original DRM debug value is saved once at startup in execute() before
any tests run, ensuring we can restore to the correct state. The per-test
logging_disabled flag remains local to monitor_output() to track state
within the current test execution.

This ensures each test starts with a clean state and proper debug logging,
while still allowing dynamic disabling when disk limits are exceeded.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 runner/executor.c | 148 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 147 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index 847abe481..8b1bb4d33 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -45,12 +45,15 @@
 #define KMSG_HEADER "[IGT] "
 #define KMSG_WARN 4
 #define GRACEFUL_EXITCODE -SIGHUP
-
+#define DRM_DEBUG_DEFAULT "14"
+#define DRM_DEBUG_DISABLE "0x0"
 static struct {
 	int *fds;
 	size_t num_dogs;
 } watchdogs;
 
+static bool global_logging_disabled;
+
 static void runner_gettime(struct timespec *tv)
 {
 	if (clock_gettime(CLOCK_BOOTTIME, tv))
@@ -948,6 +951,111 @@ static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
 	return dt != 0 ? dt : -1;
 }
 
+static char original_drm_debug[16] = {0};
+static bool drm_debug_saved;
+
+static void restore_drm_debug(void)
+{
+	int fd;
+	static const char default_debug[] = "14";
+	const char *value_to_write;
+	char readback[16];
+	ssize_t cnt;
+	int retries = 10;
+	bool success = false;
+
+	// Use saved value if available, otherwise use default "14"
+	value_to_write = drm_debug_saved ? original_drm_debug : DRM_DEBUG_DEFAULT;
+	outf("Restoring DRM Debug to %s", value_to_write);
+	while (retries-- > 0 && !success) {
+		outf("Restoring DRM Debug");
+		/* Write the value */
+		fd = open("/sys/module/drm/parameters/debug", O_WRONLY);
+		if (fd >= 0) {
+			write(fd, default_debug, sizeof(default_debug) - 1);
+			close(fd);
+		} else {
+			errf("Failed to open /sys/module/drm/parameters/debug"
+			     "for writing: %m\n");
+			break;
+		}
+
+	/* Read it back to verify */
+	fd = open("/sys/module/drm/parameters/debug", O_RDONLY);
+	if (fd >= 0) {
+		cnt = read(fd, readback, sizeof(readback) - 1);
+		if (cnt > 0) {
+			readback[cnt] = '\0';
+			/* Remove trailing newline if present */
+			if (cnt > 0 && readback[cnt - 1] == '\n')
+				readback[cnt - 1] = '\0';
+
+			/* Check if it matches what we wrote */
+			if (strcmp(readback, DRM_DEBUG_DEFAULT) == 0) {
+				outf("Write Success");
+				success = true;
+				if (settings->log_level >= LOG_LEVEL_NORMAL) {
+					errf("[RUNNER] Successfully restored "
+					     "DRM debug to %s\n", readback);
+				}
+			} else {
+				errf("[RUNNER] DRM debug readback mismatch:"
+				     "wrote 14, read %s (retry %d)\n",
+					readback, 10 - retries);
+				usleep(100000); /* Wait 100ms before retry */
+			}
+		}
+		close(fd);
+	} else {
+		errf("Failed to open /sys/module/drm/parameters/debug for reading: %m\n");
+		break;
+	}
+	}
+
+	if (!success)
+		errf("[RUNNER] Failed to restore DRM debug to default "
+		     "after 10 retries\n");
+}
+
+static void disable_drm_debug(void)
+{
+	int fd;
+	static const char zero[] = "0x0";
+	const char *msg = "[RUNNER] logging disabled due to disk usage limit\n";
+	int cnt = 0;
+	// Save the current value before disabling
+	if (!drm_debug_saved) {
+		fd = open("/sys/module/drm/parameters/debug", O_RDONLY);
+	if (fd >= 0) {
+		cnt = read(fd, original_drm_debug, sizeof(original_drm_debug) - 1);
+		if (cnt > 0) {
+			original_drm_debug[cnt] = '\0';
+			// Remove trailing newline if present
+			if (cnt > 0 && original_drm_debug[cnt - 1] == '\n')
+				original_drm_debug[cnt - 1] = '\0';
+			drm_debug_saved = true;
+		}
+		close(fd);
+		}
+	}
+
+	fd = open("/sys/module/drm/parameters/debug", O_WRONLY);
+	if (fd >= 0) {
+		write(fd, zero, sizeof(zero) - 1);
+		close(fd);
+		fprintf(stdout, "%s", msg);
+		fprintf(stderr, "%s", msg);
+
+		fflush(stdout);
+		fflush(stderr);
+
+		/* Log to kernel that we disabled debug */
+		kmsg_log(4, "igt_runner: Disabled DRM debug due to disk usage limit\n");
+	}
+	global_logging_disabled = true;
+}
+
+
 /*
  * Returns:
  *  =0 - Success
@@ -984,10 +1092,20 @@ static int monitor_output(pid_t child,
 	long dmesgwritten;
 	bool socket_comms_used = false; /* whether the test actually uses comms */
 	bool results_received = false; /* whether we already have test results that might need overriding if we detect an abort condition */
+	bool logging_disabled = false;
 
 	runner_gettime(&time_beg);
 	time_last_activity = time_last_subtest = time_killed = time_beg;
 
+	/* Restore DRM debug at the start of each test if it was disabled earlier */
+	if (global_logging_disabled) {
+		restore_drm_debug();
+		global_logging_disabled = false;
+
+		if (settings->log_level >= LOG_LEVEL_NORMAL)
+			outf("[RUNNER] Restored DRM debug logging for new test\n");
+	}
+
 	if (errfd > nfds)
 		nfds = errfd;
 	if (socketfd > nfds)
@@ -1321,6 +1439,34 @@ static int monitor_output(pid_t child,
 			}
 		}
 
+		/* Check if we need to disable logging due to disk usage limit */
+
+		if (!logging_disabled && disk_usage_limit_exceeded(settings, disk_usage)) {
+			char msg[256];
+
+			logging_disabled = true;
+
+			/* Disable DRM debug to reduce dmesg spam */
+			disable_drm_debug();
+
+			/* Write warning message to output files */
+			snprintf(msg, sizeof(msg),
+				"\n[RUNNER] Disk usage limit reached (%zu/%zu bytes). "
+				"Disabling further logging and DRM debug. Test continues.\n ",
+				disk_usage, settings->disk_usage_limit);
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
 
-- 
2.51.0

