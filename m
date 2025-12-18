Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544DAD6ACFF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 12:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE86D10E401;
	Thu, 18 Dec 2025 12:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXHrNgpk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAB810E401
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 12:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766062632; x=1797598632;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dhE4Povlzor4H5LvwI6QWYldBwRKV1j8sgMvJOeiKrQ=;
 b=EXHrNgpkEAHekJ+MsL0TIA8kBxFXzwihgs+llNbh3YcNtwD52AIq1FxR
 UQ70OuWRMji3CJqqWqexZlANT3/x9Ap0Qk+W5MxlcWEcpi6kW91lctPS4
 oeAb7QO2ZT2BuxcN3142kDdMip33RUUuGJXQvTVaj/0AchrLopohC4aS8
 zSAmY4asUbfyixjLGaQOqLZmZ66BRsT0RT/38JITQ3xVkaEXSNiHFShLi
 Vg1ATTukzQ1YzPJn7xeiSUJpBRiDB6FTyHkmJJR3dj6L+VXL8dRv55sxn
 ROY0jYAxzWZnRPoF0+0uyoMSBw7Dtmtt+iKOeTRazL+njMFnyb/8sJrCv w==;
X-CSE-ConnectionGUID: ZUR4a5wkQBaS4YwoZRIT6Q==
X-CSE-MsgGUID: //TQWSfwTa214dvjqA/a+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78329218"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="78329218"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:57:12 -0800
X-CSE-ConnectionGUID: O4xrNbN/SbWlKDADVvILiw==
X-CSE-MsgGUID: ub5BdEtwRumMuXlT5SceZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198478227"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.111])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 04:57:09 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] tests/panthor/panthor_vm: Fix subtest name
Date: Thu, 18 Dec 2025 13:57:03 +0100
Message-ID: <20251218125703.52741-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

All subtests name should be uniqe and unfortunatly last commit
created two with the same name:

grep -n igt_subtest tests/panthor/panthor_vm.c
[cut]
82:     igt_subtest("vm_unbind_identical_hugepage_single") {
101:    igt_subtest("vm_unbind_identical_hugepage_single") {

Fix this and rename second one into vm_unbind_identical_hugepage_single_partial

Cc: "Adrián Larumbe" <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Fixes: 83bb1884b7ab ("panthor: Allow specifying offset when mapping a BO against a VM")
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/panthor/panthor_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
index 2ac867c75..76a669843 100644
--- a/tests/panthor/panthor_vm.c
+++ b/tests/panthor/panthor_vm.c
@@ -98,7 +98,7 @@ int igt_main() {
 	}
 
 	igt_describe("Requested unmapping is identical to existing huge page mapping, but only a subset of the object's pages are mapped in the VM");
-	igt_subtest("vm_unbind_identical_hugepage_single") {
+	igt_subtest("vm_unbind_identical_hugepage_single_partial") {
 		uint32_t vm_id;
 		struct panthor_bo bo;
 		uint64_t bo_size = SZ_4M;
-- 
2.52.0

