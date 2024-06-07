Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABD6C27C5F
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9A810EC76;
	Fri,  7 Jun 2024 13:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqR6Q78t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D395510EC71
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768710; x=1749304710;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MVVQNalVErS2nM9w4CMABsKmJe9Tvg5had/MEW6J0cg=;
 b=OqR6Q78toAry/xALvtmy37R5BYqg4R8Z5RGlCI3kEr6YH5wqgh4NuxLT
 qWJ6V0HOL1ZKBxktCLe648jS0/DhMtck6DTyFQrtAL6egNfvyldVrxQ6m
 4XRR92o2/+Q8394TkA58CXXCwfZFUE+nvBm73ArE9Q4xLOFhMKadDC93l
 KP3op2/tHLIuBZjWr+r9GXCssBWfa2ZYZtUbDfJ4YHBjRjNIM7C0pH7/W
 fVMHRwCrSo4sg0jGpy6mQP3xTV1Jd4qULQ9nL4Ux+5yWP7UI75LmJvdoI
 ksvPX4w+RYAXNybXAZzrmZksEPM34sr70+gpXwaMKNVwnbJ8SQ97AU1B5 w==;
X-CSE-ConnectionGUID: TLiGiFLRTFG96CgPNqfhvQ==
X-CSE-MsgGUID: ruAADkHCRN+cXMzVcDAmcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116782"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116782"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:29 -0700
X-CSE-ConnectionGUID: RVIZggoeRlC6mm3XN/pGog==
X-CSE-MsgGUID: JLUQWVIPQwOGKsnl7lfMdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323786"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:27 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/27] tools/intel_vbt_decode: Decode block 15 (Dot
 Clock Override Table) and block 9 (ALM only)
Date: Fri,  7 Jun 2024 16:57:41 +0300
Message-ID: <20240607135758.31421-11-ville.syrjala@linux.intel.com>
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

Decode VBT block 15 (Dot Clock Override Table) and block 9 (ALM only).
Entirely reverse engineered by intuition as I couldn't find any VBIOS
sources or spec version that has this.

The gen2 decoding looks solid given I had both ALM and MGM with these
tables. The gen3+ stuff can't be 100% sure about as all my gen3+ VBTs
have this block just filled with zeroes.

Block 9 example output from ALM:
BDB block 9 (264 bytes, min 100 bytes) - Dot clock override (ALM):
        0000: 09 08 01 57 62 00 00 02  12 07 8b a0 6e 00 00 03
        0010: 14 06 88 0c 7b 00 00 02  10 0d 88 ac 8a 00 00 03
        0020: 16 0b 87 a0 8c 00 00 02  10 04 86 40 9c 00 00 04
        0030: 18 08 85 44 a2 00 00 02  10 05 85 64 af 00 00 03
        0040: 16 09 85 80 bb 00 00 02  10 04 84 5c c1 00 00 02
        0050: 10 07 84 50 c3 00 00 02  10 08 84 ba db 00 00 03
        0060: 14 05 83 e8 fd 00 00 04  16 08 82 f8 24 01 00 02
        0070: 10 08 82 9e 33 01 00 02  10 0d 82 24 71 01 00 03
        0080: 14 06 81 e0 a5 01 00 02  12 06 81 58 0f 02 00 04
        0090: 16 0d a0 14 44 02 00 02  10 07 a0 3c 67 02 00 02
        00a0: 10 0d a0 d0 78 02 00 02  12 06 a0 8c ad 02 00 03
        00b0: 12 08 01 f0 c6 02 00 03  12 0c 01 48 e2 02 00 03
        00c0: 14 06 01 18 ea 02 00 03  14 07 01 04 17 03 00 02
        00d0: 10 09 01 ce 1f 03 00 03  16 06 01 8a 54 03 00 02
        00e0: 12 07 01 7c 80 03 00 02  12 0d 01 10 92 03 00 04
        00f0: 14 05 20 88 fb 03 00 03  12 07 20 00 65 04 00 02
        0100: 10 04 20 28 88 04 00 02  10 07 20

                Entry #1:
                        Dotclock: 25175 kHz
                        Calculated dotclock: 25154 kHz
                        N: 4
                        M1: 20
                        M2: 9
                        M: 109
                        P1: 13
                        P2: 4
                        P: 52
                ...
                Entry #33:
                        Dotclock: 297000 kHz
                        Calculated dotclock: 297000 kHz
                        N: 4
                        M1: 18
                        M2: 9
                        M: 99
                        P1: 2
                        P2: 2
                        P: 4

Block 15 example output from MGM:
BDB block 15 (124 bytes, min 2 bytes) - Dot clock override:
        0000: 0f 7c 00 08 0a 00 00 00  00 00 00 00 00 00 00 00
        0010: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0020: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0030: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0040: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0050: 00 00 00 00 00 08 0a 38  c7 00 00 02 14 07 02 00
        0060: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0070: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00

        Normal:
                Row size: 8
                Num rows: 10
                Entry #1:
                        Dotclock: 0 kHz
                ...
                Entry #10:
                        Dotclock: 0 kHz
        LVDS:
                Row size: 8
                Num rows: 10
                Entry #1:
                        Dotclock: 51000 kHz
                        Calculated dotclock: 51000 kHz
                        N: 4
                        M1: 22
                        M2: 9
                        M: 119
                        P1: 2
                        P2: 14
                        P: 28
                ...
                Entry #5:
                        Dotclock: 0 kHz

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 144 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 142 insertions(+), 2 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index fd0753eb11d7..5c334c902966 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -327,8 +327,9 @@ static size_t block_min_size(const struct context *context, int section_id)
 	case BDB_SWF_IO:
 	case BDB_SWF_MMIO:
 		return sizeof(struct bdb_reg_table);
-	case BDB_PSR:
-		return sizeof(struct bdb_psr);
+	case BDB_PSR: /* nee BDB_DOT_CLOCK_OVERRIDE_ALM */
+		return max(sizeof(struct bdb_psr),
+			   sizeof(struct bdb_dot_clock_override_alm));
 	case BDB_MODE_REMOVAL_TABLE:
 		return sizeof(struct bdb_mode_removal);
 	case BDB_CHILD_DEVICE_TABLE:
@@ -337,6 +338,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_driver_features);
 	case BDB_DRIVER_PERSISTENCE:
 		return sizeof(struct bdb_driver_persistence);
+	case BDB_DOT_CLOCK_OVERRIDE:
+		return sizeof(struct bdb_dot_clock_override);
 	case BDB_SDVO_LVDS_OPTIONS:
 		return sizeof(struct bdb_sdvo_lvds_options);
 	case BDB_SDVO_LVDS_DTD:
@@ -1900,6 +1903,132 @@ static void dump_driver_persistence(struct context *context,
 	printf("\tPersistent max config: %d\n", persistence->persistent_max_config);
 }
 
+static void dump_dot_clock_override_entry_gen2(const struct dot_clock_override_entry_gen2 *t,
+					       bool is_lvds)
+{
+	int ref = 48000;
+	int m1 = t->m1 + 2;
+	int m2 = t->m2 + 2;
+	int m = 5 * m1 + m2;
+	int n = t->n + 2;
+	int p1, p2, p;
+
+	if (is_lvds) {
+		p1 = igt_fls((unsigned int)t->p1);
+		p2 = 14;
+	} else {
+		p1 = t->p1_div_by_2 ? 2 : (t->p1 + 2);
+		p2 = t->p2_div_by_4 ? 4 : 2;
+	}
+
+	p = p1 * p2;
+
+	printf("\t\t\tDotclock: %d kHz\n", t->dotclock);
+
+	if (!t->dotclock)
+		return;
+
+	printf("\t\t\tCalculated dotclock: %d kHz\n",
+	       n && p ? DIV_ROUND_CLOSEST(ref * m, n * p) : 0);
+	printf("\t\t\tN: %d\n", n);
+	printf("\t\t\tM1: %d\n", m1);
+	printf("\t\t\tM2: %d\n", m2);
+	printf("\t\t\tM: %d\n", m);
+	printf("\t\t\tP1: %d\n", p1);
+	printf("\t\t\tP2: %d\n", p2);
+	printf("\t\t\tP: %d\n", p);
+}
+
+static void dump_dot_clock_override_alm(struct context *context,
+					const struct bdb_block *block)
+{
+	const struct bdb_dot_clock_override_alm *b = block_data(block);
+	int count = block->size / sizeof(b->t[0]);
+
+	for (int i = 0; i < count; i++) {
+		const struct dot_clock_override_entry_gen2 *t = &b->t[i];
+
+		printf("\t\tEntry #%d:\n", i + 1);
+		dump_dot_clock_override_entry_gen2(t, false);
+	}
+}
+
+static void dump_dot_clock_override_entry_gen3(const struct dot_clock_override_entry_gen3 *t)
+{
+	int ref = 96000;
+	int m1 = t->m1 + 2;
+	int m2 = t->m2 + 2;
+	int m = 5 * m1 + m2;
+	int n = t->n + 2;
+	int p1 = t->p1;
+	int p2 = t->p2;
+	int p = p1 * p2;
+
+	printf("\t\t\tDotclock: %d kHz\n", t->dotclock);
+
+	if (!t->dotclock)
+		return;
+
+	printf("\t\t\tCalculated dotclock: %d kHz\n",
+	       n && p ? DIV_ROUND_CLOSEST(ref * m, n * p) : 0);
+	printf("\t\t\tN: %d\n", n);
+	printf("\t\t\tM1: %d\n", m1);
+	printf("\t\t\tM2: %d\n", m2);
+	printf("\t\t\tP1: %d\n", p1);
+	printf("\t\t\tP2: %d\n", p2);
+}
+
+static void _dump_dot_clock_override(const struct bdb_dot_clock_override *d,
+				     int count, bool is_lvds)
+{
+	printf("\t\tRow size: %d\n", d->row_size);
+	printf("\t\tNum rows: %d\n", d->num_rows);
+
+	for (int i = 0; i < count; i++) {
+		const struct dot_clock_override_entry_gen2 *t_gen2 =
+			(const void *)d->table + i * d->row_size;
+		const struct dot_clock_override_entry_gen3 *t_gen3 =
+			(const void *)d->table + i * d->row_size;
+
+		printf("\t\tEntry #%d:\n", i + 1);
+
+		switch (d->row_size) {
+		case 9:
+			dump_dot_clock_override_entry_gen3(t_gen3);
+			break;
+		case 8:
+			dump_dot_clock_override_entry_gen2(t_gen2, is_lvds);
+			break;
+		default:
+			printf("\t\t\tDotclock: %d kHz\n", t_gen3->dotclock);
+			break;
+		}
+	}
+}
+
+static void dump_dot_clock_override(struct context *context,
+				    const struct bdb_block *block)
+{
+	const struct bdb_dot_clock_override *d = block_data(block);
+	const void *start = d->table;
+	const void *end = (const void *)d + block->size;
+	int count;
+
+	count = min((int)(end - start) / d->row_size, (int)d->num_rows);
+	printf("\tNormal:\n");
+	_dump_dot_clock_override(d, count, false);
+
+	d = (const void *)d->table + count * d->row_size;
+	if ((const void *)d + sizeof(*d) >= end)
+		return;
+
+	start = d->table;
+
+	count = min((int)(end - start) / d->row_size, (int)d->num_rows);
+	printf("\tLVDS:\n");
+	_dump_dot_clock_override(d, count, true);
+}
+
 static void dump_edp(struct context *context,
 		     const struct bdb_block *block)
 {
@@ -2966,6 +3095,12 @@ struct dumper dumpers[] = {
 		.name = "MMIO SWF register table",
 		.dump = dump_reg_table,
 	},
+	{
+		.id = BDB_DOT_CLOCK_OVERRIDE_ALM,
+		.max_bdb_version = 164,
+		.name = "Dot clock override (ALM)",
+		.dump = dump_dot_clock_override_alm,
+	},
 	{
 		.id = BDB_PSR,
 		.min_bdb_version = 165,
@@ -2992,6 +3127,11 @@ struct dumper dumpers[] = {
 		.name = "Driver persistent algorithm",
 		.dump = dump_driver_persistence,
 	},
+	{
+		.id = BDB_DOT_CLOCK_OVERRIDE,
+		.name = "Dot clock override",
+		.dump = dump_dot_clock_override,
+	},
 	{
 		.id = BDB_SDVO_LVDS_OPTIONS,
 		.name = "SDVO LVDS options block",
-- 
2.44.2

