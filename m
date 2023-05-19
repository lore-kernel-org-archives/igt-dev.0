Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878C810E533
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 15:46:56 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 19 May 2023 08:46:48 -0700
Message-Id: <20230519154650.3751855-15-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230519154650.3751855-1-umesh.nerlige.ramappa@intel.com>
References: <20230519154650.3751855-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 14/16] intel_gpu_top: Show gt specific
 values if requested
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

On multi-gt platforms, the aggregate values are displayed as default. If
user passes -p (physical) option for these platforms, show gt specific
counter values.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 2b867f8dc..6e9b3416c 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1526,6 +1526,26 @@ print_header(const struct igt_device_card *card,
 		&power_group,
 		NULL
 	};
+	int i;
+
+	/*
+	 * If we have multi-gt and the user has specified -p options, show gt
+	 * specific values.
+	 */
+	if (!class_view && engines->num_gts > 1) {
+		int j = 0;
+
+		groups[j++] = &period_group;
+		for (i = 0; i < engines->num_gts; i++)
+			groups[j++] = &freq_group_gt[i];
+
+		groups[j++] = &irq_group;
+		for (i = 0; i < engines->num_gts; i++)
+			groups[j++] = &rc6_group_gt[i];
+
+		groups[j++] = &power_group;
+		groups[j++] = NULL;
+	}
 
 	if (output_mode != JSON)
 		memmove(&groups[0], &groups[1],
-- 
2.36.1
