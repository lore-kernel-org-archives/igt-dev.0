Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2127D637D3
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 23:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E3610E76F;
	Wed, 13 Nov 2024 23:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IyrbZdI5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC3810E29B
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731538985; x=1763074985;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=16sqROgjAR+EmUV5AHVDmODTyoxM4XrGfaIJno4+LWc=;
 b=IyrbZdI5iGUrEAJu/A3ndsQbDyDwjXmaogcY8b5U+lljFq83PAKsbFaj
 4Pg1JQvitR9nUQtaoe0WqE5EkiCMaSqv5v3YyC2AQo+w3MQyhmtGPqLjI
 QvLmmqPqkvZSpS0joenxIdasWRr/KSjZD0OozETDuN4ptxKO/G/uyjg02
 XXgHa5rFaSd4tJab5wKUWQIH3djDL6IZ1VTgp+/afmDleGHoSnMz/WJgM
 TwDCvMt3MLThpBhyRtrzJFsGLlSY9TbN+Gdw7Divb8CQmif6LcSK4zW1R
 lW8vdNFsEzae9xpvftx72wBwDzU3P5R46gEuWdha23oSF/qf/dCTiZqLQ Q==;
X-CSE-ConnectionGUID: D+WIE6U2TU6F/K9hAqD5BQ==
X-CSE-MsgGUID: BYeBaqJdQemnFdSklPjTmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53999372"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53999372"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:05 -0800
X-CSE-ConnectionGUID: G4axXSlWQgWEp0LZhwJ+2A==
X-CSE-MsgGUID: WScws67yTqCriBWOC19hrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="93074712"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:05 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/9] PTL: lib/intel_chipset: add pantherlake definition
 and support
Date: Wed, 13 Nov 2024 15:02:53 -0800
Message-Id: <20241113230301.655499-3-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241113230301.655499-1-clinton.a.taylor@intel.com>
References: <20241113230301.655499-1-clinton.a.taylor@intel.com>
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

From: Matt Atwood <matthew.s.atwood@intel.com>

Add support for the pantherlake platform for xe.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 0c04476bf..c93ad9f75 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -92,6 +92,8 @@ struct intel_device_info {
 	bool is_pontevecchio : 1;
 	bool is_lunarlake : 1;
 	bool is_battlemage : 1;
+	bool is_pantherlake : 1;
+
 	const struct intel_cmds_info *cmds_info;
 	const char *codename;
 };
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 546b9c65a..69132e91c 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -526,6 +526,16 @@ static const struct intel_device_info intel_battlemage_info = {
 	.cmds_info = &xe2_cmds_info,
 };
 
+static const struct intel_device_info intel_pantherlake_info = {
+	.graphics_ver = 30,
+	.graphics_rel = 0,
+	.display_ver = 30,
+	.has_4tile = true,
+	.is_pantherlake = true,
+	.codename = "pantherlake",
+	.cmds_info = &gen12_pvc_cmds_info,
+};
+
 #define INTEL_PCI_ID_INIT(_id, _info) { \
 	.vendor_id = 0x8086, .device_id = (_id), \
 	.subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
@@ -642,6 +652,8 @@ static const struct pci_id_match intel_device_match[] = {
 
 	INTEL_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
 
+	INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
+
 	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
 };
 
-- 
2.25.1

