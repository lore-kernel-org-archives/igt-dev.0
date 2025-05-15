Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF6FC3DA6D
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 20:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3628710E0C5;
	Thu, 15 May 2025 20:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eaYuKM1L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0369C10E0C5
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 20:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747340300; x=1778876300;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7aOdYvOBax/iB2eBNcd+vGkadvTISJbMuApx5OBcePQ=;
 b=eaYuKM1LXuO/g1sZJ21LTnNwB3rODX48UGaKUliuz4YAs6FfFkK0wGjw
 4sLQCUnJvwPgHbz1dTcAaQnoT9Oja5nPej4SZfl7Xq0hQ55I9ODSqtkLD
 cZjv+jIeGsdPNTjywsXAFNnkJUa/bCGN+aGd0DPnbgAS3XP4++TwLLqox
 Cm2FTv52OAsapOim54YUT/qbqD1fiRAEJR3KWsctYPALrvjh7sguJfSEA
 NQlywh80Nxz4gDVFqXYqMYCq7hHONHblmX6Cf9hLdTC4gVvJJWunRjryV
 enXPsK3mffqXDX8EjqwHRLzu3VqZXtv27uInfflmGq9fvrzbORCb/aCbG w==;
X-CSE-ConnectionGUID: ZITE3nFxSCWddvS4I0OsLw==
X-CSE-MsgGUID: A/Nd6CvLRru8+p7Ro2ytlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60637215"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="60637215"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 13:18:19 -0700
X-CSE-ConnectionGUID: b8bxTOXYRUGcPbqdbeL0rA==
X-CSE-MsgGUID: 2DGKAY5bQR2uVb7gdI/b8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="169409789"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 13:18:19 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_oa: Avoid divide by zero SIGFPE
Date: Thu, 15 May 2025 13:18:04 -0700
Message-ID: <20250515201804.1631501-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

It is planned for future OA units to have 0 engines attached to them. Avoid
divide by zero SIGFPE for these cases.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 1576479d98..73841a359d 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -445,7 +445,7 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
 		oau = (struct drm_xe_oa_unit *)poau;
 
 		if (i == n) {
-			hwe = &oau->eci[random() % oau->num_engines];
+			hwe = oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
 			break;
 		}
 		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
-- 
2.48.1

