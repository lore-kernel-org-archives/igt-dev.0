Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B45A10E270
 for <igt-dev@lists.freedesktop.org>; Fri, 12 May 2023 18:35:28 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Fri, 12 May 2023 20:35:12 +0200
Message-Id: <20230512183512.57843-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230512183512.57843-1-kamil.konieczny@linux.intel.com>
References: <20230512183512.57843-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_aux: unify procps processing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Create common interface for processing proc info, thus making
its useage more striteforward and located in one place. This
should make it easier to read and modify.

Suggested-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_aux.c | 355 ++++++++++++++++++++------------------------------
 1 file changed, 138 insertions(+), 217 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 4c24b0928..18c722d44 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1214,6 +1214,89 @@ void igt_unlock_mem(void)
 	locked_mem = NULL;
 }
 
+struct igt_process {
+#ifdef HAVE_LIBPROCPS
+	PROCTAB * proc;
+	proc_t *proc_info;
+#else
+	struct pids_info *info;
+	struct pids_stack *stack;
+#endif
+	pid_t tid;
+	pid_t euid;
+	pid_t egid;
+	char *comm;
+};
+
+static void open_process(struct igt_process *prcs)
+{
+#ifdef HAVE_LIBPROCPS
+	prcs->proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
+	igt_assert(prcs->proc != NULL, "procps open failed\n");
+	prcs->proc_info = NULL;
+#else
+	enum pids_item Items[] = { PIDS_ID_PID, PIDS_ID_EUID, PIDS_ID_EGID, PIDS_CMD };
+	int err;
+
+	prcs->info = NULL;
+	err = procps_pids_new(&prcs->info, Items, 4);
+	igt_assert_f(err >= 0, "procps-ng open failed\n");
+	prcs->stack = NULL;
+#endif
+	prcs->tid = 0;
+	prcs->comm = NULL;
+}
+
+static void close_process(struct igt_process *prcs)
+{
+#ifdef HAVE_LIBPROCPS
+	if (prcs->proc_info)
+		free(prcs->proc_info);
+
+	prcs->proc_info = NULL;
+	freeproc(prcs->proc);
+	prcs->proc = NULL;
+#else
+	procps_pids_unref(&prcs->info);
+	prcs->info = NULL;
+#endif
+	prcs->tid = 0;
+	prcs->comm = NULL;
+}
+
+static bool get_process_ids(struct igt_process *prcs)
+{
+#ifdef HAVE_LIBPROCPS
+	if (prcs->proc_info)
+		free(prcs->proc_info);
+
+	prcs->tid = 0;
+	prcs->comm = NULL;
+	prcs->proc_info = readproc(prcs->proc, NULL);
+
+	if (proc_info) {
+		prcs->tid = prcs->proc_info->tid;
+		prcs->euid = prcs->proc_info->euid;
+		prcs->egid = prcs->proc_info->egid;
+		prcs->comm = prcs->proc_info->cmd;
+		freeproc(proc_info);
+	}
+#else
+	enum rel_items { EU_PID, EU_EUID, EU_EGID, EU_CMD }; // order at open
+
+	prcs->tid = 0;
+	prcs->comm = NULL;
+	prcs->stack = procps_pids_get(prcs->info, PIDS_FETCH_TASKS_ONLY);
+	if (prcs->stack) {
+		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack, prcs->info);
+		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack, prcs->info);
+		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack, prcs->info);
+		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack, prcs->info);
+	}
+#endif
+	return prcs->tid != 0;
+}
+
 /**
  * igt_is_process_running:
  * @comm: Name of process in the form found in /proc/pid/comm (limited to 15
@@ -1225,45 +1308,28 @@ void igt_unlock_mem(void)
  */
 int igt_is_process_running(const char *comm)
 {
-#if HAVE_LIBPROCPS
-	PROCTAB *proc;
-	proc_t *proc_info;
-	bool found = false;
-
-	proc = openproc(PROC_FILLCOM | PROC_FILLSTAT);
-	igt_assert(proc != NULL);
-
-	while ((proc_info = readproc(proc, NULL))) {
-		if (!strncasecmp(proc_info->cmd, comm, sizeof(proc_info->cmd))) {
-			freeproc(proc_info);
-			found = true;
-			break;
-		}
-		freeproc(proc_info);
-	}
-
-	closeproc(proc);
-	return found;
-#else
-	enum pids_item Item[] = { PIDS_CMD };
-	struct pids_info *info = NULL;
-	struct pids_stack *stack;
-	char *pid_comm;
+	struct igt_process pc;
 	bool found = false;
+	int len;
 
-	if (procps_pids_new(&info, Item, 1) < 0)
+	if (!comm)
+		return false;
+	len = strlen(comm);
+	if (!len)
 		return false;
-	while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
-		pid_comm = PIDS_VAL(0, str, stack, info);
-		if (!strncasecmp(pid_comm, comm, strlen(pid_comm))) {
+
+	open_process(&pc);
+	while (get_process_ids(&pc)) {
+		if (strlen(pc.comm) != len)
+			continue;
+		if (!strncasecmp(pc.comm, comm, len)) {
 			found = true;
 			break;
 		}
 	}
+	close_process(&pc);
 
-	procps_pids_unref(&info);
 	return found;
-#endif
 }
 
 /**
@@ -1280,50 +1346,29 @@ int igt_is_process_running(const char *comm)
  */
 int igt_terminate_process(int sig, const char *comm)
 {
-#if HAVE_LIBPROCPS
-	PROCTAB *proc;
-	proc_t *proc_info;
+	struct igt_process pc;
 	int err = 0;
+	int len;
 
-	proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
-	igt_assert(proc != NULL);
-
-	while ((proc_info = readproc(proc, NULL))) {
-		if (!strncasecmp(proc_info->cmd, comm, sizeof(proc_info->cmd))) {
+	if (!comm)
+		return 0;
+	len = strlen(comm);
+	if (!len)
+		return 0;
 
-			if (kill(proc_info->tid, sig) < 0)
+	open_process(&pc);
+	while (get_process_ids(&pc)) {
+		if (strlen(pc.comm) != len)
+			continue;
+		if (!strncasecmp(pc.comm, comm, len)) {
+			if (kill(pc.tid, sig) < 0)
 				err = -errno;
-
-			freeproc(proc_info);
 			break;
 		}
-		freeproc(proc_info);
 	}
+	close_process(&pc);
 
-	closeproc(proc);
 	return err;
-#else
-	enum pids_item Items[] = { PIDS_ID_PID, PIDS_CMD };
-	struct pids_info *info = NULL;
-	struct pids_stack *stack;
-	char *pid_comm;
-	int pid;
-	int err = 0;
-
-	if (procps_pids_new(&info, Items, 2) < 0)
-		return -errno;
-	while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
-		pid = PIDS_VAL(0, s_int, stack, info);
-		pid_comm = PIDS_VAL(1, str, stack, info);
-		if (!strncasecmp(pid_comm, comm, strlen(pid_comm))) {
-			if (kill(pid, sig) < 0)
-				err = -errno;
-			break;
-		}
-	}
-	procps_pids_unref(&info);
-	return err;
-#endif
 }
 
 struct pinfo {
@@ -1472,19 +1517,15 @@ __igt_lsof(const char *dir)
 	char *name_lnk;
 	struct stat st;
 	int state = 0;
-#ifdef HAVE_LIBPROCPS
-	PROCTAB *proc;
-	proc_t *proc_info;
-
-	proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
-	igt_assert(proc != NULL);
+	struct igt_process pc;
 
-	while ((proc_info = readproc(proc, NULL))) {
+	open_process(&pc);
+	while (get_process_ids(&pc)) {
 		ssize_t read;
 
 		/* check current working directory */
 		memset(path, 0, sizeof(path));
-		snprintf(path, sizeof(path), "/proc/%d/cwd", proc_info->tid);
+		snprintf(path, sizeof(path), "/proc/%d/cwd", pc.tid);
 
 		if (stat(path, &st) == -1)
 			continue;
@@ -1495,56 +1536,17 @@ __igt_lsof(const char *dir)
 		name_lnk[read] = '\0';
 
 		if (!strncmp(dir, name_lnk, strlen(dir)))
-			igt_show_stat(proc_info->tid, proc_info->cmd, &state, name_lnk);
+			igt_show_stat(pc.tid, pc.comm, &state, name_lnk);
 
 		/* check also fd, seems that lsof(8) doesn't look here */
 		memset(path, 0, sizeof(path));
-		snprintf(path, sizeof(path), "/proc/%d/fd", proc_info->tid);
+		snprintf(path, sizeof(path), "/proc/%d/fd", pc.tid);
 
-		__igt_lsof_fds(proc_info->tid, proc_info->cmd, &state, path, dir);
-
-		free(name_lnk);
-		freeproc(proc_info);
-	}
-
-	closeproc(proc);
-#else
-	enum pids_item Items[] = { PIDS_ID_PID, PIDS_CMD };
-	struct pids_info *info = NULL;
-	struct pids_stack *stack;
-
-	if (procps_pids_new(&info, Items, 2) < 0)
-		return;
-	while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
-		ssize_t read;
-		int tid = PIDS_VAL(0, s_int, stack, info);
-		char *pid_comm = PIDS_VAL(1, str, stack, info);
-
-		/* check current working directory */
-		memset(path, 0, sizeof(path));
-		snprintf(path, sizeof(path), "/proc/%d/cwd", tid);
-
-		if (stat(path, &st) == -1)
-			continue;
-
-		name_lnk = malloc(st.st_size + 1);
-
-		igt_assert((read = readlink(path, name_lnk, st.st_size + 1)));
-		name_lnk[read] = '\0';
-
-		if (!strncmp(dir, name_lnk, strlen(dir)))
-			igt_show_stat(tid, pid_comm, &state, name_lnk);
-
-		/* check also fd, seems that lsof(8) doesn't look here */
-		memset(path, 0, sizeof(path));
-		snprintf(path, sizeof(path), "/proc/%d/fd", tid);
-
-		__igt_lsof_fds(tid, pid_comm, &state, path, dir);
+		__igt_lsof_fds(pc.tid, pc.comm, &state, path, dir);
 
 		free(name_lnk);
 	}
-	procps_pids_unref(&info);
-#endif
+	close_process(&pc);
 }
 
 /**
@@ -1608,6 +1610,7 @@ static int pipewire_pulse_pid = 0;
 static int pipewire_pw_reserve_pid = 0;
 static struct igt_helper_process pw_reserve_proc = {};
 
+
 static void pipewire_reserve_wait(void)
 {
 	char xdg_dir[PATH_MAX];
@@ -1615,49 +1618,19 @@ static void pipewire_reserve_wait(void)
 	struct passwd *pw;
 	int tid = 0, euid, egid;
 
-#ifdef HAVE_LIBPROCPS
-	igt_fork_helper(&pw_reserve_proc) {
-		proc_t *proc_info;
-		PROCTAB *proc;
-
-		igt_info("Preventing pipewire-pulse to use the audio drivers\n");
-
-		proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
-		igt_assert(proc != NULL);
-
-		while ((proc_info = readproc(proc, NULL))) {
-			if (pipewire_pulse_pid == proc_info->tid)
-				break;
-			freeproc(proc_info);
-		}
-		closeproc(proc);
-
-		tid = proc_info->tid;
-		euid = proc_info->euid;
-		egid = proc_info->egid;
-		freeproc(proc_info);
-#else
 	igt_fork_helper(&pw_reserve_proc) {
-		enum pids_item Items[] = { PIDS_ID_PID, PIDS_ID_EUID, PIDS_ID_EGID };
-		enum rel_items { EU_PID, EU_EUID, EU_EGID };
-		struct pids_info *info = NULL;
-		struct pids_stack *stack;
+		struct igt_process pc;
 
 		igt_info("Preventing pipewire-pulse to use the audio drivers\n");
-
-		if (procps_pids_new(&info, Items, 3) < 0) {
-			igt_info("error getting pids: %d\n", errno);
-			exit(errno);
-		}
-		while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
-			tid = PIDS_VAL(EU_PID, s_int, stack, info);
+		open_process(&pc);
+		while (get_process_ids(&pc)) {
+			tid = pc.tid;
+			euid = pc.euid;
+			egid = pc.egid;
 			if (pipewire_pulse_pid == tid)
 				break;
 		}
-		euid = PIDS_VAL(EU_EUID, s_int, stack, info);
-		egid = PIDS_VAL(EU_EGID, s_int, stack, info);
-		procps_pids_unref(&info);
-#endif
+		close_process(&pc);
 
 		/* Sanity check: if it can't find the process, it means it has gone */
 		if (pipewire_pulse_pid != tid)
@@ -1700,42 +1673,19 @@ int pipewire_pulse_start_reserve(void)
 	 * pipewire version 0.3.50 or upper.
 	 */
 	for (attempts = 0; attempts < PIPEWIRE_RESERVE_MAX_TIME; attempts++) {
-#ifdef HAVE_LIBPROCPS
-		PROCTAB *proc;
-		proc_t *proc_info;
+		struct igt_process pc;
 
 		usleep(1000);
-		proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
-		igt_assert(proc != NULL);
-
-		while ((proc_info = readproc(proc, NULL))) {
-			if (!strcmp(proc_info->cmd, "pw-reserve")) {
+		open_process(&pc);
+		while (get_process_ids(&pc)) {
+			if (!strcmp(pc.comm, "pw-reserve")) {
 				is_pw_reserve_running = true;
-				pipewire_pw_reserve_pid = proc_info->tid;
-				freeproc(proc_info);
+				pipewire_pw_reserve_pid = pc.tid;
 				break;
 			}
-			freeproc(proc_info);
 		}
-		closeproc(proc);
-#else
-		enum pids_item Items[] = { PIDS_ID_PID, PIDS_CMD };
-		struct pids_info *info = NULL;
-		struct pids_stack *stack;
-
-		usleep(1000);
+		close_process(&pc);
 
-		if (procps_pids_new(&info, Items, 2) < 0)
-			return 1;
-		while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
-			if (!strcmp(PIDS_VAL(1, str, stack, info), "pw-reserve")) {
-				is_pw_reserve_running = true;
-				pipewire_pw_reserve_pid = PIDS_VAL(0, s_int, stack, info);
-				break;
-			}
-		}
-		procps_pids_unref(&info);
-#endif
 		if (is_pw_reserve_running)
 			break;
 	}
@@ -1899,46 +1849,17 @@ igt_lsof_kill_audio_processes(void)
 {
 	char path[PATH_MAX];
 	int fail = 0;
+	struct igt_process pc;
 
-#ifdef HAVE_LIBPROCPS
-	proc_t *proc_info;
-	PROCTAB *proc;
-
-	proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
-	igt_assert(proc != NULL);
+	open_process(&pc);
 	pipewire_pulse_pid = 0;
-	while ((proc_info = readproc(proc, NULL))) {
-		if (snprintf(path, sizeof(path), "/proc/%d/fd", proc_info->tid) < 1)
+	while (get_process_ids(&pc)) {
+		if (snprintf(path, sizeof(path), "/proc/%d/fd", pc.tid) < 1)
 			fail++;
 		else
-			fail += __igt_lsof_audio_and_kill_proc(proc_info->tid, proc_info->cmd, proc_info->euid, proc_info->egid, path);
-
-		freeproc(proc_info);
+			fail += __igt_lsof_audio_and_kill_proc(pc.tid, pc.comm, pc.euid, pc.egid, path);
 	}
-	closeproc(proc);
-#else
-	enum pids_item Items[] = { PIDS_ID_PID, PIDS_CMD, PIDS_ID_EUID, PIDS_ID_EGID };
-	enum rel_items { EU_PID, EU_CMD, EU_EUID, EU_EGID };
-	struct pids_info *info = NULL;
-	struct pids_stack *stack;
-	pid_t tid;
-
-	if (procps_pids_new(&info, Items, 4) < 0)
-		return 1;
-	while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
-		tid = PIDS_VAL(EU_PID, s_int, stack, info);
-
-		if (snprintf(path, sizeof(path), "/proc/%d/fd", tid) < 1)
-			fail++;
-		else
-			fail += __igt_lsof_audio_and_kill_proc(tid,
-				PIDS_VAL(EU_CMD, str, stack, info),
-				PIDS_VAL(EU_EUID, s_int, stack, info),
-				PIDS_VAL(EU_EGID, s_int, stack, info),
-				path);
-	}
-	procps_pids_unref(&info);
-#endif
+	close_process(&pc);
 
 	return fail;
 }
-- 
2.39.2


