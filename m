Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9B110EC55
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 21:21:22 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 May 2022 14:21:27 -0700
Message-Id: <20220509212128.1844629-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20220509212128.1844629-1-alan.previn.teres.alexis@intel.com>
References: <20220509212128.1844629-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tools/intel_guc_logger: Re-enable basic
 functionality
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

Fix these multiple issues to get basic functionality up
and running on GuC using:
1. Start using the updated debugfs path for all GuC relay-logging
   file names.
2. Use the updated debugfs names for the relay-logging control
   and channel files to match kernel changes.
3. Start querrying the relay sub-buffer info (buffer size and
   number of sub-buffers) from kernel's new debugfs files.
4. Separate the control enabling from the log-level-setting and
   keep the control handle open while collecting the logs.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tools/intel_guc_logger.c | 179 ++++++++++++++++++++++++++++-----------
 1 file changed, 129 insertions(+), 50 deletions(-)

diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index 5f1de8db..4a991127 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -42,24 +42,30 @@
 
 #include "igt.h"
 
+#define KB(x) ((uint64_t)(x) * 1024)
 #define MB(x) ((uint64_t)(x) * 1024 * 1024)
 #ifndef PAGE_SIZE
   #define PAGE_SIZE 4096
 #endif
-/* Currently the size of GuC log buffer is 19 pages & so is the size of relay
- * subbuffer. If the size changes in future, then this define also needs to be
- * updated accordingly.
- */
-#define SUBBUF_SIZE (19*PAGE_SIZE)
-/* Need large buffering from logger side to hide the DISK IO latency, Driver
- * can only store 8 snapshots of GuC log buffer in relay.
- */
-#define NUM_SUBBUFS 100
 
-#define RELAY_FILE_NAME  "guc_log"
 #define DEFAULT_OUTPUT_FILE_NAME  "guc_log_dump.dat"
-#define CONTROL_FILE_NAME "i915_guc_log_control"
 
+#define GLR_LOGLEVEL_NAME         "guc_log_level"
+#define GLR_CTL_NAME              "guc_log_relay_ctl"
+#define GLR_CHANNEL_NAME          "guc_log_relay_chan0"
+
+#define DEFAULT_SUBBUF_COUNT         (4 * 8)
+					/* default to kernel built-in:   *
+					 *   4 x 8 subbuf regions        *
+					 */
+#define DEFAULT_SUBBUF_SIZE          (KB(4 + 8 + 64))
+					/* default to kernel built-ins : *
+					 *   4K -> buffer states array   *
+					 *   8K -> GuC crash dump        *
+					 *  64K -> log events buffer     *
+					 */
+
+int drm_fd;
 char *read_buffer;
 char *out_filename;
 int poll_timeout = 2; /* by default 2ms timeout */
@@ -68,23 +74,53 @@ pthread_t flush_thread;
 int verbosity_level = 3; /* by default capture logs at max verbosity */
 uint32_t produced, consumed;
 uint64_t total_bytes_written;
-int num_buffers = NUM_SUBBUFS;
-int relay_fd, outfile_fd = -1;
+int subbuf_count;
+int subbuf_size;
+int ctl_fd, relay_fd, outfile_fd = -1;
 uint32_t test_duration, max_filesize;
 pthread_cond_t underflow_cond, overflow_cond;
 bool stop_logging, discard_oldlogs, capturing_stopped;
+char *gucfspath;
 
-static void guc_log_control(bool enable, uint32_t log_level)
+static void get_guc_subbuf_info(void)
+{
+	int fd, ret, j;
+	char *path;
+	const char *dbg_fs_names[2] = {"guc_log_relay_buf_size\0",
+					"guc_log_relay_subbuf_count\0"};
+	char outstr[128];
+	uint64_t tmp[2] = {DEFAULT_SUBBUF_SIZE, DEFAULT_SUBBUF_COUNT};
+
+	for (j = 0; j < 2; j++) {
+		igt_assert_neq(asprintf(&path, "%s/%s", gucfspath, dbg_fs_names[j]), -1);
+		igt_info("Opening subbuf path %s\n", path);
+		fd = igt_debugfs_open(drm_fd, path, O_RDONLY);
+		free(path);
+		igt_assert_f(fd >= 0, "couldn't open the GuC log relay-subbuf file\n");
+		ret = read(fd, outstr, sizeof(outstr) - 1);
+		igt_assert(ret > 0);
+		outstr[ret] = '\0';
+		tmp[j] = atoll(outstr);
+		close(fd);
+	}
+	subbuf_size = tmp[0];
+	subbuf_count = tmp[1];
+	igt_info("Debugfs retrieved subbuf info: size=%d, count=%d\n",
+		 subbuf_size, subbuf_count);
+}
+
+static void guc_log_verbosity(bool enable, int log_level)
 {
-	int control_fd;
-	char data[19];
+	char *str;
+	int loglevelfd;
 	uint64_t val;
 	int ret;
 
-	igt_assert_lte(log_level, 3);
-
-	control_fd = igt_debugfs_open(-1, CONTROL_FILE_NAME, O_WRONLY);
-	igt_assert_f(control_fd >= 0, "couldn't open the guc log control file\n");
+	igt_assert_neq(asprintf(&str, "%s/%s", gucfspath, GLR_LOGLEVEL_NAME), -1);
+	igt_info("Opening log level -> %s\n", str);
+	loglevelfd = igt_debugfs_open(drm_fd, str, O_WRONLY);
+	free(str);
+	igt_assert_f(loglevelfd >= 0, "couldn't open the GuC log level file\n");
 
 	/*
 	 * i915 expects GuC log level to be specified as:
@@ -96,13 +132,51 @@ static void guc_log_control(bool enable, uint32_t log_level)
 	 */
 	val = enable ? log_level + 1 : 0;
 
-	ret = snprintf(data, sizeof(data), "0x%" PRIx64, val);
-	igt_assert(ret > 2 && ret < sizeof(data));
+	ret = asprintf(&str, "0x%" PRIx64, val);
+	igt_assert_neq(ret, -1);
+	ret = write(loglevelfd, str, ret);
+	free(str);
+	igt_assert_f(ret > 0, "couldn't write verbosity to log level file\n");
+	igt_info("Set GuC log level = %d\n", (int)val);
+
+	close(loglevelfd);
+}
 
-	ret = write(control_fd, data, ret);
-	igt_assert_f(ret > 0, "couldn't write to the log control file\n");
+static void guc_log_control(bool enable, uint32_t log_level)
+{
+	char *str;
+	uint64_t val = 0;
+	int ret;
 
-	close(control_fd);
+	if (enable) {
+		igt_assert_neq(asprintf(&str, "%s/%s", gucfspath, GLR_CTL_NAME), -1);
+		igt_info("Opening control file -> %s\n", str);
+		ctl_fd = igt_debugfs_open(drm_fd, str, O_WRONLY);
+		free(str);
+		igt_assert_f(ctl_fd >= 0, "couldn't open the GuC log relay-ctl file\n");
+		val = 1;
+	}
+
+	/*
+	 * i915 expects relay logging controls:
+	 * 1    : open + enable relay logging
+	 * 2    : flush
+	 * 0    : disable relay logging + close
+	 */
+	if (ctl_fd) {
+		ret = asprintf(&str, "0x%" PRIx64, val);
+		igt_assert_neq(ret, -1);
+		ret = write(ctl_fd, str, ret);
+		free(str);
+		igt_assert_f(ret > 0, "couldn't write to the log control file\n");
+	}
+
+	guc_log_verbosity(enable, log_level);
+
+	if (!enable) {
+		igt_info("Closing control file\n");
+		close(ctl_fd);
+	}
 }
 
 static void int_sig_handler(int sig)
@@ -119,18 +193,18 @@ static void pull_leftover_data(void)
 
 	do {
 		/* Read the logs from relay buffer */
-		ret = read(relay_fd, read_buffer, SUBBUF_SIZE);
+		ret = read(relay_fd, read_buffer, subbuf_size);
 		if (!ret)
 			break;
 
-		igt_assert_f(ret > 0, "failed to read from the guc log file\n");
-		igt_assert_f(ret == SUBBUF_SIZE, "invalid read from relay file\n");
+		igt_assert_f(ret > 0, "failed to read from the GuC log file\n");
+		igt_assert_f(ret == subbuf_size, "invalid read from relay file\n");
 
 		bytes_read += ret;
 
 		if (outfile_fd >= 0) {
-			ret = write(outfile_fd, read_buffer, SUBBUF_SIZE);
-			igt_assert_f(ret == SUBBUF_SIZE, "couldn't dump the logs in a file\n");
+			ret = write(outfile_fd, read_buffer, subbuf_size);
+			igt_assert_f(ret == subbuf_size, "couldn't dump the logs in a file\n");
 			total_bytes_written += ret;
 		}
 	} while(1);
@@ -149,7 +223,7 @@ static void pull_data(void)
 	int ret;
 
 	pthread_mutex_lock(&mutex);
-	while (num_filled_bufs() >= num_buffers) {
+	while (num_filled_bufs() >= subbuf_count) {
 		igt_debug("overflow, will wait, produced %u, consumed %u\n", produced, consumed);
 		/* Stall the main thread in case of overflow, as there are no
 		 * buffers available to store the new logs, otherwise there
@@ -159,12 +233,12 @@ static void pull_data(void)
 	};
 	pthread_mutex_unlock(&mutex);
 
-	ptr = read_buffer + (produced % num_buffers) * SUBBUF_SIZE;
+	ptr = read_buffer + (produced % subbuf_count) * subbuf_size;
 
 	/* Read the logs from relay buffer */
-	ret = read(relay_fd, ptr, SUBBUF_SIZE);
-	igt_assert_f(ret >= 0, "failed to read from the guc log file\n");
-	igt_assert_f(!ret || ret == SUBBUF_SIZE, "invalid read from relay file\n");
+	ret = read(relay_fd, ptr, subbuf_size);
+	igt_assert_f(ret >= 0, "failed to read from the GuC log file\n");
+	igt_assert_f(!ret || ret == subbuf_size, "invalid read from relay file\n");
 
 	if (ret) {
 		pthread_mutex_lock(&mutex);
@@ -204,10 +278,10 @@ static void *flusher(void *arg)
 		};
 		pthread_mutex_unlock(&mutex);
 
-		ptr = read_buffer + (consumed % num_buffers) * SUBBUF_SIZE;
+		ptr = read_buffer + (consumed % subbuf_count) * subbuf_size;
 
-		ret = write(outfile_fd, ptr, SUBBUF_SIZE);
-		igt_assert_f(ret == SUBBUF_SIZE, "couldn't dump the logs in a file\n");
+		ret = write(outfile_fd, ptr, subbuf_size);
+		igt_assert_f(ret == subbuf_size, "couldn't dump the logs in a file\n");
 
 		total_bytes_written += ret;
 		if (max_filesize && (total_bytes_written > MB(max_filesize))) {
@@ -260,8 +334,13 @@ static void init_flusher_thread(void)
 
 static void open_relay_file(void)
 {
-	relay_fd = igt_debugfs_open(-1, RELAY_FILE_NAME, O_RDONLY);
-	igt_assert_f(relay_fd >= 0, "couldn't open the guc log file\n");
+	char *path;
+
+	igt_assert_neq(asprintf(&path, "%s/%s", gucfspath, GLR_CHANNEL_NAME), -1);
+	igt_info("Opening this path -> %s\n", path);
+	relay_fd = igt_debugfs_open(drm_fd, path, O_RDONLY);
+	free(path);
+	igt_assert_f(relay_fd >= 0, "couldn't open the GuC log relay-channel file\n");
 
 	/* Purge the old/boot-time logs from the relay buffer.
 	 * This is more for Val team's requirement, where they have to first
@@ -292,7 +371,7 @@ static void open_output_file(void)
 
 static void init_main_thread(void)
 {
-	struct sched_param	thread_sched;
+	struct sched_param thread_sched;
 	int ret;
 
 	/* Run the main thread at highest priority to ensure that it always
@@ -311,11 +390,11 @@ static void init_main_thread(void)
 		igt_assert_f(0, "SIGALRM handler registration failed\n");
 
 	/* Need an aligned pointer for direct IO */
-	ret = posix_memalign((void **)&read_buffer, PAGE_SIZE, num_buffers * SUBBUF_SIZE);
+	ret = posix_memalign((void **)&read_buffer, PAGE_SIZE, subbuf_count * subbuf_size);
 	igt_assert_f(ret == 0, "couldn't allocate the read buffer\n");
 
 	/* Keep the pages locked in RAM, avoid page fault overhead */
-	ret = mlock(read_buffer, num_buffers * SUBBUF_SIZE);
+	ret = mlock(read_buffer, subbuf_count * subbuf_size);
 	igt_assert_f(ret == 0, "failed to lock memory\n");
 
 	/* Enable the logging, it may not have been enabled from boot and so
@@ -342,11 +421,6 @@ static int parse_options(int opt, int opt_index, void *data)
 		igt_assert_f(out_filename, "Couldn't allocate the o/p filename\n");
 		igt_debug("logs to be stored in file %s\n", out_filename);
 		break;
-	case 'b':
-		num_buffers = atoi(optarg);
-		igt_assert_f(num_buffers > 0, "invalid input for -b option\n");
-		igt_debug("number of buffers to be used is %d\n", num_buffers);
-		break;
 	case 't':
 		test_duration = atoi(optarg);
 		igt_assert_f(test_duration > 0, "invalid input for -t option\n");
@@ -377,7 +451,6 @@ static void process_command_line(int argc, char **argv)
 	static struct option long_options[] = {
 		{"verbosity", required_argument, 0, 'v'},
 		{"outputfile", required_argument, 0, 'o'},
-		{"buffers", required_argument, 0, 'b'},
 		{"testduration", required_argument, 0, 't'},
 		{"polltimeout", required_argument, 0, 'p'},
 		{"size", required_argument, 0, 's'},
@@ -388,7 +461,6 @@ static void process_command_line(int argc, char **argv)
 	const char *help =
 		"  -v --verbosity=level   verbosity level of GuC logging (0-3)\n"
 		"  -o --outputfile=name   name of the output file, including the location, where logs will be stored\n"
-		"  -b --buffers=num       number of buffers to be maintained on logger side for storing logs\n"
 		"  -t --testduration=sec  max duration in seconds for which the logger should run\n"
 		"  -p --polltimeout=ms    polling timeout in ms, -1 == indefinite wait for the new data\n"
 		"  -s --size=MB           max size of output file in MBs after which logging will be stopped\n"
@@ -404,6 +476,11 @@ int main(int argc, char **argv)
 	int nfds;
 	int ret;
 
+	drm_fd = drm_open_driver(DRIVER_INTEL);
+	igt_assert(drm_fd != -1);
+	igt_assert_neq(asprintf(&gucfspath, "gt0/uc"), -1);
+
+	get_guc_subbuf_info();
 	process_command_line(argc, argv);
 
 	init_main_thread();
@@ -466,5 +543,7 @@ int main(int argc, char **argv)
 	free(read_buffer);
 	close(relay_fd);
 	close(outfile_fd);
+	free(gucfspath);
+	close(drm_fd);
 	igt_exit();
 }
-- 
2.25.1
