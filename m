Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A87F3ED70
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 04:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D581810E02E;
	Mon, 20 Apr 2026 04:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYSE2O+o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC34310E02E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 04:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776660252; x=1808196252;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b31Qr7y9zCZ2vg2zsf6BaztrOei/Msf4yNz9wREGz78=;
 b=EYSE2O+oipJTI9DtAKh3XY/bkooPn44D0ncW/LoavuEQGjbIq8gvf+XD
 IOXPDmRIMzzJcrdr2+wepttTgSedvarQqmLAj70Qjo9xgBZqBsPzBk30K
 +qrTMtAnFCbLLAjAjgspiAev42qGNJ9LXsIJsN5Mr+Xr63Mmcics/Dxkr
 o441OLca7JKyQCEKl65LgyvW8PnShjJgoqzJXWEsuAWGg74Uipea/W542
 PSFfgOdUvT9Me13wfGjeav7WxxZjPUpiXR5uDT+wmgo2cqEyvim5Y193y
 2fCJSW43sMWA/HQE39VbXQjE3s57O2jLaTnNOhOFtcKC113g6NEr1kryI A==;
X-CSE-ConnectionGUID: 0Az1YKDYTkyhxXQ/PQdywQ==
X-CSE-MsgGUID: SEmUi73cQJ6Ld3fMvjllsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77692244"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="77692244"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 21:44:11 -0700
X-CSE-ConnectionGUID: rgv0lS1+RSWhJMoAWTPsIQ==
X-CSE-MsgGUID: 34+0v/vzTVGKrvyf9RuSfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="236597405"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 21:44:10 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com,
	varun.gupta@intel.com
Subject: [PATCH] tests/xe_madvise: fix cross-compilation error on ARM
Date: Mon, 20 Apr 2026 10:13:39 +0530
Message-ID: <20260420044339.3171967-1-arvind.yadav@intel.com>
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

Casting a pointer to uint64_t triggers -Werror=pointer-to-int-cast
on 32-bit ARM where sizeof(void *) is 4 but sizeof(uint64_t) is 8.

Use igt_assert(ptr == MAP_FAILED) instead of igt_assert_eq_u64()
which avoids the cast entirely.

Suggested-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 805de793a..c728cc5c0 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -198,7 +198,7 @@ static void test_purged_mmap_blocked(int fd)
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
 
 	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
-	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
+	igt_assert(ptr == MAP_FAILED);
 	igt_assert_eq(errno, EINVAL);
 
 	gem_close(fd, bo);
@@ -340,7 +340,7 @@ static void test_dontneed_before_mmap(int fd)
 
 	/* mmap() on a DONTNEED BO must fail with EBUSY. */
 	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
-	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
+	igt_assert(ptr == MAP_FAILED);
 	igt_assert_eq(errno, EBUSY);
 
 	/* Restore to WILLNEED before cleanup */
-- 
2.43.0

