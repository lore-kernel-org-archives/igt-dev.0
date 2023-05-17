Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9903F10E48D
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 21:25:46 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 17 May 2023 14:25:33 -0700
Message-Id: <20230517212542.3681862-7-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230517212542.3681862-1-umesh.nerlige.ramappa@intel.com>
References: <20230517212542.3681862-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 06/15] intel_gpu_top: Add an array of
 freq and rc6 counters
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

Since rc6 and frequency events are specific to a tile in multi-tile platforms,
prepare support for multi-tile by storing these events in an array.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 453090c29..ae086ae12 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -88,6 +88,7 @@ struct engine {
 	struct pmu_counter sema;
 };
 
+#define MAX_GTS 4
 struct engines {
 	unsigned int num_engines;
 	unsigned int num_classes;
@@ -107,9 +108,12 @@ struct engines {
 	unsigned int num_imc;
 
 	struct pmu_counter freq_req;
+	struct pmu_counter freq_req_gt[MAX_GTS];
 	struct pmu_counter freq_act;
+	struct pmu_counter freq_act_gt[MAX_GTS];
 	struct pmu_counter irq;
 	struct pmu_counter rc6;
+	struct pmu_counter rc6_gt[MAX_GTS];
 
 	bool discrete;
 	char *device;
-- 
2.36.1
