Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBC910E792
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 15:43:48 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 25 Apr 2023 08:39:40 -0700
Message-Id: <20230425153940.768619-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] intel-gfx-fw-info: Make it compatible
 with HuC via GSC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When HuC is loaded via GSC, the firmware format is different and there
is no information for kernel to parse except the version, that is in
a different location.  Check for the magic field as the first dword and
parse the blob differently based on that.

Tesetd with
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/dg2_huc_gsc.bin?id=8f86b5ab3e051170ea240fc409d457e16e24bc21,
with output "version: 7.10.3" as expected. Also checked with a couple
of GuC firmware blobs and CSS-based HuC firmware blobs to guarantee
this doesn't regress.

v2: Add explicit ver_hi and ver_lo field to better visualize dump (Bala)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 tools/intel-gfx-fw-info | 85 +++++++++++++++++++++++++++++++----------
 1 file changed, 65 insertions(+), 20 deletions(-)

diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
index 77903bbb7..5eb733120 100755
--- a/tools/intel-gfx-fw-info
+++ b/tools/intel-gfx-fw-info
@@ -59,6 +59,25 @@ struct uc_css_header {
 	} rsvd;
 	u32 header_info;
 };
+
+#define HUC_GSC_VERSION_HI_DW		44
+#define   HUC_GSC_MAJOR_VER_HI_MASK	(0xFF << 0)
+#define   HUC_GSC_MINOR_VER_HI_MASK	(0xFF << 16)
+#define HUC_GSC_VERSION_LO_DW		45
+#define   HUC_GSC_PATCH_VER_LO_MASK	(0xFF << 0)
+
+// Add a fake definition for the GSC's header so this script can still
+// check the version
+
+struct uc_huc_gsc_header {
+	u32 rsvd[HUC_GSC_VERSION_HI_DW];
+	u32 ver_hi;
+	u32 ver_lo;
+};
+
+struct magic {
+	char data[4];
+};
 """
 
 logging.basicConfig(format="%(levelname)s: %(message)s")
@@ -83,26 +102,47 @@ def FIELD_GET(mask: int, value: int) -> int:
     return (value & mask) >> ffs(mask)
 
 
-def decode(fw) -> str:
-    data = []
+class Fw:
+    def __init__(self, fw):
+        self.fw = fw
+
+
+class FwCss(Fw):
+    def decode(self):
+        data = []
+
+        CSS_SW_VERSION_UC_MAJOR = 0xFF << 16
+        CSS_SW_VERSION_UC_MINOR = 0xFF << 8
+        CSS_SW_VERSION_UC_PATCH = 0xFF
+        major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, self.fw.sw_version)
+        minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, self.fw.sw_version)
+        patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, self.fw.sw_version)
+        data += [f"version: {major}.{minor}.{patch}"]
+
+        CSS_DATE_DAY = 0xFF
+        CSS_DATE_MONTH = 0xFF << 8
+        CSS_DATE_YEAR = 0xFFFF << 16
+        day = FIELD_GET(CSS_DATE_DAY, self.fw.date)
+        month = FIELD_GET(CSS_DATE_MONTH, self.fw.date)
+        year = FIELD_GET(CSS_DATE_YEAR, self.fw.date)
+        data += [f"date: {year:02x}-{month:02x}-{day:02x}"]
+
+        return data
+
 
-    CSS_SW_VERSION_UC_MAJOR = 0xFF << 16
-    CSS_SW_VERSION_UC_MINOR = 0xFF << 8
-    CSS_SW_VERSION_UC_PATCH = 0xFF
-    major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, fw.sw_version)
-    minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, fw.sw_version)
-    patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, fw.sw_version)
-    data += [f"version: {major}.{minor}.{patch}"]
+class FwGsc(Fw):
+    def decode(self):
+        data = []
 
-    CSS_DATE_DAY = 0xFF
-    CSS_DATE_MONTH = 0xFF << 8
-    CSS_DATE_YEAR = 0xFFFF << 16
-    day = FIELD_GET(CSS_DATE_DAY, fw.date)
-    month = FIELD_GET(CSS_DATE_MONTH, fw.date)
-    year = FIELD_GET(CSS_DATE_YEAR, fw.date)
-    data += [f"date: {year:02x}-{month:02x}-{day:02x}"]
+        HUC_GSC_MINOR_VER_HI_MASK = 0xFF << 16
+        HUC_GSC_MAJOR_VER_HI_MASK = 0xFF
+        HUC_GSC_PATCH_VER_LO_MASK = 0xFF
+        major = FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, self.fw.ver_hi)
+        minor = FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, self.fw.ver_hi)
+        patch = FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, self.fw.ver_lo)
+        data += [f"version: {major}.{minor}.{patch}"]
 
-    return data
+        return data
 
 
 def parse_args(argv: typing.List[str]) -> argparse.Namespace:
@@ -122,14 +162,19 @@ def main(argv: typing.List[str]) -> int:
 
     try:
         with open(args.filename, mode="rb") as f:
-            fw = cparser.uc_css_header(f)
+            magic = cparser.magic(f)
+            f.seek(0, 0)
+            if magic.data == b"$CPD":
+                fw = FwGsc(cparser.uc_huc_gsc_header(f))
+            else:
+                fw = FwCss(cparser.uc_css_header(f))
     except FileNotFoundError as e:
         logging.fatal(e)
         return 1
 
-    print(*decode(fw), sep="\n")
+    print(*fw.decode(), sep="\n")
     print("raw dump:", end="")
-    cstruct.dumpstruct(fw, color=sys.stdout.isatty())
+    cstruct.dumpstruct(fw.fw, color=sys.stdout.isatty())
 
     return 0
 
-- 
2.39.0
