Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C5810E1D4
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 00:05:35 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 kamil.konieczny@linux.intel.com
Date: Tue, 21 Mar 2023 17:05:22 -0700
Message-Id: <20230322000523.3310187-31-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230322000523.3310187-1-umesh.nerlige.ramappa@intel.com>
References: <20230322000523.3310187-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 30/31] tools/perf: Choose the right card
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Choose the right dri card to open for perf recorder.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tools/i915-perf/i915_perf_recorder.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index ca435483..1c85a099 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -243,10 +243,10 @@ read_device_param(const char *stem, int id, const char *param)
 }
 
 static int
-find_intel_render_node(void)
+find_intel_card_node(void)
 {
-	for (int i = 128; i < (128 + 16); i++) {
-		if (read_device_param("renderD", i, "vendor") == 0x8086)
+	for (int i = 0; i < 128; i++) {
+		if (read_device_param("card", i, "vendor") == 0x8086)
 			return i;
 	}
 
@@ -275,20 +275,18 @@ open_render_node(uint32_t *devid, int card)
 	char *name;
 	int ret;
 	int fd;
-	int render;
 
 	if (card < 0) {
-		render = find_intel_render_node();
-		if (render < 0)
+		card = find_intel_card_node();
+
+		if (card < 0)
 			return -1;
-	} else {
-		render = 128 + card;
 	}
 
-	ret = asprintf(&name, "/dev/dri/renderD%u", render);
+	ret = asprintf(&name, "/dev/dri/card%u", card);
 	assert(ret != -1);
 
-	*devid = read_device_param("renderD", render, "device");
+	*devid = read_device_param("card", card, "device");
 
 	fd = open(name, O_RDWR);
 	free(name);
-- 
2.36.1
