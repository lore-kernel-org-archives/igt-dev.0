Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACECCD8C9D
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 12:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54B410E358;
	Mon,  8 Jun 2026 12:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOsVBHEn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6346110F341
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 12:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780922577; x=1812458577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x/HDNNM8HJRREzvcmPVgamxd06Bm6vEUl82WnTXAZcw=;
 b=EOsVBHEnWfqfiEHeEv3IKZsm55DwwW1CISCZ5O7WSUn2b3deO1QqR5jO
 y54BgbS0fhQoRQlNCk1zbhEKxv9IEkdh8hPWjgG82gyZnHoKTvHjKHNGq
 J8a+4npwtKOgO6s02c5974Qpmwyo6F1jA/h08iAZJjFaHAhwlTuyBfrvc
 Nz0on4qKGE5P7sTbrO6S7hjW99Eve6zZMzSWxgZXf0Ye9Da27+QzMbWsy
 42Wu1IW5vvs7SCj+h4UeRMMt4fHVde5myWauFKqYo8P0A2Oc7qd74TsyC
 SYK/2tgNlq2r/w+j2e7Ujqj6KnAbR531dipURVZ+Yn/vJvOucP84wV8dd A==;
X-CSE-ConnectionGUID: +Ekr3FeVS/SG0vP+oBsTOw==
X-CSE-MsgGUID: tfT3TdVMRRy7djGtu4wgOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80683119"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80683119"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 05:42:57 -0700
X-CSE-ConnectionGUID: Dj+/GQdMRvW8m8sM83ZaWA==
X-CSE-MsgGUID: HImUQlWlR8CdV6Trc8ob9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="244688448"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 08 Jun 2026 05:42:56 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 5/8] tools/vbt_decode: guess devid from VBT signature
Date: Mon,  8 Jun 2026 14:41:18 +0200
Message-ID: <20260608124121.3131410-6-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260608124121.3131410-1-michal.grzelak@intel.com>
References: <20260608124121.3131410-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Nowadays Device ID needs to be passed to decode VBT precisely. VBT lacks
it since VBT has been moved from PCI ROM into opregion.

However we can narrow from which platform VBT originated basing on VBT
signature.

Add a command-line option to guess devid using VBT signature. Create an
array of signatures and check if any of those is a substring of
signature extracted from given VBT. Map each signature into first Device
ID of a platform picked from include/drm/intel/pciids.h. Log that devid
has not been matched if signature is not found.

Note that the platform-specific name should appear after "$VBT ", hence
the match.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 5681643f4b..ec82b00939 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -77,6 +77,7 @@ struct context {
 	uint32_t devid;
 	int panel_type, panel_type2;
 	int sdvo_panel_type;
+	bool devid_from_signature;
 	bool dump_all_panel_types;
 	bool hexdump;
 };
@@ -3693,6 +3694,31 @@ static int get_sdvo_panel_type(struct context *context)
 	return panel_type;
 }
 
+static int
+get_devid_from_signature(const char *vbt_signature)
+{
+	int i;
+
+	const char *signature[] = {"PANTHERLAKE",
+				   "LUNARLAKE",
+				   "METEORLAKE",
+				   "JASPERLAKE",
+				   NULL};
+
+	int devid[] = {0xB080, /* PTL */
+		       0x6420, /* LNL */
+		       0x7D40, /* MTL */
+		       0x4E51, /* JSL */
+		       0x0};
+
+	for (i = 0; signature[i]; i++)
+		if (strstr(vbt_signature, signature[i]))
+			return devid[i];
+
+	fprintf(stderr, "Warning: cannot find devid for signature %s\n", vbt_signature);
+	return 0;
+}
+
 static int
 get_device_id(unsigned char *bios, int size)
 {
@@ -4108,6 +4134,7 @@ enum opt {
 	OPT_PANEL_TYPE2,
 	OPT_PANEL_EDID,
 	OPT_PANEL_EDID2,
+	OPT_VBT_DEVID,
 	OPT_ALL_PANELS,
 	OPT_HEXDUMP,
 	OPT_BLOCK,
@@ -4162,6 +4189,8 @@ int main(int argc, char **argv)
 		{ "panel-edid",	required_argument,	NULL,	OPT_PANEL_EDID },
 		{ "panel-type2",	required_argument,	NULL,	OPT_PANEL_TYPE2 },
 		{ "panel-edid2",	required_argument,	NULL,	OPT_PANEL_EDID2 },
+		{ "devid-from-signature",
+				no_argument,		NULL,	OPT_VBT_DEVID },
 		{ "all-panels",	no_argument,		NULL,	OPT_ALL_PANELS },
 		{ "hexdump",	no_argument,		NULL,	OPT_HEXDUMP },
 		{ "block",	required_argument,	NULL,	OPT_BLOCK },
@@ -4207,6 +4236,9 @@ int main(int argc, char **argv)
 		case OPT_PANEL_EDID2:
 			panel_edid2 = optarg;
 			break;
+		case OPT_VBT_DEVID:
+			context.devid_from_signature = true;
+			break;
 		case OPT_ALL_PANELS:
 			context.dump_all_panel_types = true;
 			break;
@@ -4313,6 +4345,8 @@ int main(int argc, char **argv)
 	context.bdb = (const struct bdb_header *)(VBIOS + bdb_off);
 	context.size = size;
 
+	if (!context.devid && context.devid_from_signature)
+		context.devid = get_devid_from_signature((char *) vbt->signature);
 	if (!context.devid) {
 		const char *devid_string = getenv("DEVICE");
 		if (devid_string) {
@@ -4326,7 +4360,7 @@ int main(int argc, char **argv)
 	if (!context.devid)
 		context.devid = get_device_id(VBIOS, size);
 	if (!context.devid)
-		fprintf(stderr, "Warning: could not find PCI device ID!\n");
+		fprintf(stderr, "Warning: could not find PCI device ID! Use --devid or --devid-from-signature\n");
 
 	if (context.panel_type == -1)
 		context.panel_type = get_panel_type(&context, false);
-- 
2.45.2

