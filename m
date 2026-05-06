Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4153CD3424
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 06:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6358410E4F6;
	Wed,  6 May 2026 06:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Egg3glwd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14BE10E4F6
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 06:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778050557; x=1809586557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GyJARL/k8yFR7c6DC2Y/bzRcIwsb4OogzN40HGXJROI=;
 b=Egg3glwdRtgCsCFQwvwTCUkWer1T+Gd/ZKkpw14yvJxd+qSADE0wPwMJ
 Auh/omu7M6ESNFfRg3PnWldI8up466n11ALtXNEu83knxQD/aZc7VrU1B
 sjQzQCdivTYrhnImcr/sVEGCo4ScTRXBeDr0ZzTX9jYA5Knb5e441C9oT
 1OE+VH0M4SJXC47yHJQCvXEORuxZok3YDF+OrLirCcejYzryuIId24FP9
 9h9IjJ6K8cGl1y3dXnI/jqSRk853pU37FdSm2puuNz+8rgwVfAxPntRsp
 nSFY8BvqKyB0l9NTMvSggxdKmRkTRl8Q9lURS+i/OgRLU4SdsR+s8ujbV A==;
X-CSE-ConnectionGUID: BNSy9hn1Q6+jj89R3xp4cw==
X-CSE-MsgGUID: cJNBV3W5SNaXhXSGlaM/+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90063708"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="90063708"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 23:55:14 -0700
X-CSE-ConnectionGUID: fGK4G4ikQNaJPLZoSyyE9Q==
X-CSE-MsgGUID: SXhiLkOeQLKBrmhuQgSxxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="231677315"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.175])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 23:55:12 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/xe_gpgpu_fill: Add subtest with 4x4
 position for XE3P
Date: Wed,  6 May 2026 08:55:03 +0200
Message-ID: <20260506065500.162563-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506065500.162563-4-zbigniew.kempczynski@intel.com>
References: <20260506065500.162563-4-zbigniew.kempczynski@intel.com>
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

Gpgpu pipeline for XE3P allows passing x which is multiplied of 4
(y may be incremented by 1). Exercise this is working properly
on platforms like NVLP and CRI.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_gpgpu_fill.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel/xe_gpgpu_fill.c b/tests/intel/xe_gpgpu_fill.c
index ce6222ddd7..9ab8b51e78 100644
--- a/tests/intel/xe_gpgpu_fill.c
+++ b/tests/intel/xe_gpgpu_fill.c
@@ -91,6 +91,8 @@ static void buf_check(uint8_t *ptr, int width, int x, int y, uint8_t color)
  * SUBTEST: offset-16x16
  * Description: run gpgpu fill with <x,y> start position == <16,16>
  *
+ * SUBTEST: offset-4x4
+ * Description: run gpgpu fillwith <x,y> start position == <4,4>
  */
 
 static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region,
@@ -201,6 +203,15 @@ int igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
 			   surfheight / 2);
 	}
 
+	igt_subtest("offset-4x4") {
+		igt_require(intel_graphics_ver(data.devid) >= IP_VER(35, 0));
+		gpgpu_fill(&data, fill_fn, 0,
+			   surfwidth, surfheight,
+			   4, 4,
+			   surfwidth / 2,
+			   surfheight / 2);
+	}
+
 	igt_fixture() {
 		buf_ops_destroy(data.bops);
 		drm_close_driver(data.drm_fd);
-- 
2.43.0

