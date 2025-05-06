Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9CAC3ABAC
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 10:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548A210E343;
	Tue,  6 May 2025 10:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4W9MEgP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AC310E343
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 10:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746526575; x=1778062575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vCIAGDPYXCjxldMebvp60LfHoYedTXHp490HUDTbnAg=;
 b=G4W9MEgPj/XMNTZ3dTRoX9hrCXjagqiF/NHUCxGROZsefViWJtMSxYt+
 TcX53UJuDGiYO4YYFdYnlG9fLduFDS5/WKdQ9ueHSq+u5KOqfMllrgz21
 gNVvUotUVpUuflVXdP8jFWIcxa+4KPZbLJaw0s0kGp6VC5llWabinMMoK
 vpqu5nrbSlgum/f8d2ng3dzRcdnPPkuQF9u0ISxZXT54gOxdnI7wPDCir
 Eltq9y1PrDAt5JBXFszEz0uJo2QNGtDFJgIXy8156XYM3Qqdw5o1L10vD
 U/g6i5MOchEm9OJQrlJZgA6dcLvoPmfOg9ptLvvlEuykoZA7fBFuwHX++ g==;
X-CSE-ConnectionGUID: zWFwVcwQSbW6lmuPuRfG5Q==
X-CSE-MsgGUID: uXC/h22fTlmcK+5FJkiWyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59575997"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="59575997"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 03:16:15 -0700
X-CSE-ConnectionGUID: xokpRsDSSTS4dbS7WSNzsw==
X-CSE-MsgGUID: 5DPam1RLTs+zIQ7lW00fPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="139627966"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.101.99])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 03:16:13 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_pmu: Unprovision VFs on cleanup
Date: Tue,  6 May 2025 12:15:53 +0200
Message-Id: <20250506101554.629218-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250506101554.629218-1-marcin.bernatowicz@linux.intel.com>
References: <20250506101554.629218-1-marcin.bernatowicz@linux.intel.com>
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

Unprovision VFs to ensure a clean state for subsequent tests.
Rename disable_vfs() to unprovision_and_disable_vfs() to reflect the
additional cleanup steps.

Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_pmu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 094dc0c6c..8cbbf6916 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -497,12 +497,15 @@ static unsigned int enable_and_provision_vfs(int fd)
 	return num_vfs;
 }
 
-static void disable_vfs(int fd)
+static void unprovision_and_disable_vfs(int fd)
 {
-	unsigned int gt;
+	unsigned int gt, num_vfs = igt_sriov_get_enabled_vfs(fd);
 
-	xe_for_each_gt(fd, gt)
+	xe_for_each_gt(fd, gt) {
 		xe_sriov_set_sched_if_idle(fd, gt, 0);
+		for (int fn = 0; fn <= num_vfs; fn++)
+			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);
+	}
 
 	igt_sriov_disable_vfs(fd);
 	/* abort to avoid execution of next tests with enabled VFs */
@@ -596,7 +599,7 @@ igt_main
 		}
 
 		igt_fixture
-			disable_vfs(fd);
+			unprovision_and_disable_vfs(fd);
 	}
 
 	igt_subtest_group {
-- 
2.31.1

