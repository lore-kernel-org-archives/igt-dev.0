Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3002C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8537E10EC73;
	Fri,  7 Jun 2024 13:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erxeYZjM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB5710EC73
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768718; x=1749304718;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EqmtuDVRtMJyhx2cHLCka2hh2oX4wVZNn5+JEGQn210=;
 b=erxeYZjMbKibf4AMlab7d36TJUO6XfAVRKnkoDXhmmsqsN6evj2udz8q
 kcvzIaWun+S3TOeN0ivneSZwWIuISUnIjaAGAK8qB8U2X9RQf8NgrZTnx
 YPKblWd8ruqVi8r1RE76buCjrHwspBGUaefpsn9LPNDmfSx440fmN+MDk
 gLVgoq8EES2EtG32AUpbsxCgHZX0fUDSf+mSJa+s/3tLwFrDPktJ9Gr55
 zP8Ydbff5obLMCoVmnpEXRHfTq4FT5+4oYu2xnyskitQ+dJTY0fJRSU85
 xBsp0i+7NbfO4JP3XTZ3qN3H3DiHOUDnlShUNFFBdZeg3JhaQ091DC68B A==;
X-CSE-ConnectionGUID: a7WpTZW7Rs63PMGnXSnsoQ==
X-CSE-MsgGUID: ypeGBpFqSpyLmgn4W8HOIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116791"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116791"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:38 -0700
X-CSE-ConnectionGUID: J9k9MSKLSLOFGlXeuKrp9w==
X-CSE-MsgGUID: irE8Vg9WTUa6ty/esIqHRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323804"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:35 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 13/27] tools/intel_vbt_decode: Decode block 18 (Driver
 Rotation)
Date: Fri,  7 Jun 2024 16:57:44 +0300
Message-ID: <20240607135758.31421-14-ville.syrjala@linux.intel.com>
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

Decode VBT block 18 (Driver Rotation). There's actually only one
bit in there with rest being effectively padding (albeit actually
named for some reason).

Example output from HSW:
BDB block 18 (12 bytes, min 12 bytes) - Driver rotation:
        0000: 12 0c 00 01 00 00 00 00  00 00 00 00 00 00 00

        Rotation enable: yes (0x1)
        Rotation flags 1: 0x00
        Rotation flags 2: 0x0000
        Rotation flags 3: 0x00000000
        Rotation flags 4: 0x00000000

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 38a7343b0c3b..a76eae94f037 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -342,6 +342,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_dot_clock_override);
 	case BDB_DISPLAY_SELECT_OLD:
 		return sizeof(struct bdb_display_select_old);
+	case BDB_DRIVER_ROTATION:
+		return sizeof(struct bdb_driver_rotation);
 	case BDB_DISPLAY_REMOVE_OLD:
 		return sizeof(struct bdb_display_remove_old);
 	case BDB_SDVO_LVDS_OPTIONS:
@@ -2211,6 +2213,20 @@ static void dump_display_remove_hsw(struct context *context,
 	}
 }
 
+static void dump_driver_rotation(struct context *context,
+				 const struct bdb_block *block)
+{
+	const struct bdb_driver_rotation *rot = block_data(block);
+
+	printf("\tRotation enable: %s (0x%x)\n", YESNO(rot->rotation_enable),
+	       rot->rotation_enable);
+
+	printf("\tRotation flags 1: 0x%02x\n", rot->rotation_flags_1);
+	printf("\tRotation flags 2: 0x%04x\n", rot->rotation_flags_2);
+	printf("\tRotation flags 3: 0x%08x\n", rot->rotation_flags_3);
+	printf("\tRotation flags 4: 0x%08x\n", rot->rotation_flags_4);
+}
+
 static void dump_edp(struct context *context,
 		     const struct bdb_block *block)
 {
@@ -3319,6 +3335,11 @@ struct dumper dumpers[] = {
 		.name = "Toggle list block (pre-IVB)",
 		.dump = dump_display_select_old,
 	},
+	{
+		.id = BDB_DRIVER_ROTATION,
+		.name = "Driver rotation",
+		.dump = dump_driver_rotation,
+	},
 	{
 		.id = BDB_DISPLAY_REMOVE_OLD,
 		.name = "Display remove (pre-IVB)",
-- 
2.44.2

