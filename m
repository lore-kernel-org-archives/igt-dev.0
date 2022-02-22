Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Feb 2022 13:56:01 +0000
Message-Id: <20220222135605.1120767-8-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
References: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/11] libdrmclient: Support multiple DRM
 cards
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

Require DRM minor match during client lookup.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_clients.c | 14 ++++++++------
 lib/igt_drm_clients.h |  2 +-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 116479a9f363..cf044597d537 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -57,7 +57,7 @@ struct igt_drm_clients *igt_drm_clients_init(void *private_data)
 struct igt_drm_client *
 igt_drm_clients_find(struct igt_drm_clients *clients,
 		     enum igt_drm_client_status status,
-		     unsigned int id)
+		     unsigned int drm_minor, unsigned int id)
 {
 	unsigned int start, num;
 	struct igt_drm_client *c;
@@ -69,7 +69,8 @@ igt_drm_clients_find(struct igt_drm_clients *clients,
 		if (status != c->status)
 			continue;
 
-		if (status == IGT_DRM_CLIENT_FREE || c->id == id)
+		if (status == IGT_DRM_CLIENT_FREE ||
+		    (drm_minor == c->drm_minor && c->id == id))
 			return c;
 	}
 
@@ -123,9 +124,10 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 {
 	struct igt_drm_client *c;
 
-	assert(!igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE, info->id));
+	assert(!igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE,
+				     drm_minor, info->id));
 
-	c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_FREE, 0);
+	c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_FREE, 0, 0);
 	if (!c) {
 		unsigned int idx = clients->num_clients;
 
@@ -359,11 +361,11 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 				continue;
 
 			if (igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE,
-						info.id))
+						 minor, info.id))
 				continue; /* Skip duplicate fds. */
 
 			c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_PROBE,
-						info.id);
+						 minor, info.id);
 			if (!c)
 				igt_drm_client_add(clients, &info, client_pid,
 						   client_name, minor);
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 7a6318c6af5f..6da445eab34a 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -87,7 +87,7 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 struct igt_drm_client *
 igt_drm_clients_find(struct igt_drm_clients *clients,
 		     enum igt_drm_client_status status,
-		     unsigned int id);
+		     unsigned int drm_minor, unsigned int id);
 
 struct igt_drm_clients *
 igt_drm_clients_sort(struct igt_drm_clients *clients,
-- 
2.32.0
