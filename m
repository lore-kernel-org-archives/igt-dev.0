Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Feb 2022 13:56:00 +0000
Message-Id: <20220222135605.1120767-7-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
References: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/11] libdrmclients: Record client drm minor
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Prepare for supporting clients belonging to multiple DRM cards by storing
the DRM minor in the client record.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_clients.c | 33 ++++++++++++++++++++-------------
 lib/igt_drm_clients.h |  6 ++++--
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 591602f4c9f5..116479a9f363 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -117,12 +117,13 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 }
 
 void
-igt_drm_client_add(struct igt_drm_clients *clients, unsigned int id,
-		   unsigned int pid, char *name, uint64_t busy[16])
+igt_drm_client_add(struct igt_drm_clients *clients,
+		   struct drm_client_fdinfo *info,
+		   unsigned int pid, char *name, unsigned int drm_minor)
 {
 	struct igt_drm_client *c;
 
-	assert(!igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE, id));
+	assert(!igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE, info->id));
 
 	c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_FREE, 0);
 	if (!c) {
@@ -137,13 +138,14 @@ igt_drm_client_add(struct igt_drm_clients *clients, unsigned int id,
 		memset(c, 0, (clients->num_clients - idx) * sizeof(*c));
 	}
 
-	c->id = id;
+	c->id = info->id;
+	c->drm_minor = drm_minor;
 	c->clients = clients;
 	c->val = calloc(clients->num_classes, sizeof(c->val));
 	c->last = calloc(clients->num_classes, sizeof(c->last));
 	assert(c->val && c->last);
 
-	igt_drm_client_update(c, pid, name, busy);
+	igt_drm_client_update(c, pid, name, info->busy);
 }
 
 void igt_drm_client_free(struct igt_drm_client *c)
@@ -254,16 +256,21 @@ static bool get_task_name(const char *buffer, char *out, unsigned long sz)
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
 
 struct igt_drm_clients *
@@ -293,10 +300,10 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
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
@@ -338,7 +345,7 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 			if (!isdigit(fdinfo_dent->d_name[0]))
 				continue;
 
-			if (!is_drm_fd(fd_dir, fdinfo_dent->d_name))
+			if (!is_drm_fd(fd_dir, fdinfo_dent->d_name, &minor))
 				continue;
 
 			memset(&info, 0, sizeof(info));
@@ -358,8 +365,8 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 			c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_PROBE,
 						info.id);
 			if (!c)
-				igt_drm_client_add(clients, info.id, client_pid,
-						   client_name, info.busy);
+				igt_drm_client_add(clients, &info, client_pid,
+						   client_name, minor);
 			else
 				igt_drm_client_update(c, client_pid,
 						      client_name, info.busy);
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 91e9da4c0733..7a6318c6af5f 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -48,6 +48,7 @@ struct igt_drm_client {
 
 	enum igt_drm_client_status status;
 	unsigned int id;
+	unsigned int drm_minor;
 	unsigned int pid;
 	char name[24];
 	char print_name[24];
@@ -95,8 +96,9 @@ igt_drm_clients_sort(struct igt_drm_clients *clients,
 void igt_drm_client_update(struct igt_drm_client *c,
 			   unsigned int pid, char *name, uint64_t val[16]);
 
-void igt_drm_client_add(struct igt_drm_clients *clients, unsigned int id,
-			unsigned int pid, char *name, uint64_t busy[16]);
+void igt_drm_client_add(struct igt_drm_clients *clients,
+			struct drm_client_fdinfo *,
+			unsigned int pid, char *name, unsigned int drm_minor);
 
 void igt_drm_client_free(struct igt_drm_client *c);
 
-- 
2.32.0
