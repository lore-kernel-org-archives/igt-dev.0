Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E24E90F4B
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Aug 2022 08:17:34 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  4 Aug 2022 13:48:40 +0530
Message-Id: <20220804081840.21048-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/testdisplay: Skip modeset if no
 display is connected
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

Even if no display is connected; test executes and result in
SUCCESS with no modeset happening.
Made changes, to SKIP test if there is no display connected.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/testdisplay.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index e9fbd2601..8ceca363c 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -478,6 +478,9 @@ int update_display(bool probe)
 	struct connector *connectors;
 	int c;
 
+	igt_display_require(&display, drm_fd);
+	igt_display_require_output(&display);
+
 	resources = drmModeGetResources(drm_fd);
 	igt_require(resources);
 
-- 
2.25.1
