Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18715D30019
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 16:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34FD10E382;
	Fri, 18 Oct 2024 16:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDtmpK7i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E6110E382
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729268320; x=1760804320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7HNxWQbbV7w1gt8OUW5U1yVRGBKc28GBrhmnvDyar+o=;
 b=jDtmpK7iGeAvheQH8gYUhI6g1iG6yrlM9Bvzi8zMSO4xaQId7JxvKsOU
 0V/GwdHFbnfDSdwuJV+ZbYPi+LJAqpaKQ9WWr6S0KI0meLaPhLp0YKEeo
 TuK1D5k5TN/Fw+7UwCM60GZX+xuCnHXMK0b6g228PteWQCfEneiz44BDj
 9ktj8B5ztbOnLT8iQaGQ2ZVuBz3QQdBDLC6G2jEY9EAWhUP5/1IkpbDfj
 JELoVwdSj5zOFiPp7PZaSuFoBi39mIbcGG4w7TXhxCAXV0teO5ReiCH+W
 VneSa8Ndu3ouQV4A/lxX8z4Mx6bzL41m4E7D19VZJ0Xe+Y1T2ILJ1LEVw A==;
X-CSE-ConnectionGUID: mboA84qASLmRBoBUhWZjyg==
X-CSE-MsgGUID: 5ssejbIdRz2oO922ogCQtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28596781"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28596781"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 09:18:40 -0700
X-CSE-ConnectionGUID: IMSyxubzRamUtiUmx8FkyQ==
X-CSE-MsgGUID: BDQCQAKqQaOht6lL8uNChg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="79320396"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.0])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 09:18:38 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Karol Krol <karol.krol@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>
Subject: [PATCH i-g-t 2/2] runner/executor: Limit reading dmesg to chunks
Date: Fri, 18 Oct 2024 18:18:20 +0200
Message-ID: <20241018161820.76014-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018161820.76014-1-kamil.konieczny@linux.intel.com>
References: <20241018161820.76014-1-kamil.konieczny@linux.intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/129
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Karol Krol <karol.krol@intel.com>
Cc: Ewelina Musial <ewelina.musial@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 3939f92f1..9283aad97 100644
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
 
+	if (size <= 0)
+		return 0;
+
 	comparefd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
 	if (comparefd < 0) {
 		errf("Error opening another fd for /dev/kmsg\n");
@@ -690,6 +694,13 @@ static long dump_dmesg(int kmsgfd, int outfd)
 			if (seq >= cmpseq)
 				return written;
 		}
+
+		if (written >= size) {
+			if (comparefd >= 0)
+				close(comparefd);
+
+			return written;
+		}
 	}
 }
 
@@ -883,6 +894,14 @@ static void write_packet_with_canary(int fd, struct runnerpacket *packet, bool s
 /* TODO: Refactor this macro from here and from various tests to lib */
 #define KB(x) ((x) * 1024)
 
+static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
+{
+	if (!limit)
+		return KB(128 * 1024); /* 128MB */
+
+	return limit > disk_usage ? limit - disk_usage : 0;
+}
+
 /*
  * Returns:
  *  =0 - Success
@@ -915,6 +934,7 @@ static int monitor_output(pid_t child,
 	unsigned long taints = 0;
 	bool aborting = false;
 	size_t disk_usage = 0;
+	size_t dmsg_chunk_size = 4096 * max_t(size_t, sysconf(_SC_NPROCESSORS_ONLN), 16);
 	bool socket_comms_used = false; /* whether the test actually uses comms */
 	bool results_received = false; /* whether we already have test results that might need overriding if we detect an abort condition */
 
@@ -1244,7 +1264,7 @@ static int monitor_output(pid_t child,
 
 			time_last_activity = time_now;
 
-			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG]);
+			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
 			if (settings->sync)
 				fdatasync(outputs[_F_DMESG]);
 
@@ -1482,7 +1502,8 @@ static int monitor_output(pid_t child,
 					asprintf(abortreason, "Child refuses to die, tainted 0x%lx.", taints);
 				}
 
-				dump_dmesg(kmsgfd, outputs[_F_DMESG]);
+				dmsg_chunk_size = calc_last_dmesg_chunk(settings->disk_usage_limit, disk_usage);
+				dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
 				if (settings->sync)
 					fdatasync(outputs[_F_DMESG]);
 
@@ -1508,7 +1529,8 @@ static int monitor_output(pid_t child,
 		}
 	}
 
-	dump_dmesg(kmsgfd, outputs[_F_DMESG]);
+	dmsg_chunk_size = calc_last_dmesg_chunk(settings->disk_usage_limit, disk_usage);
+	dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
 	if (settings->sync)
 		fdatasync(outputs[_F_DMESG]);
 
-- 
2.47.0

