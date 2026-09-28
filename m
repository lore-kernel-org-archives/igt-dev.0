Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0679CA5FA3
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 18:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C7A10EB70;
	Mon, 28 Sep 2026 18:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xn9oEFNP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AC110EB6E
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 18:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790621844; x=1822157844;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N3sEZdnlBL5OpSSkkMAK6XbvG5LOQFtUgkLc0k0thG0=;
 b=Xn9oEFNPTypV3/Gj6659pNORG+nsOfG0JLTNP8E6K+KAqGzbqmY/SqEV
 +JhljPaDoUFGQGAAio/k+sG8Aw165cBsNzmD1b2zyZltPY1o2UY0Xv5hr
 zJbmOMWEd6CMntOsz62q+SWSHYr4DOrW/ttuVWYpt0nJKoDigmADGQ/XU
 sszm1rPwuHkzhZSIKjFXaMNdocFSxaUv+2ASFTtDZI6NAx7Z94un1udw5
 JYoMmNLE/D4gHS7TXh2rPYLNx7p65BK1KT+PdbeG7giH0VgM9QQnmv25y
 F1M5fKta6Rsiqu9ivU8F860iRbqtOiuucg7aD9eZWXVy6metkSejk66fW A==;
X-CSE-ConnectionGUID: piqGF2U2RgKSo/Ub5NPGQw==
X-CSE-MsgGUID: 5c3rrszERcOhUpWrKKKkCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="93821491"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="93821491"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 11:57:23 -0700
X-CSE-ConnectionGUID: /srQbnXER7Ob/A4NNLDS3w==
X-CSE-MsgGUID: stHj1N1ZS7OUgzkkQo202A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="272927719"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 11:57:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 soham.purkait@intel.com
Subject: [PATCH] tests/intel/xe_pmu: Fix test to accept single VF configs
Date: Mon, 28 Sep 2026 11:57:18 -0700
Message-ID: <20260928185717.2846223-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
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

Some platforms my support just one VF, so remove the need for 2 VFs in
the tests.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_pmu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 364e643fe5bb..d41ebba1faef 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -982,7 +982,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 
 static unsigned int enable_and_provision_vfs(int fd)
 {
-	unsigned int num_vfs, vf;
+	unsigned int num_vfs, vf, total_vfs;
 	uint32_t pf_exec_quantum_ms = 64, vf_exec_quantum_ms = 32;
 	uint32_t pf_preempt_timeout_us = 64000, vf_preempt_timeout_us = 32000;
 
@@ -995,11 +995,13 @@ static unsigned int enable_and_provision_vfs(int fd)
 				       NULL);
 	autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
 
+	total_vfs = igt_sriov_get_total_vfs(fd);
+	num_vfs = total_vfs > 2 ? 2 : total_vfs;
+
 	/* Enable VF's */
 	igt_sriov_disable_driver_autoprobe(fd);
-	igt_sriov_enable_vfs(fd, 2);
-	num_vfs = igt_sriov_get_enabled_vfs(fd);
-	igt_require(num_vfs == 2);
+	igt_sriov_enable_vfs(fd, num_vfs);
+	igt_require(igt_sriov_get_enabled_vfs(fd) == num_vfs);
 
 	/* Set 32ms for VF execution quantum and 64ms for PF execution quantum */
 	xe_sriov_admin_bulk_set_exec_quantum_ms(fd, vf_exec_quantum_ms);
-- 
2.53.0

