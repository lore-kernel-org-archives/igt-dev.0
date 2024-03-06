Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612B3C54E4A
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 15:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB41110F090;
	Wed,  6 Mar 2024 15:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPdnbsdb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA9111327D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 15:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709737568; x=1741273568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nI41hOXBF0B4h6r8seZmEEUi4e8i6DhT8iVDXwln6cM=;
 b=VPdnbsdbA0Dbi81Zfv/NlkYjiraV+sDt/1/m28jrY++GYnb2/wc3ENcu
 SFmvtgak0zW2F3OP8rTllkIXLggyw1UKQurVUsbo1zJwCqzUnMCxp3iLe
 XOHwcEuSGxaa4/v6h7k25ljevNKcAfya5bbCQ/SCguXzdngL8MrNfPbno
 MKuhtRq+qPBtsQ/lcpd/7VHKm0XXbo//O1yEp0xOysyfaU3BU5DFyhALl
 22hzkSum7O4meDZj3mK+oD1J1c6pvrmTFLe5nrl/BU4flDBcK8AAXAnU7
 ArKwoPD/XerA71x4aZ0vVL2d45ods/CwYaBDHX5k2o5WWzj8jRZKqzmhS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4240942"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4240942"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:06:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="47296661"
Received: from dawidzix-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.249.140.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:06:07 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 5/6] lib/intel_mocs: add defer-to-pat MOCS index
Date: Wed,  6 Mar 2024 15:04:51 +0000
Message-ID: <20240306150453.254144-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240306150453.254144-1-matthew.auld@intel.com>
References: <20240306150453.254144-1-matthew.auld@intel.com>
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

At least on Xe2 it looks like we can just use MOCS index zero to defer
the selected caching mode to that of the PAT index. This will be useful
in an upcoming patch.

v2: (Zbigniew)
  - Let's go with intel_get_defer_to_pat_mocs_index()

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_mocs.c | 14 ++++++++++++++
 lib/intel_mocs.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index 4a9c305dc..b0559e0a5 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -9,6 +9,7 @@
 struct drm_intel_mocs_index {
 	uint8_t uc_index;
 	uint8_t wb_index;
+	uint8_t defer_to_pat_index;
 };
 
 static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
@@ -25,6 +26,7 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
 	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
 		mocs->uc_index = 3;
 		mocs->wb_index = 4;
+		mocs->defer_to_pat_index = 0;
 	} else if (IS_METEORLAKE(devid)) {
 		mocs->uc_index = 5;
 		mocs->wb_index = 10;
@@ -60,3 +62,15 @@ uint8_t intel_get_uc_mocs_index(int fd)
 
 	return mocs.uc_index;
 }
+
+uint8_t intel_get_defer_to_pat_mocs_index(int fd)
+{
+	struct drm_intel_mocs_index mocs;
+	uint16_t dev_id = intel_get_drm_devid(fd);
+
+	igt_assert(AT_LEAST_GEN(dev_id, 20));
+
+	get_mocs_index(fd, &mocs);
+
+	return mocs.defer_to_pat_index;
+}
diff --git a/lib/intel_mocs.h b/lib/intel_mocs.h
index b5c79b0e1..8597286d2 100644
--- a/lib/intel_mocs.h
+++ b/lib/intel_mocs.h
@@ -12,5 +12,6 @@
 
 uint8_t intel_get_wb_mocs_index(int fd);
 uint8_t intel_get_uc_mocs_index(int fd);
+uint8_t intel_get_defer_to_pat_mocs_index(int fd);
 
 #endif /* _INTEL_MOCS_H */
-- 
2.43.2

