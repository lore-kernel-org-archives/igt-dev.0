Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAF7C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 10:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5AF10E8F2;
	Thu,  1 Aug 2024 10:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7AfaFsE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C55110E8F2
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 10:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722508091; x=1754044091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k+fGnMJr/5/AKZfMpeiSPgQ0D+GxuDbGpm2pC28zhuc=;
 b=U7AfaFsE0KsgAuRjiVGXB/NC9woiQ1p6JYd3uAKf8fdknLFjHh6SBV1p
 +9IymULTPjUYbOjlXSKbXmVsJDrl2ygy/pFZVMvR9kFEfoeLUCLxquG94
 nxN+8W1ck3vkn0rU6l6k+h7ITEeC5iSDSdCDG35isQMREhNArFBAhvqnD
 CH75MQkCrqvn2v0naMBtkrn20cddGGFP+HTJKZmpEkzLSDZuiAQv6971W
 JEHe4TMnVxkCveBGpapwTBpdZUCcQ4LkOf45BbqLnPsI1n0AB9ymvmvsg
 kSdFn1z4uqlUd64S1oy7jGzCnQd9eLjuGqQEn4zC4EtpHMHU/2MzCnLo+ g==;
X-CSE-ConnectionGUID: ri8MZWZ9SzG/4xBbZ0FURg==
X-CSE-MsgGUID: pbD9SpmhSRSgzQWPG4jYyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24244565"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="24244565"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 03:28:11 -0700
X-CSE-ConnectionGUID: dBThnSZCQXiD8BtRs70ISw==
X-CSE-MsgGUID: MEqcHGQ6RS+AGJXOzfHB9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="54967118"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 03:28:09 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, jonathan.cavitt@intel.com,
 lukasz.laguna@intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH v2 i-g-t 3/3] tests/intel/xe_pm_residency: Skip test if
 'gtidle' node is missing
Date: Thu,  1 Aug 2024 12:27:48 +0200
Message-Id: <20240801102748.487160-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240801102748.487160-1-marcin.bernatowicz@linux.intel.com>
References: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
 <20240801102748.487160-1-marcin.bernatowicz@linux.intel.com>
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

Add an igt_require check for 'gtidle' node to skip residency
tests on VF devices where this node is not present, preventing
test failure.

v2: Use "node" instead of "attribute" for more accuracy

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_pm_residency.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 51735d887..9fec3b41a 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -317,7 +317,9 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+
 		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
+		igt_require(xe_sysfs_gt_has_node(fd, 0, "gtidle"));
 	}
 
 	igt_describe("Validate GT C6 on idle");
-- 
2.31.1

