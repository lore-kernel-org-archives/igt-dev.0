Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F38C5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F5210E265;
	Tue, 27 Aug 2024 05:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbfDsU2i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0429210E1C7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737921; x=1756273921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Z7c996V+TQfWNWgXwiWNTr8ysjwrgW6A0iRVcTZ/wI=;
 b=SbfDsU2i4a/pRNbba15vaDr6B03Ds9SGyoD4yoMp+E3Tsdw+P9a2DN5h
 BEC4UaNkZQYITR975STZBwlvCI4Czdv0w1o3FqDHhcfEGtJkKSxq/ahUk
 VGcBtZtjRTv8M1eG/nRnrqhaY8No5RrVQjWaQ0p5F9aQWIBZZPtGHCdlf
 zXwjTZZBaD2UxKilRTox12A2st9G6TNxGyStNeW1ML9U6/UJ4pmlTN7li
 6beEv/uqg+CwI0eOfu1LE8aDddHuLuod23D/+cqNVakVNsqa5mFSp3Lni
 rbcXF5/IZwI60BAyBk14siUjG4FE45N+t0NjQOYjMgDXq8/AtgilVHvBZ A==;
X-CSE-ConnectionGUID: 5mt81AbVQ0SPioBF6twekA==
X-CSE-MsgGUID: B83WoejpS9iaVozcOduDTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23355592"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23355592"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:52:01 -0700
X-CSE-ConnectionGUID: WWgGqV1xQgW7TtExEEo3mw==
X-CSE-MsgGUID: 4OVBQBgyR+yLjLWCnNv7PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62800393"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:52:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t v2 04/10] tests/intel/xe_drm_fdinfo: Use
 igt_assert_lt_double()
Date: Mon, 26 Aug 2024 22:51:23 -0700
Message-ID: <20240827055129.1671873-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827055129.1671873-1-lucas.demarchi@intel.com>
References: <20240827055129.1671873-1-lucas.demarchi@intel.com>
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

This also shows the value that is failing, which helps debugging.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 074a89711..1b5980752 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -485,10 +485,12 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 
 	igt_debug("%s: percent: %f\n", engine_map[class], percent);
 
-	if (flags & TEST_BUSY)
-		igt_assert(percent >= 95 && percent <= 105);
-	else
+	if (flags & TEST_BUSY) {
+		igt_assert_lt_double(95.0, percent);
+		igt_assert_lt_double(percent, 105.0);
+	} else {
 		igt_assert(!percent);
+	}
 }
 
 static void
-- 
2.43.0

