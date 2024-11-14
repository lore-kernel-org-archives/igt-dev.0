Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCCFD6A229
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 19:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF9610E2BD;
	Thu, 14 Nov 2024 19:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ehA8OPvm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CBB10E2BD
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 19:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731611025; x=1763147025;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=16sqROgjAR+EmUV5AHVDmODTyoxM4XrGfaIJno4+LWc=;
 b=ehA8OPvmuVZGNUVGIarsIiqpj453Hb07sHdTji4EinCQPzNlC9i53chV
 ZjInJj+CsSzhrN8h08vIgopnFfSR8d6UcWd7+VkqHguNWpxnZZleT7O8g
 jsiSfmjtZCYGTzsqqOsWml2YTdT18Bo7rnCcVqv7Zr+8GrpOlPMTF+PGQ
 7C7Ztp/fGfPqHMhlVRQpk7NJnZfoq1b+OHg8w+t7uqYC93V8asW6EbQ24
 A0RZrJSRellqamXwoSZKx6k594bXYZdNsWx7Af+qbflw4AZdZqE7TwjfN
 E16SjunMnMnqC1WoiRVn2ginlOyiyAAZSaUfHC+JtU0GuM5vmyQPkUsjJ A==;
X-CSE-ConnectionGUID: Ifjjug/gSZ2FdJqEw94LTg==
X-CSE-MsgGUID: JtxjrBdORiyBIkgU9Sc8mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34442555"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="34442555"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:43 -0800
X-CSE-ConnectionGUID: B3drrPvDT/WDWO7rt2wicA==
X-CSE-MsgGUID: 1iCk5n3DQEO0cMlaW9fN3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93242104"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:43 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 1/9] PTL: lib/intel_chipset: add pantherlake
 definition and support
Date: Thu, 14 Nov 2024 11:03:31 -0800
Message-Id: <20241114190339.3885752-2-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
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

