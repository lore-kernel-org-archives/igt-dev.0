Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53D410E9A6
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 21:00:16 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 13:00:06 -0800
Message-Id: <20230214210007.2026033-30-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
References: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 29/30] tools/perf: Choose the right card
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
index ee8a288d..9337da12 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -241,10 +241,10 @@ read_device_param(const char *stem, int id, const char *param)
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
 
@@ -273,20 +273,18 @@ open_render_node(uint32_t *devid, int card)
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
