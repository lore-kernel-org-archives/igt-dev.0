Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C346E04E
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Dec 2020 07:16:22 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 14 Dec 2020 09:16:12 +0200
Message-Id: <20201214071612.5953-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] core_setmaster: Load modules before
 accessing device files
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

core_setmaster does special trickery to the dri device files before it
calls drm_open_device. Now that drm_load_module() exists for just
loading the modules without the other things that drm_open_device()
does, use it to ensure the files exist.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/91
---
 tests/core_setmaster.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 20e4defb..470f9441 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -125,6 +125,15 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
 
 igt_main
 {
+	igt_fixture {
+		/*
+		 * We're operating on the device files themselves
+		 * before opening them, make sure the drivers are
+		 * loaded.
+		 */
+		drm_load_module(DRIVER_ANY);
+	}
+
 	igt_describe("Ensure that root can Set/DropMaster");
 	igt_subtest("master-drop-set-root") {
 		check_drop_set();
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
