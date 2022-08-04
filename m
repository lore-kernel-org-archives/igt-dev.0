Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D72512BB4D
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Aug 2022 09:46:30 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  4 Aug 2022 15:17:39 +0530
Message-Id: <20220804094739.25175-1-swati2.sharma@intel.com>
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
 tests/testdisplay.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index e9fbd2601..c6b819399 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -476,8 +476,12 @@ set_stereo_mode(struct connector *c)
 int update_display(bool probe)
 {
 	struct connector *connectors;
+	igt_display_t display;
 	int c;
 
+	igt_display_require(&display, drm_fd);
+	igt_display_require_output(&display);
+
 	resources = drmModeGetResources(drm_fd);
 	igt_require(resources);
 
-- 
2.25.1
