Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A5AC5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 19:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3890410E359;
	Mon, 19 Aug 2024 19:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSDKoKL1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD9C10E355
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 19:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724097374; x=1755633374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OuZjUGMZto4uxyxEUIRQPizN9R2VfkK+SEP2I3Loqzo=;
 b=JSDKoKL1txL4KHQ+dg4ZYZF71JPPyhlUonQUPcNTVGn8muzog2kqcOKN
 DYb+lVGwBT+o21x9yfCkjZMMhz5lIAnFS4CdLbkK/73BJVnrRpxmBzmtG
 VwRbguRUZDVIDuQexxs+tOvs9wuJw9d5ro45j7PJWSRuFOAUPj6QWX26b
 6VxfRWBFQL4MRX+JCCTd2cwwdLIWIm8WRy0F3rXIhTBD9EgdnMiMsu+HC
 N9C6RpMA2Pwf8/MlzDEZZm0UaKxq9zMtcCQ5DW8hLBAX0p2xMeB1BKLp2
 3YoBXQfDPhdLCzZk17ppk4Ki7CEy5UWI33GvLlq6aUTJzv+Dtwr52U3BS w==;
X-CSE-ConnectionGUID: 2IGBVmL/R7KwdhpptVm7iQ==
X-CSE-MsgGUID: bMilI3fDQFO/WBGhUlNbtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22251049"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="22251049"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 12:56:14 -0700
X-CSE-ConnectionGUID: QdmEIWARQBypzKoI0f0lmQ==
X-CSE-MsgGUID: AEed5RKlQXiR+gjmnXJC9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="60315555"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 12:56:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 4/4] tools/intel-gfx-fw-info: Add proper HuC parser
Date: Mon, 19 Aug 2024 12:56:00 -0700
Message-ID: <20240819195600.242767-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819195600.242767-1-lucas.demarchi@intel.com>
References: <20240819195600.242767-1-lucas.demarchi@intel.com>
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
index 85f99b75a..d34c51906 100755
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
 
 
+GSC_CPD_ENTRY_OFFSET_MASK = 0x1ffffff
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
+        for i in range(self.fw.num_of_entries):
+            entry = self.cparser.gsc_cpd_entry(self.f)
+            s = ''.join(map(chr, entry.name)).rstrip('\x00')
+            if s == 'HUCP.man':
+                offset = entry.offset & GSC_CPD_ENTRY_OFFSET_MASK
+                self.f.seek(offset, 0)
+                break;
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
 
@@ -220,6 +283,7 @@ def main(argv: typing.List[str]) -> int:
             fw = Fw.create(f)
             if not fw:
                 logging.fatal("Unknown firmware type in '{args.filename}'")
+                sys.exit(1)
 
             decoded_data = fw.decode()
             if args.checksum:
-- 
2.43.0

