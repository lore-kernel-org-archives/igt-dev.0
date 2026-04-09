Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE730E98FC0
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 06:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B17710E718;
	Thu,  9 Apr 2026 06:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OM74Bztz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5B710E718
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 06:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775715493; x=1807251493;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6xBOgTRjmiMqFzO3dVWBC29VRmz0QLsC35FVW5PJ4GA=;
 b=OM74BztzF5rUmU+nUDmLpcYCaO3Fs1vhmrB2AClD7N9UgmnFNgGwFyyC
 DHNJcNS8i0CdS3TOQRnET+YOCRVjkQExdyaiCtW6A9AoVgOyTPwUuN2PA
 V+6zxEzqPfc5jUakFGWgopx+T5Nfu7MHigvu7TaJMKxv/gi/ZjP4s8QOa
 oSAkkoc+L3kS568HLCN8eJK7sUBjnUZky8o20WOAv6R6MB5i+aHqqfLF7
 4OUDxWClb9IyHxWAedEpzTzpG0XO3Qt7XQu2Pmxz/WiixCt4bg0uA6p6H
 72utDSa+PT/357SesvD2rV6VzQZX09ZaWUPT9jOzbWl3vUnBinvDws2aK w==;
X-CSE-ConnectionGUID: 2d036ZhmT9OAsDw8SRP6cw==
X-CSE-MsgGUID: Spw+UMnsSG+k25xRUszhWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87337101"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="87337101"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 23:18:12 -0700
X-CSE-ConnectionGUID: tFPMBgpeQEWg5Hu+KFIwNg==
X-CSE-MsgGUID: 4ZH6Oa00Rtq7Dz9Q/76rMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="266659664"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 23:18:11 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/kms_frontbuffer_tracking: Improve skip
 message
Date: Thu,  9 Apr 2026 12:09:24 +0530
Message-ID: <20260409063924.1048289-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

Update the dual‑pipe skip message to explicitly
report that no valid secondary output is available.
This avoids ambiguity when reading test logs.

v2: Address review comments (Ville)
v3: Provide clear commit message (Swati)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index c16f63199..8b73e8505 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2548,7 +2548,7 @@ static void check_test_requirements(const struct test_mode *t)
 {
 	if (t->pipes == PIPE_DUAL)
 		igt_require_f(scnd_mode_params.output,
-			    "Can't test dual pipes with the current outputs\n");
+			      "no valid secondary output available for dual-pipe tests\n");
 
 	if (t->feature & FEATURE_FBC)
 		igt_require_f(fbc.can_test,
-- 
2.43.0

