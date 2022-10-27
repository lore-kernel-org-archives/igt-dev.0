Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865A010E706
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Oct 2022 20:55:42 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Oct 2022 20:55:23 +0000
Message-Id: <20221027205535.12824-17-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221027205535.12824-1-umesh.nerlige.ramappa@intel.com>
References: <20221027205535.12824-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 16/28] lib/i915/perf: fixup report
 validity
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

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

It appears that on Gfx12+ there is no more validity bit in the
reports.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf_data_reader.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
index e69189ac..857bcd3a 100644
--- a/lib/i915/perf_data_reader.c
+++ b/lib/i915/perf_data_reader.c
@@ -45,13 +45,14 @@ oa_report_ctx_is_valid(const struct intel_perf_devinfo *devinfo,
 {
 	const uint32_t *report = (const uint32_t *) _report;
 
-	if (devinfo->graphics_ver < 8) {
+	if (devinfo->graphics_ver < 8)
 		return false; /* TODO */
-	} else if (devinfo->graphics_ver == 8) {
+	if (devinfo->graphics_ver >= 12)
+		return true; /* Always valid */
+	if (devinfo->graphics_ver == 8)
 		return report[0] & (1ul << 25);
-	} else if (devinfo->graphics_ver > 8) {
+	if (devinfo->graphics_ver > 8)
 		return report[0] & (1ul << 16);
-	}
 
 	return false;
 }
-- 
2.25.1
