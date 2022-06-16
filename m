Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Jun 2022 15:06:32 +0100
Message-Id: <20220616140637.559194-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220616140637.559194-1-tvrtko.ursulin@linux.intel.com>
References: <20220616140637.559194-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/8] libdrmclients: Record client drm minor
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Prepare for supporting clients belonging to multiple DRM cards by storing
the DRM minor in the client record.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_clients.c | 22 ++++++++++++++--------
 lib/igt_drm_clients.h |  1 +
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index eabd43773f2d..c23a3fae9793 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -115,7 +115,7 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 static void
 igt_drm_client_add(struct igt_drm_clients *clients,
 		   const struct drm_client_fdinfo *info,
-		   unsigned int pid, char *name)
+		   unsigned int pid, char *name, unsigned int drm_minor)
 {
 	struct igt_drm_client *c;
 
@@ -140,6 +140,7 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 	}
 
 	c->id = info->id;
+	c->drm_minor = drm_minor;
 	c->clients = clients;
 	c->val = calloc(clients->num_classes, sizeof(c->val));
 	c->last = calloc(clients->num_classes, sizeof(c->last));
@@ -286,16 +287,21 @@ static bool get_task_name(const char *buffer, char *out, unsigned long sz)
 	return true;
 }
 
-static bool is_drm_fd(int fd_dir, const char *name)
+static bool is_drm_fd(int fd_dir, const char *name, unsigned int *minor)
 {
 	struct stat stat;
 	int ret;
 
 	ret = fstatat(fd_dir, name, &stat, 0);
 
-	return ret == 0 &&
-	       (stat.st_mode & S_IFMT) == S_IFCHR &&
-	       major(stat.st_rdev) == 226;
+	if (ret == 0 &&
+	    (stat.st_mode & S_IFMT) == S_IFCHR &&
+	    major(stat.st_rdev) == 226) {
+		*minor = minor(stat.st_rdev);
+		return true;
+	}
+
+	return false;
 }
 
 /**
@@ -348,10 +354,10 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 		return clients;
 
 	while ((proc_dent = readdir(proc_dir)) != NULL) {
+		unsigned int client_pid, minor = 0;
 		int pid_dir = -1, fd_dir = -1;
 		struct dirent *fdinfo_dent;
 		char client_name[64] = { };
-		unsigned int client_pid;
 		DIR *fdinfo_dir = NULL;
 		char buf[4096];
 		size_t count;
@@ -393,7 +399,7 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 			if (!isdigit(fdinfo_dent->d_name[0]))
 				continue;
 
-			if (!is_drm_fd(fd_dir, fdinfo_dent->d_name))
+			if (!is_drm_fd(fd_dir, fdinfo_dent->d_name, &minor))
 				continue;
 
 			if (!__igt_parse_drm_fdinfo(dirfd(fdinfo_dir),
@@ -412,7 +418,7 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 						info.id);
 			if (!c)
 				igt_drm_client_add(clients, &info, client_pid,
-						   client_name);
+						   client_name, minor);
 			else
 				igt_drm_client_update(c, client_pid,
 						      client_name, &info);
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index bced19adb055..ffa219c9c9fd 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -44,6 +44,7 @@ struct igt_drm_client {
 
 	enum igt_drm_client_status status;
 	unsigned int id; /* DRM client id from fdinfo. */
+	unsigned int drm_minor; /* DRM minor of this client. */
 	unsigned int pid; /* PID which has this DRM fd open. */
 	char name[24]; /* Process name of the owning PID. */
 	char print_name[24]; /* Name without any non-printable characters. */
-- 
2.34.1
