Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2DDCA0FF0
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 15:35:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB29110E05A;
	Fri, 29 Aug 2025 15:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5G986kL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D48510E05A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 15:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756481702; x=1788017702;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sbK2cxH+d1aFOe8+vKCCDBUJqkc4eeX08d3Gqcq46HA=;
 b=J5G986kLTNuY7V99Dm3xxUa4w1IpmK0SHN7vvK3K5iibys3IVa6kIYbO
 K3oBhWzjpl0tbHi1PpTTX0CIH19r2LqtQ8Pl42PlRaE2ZhSFGTqJdzC9/
 Cg7H4jkfZaXibeoI92KGcGgPXTBMt83/Ps3p0GJnHP3RydbM6X98uOx7R
 3rzI+o1wLAqpuiiiRDQVu1e2Mwciiu6j6U/5MRYkkoqMXbtEV1Blu00CB
 9lvb6LGcr3pVVqdMzMPcetLsf27zrKV2snrTEGaAkTuCg7TBO7QlHhC3w
 E3Zo+akJ6dtbdHgsTP2JXl5uRF66S/x4oGg610lHDnd8jEmrxud2ndmIJ Q==;
X-CSE-ConnectionGUID: a66KEjUhT3S/NQHkUpvOMg==
X-CSE-MsgGUID: l9knhlduQ0+rRfrFU3wKmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69873305"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69873305"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 08:35:02 -0700
X-CSE-ConnectionGUID: rDwkuE8hQqm+hKlG67/FSQ==
X-CSE-MsgGUID: f6mkJmMkQ5iXvVtBU6hLGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169663191"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.234])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 08:35:00 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v1] lib/drmtest: Refactor chipset to string
Date: Fri, 29 Aug 2025 17:34:53 +0200
Message-ID: <20250829153454.129913-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

Currently chipset names are in modules array and almost all of
them are duplicated in function chipset_to_str(). Refactor this
function and remove duplication.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 436b6de78..1b871fd1b 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -276,30 +276,14 @@ unsigned int drm_get_chipset(int fd)
 
 static const char *chipset_to_str(int chipset)
 {
-	switch (chipset) {
-	case DRIVER_INTEL:
+	if (chipset == DRIVER_INTEL)
 		return "intel";
-	case DRIVER_V3D:
-		return "v3d";
-	case DRIVER_VC4:
-		return "vc4";
-	case DRIVER_VGEM:
-		return "vgem";
-	case DRIVER_AMDGPU:
-		return "amdgpu";
-	case DRIVER_PANFROST:
-		return "panfrost";
-	case DRIVER_MSM:
-		return "msm";
-	case DRIVER_XE:
-		return "xe";
-	case DRIVER_VMWGFX:
-		return "vmwgfx";
-	case DRIVER_ANY:
-		return "any";
-	default:
-		return "other";
-	}
+
+	for (int i = 0, end = ARRAY_SIZE(modules); i < end; i++)
+		if (modules[i].bit == chipset)
+			return modules[i].module;
+
+	return chipset == DRIVER_ANY ? "any" : "other";
 }
 
 
-- 
2.51.0

