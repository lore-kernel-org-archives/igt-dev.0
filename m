Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D3DD729FD
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 20:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23D310E366;
	Fri, 29 Nov 2024 20:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdKoc5ip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3E710E366
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 20:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732913162; x=1764449162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gDJ/AeE0QeXA4N1w7DnVCJYoVhlsBQcHeDfp2SgHfeo=;
 b=hdKoc5ipGaHVFV5GrVqqxbTo0QvylKGwlhtrKHM/5gsxXxWMbREYVqJB
 AcOymGJJq5Uz9JvZSTRIXzG6QHBLyG/r9Rr+Ew5fcVeqelY9b2p3V8jNt
 KhtD8pQf+3Jv50b/7xn/nMOcH3MDVPgxMEPDAA9JGMcsgyuKczRXu44h6
 kkh+cMOJ7r4h2wUxIuoI9W+3bV3d/be9eHtcHrvx/2Mf+djP4Aom1+2po
 BIkHCQNftCZ6HYP8lpKgxjdbXiU/MIleMPGcOOFQ4E/KQyeCCZedRFB7c
 gjaa03Ys8fDt/Zy8v+Qd9rCnRWbsa8J8bjP1ACVkj0j591b+SwhtQvVQV A==;
X-CSE-ConnectionGUID: SRcVU/OoRGKuHRRigaswUQ==
X-CSE-MsgGUID: 35giBP4OSZ6WOufoty9/Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33284311"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="33284311"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 12:46:02 -0800
X-CSE-ConnectionGUID: LExTKebwQmilM0kbdRB4rw==
X-CSE-MsgGUID: J+wINWWgShCH+QPCaBE4IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="123519892"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.213])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 12:45:59 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Karol Krol <karol.krol@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>, Ryszard Knop <rk@dragonic.eu>
Subject: [PATCH i-g-t v3 1/3] runner/executor: Limit reading dmesg to chunks
Date: Fri, 29 Nov 2024 21:45:48 +0100
Message-ID: <20241129204550.116355-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241129204550.116355-1-kamil.konieczny@linux.intel.com>
References: <20241129204550.116355-1-kamil.konieczny@linux.intel.com>
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

There was no disk limit checks in reading kernel dmesg and that
could lead to writing really huge dumps longer than 400MB,
greatly exceeding disk limits used by CI and hardly useful for
developers. Make a dmesg dumping in chunks, size depending on
number of CPUs present, with a minimum of 64KB.
This could also allow to kick in disk limits checks if a driver
starts spilling messages into dmesg.

v2: correct size at last dump, also inform user about exceeding
  limits (Kamil)

Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/129
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Karol Krol <karol.krol@intel.com>
Cc: Ewelina Musial <ewelina.musial@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by: Ryszard Knop <rk@dragonic.eu>
---
 runner/executor.c | 64 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 9 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index ac73e1dde..16b12ba16 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -585,13 +585,14 @@ void close_outputs(int *fds)
 }
 
 /* Returns the number of bytes written to disk, or a negative number on error */
-static long dump_dmesg(int kmsgfd, int outfd)
+static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
 {
 	/*
 	 * Write kernel messages to the log file until we reach
-	 * 'now'. Unfortunately, /dev/kmsg doesn't support seeking to
-	 * -1 from SEEK_END so we need to use a second fd to read a
-	 * message to match against, or stop when we reach EAGAIN.
+	 * 'now' or we read at least size bytes. Unfortunately,
+	 * /dev/kmsg doesn't support seeking to -1 from SEEK_END
+	 * so we need to use a second fd to read a message to
+	 *  match against, or stop when we reach EAGAIN.
 	 */
 
 	int comparefd;
@@ -606,6 +607,9 @@ static long dump_dmesg(int kmsgfd, int outfd)
 	if (kmsgfd < 0)
 		return 0;
 
+	if (size < 0)
+		return 0;
+
 	comparefd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
 	if (comparefd < 0) {
 		errf("Error opening another fd for /dev/kmsg\n");
@@ -667,6 +671,13 @@ static long dump_dmesg(int kmsgfd, int outfd)
 			if (seq >= cmpseq)
 				return written;
 		}
+
+		if (size && written >= size) {
+			if (comparefd >= 0)
+				close(comparefd);
+
+			return written;
+		}
 	}
 }
 
@@ -860,6 +871,25 @@ static void write_packet_with_canary(int fd, struct runnerpacket *packet, bool s
 /* TODO: Refactor this macro from here and from various tests to lib */
 #define KB(x) ((x) * 1024)
 
+#if !defined(SIZE_MAX)
+#define SIZE_MAX (((size_t)-1) ^ (1 << (8 * sizeof(size_t) - 1)))
+#endif
+
+/* Calculates disk limit to use when dumping dmesg, returns:
+ * number > 0	: size of limit to use
+ * number < 0	: negative number when limit exceeded, no more dumping
+ **/
+static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
+{
+	size_t dt = limit - disk_usage;
+
+	assert(SIZE_MAX > 0);
+	if (!limit)
+		return SIZE_MAX; /* no limit */
+
+	return dt != 0 ? dt : -1;
+}
+
 /*
  * Returns:
  *  =0 - Success
@@ -892,6 +922,8 @@ static int monitor_output(pid_t child,
 	unsigned long taints = 0;
 	bool aborting = false;
 	size_t disk_usage = 0;
+	size_t dmsg_chunk_size = 4096 * max_t(size_t, sysconf(_SC_NPROCESSORS_ONLN), 16);
+	long dmesgwritten;
 	bool socket_comms_used = false; /* whether the test actually uses comms */
 	bool results_received = false; /* whether we already have test results that might need overriding if we detect an abort condition */
 
@@ -1217,11 +1249,9 @@ static int monitor_output(pid_t child,
 	socket_end:
 
 		if (kmsgfd >= 0 && FD_ISSET(kmsgfd, &set)) {
-			long dmesgwritten;
-
 			time_last_activity = time_now;
 
-			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG]);
+			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
 			if (settings->sync)
 				fdatasync(outputs[_F_DMESG]);
 
@@ -1459,7 +1489,8 @@ static int monitor_output(pid_t child,
 					asprintf(abortreason, "Child refuses to die, tainted 0x%lx.", taints);
 				}
 
-				dump_dmesg(kmsgfd, outputs[_F_DMESG]);
+				dmsg_chunk_size = calc_last_dmesg_chunk(settings->disk_usage_limit, disk_usage);
+				dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
 				if (settings->sync)
 					fdatasync(outputs[_F_DMESG]);
 
@@ -1485,9 +1516,24 @@ static int monitor_output(pid_t child,
 		}
 	}
 
-	dump_dmesg(kmsgfd, outputs[_F_DMESG]);
+	dmsg_chunk_size = calc_last_dmesg_chunk(settings->disk_usage_limit, disk_usage);
+	dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
 	if (settings->sync)
 		fdatasync(outputs[_F_DMESG]);
+	if (dmesgwritten > 0) {
+		disk_usage += dmesgwritten;
+		if (settings->disk_usage_limit && disk_usage > settings->disk_usage_limit) {
+			char disk[1024];
+
+			snprintf(disk, sizeof(disk), "igt_runner: disk limit exceeded at dmesg dump, %ld > %ld\n", disk_usage, settings->disk_usage_limit);
+			if (settings->log_level >= LOG_LEVEL_NORMAL) {
+				outf("%s", disk);
+				fflush(stdout);
+			} else if (killed) {
+				errf("%s", disk);
+			}
+		}
+	}
 
 	free(buf);
 	free(outbuf);
-- 
2.47.1

