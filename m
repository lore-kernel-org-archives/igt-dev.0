Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CA4E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 21:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383B710F1D3;
	Fri,  6 Dec 2024 21:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnYAvooD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F2D10F1D2
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733520604; x=1765056604;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=u9Okqs+TQPHvhaO+S/2NjJzYdOHTXDim6bOumjpbTQk=;
 b=SnYAvooDfpmsSDxU0RnwmseQZRGiRGywkZBkO0yyotRZ09Yd84GnY/O+
 O3XEcT5nLIkRwQiMuWeZ+UF4uWpm5S3EnTC0v8/MIc1gmYNpb6b/A75sS
 aGa4lRpdpXDpGdIHDa3nTMQYAFmKdH4ebT8lOYHpDlcVlWSuK+OzjOY+C
 m7JqlibI6WMqfVZL9+sGZcwyt5G2YAtpQ9dyoBEtv1N/zKI3Co0VNdYVF
 gnBVmKQQHejSx7vmZ642H/cxdDZ2OfLf1u0NbdQW4dal+ouD5GjRvs5jJ
 hoxEVvCr1hMp7Rjb1HkSXuWLiRQJtjwZ2cmtqOzpOESHK344pxcYB/pyF A==;
X-CSE-ConnectionGUID: n4ekH7wrSZuL0UcJFQNIag==
X-CSE-MsgGUID: NbqxNRreQBmPu8FnDBW2CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="51304468"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="51304468"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
X-CSE-ConnectionGUID: W+PQ9hJ6SPaRZ//f26uohw==
X-CSE-MsgGUID: iNXvV0zwScu5DjQC3tahWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="95306722"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 1/8] PTL: lib/intel_chipset: add pantherlake
 definition and support
Date: Fri,  6 Dec 2024 13:27:41 -0800
Message-Id: <20241206212748.2101217-2-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
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
Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c | 13 +++++++++++++
 2 files changed, 15 insertions(+)

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
index d38dc415d..349cf1b48 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -526,6 +526,17 @@ static const struct intel_device_info intel_battlemage_info = {
 	.cmds_info = &xe2_cmds_info,
 };
 
+static const struct intel_device_info intel_pantherlake_info = {
+	.graphics_ver = 30,
+	.graphics_rel = 0,
+	.display_ver = 30,
+	.has_4tile = true,
+	.has_flatccs = true,
+	.is_pantherlake = true,
+	.codename = "pantherlake",
+	.cmds_info = &xe2_cmds_info,
+};
+
 #define INTEL_PCI_ID_INIT(_id, _info) { \
 	.vendor_id = 0x8086, .device_id = (_id), \
 	.subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
@@ -642,6 +653,8 @@ static const struct pci_id_match intel_device_match[] = {
 
 	INTEL_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
 
+	INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
+
 	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
 };
 
-- 
2.25.1

