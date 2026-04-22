Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5E9FA1FE8
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 19:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D3510E2D5;
	Wed, 22 Apr 2026 19:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0CHkS9G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DF610E242
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 19:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776885582; x=1808421582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ox2k2jXNpeNAHB0YZzAqxIOwJRGdQxzSOTR1PNLkv/M=;
 b=M0CHkS9G3JX3Xrjq4M2gU4y1vRTzXJh7I4NnSR+cT+gW3/zQwB2lbzd7
 qsgi/W6bNLlosX8M4s6IZpYOujKLH1n3KdS2lxLv0KtMTuMKTm4DIs2hN
 ixRsrFZIWmkBYqBmg6Sg90/WN/dws+ua+L6rLkQbLwXDvF1epcLuip9Lz
 OJTN3SamVcxphO3E4Cj6mfnHQBDsFObFuIEN2RdCuKA14DfhYObU/mvoL
 tg7tNo1TFlLlCzTU7KzWpUy+AzjsfHVYAmkkIh/ekH0SDIVPILPtRVRHv
 kFpDoXjZl+ce4hZ2xfN1KtccTLfR171Q4VjbpRpR1/D8scWozcLCUGMe/ Q==;
X-CSE-ConnectionGUID: Uzl/NTqoS76PGNDVOz3jtQ==
X-CSE-MsgGUID: xUtmT6hQQuWw1wVYoLpqzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="76879926"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="76879926"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 12:19:42 -0700
X-CSE-ConnectionGUID: hxF25z/IT9y5bqCRfOe18g==
X-CSE-MsgGUID: mJQJWV7kRo+jmuLx3s2Kew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="229773057"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.47])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 12:19:41 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t 2/2] tests/xe_gpgpu_fill: Add subtest with 4x4 position
 for XE3P
Date: Wed, 22 Apr 2026 21:19:25 +0200
Message-ID: <20260422191922.274036-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422191922.274036-4-zbigniew.kempczynski@intel.com>
References: <20260422191922.274036-4-zbigniew.kempczynski@intel.com>
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

