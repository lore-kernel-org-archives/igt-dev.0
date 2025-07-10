Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D57DC83F17
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 19:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F1C10E23A;
	Thu, 10 Jul 2025 19:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdApFV94";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C3910E23A
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 19:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752176802; x=1783712802;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3vONMAqGrwSaBjgvjYQzpEI39/ItFfPbnoI8vZ43clw=;
 b=cdApFV94xvwkZsysn2f7iKL16dGgj8NcwaA5nxBy4Aft/ATy4NA+64Ln
 acTdXoWvbuZO2m54zn9aF5hk60s/5A2w44dhU7fAsxlffPgx1eec1RtaY
 YkP7UNKlZ+EfYLXxWQ4Uc075Y1ajKiqE1hkk8e5vbIB8MzFXcUVVXPkhB
 KmadIEn7vTFallMsYmIhAJNGFYFISoATWhEBcjAFyX5VZ1DE9ptjaPgg+
 Imqh8QFCGaND1IW0rAdLYHO86jasaP1DQvPNNz2TCcpObXmoneDiL6Eax
 mz88LfRRdh01Z/fBK/fc8TopUvUEBfqS5IF3uTLzYvF0eXSo4ND1soECg w==;
X-CSE-ConnectionGUID: XbM092kZR3qF/lPXgffKsg==
X-CSE-MsgGUID: na7FbUU+RsGFFhU9wLgSig==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54625815"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="54625815"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:46:42 -0700
X-CSE-ConnectionGUID: mcz8/7wUTpScFs7xz1fRcQ==
X-CSE-MsgGUID: d2d589aiR9udo3OJNQSn4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="155811089"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:46:41 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: peter.senna@linux.intel.com, kamil.konieczny@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] lib/igt_kms: Update igt_fit_modes_in_bw to add legacy
 commit check
Date: Fri, 11 Jul 2025 01:16:43 +0530
Message-ID: <20250710194643.977386-1-karthik.b.s@intel.com>
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

Currently igt_fit_modes_in_bw is only checking for atomic commit but the
igt_override_all_active_output_modes_to_fit_bw function which it is
wrapping actually has support for legacy commit as well.

To handle this, add support for legacy commit check as well.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_kms.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 84ba1635c..7dee8ab2c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5061,9 +5061,13 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
 {
 	int ret;
 
-	ret = igt_display_try_commit_atomic(display,
-					    DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (display->is_atomic)
+		ret = igt_display_try_commit_atomic(display,
+						    DRM_MODE_ATOMIC_TEST_ONLY |
+						    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	else
+		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
+
 	if (ret != 0) {
 		bool found;
 
-- 
2.43.0

