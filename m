Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE8310E715
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 04:55:34 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 06:55:16 +0200
Message-Id: <20230125045522.18169-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
References: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 04/10] tools/intel_watermark: Read LP usage
 from FPGA_DBG on ivb
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

On ivb FPGA_DBG contains the similar LP level sticky bits that
are present in WM_DBG on hsw+. Let's dump these out.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_watermark.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
index 863261e823a5..eac40e4a5d17 100644
--- a/tools/intel_watermark.c
+++ b/tools/intel_watermark.c
@@ -763,6 +763,22 @@ static void ilk_wm_dump(void)
 		printf("\n");
 		/* clear the sticky bits */
 		write_reg(0x45280, wm_dbg);
+	} else if (IS_IVYBRIDGE(devid)) {
+		uint32_t fpga_dbg;
+
+		fpga_dbg = read_reg(0x42300);
+		printf("FPGA_DBG: 0x%08x\n", fpga_dbg);
+		printf(" LP used:");
+		if (fpga_dbg & (1 << 18))
+			printf(" LP0.5");
+		for (i = 1; i < 4; i++) {
+			if (fpga_dbg & (1 << (18+i)))
+				printf(" LP%d", i);
+		}
+		printf("\n");
+		/* clear the sticky LP bits */
+		fpga_dbg &= 1 << 21 | 1 << 20 | 1 << 19 | 1 << 18;
+		write_reg(0x42300, fpga_dbg);
 	}
 
 	intel_register_access_fini(&mmio_data);
-- 
2.39.1
