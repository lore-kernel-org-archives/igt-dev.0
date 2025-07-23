Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EF3C83F1A
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 14:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF0410E7E2;
	Wed, 23 Jul 2025 14:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKJ6IL71";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE9910E7DE
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753280295; x=1784816295;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f3Z1uPJZUKu70NYXfC4QyeveuXL5vg6yodWdfRtkeEw=;
 b=VKJ6IL71iRK2nr001HKI+uj6Su8Lbja5LJlBap614NrZTEO4zjFokn4I
 0tKH/TKxuhtZkAgtkcGvQ2Qcd+Bdwisu/DWFdZVLSBwrS78C/KcM6nv7D
 b6Ex3AlCUWbDqHTRUfiaJ6i0rXhsNN//CWaeJ5JuKWAv3AM7rgO2Nciqr
 U9UJHIQyMgtk54YRGNwqRNuA9R0Lbd2OQavJUG3VgoT8Qp8yTFGyiFOzM
 lNyr0DJu04CwZYUU9aIYPP3AQP3jP6L1q7Jwx2pmjoApn/Y7J5FX0kw94
 lBjA2Z9zM087NZ4K7T1edD+zuSqamsw6l1HrOpXpx+0cU3OjtkMqez5DI w==;
X-CSE-ConnectionGUID: z0go9EFAQ5mvS+hVC0cVAA==
X-CSE-MsgGUID: RpqRqpX6RWSXBCmJqJPUMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66131219"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="66131219"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 07:18:15 -0700
X-CSE-ConnectionGUID: unZxhUqEQpmUnwK/Pnf8Wg==
X-CSE-MsgGUID: I5Uy0HH1SI64nF5YZha1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="163781611"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.245.108])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 07:18:12 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>, Petri Latvala <adrinael@adrinael.net>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3] runner/executor: Abort if dmesg is flooded
Date: Wed, 23 Jul 2025 16:18:09 +0200
Message-ID: <20250723141809.72016-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Current disk limit triggers once when it is exceeded during test
monitoring. After that happens executor no longer checks if
kernel is still printing plenty of messages.

Create a way to abort test in such scenarios with the help of
measureing kernel kmsg activity before first test is executed
and then also check it after exceeding disk limit.

Also print info about it after each test ends.

v2: fix error when kmsg open fails, fix reading proc (Kamil)
  changed calculation of max bps (Peter)
v3: abort only when disk limit was actually exceeded,
  print info instead of aborting after every test (Kamil)

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Karol Krol <karol.krol@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 206 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 2 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 847abe481..cc7f03afc 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -637,6 +637,11 @@ const char *get_out_filename(int fid)
 	return "output-filename-index-error";
 }
 
+static int open_kmsg_rdonly(void)
+{
+	return open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK);
+}
+
 /* Returns the number of bytes written to disk, or a negative number on error */
 static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
 {
@@ -734,6 +739,95 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
 	}
 }
 
+/*
+ * Measure how many bytes appears in dmesg.
+ * This is the same as above dump_dmesg() but with reading only.
+ */
+static unsigned long long read_dmesg2(int kmsgfd, unsigned long long size, int wrfd)
+{
+	bool underflow_once = false;
+	int comparefd;
+	char buf[2048];
+	unsigned int flags;
+	unsigned long long readed = 0;
+	unsigned long long seq, cmpseq, usec;
+	char cont;
+	ssize_t r;
+
+	if (kmsgfd < 0)
+		return 0;
+
+	if (wrfd < 0)
+		wrfd = 0;
+
+	comparefd = open_kmsg_rdonly();
+	if (comparefd < 0) {
+		errf("Error opening another fd for /dev/kmsg\n");
+		return 0;
+	}
+
+	lseek(comparefd, 0, SEEK_END);
+
+	while (1) {
+		if (comparefd >= 0) {
+			r = read(comparefd, buf, sizeof(buf) - 1);
+			if (r < 0) {
+				if (errno != EAGAIN && errno != EPIPE) {
+					errf("Warning: Error reading kmsg comparison record: %m\n");
+					close(comparefd);
+					return readed;
+				}
+			} else {
+				buf[r] = '\0';
+				if (sscanf(buf, "%u,%llu,%llu,%c;",
+					   &flags, &cmpseq, &usec, &cont) == 4) {
+					close(comparefd);
+					comparefd = -1;
+				}
+			}
+		}
+
+		r = read(kmsgfd, buf, sizeof(buf));
+		if (r < 0) {
+			if (errno == EPIPE) {
+				if (!underflow_once) {
+					errf("Warning: kernel log ringbuffer underflow, some records lost.\n");
+					underflow_once = true;
+				}
+				continue;
+			} else if (errno == EINVAL) {
+				errf("Warning: Buffer too small for kernel log record, record lost.\n");
+				continue;
+			} else if (errno != EAGAIN) {
+				errf("Error reading from kmsg: %m\n");
+				return 0;
+			}
+
+			/* EAGAIN, so we're done reading */
+			close(comparefd);
+
+			return readed;
+		}
+
+		readed += r;
+		if (wrfd && r)
+			write(wrfd, buf, r);
+
+		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
+					    &flags, &seq, &usec, &cont) == 4) {
+			if (seq >= cmpseq)
+				return readed;
+		}
+
+		if (size && readed >= size) {
+			if (comparefd >= 0)
+				close(comparefd);
+
+			return readed;
+		}
+	} /* while(1) */
+}
+
 static bool kill_child(int sig, pid_t child)
 {
 	/*
@@ -948,6 +1042,82 @@ static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
 	return dt != 0 ? dt : -1;
 }
 
+/*
+ * Returns:
+ *  =>0.0 - Success, measured kmsg activity in bytes/second
+ *  -1.0 - Failure
+ */
+static double measure_dmesg_bytes_per_sec(int wrfd)
+{
+	struct timespec time_beg, time_now, nsec_sleep;
+	unsigned long long readed, rnow;
+	double time, ratio;
+	int kmsgfd, cnt, zero;
+
+	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
+		errf("Warning: Cannot open /dev/kmsg\n");
+
+		return -1.0;
+	}
+
+	if (wrfd < 0)
+		wrfd = 0;
+
+	lseek(kmsgfd, 0, SEEK_END);
+	nsec_sleep.tv_sec = 0;
+	nsec_sleep.tv_nsec = 10ULL * 1000ULL * 1000ULL; /* 10^7 nanoseconds = 10^-2 sec */
+	runner_gettime(&time_beg);
+	for (cnt = 0, zero = 0, time = 0.0, readed = 0.0; cnt < 11 && time < 0.01; ++cnt) {
+		if (zero)
+			nanosleep(&nsec_sleep, NULL);
+
+		rnow = read_dmesg2(kmsgfd, 128 * 1024, wrfd); /* 64KB max */
+		readed += rnow;
+		runner_gettime(&time_now);
+		time = igt_time_elapsed(&time_beg, &time_now);
+		if (time <= 0.0) {
+			errf("Warning: Time underflow\n");
+
+			return -1.0;
+		}
+
+		if (rnow == 0)
+			++zero;
+		else
+			zero = 0;
+	}
+
+	runner_gettime(&time_now);
+	time = igt_time_elapsed(&time_beg, &time_now);
+	if (time <= 0.0) {
+		errf("Warning: Time underflow\n");
+
+		return -1.0;
+	}
+
+	ratio = (double)readed / time;
+	outf("Dmesg ratio %0.3fKB/s\n", ratio / 1024);
+
+	return ratio;
+}
+
+/* Returns: true if ratio lower or equal than maxratio */
+static bool check_dmesg_ratio(double maxratio, int log_level, bool sync, int wrfd)
+{
+	double new_dmesg_bps = measure_dmesg_bytes_per_sec(wrfd);
+	char msg[1024];
+
+	snprintf(msg, sizeof(msg), "Dmesg rate %0.3fKB/s > %0.3fKB/s\n",
+		 new_dmesg_bps / 1024, maxratio / 1024);
+	if (log_level >= LOG_LEVEL_NORMAL) {
+		outf("%s", msg);
+		if (sync)
+			fflush(stdout);
+	}
+
+	return new_dmesg_bps <= maxratio;
+}
+
 /*
  * Returns:
  *  =0 - Success
@@ -960,6 +1130,7 @@ static int monitor_output(pid_t child,
 			  int *outputs,
 			  double *time_spent,
 			  struct settings *settings,
+			  double max_dmesg_ratio,
 			  char **abortreason,
 			  bool *abort_already_written)
 {
@@ -1599,6 +1770,11 @@ static int monitor_output(pid_t child,
 			} else if (killed) {
 				errf("%s", disk);
 			}
+
+			if (!check_dmesg_ratio(max_dmesg_ratio, settings->log_level, settings->sync, outputs[_F_DMESG])) {
+				asprintf(abortreason, "Dmesg ratio exceeded.");
+				aborting = true;
+			}
 		}
 	}
 
@@ -1766,6 +1942,7 @@ static int execute_next_entry(struct execute_state *state,
 			      size_t total,
 			      double *time_spent,
 			      struct settings *settings,
+			      double max_dmesg_ratio,
 			      struct job_list_entry *entry,
 			      int testdirfd, int resdirfd,
 			      int sigfd, sigset_t *sigmask,
@@ -1814,7 +1991,7 @@ static int execute_next_entry(struct execute_state *state,
 		goto out_pipe;
 	}
 
-	if ((kmsgfd = open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK)) < 0) {
+	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
 		errf("Warning: Cannot open /dev/kmsg\n");
 	} else {
 		/* TODO: Checking of abort conditions in pre-execute dmesg */
@@ -1885,7 +2062,7 @@ static int execute_next_entry(struct execute_state *state,
 
 	result = monitor_output(child, outfd, errfd, socketfd,
 				kmsgfd, sigfd,
-				outputs, time_spent, settings,
+				outputs, time_spent, settings, max_dmesg_ratio,
 				abortreason, abort_already_written);
 
 out_kmsgfd:
@@ -2418,6 +2595,8 @@ bool execute(struct execute_state *state,
 	     struct settings *settings,
 	     struct job_list *job_list)
 {
+	static double dmesg_bps = -1.0;
+	static double max_dmesg_bps = -1.0;
 	int resdirfd, testdirfd, unamefd, timefd, sigfd;
 	struct environment_variable *env_var;
 	struct utsname unamebuf;
@@ -2560,6 +2739,26 @@ bool execute(struct execute_state *state,
 		}
 	}
 
+	if (max_dmesg_bps < 0.0) {
+		double ncpu_bps = 4 * 1024 * max_t(size_t, sysconf(_SC_NPROCESSORS_ONLN), 4);
+		double set_bps = 0.0;
+
+		dmesg_bps = measure_dmesg_bytes_per_sec(0);
+
+		if (settings->disk_usage_limit > 0 && settings->per_test_timeout > 0)
+			set_bps = (double)settings->disk_usage_limit / (double)settings->per_test_timeout;
+
+		outf("Dmesg KB/s ratio settings:%0.3f ncpu:%0.3f current:%0.3f\n",
+		     set_bps / 1024, ncpu_bps / 1024, dmesg_bps / 1024);
+
+		if (set_bps > 0.0)
+			max_dmesg_bps = set_bps;
+		else
+			max_dmesg_bps = dmesg_bps > ncpu_bps ? dmesg_bps : ncpu_bps;
+
+		outf("Using max level dmesg ratio %0.3fKB/s\n", max_dmesg_bps / 1024);
+	}
+
 	for (; state->next < job_list->size;
 	     state->next++) {
 		char *reason = NULL;
@@ -2596,6 +2795,7 @@ bool execute(struct execute_state *state,
 						    job_list->size,
 						    &time_spent,
 						    settings,
+						    max_dmesg_bps,
 						    &job_list->entries[state->next],
 						    testdirfd, resdirfd,
 						    sigfd, &sigmask,
@@ -2651,6 +2851,8 @@ bool execute(struct execute_state *state,
 			break;
 		}
 
+		check_dmesg_ratio(max_dmesg_bps, settings->log_level, settings->sync, 0);
+
 		if (result > 0) {
 			double time_left = state->time_left;
 
-- 
2.50.1

