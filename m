Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Mon,  6 Nov 2023 12:35:14 +0000
Message-Id: <20231106123518.588528-5-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231106123518.588528-1-tvrtko.ursulin@linux.intel.com>
References: <20231106123518.588528-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [CI 5/9] lib/igt_drm_clients: Fix client id type confusion
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Igt_drm_fdinfo defines it as an unsigned long so it is best that it
matches here as well.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_drm_clients.c | 2 +-
 lib/igt_drm_clients.h | 2 +-
 tools/intel_gpu_top.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 47ad137d5f1f..da51d7335b2b 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -49,7 +49,7 @@ struct igt_drm_clients *igt_drm_clients_init(void *private_data)
 static struct igt_drm_client *
 igt_drm_clients_find(struct igt_drm_clients *clients,
 		     enum igt_drm_client_status status,
-		     unsigned int drm_minor, unsigned int id)
+		     unsigned int drm_minor, unsigned long id)
 {
 	unsigned int start, num;
 	struct igt_drm_client *c;
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 07bd236d43bf..cd37f8508b20 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -56,7 +56,7 @@ struct igt_drm_client {
 	enum igt_drm_client_status status;
 	struct igt_drm_client_regions *regions; /* Memory regions present in this client, to map with memory usage. */
 	struct igt_drm_client_engines *engines; /* Engines used by this client, to map with busynees data. */
-	unsigned int id; /* DRM client id from fdinfo. */
+	unsigned long id; /* DRM client id from fdinfo. */
 	unsigned int drm_minor; /* DRM minor of this client. */
 	unsigned int pid; /* PID which has this DRM fd open. */
 	char pid_str[10]; /* Cached PID representation. */
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 00506c63db4e..34fa99235e11 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -2106,7 +2106,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
 	} else if (output_mode == JSON) {
 		char buf[64];
 
-		snprintf(buf, sizeof(buf), "%u", c->id);
+		snprintf(buf, sizeof(buf), "%lu", c->id);
 		pops->open_struct(buf);
 
 		__json_add_member("name", c->print_name);
-- 
2.39.2
