Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB966C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 15:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3209A10E0DF;
	Mon, 26 Aug 2024 15:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+ycs2CQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16AE10E22B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 15:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724686021; x=1756222021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gr6aFqfrmxOLLaG4tY5z2F5+/2hlLgihRJ6v/w/JNpw=;
 b=O+ycs2CQxYuX5+N0Wsd10Ssd0qN7RaZxb69T6G3X608e/ea9G8FeNk82
 SzXb9r6A/4m+i4WOaPus6cNuvDB/rvbs3Bf56jOwOiAWEM5nw+AvYGfmn
 EOt7x2PMlRkJN1gLxuWwYekNc7jcYn0On7ERjeNdM39sKcXshieFEsWZo
 0FpBpsR/5OD9qDCaEm9Jg79ByCKP6TFZsuWT2hWH1gJLTf9EFn2e1Ec2G
 XKAabhHwcylLjSjf3wz0R57AR2PpFzith4fwddka54WFtihGfsCZ2gGYH
 mxBtm7KWhGUUUte+v/jcylFCB+gxj3DkJ6jaSOg1sOaT3QxUPOBloUEOe Q==;
X-CSE-ConnectionGUID: 44U/IFp5Sa6rDQ7W9RuOSQ==
X-CSE-MsgGUID: ta4D6ZrJSy6OvwodSQ/adg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26013841"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="26013841"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:27:00 -0700
X-CSE-ConnectionGUID: JEmKS9HWQoWx09y5QCSX0g==
X-CSE-MsgGUID: KRZt8X57RfeDyYCzXyAC0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="63074308"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:26:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 6/6] tools/intel-gfx-fw-info: Add proper HuC parser
Date: Mon, 26 Aug 2024 08:26:56 -0700
Message-ID: <20240826152656.1306490-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826152656.1306490-1-lucas.demarchi@intel.com>
References: <20240826152656.1306490-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Initial implementation to parse HuC's header was lazy and assumed the
manifest was the first entry in the cpd, which is not necessarily true.
Add proper parsing for the headers that matches the one documented
in https://docs.kernel.org/gpu/xe/xe_firmware.html#firmware-layout
as "GSC-based HuC firmware layout ".

Before (wrong):
	$ intel-gfx-fw-info -c /lib/firmware/xe/lnl_huc.bin
	header-type: GSC
	version: 13.91.1
	checksum: 320e765cbe42b0f5f95333794a6a00a4e67246d6ad8393b59b64efdc3506cfe9

After (fixed):
	$ intel-gfx-fw-info -c /lib/firmware/xe/lnl_huc.bin
	header-type: GSC
	version: 9.4.13
	checksum: 320e765cbe42b0f5f95333794a6a00a4e67246d6ad8393b59b64efdc3506cfe9

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel-gfx-fw-info | 105 ++++++++++++++++++++++++++++++++--------
 1 file changed, 84 insertions(+), 21 deletions(-)

diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
index fb98f1bcc..c3b98ebc1 100755
--- a/tools/intel-gfx-fw-info
+++ b/tools/intel-gfx-fw-info
@@ -60,19 +60,68 @@ struct uc_css_header {
 	u32 header_info;
 };
 
-#define HUC_GSC_VERSION_HI_DW		44
-#define   HUC_GSC_MAJOR_VER_HI_MASK	(0xFF << 0)
-#define   HUC_GSC_MINOR_VER_HI_MASK	(0xFF << 16)
-#define HUC_GSC_VERSION_LO_DW		45
-#define   HUC_GSC_PATCH_VER_LO_MASK	(0xFF << 0)
-
-// Add a fake definition for the GSC's header so this script can still
-// check the version
-
-struct uc_huc_gsc_header {
-	u32 rsvd[HUC_GSC_VERSION_HI_DW];
-	u32 ver_hi;
-	u32 ver_lo;
+/* Code partition directory (CPD) structures */
+#define GSC_CPD_HEADER_MARKER 0x44504324
+struct gsc_cpd_header_v2 {
+	u32 header_marker;
+
+	u32 num_of_entries;
+	u8 header_version;
+	u8 entry_version;
+	u8 header_length; /* in bytes */
+	u8 flags;
+	u32 partition_name;
+	u32 crc32;
+};
+
+// Added as python code
+// #define GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
+
+struct gsc_version {
+	u16 major;
+	u16 minor;
+	u16 hotfix;
+	u16 build;
+};
+
+struct gsc_cpd_entry {
+	u8 name[12];
+
+	/*
+	 * Bits 0-24: offset from the beginning of the code partition
+	 * Bit 25: huffman compressed
+	 * Bits 26-31: reserved
+	 */
+	u32 offset;
+
+	/*
+	 * Module/Item length, in bytes. For Huffman-compressed modules, this
+	 * refers to the uncompressed size. For software-compressed modules,
+	 * this refers to the compressed size.
+	 */
+	u32 length;
+
+	u8 reserved[4];
+};
+
+struct gsc_manifest_header {
+	u32 header_type; /* 0x4 for manifest type */
+	u32 header_length; /* in dwords */
+	u32 header_version;
+	u32 flags;
+	u32 vendor;
+	u32 date;
+	u32 size; /* In dwords, size of entire manifest (header + extensions) */
+	u32 header_id;
+	u32 internal_data;
+	struct gsc_version fw_version;
+	u32 security_version;
+	struct gsc_version meu_kit_version;
+	u32 meu_manifest_version;
+	u8 general_data[4];
+	u8 reserved3[56];
+	u32 modulus_size; /* in dwords */
+	u32 exponent_size; /* in dwords */
 };
 
 struct magic {
@@ -91,6 +140,9 @@ except ImportError as e:
     raise SystemExit(1) from e
 
 
+GSC_CPD_ENTRY_OFFSET_MASK = 0x1FFFFFF
+
+
 def ffs(x: int) -> int:
     """Returns the index, counting from 0, of the
     least significant set bit in `x`.
@@ -181,17 +233,28 @@ class FwGsc(Fw):
 
     def decode(self):
         self.f.seek(0, 0)
-        self.fw = self.cparser.uc_huc_gsc_header(self.f)
+        self.fw = self.cparser.gsc_cpd_header_v2(self.f)
 
         data = ["header-type: GSC"]
 
-        HUC_GSC_MINOR_VER_HI_MASK = 0xFF << 16
-        HUC_GSC_MAJOR_VER_HI_MASK = 0xFF
-        HUC_GSC_PATCH_VER_LO_MASK = 0xFF
-        major = FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, self.fw.ver_hi)
-        minor = FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, self.fw.ver_hi)
-        patch = FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, self.fw.ver_lo)
-        data += [f"version: {major}.{minor}.{patch}"]
+        # find manifest entry
+        self.f.seek(self.fw.header_length, 0)
+        for _ in range(self.fw.num_of_entries):
+            entry = self.cparser.gsc_cpd_entry(self.f)
+            s = "".join(map(chr, entry.name)).rstrip("\x00")
+            if s == "HUCP.man":
+                offset = entry.offset & GSC_CPD_ENTRY_OFFSET_MASK
+                self.f.seek(offset, 0)
+                break
+        else:
+            logging.fatal("Unknown/corrupted firmware - no manifest available")
+            sys.exit(1)
+
+        self.fw = self.cparser.gsc_manifest_header(self.f)
+        major = self.fw.fw_version.major
+        minor = self.fw.fw_version.minor
+        hotfix = self.fw.fw_version.hotfix
+        data += [f"version: {major}.{minor}.{hotfix}"]
 
         return data
 
-- 
2.43.0

