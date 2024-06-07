Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C7FC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF90C10EC74;
	Fri,  7 Jun 2024 13:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rq/fxeDQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F4A10EC74
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768696; x=1749304696;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1w+Lpy1cDJoQ7GSU8M92noEWoJHFTWZ25bw0OCYPZMg=;
 b=Rq/fxeDQV+tegLbMAYNKCtisvtZlU4Qi8dIPveN5UXwVP7Cqh90mQEB+
 KnFzTPKXwhAKC4JxWJHhqDqmPuLNeTdvv8JKoehXAG5Osera+mW4MpZpo
 +ZdaCr39cn9DCJwPhYp4luafpfZ9YBOy+qBTwFk8NGYvNfzpDGkPzBxyK
 jAk6NG8dQJQ66FszD4urRi7s2MXUZJPhyaNkHzRxIxgj2ieJhrF6IxczG
 qNZ1BZpHa80jTLlr3bNmn7y4eai1cUokcIaZZjwYcgN2WuyPHVlQpiEfo
 hE+DDByuah8V9eZo3Rz6wcIIv3d9rwzUaSjKHNJXCMNGin0VyZ/50XjL1 g==;
X-CSE-ConnectionGUID: yQLLHxb+Ro6yQ5trW5HrXg==
X-CSE-MsgGUID: SDMTbU7SQeGLyaX+aFcuug==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116776"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116776"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:16 -0700
X-CSE-ConnectionGUID: 3pDcCgI9QWKXtvk4BoYefQ==
X-CSE-MsgGUID: /vg2tHbvRRyDrZREs6udyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323748"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:13 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/27] tools/intel_vbt_decode: Decode block 4 (Mode
 Support List)
Date: Fri,  7 Jun 2024 16:57:36 +0300
Message-ID: <20240607135758.31421-6-ville.syrjala@linux.intel.com>
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

Decode VBT block 4 (Mode Support List). The contents are just
some kind of list of "Intel mode numbers" (whateer those are).

Example output:
BDB block 4 (28 bytes, min 2 bytes) - Mode support list:
        0000: 04 1c 00 30 32 34 36 38  3a 3c 40 42 44 46 48 4a
        0010: 4c 50 52 54 56 58 5a 5c  80 81 82 83 84 1a 00

        Intel mode numbers:
                0x30
                ...
                0x84
        Mode list length: 26

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 4281bd7e520e..845f26828c44 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -318,6 +318,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_general_definitions);
 	case BDB_DISPLAY_TOGGLE:
 		return sizeof(struct bdb_display_toggle);
+	case BDB_MODE_SUPPORT_LIST:
+		return sizeof(struct bdb_mode_support_list);
 	case BDB_PSR:
 		return sizeof(struct bdb_psr);
 	case BDB_CHILD_DEVICE_TABLE:
@@ -1265,6 +1267,20 @@ static void dump_display_toggle(struct context *context,
 		       t->list[i]);
 }
 
+static void dump_mode_support_list(struct context *context,
+				   const struct bdb_block *block)
+{
+	const struct bdb_mode_support_list *l =
+		block_data(block) + block->size - sizeof(*l);
+	const uint8_t *mode_number = block_data(block);
+
+	printf("\tIntel mode numbers:\n");
+	for (int i = 0 ; i < l->mode_list_length; i++)
+		printf("\t\t0x%02x\n", mode_number[i]);
+
+	printf("\tMode list length: %d\n", l->mode_list_length);
+}
+
 static void dump_legacy_child_devices(struct context *context,
 				      const struct bdb_block *block)
 {
@@ -2748,6 +2764,11 @@ struct dumper dumpers[] = {
 		.name = "Display toggle option block",
 		.dump = dump_display_toggle,
 	},
+	{
+		.id = BDB_MODE_SUPPORT_LIST,
+		.name = "Mode support list",
+		.dump = dump_mode_support_list,
+	},
 	{
 		.id = BDB_PSR,
 		.min_bdb_version = 165,
-- 
2.44.2

