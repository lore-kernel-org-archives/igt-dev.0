Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6EC10E718
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 04:55:42 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 06:55:19 +0200
Message-Id: <20230125045522.18169-7-ville.syrjala@linux.intel.com>
In-Reply-To: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
References: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/10] tools/intel_watermark: Dump all
 ARB_CTL registers on skl+
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Dump the ARB_CTL registers on all skl+ platforms as well,
and decode the "FBC watermark disable" and "IPC enable"
bits from therein. Those at least are relevant for the
watermark state.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_watermark.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
index 66e76e0dd3ef..7e957f0c8e9a 100644
--- a/tools/intel_watermark.c
+++ b/tools/intel_watermark.c
@@ -321,10 +321,13 @@ static void skl_wm_dump(void)
 	uint32_t nv12_buf_cfg[num_pipes][max_planes];
 	uint32_t plane_ctl[num_pipes][max_planes];
 	uint32_t wm_linetime[num_pipes];
-	uint32_t wm_dbg;
+	uint32_t arb_ctl, arb_ctl2, wm_dbg;
 
 	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, -1);
 
+	arb_ctl = read_reg(0x45000);
+	arb_ctl2 = read_reg(0x45004);
+
 	for (pipe = 0; pipe < num_pipes; pipe++) {
 		int num_planes = skl_num_planes(devid, pipe);
 
@@ -453,6 +456,22 @@ static void skl_wm_dump(void)
 	}
 	printf("\n");
 
+	if (intel_gen(devid) >= 13) {
+		printf(" ARB_LP_CTL 0x%08x\n", arb_ctl);
+		printf(" ARB_HP_CTL 0x%08x\n", arb_ctl2);
+	} else if (intel_gen(devid) >= 12) {
+		printf("        ARB_CTL 0x%08x\n", arb_ctl);
+		printf("  ARB_CTL_ABOX1 0x%08x\n", read_reg(0x45800));
+		printf("  ARB_CTL_ABOX2 0x%08x\n", read_reg(0x45808));
+		printf("       ARB_CTL2 0x%08x\n", arb_ctl2);
+		printf(" ARB_CTL2_ABOX1 0x%08x\n", read_reg(0x45804));
+		printf(" ARB_CTL2_ABOX2 0x%08x\n", read_reg(0x4580c));
+	} else {
+		printf("  ARB_CTL 0x%08x\n", arb_ctl);
+		printf(" ARB_CTL2 0x%08x\n", arb_ctl2);
+	}
+	printf("\n");
+
 	for (pipe = 0; pipe < num_pipes; pipe++) {
 		uint32_t start, end, size;
 		uint32_t lines, blocks, enable;
@@ -583,6 +602,12 @@ static void skl_wm_dump(void)
 		printf("\n\n\n");
 	}
 
+	if (intel_gen(devid) < 13)
+		printf("FBC watermark: %s\n", endis(!REG_DECODE1(arb_ctl, 15, 1)));
+	printf("IPC: %s\n", endis(REG_DECODE1(arb_ctl2, 3, 1)));
+
+	printf("\n");
+
 	printf("* plane watermark enabled\n");
 	printf("(x) line watermark if enabled\n");
 
-- 
2.39.1
