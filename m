Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7873BE9B262
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 13:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2315D10E582;
	Tue, 24 Feb 2026 13:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZgggjXw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D803C10E584
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 13:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771939983; x=1803475983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dQ92gT1JclPCRQt8W/5B8ufMjyJUgp25ACI24c5L/IM=;
 b=kZgggjXw09JC67bHhyAQWj5v43VX3wdxME6AKNIl5TQnQ/Lx+eaw+ARr
 17BHNYN5qkCkbh2gpNXdawhOHFJqOwgqNWlAq4eDmadIPEgXMk12TnndE
 dqj/e4YjdBvyoMpWbZxA2zvl/8SFsJ1xSL4gNqowWfyeJ+HjOl0HKjPNd
 6KlCR9CFq/BQpBuJ34w2rp516CuTP6b55DweBOUDiPh64ZdcJHqljuChb
 xDQyJweCnOiA3hJkssXoP38MVROfUibGNNAWpStHRSk55NYrAe+8tznqz
 HlHIRIsK33jg4ZPfSrjcpVltxPRyIm8VhEA3O1Bt/fPiVLmO7M/A/S83h w==;
X-CSE-ConnectionGUID: N0Xlgp5cTkylsR/rQEsLrA==
X-CSE-MsgGUID: Apx4fNmLSSKduKaphfPkjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84410062"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="84410062"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:33:03 -0800
X-CSE-ConnectionGUID: 7ktkUh5rTESPsgy61t3ciQ==
X-CSE-MsgGUID: 4XvaZ7f2Re+3H0gS7Cpwyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="246476846"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 24 Feb 2026 05:33:02 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t 5/6] tests/kms_flip: initialize global devid
Date: Tue, 24 Feb 2026 14:32:41 +0100
Message-ID: <20260224133242.1678232-6-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260224133242.1678232-1-michal.grzelak@intel.com>
References: <20260224133242.1678232-1-michal.grzelak@intel.com>
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
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Global variable devid is never initialize. Init it at start of the test.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index ae38096aa..5b3c31ff5 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -2142,6 +2142,8 @@ int igt_main_args("cep", NULL, help_str, opt_handler, NULL)
 	igt_fixture() {
 		drm_fd = drm_open_driver_master(DRIVER_ANY);
 
+		devid = intel_get_drm_devid(drm_fd);
+
 		igt_display_require(&display, drm_fd);
 
 		kmstest_set_vt_graphics_mode();
-- 
2.45.2

