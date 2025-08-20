Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF0BCA0EDC
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 16:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEB510E118;
	Wed, 20 Aug 2025 16:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAMCxlUa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8951D10E118
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755705792; x=1787241792;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZWd8wjdhjfaTVSdOFt5bhLU0W40GomypmmoTC4H2zHc=;
 b=hAMCxlUa0gmiEk2wL8ZBjSDZvPLSOlsW4CrxFj35k/2Ly9Cx6IERDQcb
 rtFvGY5SbZQlqHAFQJnSBr1i0hdBh67HMyBymLFMXwiY1G9ztGxrRgoDT
 WLoftjVwjZZnidTYrE47z/Btg5xhA0/HGOfGfvxhYSXUdozkvUyGAyP6P
 t45SAYGnPGRC8KI4JfbZjuglW1xOYIm3xYK7sVhNUQ0UYlRJBmrI3eF32
 OxTDQWZJFc+Rn0tapA3lBMknCTXSWbH+M89OrBfZJIRCpv1BDKhr9/DMq
 mDpZ8Q1ZeyIuHksKiQ6CyH2Z7/trPqMdm0UvzCbuc0KmjIOutx567GQmd A==;
X-CSE-ConnectionGUID: cpM4faN8SdqfpfXBQkoOPw==
X-CSE-MsgGUID: dlC5/qKQR1a5VPuVYrKf7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57907562"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57907562"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 09:03:12 -0700
X-CSE-ConnectionGUID: ig7yqnw1SLGraSkb4YlcDg==
X-CSE-MsgGUID: azi5HQWJQx6A4jYi8Wn49A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167386239"
Received: from tmistat.igk.intel.com ([10.91.214.42])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 09:03:09 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_sriov_flr: Update Sub-category name
Date: Wed, 20 Aug 2025 16:45:21 +0000
Message-Id: <20250820164521.481669-1-jakub1.kolakowski@intel.com>
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

The general guideline for naming is that given Sub-category can only
be included in one Mega feature. Currently 'Reset tests'
Sub-category is present both in 'SR-IOV' Mega feature and 'General
Core features' Mega feature.
Change 'Reset tests' name in 'SR-IOV' Mega feature to 'SR-IOV Reset
tests'

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Pawel Sikora <pawel.sikora@intel.com>
---
 tests/intel/xe_sriov_flr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 0c6a0c97e..fc08703c0 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -21,7 +21,7 @@
  * TEST: xe_sriov_flr
  * Category: Core
  * Mega feature: SR-IOV
- * Sub-category: Reset tests
+ * Sub-category: SR-IOV Reset tests
  * Functionality: FLR
  * Description: Examine behavior of SR-IOV VF FLR
  *
-- 
2.25.1

