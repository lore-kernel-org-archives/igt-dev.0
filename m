Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8309C3ABC5
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 04:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AC610E085;
	Wed, 14 May 2025 04:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HW+fLjmN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86FA10E085
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 04:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747197042; x=1778733042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cmgdTAoHC+V9wu7fwCXe+AlyBgheZ62yBnPYvK6KSq0=;
 b=HW+fLjmNkw6g2heLfF69tnM/i4aGD5xE8xfBEUmr1iYNKNRRUZ3goXj7
 985rpX0FlLljWxJcmJwE/yQmaauHDotw5iSX3m0Sw+mqKOSxViAggA+mZ
 bXK65bLzUOK5PYdWg08lVWEW1s6gA+ltd13VT+FyKhFhabO8VgeOGlMZP
 UEYe4HN3Q6ISWINVW6adIGfti8LPFUBXGX3EmWRxC0Q9a6T33NW8q9hY/
 7LM/iy0PDDofUSED/DvBQodZmDbAPcdiQDZr7ipf273XkwnIhMaewu40i
 uQRlzF1O5Yps3LMoxqxykMTcQoxzgLPzFxKfSFLO1rN4vTtLYMvzw3mW7 w==;
X-CSE-ConnectionGUID: tzMT/HTjStaJ1sLOGurfRA==
X-CSE-MsgGUID: Fa5LurVJRu2xVoPBfaEB1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48325301"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="48325301"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 21:30:37 -0700
X-CSE-ConnectionGUID: hN9W77VlRZadcgM+VzPt1w==
X-CSE-MsgGUID: NgFCiY6UTE29r7ddOyQr6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="138411701"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa010.fm.intel.com with ESMTP; 13 May 2025 21:30:35 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>
Subject: [PATCH i-g-t] Revert "tests/intel/xe_fault_injection: Suppress GuC CT
 dumps"
Date: Wed, 14 May 2025 10:16:51 +0530
Message-ID: <20250514044651.14898-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

This commit has dependency on a commit from XE. The commit from XE is
still in review. So, reverting this commit to avoid CI test failures.

This reverts commit dfe2c08db120d49e8b0ea92f20d09d6b60343da8.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
--
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel/xe_fault_injection.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 10374d23e..f9bd5c761 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -123,22 +123,6 @@ static void injection_list_add(const char function_name[])
 	close(dir);
 }
 
-static void injection_list_append(const char function_name[])
-{
-	int dir, fd, ret;
-
-	dir = fail_function_open();
-	igt_assert_lte(0, dir);
-
-	fd = openat(dir, "inject", O_WRONLY | O_APPEND);
-	ret = write(fd, function_name, strlen(function_name));
-
-	close(fd);
-	close(dir);
-
-	igt_assert_lte(0, ret);
-}
-
 static void injection_list_remove(const char function_name[])
 {
 	int dir;
@@ -252,10 +236,6 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 
 	ignore_faults_in_dmesg(function_name);
 	injection_list_add(function_name);
-	if (!strcmp(function_name, "xe_guc_ct_send_recv") ||
-	    !strcmp(function_name, "xe_guc_mmio_send_recv"))
-		injection_list_append("xe_should_fail_ct_dead_capture");
-
 	set_retval(function_name, INJECT_ERRNO);
 
 	igt_kmod_bind("xe", pci_slot);
@@ -293,8 +273,6 @@ static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
 	for (int i = iter_start; i < iter_end; i++) {
 		fault_params->space = i;
 		setup_injection_fault(fault_params);
-		/* Clear the injection list  */
-		injection_list_clear();
 		inject_fault_probe(fd, pci_slot, function_name);
 		igt_kmod_unbind("xe", pci_slot);
 	}
-- 
2.43.0

