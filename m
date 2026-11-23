Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44DA606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OzRUgWOz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872D410E100;
	Mon, 23 Nov 2026 08:27:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2052910E2E6
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795422400; x=1826958400;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Da3YtWcVRO11jafAAYUMtuyBcg3IEXukxRSUHuKBWk=;
 b=OzRUgWOz+F3QYvg1FrfciBnJuNEAtUC3iarpEjnEic+GwfEN/Yohyjwv
 RAr7WePz94ABNCNPx6+dVxKqSbDNir2Lb3Kwj0ZKZJOJJ+hsgfX3kxCRz
 bdNsM183eQp0OC/PpehEr4FM+F+QeXyadZelnZNp3Jh8/1Rv8emVWJI6g
 yJu1/wizHKlpyy36QZdp/Pis6RSdepulMta8N1kkL4yNKvSs/gaWzACp/
 cUJL6q9vKfrhUkEnup5/Zto6Iep7+2XJns3uwKSPpvdbG/MIKPURxzu0b
 iArvW+hamSdQcSZRKT2JaLUenLbNvaBdXpgMB7UDEDfmGPqzCAw490CuH g==;
X-CSE-ConnectionGUID: tIZKECOXTlGoR2jEAKCj1w==
X-CSE-MsgGUID: G1Jm3TyWRE20USYjHqJSFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4326063"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4326063"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 00:26:40 -0800
X-CSE-ConnectionGUID: c4kQKTVeTLOi6pQEIhntEw==
X-CSE-MsgGUID: 7A3TbAbzTt+WxYbmCu4Ekw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11190820"
Received: from avandhic-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 00:26:38 -0800
From: Avandhica S R <avandhica.s.r@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	avandhica.s.r@intel.com
Subject: [PATCH i-g-t v1] Fix removed device drop
Date: Mon, 23 Nov 2026 13:57:06 +0530
Message-ID: <20261123082706.581436-1-avandhica.s.r@intel.com>
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

