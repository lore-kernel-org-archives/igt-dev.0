Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C988610E659
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 09:13:15 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Jul 2023 14:47:24 +0530
Message-Id: <20230713091726.272816-2-kunal1.joshi@intel.com>
In-Reply-To: <20230713091726.272816-1-kunal1.joshi@intel.com>
References: <20230713091726.272816-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/igt_chamelium: reset chamelium
 before starting autodiscovery
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

TypeC connector need disabling modeset for correctly doing hpd cycle
so do it before going for autodiscovery

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_chamelium.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index a235f3c87..95983ff25 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -2903,6 +2903,13 @@ struct chamelium *chamelium_init(int drm_fd, igt_display_t *display)
 	chamelium->drm_fd = dup(drm_fd);
 	IGT_INIT_LIST_HEAD(&chamelium->edids);
 
+	/*
+	 * Reset the chamelium and do a disabling modeset for
+	 * TypeC connector to come up nicely
+	 */
+	chamelium_reset(chamelium);
+	igt_modeset_disable_all_outputs(display);
+
 	if (!chamelium_read_port_mappings(chamelium, drm_fd))
 		goto error;
 
-- 
2.25.1
