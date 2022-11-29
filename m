Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E567B10E059
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 17:00:02 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Nov 2022 08:59:53 -0800
Message-Id: <20221129165953.1064213-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/i915/perf: Include ATSM in ACM metrics
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

ATSM shares DG2 metrics.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/perf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 4a946906a84..c7e87457bd0 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -159,6 +159,7 @@ is_acm_gt1(const struct intel_perf_devinfo *devinfo)
 #define INTEL_VGA_DEVICE(_id, _info) _id
 	static const uint32_t devids[] = {
 		INTEL_DG2_G11_IDS(NULL),
+		INTEL_ATS_M75_IDS(NULL),
 	};
 #undef INTEL_VGA_DEVICE
 	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
@@ -193,6 +194,7 @@ is_acm_gt3(const struct intel_perf_devinfo *devinfo)
 #define INTEL_VGA_DEVICE(_id, _info) _id
 	static const uint32_t devids[] = {
 		INTEL_DG2_G10_IDS(NULL),
+		INTEL_ATS_M150_IDS(NULL),
 	};
 #undef INTEL_VGA_DEVICE
 	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
-- 
2.38.0
