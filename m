Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69F1D637A7
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 12:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C3D10E2A1;
	Thu, 14 Nov 2024 12:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndq4+AwK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D449410E7EB
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 12:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731585997; x=1763121997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MwnsSCtnDJyNzyq1zYBFv576pYAmFhDgAvb1uZYxfLk=;
 b=ndq4+AwK/g/2l5HaMF400CUZDOnhLO7txi/Qua3oQrpmr1Z7GQW1rVEj
 qVIiyWaYVCObt7MVm/SjioBVu7IjIBvoWR/WKRL+mF5DTxb7HUAEe7h//
 bEpHd+GOiXAM56h9iMRtaCMH/CV+rCBY+jUIX3mtNMprdjmRx6uqDMU89
 PxYBTJxGh+hqBtQKTgGyCfg0rpdozE5MaVtUo8Ut6HkDzI3Yz3jb1m6lW
 xlpNpz0SwCDv/0dM0mtDmY+6BTM/uvj0m9+sKZd2frTd2h2vVBx02eKuG
 IgPw+hCtqJ3zhkurH9VjhIGcRTlyjdNsgUhvdfiyUJwEvzKgnEYzA+sXx g==;
X-CSE-ConnectionGUID: e3NOltV4Svq80uIvYs73Ww==
X-CSE-MsgGUID: 8zpbV60DT6GejYNj2bLsFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="19129895"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="19129895"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 04:06:37 -0800
X-CSE-ConnectionGUID: j0ZpWkmIR9S5r4PhPr49eQ==
X-CSE-MsgGUID: 55WX6EmLQU6iWmukfyewFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="87737979"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 04:06:35 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 3/3] tests/xe_gpgpu_fill: Add offset-16x16 subtest
Date: Thu, 14 Nov 2024 13:06:16 +0100
Message-Id: <20241114120616.70229-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114120616.70229-1-zbigniew.kempczynski@intel.com>
References: <20241114120616.70229-1-zbigniew.kempczynski@intel.com>
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

Add subtest which verifies rectangle filled by pattern starts at
offset <x,y> == <16,16>.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_gpgpu_fill.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_gpgpu_fill.c b/tests/intel/xe_gpgpu_fill.c
index 82625bb7c0..e1ecff8233 100644
--- a/tests/intel/xe_gpgpu_fill.c
+++ b/tests/intel/xe_gpgpu_fill.c
@@ -87,6 +87,10 @@ static void buf_check(uint8_t *ptr, int width, int x, int y, uint8_t color)
 /**
  * SUBTEST: basic
  * Description: run gpgpu fill
+ *
+ * SUBTEST: offset-16x16
+ * Description: run gpgpu fill with <x,y> start position == <16,16>
+ *
  */
 
 static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region,
@@ -189,6 +193,14 @@ igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
 			   surfheight / 2);
 	}
 
+	igt_subtest("offset-16x16") {
+		gpgpu_fill(&data, fill_fn, 0,
+			   surfwidth, surfheight,
+			   16, 16,
+			   surfwidth / 2,
+			   surfheight / 2);
+	}
+
 	igt_fixture {
 		buf_ops_destroy(data.bops);
 		drm_close_driver(data.drm_fd);
-- 
2.34.1

