Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DE010E15E
 for <igt-dev@lists.freedesktop.org>; Sat,  6 May 2023 00:55:39 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri,  5 May 2023 17:55:19 -0700
Message-Id: <20230506005528.1890922-7-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
References: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
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
2.34.1
