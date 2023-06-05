Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C58610E031
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 18:18:06 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Jun 2023 20:17:53 +0200
Message-Id: <20230605181753.40607-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib: Don't assert if fd path is unreachable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Processes come and go, access to the /proc/$tid/fd/ is unreliable. Don't
assert when dumping the debug info of what the process has open if that
process is already destroyed.

Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_aux.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index f2b9671e3..386e25783 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1451,16 +1451,18 @@ igt_show_stat(const pid_t tid, const char *cmd, int *state, const char *fn)
 static void
 __igt_lsof_fds(const pid_t tid, const char *cmd, int *state, char *proc_path, const char *dir)
 {
+	/* default fds or kernel threads */
+	static const char *default_fds[] = { "/dev/pts", "/dev/null" };
 	struct dirent *d;
 	struct stat st;
 	char path[PATH_MAX];
 	char *fd_lnk;
+	DIR *dp;
 
-	/* default fds or kernel threads */
-	const char *default_fds[] = { "/dev/pts", "/dev/null" };
+	dp = opendir(proc_path);
+	if (!dp)
+		return;
 
-	DIR *dp = opendir(proc_path);
-	igt_assert(dp);
 again:
 	while ((d = readdir(dp))) {
 		char *copy_fd_lnk;
@@ -1780,7 +1782,8 @@ __igt_lsof_audio_and_kill_proc(const pid_t tid, const char *cmd, const uid_t eui
 	dp = opendir(proc_path);
 	if (!dp && errno == ENOENT)
 		return 0;
-	igt_assert(dp);
+	if (!dp)
+		return 1;
 
 	while ((d = readdir(dp))) {
 		if (*d->d_name == '.')
-- 
2.39.2
