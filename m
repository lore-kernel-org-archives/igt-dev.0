Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3F0C3ABBC
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 05:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECF310E1FB;
	Fri,  9 May 2025 05:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVqongy/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3BE10E1FB
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 05:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767664; x=1778303664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vjd/nke/8cNwY7xwBWBlSu/Wu+44KRWeBcskIibROVk=;
 b=HVqongy/pKPcv55WcRh8Tcn7OBsKrLi/Rf90oozBwksjLC620xeAIRvR
 OnJep1H5FcUcLzAcRJPSQSsazdNIen8KApAnKMMlFnE+kkkfFt7TEFA+2
 EJARMLIDixeR664sbcnDItHrwXCYZk0EGygzmiyohP5qPFKmysZhNhbar
 nzUhv1FMyLKm1dmYaID+9wxEc0+9vfKmOpdG4GeJ7tkkXxiROGUQQ6Ff1
 wBPsnmnvBBb/9mbataUB11TlC/FTfA+r84IEnNTZ3bpjMYNWH11FzU1Or
 OPdB81LVybEgw2Aza86TCyFBKo9QRa99uLGD+gCXY6EPAwKx2EADPQbiM A==;
X-CSE-ConnectionGUID: D4ABvAQVQq+0g8lAvQxWZA==
X-CSE-MsgGUID: B/sZy/OqToisp9vmLA9ZqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48286632"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48286632"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:14:24 -0700
X-CSE-ConnectionGUID: PODCTUwoS3CjAO87Q9b6eQ==
X-CSE-MsgGUID: y3KCwrtJSZ2ZZa6JH5w9Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="140566421"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:14:21 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 2/3] tests/kms_flip: Increase test duration for
 flip-vs-wf_vblank
Date: Fri,  9 May 2025 10:43:51 +0530
Message-ID: <20250509051352.1607604-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509051352.1607604-1-ramanaidu.naladala@intel.com>
References: <20250509051352.1607604-1-ramanaidu.naladala@intel.com>
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

Boost testing and coverage for lower refresh rate panels.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_flip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 4d40ed26a..91e9da690 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -2016,7 +2016,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 		{ 30, TEST_FLIP | TEST_VBLANK | TEST_VBLANK_ABSOLUTE |
 		      TEST_CHECK_TS, "flip-vs-absolute-wf_vblank" },
-		{ 2, TEST_FLIP | TEST_VBLANK | TEST_CHECK_TS | TEST_BASIC,
+		{ 30, TEST_FLIP | TEST_VBLANK | TEST_CHECK_TS | TEST_BASIC,
 					"flip-vs-wf_vblank" },
 		{ 30, TEST_FLIP | TEST_VBLANK | TEST_VBLANK_BLOCK |
 			TEST_CHECK_TS, "flip-vs-blocking-wf-vblank" },
-- 
2.43.0

