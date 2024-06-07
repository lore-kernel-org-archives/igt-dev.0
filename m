Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7C4C27C6E
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B4810EC70;
	Fri,  7 Jun 2024 13:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rl7Xwq7l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD4310EC70
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768707; x=1749304707;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yUDBZNGfNYxKKLRASB4Eoq2jZ+jLbOJ7X3WvVN3dyz4=;
 b=Rl7Xwq7lzsb9lBVNTA7Gf1nxX5rcIgEm6RPeEog5/nVcWOK8hTPldEEz
 tGPASGEqkEAJWsyaxQNHwbBHkqMUPPcTj9eWpb+Hj03ADUpaIJxG68D1F
 qICbhv44F/QrMlUsBkRiVRVFhu89o8W1CWE372SFmhDxuZ4qBb/V51dD/
 FbSxPSnYES+/GvDEkgjJ2OafPhx/7bMsXoJ7Z4OTMvFYbJdWtTQSryWZr
 5jKrvNSehLr4n4a1SfG9X8tKN5yDjBtFaqzbvI7V9SDuhmbz9rsFr7IWA
 0KZByNVY9PmGj9m8ebUUYxTea2DWCqhX81ms/DnnRuC8Xfs/kWW3Zs47a w==;
X-CSE-ConnectionGUID: aeUeHP0KRWuV7ekiPHXfSA==
X-CSE-MsgGUID: jKg0XlPNQdubb/nG0TgAeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116781"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116781"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:27 -0700
X-CSE-ConnectionGUID: O7+pFWd+RH+My+14NagzAw==
X-CSE-MsgGUID: eEXKtBRERjCzELWPNC2B5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323776"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:24 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/27] tools/intel_vbt_decode: Decode block 12 (Driver
 Persistent Algorithm)
Date: Fri,  7 Jun 2024 16:57:40 +0300
Message-ID: <20240607135758.31421-10-ville.syrjala@linux.intel.com>
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

Decode VBT block 12 (Driver Persistent Algorithm). Doubtful there's
anything actually interesting here, but might as well decode it while
at it.

Example output from MGM:
BDB block 13 (3 bytes, min 3 bytes) - Driver persistent algorithm:
        0000: 0d 03 00 78 00 0a

        Docking persistent algorithm: OS default
        DVO hotplug persistent on mode: no
        EDID persistent on mode: no
        Hotkey persistent on mode: yes
        Hotkey persistent on restore pipe: yes
        Hotkey persistent on refresh rate: yes
        Hotkey persistent on MDS/Twin: yes
        Power management persistent algorithm: OS default
        Lid switch persistent algorithm: OS default
        Hotkey persisentt algorithm: OS default
        Persistent max config: 10

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index c5752d3161a3..fd0753eb11d7 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -335,6 +335,8 @@ static size_t block_min_size(const struct context *context, int section_id)
 		return sizeof(struct bdb_legacy_child_devices);
 	case BDB_DRIVER_FEATURES:
 		return sizeof(struct bdb_driver_features);
+	case BDB_DRIVER_PERSISTENCE:
+		return sizeof(struct bdb_driver_persistence);
 	case BDB_SDVO_LVDS_OPTIONS:
 		return sizeof(struct bdb_sdvo_lvds_options);
 	case BDB_SDVO_LVDS_DTD:
@@ -1870,6 +1872,34 @@ static void dump_driver_feature(struct context *context,
 	       YESNO(feature->rmpm_enabled));
 }
 
+static void dump_driver_persistence(struct context *context,
+				    const struct bdb_block *block)
+{
+	const struct bdb_driver_persistence *persistence = block_data(block);
+
+	printf("\tDocking persistent algorithm: %s\n",
+	       default_algorithm(persistence->docking_persistent_algorithm));
+	printf("\tDVO hotplug persistent on mode: %s\n",
+	       YESNO(persistence->dvo_hotplug_persistent_on_mode));
+	printf("\tEDID persistent on mode: %s\n",
+	       YESNO(persistence->edid_persistent_on_mode));
+	printf("\tHotkey persistent on mode: %s\n",
+	       YESNO(persistence->hotkey_persistent_on_mode));
+	printf("\tHotkey persistent on restore pipe: %s\n",
+	       YESNO(persistence->hotkey_persistent_on_restore_pipe));
+	printf("\tHotkey persistent on refresh rate: %s\n",
+	       YESNO(persistence->hotkey_persistent_on_refresh_rate));
+	printf("\tHotkey persistent on MDS/Twin: %s\n",
+	       YESNO(persistence->hotkey_persistent_on_mds_twin));
+	printf("\tPower management persistent algorithm: %s\n",
+	       default_algorithm(persistence->power_management_persistent_algorithm));
+	printf("\tLid switch persistent algorithm: %s\n",
+	       default_algorithm(persistence->lid_switch_persistent_algorithm));
+	printf("\tHotkey persisentt algorithm: %s\n",
+	       default_algorithm(persistence->hotkey_persistent_algorithm));
+	printf("\tPersistent max config: %d\n", persistence->persistent_max_config);
+}
+
 static void dump_edp(struct context *context,
 		     const struct bdb_block *block)
 {
@@ -2957,6 +2987,11 @@ struct dumper dumpers[] = {
 		.name = "Driver feature data block",
 		.dump = dump_driver_feature,
 	},
+	{
+		.id = BDB_DRIVER_PERSISTENCE,
+		.name = "Driver persistent algorithm",
+		.dump = dump_driver_persistence,
+	},
 	{
 		.id = BDB_SDVO_LVDS_OPTIONS,
 		.name = "SDVO LVDS options block",
-- 
2.44.2

