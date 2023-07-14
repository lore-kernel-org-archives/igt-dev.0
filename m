Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F80389146
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 15:40:04 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 14 Jul 2023 17:39:46 +0200
Message-Id: <20230714153946.36448-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230714153946.36448-1-kamil.konieczny@linux.intel.com>
References: <20230714153946.36448-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] runner/executor: write GPU error on
 timeout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When test is interrupted due to per-test timeout or inactivity
kernel GPU state dump may be empty. In that case create dump of
GPU state from driver, either drm error or dri debug info.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 68 +++++++++++++++++++++++++++++++++++++++++++++--
 runner/executor.h |  2 ++
 2 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index d3e6296dd..738d6c0bf 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -39,6 +39,9 @@
 #define KMSG_WARN 4
 #define GRACEFUL_EXITCODE -SIGHUP
 
+#define MSG_TIMEOUT_PER_TEST "Per-test timeout exceeded. Killing the current test with SIGQUIT.\n"
+#define MSG_TIMEOUT_INACTIVITY "Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n"
+
 static struct {
 	int *fds;
 	size_t num_dogs;
@@ -531,6 +534,8 @@ static const char *filenames[_F_LAST] = {
 	[_F_ERR] = "err.txt",
 	[_F_DMESG] = "dmesg.txt",
 	[_F_SOCKET] = "comms",
+	[_F_GPUERROR] = "gpu_error.dmp",
+	[_F_GPUINFO] = "gpu_info.dmp",
 };
 
 static int open_at_end(int dirfd, const char *name)
@@ -745,6 +750,59 @@ static void kmsg_log(int severity, const char *msg)
 	free(str);
 }
 
+static size_t write_gpu_dump(int dump_fd, const char *gpu_error_path, char *buf, size_t bufsize)
+{
+	size_t s, written;
+	int fd;
+
+	fd = open(gpu_error_path, O_RDONLY);
+	if (fd < 0)
+		return 0;
+
+	written = 0;
+	do {
+		s = read(fd, buf, bufsize);
+		if (s > 0) {
+			write(dump_fd, buf, s);
+			written += s;
+		}
+	} while (s > 0);
+
+	close(fd);
+
+	return written;
+}
+
+static void dump_gpu_error(int drm_err_fd, int dri_dbg_fd, const char *dri_debug)
+{
+	char gpu_err_path[PATH_MAX];
+	char dri_dbg_path[PATH_MAX];
+	char *buf;
+	size_t bufsize;
+
+	bufsize = 16 * 1024 * 1024; /* 16MB */
+	buf = malloc(bufsize);
+	if (!buf)
+		return;
+
+	/* dump state of gpu with error */
+	for (int i = 0; i < 256; ++i) {
+		snprintf(gpu_err_path, sizeof(gpu_err_path),
+			 "/sys/class/drm/card%d/error", i);
+		if (access(gpu_err_path, R_OK))
+			break; /* no more drm cards */
+		snprintf(dri_dbg_path, sizeof(dri_dbg_path),
+			 "/sys/kernel/debug/dri/%d/%s", i, dri_debug);
+		if (access(gpu_err_path, R_OK))
+			continue; /* not our card */
+
+		if (write_gpu_dump(drm_err_fd, gpu_err_path, buf, bufsize))
+			break;
+		if (write_gpu_dump(dri_dbg_fd, dri_dbg_path, buf, bufsize))
+			break;
+	}
+}
+
 static const char *show_kernel_task_state(const char *msg)
 {
 	kmsg_log(KMSG_WARN, msg);
@@ -816,14 +874,14 @@ static const char *need_to_timeout(struct settings *settings,
 	    time_since_subtest > settings->per_test_timeout / decrease) {
 		if (decrease > 1)
 			return "Killing the test because the kernel is tainted.\n";
-		return show_kernel_task_state("Per-test timeout exceeded. Killing the current test with SIGQUIT.\n");
+		return show_kernel_task_state(MSG_TIMEOUT_PER_TEST);
 	}
 
 	if (settings->inactivity_timeout != 0 &&
 	    time_since_activity > settings->inactivity_timeout / decrease ) {
 		if (decrease > 1)
 			return "Killing the test because the kernel is tainted.\n";
-		return show_kernel_task_state("Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n");
+		return show_kernel_task_state(MSG_TIMEOUT_INACTIVITY);
 	}
 
 	if (disk_usage_limit_exceeded(settings, disk_usage))
@@ -1446,6 +1504,12 @@ static int monitor_output(pid_t child,
 						 disk_usage);
 
 		if (timeout_reason) {
+			if (settings->dump_gpu_on_timeout &&
+			    (!strcmp(timeout_reason, MSG_TIMEOUT_PER_TEST) ||
+			     !strcmp(timeout_reason, MSG_TIMEOUT_INACTIVITY))) {
+				dump_gpu_error(outputs[_F_GPUERROR], outputs[_F_GPUINFO],
+					       settings->dump_gpu_on_timeout);
+			}
 			if (killed == SIGKILL) {
 				/* Nothing that can be done, really. Let's tell the caller we want to abort. */
 
diff --git a/runner/executor.h b/runner/executor.h
index ab6a0c176..23a53c8ba 100644
--- a/runner/executor.h
+++ b/runner/executor.h
@@ -22,6 +22,8 @@ enum {
 	_F_ERR,
 	_F_DMESG,
 	_F_SOCKET,
+	_F_GPUERROR,
+	_F_GPUINFO,
 	_F_LAST,
 };
 
-- 
2.39.2
