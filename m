Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55C46E51C
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Nov 2021 10:43:38 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 17 Nov 2021 12:42:29 +0200
Message-Id: <20211117104229.18663-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] igt_core: Fix docs for SLOW_QUICK
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

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 lib/igt_core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 6b8dbf34..077e1bf3 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1170,7 +1170,7 @@ bool igt_run_in_simulation(void);
  * Simple macro to select between two values (e.g. number of test rounds or test
  * buffer size) depending upon whether i-g-t is run in simulation mode or not.
  */
-#define SLOW_QUICK(slow,quick) (igt_run_in_simulation() ? (quick) : (slow))
+#define SLOW_QUICK(quick,slow) (igt_run_in_simulation() ? (slow) : (quick))
 
 void igt_skip_on_simulation(void);
 
-- 
2.29.2
