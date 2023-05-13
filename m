Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEE310E71E
 for <igt-dev@lists.freedesktop.org>; Sat, 13 May 2023 02:22:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 12 May 2023 19:22:25 -0700
Message-Id: <20230513022234.2832233-7-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230513022234.2832233-1-umesh.nerlige.ramappa@intel.com>
References: <20230513022234.2832233-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/15] intel_gpu_top: Add an array of freq
 and rc6 counters
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
index b6827b3de..3d21f25bd 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -87,6 +87,7 @@ struct engine_class {
 	unsigned int num_engines;
 };
 
+#define MAX_GTS 4
 struct engines {
 	unsigned int num_engines;
 	unsigned int num_classes;
@@ -106,9 +107,12 @@ struct engines {
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
