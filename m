Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F1A6E0BA
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2020 13:18:19 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Tue,  7 Jul 2020 16:18:13 +0300
Message-Id: <20200707131814.17540-2-imre.deak@intel.com>
In-Reply-To: <20200707131814.17540-1-imre.deak@intel.com>
References: <20200707131814.17540-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/igt_chamelium: Duplicate the
 caller's drm_fd
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Take a copy of the caller's FD so that the Chamelium lib functions can
access the DRM file regardless of when the caller closes its own FD.

This is needed at least by the next patch.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_chamelium.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 5924e5615..90a2d04bb 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -2485,7 +2485,7 @@ struct chamelium *chamelium_init(int drm_fd)
 	if (cleanup_instance)
 		chamelium_deinit(cleanup_instance);
 
-	chamelium->drm_fd = drm_fd;
+	chamelium->drm_fd = dup(drm_fd);
 	IGT_INIT_LIST_HEAD(&chamelium->edids);
 
 	if (!chamelium_read_port_mappings(chamelium, drm_fd))
@@ -2511,6 +2511,8 @@ struct chamelium *chamelium_init(int drm_fd)
 
 	return chamelium;
 error:
+	close(chamelium->drm_fd);
+
 	chamelium_deinit_rpc_only(chamelium);
 
 	return NULL;
@@ -2550,6 +2552,8 @@ void chamelium_deinit(struct chamelium *chamelium)
 		free(pos);
 	}
 
+	close(chamelium->drm_fd);
+
 	xmlrpc_client_destroy(chamelium->client);
 
 	for (i = 0; i < chamelium->port_count; i++)
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
