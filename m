Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40666E14D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2020 13:18:20 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Tue,  7 Jul 2020 16:18:14 +0300
Message-Id: <20200707131814.17540-3-imre.deak@intel.com>
In-Reply-To: <20200707131814.17540-1-imre.deak@intel.com>
References: <20200707131814.17540-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] lib/igt_chamelium: Wait for connectors
 after replugging them at exit
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

Making sure all the plugged chamelium ports are connected at exit
So the FB console restore modeset doesn't happen on a disconnected output,
resulting in link training failures.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Tested-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 lib/igt_chamelium.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 90a2d04bb..d9fab902d 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -2541,6 +2541,11 @@ void chamelium_deinit(struct chamelium *chamelium)
 	for (i = 0; i < chamelium->port_count; i++)
 		chamelium_plug(chamelium, &chamelium->ports[i]);
 
+	igt_assert(chamelium->drm_fd != -1);
+	for (i = 0; i < chamelium->port_count; i++)
+		wait_for_connected_state(chamelium->drm_fd,
+					 &chamelium->ports[i].connector_id, 1);
+
 	/* Destroy any EDIDs we created to make sure we don't leak them */
 	igt_list_for_each_entry_safe(pos, tmp, &chamelium->edids, link) {
 		for (i = 0; i < CHAMELIUM_MAX_PORTS; i++) {
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
