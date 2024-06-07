Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78D9C27C5F
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E0010EC6E;
	Fri,  7 Jun 2024 13:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjGbgCjr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8904510EC6E
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768701; x=1749304701;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4SRMKmsVlgUOQNORjtjHkGZz2NYfQ53dhjzjbTcZZ90=;
 b=MjGbgCjrYsXCM8tRPrUGitpFoMLsK01618dmHGsCZKqzVor2kUctIOP8
 YmjXmwME9X+fHMMuDepFCBBIDtUCkNWRUGFM34KrIIH7+JBOKMVbhhcCz
 F+F42uj5LEJHsD/HeYs3W4Px02GJfMOrMXDyeesRKX7UKg8qWFKm427BS
 hKUsRgJ5JRopNJ6uVLJa4aTxpGprCw7I3J3DOTvWopFlT8W9ffJZxeleJ
 vxHVGgxQn9pCkE5v/J8Mm4dtKmFeftshVTj2fh34SC5oye+QaQxlsaQzF
 Fl+A7wVUs6fFnqobXXd3HNnNmA1uh1LlE/xhpWMAU6Cj7fKD1z9IiE7Pw g==;
X-CSE-ConnectionGUID: LNt7dGpJRqqGAl2B5B/8Fg==
X-CSE-MsgGUID: yP0YYSEkS0mrjHzp4qv9pQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116778"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116778"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:21 -0700
X-CSE-ConnectionGUID: rGnVNXDhTPC/+iluY6Ep6g==
X-CSE-MsgGUID: 3cZTKnDsQKCTEaYT/whm9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323755"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:18 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/27] tools/intel_vbt_decode: Decode blocks 6, 7,
 8 (register tables)
Date: Fri,  7 Jun 2024 16:57:38 +0300
Message-ID: <20240607135758.31421-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
References: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Decode VBT blocks 6,7,8:
- Block 6 (Extended MMIO Register Table)
- Block 7 (IO Software Flag Table)
- Block 8 (MMIO SWF Register Table)

These just contain either 8bit or 32bit register/value pairs.

Example output from ALM:
BDB block 6 (333 bytes, min 3 bytes) - Extended MMIO registers:
        0000: 06 4d 01 fc ff 02 00 60  00 00 07 12 02 00 04 60
        0010: 00 00 06 14 03 00 10 60  00 00 8b 88 00 00 40 60
        0020: 00 00 07 12 02 00 44 60  00 00 07 12 02 00 14 60
        0030: 00 00 00 00 8b 80 48 60  00 00 07 12 02 00 4c 60
        0040: 00 00 07 12 02 00 18 60  00 00 00 00 8b 80 80 00
        0050: 07 00 00 00 00 00 80 01  07 00 00 00 00 00 80 11
        0060: 07 00 00 00 00 01 80 12  07 00 00 00 00 00 00 14
        0070: 07 00 00 00 00 80 00 00  06 00 7f 02 1f 03 04 00
        0080: 06 00 87 02 17 03 08 00  06 00 8f 02 ef 02 0c 00
        0090: 06 00 df 01 0c 02 10 00  06 00 e7 01 04 02 14 00
        00a0: 06 00 e9 01 eb 01 1c 00  06 00 df 01 7f 02 00 10
        00b0: 06 00 7f 02 1f 03 04 10  06 00 87 02 17 03 08 10
        00c0: 06 00 8f 02 ef 02 0c 10  06 00 df 01 0c 02 10 10
        00d0: 06 00 e7 01 04 02 14 10  06 00 e9 01 eb 01 1c 10
        00e0: 06 00 df 01 7f 02 d8 20  00 00 08 01 08 01 dc 20
        00f0: 00 00 08 01 00 00 cc 20  00 00 0c 00 0c 00 30 00
        0100: 07 00 5f 7e 01 00 08 00  07 00 00 00 00 80 08 10
        0110: 07 00 00 00 00 80 00 14  07 00 8e 00 20 00 00 11
        0120: 06 00 18 80 00 80 00 00  00 00 00 00 00 00 00 00
        0130: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0140: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff ff

        Table Id: 0xfffc
        Data access size: 0x02
                0x00006000: 0x00021207
                0x00006004: 0x00031406
                0x00006010: 0x0000888b
                ...
                0x00000000: 0x00000000
                0x00000000: 0x00000000
                0x00000000: 0x00000000
        Table end marker: 0xffff

BDB block 7 (7 bytes, min 3 bytes) - IO software flag:
        0000: 07 07 00 fe ff ce 18 00  ff ff

        Table Id: 0xfffe
        Data access size: 0xce
                0x18: 0x00
        Table end marker: 0xffff

BDB block 8 (61 bytes, min 3 bytes) - MMIO SWF register table:
        0000: 08 3d 00 fc ff 02 10 14  07 00 01 00 00 00 14 14
        0010: 07 00 01 00 00 00 18 14  07 00 55 01 00 00 1c 14
        0020: 07 00 00 00 03 03 20 14  07 00 00 00 00 00 24 14
        0030: 07 00 01 00 00 00 28 14  07 00 00 00 00 00 ff ff

        Table Id: 0xfffc
        Data access size: 0x02
                0x00071410: 0x00000001
                0x00071414: 0x00000001
                0x00071418: 0x00000155
                0x0007141c: 0x03030000
                0x00071420: 0x00000000
                0x00071424: 0x00000001
                0x00071428: 0x00000000
        Table end marker: 0xffff

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 53 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 829d4c560916..3997c548d041 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -323,6 +323,10 @@ static size_t block_min_size(const struct context *context, int section_id)
 	case BDB_GENERIC_MODE_TABLE:
 		return max(sizeof(struct bdb_generic_mode_table_alm),
 			   sizeof(struct bdb_generic_mode_table_mgm));
+	case BDB_EXT_MMIO_REGS:
+	case BDB_SWF_IO:
+	case BDB_SWF_MMIO:
+		return sizeof(struct bdb_reg_table);
 	case BDB_PSR:
 		return sizeof(struct bdb_psr);
 	case BDB_CHILD_DEVICE_TABLE:
@@ -1361,6 +1365,40 @@ static void dump_generic_mode_table(struct context *context,
 		dump_generic_mode_table_alm(block);
 }
 
+static void dump_reg_table(struct context *context,
+			   const struct bdb_block *block)
+{
+	const struct bdb_reg_table *t = block_data(block);
+	const void *data = (const void *)t + sizeof(*t);
+	const void *end = (const void *)t + block->size - 2;
+
+	printf("\tTable Id: 0x%0x\n", t->table_id);
+	printf("\tData access size: 0x%02x\n", t->data_access_size);
+
+	switch (t->data_access_size) {
+	case 0xce:
+		for (; data < end; data += 2 * 1) {
+			const uint8_t *entry = data;
+
+			printf("\t\t0x%02x: 0x%02x\n", entry[0], entry[1]);
+		}
+		break;
+	case 0x02:
+		for (; data < end; data += 2 * 4) {
+			const uint32_t *entry = data;
+
+			printf("\t\t0x%08x: 0x%08x\n", entry[0], entry[1]);
+		}
+		break;
+	default:
+		printf("\t\tUnknown data access size\n");
+		return;
+	}
+
+	printf("\tTable end marker: 0x%04x\n",
+	       *(const uint16_t *)end);
+}
+
 static void dump_legacy_child_devices(struct context *context,
 				      const struct bdb_block *block)
 {
@@ -2854,6 +2892,21 @@ struct dumper dumpers[] = {
 		.name = "Generic mode table",
 		.dump = dump_generic_mode_table,
 	},
+	{
+		.id = BDB_EXT_MMIO_REGS,
+		.name = "Extended MMIO registers",
+		.dump = dump_reg_table,
+	},
+	{
+		.id = BDB_SWF_IO,
+		.name = "IO software flag",
+		.dump = dump_reg_table,
+	},
+	{
+		.id = BDB_SWF_MMIO,
+		.name = "MMIO SWF register table",
+		.dump = dump_reg_table,
+	},
 	{
 		.id = BDB_PSR,
 		.min_bdb_version = 165,
-- 
2.44.2

