Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFC1EA4E0B
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 14:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E4710E501;
	Mon,  2 Mar 2026 14:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2ROlYDe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7891C10E501
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 14:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772460564; x=1803996564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/rFpO0WaX2BZsKEsrWfSeSeFctf2Q508FhLKNtDkyqs=;
 b=Q2ROlYDeTm6OnTJlXYwm0OQmx/vPoXLuBNnZbzQ7VUe0y3LfptAftxZF
 905GRDuBGEo8wSNaMYvb4j9spzct5spYSs9kGnKJj+KQZI0ZagJLxZz/z
 4td4c45lBxuJVm2Du/JQ3xBuX0d4t7Ktnxj4yjvr0rsdMslz3wzU3W5Mt
 h75xU0w+gy5nCESFGAmQJWajyeUDGfntlvrsp9pnqefmnWgxrZZz7ewUX
 mld2+DuaBJp+xxeiOUprn+ItEaFJygDlejcnGEWgfu7ByYqmkfd1jzAUD
 NE5ZJKiH3bTeoRDi680CmootakaOiCWK8Ikr5wfmFwcjRRsUTQa8pGq+h A==;
X-CSE-ConnectionGUID: 8XBkgr5xRSSNjTeQSe05Lw==
X-CSE-MsgGUID: hYPk2UsPRwG42GY+5dL/bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84932947"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="84932947"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:09:23 -0800
X-CSE-ConnectionGUID: 0+pyx7/nQiutJsyyoQrwTw==
X-CSE-MsgGUID: V4VcHkFdSvmwT1dkZic9pQ==
X-ExtLoop1: 1
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:09:22 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_properties: Use per-subtest atomic flag
Date: Mon,  2 Mar 2026 20:00:13 +0530
Message-ID: <20260302143013.264657-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302143013.264657-1-sowmiya.s@intel.com>
References: <20260302143013.264657-1-sowmiya.s@intel.com>
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

Fix subtest dispatch to use the current
test entry’s atomic field (tests[i].atomic)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_properties.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 8ac122850..c3ba2b522 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -1001,10 +1001,10 @@ int igt_main()
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		igt_describe_f("%s\n", tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", tests[i].name) {
-			if (tests->atomic && !display.is_atomic)
+			if (tests[i].atomic && !display.is_atomic)
 				continue;
 
-			tests[i].func(&display, tests->atomic);
+			tests[i].func(&display, tests[i].atomic);
 		}
 	}
 
-- 
2.43.0

