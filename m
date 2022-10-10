Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B0A10E62C
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 14:57:55 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Oct 2022 17:57:04 +0300
Message-Id: <20221010145708.1986912-3-petri.latvala@intel.com>
In-Reply-To: <20221010145708.1986912-1-petri.latvala@intel.com>
References: <20221010145708.1986912-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/7] runner: Use socket communications
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Set up a socket and pass it to the tests. Dump received communications
to disk.

When generating results.json, use socket comms if it exists.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
---
 runner/executor.c  | 354 ++++++++++++++++++++++---
 runner/executor.h  |   1 +
 runner/resultgen.c | 631 ++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 947 insertions(+), 39 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 964d0063..125f08a2 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -12,9 +12,11 @@
 #include <stdlib.h>
 #include <string.h>
 #include <sys/ioctl.h>
+#include <sys/mman.h>
 #include <sys/select.h>
 #include <sys/poll.h>
 #include <sys/signalfd.h>
+#include <sys/socket.h>
 #include <sys/stat.h>
 #include <sys/time.h>
 #include <sys/types.h>
@@ -29,6 +31,7 @@
 #include "igt_taints.h"
 #include "executor.h"
 #include "output_strings.h"
+#include "runnercomms.h"
 
 #define KMSG_HEADER "[IGT] "
 #define KMSG_WARN 4
@@ -365,7 +368,7 @@ static char *need_to_abort(const struct settings* settings)
 	return NULL;
 }
 
-static void prune_subtest(struct job_list_entry *entry, char *subtest)
+static void prune_subtest(struct job_list_entry *entry, const char *subtest)
 {
 	char *excl;
 
@@ -442,11 +445,77 @@ static bool prune_from_journal(struct job_list_entry *entry, int fd)
 	return pruned > 0;
 }
 
+struct prune_comms_data
+{
+	struct job_list_entry *entry;
+	int pruned;
+	bool got_exit;
+};
+
+static bool prune_handle_subtest_start(const struct runnerpacket *packet,
+				       runnerpacket_read_helper helper,
+				       void *userdata)
+{
+	struct prune_comms_data *data = userdata;
+
+	prune_subtest(data->entry, helper.subteststart.name);
+	data->pruned++;
+
+	return true;
+}
+
+static bool prune_handle_exit(const struct runnerpacket *packet,
+			      runnerpacket_read_helper helper,
+			      void *userdata)
+{
+	struct prune_comms_data *data = userdata;
+
+	data->got_exit = true;
+
+	return true;
+}
+
+static bool prune_from_comms(struct job_list_entry *entry, int fd)
+{
+	struct prune_comms_data data = {
+		.entry = entry,
+		.pruned = 0,
+		.got_exit = false,
+	};
+	struct comms_visitor visitor = {
+		.subtest_start = prune_handle_subtest_start,
+		.exit = prune_handle_exit,
+
+		.userdata = &data,
+	};
+	size_t old_count = entry->subtest_count;
+
+	if (comms_read_dump(fd, &visitor) == COMMSPARSE_ERROR)
+		return false;
+
+	/*
+	 * If we know the subtests we originally wanted to run, check
+	 * if we got an equal amount already.
+	 */
+	if (old_count > 0 && data.pruned >= old_count)
+		entry->binary[0] = '\0';
+
+	/*
+	 * If we don't know how many subtests there should be but we
+	 * got an exit, also consider the test fully finished.
+	 */
+	if (data.got_exit)
+		entry->binary[0] = '\0';
+
+	return data.pruned > 0;
+}
+
 static const char *filenames[_F_LAST] = {
 	[_F_JOURNAL] = "journal.txt",
 	[_F_OUT] = "out.txt",
 	[_F_ERR] = "err.txt",
 	[_F_DMESG] = "dmesg.txt",
+	[_F_SOCKET] = "comms",
 };
 
 static int open_at_end(int dirfd, const char *name)
@@ -478,6 +547,9 @@ bool open_output_files(int dirfd, int *fds, bool write)
 
 	for (i = 0; i < _F_LAST; i++) {
 		if ((fds[i] = openfunc(dirfd, filenames[i])) < 0) {
+			/* Ignore failure to open socket comms for reading */
+			if (i == _F_SOCKET && !write) continue;
+
 			while (--i >= 0)
 				close(fds[i]);
 			return false;
@@ -758,6 +830,16 @@ static int next_kill_signal(int killed)
 	}
 }
 
+static void write_packet_with_canary(int fd, struct runnerpacket *packet, bool sync)
+{
+	uint32_t canary = socket_dump_canary();
+
+	write(fd, &canary, sizeof(canary));
+	write(fd, packet, packet->size);
+	if (sync)
+		fdatasync(fd);
+}
+
 /*
  * Returns:
  *  =0 - Success
@@ -765,7 +847,8 @@ static int next_kill_signal(int killed)
  *  >0 - Timeout happened, need to recreate from journal
  */
 static int monitor_output(pid_t child,
-			  int outfd, int errfd, int kmsgfd, int sigfd,
+			  int outfd, int errfd, int socketfd,
+			  int kmsgfd, int sigfd,
 			  int *outputs,
 			  double *time_spent,
 			  struct settings *settings,
@@ -787,12 +870,15 @@ static int monitor_output(pid_t child,
 	unsigned long taints = 0;
 	bool aborting = false;
 	size_t disk_usage = 0;
+	bool socket_comms_used = false; /* whether the test actually uses comms */
 
 	igt_gettime(&time_beg);
 	time_last_activity = time_last_subtest = time_killed = time_beg;
 
 	if (errfd > nfds)
 		nfds = errfd;
+	if (socketfd > nfds)
+		nfds = socketfd;
 	if (kmsgfd > nfds)
 		nfds = kmsgfd;
 	if (sigfd > nfds)
@@ -831,6 +917,8 @@ static int monitor_output(pid_t child,
 			FD_SET(outfd, &set);
 		if (errfd >= 0)
 			FD_SET(errfd, &set);
+		if (socketfd >= 0)
+			FD_SET(socketfd, &set);
 		if (kmsgfd >= 0)
 			FD_SET(kmsgfd, &set);
 		if (sigfd >= 0)
@@ -963,6 +1051,99 @@ static int monitor_output(pid_t child,
 			}
 		}
 
+		if (socketfd >= 0 && FD_ISSET(socketfd, &set)) {
+			struct runnerpacket *packet;
+
+			time_last_activity = time_now;
+
+			/* Fully drain everything */
+			while (true) {
+				s = recv(socketfd, buf, sizeof(buf), MSG_DONTWAIT);
+
+				if (s < 0) {
+					if (errno == EAGAIN)
+						break;
+
+					errf("Error reading from communication socket: %m\n");
+
+					close(socketfd);
+					socketfd = -1;
+					goto socket_end;
+				}
+
+				packet = (struct runnerpacket *)buf;
+				if (s < sizeof(*packet) || s != packet->size) {
+					errf("Socket communication error: Received %zd bytes, expected %zd\n",
+					     s, s >= sizeof(packet->size) ? packet->size : sizeof(*packet));
+					close(socketfd);
+					socketfd = -1;
+					goto socket_end;
+				}
+
+				write_packet_with_canary(outputs[_F_SOCKET], packet, settings->sync);
+				disk_usage += packet->size;
+
+				/*
+				 * runner sends EXEC itself before executing
+				 * the test, other types indicate the test
+				 * really uses socket comms
+				 */
+				if (packet->type != PACKETTYPE_EXEC)
+					socket_comms_used = true;
+
+				if (packet->type == PACKETTYPE_SUBTEST_START ||
+				    packet->type == PACKETTYPE_DYNAMIC_SUBTEST_START)
+					time_last_subtest = time_now;
+
+				if (settings->log_level >= LOG_LEVEL_VERBOSE) {
+					runnerpacket_read_helper helper = {};
+					const char *time;
+
+					if (packet->type == PACKETTYPE_SUBTEST_START ||
+					    packet->type == PACKETTYPE_SUBTEST_RESULT ||
+					    packet->type == PACKETTYPE_DYNAMIC_SUBTEST_START ||
+					    packet->type == PACKETTYPE_DYNAMIC_SUBTEST_RESULT)
+						helper = read_runnerpacket(packet);
+
+					switch (helper.type) {
+					case PACKETTYPE_SUBTEST_START:
+						if (helper.subteststart.name)
+							outf("Starting subtest: %s\n", helper.subteststart.name);
+						break;
+					case PACKETTYPE_SUBTEST_RESULT:
+						if (helper.subtestresult.name && helper.subtestresult.result) {
+							time = "<unknown>";
+							if (helper.subtestresult.timeused)
+								time = helper.subtestresult.timeused;
+							outf("Subtest %s: %s (%ss)\n",
+							     helper.subtestresult.name,
+							     helper.subtestresult.result,
+							     time);
+						}
+						break;
+					case PACKETTYPE_DYNAMIC_SUBTEST_START:
+						if (helper.dynamicsubteststart.name)
+							outf("Starting dynamic subtest: %s\n", helper.dynamicsubteststart.name);
+						break;
+					case PACKETTYPE_DYNAMIC_SUBTEST_RESULT:
+						if (helper.dynamicsubtestresult.name && helper.dynamicsubtestresult.result) {
+							time = "<unknown>";
+							if (helper.dynamicsubtestresult.timeused)
+								time = helper.dynamicsubtestresult.timeused;
+							outf("Dynamic subtest %s: %s (%ss)\n",
+							     helper.dynamicsubtestresult.name,
+							     helper.dynamicsubtestresult.result,
+							     time);
+						}
+						break;
+					default:
+						break;
+					}
+				}
+			}
+		}
+	socket_end:
+
 		if (kmsgfd >= 0 && FD_ISSET(kmsgfd, &set)) {
 			long dmesgwritten;
 
@@ -1032,11 +1213,23 @@ static int monitor_output(pid_t child,
 					if (settings->log_level >= LOG_LEVEL_NORMAL)
 						outf("Exiting gracefully, currently running test will have a 'notrun' result\n");
 
-					dprintf(outputs[_F_JOURNAL], "%s%d (%.3fs)\n",
-						EXECUTOR_EXIT,
-						-SIGHUP, 0.0);
-					if (settings->sync)
-						fdatasync(outputs[_F_JOURNAL]);
+					if (socket_comms_used) {
+						struct runnerpacket *message, *override;
+
+						message = runnerpacket_log(STDOUT_FILENO, "runner: Exiting gracefully, overriding this test's result to be notrun\n");
+						write_packet_with_canary(outputs[_F_SOCKET], message, false); /* possible sync after the override packet */
+						free(message);
+
+						override = runnerpacket_resultoverride("notrun");
+						write_packet_with_canary(outputs[_F_SOCKET], override, settings->sync);
+						free(override);
+					} else {
+						dprintf(outputs[_F_JOURNAL], "%s%d (%.3fs)\n",
+							EXECUTOR_EXIT,
+							-SIGHUP, 0.0);
+						if (settings->sync)
+							fdatasync(outputs[_F_JOURNAL]);
+					}
 				}
 
 				aborting = true;
@@ -1053,9 +1246,10 @@ static int monitor_output(pid_t child,
 				time = 0.0;
 
 			if (!aborting) {
-				const char *exitline;
+				bool timeoutresult = false;
 
-				exitline = killed ? EXECUTOR_TIMEOUT : EXECUTOR_EXIT;
+				if (killed)
+					timeoutresult = true;
 
 				/* If we're stopping because we killed
 				 * the test for tainting, let's not
@@ -1069,7 +1263,7 @@ static int monitor_output(pid_t child,
 				 * journaling a timeout here.
 				 */
 				if (killed && is_tainted(taints)) {
-					exitline = EXECUTOR_EXIT;
+					timeoutresult = false;
 
 					/*
 					 * Also inject a message to
@@ -1082,11 +1276,22 @@ static int monitor_output(pid_t child,
 					 * have newlines on both ends
 					 * of this injection though.
 					 */
-					dprintf(outputs[_F_OUT],
-						"\nrunner: This test was killed due to a kernel taint (0x%lx).\n",
-						taints);
-					if (settings->sync)
-						fdatasync(outputs[_F_OUT]);
+					if (socket_comms_used) {
+						struct runnerpacket *message;
+						char killmsg[256];
+
+						snprintf(killmsg, sizeof(killmsg),
+							 "runner: This test was killed due to a kernel taint (0x%lx).\n", taints);
+						message = runnerpacket_log(STDOUT_FILENO, killmsg);
+						write_packet_with_canary(outputs[_F_SOCKET], message, settings->sync);
+						free(message);
+					} else {
+						dprintf(outputs[_F_OUT],
+							"\nrunner: This test was killed due to a kernel taint (0x%lx).\n",
+							taints);
+						if (settings->sync)
+							fdatasync(outputs[_F_OUT]);
+					}
 				}
 
 				/*
@@ -1094,21 +1299,58 @@ static int monitor_output(pid_t child,
 				 * exceeded the disk usage limit.
 				 */
 				if (killed && disk_usage_limit_exceeded(settings, disk_usage)) {
-					exitline = EXECUTOR_EXIT;
-					dprintf(outputs[_F_OUT],
-						"\nrunner: This test was killed due to exceeding disk usage limit. "
-						"(Used %zd bytes, limit %zd)\n",
-						disk_usage,
-						settings->disk_usage_limit);
-					if (settings->sync)
-						fdatasync(outputs[_F_OUT]);
+					timeoutresult = false;
+
+					if (socket_comms_used) {
+						struct runnerpacket *message;
+						char killmsg[256];
+
+						snprintf(killmsg, sizeof(killmsg),
+							 "runner: This test was killed due to exceeding disk usage limit. "
+							 "(Used %zd bytes, limit %zd)\n",
+							 disk_usage,
+							 settings->disk_usage_limit);
+						message = runnerpacket_log(STDOUT_FILENO, killmsg);
+						write_packet_with_canary(outputs[_F_SOCKET], message, settings->sync);
+						free(message);
+					} else {
+						dprintf(outputs[_F_OUT],
+							"\nrunner: This test was killed due to exceeding disk usage limit. "
+							"(Used %zd bytes, limit %zd)\n",
+							disk_usage,
+							settings->disk_usage_limit);
+						if (settings->sync)
+							fdatasync(outputs[_F_OUT]);
+					}
 				}
 
-				dprintf(outputs[_F_JOURNAL], "%s%d (%.3fs)\n",
-					exitline,
-					status, time);
-				if (settings->sync) {
-					fdatasync(outputs[_F_JOURNAL]);
+				if (socket_comms_used) {
+					struct runnerpacket *exitpacket;
+					char timestr[32];
+
+					snprintf(timestr, sizeof(timestr), "%.3f", time);
+
+					if (timeoutresult) {
+						struct runnerpacket *override;
+
+						override = runnerpacket_resultoverride("timeout");
+						write_packet_with_canary(outputs[_F_SOCKET], override, false); /* sync after exitpacket */
+						free(override);
+					}
+
+					exitpacket = runnerpacket_exit(status, timestr);
+					write_packet_with_canary(outputs[_F_SOCKET], exitpacket, settings->sync);
+					free(exitpacket);
+				} else {
+					const char *exitline;
+
+					exitline = timeoutresult ? EXECUTOR_TIMEOUT : EXECUTOR_EXIT;
+					dprintf(outputs[_F_JOURNAL], "%s%d (%.3fs)\n",
+						exitline,
+						status, time);
+					if (settings->sync) {
+						fdatasync(outputs[_F_JOURNAL]);
+					}
 				}
 
 				if (status == IGT_EXIT_ABORT) {
@@ -1153,6 +1395,7 @@ static int monitor_output(pid_t child,
 				free(outbuf);
 				close(outfd);
 				close(errfd);
+				close(socketfd);
 				close(kmsgfd);
 				return -1;
 			}
@@ -1176,6 +1419,7 @@ static int monitor_output(pid_t child,
 	free(outbuf);
 	close(outfd);
 	close(errfd);
+	close(socketfd);
 	close(kmsgfd);
 
 	if (aborting)
@@ -1185,7 +1429,7 @@ static int monitor_output(pid_t child,
 }
 
 static void __attribute__((noreturn))
-execute_test_process(int outfd, int errfd,
+execute_test_process(int outfd, int errfd, int socketfd,
 		     struct settings *settings,
 		     struct job_list_entry *entry)
 {
@@ -1237,6 +1481,13 @@ execute_test_process(int outfd, int errfd,
 		}
 	}
 
+	if (socketfd >= 0) {
+		struct runnerpacket *packet;
+
+		packet = runnerpacket_exec(argv);
+		write(socketfd, packet, packet->size);
+	}
+
 	execv(argv[0], argv);
 	fprintf(stderr, "Cannot execute %s\n", argv[0]);
 	exit(IGT_EXIT_INVALID);
@@ -1318,7 +1569,8 @@ static int execute_next_entry(struct execute_state *state,
 	int kmsgfd;
 	int outpipe[2] = { -1, -1 };
 	int errpipe[2] = { -1, -1 };
-	int outfd, errfd;
+	int socket[2] = { -1, -1 };
+	int outfd, errfd, socketfd;
 	char name[32];
 	pid_t child;
 	int result;
@@ -1348,6 +1600,12 @@ static int execute_next_entry(struct execute_state *state,
 		goto out_pipe;
 	}
 
+	if (socketpair(AF_UNIX, SOCK_DGRAM, 0, socket)) {
+		errf("Error creating sockets: %m\n");
+		result = -1;
+		goto out_pipe;
+	}
+
 	if ((kmsgfd = open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK)) < 0) {
 		errf("Warning: Cannot open /dev/kmsg\n");
 	} else {
@@ -1388,27 +1646,39 @@ static int execute_next_entry(struct execute_state *state,
 		result = -1;
 		goto out_kmsgfd;
 	} else if (child == 0) {
+		char envstring[16];
+
 		outfd = outpipe[1];
 		errfd = errpipe[1];
+		socketfd = socket[1];
 		close(outpipe[0]);
 		close(errpipe[0]);
+		close(socket[0]);
 
 		sigprocmask(SIG_UNBLOCK, sigmask, NULL);
 
+		if (socketfd >= 0 && !getenv("IGT_RUNNER_DISABLE_SOCKET_COMMUNICATION")) {
+			snprintf(envstring, sizeof(envstring), "%d", socketfd);
+			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
+		}
 		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
 
-		execute_test_process(outfd, errfd, settings, entry);
+		execute_test_process(outfd, errfd, socketfd, settings, entry);
 		/* unreachable */
 	}
 
 	outfd = outpipe[0];
 	errfd = errpipe[0];
+	socketfd = socket[0];
 	close(outpipe[1]);
 	close(errpipe[1]);
-	outpipe[1] = errpipe[1] = -1;
+	close(socket[1]);
+	outpipe[1] = errpipe[1] = socket[1] = -1;
 
-	result = monitor_output(child, outfd, errfd, kmsgfd, sigfd,
-				outputs, time_spent, settings, abortreason);
+	result = monitor_output(child, outfd, errfd, socketfd,
+				kmsgfd, sigfd,
+				outputs, time_spent, settings,
+				abortreason);
 
 out_kmsgfd:
 	close(kmsgfd);
@@ -1580,6 +1850,22 @@ bool initialize_execute_state_from_resume(int dirfd,
 
 	entry = &list->entries[i];
 	state->next = i;
+
+	if ((fd = openat(resdirfd, filenames[_F_SOCKET], O_RDONLY)) >= 0) {
+		if (!prune_from_comms(entry, fd)) {
+			/*
+			 * No subtests, or incomplete before the first
+			 * subtest. Not suitable to re-run.
+			 */
+			state->next = i + 1;
+		} else if (entry->binary[0] == '\0') {
+			/* Full completed */
+			state->next = i + 1;
+		}
+
+		close (fd);
+	}
+
 	if ((fd = openat(resdirfd, filenames[_F_JOURNAL], O_RDONLY)) >= 0) {
 		if (!prune_from_journal(entry, fd)) {
 			/*
diff --git a/runner/executor.h b/runner/executor.h
index 6c83e649..31f4ac16 100644
--- a/runner/executor.h
+++ b/runner/executor.h
@@ -22,6 +22,7 @@ enum {
 	_F_OUT,
 	_F_ERR,
 	_F_DMESG,
+	_F_SOCKET,
 	_F_LAST,
 };
 
diff --git a/runner/resultgen.c b/runner/resultgen.c
index 79725ca2..3d753828 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1,6 +1,7 @@
 #include <assert.h>
 #include <ctype.h>
 #include <fcntl.h>
+#include <inttypes.h>
 #include <stdio.h>
 #include <string.h>
 #include <sys/mman.h>
@@ -12,6 +13,7 @@
 
 #include "igt_aux.h"
 #include "igt_core.h"
+#include "runnercomms.h"
 #include "resultgen.h"
 #include "settings.h"
 #include "executor.h"
@@ -147,7 +149,7 @@ static const char *next_line(const char *line, const char *bufend)
 		return NULL;
 }
 
-static void append_line(char **buf, size_t *buflen, char *line)
+static void append_line(char **buf, size_t *buflen, const char *line)
 {
 	size_t linelen = strlen(line);
 
@@ -1228,6 +1230,606 @@ static void fill_from_journal(int fd,
 	fclose(f);
 }
 
+typedef enum comms_state {
+	STATE_INITIAL = 0,
+	STATE_AFTER_EXEC,
+	STATE_SUBTEST_STARTED,
+	STATE_DYNAMIC_SUBTEST_STARTED,
+	STATE_BETWEEN_DYNAMIC_SUBTESTS,
+	STATE_BETWEEN_SUBTESTS,
+	STATE_EXITED,
+} comms_state_t;
+
+struct comms_context
+{
+	comms_state_t state;
+
+	struct json_object *binaryruntimeobj;
+	struct json_object *current_test;
+	struct json_object *current_dynamic_subtest;
+	char *current_subtest_name;
+	char *current_dynamic_subtest_name;
+
+	char *outbuf, *errbuf;
+	size_t outbuflen, errbuflen;
+	size_t outidx, nextoutidx;
+	size_t erridx, nexterridx;
+	size_t dynoutidx, nextdynoutidx;
+	size_t dynerridx, nextdynerridx;
+
+	char *igt_version;
+
+	char *subtestresult;
+	char *dynamicsubtestresult;
+
+	char *cmdline;
+	int exitcode;
+
+	struct subtest_list *subtests;
+	struct subtest *subtest;
+	struct results *results;
+	struct job_list_entry *entry;
+	const char *binary;
+};
+
+static void comms_free_context(struct comms_context *context)
+{
+	free(context->current_subtest_name);
+	free(context->current_dynamic_subtest_name);
+	free(context->outbuf);
+	free(context->errbuf);
+	free(context->igt_version);
+	free(context->subtestresult);
+	free(context->dynamicsubtestresult);
+	free(context->cmdline);
+}
+
+static void comms_inject_subtest_start_log(struct comms_context *context,
+					   const char *prefix,
+					   const char *subtestname)
+{
+	char msg[512];
+
+	snprintf(msg, sizeof(msg), "%s%s\n", prefix, subtestname);
+	append_line(&context->outbuf, &context->outbuflen, msg);
+	append_line(&context->errbuf, &context->errbuflen, msg);
+}
+
+static void comms_inject_subtest_end_log(struct comms_context *context,
+					 const char *prefix,
+					 const char *subtestname,
+					 const char *subtestresult,
+					 const char *timeused)
+{
+	char msg[512];
+
+	snprintf(msg, sizeof(msg), "%s%s: %s (%ss)\n", prefix, subtestname, subtestresult, timeused);
+	append_line(&context->outbuf, &context->outbuflen, msg);
+	append_line(&context->errbuf, &context->errbuflen, msg);
+}
+
+static void comms_finish_subtest(struct comms_context *context)
+{
+	json_object_object_add(context->current_test, "out",
+			       new_escaped_json_string(context->outbuf + context->outidx, context->outbuflen - context->outidx));
+	json_object_object_add(context->current_test, "err",
+			       new_escaped_json_string(context->errbuf + context->outidx, context->errbuflen - context->erridx));
+
+	if (context->igt_version)
+		add_igt_version(context->current_test, context->igt_version, strlen(context->igt_version));
+
+	if (context->subtestresult == NULL)
+		context->subtestresult = strdup("incomplete");
+	set_result(context->current_test, context->subtestresult);
+
+	free(context->subtestresult);
+	context->subtestresult = NULL;
+	context->current_test = NULL;
+
+	context->outidx = context->nextoutidx;
+	context->erridx = context->nexterridx;
+}
+
+static void comms_finish_dynamic_subtest(struct comms_context *context)
+{
+	json_object_object_add(context->current_dynamic_subtest, "out",
+			       new_escaped_json_string(context->outbuf + context->dynoutidx, context->outbuflen - context->dynoutidx));
+	json_object_object_add(context->current_dynamic_subtest, "err",
+			       new_escaped_json_string(context->errbuf + context->dynerridx, context->errbuflen - context->dynerridx));
+
+	if (context->igt_version)
+		add_igt_version(context->current_dynamic_subtest, context->igt_version, strlen(context->igt_version));
+
+	if (context->dynamicsubtestresult == NULL)
+		context->dynamicsubtestresult = strdup("incomplete");
+	set_result(context->current_dynamic_subtest, context->dynamicsubtestresult);
+
+	free(context->dynamicsubtestresult);
+	context->dynamicsubtestresult = NULL;
+	context->current_dynamic_subtest = NULL;
+
+	context->dynoutidx = context->nextdynoutidx;
+	context->dynerridx = context->nextdynerridx;
+}
+
+static void comms_add_new_subtest(struct comms_context *context,
+				  const char *subtestname)
+{
+	char piglit_name[256];
+
+	add_subtest(context->subtests, strdup(subtestname));
+	context->subtest = &context->subtests->subs[context->subtests->size - 1];
+	generate_piglit_name(context->binary, subtestname, piglit_name, sizeof(piglit_name));
+	context->current_test = get_or_create_json_object(context->results->tests, piglit_name);
+	free(context->current_subtest_name);
+	context->current_subtest_name = strdup(subtestname);
+}
+
+static void comms_add_new_dynamic_subtest(struct comms_context *context,
+					  const char *dynamic_name)
+{
+	char piglit_name[256];
+	char dynamic_piglit_name[256];
+
+	add_dynamic_subtest(context->subtest, strdup(dynamic_name));
+	generate_piglit_name(context->binary, context->current_subtest_name, piglit_name, sizeof(piglit_name));
+	generate_piglit_name_for_dynamic(piglit_name, dynamic_name, dynamic_piglit_name, sizeof(dynamic_piglit_name));
+	context->current_dynamic_subtest = get_or_create_json_object(context->results->tests, dynamic_piglit_name);
+	free(context->current_dynamic_subtest_name);
+	context->current_dynamic_subtest_name = strdup(dynamic_name);
+}
+
+static bool comms_handle_log(const struct runnerpacket *packet,
+			     runnerpacket_read_helper helper,
+			     void *userdata)
+{
+	struct comms_context *context = userdata;
+	char **textbuf;
+	size_t *textlen;
+
+	if (helper.log.stream == STDOUT_FILENO) {
+		textbuf = &context->outbuf;
+		textlen = &context->outbuflen;
+	} else {
+		textbuf = &context->errbuf;
+		textlen = &context->errbuflen;
+	}
+	append_line(textbuf, textlen, helper.log.text);
+
+	return true;
+}
+
+static bool comms_handle_exec(const struct runnerpacket *packet,
+			      runnerpacket_read_helper helper,
+			      void *userdata)
+{
+	struct comms_context *context = userdata;
+
+	switch (context->state) {
+	case STATE_INITIAL:
+		break;
+
+	case STATE_AFTER_EXEC:
+		/*
+		 * Resume after an exec that didn't involve any
+		 * subtests. Resumes can only happen for tests with
+		 * subtests, so while we might have logs already
+		 * collected, we have nowhere to put them. The joblist
+		 * doesn't help, because the ordering is up to the
+		 * test.
+		 */
+		printf("Warning: Need to discard %zd bytes of logs, no subtest data\n", context->outbuflen + context->errbuflen);
+		context->outbuflen = context->errbuflen = 0;
+		context->outidx = context->erridx = 0;
+		context->nextoutidx = context->nexterridx = 0;
+		break;
+
+	case STATE_SUBTEST_STARTED:
+	case STATE_DYNAMIC_SUBTEST_STARTED:
+	case STATE_BETWEEN_DYNAMIC_SUBTESTS:
+	case STATE_BETWEEN_SUBTESTS:
+	case STATE_EXITED:
+		/* A resume exec, so we're already collecting data. */
+		assert(context->current_test != NULL);
+		comms_finish_subtest(context);
+		break;
+	default:
+		assert(false); /* unreachable */
+	}
+
+	free(context->cmdline);
+	context->cmdline = strdup(helper.exec.cmdline);
+
+	context->state = STATE_AFTER_EXEC;
+
+	return true;
+}
+
+static bool comms_handle_exit(const struct runnerpacket *packet,
+			      runnerpacket_read_helper helper,
+			      void *userdata)
+{
+	struct comms_context *context = userdata;
+	char piglit_name[256];
+
+	if (context->state == STATE_AFTER_EXEC) {
+		/*
+		 * Exit after exec, so we didn't get any
+		 * subtests. Check if there's supposed to be any,
+		 * otherwise stuff logs into the binary's result.
+		 */
+
+		char *subtestname = NULL;
+
+		if (context->entry->subtest_count > 0) {
+			subtestname = context->entry->subtests[0];
+			add_subtest(context->subtests, strdup(subtestname));
+		}
+		generate_piglit_name(context->binary, subtestname, piglit_name, sizeof(piglit_name));
+		context->current_test = get_or_create_json_object(context->results->tests, piglit_name);
+
+		/* Get result from exitcode unless we have an override already */
+		if (context->subtestresult == NULL)
+			context->subtestresult = strdup(result_from_exitcode(helper.exit.exitcode));
+	} else if (helper.exit.exitcode == IGT_EXIT_ABORT || helper.exit.exitcode == GRACEFUL_EXITCODE) {
+		/*
+		 * If we did get subtests, we need to assign the
+		 * special exitcode results to the last subtest,
+		 * normal and dynamic
+		 */
+		const char *result = helper.exit.exitcode == IGT_EXIT_ABORT ? "abort" : "notrun";
+
+		free(context->subtestresult);
+		context->subtestresult = strdup(result);
+		free(context->dynamicsubtestresult);
+		context->dynamicsubtestresult = strdup(result);
+	}
+
+	context->exitcode = helper.exit.exitcode;
+	add_runtime(context->binaryruntimeobj, strtod(helper.exit.timeused, NULL));
+
+	context->state = STATE_EXITED;
+
+	return true;
+}
+
+static bool comms_handle_subtest_start(const struct runnerpacket *packet,
+				       runnerpacket_read_helper helper,
+				       void *userdata)
+{
+	struct comms_context *context = userdata;
+	char errmsg[512];
+
+	switch (context->state) {
+	case STATE_INITIAL:
+	case STATE_EXITED:
+		/* Subtest starts when we're not even running? (Before exec or after exit) */
+		fprintf(stderr, "Error: Unexpected subtest start (binary wasn't running)\n");
+		return false;
+	case STATE_SUBTEST_STARTED:
+	case STATE_DYNAMIC_SUBTEST_STARTED:
+	case STATE_BETWEEN_DYNAMIC_SUBTESTS:
+		/*
+		 * Subtest starts when the previous one was still
+		 * running. Text-based parsing would figure that a
+		 * resume happened, but we know the real deal with
+		 * socket comms.
+		 */
+		snprintf(errmsg, sizeof(errmsg),
+			 "\nrunner: Subtest %s already running when subtest %s starts. This is a test bug.\n",
+			 context->current_subtest_name,
+			 helper.subteststart.name);
+		append_line(&context->errbuf, &context->errbuflen, errmsg);
+
+		if (context->state == STATE_DYNAMIC_SUBTEST_STARTED ||
+		    context->state == STATE_BETWEEN_DYNAMIC_SUBTESTS)
+			comms_finish_dynamic_subtest(context);
+
+		/* fallthrough */
+	case STATE_BETWEEN_SUBTESTS:
+		/* Already collecting for a subtest, finish it up */
+		if (context->current_dynamic_subtest)
+			comms_finish_dynamic_subtest(context);
+
+		comms_finish_subtest(context);
+
+		/* fallthrough */
+	case STATE_AFTER_EXEC:
+		comms_add_new_subtest(context, helper.subteststart.name);
+
+		/* Subtest starting message is not in logs with socket comms, inject it manually */
+		comms_inject_subtest_start_log(context, STARTING_SUBTEST, helper.subteststart.name);
+
+		break;
+	default:
+		assert(false); /* unreachable */
+	}
+
+	context->state = STATE_SUBTEST_STARTED;
+
+	return true;
+}
+
+static bool comms_handle_subtest_result(const struct runnerpacket *packet,
+					runnerpacket_read_helper helper,
+					void *userdata)
+{
+	struct comms_context *context = userdata;
+	char errmsg[512];
+
+	switch (context->state) {
+	case STATE_INITIAL:
+	case STATE_EXITED:
+		/* Subtest result when we're not even running? (Before exec or after exit) */
+		fprintf(stderr, "Error: Unexpected subtest result (binary wasn't running)\n");
+		return false;
+	case STATE_DYNAMIC_SUBTEST_STARTED:
+		/*
+		 * Subtest result when dynamic subtest is still
+		 * running. Text-based parsing would consider that an
+		 * incomplete, we're able to inject a warning.
+		 */
+		snprintf(errmsg, sizeof(errmsg),
+			 "\nrunner: Dynamic subtest %s still running when subtest %s ended. This is a test bug.\n",
+			 context->current_dynamic_subtest_name,
+			 helper.subtestresult.name);
+		append_line(&context->errbuf, &context->errbuflen, errmsg);
+		comms_finish_dynamic_subtest(context);
+		break;
+	case STATE_BETWEEN_SUBTESTS:
+		/* Subtest result without starting it, and we're already collecting logs for a previous test */
+		comms_finish_subtest(context);
+		comms_add_new_subtest(context, helper.subtestresult.name);
+		break;
+	case STATE_AFTER_EXEC:
+		/* Subtest result without starting it, so comes from a fixture. We're not yet collecting logs for anything. */
+		comms_add_new_subtest(context, helper.subtestresult.name);
+		break;
+	case STATE_SUBTEST_STARTED:
+	case STATE_BETWEEN_DYNAMIC_SUBTESTS:
+		/* Normal flow */
+		break;
+	default:
+		assert(false); /* unreachable */
+	}
+
+	comms_inject_subtest_end_log(context,
+				     SUBTEST_RESULT,
+				     helper.subtestresult.name,
+				     helper.subtestresult.result,
+				     helper.subtestresult.timeused);
+
+	/* Next subtest, if any, will begin its logs right after that result line */
+	context->nextoutidx = context->outbuflen;
+	context->nexterridx = context->errbuflen;
+
+	/*
+	 * Only store the actual result from the packet if we don't
+	 * already have one. If we do, it's from an override.
+	 */
+	if (context->subtestresult == NULL) {
+		const char *mappedresult;
+
+		parse_result_string(helper.subtestresult.result,
+				    strlen(helper.subtestresult.result),
+				    &mappedresult, NULL);
+		context->subtestresult = strdup(mappedresult);
+	}
+
+	context->state = STATE_BETWEEN_SUBTESTS;
+
+	return true;
+}
+
+static bool comms_handle_dynamic_subtest_start(const struct runnerpacket *packet,
+					       runnerpacket_read_helper helper,
+					       void *userdata)
+{
+	struct comms_context *context = userdata;
+	char errmsg[512];
+
+	switch (context->state) {
+	case STATE_INITIAL:
+	case STATE_EXITED:
+		/* Dynamic subtest starts when we're not even running? (Before exec or after exit) */
+		fprintf(stderr, "Error: Unexpected dynamic subtest start (binary wasn't running)\n");
+		return false;
+	case STATE_AFTER_EXEC:
+		/* Binary was running but a subtest wasn't. We don't know where to inject an error message. */
+		fprintf(stderr, "Error: Unexpected dynamic subtest start (subtest wasn't running)\n");
+		return false;
+	case STATE_BETWEEN_SUBTESTS:
+		/*
+		 * Dynamic subtest starts when a subtest is not
+		 * running. We can't know which subtest this dynamic
+		 * subtest was supposed to be in. But we can inject a
+		 * warn into the previous subtest.
+		 */
+		snprintf(errmsg, sizeof(errmsg),
+			 "\nrunner: Dynamic subtest %s started when not inside a subtest. This is a test bug.\n",
+			 helper.dynamicsubteststart.name);
+		append_line(&context->errbuf, &context->errbuflen, errmsg);
+
+		/* Leave the state as is and hope for the best */
+		return true;
+	case STATE_DYNAMIC_SUBTEST_STARTED:
+		snprintf(errmsg, sizeof(errmsg),
+			 "\nrunner: Dynamic subtest %s already running when dynamic subtest %s starts. This is a test bug.\n",
+			 context->current_dynamic_subtest_name,
+			 helper.dynamicsubteststart.name);
+		append_line(&context->errbuf, &context->errbuflen, errmsg);
+
+		/* fallthrough */
+	case STATE_BETWEEN_DYNAMIC_SUBTESTS:
+		comms_finish_dynamic_subtest(context);
+		/* fallthrough */
+	case STATE_SUBTEST_STARTED:
+		comms_add_new_dynamic_subtest(context, helper.dynamicsubteststart.name);
+
+		/* Dynamic subtest starting message is not in logs with socket comms, inject it manually */
+		comms_inject_subtest_start_log(context, STARTING_DYNAMIC_SUBTEST, helper.dynamicsubteststart.name);
+
+		break;
+	default:
+		assert(false); /* unreachable */
+	}
+
+	context->state = STATE_DYNAMIC_SUBTEST_STARTED;
+
+	return true;
+}
+
+static bool comms_handle_dynamic_subtest_result(const struct runnerpacket *packet,
+						runnerpacket_read_helper helper,
+						void *userdata)
+{
+	struct comms_context *context = userdata;
+	char errmsg[512];
+
+	switch (context->state) {
+	case STATE_INITIAL:
+	case STATE_EXITED:
+		/* Dynamic subtest result when we're not even running? (Before exec or after exit) */
+		fprintf(stderr, "Error: Unexpected dynamic subtest result (binary wasn't running)\n");
+		return false;
+	case STATE_AFTER_EXEC:
+		/* Binary was running but a subtest wasn't. We don't know where to inject an error message. */
+		fprintf(stderr, "Error: Unexpected dynamic subtest result (subtest wasn't running)\n");
+		return false;
+	case STATE_BETWEEN_SUBTESTS:
+		/*
+		 * Dynamic subtest result when a subtest is not
+		 * running. We can't know which subtest this dynamic
+		 * subtest was supposed to be in. But we can inject a
+		 * warn into the previous subtest.
+		 */
+		snprintf(errmsg, sizeof(errmsg),
+			 "\nrunner: Dynamic subtest %s result when not inside a subtest. This is a test bug.\n",
+			 helper.dynamicsubtestresult.name);
+		append_line(&context->errbuf, &context->errbuflen, errmsg);
+
+		/* Leave the state as is and hope for the best */
+		return true;
+	case STATE_BETWEEN_DYNAMIC_SUBTESTS:
+		/*
+		 * Result without starting. There's no
+		 * skip_subtests_henceforth equivalent for dynamic
+		 * subtests so this shouldn't happen, but we can
+		 * handle it nevertheless.
+		 */
+		comms_finish_dynamic_subtest(context);
+		/* fallthrough */
+	case STATE_SUBTEST_STARTED:
+		/* Result without starting, but we aren't collecting for a dynamic subtest yet */
+		comms_add_new_dynamic_subtest(context, helper.dynamicsubtestresult.name);
+		break;
+	case STATE_DYNAMIC_SUBTEST_STARTED:
+		/* Normal flow */
+		break;
+	default:
+		assert(false); /* unreachable */
+	}
+
+	comms_inject_subtest_end_log(context,
+				     DYNAMIC_SUBTEST_RESULT,
+				     helper.dynamicsubtestresult.name,
+				     helper.dynamicsubtestresult.result,
+				     helper.dynamicsubtestresult.timeused);
+
+	/* Next dynamic subtest, if any, will begin its logs right after that result line */
+	context->nextdynoutidx = context->outbuflen;
+	context->nextdynerridx = context->errbuflen;
+
+	/*
+	 * Only store the actual result from the packet if we don't
+	 * already have one. If we do, it's from an override.
+	 */
+	if (context->dynamicsubtestresult == NULL) {
+		const char *mappedresult;
+
+		parse_result_string(helper.dynamicsubtestresult.result,
+				    strlen(helper.dynamicsubtestresult.result),
+				    &mappedresult, NULL);
+		context->dynamicsubtestresult = strdup(mappedresult);
+	}
+
+	context->state = STATE_BETWEEN_DYNAMIC_SUBTESTS;
+
+	return true;
+}
+
+static bool comms_handle_versionstring(const struct runnerpacket *packet,
+				       runnerpacket_read_helper helper,
+				       void *userdata)
+{
+	struct comms_context *context = userdata;
+
+	free(context->igt_version);
+	context->igt_version = strdup(helper.versionstring.text);
+
+	return true;
+}
+
+static bool comms_handle_result_override(const struct runnerpacket *packet,
+					 runnerpacket_read_helper helper,
+					 void *userdata)
+{
+	struct comms_context *context = userdata;
+
+	if (context->current_dynamic_subtest) {
+		free(context->dynamicsubtestresult);
+		context->dynamicsubtestresult = strdup(helper.resultoverride.result);
+	}
+
+	free(context->subtestresult);
+	context->subtestresult = strdup(helper.resultoverride.result);
+
+	return true;
+}
+
+static int fill_from_comms(int fd,
+			   struct job_list_entry *entry,
+			   struct subtest_list *subtests,
+			   struct results *results)
+{
+	struct comms_context context = {};
+	struct comms_visitor visitor = {
+		.log = comms_handle_log,
+		.exec = comms_handle_exec,
+		.exit = comms_handle_exit,
+		.subtest_start = comms_handle_subtest_start,
+		.subtest_result = comms_handle_subtest_result,
+		.dynamic_subtest_start = comms_handle_dynamic_subtest_start,
+		.dynamic_subtest_result = comms_handle_dynamic_subtest_result,
+		.versionstring = comms_handle_versionstring,
+		.result_override = comms_handle_result_override,
+
+		.userdata = &context,
+	};
+	char piglit_name[256];
+	int ret = COMMSPARSE_EMPTY;
+
+	if (fd < 0)
+		return COMMSPARSE_EMPTY;
+
+	context.entry = entry;
+	context.binary = entry->binary;
+	generate_piglit_name(entry->binary, NULL, piglit_name, sizeof(piglit_name));
+	context.binaryruntimeobj = get_or_create_json_object(results->runtimes, piglit_name);
+	context.results = results;
+	context.subtests = subtests;
+
+	ret = comms_read_dump(fd, &visitor);
+
+	if (context.current_dynamic_subtest != NULL)
+		comms_finish_dynamic_subtest(&context);
+	if (context.current_test != NULL)
+		comms_finish_subtest(&context);
+	comms_free_context(&context);
+
+	return ret;
+}
+
 static bool result_is_requested(struct job_list_entry *entry,
 				const char *subtestname,
 				const char *dynamic_name)
@@ -1505,6 +2107,7 @@ static bool parse_test_directory(int dirfd,
 	int fds[_F_LAST];
 	struct subtest_list subtests = {};
 	bool status = true;
+	int commsparsed;
 
 	if (!open_output_files(dirfd, fds, false)) {
 		fprintf(stderr, "Error opening output files\n");
@@ -1517,10 +2120,28 @@ static bool parse_test_directory(int dirfd,
 	 */
 	fill_from_journal(fds[_F_JOURNAL], entry, &subtests, results);
 
-	if (!fill_from_output(fds[_F_OUT], entry->binary, "out", &subtests, results->tests) ||
-	    !fill_from_output(fds[_F_ERR], entry->binary, "err", &subtests, results->tests) ||
-	    !fill_from_dmesg(fds[_F_DMESG], settings, entry->binary, &subtests, results->tests)) {
-		fprintf(stderr, "Error parsing output files\n");
+	/*
+	 * Get test output from socket comms if it exists, otherwise
+	 * parse stdout/stderr
+	 */
+	commsparsed = fill_from_comms(fds[_F_SOCKET], entry, &subtests, results);
+	if (commsparsed == COMMSPARSE_ERROR) {
+		fprintf(stderr, "Error parsing output files (comms)\n");
+		status = false;
+		goto parse_output_end;
+	}
+
+	if (commsparsed == COMMSPARSE_EMPTY) {
+		if (!fill_from_output(fds[_F_OUT], entry->binary, "out", &subtests, results->tests) ||
+		    !fill_from_output(fds[_F_ERR], entry->binary, "err", &subtests, results->tests)) {
+			fprintf(stderr, "Error parsing output files (out.txt, err.txt)\n");
+			status = false;
+			goto parse_output_end;
+		}
+	}
+
+	if (!fill_from_dmesg(fds[_F_DMESG], settings, entry->binary, &subtests, results->tests)) {
+		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
 		status = false;
 		goto parse_output_end;
 	}
-- 
2.30.2
