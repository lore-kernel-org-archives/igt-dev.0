Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC305E7718A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 16:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5763A10E353;
	Thu, 19 Dec 2024 16:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4J1NIbI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9EE10E0DB
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 16:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734626567; x=1766162567;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LzcHHIaMa//mioWsvMJx8c5jbBvppvtJfmt/GJc0yVA=;
 b=G4J1NIbIzUL+NG82B4sx3IESAzP93DUHyTmFOD1DDSx5aTaUlRltgmdR
 OY7TLg7/AUzyStgcH2Z535/3/rc7hzyX9nKce53576qBxeIVz7LkdY5ks
 GhOGmjPIMTu2jFhVm/fE6bUDsJN9N+gXUlj1qFy4L0UZFZM2yk4+vV3WN
 aeA2ePi3zFlCy92r96A8Iakp/0l2sRyEmrzyUrmdNaX3a6PSjOibpabvG
 Yc06stYC832U2MlXO2wxalq2qlsBFm3WKB3Wj/HFv7j8+UFADFZBXtNvS
 PkyAamY9PJBtwCHdBQVhXU/0v86Zh9z9vQYJMqpJ1gDrq/dN5L5EtmfyQ g==;
X-CSE-ConnectionGUID: vpNUnmRxQomqF3fSxXvB/A==
X-CSE-MsgGUID: QrtO4qJiQByouDVScizEnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35362642"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35362642"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 08:42:46 -0800
X-CSE-ConnectionGUID: KpwYKmrSTVq3yxkK1G4zNQ==
X-CSE-MsgGUID: VWs81xtiTZuLKCuuFWwJZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99069637"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.145.162.161])
 by orviesa008.jf.intel.com with ESMTP; 19 Dec 2024 08:42:44 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/kms_lease: Add vblank count to avoind resource
 busy
Date: Thu, 19 Dec 2024 22:09:38 +0530
Message-Id: <20241219163938.475114-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add vblank count to avoind resource busy so that page flip to be
happen without any sync issue while setting a mode on leased output.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 0f3a68fed..0fbf5b0ba 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -378,8 +378,8 @@ static void page_flip_implicit_plane(data_t *data)
 
 	display = &data->master.display;
 
-	igt_wait_for_vblank(data->master.fd,
-			display->pipes[pipe].crtc_offset);
+	igt_wait_for_vblank_count(data->master.fd,
+				  display->pipes[pipe].crtc_offset, 2);
 
 	do_or_die(drmModePageFlip(data->lease.fd, data->crtc_id,
 			      data->master.primary_fb.fb_id,
-- 
2.25.1

