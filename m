Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Wed,  5 Jul 2023 17:31:04 +0100
Message-Id: <20230705163105.3804677-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230705163105.3804677-1-tvrtko.ursulin@linux.intel.com>
References: <20230705163105.3804677-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/igt_drm_clients: Store memory info
 in the client
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Define the storage structure and copy over memory data as parsed by the
fdinfo helpers.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Rob Clark <robdclark@chromium.org>
---
 lib/igt_drm_clients.c | 31 +++++++++++++++++++++++++++++++
 lib/igt_drm_clients.h | 11 +++++++++++
 2 files changed, 42 insertions(+)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index fdea42752a81..0db5b64effea 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -103,6 +103,8 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 			c->clients->max_name_len = len;
 	}
 
+	/* Engines */
+
 	c->last_runtime = 0;
 	c->total_runtime = 0;
 
@@ -118,6 +120,13 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 		c->last[i] = info->busy[i];
 	}
 
+	/* Memory regions */
+	for (i = 0; i <= c->regions->max_region_id; i++) {
+		assert(i < ARRAY_SIZE(info->region_mem));
+
+		c->memory[i] = info->region_mem[i];
+	}
+
 	c->samples++;
 	c->status = IGT_DRM_CLIENT_ALIVE;
 }
@@ -154,6 +163,8 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 	c->id = info->id;
 	c->drm_minor = drm_minor;
 	c->clients = clients;
+
+	/* Engines */
 	c->engines = malloc(sizeof(*c->engines));
 	assert(c->engines);
 	memset(c->engines, 0, sizeof(*c->engines));
@@ -178,6 +189,26 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 	c->last = calloc(c->engines->max_engine_id + 1, sizeof(c->last));
 	assert(c->val && c->last);
 
+	/* Memory regions */
+	c->regions = malloc(sizeof(*c->regions));
+	assert(c->regions);
+	memset(c->regions, 0, sizeof(*c->regions));
+	c->regions->names = calloc(info->last_region_index + 1,
+				   sizeof(*c->regions->names));
+	assert(c->regions->names);
+
+	for (i = 0; i <= info->last_region_index; i++) {
+		if (!info->region_names[i])
+			continue;
+
+		c->regions->names[i] = strdup(info->region_names[i]);
+		assert(c->regions->names[i]);
+		c->regions->num_regions++;
+		c->regions->max_region_id = i;
+	}
+	c->memory = calloc(c->regions->max_region_id + 1, sizeof(*c->memory));
+	assert(c->memory);
+
 	igt_drm_client_update(c, pid, name, info);
 }
 
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index ed795c193986..07bd236d43bf 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -8,6 +8,8 @@
 
 #include <stdint.h>
 
+#include "lib/igt_drm_fdinfo.h"
+
 /**
  * SECTION:igt_drm_clients
  * @short_description: Parsing driver exposed fdinfo to track DRM clients
@@ -39,12 +41,20 @@ struct igt_drm_client_engines {
 	char **names; /* Array of engine names, either auto-detected or from the passed in engine map. */
 };
 
+struct igt_drm_client_regions {
+	unsigned int num_regions; /* Number of discovered memory_regions. */
+	unsigned int max_region_id; /* Largest memory region index discovered.
+				       (Can differ from num_regions - 1 when using the region map facility.) */
+	char **names; /* Array of region names, either auto-detected or from the passed in region map. */
+};
+
 struct igt_drm_clients;
 
 struct igt_drm_client {
 	struct igt_drm_clients *clients; /* Owning list. */
 
 	enum igt_drm_client_status status;
+	struct igt_drm_client_regions *regions; /* Memory regions present in this client, to map with memory usage. */
 	struct igt_drm_client_engines *engines; /* Engines used by this client, to map with busynees data. */
 	unsigned int id; /* DRM client id from fdinfo. */
 	unsigned int drm_minor; /* DRM minor of this client. */
@@ -57,6 +67,7 @@ struct igt_drm_client {
 	unsigned long last_runtime; /* Aggregate busyness on all engines since previous scan. */
 	unsigned long *val; /* Array of engine busyness data, relative to previous scan. */
 	uint64_t *last; /* Array of engine busyness data as parsed from fdinfo. */
+	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
 };
 
 struct igt_drm_clients {
-- 
2.39.2
