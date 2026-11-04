Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F426606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 03:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XQfJetP6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4129910E1B6;
	Wed,  4 Nov 2026 03:51:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0703810E1B6
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 03:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793764212; x=1825300212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D+reOEJXwPEEPBik3Ymzm3VMxhJwPAVxfumRtyy5io8=;
 b=XQfJetP6HuV3vr015ZgcRQOYQ2XuHxdU0Rhc+N8FYqE/0GbD8PhjDED7
 SqpJp0kyxUkEn0/SmE13iyMeWGQyE1MQLpdw7eDdCVm8+7lGaLIgWgx9c
 ubE64o8vnPipg0EEVMN5RY9o6AC6rc2nJ+lZZNHKQe4m0qe0uuxyet44r
 EbSS3QfDO+29l3DSkW2GX7KZSEQ3tYLTz1+ArJU4pRzFUYWcg8Ljm/Ikk
 v/uU0Xwj1F+EPoksTap/U8STxlWuP44LJ4UUGgoSgL5Rs9cqCrhq0ww6I
 dm2ev3h0RqjeK3PBXfBUkFUiRJJJnQBL2ymeP83NcqXOW59+9NV+JDv6A A==;
X-CSE-ConnectionGUID: A5q7xhHzSJO1qeV2jI/89w==
X-CSE-MsgGUID: yXNs+n3ERty/Hy+0TZrt+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2382659"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2382659"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 19:50:11 -0800
X-CSE-ConnectionGUID: r1Ln4NSFThWP1dzGUqdi+w==
X-CSE-MsgGUID: 9sFQtpoUTxKPgEpg2ov5hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6681059"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 19:50:10 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_force_connector_basic: Add skip reason for
 missing VGA/HDMI connector
Date: Wed,  4 Nov 2026 09:20:01 +0530
Message-ID: <20261104035001.1225023-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

igt_require(connector_id) only printed the bare variable name on skip,
giving no indication of why the test was skipped. Use igt_require_f()
to state that no VGA or HDMI connector was found for better test
diagnostics.

v2: Improved message (Kamil)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_force_connector_basic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index c4252ea02..dac507da9 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -392,7 +392,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, NULL)
 			drmModeFreeConnector(connector);
 		}
 
-		igt_require(connector_id);
+		igt_require_f(connector_id, "no VGA nor HDMI connector found\n");
 
 end:
 		/* Reacquire status after clearing any previous overrides. */
-- 
2.43.0

