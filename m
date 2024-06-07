Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB3BC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF0910EC73;
	Fri,  7 Jun 2024 13:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UvHCVgvg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467B910EC75
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768755; x=1749304755;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1QzbWDkVJVWw+1fS8N8lIcr8VGpF0U8J8FHXy+B8IXw=;
 b=UvHCVgvgXl+HlKgS7uJQYi7rdbwdG2OaakZKnB2qDF0JVQSDbLaBjhE/
 Uomi3zfHtRgK/8KdUaIE6RN501AwLSB/mlu5Fdi6Bbxn//ZjgrF7pXpY2
 MGcBNQHh90N543YSiAPNpgc8+2VQEZDvE6ZNq06VDxvhKtGfLZ7DJj/wP
 k546tOCvf3EqJ3NYGwV714F/THHtRzs9OXjdDLdpf4k1Lxq+6dt2Q4BSL
 Jmnf4wAdMGiPqi7TiIF+zIDepaeokkgEhjRTitTMzLg4l+QanPkY65R37
 v/Q1hmYpK6Cp2IPx5AEEZjwJBHMTiysmhTr7JyrKy4PHa0zGBKInZ8N2N w==;
X-CSE-ConnectionGUID: CelxWe0JRySdplfyrQr4yA==
X-CSE-MsgGUID: 5Dg20Al6TUWlQbXLJNv31g==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116834"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116834"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:59:15 -0700
X-CSE-ConnectionGUID: +izWDvicRIyeF49hUko2mQ==
X-CSE-MsgGUID: tCrqohk7QguLziQOUwS4Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38324018"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:59:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:59:12 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 26/27] tools/intel_vbt_decode: Decode block 253 (PRD
 Table)
Date: Fri,  7 Jun 2024 16:57:57 +0300
Message-ID: <20240607135758.31421-27-ville.syrjala@linux.intel.com>
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

Decode VBT block 253 (PRD Table). The layout changes in a funky
way so it looks some guesswork is needed to determine which
way to go :(

Example output from ADL:
Block 253 min size 2 less than block size 66
BDB block 253 (66 bytes, min 2 bytes) - PRD table:
        0000: fd 42 00 10 00 08 00 40  00 08 00 20 00 08 00 00
        0010: 00 40 00 00 00 20 00 00  00 00 00 00 00 00 00 00
        0020: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0030: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0040: 00 00 00 00 00

        Num entries: 16
        Entry #1:
                Primary display: LFP1 (0x8)
                Secondary display: EFP2 (0x40)
        ...
        Entry #16:
                Primary display: none (0x0)
                Secondary display: none (0x0)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 70 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 83c90083e1b9..9d9c96f1c264 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -422,6 +422,9 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_vswing_preemph);
 	case BDB_GENERIC_DTD:
 		return sizeof(struct bdb_generic_dtd);
+	case BDB_PRD_TABLE:
+		return max(sizeof(struct bdb_prd_table_old),
+			   sizeof(struct bdb_prd_table_new));
 	default:
 		return 0;
 	}
@@ -3494,6 +3497,68 @@ static void dump_generic_dtd(struct context *context,
 	}
 }
 
+static void dump_prd_table_old(struct context *context,
+			       const struct bdb_block *block)
+{
+	const struct bdb_prd_table_old *prd =
+		block_data(block) + block->size - sizeof(*prd);
+	const struct prd_entry_old *list = block_data(block);
+
+	for (int i = 0; i < prd->num_entries; i++) {
+		printf("\tEntry #%d:\n", i + 1);
+		printf("\t\tDisplays attached: %s (0x%x)\n",
+		       child_device_handle(context, list[i].displays_attached),
+		       list[i].displays_attached);
+		printf("\t\tDisplays in pipe A: %s (0x%x)\n",
+		       child_device_handle(context, list[i].display_in_pipe_a),
+		       list[i].display_in_pipe_a);
+		printf("\t\tDisplays in pipe B: %s (0x%x)\n",
+		       child_device_handle(context, list[i].display_in_pipe_b),
+		       list[i].display_in_pipe_b);
+	}
+
+	printf("\tNum entries: %d\n", prd->num_entries);
+}
+
+static void dump_prd_table_new(struct context *context,
+			       const struct bdb_block *block)
+{
+	const struct bdb_prd_table_new *prd = block_data(block);
+	const struct prd_entry_new *list = prd->list;
+
+	printf("\tNum entries: %d\n", prd->num_entries);
+
+	for (int i = 0; i < prd->num_entries; i++) {
+		printf("\tEntry #%d:\n", i + 1);
+		printf("\t\tPrimary display: %s (0x%x)\n",
+		       child_device_handle(context, list[i].primary_display),
+		       list[i].primary_display);
+		printf("\t\tSecondary display: %s (0x%x)\n",
+		       child_device_handle(context, list[i].secondary_display),
+		       list[i].secondary_display);
+	}
+}
+
+static void dump_prd_table(struct context *context,
+			   const struct bdb_block *block)
+{
+	const struct bdb_prd_table_old *old =
+		block_data(block) + block->size - sizeof(*old);
+	const struct bdb_prd_table_new *new =
+		block_data(block);
+	int num_entries_old = (block->size - sizeof(*old)) / sizeof(*old->list);
+	int num_entries_new = (block->size - sizeof(*new)) / sizeof(*new->list);
+
+	/*
+	 * The cutoff seems to be TGL+ w/ GOP rather than a specific
+	 * BDB version number. Just guess based on the actual data.
+	 */
+	if (num_entries_old == old->num_entries)
+		dump_prd_table_old(context, block);
+	else if (num_entries_new == new->num_entries)
+		dump_prd_table_new(context, block);
+}
+
 static int get_panel_type_pnpid(const struct context *context,
 				const char *edid_file)
 {
@@ -3852,6 +3917,11 @@ struct dumper dumpers[] = {
 		.name = "Generic DTD",
 		.dump = dump_generic_dtd,
 	},
+	{
+		.id = BDB_PRD_TABLE,
+		.name = "PRD table",
+		.dump = dump_prd_table,
+	},
 };
 
 static void hex_dump_block(const struct bdb_block *block)
-- 
2.44.2

