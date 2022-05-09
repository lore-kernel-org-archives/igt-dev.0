Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047C110EB48
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 21:21:22 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 May 2022 14:21:28 -0700
Message-Id: <20220509212128.1844629-3-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20220509212128.1844629-1-alan.previn.teres.alexis@intel.com>
References: <20220509212128.1844629-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tools/intel_guc_logger: Refactor
 intel_guc_logger globals into structs
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

Refactor all of the global variables used in intel_guc_logger
into abstractions of structures at thread level, GuC-GT level
and global level.

While at it, remove asserts from the non primary thread to ensure
process cleanup doesn't get stuck.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tools/intel_guc_logger.c | 458 ++++++++++++++++++++++++---------------
 1 file changed, 279 insertions(+), 179 deletions(-)

diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index 4a991127..356cde59 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -48,12 +48,12 @@
   #define PAGE_SIZE 4096
 #endif
 
-#define DEFAULT_OUTPUT_FILE_NAME  "guc_log_dump.dat"
-
 #define GLR_LOGLEVEL_NAME         "guc_log_level"
 #define GLR_CTL_NAME              "guc_log_relay_ctl"
 #define GLR_CHANNEL_NAME          "guc_log_relay_chan0"
 
+#define DEFAULT_OUTPUT_FILE_NAME     "guc_log_dump" /*.dat suffic added later*/
+#define DEFAULT_GUCLOG_VERBOSITY     3 /* by default capture logs at max verbosity */
 #define DEFAULT_SUBBUF_COUNT         (4 * 8)
 					/* default to kernel built-in:   *
 					 *   4 x 8 subbuf regions        *
@@ -64,25 +64,54 @@
 					 *   8K -> GuC crash dump        *
 					 *  64K -> log events buffer     *
 					 */
-
-int drm_fd;
-char *read_buffer;
-char *out_filename;
-int poll_timeout = 2; /* by default 2ms timeout */
-pthread_mutex_t mutex;
-pthread_t flush_thread;
-int verbosity_level = 3; /* by default capture logs at max verbosity */
-uint32_t produced, consumed;
-uint64_t total_bytes_written;
-int subbuf_count;
-int subbuf_size;
-int ctl_fd, relay_fd, outfile_fd = -1;
-uint32_t test_duration, max_filesize;
-pthread_cond_t underflow_cond, overflow_cond;
-bool stop_logging, discard_oldlogs, capturing_stopped;
-char *gucfspath;
-
-static void get_guc_subbuf_info(void)
+#define DEFAULT_POLL_TIMEOUT         2 /* default timeout of 2ms */
+#define DEFAULT_MAX_OUTPUT_SIZE      MB(4 * 1024) /* default to 4 GB max file size */
+
+enum relay_cmd {
+	RELAY_CMD_DISABLE = 0,
+	RELAY_CMD_ENABLE = 1,
+	RELAY_CMD_FLUSH = 2,
+};
+
+struct guc_t {
+	int gt_id;
+	char *fspath;
+	int control_fd;
+	int relaychan;
+	int outfd;
+	char *readbuf;
+	int subbuf_count;
+	int subbuf_size;
+	uint64_t total_bytes_written;
+	pthread_mutex_t mutex;
+	pthread_t flush_thread;
+	pthread_cond_t underflow_cond;
+	pthread_cond_t overflow_cond;
+	int64_t produced;
+	int64_t consumed;
+	bool stop_logging;
+	bool capturing_stopped;
+};
+
+struct global_t {
+	int drmfd;
+	int verbosity;
+	char *out_filename;
+	uint64_t max_filesize;
+	uint32_t test_duration;
+	int poll_timeout;
+	bool discard_oldlogs;
+};
+
+struct thread_t {
+	struct global_t *global;
+	struct guc_t *guc;
+};
+
+/* only global instance needed for killing threads from main's signal handler */
+struct thread_t *gbl_thread_handle;
+
+static void get_guc_subbuf_info(struct thread_t *tdata)
 {
 	int fd, ret, j;
 	char *path;
@@ -92,9 +121,9 @@ static void get_guc_subbuf_info(void)
 	uint64_t tmp[2] = {DEFAULT_SUBBUF_SIZE, DEFAULT_SUBBUF_COUNT};
 
 	for (j = 0; j < 2; j++) {
-		igt_assert_neq(asprintf(&path, "%s/%s", gucfspath, dbg_fs_names[j]), -1);
+		igt_assert_neq(asprintf(&path, "%s/%s", tdata->guc->fspath, dbg_fs_names[j]), -1);
 		igt_info("Opening subbuf path %s\n", path);
-		fd = igt_debugfs_open(drm_fd, path, O_RDONLY);
+		fd = igt_debugfs_open(tdata->global->drmfd, path, O_RDONLY);
 		free(path);
 		igt_assert_f(fd >= 0, "couldn't open the GuC log relay-subbuf file\n");
 		ret = read(fd, outstr, sizeof(outstr) - 1);
@@ -103,35 +132,36 @@ static void get_guc_subbuf_info(void)
 		tmp[j] = atoll(outstr);
 		close(fd);
 	}
-	subbuf_size = tmp[0];
-	subbuf_count = tmp[1];
+	tdata->guc->subbuf_size = tmp[0];
+	tdata->guc->subbuf_count = tmp[1];
 	igt_info("Debugfs retrieved subbuf info: size=%d, count=%d\n",
-		 subbuf_size, subbuf_count);
+		 tdata->guc->subbuf_size, tdata->guc->subbuf_count);
 }
 
-static void guc_log_verbosity(bool enable, int log_level)
+static void guc_log_verbosity(struct thread_t *tdata, bool enable)
 {
 	char *str;
 	int loglevelfd;
 	uint64_t val;
 	int ret;
 
-	igt_assert_neq(asprintf(&str, "%s/%s", gucfspath, GLR_LOGLEVEL_NAME), -1);
+	igt_assert_neq(asprintf(&str, "%s/%s", tdata->guc->fspath, GLR_LOGLEVEL_NAME), -1);
 	igt_info("Opening log level -> %s\n", str);
-	loglevelfd = igt_debugfs_open(drm_fd, str, O_WRONLY);
+	loglevelfd = igt_debugfs_open(tdata->global->drmfd, str, O_WRONLY);
 	free(str);
 	igt_assert_f(loglevelfd >= 0, "couldn't open the GuC log level file\n");
 
 	/*
 	 * i915 expects GuC log level to be specified as:
 	 * 0: disabled
-	 * 1: enabled (verbosity level 0 = min)
-	 * 2: enabled (verbosity level 1)
-	 * 3: enabled (verbosity level 2)
-	 * 4: enabled (verbosity level 3 = max)
+	 * 1: enabled (non-verbose mode)
+	 * 2: GuC verbosity level 0
+	 * 3: GuC verbosity level 1
+	 * 4: GuC verbosity level 2
+	 * 5: GuC verbosity level 3
+	 * intel_guc_logger takes input range of 0..3 that maps to 2..5 above.
 	 */
-	val = enable ? log_level + 1 : 0;
-
+	val = enable ? tdata->global->verbosity + 2 : 0;
 	ret = asprintf(&str, "0x%" PRIx64, val);
 	igt_assert_neq(ret, -1);
 	ret = write(loglevelfd, str, ret);
@@ -142,40 +172,37 @@ static void guc_log_verbosity(bool enable, int log_level)
 	close(loglevelfd);
 }
 
-static void guc_log_control(bool enable, uint32_t log_level)
+static void guc_log_control(struct thread_t *tdata, enum relay_cmd cmd)
 {
 	char *str;
-	uint64_t val = 0;
 	int ret;
 
-	if (enable) {
-		igt_assert_neq(asprintf(&str, "%s/%s", gucfspath, GLR_CTL_NAME), -1);
+	igt_assert_f((cmd >= 0 && cmd <= 2), "Invalid GuC-log-control cmd!\n");
+
+	if (cmd == RELAY_CMD_ENABLE) {
+		igt_assert_neq(asprintf(&str, "%s/%s", tdata->guc->fspath, GLR_CTL_NAME), -1);
 		igt_info("Opening control file -> %s\n", str);
-		ctl_fd = igt_debugfs_open(drm_fd, str, O_WRONLY);
+		tdata->guc->control_fd = igt_debugfs_open(tdata->global->drmfd, str, O_WRONLY);
 		free(str);
-		igt_assert_f(ctl_fd >= 0, "couldn't open the GuC log relay-ctl file\n");
-		val = 1;
+		igt_assert_f(tdata->guc->control_fd >= 0, "Can't open GuC log relay-ctl file\n");
 	}
 
-	/*
-	 * i915 expects relay logging controls:
-	 * 1    : open + enable relay logging
-	 * 2    : flush
-	 * 0    : disable relay logging + close
-	 */
-	if (ctl_fd) {
-		ret = asprintf(&str, "0x%" PRIx64, val);
+	if (tdata->guc->control_fd) {
+		ret = asprintf(&str, "0x%" PRIx64, (unsigned long)cmd);
 		igt_assert_neq(ret, -1);
-		ret = write(ctl_fd, str, ret);
+		ret = write(tdata->guc->control_fd, str, ret);
 		free(str);
-		igt_assert_f(ret > 0, "couldn't write to the log control file\n");
-	}
+		igt_assert_f(ret > 0, "couldn't set cmd-%u on log control file\n", cmd);
 
-	guc_log_verbosity(enable, log_level);
+		if (cmd == RELAY_CMD_ENABLE)
+			guc_log_verbosity(tdata, true);
+	}
 
-	if (!enable) {
+	if (cmd == RELAY_CMD_DISABLE) {
 		igt_info("Closing control file\n");
-		close(ctl_fd);
+		guc_log_verbosity(tdata, false);
+		close(tdata->guc->control_fd);
+		tdata->guc->control_fd = 0;
 	}
 }
 
@@ -183,68 +210,82 @@ static void int_sig_handler(int sig)
 {
 	igt_info("received signal %d\n", sig);
 
-	stop_logging = true;
+	if (!gbl_thread_handle)
+		return;
+
+	if (gbl_thread_handle[0].guc)
+		gbl_thread_handle[0].guc->stop_logging = true;
 }
 
-static void pull_leftover_data(void)
+static void pull_leftover_data(struct thread_t *tdata)
 {
+	struct guc_t *guc = tdata->guc;
 	unsigned int bytes_read = 0;
+	int subbuf_size = guc->subbuf_size;
 	int ret;
 
 	do {
-		/* Read the logs from relay buffer */
-		ret = read(relay_fd, read_buffer, subbuf_size);
+		/* Read the logs from relay channel buffer */
+		ret = read(guc->relaychan, guc->readbuf, subbuf_size);
 		if (!ret)
 			break;
-
-		igt_assert_f(ret > 0, "failed to read from the GuC log file\n");
-		igt_assert_f(ret == subbuf_size, "invalid read from relay file\n");
-
+		if (ret < 0) {
+			igt_warn("failed leftover-read from GuC GT-%d relay-channel\n",
+				 guc->gt_id);
+			break;
+		}
+		if (ret != subbuf_size)
+			igt_warn("invalid leftover-size from GuC GT-%d relay-channel\n",
+				 guc->gt_id);
 		bytes_read += ret;
-
-		if (outfile_fd >= 0) {
-			ret = write(outfile_fd, read_buffer, subbuf_size);
-			igt_assert_f(ret == subbuf_size, "couldn't dump the logs in a file\n");
-			total_bytes_written += ret;
+		if (guc->outfd >= 0) {
+			ret = write(guc->outfd, guc->readbuf, subbuf_size);
+			if (ret != subbuf_size)
+				igt_warn("Couldn't dump leftover logs to file\n");
+			guc->total_bytes_written += ret;
 		}
 	} while(1);
 
-	igt_debug("%u bytes flushed\n", bytes_read);
+	igt_debug("%u bytes flushed from GuC GT-%d\n", bytes_read, guc->gt_id);
 }
 
-static int num_filled_bufs(void)
+static int num_filled_bufs(struct guc_t *guc)
 {
-	return (produced - consumed);
+	return (guc->produced - guc->consumed);
 }
 
-static void pull_data(void)
+static void pull_data(struct thread_t *tdata)
 {
 	char *ptr;
 	int ret;
+	struct guc_t *guc = tdata->guc;
+	int subbuf_size = guc->subbuf_size;
 
-	pthread_mutex_lock(&mutex);
-	while (num_filled_bufs() >= subbuf_count) {
-		igt_debug("overflow, will wait, produced %u, consumed %u\n", produced, consumed);
+	pthread_mutex_lock(&guc->mutex);
+	while (num_filled_bufs(guc) >= guc->subbuf_count) {
+		igt_debug("overflow, will wait, produced %ld, consumed %ld\n",
+			  guc->produced, guc->consumed);
 		/* Stall the main thread in case of overflow, as there are no
 		 * buffers available to store the new logs, otherwise there
 		 * could be corruption if both threads work on the same buffer.
 		 */
-		pthread_cond_wait(&overflow_cond, &mutex);
+		pthread_cond_wait(&guc->overflow_cond, &guc->mutex);
 	};
-	pthread_mutex_unlock(&mutex);
+	pthread_mutex_unlock(&guc->mutex);
 
-	ptr = read_buffer + (produced % subbuf_count) * subbuf_size;
+	ptr = guc->readbuf + (guc->produced % guc->subbuf_count) * subbuf_size;
 
-	/* Read the logs from relay buffer */
-	ret = read(relay_fd, ptr, subbuf_size);
+	/* Read the logs from relay channel buffer */
+	ret = read(guc->relaychan, ptr, subbuf_size);
 	igt_assert_f(ret >= 0, "failed to read from the GuC log file\n");
-	igt_assert_f(!ret || ret == subbuf_size, "invalid read from relay file\n");
+	igt_assert_f(!ret || ret <= subbuf_size, "invalid read from relay file\n");
 
 	if (ret) {
-		pthread_mutex_lock(&mutex);
-		produced++;
-		pthread_cond_signal(&underflow_cond);
-		pthread_mutex_unlock(&mutex);
+		pthread_mutex_lock(&guc->mutex);
+		guc->produced++;
+		pthread_cond_signal(&guc->underflow_cond);
+		pthread_mutex_unlock(&guc->mutex);
+		igt_info("read %d KB from relay file\n", (ret / 1024));
 	} else {
 		/* Occasionally (very rare) read from the relay file returns no
 		 * data, albeit the polling done prior to read call indicated
@@ -257,56 +298,74 @@ static void pull_data(void)
 static void *flusher(void *arg)
 {
 	char *ptr;
-	int ret;
+	int ret, subbuf_size;
+	struct thread_t *tdata = (struct thread_t *)arg;
+	struct global_t *gbl;
+	struct guc_t *guc;
+
+	igt_assert_f(tdata, "Flusher didn't receive thread context ptr!\n");
+	gbl = tdata->global;
+	guc = tdata->guc;
+	subbuf_size = guc->subbuf_size;
 
 	igt_debug("execution started of flusher thread\n");
 
 	do {
-		pthread_mutex_lock(&mutex);
-		while (!num_filled_bufs()) {
+		pthread_mutex_lock(&guc->mutex);
+		while (!num_filled_bufs(guc)) {
 			/* Exit only after completing the flush of all the filled
 			 * buffers as User would expect that all logs captured up
 			 * till the point of interruption/exit are written out to
 			 * the disk file.
 			 */
-			if (capturing_stopped) {
+			if (guc->capturing_stopped) {
 				igt_debug("flusher to exit now\n");
-				pthread_mutex_unlock(&mutex);
+				pthread_mutex_unlock(&guc->mutex);
 				return NULL;
 			}
-			pthread_cond_wait(&underflow_cond, &mutex);
+			pthread_cond_wait(&guc->underflow_cond, &guc->mutex);
 		};
-		pthread_mutex_unlock(&mutex);
-
-		ptr = read_buffer + (consumed % subbuf_count) * subbuf_size;
+		pthread_mutex_unlock(&guc->mutex);
 
-		ret = write(outfile_fd, ptr, subbuf_size);
-		igt_assert_f(ret == subbuf_size, "couldn't dump the logs in a file\n");
+		ptr = guc->readbuf + (guc->consumed % guc->subbuf_count) * subbuf_size;
 
-		total_bytes_written += ret;
-		if (max_filesize && (total_bytes_written > MB(max_filesize))) {
-			igt_debug("reached the target of %" PRIu64 " bytes\n", MB(max_filesize));
-			stop_logging = true;
+		ret = write(guc->outfd, ptr, subbuf_size);
+		if (ret < 0) {
+			igt_warn("Dump to file failed with err %d, stopping!\n", ret);
+			guc->stop_logging = true;
+		} else if (!ret) {
+			igt_warn("Dump to file flushed zero bytes!\n");
+		} else {
+			if (ret != subbuf_size)
+				igt_warn("Dump size mismatch = %d!\n", ret);
+			guc->total_bytes_written += ret;
+			igt_info("wrote %d KB out to dat file\n", (ret / 1024));
+			if (gbl->max_filesize && guc->total_bytes_written >
+			    MB(gbl->max_filesize)) {
+				igt_debug("reached the target of %" PRIu64 " bytes\n",
+					  MB(gbl->max_filesize));
+				guc->stop_logging = true;
+			}
+			pthread_mutex_lock(&guc->mutex);
+			guc->consumed++;
+			pthread_cond_signal(&guc->overflow_cond);
+			pthread_mutex_unlock(&guc->mutex);
 		}
-
-		pthread_mutex_lock(&mutex);
-		consumed++;
-		pthread_cond_signal(&overflow_cond);
-		pthread_mutex_unlock(&mutex);
 	} while(1);
 
 	return NULL;
 }
 
-static void init_flusher_thread(void)
+static void init_flusher_thread(struct thread_t *tdata)
 {
-	struct sched_param	thread_sched;
-	pthread_attr_t		p_attr;
+	struct sched_param thread_sched;
+	pthread_attr_t p_attr;
+	struct guc_t *guc = tdata->guc;
 	int ret;
 
-	pthread_cond_init(&underflow_cond, NULL);
-	pthread_cond_init(&overflow_cond, NULL);
-	pthread_mutex_init(&mutex, NULL);
+	pthread_cond_init(&guc->underflow_cond, NULL);
+	pthread_cond_init(&guc->overflow_cond, NULL);
+	pthread_mutex_init(&guc->mutex, NULL);
 
 	ret = pthread_attr_init(&p_attr);
 	igt_assert_f(ret == 0, "error obtaining default thread attributes\n");
@@ -325,22 +384,22 @@ static void init_flusher_thread(void)
 	ret = pthread_attr_setschedparam(&p_attr, &thread_sched);
 	igt_assert_f(ret == 0, "couldn't set thread priority\n");
 
-	ret = pthread_create(&flush_thread, &p_attr, flusher, NULL);
+	ret = pthread_create(&guc->flush_thread, &p_attr, flusher, tdata);
 	igt_assert_f(ret == 0, "thread creation failed\n");
 
 	ret = pthread_attr_destroy(&p_attr);
 	igt_assert_f(ret == 0, "error destroying thread attributes\n");
 }
 
-static void open_relay_file(void)
+static void open_relay_file(struct thread_t *tdata)
 {
 	char *path;
 
-	igt_assert_neq(asprintf(&path, "%s/%s", gucfspath, GLR_CHANNEL_NAME), -1);
+	igt_assert_neq(asprintf(&path, "%s/%s", tdata->guc->fspath, GLR_CHANNEL_NAME), -1);
 	igt_info("Opening this path -> %s\n", path);
-	relay_fd = igt_debugfs_open(drm_fd, path, O_RDONLY);
+	tdata->guc->relaychan = igt_debugfs_open(tdata->global->drmfd, path, O_RDONLY);
 	free(path);
-	igt_assert_f(relay_fd >= 0, "couldn't open the GuC log relay-channel file\n");
+	igt_assert_f(tdata->guc->relaychan >= 0, "couldn't open the GuC log relay-channel file\n");
 
 	/* Purge the old/boot-time logs from the relay buffer.
 	 * This is more for Val team's requirement, where they have to first
@@ -349,29 +408,39 @@ static void open_relay_file(void)
 	 * wait for the new data, at that point benchmark can be launched from
 	 * a different shell.
 	 */
-	if (discard_oldlogs)
-		pull_leftover_data();
+	if (tdata->global->discard_oldlogs)
+		pull_leftover_data(tdata);
 }
 
-static void open_output_file(void)
+static void open_output_file(struct thread_t *tdata)
 {
+	char *path;
+
 	/* Use Direct IO mode for the output file, as the data written is not
 	 * supposed to be accessed again, this saves a copy of data from App's
 	 * buffer to kernel buffer (Page cache). Due to no buffering on kernel
 	 * side, data is flushed out to disk faster and more buffering can be
 	 * done on the logger side to hide the disk IO latency.
 	 */
-	outfile_fd = open(out_filename ? : DEFAULT_OUTPUT_FILE_NAME,
-			  O_CREAT | O_WRONLY | O_TRUNC | O_DIRECT,
-			  0440);
-	igt_assert_f(outfile_fd >= 0, "couldn't open the output file\n");
+	if (tdata->global->out_filename) {
+		igt_assert_neq(asprintf(&path, "%s_GT%d.dat", tdata->global->out_filename,
+					tdata->guc->gt_id), -1);
+	} else {
+		igt_assert_neq(asprintf(&path, "%s_GT%d.dat", DEFAULT_OUTPUT_FILE_NAME,
+					tdata->guc->gt_id), -1);
+	}
+
+	tdata->guc->outfd = open(path, O_CREAT | O_WRONLY | O_TRUNC | O_DIRECT, 0440);
+	igt_assert_f(tdata->guc->outfd >= 0, "couldn't open the output file\n");
 
-	free(out_filename);
+	igt_info("Creating output GuC-log-file: %s\n", path);
+	free(path);
 }
 
-static void init_main_thread(void)
+static void init_main_thread(struct thread_t *tdata)
 {
 	struct sched_param thread_sched;
+	struct guc_t *guc = tdata->guc;
 	int ret;
 
 	/* Run the main thread at highest priority to ensure that it always
@@ -390,55 +459,60 @@ static void init_main_thread(void)
 		igt_assert_f(0, "SIGALRM handler registration failed\n");
 
 	/* Need an aligned pointer for direct IO */
-	ret = posix_memalign((void **)&read_buffer, PAGE_SIZE, subbuf_count * subbuf_size);
+	ret = posix_memalign((void **)&guc->readbuf, PAGE_SIZE,
+			     (guc->subbuf_count * guc->subbuf_size));
 	igt_assert_f(ret == 0, "couldn't allocate the read buffer\n");
 
 	/* Keep the pages locked in RAM, avoid page fault overhead */
-	ret = mlock(read_buffer, subbuf_count * subbuf_size);
+	ret = mlock(guc->readbuf, (guc->subbuf_count * guc->subbuf_size));
 	igt_assert_f(ret == 0, "failed to lock memory\n");
 
 	/* Enable the logging, it may not have been enabled from boot and so
 	 * the relay file also wouldn't have been created.
 	 */
-	guc_log_control(true, verbosity_level);
-
-	open_relay_file();
-	open_output_file();
+	guc_log_control(tdata, RELAY_CMD_ENABLE);
+	open_relay_file(tdata);
+	open_output_file(tdata);
 }
 
-static int parse_options(int opt, int opt_index, void *data)
+static int parse_options(int opt, int opt_index, void *ptr)
 {
+	struct global_t *data = (struct global_t *)ptr;
+
+	igt_assert(data);
 	igt_debug("opt %c optarg %s\n", opt, optarg);
 
 	switch(opt) {
 	case 'v':
-		verbosity_level = atoi(optarg);
-		igt_assert_f(verbosity_level >= 0 && verbosity_level <= 3, "invalid input for -v option\n");
-		igt_debug("verbosity level to be used is %d\n", verbosity_level);
+		data->verbosity = atoi(optarg);
+		igt_assert_f(data->verbosity >= 0 && data->verbosity <= 3,
+			     "invalid input for -v option\n");
+		igt_debug("verbosity level to be used is %d\n", data->verbosity);
 		break;
 	case 'o':
-		out_filename = strdup(optarg);
-		igt_assert_f(out_filename, "Couldn't allocate the o/p filename\n");
-		igt_debug("logs to be stored in file %s\n", out_filename);
+		data->out_filename = strdup(optarg);
+		igt_assert_f(data->out_filename, "Couldn't allocate the o/p filename\n");
+		igt_debug("logs to be stored in file %s_G[GuC-ID]\n", data->out_filename);
 		break;
 	case 't':
-		test_duration = atoi(optarg);
-		igt_assert_f(test_duration > 0, "invalid input for -t option\n");
-		igt_debug("logger to run for %d second\n", test_duration);
+		data->test_duration = atoi(optarg);
+		igt_assert_f(data->test_duration > 0, "invalid input for -t option\n");
+		igt_debug("logger to run for %d second\n", data->test_duration);
 		break;
 	case 'p':
-		poll_timeout = atoi(optarg);
-		igt_assert_f(poll_timeout != 0, "invalid input for -p option\n");
-		if (poll_timeout > 0)
-			igt_debug("polling to be done with %d millisecond timeout\n", poll_timeout);
+		data->poll_timeout = atoi(optarg);
+		igt_assert_f(data->poll_timeout != 0, "invalid input for -p option\n");
+		if (data->poll_timeout > 0)
+			igt_debug("polling to be done with %d millisecond timeout\n",
+				  data->poll_timeout);
 		break;
 	case 's':
-		max_filesize = atoi(optarg);
-		igt_assert_f(max_filesize > 0, "invalid input for -s option\n");
-		igt_debug("max allowed size of the output file is %d MB\n", max_filesize);
+		data->max_filesize = atoll(optarg);
+		igt_assert_f(data->max_filesize > 0, "invalid input for -s option\n");
+		igt_debug("max allowed size of the output file is %lu MB\n", data->max_filesize);
 		break;
 	case 'd':
-		discard_oldlogs = true;
+		data->discard_oldlogs = true;
 		igt_debug("old/boot-time logs will be discarded\n");
 		break;
 	}
@@ -446,7 +520,7 @@ static int parse_options(int opt, int opt_index, void *data)
 	return 0;
 }
 
-static void process_command_line(int argc, char **argv)
+static void process_command_line(int argc, char **argv, struct global_t *data)
 {
 	static struct option long_options[] = {
 		{"verbosity", required_argument, 0, 'v'},
@@ -467,23 +541,39 @@ static void process_command_line(int argc, char **argv)
 		"  -d --discard           discard the old/boot-time logs before entering into the capture loop\n";
 
 	igt_simple_init_parse_opts(&argc, argv, "v:o:b:t:p:s:d", long_options,
-				   help, parse_options, NULL);
+				   help, parse_options, data);
 }
 
 int main(int argc, char **argv)
 {
+	struct global_t gbldata;
+	/* For now, just one thread collecting logs from any single GuC source */
+	struct guc_t gucdata[1];  /* only GT0 for now */
+	struct thread_t thread[1];
 	struct pollfd relay_poll_fd;
-	int nfds;
-	int ret;
+	int nfds, ret;
 
-	drm_fd = drm_open_driver(DRIVER_INTEL);
-	igt_assert(drm_fd != -1);
-	igt_assert_neq(asprintf(&gucfspath, "gt0/uc"), -1);
+	/* setup global context */
+	memset(&gbldata, 0, sizeof(gbldata));
+	gbldata.verbosity    = DEFAULT_GUCLOG_VERBOSITY;
+	gbldata.poll_timeout = DEFAULT_POLL_TIMEOUT;
+	gbldata.drmfd        = drm_open_driver_render(DRIVER_INTEL);
+	igt_assert(gbldata.drmfd != -1);
 
-	get_guc_subbuf_info();
-	process_command_line(argc, argv);
+	memset(&gucdata[0], 0, sizeof(struct guc_t));
+	gucdata[0].gt_id = 0;
+	igt_assert_neq(asprintf(&gucdata[0].fspath, "gt/uc"), -1);
+	gucdata[0].outfd = -1;
 
-	init_main_thread();
+	thread[0].global = &gbldata;
+	thread[0].guc = &gucdata[0];
+	get_guc_subbuf_info(&thread[0]);
+
+	process_command_line(argc, argv, &gbldata);
+
+	gbl_thread_handle = thread;
+
+	init_main_thread(&thread[0]);
 
 	/* Use a separate thread for flushing the logs to a file on disk.
 	 * Main thread will buffer the data from relay file in its pool of
@@ -493,15 +583,15 @@ int main(int argc, char **argv)
 	 * (/proc/sys/vm/dirty_ratio), kernel starts blocking the processes
 	 * doing the file writes.
 	 */
-	init_flusher_thread();
+	init_flusher_thread(&thread[0]);
 
-	relay_poll_fd.fd = relay_fd;
+	relay_poll_fd.fd = thread[0].guc->relaychan;
 	relay_poll_fd.events = POLLIN;
 	relay_poll_fd.revents = 0;
 
 	nfds = 1; /* only one fd to poll */
 
-	alarm(test_duration); /* Start the alarm */
+	alarm(gbldata.test_duration); /* Start the alarm */
 
 	do {
 		/* Wait/poll for the new data to be available, relay doesn't
@@ -515,7 +605,7 @@ int main(int argc, char **argv)
 		 * succession (less than a jiffy gap between 2 flush interrupts)
 		 * causing relay to run out of sub buffers to store new logs.
 		 */
-		ret = poll(&relay_poll_fd, nfds, poll_timeout);
+		ret = poll(&relay_poll_fd, nfds, gbldata.poll_timeout);
 		if (ret < 0) {
 			if (errno == EINTR)
 				break;
@@ -526,24 +616,34 @@ int main(int argc, char **argv)
 		if (!relay_poll_fd.revents)
 			continue;
 
-		pull_data();
-	} while (!stop_logging);
+		pull_data(&thread[0]);
+	} while (!thread[0].guc->stop_logging);
 
 	/* Pause logging on the GuC side */
-	guc_log_control(false, 0);
+	guc_log_control(&thread[0], RELAY_CMD_FLUSH);
+	guc_log_control(&thread[0], RELAY_CMD_DISABLE);
 
 	/* Signal flusher thread to make an exit */
-	capturing_stopped = 1;
-	pthread_cond_signal(&underflow_cond);
-	pthread_join(flush_thread, NULL);
-
-	pull_leftover_data();
-	igt_info("total bytes written %" PRIu64 "\n", total_bytes_written);
-
-	free(read_buffer);
-	close(relay_fd);
-	close(outfile_fd);
-	free(gucfspath);
-	close(drm_fd);
+	thread[0].guc->capturing_stopped = 1;
+	pthread_cond_signal(&thread[0].guc->underflow_cond);
+	pthread_join(thread[0].guc->flush_thread, NULL);
+	pull_leftover_data(&thread[0]);
+	igt_info("total bytes written %" PRIu64 "\n", thread[0].guc->total_bytes_written);
+
+	if (gucdata[0].outfd)
+		close(gucdata[0].outfd);
+	if (gucdata[0].relaychan > 0)
+		close(gucdata[0].relaychan);
+	if (gucdata[0].control_fd > 0)
+		close(gucdata[0].control_fd);
+	if (gucdata[0].readbuf)
+		free(gucdata[0].readbuf);
+	if (gucdata[0].fspath)
+		free(gucdata[0].fspath);
+
+	if (gbldata.out_filename)
+		free(gbldata.out_filename);
+	close(gbldata.drmfd);
+
 	igt_exit();
 }
-- 
2.25.1
