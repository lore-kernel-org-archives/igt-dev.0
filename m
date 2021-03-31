Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Wed, 31 Mar 2021 09:57:13 +0100
Message-Id: <20210331085713.2566057-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel_gpu_top: Do not print client header
 if no client stats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Add a check if client stats are present to init_clients() so that the
returned clients data can be null from the start. This prevents the client
stats header to be printed on old kernels.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index e22e3bedacbe..7311038a39f4 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -671,9 +671,14 @@ struct clients {
 
 static struct clients *init_clients(const char *drm_card)
 {
-	struct clients *clients = malloc(sizeof(*clients));
+	struct clients *clients;
 	const char *slash;
 	ssize_t ret;
+	int dir;
+
+	clients = malloc(sizeof(*clients));
+	if (!clients)
+		return NULL;
 
 	memset(clients, 0, sizeof(*clients));
 
@@ -688,6 +693,14 @@ static struct clients *init_clients(const char *drm_card)
 		       "/sys/class/drm/%s/clients/", slash);
 	assert(ret > 0 && ret < sizeof(clients->sysfs_root));
 
+	dir = open(clients->sysfs_root, O_DIRECTORY | O_RDONLY);
+	if (dir < 0) {
+		free(clients);
+		clients = NULL;
+	} else {
+		close(dir);
+	}
+
 	return clients;
 }
 
@@ -2519,8 +2532,10 @@ int main(int argc, char **argv)
 
 	clients = init_clients(card.pci_slot_name[0] ? card.card : NULL);
 	init_engine_classes(engines);
-	clients->num_classes = engines->num_classes;
-	clients->class = engines->class;
+	if (clients) {
+		clients->num_classes = engines->num_classes;
+		clients->class = engines->class;
+	}
 
 	pmu_sample(engines);
 	scan_clients(clients);
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
