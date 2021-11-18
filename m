Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9379A6E9DA
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Nov 2021 08:38:00 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 18 Nov 2021 10:36:52 +0200
Message-Id: <20211118083652.2580-1-petri.latvala@intel.com>
In-Reply-To: <20211117104229.18663-1-petri.latvala@intel.com>
References: <20211117104229.18663-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] igt_core: Fix docs for SLOW_QUICK
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The macro is for choosing between two values depending on whether IGT
has been told it's running in simulation mode. The parameter names and
their documentation was the opposite of what actually happened.

The only user, gem_lut_handle, uses the macro correctly, having the
"use this value in simulation mode" value as the second parameter.

v2: Remove confusion on whether "slow" means "slow test" or "slow
platform" by using "hw" and "sim" instead. (Ashutosh)

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_core.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 6b8dbf34..0aad161d 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1164,13 +1164,13 @@ void igt_install_exit_handler(igt_exit_handler_t fn);
 bool igt_run_in_simulation(void);
 /**
  * SLOW_QUICK:
- * @slow: value in simulation mode
- * @quick: value in normal mode
+ * @sim: value in simulation mode
+ * @hw: value in normal mode
  *
  * Simple macro to select between two values (e.g. number of test rounds or test
  * buffer size) depending upon whether i-g-t is run in simulation mode or not.
  */
-#define SLOW_QUICK(slow,quick) (igt_run_in_simulation() ? (quick) : (slow))
+#define SLOW_QUICK(hw, sim) (igt_run_in_simulation() ? (sim) : (hw))
 
 void igt_skip_on_simulation(void);
 
-- 
2.29.2
