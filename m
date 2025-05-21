Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22365C2D0CD
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 06:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69D710E642;
	Wed, 21 May 2025 06:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EzXpdwKY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E187F10E642
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 06:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747810258; x=1779346258;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dhbAv1/H+xOiAbXqdR+GJbe/B7AEr/CHe0AeFfXn7k0=;
 b=EzXpdwKYNkvr9IsVPhqCGIdRPxJ9Zt7cdKxh0i2z9mszO5XI95w2HIeb
 BONdsoOYGxeH5rjFIvE/ucUcCMUvDSKSE3XL7El4p7JUMg8y9glij4eSN
 UQYm2cuT2jibMcOfvuMnrufc8ASIM21NSYF+VRwpe6g8lK10QX+2iUJ9m
 R/Rp55Kqt155DezqLhVlVQGaoORFRcJi6dK9xsMkXo1koyDQD614jM6hS
 jhdCL/k+5qHi/Jl2NzP3aHDiCFtA5+r8urTnnp1mTyenAPluq1w9spa5A
 MovLNXR/ORfDxDZ02kQc6B6U98WGQOd/sTDl+OTUVQjFq+VKFaV93SnYy w==;
X-CSE-ConnectionGUID: /OKWZx32SXil5XHJXOWviA==
X-CSE-MsgGUID: JyJ9ji9CT+2y/3Dt/sr7gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,5688"; a="48891831"
X-IronPort-AV: E=Sophos;i="6.10,1,1719903600"; 
   d="scan'208";a="48891831"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 23:50:58 -0700
X-CSE-ConnectionGUID: 3TsK3msUSJKELDSTCMvB1w==
X-CSE-MsgGUID: 1/HG/MeLQrOmbWIGnyzAjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139827874"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 23:44:55 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] lib/kms: Add secondary sort key (vrefresh) to DRM mode
 sorting func()
Date: Wed, 21 May 2025 12:20:27 +0530
Message-Id: <20250521065027.1400461-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Extend sort_drm_modes_by_res_dsc() and sort_drm_modes_by_res_asc()
to use vrefresh as a secondary key when hdisplay values are equal.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9ee03e870..e5c0a51ae 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1887,7 +1887,11 @@ int sort_drm_modes_by_res_dsc(const void *a, const void *b)
 {
 	const drmModeModeInfo *mode1 = a, *mode2 = b;
 
-	return (mode1->hdisplay < mode2->hdisplay) - (mode2->hdisplay < mode1->hdisplay);
+	int cmp = (mode1->hdisplay < mode2->hdisplay) - (mode2->hdisplay < mode1->hdisplay);
+	if (cmp == 0)
+		cmp = (mode1->vrefresh < mode2->vrefresh) - (mode2->vrefresh < mode1->vrefresh);
+
+	return cmp;
 }
 
 /**
@@ -1904,7 +1908,11 @@ int sort_drm_modes_by_res_asc(const void *a, const void *b)
 {
 	const drmModeModeInfo *mode1 = a, *mode2 = b;
 
-	return (mode1->hdisplay > mode2->hdisplay) - (mode2->hdisplay > mode1->hdisplay);
+	int cmp = (mode1->hdisplay > mode2->hdisplay) - (mode2->hdisplay > mode1->hdisplay);
+	if (cmp == 0)
+		cmp = (mode1->vrefresh > mode2->vrefresh) - (mode2->vrefresh > mode1->vrefresh);
+
+	return cmp;
 }
 
 /**
-- 
2.25.1

