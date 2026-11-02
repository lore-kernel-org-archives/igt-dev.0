Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE80606A324
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kWdRJEaV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19D710EDC5;
	Mon,  2 Nov 2026 13:06:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8F910EDE3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 13:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793624702; x=1825160702;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vhrTN0pYmuFFnmlvfhuQQiw5qDC7mAszEwSoh4VPnBw=;
 b=kWdRJEaVC8wGUfl5LB5rMz8uYD1bvlIxPJIYBl3Jx+wy6epxJQV4c7su
 gd0DlRWPx0LyEbJjPKKQ0AqPR6bfGQYsEP5t92EBzODANR3ILhntuE3N4
 cGItjlITgQ5RmBGXRfIGW/92B9rP7bKSdnzCeBchYRiWAbm0IGE17xUHu
 Dc6ha7E4ZrQPC9qNqKSmPYERQoIv6g/1WLONTDQacoFXS+Kwsz+PNhoVg
 dXhfhQgWFlcagf0HgViS8eCF6eDL9r4EzoLy1f7ilCYg8wnu/8QJ+QyDo
 1fm5SHdFhTfIrMkM5crbW/4fECKOc7XI+LttiMfIxq9raoOE2x/X2ijw9 Q==;
X-CSE-ConnectionGUID: pspPNAilRdSgOWVuedxcPQ==
X-CSE-MsgGUID: nIBF1oHmTZ+Peaw0+R3eRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2340580"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2340580"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 05:05:02 -0800
X-CSE-ConnectionGUID: 6QsHFuAJQhOTqNjznrKnVw==
X-CSE-MsgGUID: +EmkmJ4JTiiQYoFGCSUT+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6204657"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 05:05:01 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_force_connector_basic: Add skip reason for
 missing VGA/HDMI connector
Date: Mon,  2 Nov 2026 18:34:51 +0530
Message-ID: <20261102130451.1162404-1-sowmiya.s@intel.com>
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

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_force_connector_basic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index c4252ea02..e09f63a20 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -392,7 +392,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, NULL)
 			drmModeFreeConnector(connector);
 		}
 
-		igt_require(connector_id);
+		igt_require_f(connector_id, "no VGA or HDMI connector found\n");
 
 end:
 		/* Reacquire status after clearing any previous overrides. */
-- 
2.43.0

