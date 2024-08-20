Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2C8C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 23:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C47110E4E6;
	Tue, 20 Aug 2024 23:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjn5DvRZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A1C10E4E6
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 23:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724196583; x=1755732583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KHtXzp8qgPt5lS7jOLzp+taJQRPWSsBuKtEJj7D54Po=;
 b=hjn5DvRZetH0WRncnyi6fUdxYSfEQ872RCLvb/zwZRvMgbV+m1pdpffp
 sGv2a20/b4AUDYd0+uzCbFodIZE9bUWRgkCcS1Lr45wLem5TtKHC9Q7ca
 w23dn/iUighvJ56YRN5AEyXe8OAOkGzHLglL4RD0UkOdKiPhz1Qx1lKj9
 VCh/FtpSJoR1ebUJ9odos6Xeh0s1YcRLyZkIORnnFe44Rvz1NSgmitn94
 ReSRqJeI93c0Gt+GFlatp340EGVY3tcymdyLvypx+dkh5Z7XqzG3VinfW
 bSpIqki+WuxLdNUhEx23vYEfSCcc7lPoGmKzdaLkQ2wW7iPK/y8CvBBVR w==;
X-CSE-ConnectionGUID: nr4PS/r1TUmkKRLIutFCGw==
X-CSE-MsgGUID: fFW+AliWRqyyBQZS8+LEiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22339747"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="22339747"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 16:29:42 -0700
X-CSE-ConnectionGUID: A8x20DP2SamYsyH4+E+a5Q==
X-CSE-MsgGUID: Y2lEjzqyQ5mX4nAeHVfYAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="60599575"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 16:29:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 5/6] tools/intel-gfx-fw-info: Add proper HuC parser
Date: Tue, 20 Aug 2024 16:29:27 -0700
Message-ID: <20240820232928.458248-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820232928.458248-1-lucas.demarchi@intel.com>
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel-gfx-fw-info | 106 ++++++++++++++++++++++++++++++++--------
 1 file changed, 85 insertions(+), 21 deletions(-)

diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
index 57d6f935b..cbabda913 100755
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
@@ -91,6 +140,9 @@ except:
     raise SystemExit(1)
 
 
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
 
@@ -222,6 +285,7 @@ def main(argv: typing.List[str]) -> int:
             fw = Fw.create(f)
             if not fw:
                 logging.fatal("Unknown firmware type in '{args.filename}'")
+                sys.exit(1)
 
             decoded_data = fw.decode()
             if args.checksum:
-- 
2.43.0

