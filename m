Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Mar 2022 15:03:47 +0100
Message-Id: <20220331140348.2985832-12-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220331140348.2985832-1-tvrtko.ursulin@linux.intel.com>
References: <20220331140348.2985832-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 11/12] libdrmclient: Unexport
 igt_drm_client_update
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

It is currently unused so no need to export it as API for now.

Also change the signature to take struct drm_client_fdinfo in order to
avoid needing to pass in a sized array.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_clients.c | 16 ++++++++--------
 lib/igt_drm_clients.h |  3 ---
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index e8e86969f984..32e1d7a0f20e 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -77,9 +77,9 @@ igt_drm_clients_find(struct igt_drm_clients *clients,
 	return NULL;
 }
 
-void
+static void
 igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
-		      uint64_t val[16])
+		      const struct drm_client_fdinfo *info)
 {
 	unsigned int i;
 
@@ -104,13 +104,13 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 	c->total_runtime = 0;
 
 	for (i = 0; i <= c->engines->max_engine_id; i++) {
-		if (val[i] < c->last[i])
+		if (info->busy[i] < c->last[i])
 			continue; /* It will catch up soon. */
 
-		c->total_runtime += val[i];
-		c->val[i] = val[i] - c->last[i];
+		c->total_runtime += info->busy[i];
+		c->val[i] = info->busy[i] - c->last[i];
 		c->last_runtime += c->val[i];
-		c->last[i] = val[i];
+		c->last[i] = info->busy[i];
 	}
 
 	c->samples++;
@@ -168,7 +168,7 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 	c->last = calloc(c->engines->max_engine_id + 1, sizeof(c->last));
 	assert(c->val && c->last);
 
-	igt_drm_client_update(c, pid, name, info->busy);
+	igt_drm_client_update(c, pid, name, info);
 }
 
 void igt_drm_client_free(struct igt_drm_client *c)
@@ -418,7 +418,7 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 						   client_name, minor);
 			else
 				igt_drm_client_update(c, client_pid,
-						      client_name, info.busy);
+						      client_name, &info);
 		}
 
 next:
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 47547aa8b75f..6817acc34e81 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -92,9 +92,6 @@ struct igt_drm_clients *
 igt_drm_clients_sort(struct igt_drm_clients *clients,
 		     int (*cmp)(const void *, const void *, void *));
 
-void igt_drm_client_update(struct igt_drm_client *c,
-			   unsigned int pid, char *name, uint64_t val[16]);
-
 void igt_drm_client_add(struct igt_drm_clients *clients,
 			struct drm_client_fdinfo *,
 			unsigned int pid, char *name, unsigned int drm_minor);
-- 
2.32.0
