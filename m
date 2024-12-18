Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED67CE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 21:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A8310E24C;
	Wed, 18 Dec 2024 21:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Huj68Uvi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA0310E24C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 21:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734557818; x=1766093818;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2YKRA6sLoCRZbGyFjqWGbj4D6FtX5druCLtfgjxkJJI=;
 b=Huj68UviizDtkiIPcA60lR4+6IVPrH+UZgsDRyGICZ6dkr63CQfUzp7c
 nAA9QKeZ4JaJti0BeVXP6B4thS9v/6SN7TbAnUJVmwxYnb+eVRXL5PfbM
 eQKJmTgWhi910muhswWlRtVZckidCkJOmA9pwuJyt8lMr6QkJiyIb86nt
 r1la1zakSZmFjAEpmZk0tE4W83xpFcMqK4ixUIH6ho8RBFl89JU65pcvU
 GmPr1sr939ln3l9pJm30471nkD6+HY2rNnLDrXpYmiUQio3wHS9s+Sqq1
 +wMiF3kWVFxsSA3JrwsMTbZOh1aNgFyKBo9p9lnnQlDpW048nx2v9nD0w g==;
X-CSE-ConnectionGUID: vFu1u5iwQiunXDU1xIKqEQ==
X-CSE-MsgGUID: sKUiuWP4Tq+xmDgjGo4XQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34379756"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34379756"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
X-CSE-ConnectionGUID: KB8q2e9HRbKzzDo1IS2c6g==
X-CSE-MsgGUID: 0OfVcKFERmOYxiYlSYu1Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128973915"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 1/7] lib/intel_chipset: add pantherlake definition
 and support
Date: Wed, 18 Dec 2024 13:36:48 -0800
Message-Id: <20241218213654.2734573-2-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
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
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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

