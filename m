Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2267DC7115A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 06:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67AF10E2AF;
	Mon, 16 Jun 2025 06:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UR9Nvodz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EF610E2AF
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 06:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750055949; x=1781591949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=alC6LQMqHysMmD86op+4iDbPz9b5aFYM2aADMTUSkJI=;
 b=UR9NvodzN5LQD2pk9mi1VOawe0ipkAssKZl9lHVUEodoMJ3M867rLpIB
 ksiLv093K63S+4SCXpW4NNs3uUof8Oi/PY876YkotvTZ+JqG/2H3jwPQ3
 /4UKvjnnrYUvS+ooxS0CJzmyv9noieYv4Pq2xNrwtzkaRLSuFv4pWcHre
 WaZH3Db9+KvTyBwaYMgtcdgxHn0VsSBV0b0olTb13RY4QDQWgw4AzCatT
 38k1EuZBRaziZcGft4O5+1PLtYYG6XLJSqsJpxzB/UHM4CMdTGMIDIU0/
 /qZc8R2h2nvKQJ1/g/Vkcg4o8ZBT6ayQybu+28EF4tjpltbRw2NeFG9RH Q==;
X-CSE-ConnectionGUID: JiyWX8h6TC+a+TBWqSvN7w==
X-CSE-MsgGUID: 5ptVu7PDSemuy0/hvmn94A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52280816"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="52280816"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:39:09 -0700
X-CSE-ConnectionGUID: 3dH00bdJTP6+LMNOx68ZCg==
X-CSE-MsgGUID: dfB21sUwQBm2mTH/7Er1Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153535996"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:39:08 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, uma.shankar@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 3/5] tests/kms_flip: Increase test duration for
 flip-vs-wf_vblank
Date: Mon, 16 Jun 2025 12:08:29 +0530
Message-ID: <20250616063831.3332042-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
References: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
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
index 2328259ba..5873591fa 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -2026,7 +2026,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 		{ 30, TEST_FLIP | TEST_VBLANK | TEST_VBLANK_ABSOLUTE |
 		      TEST_CHECK_TS, "flip-vs-absolute-wf_vblank" },
-		{ 2, TEST_FLIP | TEST_VBLANK | TEST_CHECK_TS | TEST_BASIC,
+		{ 30, TEST_FLIP | TEST_VBLANK | TEST_CHECK_TS | TEST_BASIC,
 					"flip-vs-wf_vblank" },
 		{ 30, TEST_FLIP | TEST_VBLANK | TEST_VBLANK_BLOCK |
 			TEST_CHECK_TS, "flip-vs-blocking-wf-vblank" },
-- 
2.43.0

