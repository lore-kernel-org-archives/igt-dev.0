Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADC9C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E9810EC6E;
	Fri,  7 Jun 2024 13:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEEMZkHy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEA510EC6E
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768721; x=1749304721;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yEsW9rXy8QVs7zweOKoZ3rg6+uK2iwVJJcaEVXEGzXc=;
 b=KEEMZkHyWKUVqU1feOkrTI7Es7eqVG89Sb2b7HatB1g0wLhskLiFv1Dy
 9/o0jdux5l1vvCeJUb9kJm1JFuk9auYjkh7jfQf4e9F7bAsMivGLFQouQ
 UMD3+2jn5f9SQ8NHKCFtqMemlgLkVslWjEpM2RbLgIm6C+GKdgeJwpPL9
 7WhBfF1/Ng748qNHKeO0TUV3LERrph6pLfS0Nv4LxrrRDXwMg1z9duRSg
 Imcevdbu5wxqrItjISgYYuZndc6hdI7KhlC3TOZ0RpalR7vUk0wjqPcnb
 lTuPD9luB1EfvAm1u4Akn1WHn+VRk1d4lP7YfBa27SCDsL2GG6ja/ujeJ A==;
X-CSE-ConnectionGUID: ADH260xeRkuQkRX3hfZ90Q==
X-CSE-MsgGUID: fB0QVXEuTXOpm9wyU5d3EQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116793"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116793"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:41 -0700
X-CSE-ConnectionGUID: TEBsm+IFQK6SmzglAxeAcg==
X-CSE-MsgGUID: 9ahN21pOQI6r+w/vo9fJhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323810"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:38 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 14/27] tools/intel_vbt_decode: Decode block 20 (OEM
 Customizable Modes)
Date: Fri,  7 Jun 2024 16:57:45 +0300
Message-ID: <20240607135758.31421-15-ville.syrjala@linux.intel.com>
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

Decode VBT block 20 (OEM Customizable Modes). Just some list
of modes, which we probably don't care about.

Example output from ADL:
BDB block 20 (170 bytes, min 2 bytes) - OEM customizable modes:
        0000: 14 aa 00 06 1c 04 00 56  05 00 03 00 3c 00 00 00
        0010: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 ff
        0020: 01 04 00 56 05 56 03 00  3c 00 00 00 00 00 00 00
        0030: 00 00 00 00 00 00 00 00  00 00 00 ff 01 00 00 00
        0040: 00 00 00 00 3c 00 00 00  00 00 00 00 00 00 00 00
        0050: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0060: 3c 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0070: 00 00 00 00 00 00 00 00  00 00 00 00 3c 00 00 00
        0080: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
        0090: 00 00 00 00 00 00 00 00  3c 00 00 00 00 00 00 00
        00a0: 00 00 00 00 00 00 00 00  00 00 00 00 00

        Num entries: 6
        Entry size: 28
        Entry #1:
                Enable in GOP: yes
                Enable in OS: no
                Enable in VBIOS: no
                Resolution: 1366x768
                Display flags: none (0x00)
                Color depth: 0x00
                Refresh rate: 60
                DTD:
                  hdisplay: 0
                  hsync [0, 0] -sync
                  htotal: 0
                  vdisplay: 0
                  vsync [0, 0] -sync
                  vtotal: 0
                  clock: 0
                Display flags 2: EFP1,EFP2,EFP3,EFP4,EFP5,EFP6,EFP7,LFP1,LFP2 (0x01ff)
       ...
       Entry #6:
                Enable in GOP: no
                Enable in OS: no
                Enable in VBIOS: no
                Resolution: 0x0
                Display flags: none (0x00)
                Color depth: 0x00
                Refresh rate: 60
                DTD:
                  hdisplay: 0
                  hsync [0, 0] -sync
                  htotal: 0
                  vdisplay: 0
                  vsync [0, 0] -sync
                  vtotal: 0
                  clock: 0
                Display flags 2: none (0x0000)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index a76eae94f037..49a5da547e7a 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -346,6 +346,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_driver_rotation);
 	case BDB_DISPLAY_REMOVE_OLD:
 		return sizeof(struct bdb_display_remove_old);
+	case BDB_OEM_CUSTOM:
+		return sizeof(struct bdb_oem_custom);
 	case BDB_SDVO_LVDS_OPTIONS:
 		return sizeof(struct bdb_sdvo_lvds_options);
 	case BDB_SDVO_LVDS_DTD:
@@ -2227,6 +2229,39 @@ static void dump_driver_rotation(struct context *context,
 	printf("\tRotation flags 4: 0x%08x\n", rot->rotation_flags_4);
 }
 
+static void dump_oem_custom(struct context *context,
+			    const struct bdb_block *block)
+{
+	const struct bdb_oem_custom *oem = block_data(block);
+
+	printf("\tNum entries: %d\n", oem->num_entries);
+	printf("\tEntry size: %d\n", oem->entry_size);
+
+	for (int i = 0 ; i < oem->num_entries; i++) {
+		const struct oem_mode *m = (const void *)&oem->modes[0] +
+			i * oem->entry_size;
+
+		printf("\tEntry #%d:\n", i+1);
+		printf("\t\tEnable in GOP: %s\n", YESNO(m->enable_in_gop));
+		printf("\t\tEnable in OS: %s\n", YESNO(m->enable_in_os));
+		printf("\t\tEnable in VBIOS: %s\n", YESNO(m->enable_in_vbios));
+		printf("\t\tResolution: %dx%d\n", m->x_res, m->y_res);
+		printf("\t\tDisplay flags: %s (0x%02x)\n",
+		       child_device_handle(context, m->display_flags),
+		       m->display_flags);
+		printf("\t\tColor depth: 0x%02x\n", m->color_depth);
+		printf("\t\tRefresh rate: %d\n", m->refresh_rate);
+
+		printf("\t\tDTD:\n");
+		print_detail_timing_data(&m->dtd);
+
+		if (oem->entry_size >= 28)
+			printf("\t\tDisplay flags 2: %s (0x%04x)\n",
+			       child_device_handle(context, m->display_flags_2),
+			       m->display_flags_2);
+	}
+}
+
 static void dump_edp(struct context *context,
 		     const struct bdb_block *block)
 {
@@ -3345,6 +3380,11 @@ struct dumper dumpers[] = {
 		.name = "Display remove (pre-IVB)",
 		.dump = dump_display_remove_old,
 	},
+	{
+		.id = BDB_OEM_CUSTOM,
+		.name = "OEM customizable modes",
+		.dump = dump_oem_custom,
+	},
 	{
 		.id = BDB_SDVO_LVDS_OPTIONS,
 		.name = "SDVO LVDS options block",
-- 
2.44.2

