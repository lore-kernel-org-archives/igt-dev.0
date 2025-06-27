Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A675AC7EE31
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 07:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0FF10E1DB;
	Fri, 27 Jun 2025 07:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfdxT/2J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9828410E1DB
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 07:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751009998; x=1782545998;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IH+ZHlED05lRfZ3yG2l32akkwax/iBQkrHXHpZfwhks=;
 b=FfdxT/2JOJdzIAnlQ+tH9SIV6uYGCd3JWQHs3IFg4r8qukWOK00NmpcA
 jTB2kW4i5RIGoy01V9QKhJxRhYQK45AmvKwYa55+j/yXqZKpUqL7pBPT4
 Q1vXl1AF153b7xjLrOivzW4Q17xIKyWprzxAKJ1uaGsJGxogoH61cQ21S
 DsG0stkS/2Ie7fbAEBEffNHWsr8xsgAWCwewm9219RscGsf8fIst7sGjI
 5b3UGlK1iW2GYaP8ee7u7mhQZPAq1P4dsmnp/yRowSykFRBlbsS0qDcKN
 oNK9DD3XFvxOUuBZt/O8yf/pnwi/WtB/zLoSMFeKl5qPbejBBCQlIASzT A==;
X-CSE-ConnectionGUID: Va+q1xXhSlSrKZwxVuPEHQ==
X-CSE-MsgGUID: TSEf5FAsRmSW/JBWgUAFvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52550976"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="52550976"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 00:39:57 -0700
X-CSE-ConnectionGUID: 4MXFAYjbTUOotVgXdS04aw==
X-CSE-MsgGUID: B/Lc/yZ9T5yO8ZPjla0+hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="189930759"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 00:39:55 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/1] tests/intel/xe_eudebug: move multigpu
 requirement to test block
Date: Fri, 27 Jun 2025 07:41:33 +0000
Message-Id: <20250627074133.2898426-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

As test fixtures are called regardless whether an associated
test is going to be executed or not, calling eg.
./xe_eudebug --run basic-connect
would execute
igt_require(gpu_count >= 2);
from later in the igt_main function, despite it being
unnecessary and printing a misleading and unrelated
requirements check when ran on single gpu host.

Move igt_require(gpu_count >= 2) from fixture block
to test block.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_eudebug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index bdf73c4e9..d2a1932fb 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -2923,7 +2923,6 @@ igt_main
 	igt_subtest_group {
 		igt_fixture {
 			gpu_count = drm_prepare_filtered_multigpu(DRIVER_XE);
-			igt_require(gpu_count >= 2);
 
 			multigpu_was_enabled = malloc(gpu_count * sizeof(bool));
 			igt_assert(multigpu_was_enabled);
@@ -2935,6 +2934,7 @@ igt_main
 		}
 
 		igt_subtest("multigpu-basic-client") {
+			igt_require(gpu_count >= 2);
 			igt_multi_fork(child, gpu_count) {
 				fd = drm_open_filtered_card(child);
 				igt_assert_f(fd > 0, "cannot open gpu-%d, errno=%d\n",
@@ -2948,6 +2948,7 @@ igt_main
 		}
 
 		igt_subtest("multigpu-basic-client-many") {
+			igt_require(gpu_count >= 2);
 			igt_multi_fork(child, gpu_count) {
 				fd = drm_open_filtered_card(child);
 				igt_assert_f(fd > 0, "cannot open gpu-%d, errno=%d\n",
-- 
2.34.1

