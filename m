Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03DD606A329
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 18:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lQ/EoGdx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C3010E430;
	Fri,  6 Nov 2026 18:15:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2291110E1B1
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 18:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793988548; x=1825524548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eNi0BeRg1aeYsyW51F3MyePIgXy2nuE8Emh6ocNUNRc=;
 b=lQ/EoGdxyQah1Pb/+ChLD3Js/C8kstLnJnLoX7VUelrsN/VOoVsIFfkk
 Q3kG9fE74q0yg/AUjlxRG7cKA4PHDUMToO8VK95r+HIX2ccHWGF7X1GeM
 XC7kg8Pgvxewk+5EhS0QMNQ6v0YcJwENJxVtVSJ/Ix+t0ZRwHK3ThpAYM
 5xqvJvYgGODDKMvH8xDYQky+kdXELyd0kVD37Ua9NpLwZj98H36ix3CVn
 /2eLnBEbVPvViHNJsm/TYiiDLKSs6RIcSdleDnzTqt77r1MiF2Lb4RAy9
 e9TjNfJ0n9cJb0gVou3BoNWr2G12vHduG+3gPobyhdA1BjvDebVB21c84 w==;
X-CSE-ConnectionGUID: Zdd6gqcgSEqB1UvHEwrflQ==
X-CSE-MsgGUID: VKrhO2Q9RHWqz4iACKVFgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2723913"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2723913"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:09:08 -0800
X-CSE-ConnectionGUID: nSMuObJARyyvQI/Lkf0bMg==
X-CSE-MsgGUID: Mk1bZy3TQgKSpm814VYn+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7362617"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:09:07 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v9 3/9] tests/kms_async_flips: limit #pipes tested
 during suspend
Date: Fri,  6 Nov 2026 19:08:43 +0100
Message-ID: <20261106180849.156578-4-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261106180849.156578-1-michal.grzelak@linux.intel.com>
References: <20261106180849.156578-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Test suspend on first and last pipe by default.

Alternatively test could be run on first and last CRTC; but due to pipe
reordering, this would result in using arbitrary pipes. Thus set first
and last pipe as the only available in suspend resume case.

v7->v8
- use pipe mask (Jani)

v6->v7
- use hardware pipe instead of CRTC (J-P, Jani)

v5->v6
- describe how pipe reordering affects the test (Jani)

v3->v4
- use crtc instead of display->crtcs (Thasleem)
- use proper logic operator (Thasleem)

v2->v3
- add missing S-O-B

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/kms_async_flips.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index a548c73cd9..1d930260c6 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -298,7 +298,9 @@ static bool set_available_hw_pipes(data_t *data)
 
 	for_each_crtc(&data->display, crtc) {
 		hw_pipe = crtc->hardware_pipe;
-		data->available_pipes[hw_pipe] = true;
+
+		if (data->suspend_resume)
+			data->available_pipes[hw_pipe] = true;
 
 		if (last_pipe < hw_pipe)
 			last_pipe = hw_pipe;
@@ -310,6 +312,9 @@ static bool set_available_hw_pipes(data_t *data)
 	if (first_pipe == IGT_MAX_PIPES || last_pipe == PIPE_NONE)
 	        return false;
 
+	data->available_pipes[first_pipe] = true;
+	data->available_pipes[last_pipe] = true;
+
 	return true;
 }
 
@@ -1227,8 +1232,8 @@ int igt_main()
 
 	igt_describe("Verify the async flip functionality after suspend and resume cycle");
 	igt_subtest_with_dynamic("async-flip-suspend-resume") {
-		test_init_ops(&data);
 		data.suspend_resume = true;
+		test_init_ops(&data);
 		run_test(&data, test_async_flip);
 		data.suspend_resume = false;
 	}
-- 
2.45.2

