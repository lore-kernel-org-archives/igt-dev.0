Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623B7C021A1
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 17:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFD010E740;
	Tue, 11 Feb 2025 17:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7T9sPcM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1766410E740
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 17:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739296216; x=1770832216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bFBBhiYwgV2x8NbP88yY2TWUf1l5+la7vCuR2uzGh94=;
 b=m7T9sPcMkeoX8s64l8iDPzvIgiuWTn5kG0o0e5gsv++3Lsmh0qUVrDah
 OvezvYZ7vpGT9R3E2K87dzTobdZDcoxoqrOTfB3Es5o6EhU44tomaQF+T
 bD5t5UQHorbkJLvCVx+TV+oBX8k4/UOC5wqUgkuazWtRhTRchLvh7VC2V
 83sdK8px8oeo0fQlOIATuM5POe4hsGLOUBBdL97H6QzdJVuztmJVXp8zg
 hc0fqKrIHzhZ/ds7UzUOfHQ8tGDdDa+9WiuU916q3KUX48IiV4ZLd1LBV
 w3LQT6Y6DARnlvyUqeHiJhObFqGiSZH8JN2XTWbPAI/QiN138kY1bU5Bm w==;
X-CSE-ConnectionGUID: TYotk9iyTu+KhP+jF3n45Q==
X-CSE-MsgGUID: 5oanaRqaQoO4VzGu3k9KWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57339104"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="57339104"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:16 -0800
X-CSE-ConnectionGUID: ljB51sl/Ryi3ELY2/mhD+g==
X-CSE-MsgGUID: Sso/IbhmSw2zmdw7JewFrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149767534"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:15 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 6/7] tests/intel/kms_dp_linktrain_fallback: disable
 ignore long hpd
Date: Tue, 11 Feb 2025 23:35:41 +0530
Message-Id: <20250211180542.1430676-7-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250211180542.1430676-1-kunal1.joshi@intel.com>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
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

Some systems may have environment variable IGT_KMS_IGNORE_HPD
set which will ignore hpd, disable it before starting the test.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index d26e25bba..3a335f246 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -634,6 +634,12 @@ igt_main
 			if (current_log_level > 10)
 				igt_drm_debug_level_update(10);
 		}
+		/*
+		 * Some environments may have environment
+		 * variable set to ignore long hpd, disable it for this test
+		 */
+		igt_assert_f(igt_ignore_long_hpd(data.drm_fd, false),
+			     "Unable to disable ignore long hpd\n");
 	}
 
 	igt_subtest("dp-fallback") {
-- 
2.25.1

