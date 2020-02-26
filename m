Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FCF6E2DE
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2020 08:23:52 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Wed, 26 Feb 2020 10:23:48 +0200
Message-Id: <20200226082348.1575427-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/i915/perf: reenable perf tests on
 cometlake
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
List-ID: <igt-dev@lists.freedesktop.org>

The perf code coming from gputop assumed that devinfo for
cometlake/coffeelake used the same entry (devinfo->is_coffeelake).

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Fixes: 53f8f541ca ("lib: Add i915_perf library")
---
 lib/i915/perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index a5dd3eab..babfe633 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -219,7 +219,7 @@ intel_perf_for_devinfo(uint32_t device_id,
 	} else if (devinfo->is_geminilake) {
 		perf->devinfo.eu_threads_count = 6;
 		intel_perf_load_metrics_glk(perf);
-	} else if (devinfo->is_coffeelake) {
+	} else if (devinfo->is_coffeelake || devinfo->is_cometlake) {
 		switch (devinfo->gt) {
 		case 2:
 			intel_perf_load_metrics_cflgt2(perf);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
