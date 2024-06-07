Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D565C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FA210EC70;
	Fri,  7 Jun 2024 13:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+qk/bk4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F3310EC74
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768743; x=1749304743;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OCRXdCQnUA1DQnCqMHbgTx9/Ea9VK2FQ4QmLtnIHfYE=;
 b=I+qk/bk4EWoXQBQBLhKX9ox2dERUSK61Ho4QHxQtAPOBAWMfkQmqbJIQ
 p58ZcWVHN80v3hgxXAnTDtojG+/UtqEAQpuSkA7ekL98XKTmCP9xHkOP6
 dIbtY1yqKk4vG5qF+u4HshdvKkBGzuVrHXWUk1ygT5T/6CDx2iF78MhB1
 Xa0wDibkn4MI9eS+I4vpay7SjyvbwUjkfYhr6YWlaiPMTugv8KmA7m1kq
 OFt4FpAyys97T+/lXm5ooc1/nZfShLZf1rQ6BMJ5dR2DndQtH15giAPZ+
 wlT4CXWuCgCnyxK6BbVrpoIXgSz33YTCU9s//UcNwNOFbrN2Q6Arr5++P w==;
X-CSE-ConnectionGUID: gnmHCxnaSvuVwawHeNwopQ==
X-CSE-MsgGUID: CLaoN7ScRB6kRobYCE35mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116826"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116826"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:59:03 -0700
X-CSE-ConnectionGUID: bMFlhsBUQ6GfRp6dc1n/0A==
X-CSE-MsgGUID: A1t+k/17T+uS5ITbvifcXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323871"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:59:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:59:00 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 22/27] tools/intel_vbt_decode: Decode block 51 (Fixed
 Set Mode Table)
Date: Fri,  7 Jun 2024 16:57:53 +0300
Message-ID: <20240607135758.31421-23-ville.syrjala@linux.intel.com>
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

Decode VBT block block 51 (Fixed Set Mode Table). Seems useless.

Example output from ADL:
BDB block 51 (9 bytes, min 9 bytes) - Fixed set mode:
        0000: 33 09 00 00 00 00 00 00  00 00 00 00

        Enable: no (0x00)
        X Res: 0
        Y Res: 0

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index cc763d25f08b..c42585e4ab18 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -387,6 +387,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_edp_bfi);
 	case BDB_CHROMATICITY:
 		return sizeof(struct bdb_chromaticity);
+	case BDB_FIXED_SET_MODE:
+		return sizeof(struct bdb_fixed_set_mode);
 	case BDB_MIPI_CONFIG:
 		return sizeof(struct bdb_mipi_config);
 	case BDB_MIPI_SEQUENCE:
@@ -2787,6 +2789,16 @@ static void dump_chromaticity(struct context *context,
 	}
 }
 
+static void dump_fixed_set_mode(struct context *context,
+				const struct bdb_block *block)
+{
+	const struct bdb_fixed_set_mode *f = block_data(block);
+
+	printf("\tEnable: %s (0x%02x)\n", YESNO(f->enable), f->enable);
+	printf("\tX Res: %d\n", f->x_res);
+	printf("\tY Res: %d\n", f->y_res);
+}
+
 static void dump_mipi_config(struct context *context,
 			     const struct bdb_block *block)
 {
@@ -3686,6 +3698,11 @@ struct dumper dumpers[] = {
 		.name = "Chromaticity for narrow gamut panel",
 		.dump = dump_chromaticity,
 	},
+	{
+		.id = BDB_FIXED_SET_MODE,
+		.name = "Fixed set mode",
+		.dump = dump_fixed_set_mode,
+	},
 	{
 		.id = BDB_MIPI_CONFIG,
 		.name = "MIPI configuration block",
-- 
2.44.2

