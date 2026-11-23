Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38C5606A31E
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 07:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cCdIkPit
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52ECA10E0C8;
	Mon, 23 Nov 2026 07:58:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B06F10E0C8
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 07:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795420620; x=1826956620;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Da3YtWcVRO11jafAAYUMtuyBcg3IEXukxRSUHuKBWk=;
 b=cCdIkPitePey747S01fBRoNpeufnVeumICaYnkuwSMEY3711gBx7U8fN
 wfNMHlcRGXtaKC5xa6FpfMfEjUJZaZ53UYaSXRkl/JB2WiayarVpcVT2x
 b8dWWN/xkCKJZygLSs+r3gKnuXJP58As/oe5bhvYfLKYEYaoocLYEC/NQ
 h7iCHNQq+h5eYowU4UcGqxN3xWJdBBkQfNMfNtDoAlgTcZImDNoxybGNo
 a+QSXmV6XqSEqCYKMgXE+bOgozrWOuIjgfCmJmwIAfQcx8fL9KPNv83tp
 zPYygn35Yggn6jozCPVtYzCdmNLVsrj1c2x5VB8mxyT4E9fM/VCZp65+K w==;
X-CSE-ConnectionGUID: qsjrQlI0Tl2Tf1XvZR9a3A==
X-CSE-MsgGUID: /A/zJbnaQYy3tWdl+fpvxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4120119"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4120119"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 23:56:59 -0800
X-CSE-ConnectionGUID: 54ciPm1bSH+7UvUnVTzFAQ==
X-CSE-MsgGUID: KdKwK77CTxOJY+6c+GFo8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11108371"
Received: from avandhic-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 23:56:57 -0800
From: Avandhica S R <avandhica.s.r@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sowmiya.s@intel.com,
	avandhica.s.r@intel.com
Subject: [PATCH i-g-t v1] Fix removed device drop
Date: Mon, 23 Nov 2026 13:27:04 +0530
Message-ID: <20261123075704.581120-1-avandhica.s.r@intel.com>
X-Mailer: git-send-email 2.53.0
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

igt_device_drop_master(drm->fd); at tear down drops the master and for
the next subtest it enters without master fd and tries to unset all
crtcs that makes test assertion to fail.

Signed-off-by: Avandhica S R <avandhica.s.r@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 378d0ea8a..17c7a989f 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -343,7 +343,6 @@ static void restore_fbcon(struct drm_info *drm)
 {
 	kmstest_unset_all_crtcs(drm->fd, drm->res);
 	igt_remove_fb(drm->fd, &drm->fb);
-	igt_device_drop_master(drm->fd);
 	kmstest_set_vt_text_mode();
 }
 
-- 
2.53.0

